-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Easyparking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Easyparking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Easyparking` DEFAULT CHARACTER SET utf8 ;
USE `Easyparking` ;

-- -----------------------------------------------------
-- Table `Easyparking`.`Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Easyparking`.`Registro` (
  `id_Registro` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Placa` VARCHAR(45) NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Tipo de vehiculo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Registro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Easyparking`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Easyparking`.`Factura` (
  `id_Registro` INT UNSIGNED NOT NULL,
  `Hora_ingreso` DATETIME NOT NULL,
  `Hora_salida` DATETIME NOT NULL,
  `Tiempo` TIME NOT NULL,
  `Valor_pagar` VARCHAR(45) NOT NULL,
  INDEX `Registro_idx` (`id_Registro` ASC) VISIBLE,
  CONSTRAINT `Registro`
    FOREIGN KEY (`id_Registro`)
    REFERENCES `Easyparking`.`Registro` (`id_Registro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
