DELIMITER //
use fudbal_rezultati;
create trigger ogranicenje_igraca
before insert on igrac_na_utakmici
for each row
begin
  declare klub_id int;
  declare broj_igraca int;
  select idKlub into klub_id from igrac where idIgrac = new.idIgrac;
  select count(*) into broj_igraca from igrac_na_utakmici where idUtakmica = new.idUtakmica and idIgrac in (select idIgrac from igrac where idKlub = klub_id);
  if broj_igraca >= 11 then
    signal sqlstate '45000'
    set MESSAGE_TEXT = 'Ograničenje: Maksimalno 11 igrača iz istog kluba može u jednom trenutku igrati na utakmici.';
  end if;
end;
//
DELIMITER ;


--triger da igrac ne moze biti i na utakmici i na klupi
DELIMITER $$
create trigger ogranicenje_igraca_klupa
before insert on fudbal_rezultati.igrac_na_klupi
for each row
begin
  declare prisutan int;
  select count(*) into prisutan from igrac_na_utakmici where idUtakmica = NEW.idUtakmica and idIgrac = NEW.idIgrac;
  if prisutan > 0 then
    signal sqlstate '45000'
    set message_text = 'Ograničenje: Igrač već prisutan na utakmici u starnoj postavi!';
  end if;
end;
$$
DELIMITER ;

-- triger za azuriranje broja golova na utakmici (kad se gol upise)

delimiter $$

create trigger triger_inkrementuj_golove
after insert on gol
for each row
begin
  declare golDomaci int;
  declare golGosti int;
  
  select goloviDomaci into golDomaci
  from utakmica
  where idUtakmica = new.idUtakmica;

  select goloviGosti into golGosti
  from utakmica
  where idUtakmica = new.idUtakmica;

  if new.idKlub = utakmica.idDomaci then
    update utakmica set goloviDomaci = golDomaci + 1 where idUtakmica = new.idUtakmica;
  else
    update utakmica set goloviGosti = golGosti + 1 where idUtakmica = new.idUtakmica;
  end if;
end $$

delimiter ;

-- triger za azuriranje broja golova na utakmici (kad se gol izbrise)


delimiter $$

create trigger triger_dekrementuj_golove
after delete on gol
for each row
begin
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
end $$

delimiter ;

-- procedura za prikaz tabele
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
    left join fudbal_rezultati.utakmica u on k.idKlub = u.idDomaci or k.idKlub = u.idGosti
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc;
end

--procedura za detaljan prikaz statistike kluba
delimiter $$

create procedure PrikaziStatistikuKluba(in liga_id int)
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
    left join fudbal_rezultati.utakmica u on k.idKlub = u.idDomaci or k.idKlub = u.idGosti
  where
    c.idLiga = liga_id
  group by
    k.idKlub, k.nazivKluba, k.grad
  order by
    BrojBodova desc, GolRazlika desc, BrojUtakmica desc, BrojPostignutihGolova desc;
end $$

delimiter ;

-- Iskljucivanje igraca nakon kartona

delimiter $$

create trigger after_insert_karton
after insert on karton
for each row
begin
  if new.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 0
    where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica;
  end if;
end $$

delimiter ;

-- Provjera da li igrac ima crveni karton prije unosa gola (slicno je za odbranu i novi karton)
delimiter $$

create trigger before_insert_gol
before insert on gol
for each row
begin
  declare karton_minut int;
  declare izmjena_minut int;
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgrac and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);

  select minut into izmjena_minut
  from izmjena
  where idIgracIzlazi = new.idIgrac and idUtakmica = new.idUtakmica;
  
  if (karton_minut is not null and new.minut >= karton_minut) or 
    (izmjena_minut is not null and new.minut >= izmjena_minut) then
      signal sqlstate '45000'
      set message_text = 'Igrac nije u igri';
  end if;
end $$

delimiter ;
-- Azuriranja nakon brisanja crvenog kartona

CREATE DEFINER = CURRENT_USER TRIGGER `fudbal_rezultati`.`karton_AFTER_DELETE` AFTER DELETE ON `karton` FOR EACH ROW
BEGIN
  if old.idKarton_tip in (2, 3) then
    update igrac_na_utakmici
    set uIgri = 1
    where idIgrac = old.idIgrac and idUtakmica = old.idUtakmica;
  end if;
