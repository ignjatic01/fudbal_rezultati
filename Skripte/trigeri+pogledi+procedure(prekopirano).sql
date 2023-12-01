-- -----------------------------------------------------------------------------------
--	TRIGERI
-- -----------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------

-- Triger za provjeru uslova prilikom unosa gola (Identicni se koriste za BEFORE_UPDATE)

CREATE DEFINER=`root`@`localhost` TRIGGER `gol_BEFORE_INSERT` BEFORE INSERT ON `gol` FOR EACH ROW BEGIN
  declare karton_minut int;
  declare izmjena_minut int;
  declare izmjena_ulaz_minut int;
  
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);

  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  select minut into izmjena_ulaz_minut
  from izmjena
  where idIgracUlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) or
    (izmjena_ulaz_minut is not null and new.minut <= izmjena_ulaz_minut)then
      signal sqlstate '45000'
      set message_text = 'Igrac van igre ne moze postici gol';
  end if;
END

-- -----------------------------------------------------------------------------------

-- Triger za inkrementovanje broja golova u tabeli utakmica nakon unosa gola

CREATE DEFINER=`root`@`localhost` TRIGGER `inkrement_golova` AFTER INSERT ON `gol` FOR EACH ROW BEGIN
  declare golDomaci int;
  declare golGosti int;
  
  select goloviDomaci into golDomaci
  from utakmica
  where idUtakmica = new.idUtakmica;

  select goloviGosti into golGosti
  from utakmica
  where idUtakmica = new.idUtakmica;

  if new.idKlub = (select idDomaci from utakmica where idUtakmica = new.idUtakmica) then
    update utakmica set goloviDomaci = golDomaci + 1 where idUtakmica = new.idUtakmica;
  else
    update utakmica set goloviGosti = golGosti + 1 where idUtakmica = new.idUtakmica;
  end if;
END

-- -----------------------------------------------------------------------------------

-- Triger za dekrementovanje golova nakon brisanja gola

CREATE DEFINER=`root`@`localhost` TRIGGER `dekrement_golova` AFTER DELETE ON `gol` FOR EACH ROW BEGIN
  declare golDomaci int;
  declare golGosti int;

  select goloviDomaci into golDomaci
  from utakmica
  where idUtakmica = old.idUtakmica;

  select goloviGosti into golGosti
  from utakmica
  where idUtakmica = old.idUtakmica;

  if old.idKlub = (select idDomaci from utakmica where idUtakmica = old.idUtakmica) then
    update utakmica set goloviDomaci = golDomaci - 1 where idUtakmica = old.idUtakmica;
  else
    update utakmica set goloviGosti = golGosti - 1 where idUtakmica = old.idUtakmica;
  end if;
END

-- -----------------------------------------------------------------------------------

-- Provjera prilikom unosenja igraca u protokol (da li je vec unesen, ima li crveni karton, itd)

CREATE DEFINER=`root`@`localhost` TRIGGER `ogranicenje_igraca` BEFORE INSERT ON `igrac_na_utakmici` FOR EACH ROW begin
  declare prisutan int;
  declare klub_id int;
  declare broj_igraca int;
  declare id_domaci int;
  declare id_gosti int;
  declare broj_golmana_domaci int;
  declare broj_golmana_gosti int;
  declare pozicija varchar(5);
  
  select idKlub into klub_id from igrac where idIgrac = new.idIgrac;
  select count(*) into broj_igraca from igrac_na_utakmici where idUtakmica = new.idUtakmica and idIgrac in (select idIgrac from igrac where idKlub = klub_id) and uIgri = 1;
  if (broj_igraca >= 11 and new.uIgri <> 0) then
    signal sqlstate '45000'
    set MESSAGE_TEXT = 'Ograničenje: Maksimalno 11 igrača iz istog kluba može u jednom trenutku igrati na utakmici.';
  end if;
  
  select idDomaci into id_domaci from utakmica u where new.idUtakmica = u.idUtakmica;
  select idGosti into id_gosti from utakmica u where new.idUtakmica = u.idUtakmica;
  if(id_domaci <> klub_id) and (id_gosti <> klub_id) then
	signal sqlstate '45000'
    set MESSAGE_TEXT = 'Igrac nije registrovan ni u jednom od klubova';
  end if;
  
  select count(*) into broj_golmana_domaci from fudbal_rezultati.igrac_na_utakmici where uIgri = 1 and idUtakmica = new.idUtakmica
  and idIgrac in (select idIgrac from fudbal_rezultati.igrac where idKlub = id_domaci and oznakaPozicije = 'GK');
  
  select count(*) into broj_golmana_gosti from fudbal_rezultati.igrac_na_utakmici where uIgri = 1 and idUtakmica = new.idUtakmica
  and idIgrac in (select idIgrac from fudbal_rezultati.igrac where idKlub = id_gosti and oznakaPozicije = 'GK');
  
  select oznakaPozicije into pozicija from igrac where idIgrac = new.idIgrac;
  if(pozicija = 'GK' and broj_golmana_domaci > 0 and new.uIgri = 1 and klub_id = id_domaci) or 
  (pozicija = 'GK' and broj_golmana_gosti > 0 and new.uIgri = 1 and klub_id = id_gosti) then
    signal sqlstate '45000'
    set message_text = 'Ne moze igrati vise od jednog golmana!';
  end if;
