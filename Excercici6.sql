-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Vidre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vidre` (
  `idVidre` INT NOT NULL,
  `color` VARCHAR(45) NULL,
  `graduacio` VARCHAR(45) NULL,
  PRIMARY KEY (`idVidre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Montura` (
  `idMontura` INT NOT NULL,
  `color` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  PRIMARY KEY (`idMontura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ProviderAdress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ProviderAdress` (
  `idProviderAdress` INT NOT NULL,
  `calle` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `pis` VARCHAR(45) NULL,
  `porta` VARCHAR(45) NULL,
  `ciutat` VARCHAR(45) NULL,
  `codi postal` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  PRIMARY KEY (`idProviderAdress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveidor` (
  `idProveidor` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `fax` VARCHAR(45) NULL,
  `nif` VARCHAR(45) NULL,
  `ProviderAdress_idProviderAdress` INT NOT NULL,
  PRIMARY KEY (`idProveidor`),
  INDEX `fk_Proveidor_ProviderAdress1_idx` (`ProviderAdress_idProviderAdress` ASC),
  CONSTRAINT `fk_Proveidor_ProviderAdress1`
    FOREIGN KEY (`ProviderAdress_idProviderAdress`)
    REFERENCES `mydb`.`ProviderAdress` (`idProviderAdress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Glasses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Glasses` (
  `idGlasses` INT NOT NULL,
  `brand` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `Vidre_idVidre` INT NOT NULL,
  `Montura_idMontura` INT NOT NULL,
  `Proveidor_idProveidor` INT NOT NULL,
  `idClientRecomanat` VARCHAR(45) NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Glasses_Vidre1_idx` (`Vidre_idVidre` ASC),
  INDEX `fk_Glasses_Montura1_idx` (`Montura_idMontura` ASC),
  INDEX `fk_Glasses_Proveidor1_idx` (`Proveidor_idProveidor` ASC),
  CONSTRAINT `fk_Glasses_Vidre1`
    FOREIGN KEY (`Vidre_idVidre`)
    REFERENCES `mydb`.`Vidre` (`idVidre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Montura1`
    FOREIGN KEY (`Montura_idMontura`)
    REFERENCES `mydb`.`Montura` (`idMontura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Glasses_Proveidor1`
    FOREIGN KEY (`Proveidor_idProveidor`)
    REFERENCES `mydb`.`Proveidor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Optica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Optica` (
  `idOptica` INT NOT NULL,
  `Glasses_idGlasses` INT NOT NULL,
  PRIMARY KEY (`idOptica`),
  INDEX `fk_Optica_Glasses_idx` (`Glasses_idGlasses` ASC),
  CONSTRAINT `fk_Optica_Glasses`
    FOREIGN KEY (`Glasses_idGlasses`)
    REFERENCES `mydb`.`Glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `registerDate` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `Optica_idOptica` INT NOT NULL,
  `idEmpleado` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`),
  INDEX `fk_Empleat_Optica1_idx` (`Optica_idOptica` ASC),
  CONSTRAINT `fk_Empleat_Optica1`
    FOREIGN KEY (`Optica_idOptica`)
    REFERENCES `mydb`.`Optica` (`idOptica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `idVenta` INT NOT NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  `Client_idClient` INT NOT NULL,
  `Glasses_idGlasses` INT NOT NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_Venta_Empleat1_idx` (`Empleat_idEmpleat` ASC),
  INDEX `fk_Venta_Client1_idx` (`Client_idClient` ASC),
  INDEX `fk_Venta_Glasses1_idx` (`Glasses_idGlasses` ASC),
  CONSTRAINT `fk_Venta_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `mydb`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `mydb`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venta_Glasses1`
    FOREIGN KEY (`Glasses_idGlasses`)
    REFERENCES `mydb`.`Glasses` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
