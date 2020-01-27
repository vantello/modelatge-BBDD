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
-- Table `mydb`.`Author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Author` (
  `idAuthor` INT NOT NULL,
  `name` VARCHAR(75) NOT NULL,
  `adress` VARCHAR(100) NOT NULL,
  `booksWrited` INT NOT NULL,
  PRIMARY KEY (`idAuthor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Book` (
  `idBook` INT NOT NULL,
  `units` INT NOT NULL,
  `price` INT NOT NULL,
  `author` VARCHAR(75) NOT NULL,
  `Author_idAuthor` INT NOT NULL,
  PRIMARY KEY (`idBook`),
  INDEX `fk_Book_Author1_idx` (`Author_idAuthor` ASC),
  CONSTRAINT `fk_Book_Author1`
    FOREIGN KEY (`Author_idAuthor`)
    REFERENCES `mydb`.`Author` (`idAuthor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Catalogue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Catalogue` (
  `idCatalogue` INT NOT NULL,
  `Book_idBook` INT NOT NULL,
  PRIMARY KEY (`idCatalogue`),
  INDEX `fk_Catalogue_Book_idx` (`Book_idBook` ASC),
  CONSTRAINT `fk_Catalogue_Book`
    FOREIGN KEY (`Book_idBook`)
    REFERENCES `mydb`.`Book` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `Book_idBook` INT NOT NULL,
  `User_idUser` INT NOT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `fk_Bill_Book1_idx` (`Book_idBook` ASC),
  INDEX `fk_Bill_User1_idx` (`User_idUser` ASC),
  CONSTRAINT `fk_Bill_Book1`
    FOREIGN KEY (`Book_idBook`)
    REFERENCES `mydb`.`Book` (`idBook`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bill_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `mydb`.`User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