end

-- -----------------------------------------------------------------------------------

-- Provjera svih uslova prije unosenja izmjene (Slicno prethodnom triggeru)

CREATE DEFINER=`root`@`localhost` TRIGGER `izmjena_BEFORE_INSERT` BEFORE INSERT ON `izmjena` FOR EACH ROW BEGIN
  declare igrac_ulaz_igri int;
  declare igrac_izlaz_igri int;
  declare klub_ulaz int;
  declare klub_izlaz int;
  declare karton_minut_izlaz int;
  declare karton_minut_ulaz int;  
  declare izmjena_minut int;
  declare izmjena_izlaz_count int;
  declare izmjena_ulaz_count int;
  
  select minut into karton_minut_izlaz
  from karton
  where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select minut into karton_minut_ulaz
  from karton
  where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select minut into izmjena_minut
  from izmjena
  where idIgracUlazi = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
  
  select count(*) into izmjena_izlaz_count
  from izmjena
  where (idIgracIzlazi = new.idIgracUlazi or idIgracIzlazi = new.idIgracIzlazi) and idUtakmica = new.idUtakmica;
  
  select count(*) into izmjena_ulaz_count
  from izmjena
  where (idIgracUlazi = new.idIgracUlazi or idIgracUlazi = new.idIgracIzlazi) and idUtakmica = new.idUtakmica;

  select uIgri into igrac_ulaz_igri from igrac_na_utakmici where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
  select uIgri into igrac_izlaz_igri from igrac_na_utakmici where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;

  select idKlub into klub_ulaz from igrac where idIgrac = new.idIgracUlazi;
  select idKlub into klub_izlaz from igrac where idIgrac = new.idIgracIzlazi;
  
  if (igrac_ulaz_igri is null or igrac_izlaz_igri is null or klub_ulaz <> klub_izlaz) or
  (karton_minut_izlaz is not null and new.minut >= karton_minut_izlaz) or (izmjena_izlaz_count > 0)
  or (karton_minut_ulaz is not null and new.minut >= karton_minut_ulaz)
  or (izmjena_ulaz_count > 0) or (izmjena_minut is not null and new.minut <= izmjena_minut) then
    signal sqlstate '45000'
    set message_text = 'Neispravni podaci za izmjenu igraca.';
  end if;
  
  if (igrac_ulaz_igri = 1) or (igrac_izlaz_igri = 0) then
    signal sqlstate '45000'
    set message_text = 'Igrac koji ulazi je vec u igri ili igrac koji izlazi je van igre.';
  end if;
END

-- -----------------------------------------------------------------------------------

-- Triger za modifikaciju tabele igrac_na_utakmici (modifikovanje kolone uIgri za igraca koji ulazi/izlazi)

CREATE DEFINER=`root`@`localhost` TRIGGER `izmjena_AFTER_INSERT` AFTER INSERT ON `izmjena` FOR EACH ROW BEGIN
    
    -- call fudbal_rezultati.UpdateIgracNaUtakmici(new.idIgracIzlazi, new.idUtakmica);
    -- insert into igrac_na_utakmici (idIgrac, idUtakmica, uIgri) values (new.idIgracUlazi, new.idUtakmica, 1);
	update igrac_na_utakmici
	set uIgri = 0
    where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
    
	update igrac_na_utakmici
	set uIgri = 1
    where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