END

-- Azuriranja nakon izmjene

CREATE DEFINER = CURRENT_USER TRIGGER `fudbal_rezultati`.`izmjena_AFTER_DELETE` AFTER DELETE ON `izmjena` FOR EACH ROW
BEGIN
	update igrac_na_utakmici
	set uIgri = 1
    where idIgrac = old.idIgracIzlazi and idUtakmica = old.idUtakmica;
    
	update rezervni_igrac
	set uIgri = 0
    where idIgrac = old.idIgracUlazi and idUtakmica = old.idUtakmica;
END

-- prikazivanje utakmica u okviru jednog kola

delimiter $$

create procedure PrikaziUtakmiceKola(in liga_id int, in kolo int)
begin
  select 
    kd.nazivKluba as Domaci, 
    kg.nazivKluba as Gosti,
    s.naziv as Stadion,
    s.grad as Grad,
    u.datum as Datum,
    u.vrijeme as Vrijeme,
    u.goloviDomaci as GoloviDomaci,
    u.goloviGosti as GoloviGosti
  from
    fudbal_rezultati.utakmica u
    left join fudbal_rezultati.klub kd on kd.idKlub = u.idDomaci
    left join fudbal_rezultati.klub kg on kg.idKlub = u.idGosti
    left join stadion s on s.idStadion = u.idStadion
  where
    u.idLiga = liga_id and u.kolo = kolo
  order by
    Datum asc, Vrijeme asc;
end $$

delimiter ;

-- Prikazivanje statistike igraca unutar jednog kluba

delimiter $$

create procedure PrikazStatistikeKlub(in klub_id int)
begin
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) as BrojUtakmica,
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
end $$

delimiter ;

-- Prikazivanje statistike igraca unutar jedne lige

delimiter $$

create procedure PrikazStatistikeLiga(in liga_id int)
begin
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    p.nazivPozicije as Pozicija,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.gol g where g.idIgrac = i.idIgrac) as BrojGolova,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    join fudbal_rezultati.pozicija p on i.oznakaPozicije = p.oznakaPozicije
  where
    liga_id = c.idLiga
  order by
    BrojGolova desc;
end $$

delimiter ;

-- Prikazivanje statistike golmana unutar jedne lige

delimiter $$

create procedure PrikazStatistikeGolmanaLiga(in liga_id int)
begin
  select
    i.ime as Ime,
    i.prezime as Prezime,
    k.nazivKluba as Klub,
    (select count(*) from fudbal_rezultati.igrac_na_utakmici inu where inu.idIgrac = i.idIgrac) as BrojUtakmica,
    (select count(*) from fudbal_rezultati.odbrana o where o.idGolman = i.idIgrac) as BrojOdbrana,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip = 1) as ZutihKartona,
    (select count(*) from fudbal_rezultati.karton kar where kar.idIgrac = i.idIgrac and kar.idKarton_tip in (2, 3)) as CrvenihKartona
  from
    fudbal_rezultati.igrac i
    join fudbal_rezultati.klub k on i.idKlub = k.idKlub
    join clan c on k.idKlub = c.idKlub
    -- join fudbal_rezultati.odbrana o on i.idIgrac = o.idGolman
  where
    liga_id = c.idLiga and i.oznakaPozicije = 'GK'
  order by
    BrojOdbrana desc;
end $$

delimiter ;

-- Trigger za izmjenu

delimiter $$

