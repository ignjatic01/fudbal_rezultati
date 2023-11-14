-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`vrsta_podloge`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`vrsta_podloge` (`naziv`, `opis`) VALUES ('Prirodna trava', 'Prirodna trava nanesena u busenima dimenzija 1.20 m sirine x 30m duzine');
INSERT INTO `fudbal_rezultati`.`vrsta_podloge` (`naziv`, `opis`) VALUES ('Hibridna podloga', 'Kombinacija prave trave i vještačkih niti, velike gustine i savršenog kvaliteta');
INSERT INTO `fudbal_rezultati`.`vrsta_podloge` (`naziv`, `opis`) VALUES ('Vještačka trava', 'Pogodna za područija na kojima nema odgovarajućih uslova za pravu travu');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`karton_tip`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`karton_tip` (`tip`) VALUES ('Žuti karton');
INSERT INTO `fudbal_rezultati`.`karton_tip` (`tip`) VALUES ('Crveni karton');
INSERT INTO `fudbal_rezultati`.`karton_tip` (`tip`) VALUES ('Drugi žuti - crveni karton');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`kategorija`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`kategorija` (`starosnaKategorija`, `nivoTakmicenja`) VALUES ('U19', 'Prvi');
INSERT INTO `fudbal_rezultati`.`kategorija` (`starosnaKategorija`, `nivoTakmicenja`) VALUES ('U17', 'Prvi');
INSERT INTO `fudbal_rezultati`.`kategorija` (`starosnaKategorija`, `nivoTakmicenja`) VALUES ('Seniori', 'Prvi');
INSERT INTO `fudbal_rezultati`.`kategorija` (`starosnaKategorija`, `nivoTakmicenja`) VALUES ('Seniori', 'Drugi');
INSERT INTO `fudbal_rezultati`.`kategorija` (`starosnaKategorija`, `nivoTakmicenja`) VALUES ('Seniori', 'Prvi (Evropa)');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`pozicija`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('GK', 'Golman');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('CB', 'Štoper');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('LB', 'Lijevi bek');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('RB', 'Desni bek');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('LWB', 'Krilni lijevi bek');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('RWB', 'Krilni desni bek');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('DM', 'Defanzivni vezni');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('CM', 'Centralni vezni');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('LM', 'Lijevi vezni');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('RM', 'Desni vezni');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('AM', 'Ofanzivni vezni');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('LW', 'Lijevo krilo');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('RW', 'Desno krilo');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('SS', 'Polu-špic');
INSERT INTO `fudbal_rezultati`.`pozicija` (`oznakaPozicije`, `nazivPozicije`) VALUES ('CF', 'Centarfor');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`drzava`
-- -----------------------------------------------------
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Bosna i Hercegovina', 'BIH');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Srbija', 'SRB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Albanija', 'ALB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Argentina', 'ARG');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Jermenija', 'ARM');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Alžir', 'DZA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Australija', 'AUS');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Austrija', 'AUT');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Azerbejdžan', 'AZE');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Bjelorusija', 'BLR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Belgija', 'BEL');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Brazil', 'BRA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Bugarska', 'BGR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Kamerun', 'CMR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Kanada', 'CAN');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Kolumbija', 'COL');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Obala Slonovače', 'CIV');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Hrvatska', 'HRV');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Francuska', 'FRA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Gabon', 'GAB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Njemačka', 'GER');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Grčka', 'GRC');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Mađarska', 'HUN');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Izrael', 'ISR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Italija', 'ITA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Južna Koreja', 'KOR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Crna Gora', 'MNE');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Sjeverna Makedonija', 'MKD');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Portugal', 'PRT');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Poljska', 'POL');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Rusija', 'RUS');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Slovenija', 'SVN');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Španija', 'ESP');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Turska', 'TUR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Ukrajina', 'UKR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Sjedinjene Američke Države', 'USA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Venecuela', 'VEN');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Burkina Faso', 'BFA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Gana', 'GHA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Gruzija', 'GEO');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Solomonova Ostrva', 'SLB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Nigerija', 'NGA');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Luksemburg', 'LUX');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Saudijska Arabija', 'SAU');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Danska', 'DNK');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Senegal', 'SEN');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Švedska', 'SWE');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Gambia', 'GMB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Holandija', 'NLD');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Kurasao', 'CUW');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Kongo', 'COD');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Norveška', 'NOR');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Zambia', 'ZMB');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Novi Zeland', 'NZL');
INSERT INTO `fudbal_rezultati`.`drzava` (`drzava`, `kod`) VALUES ('Jamajka', 'JAM');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`boja`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#ff0000', '#0000ff', 'Crveno-plava');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#0000ff', '#000000', 'Plavo-bijela');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#ff0000', '#000000', 'Crveno-bijela');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#ffffff', '#000000', 'Crno-bijela');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#753632', '#000000', 'Bordo-bijela');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `naziv`) VALUES ('#0e8ae3', 'Svijetloplava');
INSERT INTO `fudbal_rezultati`.`boja` (`primarnaBoja`, `sekundarnaBoja`, `naziv`) VALUES ('#0e8ae3', '#000000', 'Svijetloplavo-bijela');


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`liga`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`liga` (`nazivLige`, `idDrzava`, `datumPocetka`, `datumKraja`, `idKategorija`) VALUES ('Premijer liga', '1', '2023-07-28', '2024-05-26', '3');
INSERT INTO `fudbal_rezultati`.`liga` (`nazivLige`, `idDrzava`, `datumPocetka`, `datumKraja`, `idKategorija`) VALUES ('Superliga', '2', '2023-07-29', '2024-05-31', '3');
INSERT INTO `fudbal_rezultati`.`liga` (`nazivLige`, `datumPocetka`, `datumKraja`, `idKategorija`) VALUES ('UEFA Champions League', '2023-06-27', '2024-07-01', '5');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`klub`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Borac', 'Banja Luka', '1');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('HŠK Zrinjski', 'Mostar', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Sarajevo', 'Sarajevo', '5');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Velež', 'Mostar', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('NK Široki Brijeg', 'Široki Brijeg', '2');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Željezničar', 'Sarajevo', '2');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Sloga', 'Doboj', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('NK Posušje', 'Posušje', '6');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Igman', 'Konjic', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('GOŠK Gabela', 'Gabela', '2');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Tuzla City', 'Tuzla', '7');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Zvijezda 09', 'Bijeljina', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Crvena zvezda', 'Beograd', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('FK Partizan', 'Beograd', '4');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('TSC', 'Bačka Topola', '2');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Vojvodina', 'Novi Sad', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Manchester City', 'Mančester', '7');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Bayern', 'Minhen', '3');
INSERT INTO `fudbal_rezultati`.`klub` (`nazivKluba`, `grad`, `idBoja`) VALUES ('Juventus', 'Torino', '4');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`stadion`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Gradski stadion', 'Banja Luka', '9730', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Bijeli brijeg', 'Mostar', '9000', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Koševo', 'Sarajevo', '34500', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Rođeni', 'Vrapčići', '7000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Pecara', 'Široki Brijeg', '6000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Grbavica', 'Sarajevo', '13146', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Luke', 'Doboj', '3000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Mokri dolac', 'Posušje', '8000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Gradski stadion', 'Konjic', '3000', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Perica-Pero Pavlović', 'Gabela', '3000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Tušanj', 'Tuzla', '7000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Gradski stadion', 'Ugljevik', '5000', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Rajko Mitić', 'Beograd', '55538', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('JNA', 'Beograd', '32712', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('TSC Arena', 'Bačka Topola', '4500', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Karađorđe', 'Novi Sad', '14852', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Etihad', 'Mančester', '55017', '2');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Allianz Arena', 'Minhen', '75024', '1');
INSERT INTO `fudbal_rezultati`.`stadion` (`naziv`, `grad`, `kapacitet`, `idVrsta_podloge`) VALUES ('Allianz Stadium', 'Torino', '41507', '1');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`clan`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('1', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('2', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('3', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('4', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('5', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('6', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('7', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('8', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('9', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('10', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('11', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('12', '1');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('13', '2');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('14', '2');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('15', '2');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('16', '2');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('1', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('2', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('13', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('14', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('16', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('17', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('18', '3');
INSERT INTO `fudbal_rezultati`.`clan` (`idKlub`, `idLiga`) VALUES ('19', '3');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`trener`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Pep', 'Guardiola', '33', '17');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Massimiliano', 'Allegri', '25', '19');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Thomas', 'Tuchel', '21', '18');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Igor', 'Duljaj', '2', '14');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Barak', 'Bakhar', '24', '13');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Žarko', 'Lazetić', '2', '15');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Ranko', 'Popović', '2', '16');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Vinko', 'Marinović', '2', '1');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Krunoslav', 'Rendulić', '18', '2');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Simon', 'Rožman', '32', '3');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Dean', 'Klafurić', '18', '4');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Marijan', 'Budimir', '18', '5');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Haris', 'Alihodžić', '1', '6');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Vlado', 'Jagodić', '1', '7');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Branko', 'Karačić', '18', '8');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Edis', 'Mulalić', '1', '9');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Denis', 'Ćorić', '18', '10');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Adnan', 'Osmanhodžić', '1', '11');
INSERT INTO `fudbal_rezultati`.`trener` (`ime`, `prezime`, `idDrzava`, `idKlub`) VALUES ('Mihajlo', 'Jurasović', '2', '12');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`igrac`
-- -----------------------------------------------------


INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Milan', 'Mijatović', '25', '36', '27', '1', 'GK', '190');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Nikola', 'Ćetković', '21', '21', '1', '1', 'GK', '190');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Bojan', 'Pavlović', '1', '36', '2', '1', 'GK', '190');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ranko', 'Jokić', '3', '24', '2', '1', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Savo', 'Sušić', '31', '18', '1', '1', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Maks', 'Juraj Čelić', '6', '27', '18', '1', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nikola', 'Pejović', '4', '25', '2', '1', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Aleksandar', 'Subić', '18', '30', '1', '1', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Sebastian', 'Herrera', '16', '28', '16', '1', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Slobodan', 'Đekić', '2', '22', '1', '1', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Janez', 'Pišek', '13', '25', '32', '1', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Srđan', 'Grahovac', '15', '31', '1', '1', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stefan', 'Fićović', '8', '25', '2', '1', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jovan', 'Nišić', '45', '25', '2', '1', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Fedor', 'Predragović', '14', '28', '1', '1', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Roslan', 'Barsky', '10', '31', '24', '1', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Vasilije', 'Terzić', '29', '24', '27', '1', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stojan', 'Vranješ', '23', '37', '1', '1', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Alen', 'Jurilj', '7', '27', '18', '1', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jose', 'Ricardo Cortes', '11', '29', '16', '1', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jakov', 'Blagaić', '24', '23', '18', '1', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nemanja', 'Mihajlović', '77', '27', '2', '1', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Enver', 'Kulašin', '27', '20', '1', '1', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Damir', 'Hrelja', '55', '22', '1', '1', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('David', 'Čavić', '22', '20', '1', '1', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Zoran', 'Kvržić', '20', '35', '1', '1', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Milan', 'Makarić', '9', '28', '2', '1', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Glanfranco', 'Pena', '90', '23', '16', '1', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jovo', 'Lukić', '19', '24', '1', '1', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Marko', 'Marić', '35', '27', '18', '2', 'GK', '193');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Omer', 'Niron', '55', '22', '24', '2', 'GK', '195');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nemanja', 'Bilbija', '99', '33', '1', '2', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Dario', 'Čanađija', '5', '29', '18', '2', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Josip', 'Ćorluka', '6', '28', '1', '2', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mario', 'Ćuze', '25', '24', '18', '2', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Slobodan', 'Jakovljević', '27', '34', '2', '2', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ivan', 'Jukić', '7', '27', '1', '2', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Tomislav', 'Kiš', '10', '29', '18', '2', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Luka', 'Marin', '2', '25', '18', '2', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stipe', 'Radić', '15', '23', '18', '2', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Tarik', 'Ramić', '19', '20', '1', '2', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Andrija', 'Balić', '14', '26', '18', '2', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Antonio', 'Ivančić', '20', '28', '18', '2', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Anton', 'Maglica', '77', '31', '18', '2', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Kerim', 'Memija', '50', '27', '1', '2', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Franko', 'Sabljić', '9', '20', '1', '2', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Muhamed', 'Šahinović', '1', '20', '1', '3', 'GK', '191');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Marin', 'Aničić', '28', '34', '1', '3', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Momir', 'Đuričković', '44', '26', '27', '3', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Slaviša', 'Radović', '23', '30', '2', '3', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Amar', 'Beganović', '22', '23', '1', '3', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Edin', 'Juraldžija', '18', '22', '18', '3', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Daniel', 'Avramovski', '27', '28', '28', '3', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mirza', 'Mustafić', '98', '25', '1', '3', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Almedin', 'Ziljkić', '77', '27', '1', '3', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ajdin', 'Hasić', '17', '22', '1', '3', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Adalberto', 'Penarada', '10', '26', '37', '3', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Lovre', 'Rogić', '39', '28', '18', '3', 'GK', '190');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Vinko', 'Soldo', '24', '25', '18', '3', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mario', 'Vranić', '8', '34', '1', '3', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Francis', 'Kyeremeh', '11', '26', '39', '3', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Osman', 'Hadžikić', '31', '27', '8', '4', 'GK', '186');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Bruno', 'Oliveira', '96', '27', '12', '4', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ante', 'Hrkač', '8', '31', '1', '4', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Klemen', 'Šturm', '23', '29', '32', '4', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ante', 'Oreč', '2', '22', '18', '4', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Omar', 'Pršeš', '7', '28', '1', '4', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Tarik', 'Šikalo', '16', '19', '1', '4', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Edo', 'Vehabović', '28', '28', '1', '4', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Asmir', 'Suljić', '10', '32', '1', '4', 'LW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Giorgi', 'Guliashvili', '9', '22', '40', '4', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nermin', 'Haskić', '17', '34', '1', '4', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Tomislav', 'Tomić', '12', '26', '18', '5', 'GK', '189');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ivan', 'Saravanja', '3', '27', '1', '5', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Marko', 'Capan', '6', '19', '18', '5', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stephen', 'Chinedu', '9', '23', '42', '5', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Cyrille', 'Kpan', '15', '25', '38', '5', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Vedad', 'Muftić', '13', '22', '1', '6', 'GK', '186');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Marin', 'Galić', '24', '28', '1', '6', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nedim', 'Mekić', '8', '28', '1', '6', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Joseph', 'Amoah', '26', '21', '39', '6', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Sulejman', 'Krpić', '7', '32', '1', '6', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Elvir', 'Trako', '17', '25', '1', '7', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Miloš', 'Nikolić', '4', '29', '2', '7', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Srđan', 'Grabež', '35', '32', '2', '7', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Dejan', 'Vidić', '99', '30', '2', '7', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Franko', 'Kolić', '72', '20', '18', '8', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Luka', 'Lučić', '35', '28', '18', '8', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Karlo', 'Kamenar', '10', '29', '18', '8', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Dominik', 'Begić', '17', '26', '1', '8', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Aldin', 'Ceman', '12', '28', '1', '9', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Marko', 'Čubrilo', '11', '25', '1', '9', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Armin', 'Besagić', '4', '25', '1', '9', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Anel', 'Hebibović', '7', '33', '1', '9', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Filip', 'Vasilj', '22', '23', '1', '10', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Riad', 'Suta', '6', '21', '1', '10', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Marko', 'Musulin', '23', '23', '18', '10', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nihad', 'Sero', '24', '24', '1', '10', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Eldin', 'Lolić', '1', '19', '1', '11', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mirza', 'Delimedjač', '5', '24', '2', '11', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Huso', 'Karjašević', '17', '26', '1', '11', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mirzad', 'Mehanović', '10', '30', '1', '11', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Luka', 'Damjanović', '83', '20', '1', '12', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stefan', 'Šapić', '65', '26', '2', '12', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Stefan', 'Veličković', '18', '24', '2', '12', 'RB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Krsta', 'Đorđević', '26', '30', '2', '12', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Omri', 'Glazer', '18', '27', '24', '13', 'GK', '190');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Uroš', 'Spajić', '5', '30', '2', '13', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Mirko', 'Ivanić', '4', '30', '27', '13', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jean-Philippe', 'Krasso', '17', '26', '17', '13', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Cherif', 'Ndiaye', '9', '27', '46', '13', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('In-beom', 'Hwang', '66', '27', '26', '13', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Aleksandar', 'Jovanović', '1', '30', '1', '14', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Svetozar', 'Marković', '6', '23', '1', '14', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Kristijan', 'Belić', '40', '22', '1', '14', 'DM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Bibras', 'Natcho', '10', '35', '24', '14', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Veljko', 'Ilić', '12', '20', '1', '15', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nemanja', 'Stojić', '18', '25', '1', '15', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Ifet', 'Đakovac', '35', '25', '1', '15', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Uroš', 'Milovanović', '9', '23', '1', '15', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Lazar', 'Carević', '25', '24', '27', '16', 'GK');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Igor', 'Jeličić', '15', '23', '1', '16', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Andrija', 'Radulović', '49', '21', '27', '16', 'RM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Filip', 'Malbašić', '29', '30', '1', '16', 'LM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Ederson', 'Moraes', '31', '30', '12', '17', 'GK', '188');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Nathan', 'Ake', '6', '28', '49', '17', 'CB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Julian', 'Alvarez', '19', '23', '4', '17', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Erling', 'Haaland', '9', '23', '52', '17', 'CF');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Manuel', 'Neuer', '1', '37', '21', '18', 'GK', '193');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Alphonso', 'Davies', '19', '23', '15', '18', 'LB');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Jamal', 'Musiala', '42', '20', '21', '18', 'AM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Kingsley', 'Coman', '11', '27', '19', '18', 'RW');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`, `visina`) VALUES ('Wojciech', 'Szczesny', '1', '33', '30', '19', 'GK', '196');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Adrien', 'Rabiot', '25', '28', '19', '19', 'CM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Filip', 'Kostić', '11', '31', '2', '19', 'LM');
INSERT INTO `fudbal_rezultati`.`igrac` (`ime`, `prezime`, `brojDresa`, `godine`, `idDrzava`, `idKlub`, `oznakaPozicije`) VALUES ('Dušan', 'Vlahović', '9', '23', '2', '19', 'CF');


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`utakmica`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('1', '3', '1', '2023-10-18', '19:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('11', '2', '11', '2023-09-27', '15:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('4', '10', '4', '2023-08-06', '17:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('12', '9', '12', '2023-08-05', '17:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('8', '5', '8', '2023-08-04', '17:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('7', '6', '7', '2023-09-20', '15:00:00', '1', '1');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('4', '12', '4', '2023-07-29', '20:30:00', '1', '2');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('10', '11', '10', '2023-07-30', '17:00:00', '1', '2');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('3', '7', '3', '2023-07-30', '20:00:00', '1', '2');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('6', '9', '6', '2023-08-30', '18:30:00', '1', '2');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('2', '8', '2', '2023-09-13', '18:30:00', '1', '2');
INSERT INTO `fudbal_rezultati`.`utakmica` (`idDomaci`, `idGosti`, `idStadion`, `datum`, `vrijeme`, `idLiga`, `kolo`) VALUES ('5', '1', '5', '2023-09-27', '18:30:00', '1', '2');


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`igrac_na_utakmici`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('1', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('4', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('6', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('9', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('26', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('12', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('14', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('17', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('25', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('24', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('29', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('47', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('48', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('49', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('50', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('51', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('52', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('53', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('54', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('55', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('56', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('57', '1');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('30', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('32', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('38', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('40', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('99', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('100', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('101', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('102', '2');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('62', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('63', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('72', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('95', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('96', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('97', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('98', '3');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('103', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('104', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('105', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('106', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('91', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('92', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('93', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('94', '4');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('87', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('88', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('89', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('90', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('73', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('74', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('75', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('76', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('77', '5');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('83', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('84', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('85', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('86', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('78', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('79', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('80', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('81', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('82', '6');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('62', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('63', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('71', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('72', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('103', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('104', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('105', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('106', '7');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('95', '8');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('96', '8');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('98', '8');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('99', '8');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('102', '8');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('47', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('52', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('57', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('83', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('85', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('86', '9');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('78', '10');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('82', '10');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('91', '10');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('92', '10');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('30', '11');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('32', '11');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('34', '11');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('87', '11');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('89', '11');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('73', '12');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('1', '12');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('8', '12');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('12', '12');
INSERT INTO `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`, `idUtakmica`) VALUES ('29', '12');





-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`rezervni_igrac`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('3', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('5', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('8', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('11', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('13', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('18', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('19', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('20', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('21', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('22', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('27', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('58', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('59', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('60', '1');
INSERT INTO `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`, `idUtakmica`) VALUES ('61', '1');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`gol`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('1', '1', '12', '23');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('1', '1', '26', '91');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('2', '11', '101', '13');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('2', '2', '32', '14');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('2', '2', '38', '36');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('2', '2', '38', '55');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('3', '4', '72', '60');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('3', '10', '98', '74');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('4', '12', '105', '3');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('6', '7', '86', '45');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('6', '7', '86', '72');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('7', '12', '106', '45');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('8', '10', '96', '12');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('8', '11', '102', '33');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('8', '10', '98', '51');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('9', '3', '57', '51');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('9', '7', '85', '70');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('9', '7', '86', '90');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('10', '6', '82', '21');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('11', '2', '34', '18');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('11', '2', '32', '42');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('12', '1', '12', '6');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('12', '1', '29', '8');
INSERT INTO `fudbal_rezultati`.`gol` (`idUtakmica`, `idKlub`, `idIgrac`, `minut`) VALUES ('12', '1', '12', '67');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`karton`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('1', '9', '1', '12', 'Povla;enje za dres');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('1', '50', '1', '34', 'Oštar start');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('1', '55', '1', '62', 'Prigovor');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('1', '63', '3', '44', 'Simuliranje');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('1', '83', '6', '87', 'Odugovlačenje');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('2', '79', '6', '91', 'Učešće u tuči');
INSERT INTO `fudbal_rezultati`.`karton` (`idKarton_tip`, `idIgrac`, `idUtakmica`, `minut`, `razlog`) VALUES ('3', '83', '6', '91', 'Učešće u tuči');

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`odbrana`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('1', '1', '23');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('1', '1', '77');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('1', '1', '96');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('47', '1', '14');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('47', '1', '66');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('83', '6', '15');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('78', '6', '34');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('83', '6', '67');
INSERT INTO `fudbal_rezultati`.`odbrana` (`idGolman`, `idUtakmica`, `minut`) VALUES ('78', '6', '88');


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`izmjena`
-- -----------------------------------------------------

INSERT INTO `fudbal_rezultati`.`izmjena` (`idIgracUlazi`, `idIgracIzlazi`, `idUtakmica`, `minut`) VALUES ('13', '14', '1', '67');
INSERT INTO `fudbal_rezultati`.`izmjena` (`idIgracUlazi`, `idIgracIzlazi`, `idUtakmica`, `minut`) VALUES ('21', '17', '1', '67');
INSERT INTO `fudbal_rezultati`.`izmjena` (`idIgracUlazi`, `idIgracIzlazi`, `idUtakmica`, `minut`) VALUES ('27', '29', '1', '80');
INSERT INTO `fudbal_rezultati`.`izmjena` (`idIgracUlazi`, `idIgracIzlazi`, `idUtakmica`, `minut`) VALUES ('58', '57', '1', '81');