END

-- -----------------------------------------------------------------------------------

-- Vracanje na staro stanje nakon brisanja izmjene

CREATE DEFINER=`root`@`localhost` TRIGGER `izmjena_AFTER_DELETE` AFTER DELETE ON `izmjena` FOR EACH ROW BEGIN
	
    -- DELETE FROM fudbal_rezultati.igrac_na_utakmici
	-- WHERE idIgrac = old.idIgracUlazi AND idUtakmica = old.idUtakmica;
	
	update igrac_na_utakmici
	set uIgri = 0
    where idIgrac = old.idIgracUlazi and idUtakmica = old.idUtakmica;
    
    update igrac_na_utakmici
	set uIgri = 1
    where idIgrac = old.idIgracIzlazi and idUtakmica = old.idUtakmica;
END

-- -----------------------------------------------------------------------------------

-- Provjera uslova za unos kartona

CREATE DEFINER=`root`@`localhost` TRIGGER `karton_BEFORE_INSERT` BEFORE INSERT ON `karton` FOR EACH ROW BEGIN
  declare karton_minut int;
  declare izmjena_minut int;
  declare izmjena_ulaz_minut int;
  declare broj_zutih_kartona int;
  
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idIgrac and idUtakmica = new.idUtakmica;

  select minut into izmjena_ulaz_minut
  from izmjena
  where idIgracUlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  select count(*) into broj_zutih_kartona
  from karton
  where idKarton_tip = 1 and idIgrac = new.idIgrac and idUtakmica = new.idUtakmica;
  
  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) or
    (izmjena_ulaz_minut is not null and new.minut <= izmjena_ulaz_minut) then
      signal sqlstate '45000'
      set message_text = 'Igrac nije u igri';
  end if;
  
  if broj_zutih_kartona > 0 and new.idKarton_tip = 1 then
	  signal sqlstate '45000'
      set message_text = 'Igrac ne moze dobiti vise od jednog zutog kartona bez da dobije crveni';
  end if;
END

-- -----------------------------------------------------------------------------------

-- Iskljucivanje igraca iz igre ako dobije crveni karton

CREATE DEFINER=`root`@`localhost` TRIGGER `karton_AFTER_INSERT` AFTER INSERT ON `karton` FOR EACH ROW BEGIN
  if new.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 0
    where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica;
  end if;
END

-- -----------------------------------------------------------------------------------

-- Povratak na staro nakon brisanja

CREATE DEFINER=`root`@`localhost` TRIGGER `karton_AFTER_DELETE` AFTER DELETE ON `karton` FOR EACH ROW BEGIN
  if old.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 1
    where idIgrac = old.idIgrac and idUtakmica = old.idUtakmica;
  end if;
END

-- -----------------------------------------------------------------------------------

-- Provjera validnosti podataka prije unosa odbrane

CREATE DEFINER=`root`@`localhost` TRIGGER `odbrana_BEFORE_INSERT` BEFORE INSERT ON `odbrana` FOR EACH ROW BEGIN
  declare karton_minut int;
  declare izmjena_minut int;
  declare izmjena_ulaz_minut int;
  declare pozicija varchar(5);
  
  select minut into karton_minut
  from karton
  where idIgrac = new.idGolman and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idGolman and idUtakmica = new.idUtakmica;
  
  select minut into izmjena_ulaz_minut
  from izmjena
  where idIgracUlazi = new.idGolman and idUtakmica = new.idUtakmica;
  
  select oznakaPozicije into pozicija
  from igrac
  where idIgrac = new.idGolman;
  
  if(strcmp(pozicija, 'GK')) then
	signal sqlstate '45000'
    set message_text = 'Igrac mora biti golman da bi upisao odbranu';
  end if;

  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) or
    (izmjena_ulaz_minut is not null and new.minut <= izmjena_ulaz_minut) then
    signal sqlstate '45000'
    set message_text = 'Golman van igre ne moze upisati odbranu';
  end if;
END

-- -----------------------------------------------------------------------------------

-- Provjera podataka prije unosa utakmice