create trigger before_insert_izmjena
before insert on izmjena for each row
begin
  declare igrac_ulaz_igri int;
  declare igrac_izlaz_igri int;
  declare klub_ulaz int;
  declare klub_izlaz int;
  declare karton_minut int;
  declare izmjena_izlaz_count int;
  declare izmjena_ulaz_count int;
  
  select minut into karton_minut
  from karton
  where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica and idKarton_tip in (2, 3);
  
  select count(*) into izmjena_izlaz_count
  from izmjena
  where idIgracIzlazi = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
  
  select count(*) into izmjena_ulaz_count
  from izmjena
  where idIgracUlazi = new.idIgracUlazi and idUtakmica = new.idUtakmica;

  select uIgri into igrac_ulaz_igri from rezervni_igrac where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
  select uIgri into igrac_izlaz_igri from igrac_na_utakmici where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;

  select idKlub into klub_ulaz from igrac where idIgrac = new.idIgracUlazi;
  select idKlub into klub_izlaz from igrac where idIgrac = new.idIgracIzlazi;
  
  if (igrac_ulaz_igri is null or igrac_izlaz_igri is null or klub_ulaz <> klub_izlaz) or 
  (karton_minut is not null and new.minut >= karton_minut) or (izmjena_izlaz_count > 0) or (izmjena_ulaz_count > 0) then
    signal sqlstate '45000'
    set message_text = 'Neispravni podaci za izmjenu igraca.';
  end if;
end $$

delimiter ;

CREATE DEFINER = CURRENT_USER TRIGGER `fudbal_rezultati`.`izmjena_AFTER_INSERT` AFTER INSERT ON `izmjena` FOR EACH ROW
BEGIN
	update igrac_na_utakmici
	set uIgri = 0
    where idIgrac = new.idIgracIzlazi and idUtakmica = new.idUtakmica;
    
	update rezervni_igrac
	set uIgri = 1
    where idIgrac = new.idIgracUlazi and idUtakmica = new.idUtakmica;
END


-- UPITI
----------------------------------------------------------

-- prikaz rezultata utakmice

select 
  kd.nazivKluba as Domaci,
  kg.nazivKluba as Gosti,
  s.naziv as Stadion,
  s.grad as Grad,
  u.datum as Datum,
  u.vrijeme as Vrijeme,
  u.goloviDomaci as GoloviDomaci,
  u.goloviGosti as GoloviGosti,
  u.kolo as Kolo,
  l.nazivLige as Liga
from
  fudbal_rezultati.utakmica u
  left outer join fudbal_rezultati.klub kd on kd.idKlub = u.idDomaci
  left outer join fudbal_rezultati.klub kg on kg.idKlub = u.idGosti
  left outer join fudbal_rezultati.stadion s on s.idStadion = u.idStadion
  left outer join fudbal_rezultati.liga l on l.idLiga = u.idLiga
where
  u.idUtakmica = 1;

-- prikaz golova na utakmici

select
  k.nazivKluba as Klub,
  concat(substr(i.ime, 1, 1), '. ', i.prezime) as Igrac,
  g.minut as Minut
from
  fudbal_rezultati.gol g
  left outer join fudbal_rezultati.klub k on k.idKlub = g.idKlub
  left outer join fudbal_rezultati.igrac i on i.idIgrac = g.idIgrac
where
  g.idUtakmica = 1
order by
  Minut asc;
  
-- Prikaz kartona na utkmici

select
  nazivKluba as Klub,
  concat(substr(i.ime, 1, 1), '. ', i.prezime) as Igrac,
  kt.tip as Karton,
  kar.minut as Minut
from
  fudbal_rezultati.karton kar
  left outer join(fudbal_rezultati.igrac i left join fudbal_rezultati.klub k on i.idKlub = k.idKlub)
    on i.idIgrac = kar.idIgrac
  inner join fudbal_rezultati.karton_tip kt on kt.idKarton_tip = kar.idKarton_tip
where
  kar.idUtakmica = 1
order by
  Minut asc;
  
  
-- Prikaz startne postave

select
  k.nazivKluba as Klub,
  i.idIgrac as ID,
  i.ime as Ime,
  i.prezime as Prezime,
  i.brojDresa as BrojDresa,
  i.oznakaPozicije as Pozicija,
  inu.uIgri
from
  fudbal_rezultati.igrac_na_utakmici inu
  inner join(fudbal_rezultati.igrac i left join fudbal_rezultati.klub k on i.idKlub = k.idKlub)
    on i.idIgrac = inu.idIgrac
where
  inu.idUtakmica = 1;
  
-- Prikaz rezervnih igraca

select
  k.nazivKluba as Klub,
  i.idIgrac as ID,
  i.ime as Ime,
  i.prezime as Prezime,
  i.brojDresa as BrojDresa,
  i.oznakaPozicije as Pozicija,
  ri.uIgri
