-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema business_card
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema business_card
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `business_card` DEFAULT CHARACTER SET utf8 ;
USE `business_card` ;

-- -----------------------------------------------------
-- Table `business_card`.`user_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_card`.`user_data` (
  `userID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `phoneNum` VARCHAR(20) NOT NULL,
  `companyName` VARCHAR(100) NOT NULL DEFAULT 'N/A',
  `userImg` BLOB NULL,
  `dateCreated` TIMESTAMP NOT NULL,
  `isActive` TINYINT(1) NOT NULL DEFAULT 1,
  `isValidated` TINYINT(1) NOT NULL DEFAULT 0,
  `emailValCode` VARCHAR(255) NOT NULL,
  `admin` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `business_card`.`user_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `business_card`.`user_login` (
  `loginID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `userID` INT UNSIGNED NULL,
  `lastLogin` TIMESTAMP NULL,
  PRIMARY KEY (`loginID`),
  INDEX `user_date_user_login_FK_idx` (`userID` ASC),
  CONSTRAINT `user_date_user_login_FK`
    FOREIGN KEY (`userID`)
    REFERENCES `business_card`.`user_data` (`userID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
