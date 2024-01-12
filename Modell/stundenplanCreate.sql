-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Stundenplan
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Stundenplan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Stundenplan` ;
USE `Stundenplan` ;

-- -----------------------------------------------------
-- Table `Stundenplan`.`Dozent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Dozent` (
  `dozentId` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `vorname` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`dozentId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Typ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Typ` (
  `typ` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`typ`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Semester` (
  `semester` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`semester`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Modul`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Modul` (
  `modulId` INT NOT NULL AUTO_INCREMENT,
  `anwesenheitspflichtig` TINYINT NULL,
  `inSemester` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`modulId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Jahrgang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Jahrgang` (
  `jahrgang` INT NOT NULL,
  PRIMARY KEY (`jahrgang`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Veranstaltung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Veranstaltung` (
  `veranstaltungId` INT NOT NULL AUTO_INCREMENT,
  `dozentId` INT NOT NULL,
  `typ` VARCHAR(50) NOT NULL,
  `semester` VARCHAR(50) NOT NULL,
  `modulId` INT NOT NULL,
  `jahrgang` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`veranstaltungId`),
  INDEX `fk_Veranstaltung_Dozent_idx` (`dozentId` ASC) VISIBLE,
  INDEX `fk_Veranstaltung_D_Typ1_idx` (`typ` ASC) VISIBLE,
  INDEX `fk_Veranstaltung_D_Semester1_idx` (`semester` ASC) VISIBLE,
  INDEX `fk_Veranstaltung_Modul1_idx` (`modulId` ASC) VISIBLE,
  INDEX `fk_Veranstaltung_D_Jahrgang1_idx` (`jahrgang` ASC) VISIBLE,
  CONSTRAINT `fk_Veranstaltung_Dozent`
    FOREIGN KEY (`dozentId`)
    REFERENCES `Stundenplan`.`Dozent` (`dozentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_D_Typ1`
    FOREIGN KEY (`typ`)
    REFERENCES `Stundenplan`.`D_Typ` (`typ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_D_Semester1`
    FOREIGN KEY (`semester`)
    REFERENCES `Stundenplan`.`D_Semester` (`semester`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_Modul1`
    FOREIGN KEY (`modulId`)
    REFERENCES `Stundenplan`.`Modul` (`modulId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Veranstaltung_D_Jahrgang1`
    FOREIGN KEY (`jahrgang`)
    REFERENCES `Stundenplan`.`D_Jahrgang` (`jahrgang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Gruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Gruppe` (
  `gruppe` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`gruppe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Student` (
  `matrikelnummer` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  `vorname` VARCHAR(255) NULL,
  `jahrgang` VARCHAR(50) NOT NULL,
  `gruppe` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`matrikelnummer`),
  INDEX `fk_Student_D_Jahrgang1_idx` (`jahrgang` ASC) VISIBLE,
  INDEX `fk_Student_D_Gruppe1_idx` (`gruppe` ASC) VISIBLE,
  CONSTRAINT `fk_Student_D_Jahrgang1`
    FOREIGN KEY (`jahrgang`)
    REFERENCES `Stundenplan`.`D_Jahrgang` (`jahrgang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_D_Gruppe1`
    FOREIGN KEY (`gruppe`)
    REFERENCES `Stundenplan`.`D_Gruppe` (`gruppe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Fehlgrund`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Fehlgrund` (
  `fehlgrund` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`fehlgrund`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Termin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Termin` (
  `terminId` INT NOT NULL AUTO_INCREMENT,
  `datum` DATE NULL,
  `beginn` TIME NULL,
  `ende` TIME NULL,
  `veranstaltungId` INT NOT NULL,
  PRIMARY KEY (`terminId`),
  INDEX `fk_Termin_Veranstaltung1_idx` (`veranstaltungId` ASC) VISIBLE,
  CONSTRAINT `fk_Termin_Veranstaltung1`
    FOREIGN KEY (`veranstaltungId`)
    REFERENCES `Stundenplan`.`Veranstaltung` (`veranstaltungId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Anwesenheit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Anwesenheit` (
  `fehlgrund` VARCHAR(50) NULL,
  `matrikelnummer` INT NOT NULL,
  `terminId` INT NOT NULL,
  INDEX `fk_Anwesenheit_D_Fehlgrund1_idx` (`fehlgrund` ASC) VISIBLE,
  INDEX `fk_Anwesenheit_Student1_idx` (`matrikelnummer` ASC) VISIBLE,
  INDEX `fk_Anwesenheit_Termin1_idx` (`terminId` ASC) VISIBLE,
  CONSTRAINT `fk_Anwesenheit_D_Fehlgrund1`
    FOREIGN KEY (`fehlgrund`)
    REFERENCES `Stundenplan`.`D_Fehlgrund` (`fehlgrund`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anwesenheit_Student1`
    FOREIGN KEY (`matrikelnummer`)
    REFERENCES `Stundenplan`.`Student` (`matrikelnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Anwesenheit_Termin1`
    FOREIGN KEY (`terminId`)
    REFERENCES `Stundenplan`.`Termin` (`terminId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`D_Aenderungsart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`D_Aenderungsart` (
  `aenderungsart` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`aenderungsart`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Historie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Historie` (
  `historieId` INT NOT NULL AUTO_INCREMENT,
  `aenderungsart` VARCHAR(255) NOT NULL,
  `aenderungsdatum` DATETIME NULL,
  `terminId` INT NOT NULL,
  `datum` DATE NULL,
  `beginn` TIME NULL,
  `ende` TIME NULL,
  PRIMARY KEY (`historieId`),
  INDEX `fk_Historie_D_Aenderungsart1_idx` (`aenderungsart` ASC) VISIBLE,
  INDEX `fk_Historie_Termin1_idx` (`terminId` ASC) VISIBLE,
  CONSTRAINT `fk_Historie_D_Aenderungsart1`
    FOREIGN KEY (`aenderungsart`)
    REFERENCES `Stundenplan`.`D_Aenderungsart` (`aenderungsart`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historie_Termin1`
    FOREIGN KEY (`terminId`)
    REFERENCES `Stundenplan`.`Termin` (`terminId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`BelegteVeranstaltung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`BelegteVeranstaltung` (
  `veranstaltungId` INT NOT NULL,
  `matrikelnummer` INT NOT NULL,
  INDEX `fk_BelegteVeranstaltung_Veranstaltung1_idx` (`veranstaltungId` ASC) VISIBLE,
  INDEX `fk_BelegteVeranstaltung_Student1_idx` (`matrikelnummer` ASC) VISIBLE,
  CONSTRAINT `fk_BelegteVeranstaltung_Veranstaltung1`
    FOREIGN KEY (`veranstaltungId`)
    REFERENCES `Stundenplan`.`Veranstaltung` (`veranstaltungId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_BelegteVeranstaltung_Student1`
    FOREIGN KEY (`matrikelnummer`)
    REFERENCES `Stundenplan`.`Student` (`matrikelnummer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`Termin2Gruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`Termin2Gruppe` (
  `terminId` INT NOT NULL,
  `gruppe` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`terminId`, `gruppe`),
  INDEX `fk_Termin_has_D_Gruppe_D_Gruppe1_idx` (`gruppe` ASC) VISIBLE,
  INDEX `fk_Termin_has_D_Gruppe_Termin1_idx` (`terminId` ASC) VISIBLE,
  CONSTRAINT `fk_Termin_has_D_Gruppe_Termin1`
    FOREIGN KEY (`terminId`)
    REFERENCES `Stundenplan`.`Termin` (`terminId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Termin_has_D_Gruppe_D_Gruppe1`
    FOREIGN KEY (`gruppe`)
    REFERENCES `Stundenplan`.`D_Gruppe` (`gruppe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Stundenplan`.`vertretenderDozent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Stundenplan`.`vertretenderDozent` (
  `dozentId` INT NOT NULL,
  `terminId` INT NOT NULL,
  PRIMARY KEY (`dozentId`, `terminId`),
  INDEX `fk_Dozent_has_Termin_Termin1_idx` (`terminId` ASC) VISIBLE,
  INDEX `fk_Dozent_has_Termin_Dozent1_idx` (`dozentId` ASC) VISIBLE,
  CONSTRAINT `fk_Dozent_has_Termin_Dozent1`
    FOREIGN KEY (`dozentId`)
    REFERENCES `Stundenplan`.`Dozent` (`dozentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Dozent_has_Termin_Termin1`
    FOREIGN KEY (`terminId`)
    REFERENCES `Stundenplan`.`Termin` (`terminId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

