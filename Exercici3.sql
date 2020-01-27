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
-- Table `mydb`.`Youtuber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Youtuber` (
  `idYoutuber` INT NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `pass` VARCHAR(30) NOT NULL,
  `userName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idYoutuber`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Video` (
  `idVideo` INT NOT NULL,
  `idUrl` VARCHAR(45) NOT NULL,
  `Youtuber_idYoutuber` INT NOT NULL,
  `description` VARCHAR(400) NULL,
  `title` VARCHAR(60) NOT NULL,
  `url` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`idVideo`),
  INDEX `fk_Video_Youtuber_idx` (`Youtuber_idYoutuber` ASC),
  UNIQUE INDEX `url_UNIQUE` (`url` ASC) VISIBLE,
  CONSTRAINT `fk_Video_Youtuber`
    FOREIGN KEY (`Youtuber_idYoutuber`)
    REFERENCES `mydb`.`Youtuber` (`idYoutuber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
