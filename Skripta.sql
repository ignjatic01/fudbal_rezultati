-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fudbal_rezultati
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fudbal_rezultati
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fudbal_rezultati` ;
USE `fudbal_rezultati` ;

-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`drzava`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`drzava` (
  `idDrzava` INT NOT NULL AUTO_INCREMENT,
  `drzava` VARCHAR(100) NOT NULL,
  `kod` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`idDrzava`),
  UNIQUE INDEX `kod_UNIQUE` (`kod` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`boja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`boja` (
  `idBoja` INT NOT NULL AUTO_INCREMENT,
  `primarnaBoja` CHAR(7) NOT NULL,
  `sekundarnaBoja` CHAR(7) NULL,
  `naziv` VARCHAR(50) NULL,
  PRIMARY KEY (`idBoja`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`klub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`klub` (
  `idKlub` INT NOT NULL AUTO_INCREMENT,
  `nazivKluba` VARCHAR(100) NOT NULL,
  `grad` VARCHAR(100) NOT NULL,
  `idBoja` INT NULL,
  PRIMARY KEY (`idKlub`),
  INDEX `FK_klub_boja_idx` (`idBoja` ASC) VISIBLE,
  CONSTRAINT `FK_klub_boja`
    FOREIGN KEY (`idBoja`)
    REFERENCES `fudbal_rezultati`.`boja` (`idBoja`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`pozicija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`pozicija` (
  `oznakaPozicije` VARCHAR(5) NOT NULL,
  `nazivPozicije` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`oznakaPozicije`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`igrac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`igrac` (
  `idIgrac` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `brojDresa` INT NOT NULL,
  `godine` INT NULL,
  `idDrzava` INT NOT NULL,
  `idKlub` INT NOT NULL,
  `oznakaPozicije` VARCHAR(5) NOT NULL,
  `visina` INT NULL,
  PRIMARY KEY (`idIgrac`),
  INDEX `FK_fudbaler_drzava_idx` (`idDrzava` ASC) VISIBLE,
  INDEX `FK_igrac_klub_idx` (`idKlub` ASC) VISIBLE,
  INDEX `FK_igrac_pozicija_idx` (`oznakaPozicije` ASC) VISIBLE,
  CONSTRAINT `FK_igrac_drzava`
    FOREIGN KEY (`idDrzava`)
    REFERENCES `fudbal_rezultati`.`drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_igrac_klub`
    FOREIGN KEY (`idKlub`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_igrac_pozicija`
    FOREIGN KEY (`oznakaPozicije`)
    REFERENCES `fudbal_rezultati`.`pozicija` (`oznakaPozicije`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`trener`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`trener` (
  `idTrener` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(50) NOT NULL,
  `prezime` VARCHAR(50) NOT NULL,
  `idDrzava` INT NULL,
  `idKlub` INT NOT NULL,
  PRIMARY KEY (`idTrener`),
  INDEX `FK_trener_drzava_idx` (`idDrzava` ASC) VISIBLE,
  INDEX `FK_trener_klub_idx` (`idKlub` ASC) VISIBLE,
  CONSTRAINT `FK_trener_drzava`
    FOREIGN KEY (`idDrzava`)
    REFERENCES `fudbal_rezultati`.`drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_trener_klub`
    FOREIGN KEY (`idKlub`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`kategorija` (
  `idKategorija` INT NOT NULL AUTO_INCREMENT,
  `starosnaKategorija` VARCHAR(50) NOT NULL,
  `nivoTakmicenja` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idKategorija`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`liga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`liga` (
  `idLiga` INT NOT NULL AUTO_INCREMENT,
  `nazivLige` VARCHAR(100) NOT NULL,
  `idDrzava` INT NULL,
  `datumPocetka` DATE NULL,
  `datumKraja` DATE NULL,
  `idKategorija` INT NOT NULL,
  PRIMARY KEY (`idLiga`),
  INDEX `FK_liga_drzava_idx` (`idDrzava` ASC) VISIBLE,
  INDEX `FK_liga_kategorija_idx` (`idKategorija` ASC) VISIBLE,
  CONSTRAINT `FK_liga_drzava`
    FOREIGN KEY (`idDrzava`)
    REFERENCES `fudbal_rezultati`.`drzava` (`idDrzava`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_liga_kategorija`
    FOREIGN KEY (`idKategorija`)
    REFERENCES `fudbal_rezultati`.`kategorija` (`idKategorija`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`vrsta_podloge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`vrsta_podloge` (
  `idVrsta_podloge` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(50) NOT NULL,
  `opis` VARCHAR(200) NULL,
  PRIMARY KEY (`idVrsta_podloge`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`stadion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`stadion` (
  `idStadion` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(100) NOT NULL,
  `grad` VARCHAR(100) NOT NULL,
  `kapacitet` INT NULL,
  `idVrsta_podloge` INT NULL,
  PRIMARY KEY (`idStadion`),
  INDEX `FK_stadion_vrsta_podloge_idx` (`idVrsta_podloge` ASC) VISIBLE,
  CONSTRAINT `FK_stadion_vrsta_podloge`
    FOREIGN KEY (`idVrsta_podloge`)
    REFERENCES `fudbal_rezultati`.`vrsta_podloge` (`idVrsta_podloge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`utakmica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`utakmica` (
  `idUtakmica` INT NOT NULL AUTO_INCREMENT,
  `idDomaci` INT NOT NULL,
  `idGosti` INT NOT NULL,
  `idStadion` INT NOT NULL,
  `datum` DATE NOT NULL,
  `vrijeme` TIME NULL,
  `goloviDomaci` INT NOT NULL DEFAULT 0,
  `goloviGosti` INT NOT NULL DEFAULT 0,
  `idLiga` INT NOT NULL,
  `kolo` INT NOT NULL,
  PRIMARY KEY (`idUtakmica`),
  INDEX `FK_utakmica_stadion_idx` (`idStadion` ASC) VISIBLE,
  INDEX `FK_utakmica_domaci_idx` (`idDomaci` ASC) VISIBLE,
  INDEX `FK_utakmica_gosti_idx` (`idGosti` ASC) VISIBLE,
  INDEX `FK_utakmica_liga_idx` (`idLiga` ASC) VISIBLE,
  CONSTRAINT `FK_utakmica_stadion`
    FOREIGN KEY (`idStadion`)
    REFERENCES `fudbal_rezultati`.`stadion` (`idStadion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_utakmica_domaci`
    FOREIGN KEY (`idDomaci`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_utakmica_gosti`
    FOREIGN KEY (`idGosti`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_utakmica_liga`
    FOREIGN KEY (`idLiga`)
    REFERENCES `fudbal_rezultati`.`liga` (`idLiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`clan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`clan` (
  `idKlub` INT NOT NULL,
  `idLiga` INT NOT NULL,
  PRIMARY KEY (`idKlub`, `idLiga`),
  INDEX `FK_clan_liga_idx` (`idLiga` ASC) VISIBLE,
  CONSTRAINT `FK_clan_klub`
    FOREIGN KEY (`idKlub`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_clan_liga`
    FOREIGN KEY (`idLiga`)
    REFERENCES `fudbal_rezultati`.`liga` (`idLiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`igrac_na_utakmici`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`igrac_na_utakmici` (
  `idIgrac` INT NOT NULL,
  `idUtakmica` INT NOT NULL,
  `uIgri` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idIgrac`, `idUtakmica`),
  INDEX `FK_igrac_na_utakmici_utakmica_idx` (`idUtakmica` ASC) VISIBLE,
  CONSTRAINT `FK_igrac_na_utakmici_utakmica`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `fudbal_rezultati`.`utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_igrac_na_utakmici_igrac`
    FOREIGN KEY (`idIgrac`)
    REFERENCES `fudbal_rezultati`.`igrac` (`idIgrac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`gol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`gol` (
  `idGol` INT NOT NULL AUTO_INCREMENT,
  `idUtakmica` INT NOT NULL,
  `idKlub` INT NOT NULL,
  `idIgrac` INT NOT NULL,
  `minut` INT NOT NULL,
  PRIMARY KEY (`idGol`),
  INDEX `fk_gol_klub_idx` (`idKlub` ASC) VISIBLE,
  INDEX `FK_gol_fudbaler_idx` (`idIgrac` ASC, `idUtakmica` ASC) VISIBLE,
  CONSTRAINT `FK_gol_klub`
    FOREIGN KEY (`idKlub`)
    REFERENCES `fudbal_rezultati`.`klub` (`idKlub`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_gol_igrac_na_utakmici`
    FOREIGN KEY (`idIgrac` , `idUtakmica`)
    REFERENCES `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac` , `idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`karton_tip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`karton_tip` (
  `idKarton_tip` INT NOT NULL AUTO_INCREMENT,
  `tip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idKarton_tip`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`karton`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`karton` (
  `idKarton` INT NOT NULL AUTO_INCREMENT,
  `idKarton_tip` INT NOT NULL,
  `idIgrac` INT NOT NULL,
  `idUtakmica` INT NOT NULL,
  `minut` INT NOT NULL,
  `razlog` VARCHAR(200) NULL,
  PRIMARY KEY (`idKarton`),
  INDEX `FK_karton_igrac_na_utakmici_idx` (`idIgrac` ASC, `idUtakmica` ASC) VISIBLE,
  INDEX `FK_karton_karton_tip_idx` (`idKarton_tip` ASC) VISIBLE,
  CONSTRAINT `FK_karton_igrac_na_utakmici`
    FOREIGN KEY (`idIgrac` , `idUtakmica`)
    REFERENCES `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac` , `idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_karton_karton_tip`
    FOREIGN KEY (`idKarton_tip`)
    REFERENCES `fudbal_rezultati`.`karton_tip` (`idKarton_tip`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`odbrana`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`odbrana` (
  `idOdbrana` INT NOT NULL AUTO_INCREMENT,
  `idGolman` INT NOT NULL,
  `idUtakmica` INT NOT NULL,
  `minut` INT NOT NULL,
  PRIMARY KEY (`idOdbrana`),
  INDEX `FK_odbrana_igrac_na_utakmici_idx` (`idGolman` ASC, `idUtakmica` ASC) VISIBLE,
  CONSTRAINT `FK_odbrana_igrac_na_utakmici`
    FOREIGN KEY (`idGolman` , `idUtakmica`)
    REFERENCES `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac` , `idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`rezervni_igrac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`rezervni_igrac` (
  `idIgrac` INT NOT NULL,
  `idUtakmica` INT NOT NULL,
  `uIgri` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idIgrac`, `idUtakmica`),
  INDEX `FK_rezervni_igrac_utakmica_idx` (`idUtakmica` ASC) VISIBLE,
  CONSTRAINT `FK_rezervni_igrac_igrac`
    FOREIGN KEY (`idIgrac`)
    REFERENCES `fudbal_rezultati`.`igrac` (`idIgrac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_rezervni_igrac_utakmica`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `fudbal_rezultati`.`utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fudbal_rezultati`.`izmjena`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fudbal_rezultati`.`izmjena` (
  `idizmjena` INT NOT NULL AUTO_INCREMENT,
  `idIgracUlazi` INT NOT NULL,
  `idIgracIzlazi` INT NOT NULL,
  `idUtakmica` INT NOT NULL,
  `minut` INT NULL,
  PRIMARY KEY (`idizmjena`),
  INDEX `FK_izmjena_rezervni_igrac_idx` (`idIgracUlazi` ASC) VISIBLE,
  INDEX `FK_izmjena_igrac_na_utakmici_idx` (`idIgracIzlazi` ASC) VISIBLE,
  INDEX `FK_izmjena_utakmica_idx` (`idUtakmica` ASC) VISIBLE,
  CONSTRAINT `FK_izmjena_rezervni_igrac`
    FOREIGN KEY (`idIgracUlazi`)
    REFERENCES `fudbal_rezultati`.`rezervni_igrac` (`idIgrac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_izmjena_igrac_na_utakmici`
    FOREIGN KEY (`idIgracIzlazi`)
    REFERENCES `fudbal_rezultati`.`igrac_na_utakmici` (`idIgrac`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_izmjena_utakmica`
    FOREIGN KEY (`idUtakmica`)
    REFERENCES `fudbal_rezultati`.`utakmica` (`idUtakmica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- ----------------------------------------------------------
--
--
-- NAKNADNE IZMJENE
--
--
-- ----------------------------------------------------------
ALTER TABLE `fudbal_rezultati`.`trener` 
ADD UNIQUE INDEX `idKlub_UNIQUE` (`idKlub` ASC) VISIBLE;
;