from
  fudbal_rezultati.rezervni_igrac ri
  inner join(fudbal_rezultati.igrac i left join fudbal_rezultati.klub k on i.idKlub = k.idKlub)
    on i.idIgrac = ri.idIgrac
where
  ri.idUtakmica = 1;
  
  
-- Prikaz izmjena

select
  concat(substr(iu.ime, 1, 1), '. ', iu.prezime) as IgracUlaz,
  concat(substr(ii.ime, 1, 1), '. ', ii.prezime) as IgracIzlaz,
  k.nazivKluba as Klub,
  iz.minut as Minut
from
  fudbal_rezultati.izmjena iz
  left join fudbal_rezultati.igrac iu on iu.idIgrac = iz.idIgracUlazi
  left join fudbal_rezultati.igrac ii on ii.idIgrac = iz.idIgracIzlazi
  left join fudbal_rezultati.klub k on iu.idKlub = k.idKlub
where
  iz.idUtakmica = 1
order by
  Minut asc;

-- View: prikaz kartona

CREATE VIEW `kartoni_prikaz`(TipKartona, Igrac, Razlog) AS
select 
  kt.tip,
  concat(i.ime, ' ', i.prezime),
  razlog
from
  fudbal_rezultati.karton kar
  inner join fudbal_rezultati.karton_tip kt on kt.idKarton_tip = kar.idKarton_tip
  left join fudbal_rezultati.igrac i on i.idIgrac = kar.idIgrac
  
-- View: prikaz trenera

CREATE VIEW `treneri_prikaz` AS
select
  ime as Ime,
  prezime as Prezime,
  d.drzava as Drzava,
  k.nazivKluba as Klub
from
  fudbal_rezultati.trener t
  left join fudbal_rezultati.drzava d on t.idDrzava = d.idDrzava
  left join fudbal_rezultati.klub k on t.idKlub = k.idKlub
  
  
-- View: prikaz igraca

CREATE VIEW `igraci_prikaz` AS
select
  ime as Ime,
  prezime as Prezime,
  brojDresa as BrojDresa,
  godine as Godine,
  k.nazivKluba as Klub,
  d.drzava as Drzava,
  p.nazivPozicije as Pozicija,
  visina as Visina
from
  fudbal_rezultati.igrac i
  left join fudbal_rezultati.klub k on k.idKlub = i.idKlub
  left join fudbal_rezultati.drzava d on d.idDrzava = i.idDrzava
  left join fudbal_rezultati.pozicija p on p.oznakaPozicije = i.oznakaPozicije
  
  
-- View: prikaz liga
CREATE VIEW `liga_prikaz` AS
select
  nazivLige as Liga,
  d.drzava as Drzava,
  datumPocetka,
  datumKraja,
  concat(k.starosnaKategorija, ' ', k.nivoTakmicenja, ' rang')
from
  fudbal_rezultati.liga l
  left join fudbal_rezultati.drzava d on d.idDrzava = l.idDrzava
  left join fudbal_rezultati.kategorija k on k.idKategorija = l.idKategorija
  

-- View: prikaz clanova liga

CREATE VIEW `clan_prikaz` AS
select
  k.nazivKluba as Klub,
  group_concat(l.nazivLige) as Liga
from
  fudbal_rezultati.clan c
  inner join fudbal_rezultati.klub k on k.idKlub = c.idKlub
  inner join fudbal_rezultati.liga l on l.idLiga = c.idLiga

group by
  Klub;
  
-- View: prikaz stadiona
CREATE VIEW `stadion_prikaz` AS
select
  s.naziv as Naziv,
  grad as Grad,
  kapacitet as Kapacitet,
  vp.naziv as Podloga
from
  fudbal_rezultati.stadion s
  inner join fudbal_rezultati.vrsta_podloge vp on vp.idVrsta_podloge = s.idVrsta_podloge
  
  
-- View: prikaz Kluba
CREATE VIEW `klub_prikaz` AS
select
  nazivKluba as Klub,
  grad as Grad,
  b.naziv as Boja,
  b.primarnaBoja as Primarna,
  b.sekundarnaBoja as Sekundarna
from
  fudbal_rezultati.klub k
  inner join boja b on b.idBoja = k.idBoja
