-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`Delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Delivery` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Delivery` (
  `DeliveryID` INT NOT NULL,
  `DeliveryDate` DATE NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`DeliveryID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`MenuItems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`MenuItems` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`MenuItems` (
  `MenuItemsID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DesertName` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Side` VARCHAR(45) NULL,
  PRIMARY KEY (`MenuItemsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Menus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Menus` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Menus` (
  `MenuID` INT NOT NULL,
  `MenuName` VARCHAR(45) NULL,
  `Cuisine` VARCHAR(45) NULL,
  `MenuItemsID` INT NOT NULL,
  PRIMARY KEY (`MenuID`, `MenuItemsID`),
  INDEX `fk_Menus_MenuItems_idx` (`MenuItemsID` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_MenuItems`
    FOREIGN KEY (`MenuItemsID`)
    REFERENCES `littlelemondb`.`MenuItems` (`MenuItemsID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Address` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Address` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(255) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Postal` VARCHAR(10) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Customer` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`CustomerID`, `AddressID`),
  INDEX `fk_Customer_Address1_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Address1`
    FOREIGN KEY (`AddressID`)
    REFERENCES `littlelemondb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Employee` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Employee` (
  `EmployeeID` INT NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  `Role` VARCHAR(100) NULL,
  `Salary` VARCHAR(45) NULL,
  `AddressID` INT NOT NULL,
  PRIMARY KEY (`EmployeeID`, `AddressID`),
  INDEX `fk_Employee_Address1_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Address1`
    FOREIGN KEY (`AddressID`)
    REFERENCES `littlelemondb`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Bookings`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Bookings` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NULL,
  `BookingTime` TIME NULL,
  `TableNumber` INT NULL,
  `CustomerID` INT NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`, `CustomerID`, `EmployeeID`),
  INDEX `fk_Bookings_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Bookings_Employee1_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bookings_Employee1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `littlelemondb`.`Employee` (`EmployeeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `littlelemondb`.`Orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`Orders` ;

CREATE TABLE IF NOT EXISTS `littlelemondb`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `BookingID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`, `BookingID`, `CustomerID`, `DeliveryID`, `MenuID`),
  INDEX `fk_Orders_Bookings1_idx` (`BookingID` ASC) VISIBLE,
  INDEX `fk_Orders_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Orders_Delivery1_idx` (`DeliveryID` ASC) VISIBLE,
  INDEX `fk_Orders_Menus1_idx` (`MenuID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Bookings1`
    FOREIGN KEY (`BookingID`)
    REFERENCES `littlelemondb`.`Bookings` (`BookingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `littlelemondb`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Delivery1`
    FOREIGN KEY (`DeliveryID`)
    REFERENCES `littlelemondb`.`Delivery` (`DeliveryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menus1`
    FOREIGN KEY (`MenuID`)
    REFERENCES `littlelemondb`.`Menus` (`MenuID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