CREATE DEFINER=`root`@`localhost` TRIGGER `utakmica_BEFORE_INSERT` BEFORE INSERT ON `utakmica` FOR EACH ROW BEGIN
  declare kolo_num int;
  declare liga_domaci int;
  declare liga_gosti int;
  
  select count(*) into liga_domaci from clan c where c.idKlub = new.idDomaci and c.idLiga = new.idLiga; 
  select count(*) into liga_gosti from clan c where c.idKlub = new.idGosti and c.idLiga = new.idLiga;
  
  select count(*) into kolo_num from utakmica u where u.kolo = new.kolo and (u.idDomaci = new.idDomaci or 
  u.idGosti = new.idDomaci or u.idDomaci = new.idGosti or u.idGosti = new.idDomaci) and new.idLiga = u.idLiga;
  
  if kolo_num > 0 then
	signal sqlstate '45000'
    set MESSAGE_TEXT = 'Jedan klub ne moze vise puta igrati isto kolo unutar lige!';
  end if;
  
  if(liga_domaci = 0 or liga_gosti = 0) then
  	signal sqlstate '45000'
    set MESSAGE_TEXT = 'Klubovi nisu clanovi iste lige!';
  end if;
END

-- -----------------------------------------------------------------------------------
-- 	POGLEDI
-- -----------------------------------------------------------------------------------

-- Prikaz klubova i liga ciji su clanovi

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`clan_prikaz` AS
    SELECT 
        `k`.`nazivKluba` AS `Klub`,
        GROUP_CONCAT(`l`.`nazivLige`
            SEPARATOR ',') AS `Liga`
    FROM
        ((`fudbal_rezultati`.`clan` `c`
        JOIN `fudbal_rezultati`.`klub` `k` ON ((`k`.`idKlub` = `c`.`idKlub`)))
        JOIN `fudbal_rezultati`.`liga` `l` ON ((`l`.`idLiga` = `c`.`idLiga`)))
    GROUP BY `Klub`
-- -----------------------------------------------------------------------------------

