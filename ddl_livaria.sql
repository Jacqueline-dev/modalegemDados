-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livaria` DEFAULT CHARACTER SET utf8 ;
USE `livaria` ;

-- -----------------------------------------------------
-- Table `livaria`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livaria`.`estado` (
  `codigoestadoIBGE` INT NULL AUTO_INCREMENT,
  `nomeestado` VARCHAR(45) NOT NULL,
  `siglaestado` CHAR(2) NOT NULL,
  `regiao` VARCHAR(45) NULL,
  PRIMARY KEY (`codigoestadoIBGE`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `siglaestado_UNIQUE` ON `livaria`.`estado` (`siglaestado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livaria`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livaria`.`cidade` (
  `codigoIBGE` VARCHAR(45) NOT NULL,
  `codigocidadeIBGE` VARCHAR(10) NOT NULL,
  `nomecidade` VARCHAR(150) NOT NULL,
  `codigoestadoIBGE` INT NOT NULL,
  PRIMARY KEY (`codigoIBGE`),
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`codigoestadoIBGE`)
    REFERENCES `livaria`.`estado` (`codigoestadoIBGE`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_cidade_estado_idx` ON `livaria`.`cidade` (`codigoestadoIBGE` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livaria`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livaria`.`editora` (
  `codigoeditora` INT NOT NULL AUTO_INCREMENT,
  `nomeditora` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `codigoIBGE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigoeditora`),
  CONSTRAINT `fk_editora_cidade1`
    FOREIGN KEY (`codigoIBGE`)
    REFERENCES `livaria`.`cidade` (`codigoIBGE`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `cnpj_ix` ON `livaria`.`editora` (`cnpj` ASC) VISIBLE;

CREATE INDEX `fk_editora_cidade1_idx` ON `livaria`.`editora` (`codigoIBGE` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `livaria`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livaria`.`livro` (
  `idlivro` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `idioma` VARCHAR(15) NULL,
  PRIMARY KEY (`idlivro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livaria`.`edicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livaria`.`edicao` (
  `codigoeditora` INT NOT NULL,
  `idlivro` INT NOT NULL,
  `isbn` INT NOT NULL,
  `anoedicao` INT NOT NULL,
  `numedicao` INT NOT NULL,
  `numpaginas` INT NULL,
  PRIMARY KEY (`isbn`),
  CONSTRAINT `fk_editora_livro_editora1`
    FOREIGN KEY (`codigoeditora`)
    REFERENCES `livaria`.`editora` (`codigoeditora`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_editora_livro_livro1`
    FOREIGN KEY (`idlivro`)
    REFERENCES `livaria`.`livro` (`idlivro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_editora_livro_livro1_idx` ON `livaria`.`edicao` (`idlivro` ASC) VISIBLE;

CREATE INDEX `fk_editora_livro_editora1_idx` ON `livaria`.`edicao` (`codigoeditora` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `livaria`.`estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `livaria`;
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (35, 'SÃ£o Paulo', ' SP', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (41, 'ParanÃ¡', ' PR', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (42, 'Santa Catarina', ' SC', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (43, 'Rio Grande do Sul', ' RS', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (50, 'Mato Grosso do Sul', ' MS', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (11, 'RondÃ´nia', ' RO', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (12, 'Acre', ' AC', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (13, 'Amazonas', ' AM', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (14, 'Roraima', ' RR', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (15, 'ParÃ¡', ' PA', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (16, 'AmapÃ¡', ' AP', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (17, 'Tocantins', ' TO', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (21, 'MaranhÃ£o', ' MA', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (24, 'Rio Grande do Norte', ' RN', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (25, 'ParaÃ­ba', ' PB', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (26, 'Pernambuco', ' PE', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (27, 'Alagoas', ' AL', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (28, 'Sergipe', ' SE', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (29, 'Bahia', ' BA', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (31, 'Minas Gerais', ' MG', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (33, 'Rio de Janeiro', ' RJ', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (51, 'Mato Grosso', ' MT', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (52, 'GoiÃ¡s', ' GO', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (53, 'Distrito Federal', ' DF', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (22, 'PiauÃ­', ' PI', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (23, 'CearÃ¡', ' CE', '');
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `siglaestado`, `regiao`) VALUES (32, 'EspÃ­rito Santo', ' ES', '');

COMMIT;

