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
-- Table `mydb`.`Picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Picture` (
  `idPicture` INT NOT NULL,
  `Autor` MEDIUMTEXT NOT NULL,
  `Precio` DECIMAL(10,0) NULL,
  `Estado` MEDIUMTEXT NULL,
  PRIMARY KEY (`idPicture`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vendedor` (
  `idVendedor` INT NOT NULL,
  `Nombre` MEDIUMTEXT NOT NULL,
  `Apellido` MEDIUMTEXT NOT NULL,
  `DNI` MEDIUMTEXT NOT NULL,
  `idPicture` INT NOT NULL,
  `Picture_idPicture` INT NOT NULL,
  PRIMARY KEY (`idPicture`),
  INDEX `fk_Vendedor_Picture_idx` (`Picture_idPicture` ASC),
  CONSTRAINT `fk_Vendedor_Picture`
    FOREIGN KEY (`Picture_idPicture`)
    REFERENCES `mydb`.`Picture` (`idPicture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Plane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Plane` (
  `idPlane` INT NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `numPersons` INT NOT NULL,
  PRIMARY KEY (`idPlane`))
ENGINE = ndbcluster;


-- -----------------------------------------------------
-- Table `mydb`.`Seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Seats` (
  `idSeats` INT NOT NULL,
  `Plane_idPlane` INT NOT NULL,
  PRIMARY KEY (`idSeats`),
  INDEX `fk_Seats_Plane1_idx` (`Plane_idPlane` ASC),
  CONSTRAINT `fk_Seats_Plane1`
    FOREIGN KEY (`Plane_idPlane`)
    REFERENCES `mydb`.`Plane` (`idPlane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
