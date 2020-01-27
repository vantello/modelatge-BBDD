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
  `price` INT NOT NULL,
  `author` VARCHAR(150) NOT NULL,
  `sold` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idPicture`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Costumer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Costumer` (
  `idCostumer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(9) NOT NULL,
  `Picture_idPicture` INT NOT NULL,
  PRIMARY KEY (`idCostumer`),
  INDEX `fk_Costumer_Picture_idx` (`Picture_idPicture` ASC),
  CONSTRAINT `fk_Costumer_Picture`
    FOREIGN KEY (`Picture_idPicture`)
    REFERENCES `mydb`.`Picture` (`idPicture`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