-- Prikaz igraca u protokolu

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`igrac_na_utakmici_prikaz` AS
    SELECT 
        `inu`.`idIgrac` AS `idIgrac`,
        `i`.`ime` AS `ime`,
        `i`.`prezime` AS `prezime`,
        `i`.`brojDresa` AS `brojDresa`,
        `i`.`oznakaPozicije` AS `oznakaPozicije`,
        `i`.`idKlub` AS `idKlub`,
        `inu`.`idUtakmica` AS `idUtakmica`,
        `inu`.`uIgri` AS `uIgri`
    FROM
        (`fudbal_rezultati`.`igrac_na_utakmici` `inu`
        LEFT JOIN `fudbal_rezultati`.`igrac` `i` ON ((`i`.`idIgrac` = `inu`.`idIgrac`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz igraca

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`igraci_prikaz` AS
    SELECT 
        `i`.`ime` AS `Ime`,
        `i`.`prezime` AS `Prezime`,
        `i`.`brojDresa` AS `BrojDresa`,
        `i`.`godine` AS `Godine`,
        `k`.`nazivKluba` AS `Klub`,
        `d`.`drzava` AS `Drzava`,
        `p`.`nazivPozicije` AS `Pozicija`,
        `i`.`visina` AS `Visina`
    FROM
        (((`fudbal_rezultati`.`igrac` `i`
        LEFT JOIN `fudbal_rezultati`.`klub` `k` ON ((`k`.`idKlub` = `i`.`idKlub`)))
        LEFT JOIN `fudbal_rezultati`.`drzava` `d` ON ((`d`.`idDrzava` = `i`.`idDrzava`)))
        LEFT JOIN `fudbal_rezultati`.`pozicija` `p` ON ((`p`.`oznakaPozicije` = `i`.`oznakaPozicije`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz kartona

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`kartoni_prikaz` (`TipKartona` , `Igrac` , `Razlog`) AS
    SELECT 
        `kt`.`tip` AS `tip`,
        CONCAT(`i`.`ime`, ' ', `i`.`prezime`) AS `concat(i.ime, ' ', i.prezime)`,
        `kar`.`razlog` AS `razlog`
    FROM
        ((`fudbal_rezultati`.`karton` `kar`
        JOIN `fudbal_rezultati`.`karton_tip` `kt` ON ((`kt`.`idKarton_tip` = `kar`.`idKarton_tip`)))
        LEFT JOIN `fudbal_rezultati`.`igrac` `i` ON ((`i`.`idIgrac` = `kar`.`idIgrac`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz klubova

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`klub_prikaz` AS
    SELECT 
        `k`.`nazivKluba` AS `Klub`,
        `k`.`grad` AS `Grad`,
        `b`.`naziv` AS `Boja`,
        `b`.`primarnaBoja` AS `Primarna`,
        `b`.`sekundarnaBoja` AS `Sekundarna`
    FROM
        (`fudbal_rezultati`.`klub` `k`
        JOIN `fudbal_rezultati`.`boja` `b` ON ((`b`.`idBoja` = `k`.`idBoja`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz Liga

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`liga_prikaz` AS
    SELECT 
        `l`.`idLiga` AS `idLiga`,
        `l`.`idDrzava` AS `idDrzava`,
        `l`.`idKategorija` AS `idKategorija`,
        `l`.`nazivLige` AS `Liga`,
        `d`.`drzava` AS `Drzava`,
        `l`.`datumPocetka` AS `datumPocetka`,
        `l`.`datumKraja` AS `datumKraja`,
        CONCAT(`k`.`starosnaKategorija`,
                ' ',
                `k`.`nivoTakmicenja`,
                ' rang') AS `Kategorija`
    FROM
        ((`fudbal_rezultati`.`liga` `l`
        LEFT JOIN `fudbal_rezultati`.`drzava` `d` ON ((`d`.`idDrzava` = `l`.`idDrzava`)))
        LEFT JOIN `fudbal_rezultati`.`kategorija` `k` ON ((`k`.`idKategorija` = `l`.`idKategorija`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz Stadiona

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`stadion_prikaz` AS
    SELECT 
        `s`.`idStadion` AS `idStadion`,
        `s`.`naziv` AS `naziv`,
        `s`.`grad` AS `grad`,
        `s`.`kapacitet` AS `kapacitet`,
        `s`.`idVrsta_podloge` AS `idVrsta_podloge`,
        `vp`.`naziv` AS `podloga`
    FROM
        (`fudbal_rezultati`.`stadion` `s`
        JOIN `fudbal_rezultati`.`vrsta_podloge` `vp` ON ((`vp`.`idVrsta_podloge` = `s`.`idVrsta_podloge`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz trenera

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`treneri_prikaz` AS
    SELECT 
        `t`.`ime` AS `Ime`,
        `t`.`prezime` AS `Prezime`,
        `d`.`drzava` AS `Drzava`,
        `k`.`nazivKluba` AS `Klub`
    FROM
        ((`fudbal_rezultati`.`trener` `t`
        LEFT JOIN `fudbal_rezultati`.`drzava` `d` ON ((`t`.`idDrzava` = `d`.`idDrzava`)))
        LEFT JOIN `fudbal_rezultati`.`klub` `k` ON ((`t`.`idKlub` = `k`.`idKlub`)))
        
-- -----------------------------------------------------------------------------------

-- Prikaz utakmica

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `fudbal_rezultati`.`utakmice_prikaz` AS
    SELECT 
        `u`.`idUtakmica` AS `idUtakmica`,
        `u`.`idDomaci` AS `idDomaci`,
        `u`.`idGosti` AS `idGosti`,
        `u`.`idStadion` AS `idStadion`,
        `u`.`datum` AS `datum`,
        `u`.`vrijeme` AS `vrijeme`,
        `u`.`goloviDomaci` AS `goloviDomaci`,
        `u`.`goloviGosti` AS `goloviGosti`,
        `u`.`idLiga` AS `idLiga`,
        `u`.`kolo` AS `kolo`,
        `kd`.`nazivKluba` AS `domaciKlub`,
        `kg`.`nazivKluba` AS `gostiKlub`,
        `s`.`naziv` AS `stadion`,
        `l`.`nazivLige` AS `liga`
    FROM
        ((((`fudbal_rezultati`.`utakmica` `u`
        LEFT JOIN `fudbal_rezultati`.`klub` `kd` ON ((`kd`.`idKlub` = `u`.`idDomaci`)))
        LEFT JOIN `fudbal_rezultati`.`klub` `kg` ON ((`kg`.`idKlub` = `u`.`idGosti`)))
        LEFT JOIN `fudbal_rezultati`.`stadion` `s` ON ((`u`.`idStadion` = `s`.`idStadion`)))
        LEFT JOIN `fudbal_rezultati`.`liga` `l` ON ((`l`.`idLiga` = `u`.`idLiga`)))
        
-- -----------------------------------------------------------------------------------
-- 	PROCEDURE
-- -----------------------------------------------------------------------------------

-- Prikaz detaljne tabele neke lige

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziStatistikuKluba`(in liga_id int)
begin
  select
    k.nazivKluba as Klub,
    k.grad as Grad,
    count(distinct u.idUtakmica) as BrojUtakmica,
    sum(case when u.goloviDomaci = u.goloviGosti then 1 else 0 end) as BrojNerjesenih,
    sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci) then 1 else 0 end) as BrojPobjeda,
    sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci < u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti < u.goloviDomaci) then 1 else 0 end) as BrojIzgubljenih,
    sum(case when u.idDomaci = k.idKlub then u.goloviDomaci else u.goloviGosti end) as BrojPostignutihGolova,
    sum(case when u.idGosti = k.idKlub then u.goloviDomaci else u.goloviGosti end) as BrojPrimljenihGolova,
    sum(case when u.idDomaci = k.idKlub then u.goloviDomaci else u.goloviGosti end) -
    sum(case when u.idGosti = k.idKlub then u.goloviDomaci else u.goloviGosti end) as GolRazlika,
    (sum(case when (u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti) or (u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci) then 3 else 0 end) +
    sum(case when u.goloviDomaci = u.goloviGosti then 1 else 0 end)) as BrojBodova
  from
    fudbal_rezultati.klub k
    join fudbal_rezultati.clan c on k.idKlub = c.idKlub
    left join fudbal_rezultati.utakmica u on (k.idKlub = u.idDomaci or k.idKlub = u.idGosti) and liga_id = u.idLiga
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc, GolRazlika desc, BrojUtakmica desc, BrojPostignutihGolova desc;
end

-- -----------------------------------------------------------------------------------

-- Prikaz skracene tabele (bez dodatne statistike)

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziTabeluBodova`(in liga_id int)
begin
  select
    k.nazivKluba as Klub,
    k.grad as Grad,
    sum(
      case
        when u.goloviDomaci = u.goloviGosti and (u.idDomaci = k.idKlub or u.idGosti = k.idKlub) then 1  -- Neriješeno, 1 bod
        when u.idDomaci = k.idKlub and u.goloviDomaci > u.goloviGosti then 3  -- Pobjeda domaćina, 3 boda
        when u.idGosti = k.idKlub and u.goloviGosti > u.goloviDomaci then 3  -- Pobjeda gosta, 3 boda
        else 0  -- Poraz, 0 bodova
      end
    ) as BrojBodova,
    count(distinct u.idUtakmica) as BrojUtakmica
  from
    fudbal_rezultati.klub k
    join fudbal_rezultati.clan c on k.idKlub = c.idKlub
    left join fudbal_rezultati.utakmica u on (k.idKlub = u.idDomaci or k.idKlub = u.idGosti) and liga_id = u.idLiga
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc;
end

-- -----------------------------------------------------------------------------------

-- Prikaz svih utakmica istog kola unutar jedne lige

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikaziUtakmiceKola`(in liga_id int, in kolo int)
BEGIN
  select 
    u.idUtakmica AS idUtakmica,
	u.idDomaci AS idDomaci,
	u.idGosti AS idGosti,
	u.idStadion AS idStadion,
	u.datum AS datum,
	u.vrijeme AS vrijeme,
	u.goloviDomaci AS goloviDomaci,
	u.goloviGosti AS goloviGosti,
	u.idLiga AS idLiga,
	u.kolo AS kolo,
	kd.nazivKluba AS domaciKlub,
	kg.nazivKluba AS gostiKlub,
	s.naziv AS stadion,
	l.nazivLige AS liga
  from
    fudbal_rezultati.utakmica u
    left join fudbal_rezultati.klub kd on kd.idKlub = u.idDomaci
    left join fudbal_rezultati.klub kg on kg.idKlub = u.idGosti
    left join stadion s on s.idStadion = u.idStadion
    left join fudbal_rezultati.liga l on l.idLiga = u.idLiga
  where
    u.idLiga = liga_id and u.kolo = kolo
  order by
    datum asc, vrijeme asc;
END

-- -----------------------------------------------------------------------------------

-- Prikaz pojedinacne statistike golmana na nivou lige

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeGolmanaLiga`(in liga_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
	(select count(*) from fudbal_rezultati.igrac_na_utakmici inu left join utakmica u on u.idUtakmica = inu.idUtakmica
    where inu.idIgrac = i.idIgrac and inu.uIgri = 1 and u.idLiga = liga_id) + 
    (select count(*) from fudbal_rezultati.izmjena iz left join utakmica u on u.idUtakmica = iz.idUtakmica 
    where iz.idIgracIzlazi = i.idIgrac and u.idLiga = liga_id) as BrojUtakmica,
	(select count(*) from fudbal_rezultati.gol g join utakmica u on g.idUtakmica = u.idUtakmica
    where i.idIgrac in (select idIgrac from fudbal_rezultati.igrac_na_utakmici inu where g.idUtakmica = inu.idUtakmica and inu.uIgri = 1) and
    u.idLiga = liga_id and i.idIgrac not in (select idIgrac from fudbal_rezultati.igrac ii where ii.idKlub = g.idKlub)) as BrojPrimljenihGolova,
    (select count(*) from fudbal_rezultati.odbrana o left join utakmica u on o.idUtakmica = u.idUtakmica
    where o.idGolman = i.idIgrac and u.idLiga = liga_id) as BrojOdbrana,
    (select count(*) from fudbal_rezultati.karton kar left join utakmica u on u.idUtakmica = kar.idUtakmica
    where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1 and u.idLiga = liga_id) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar left join utakmica u on u.idUtakmica = kar.idUtakmica
    where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3) and u.idLiga = liga_id) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    -- join fudbal_rezultati.odbrana o on i.idIgrac = o.idGolman
  where
    liga_id = c.idLiga and i.oznakaPozicije = 'GK'
  order by
    BrojOdbrana desc;
END

-- -----------------------------------------------------------------------------------

-- Prikaz statistike svih igraca unutar kluba

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeKlub`(in klub_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac and inu.uIgri = 1) + 
    (select count(*) from fudbal_rezultati.izmjena iz where iz.idIgracIzlazi = i.idIgrac) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.gol g where g.idIgrac = i.idIgrac) as BrojGolova,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
	join fudbal_rezultati.pozicija p on i.oznakaPozicije = p.oznakaPozicije
  where
    klub_id = i.idKlub
  order by
    BrojGolova desc;
END

-- -----------------------------------------------------------------------------------

-- Prikaz statistike svih igraca na nivou lige

CREATE DEFINER=`root`@`localhost` PROCEDURE `PrikazStatistikeLiga`(in liga_id int)
BEGIN
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu left join utakmica u on u.idUtakmica = inu.idUtakmica
    where inu.idIgrac = i.idIgrac and inu.uIgri = 1 and u.idLiga = liga_id) + 
    (select count(*) from fudbal_rezultati.izmjena iz left join utakmica u on u.idUtakmica = iz.idUtakmica 
    where iz.idIgracIzlazi = i.idIgrac and u.idLiga = liga_id) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.gol g left join utakmica u on g.idUtakmica = u.idUtakmica
    where g.idIgrac = i.idIgrac and u.idLiga = liga_id) as BrojGolova,
    (select count(*) from fudbal_rezultati.karton kar left join utakmica u on u.idUtakmica = kar.idUtakmica
    where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1 and u.idLiga = liga_id) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar left join utakmica u on kar.idUtakmica = u.idUtakmica
    where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3) and u.idLiga = liga_id) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    join fudbal_rezultati.pozicija p on i.oznakaPozicije = p.oznakaPozicije
  where
    liga_id = c.idLiga
  order by
    BrojGolova desc;
END

-- -----------------------------------------------------------------------------------

-- Iskljucivanje igraca sa utakmice

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateIgracNaUtakmici`(in igrac_id int, in utakmica_id int)
BEGIN
  update igrac_na_utakmici
  set uIgri = 0
  where idIgrac = igrac_id and idUtakmica = utakmica_id;
END

-- -----------------------------------------------------------------------------------
-- 	PRIVILEGIJE
-- -----------------------------------------------------------------------------------

create user 'student'@'localhost' identified by 'mysql#356A';
grant select,insert,update,delete on fudbal_rezultati.* to 'student'@'localhost';
grant all privileges on fudbal_rezultati.* to 'student'@'localhost';
