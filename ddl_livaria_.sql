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
  `codigoestadoIBGE` INT NOT NULL AUTO_INCREMENT,
  `nomeestado` VARCHAR(45) NOT NULL,
  `regiao` VARCHAR(45) NULL,
  `siglaestado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`codigoestadoIBGE`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `siglaestado_UNIQUE` ON `livaria`.`estado` (`siglaestado` ASC);


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

CREATE INDEX `fk_cidade_estado_idx` ON `livaria`.`cidade` (`codigoestadoIBGE` ASC);


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

CREATE INDEX `cnpj_ix` ON `livaria`.`editora` (`cnpj` ASC);

CREATE INDEX `fk_editora_cidade1_idx` ON `livaria`.`editora` (`codigoIBGE` ASC);


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

CREATE INDEX `fk_editora_livro_livro1_idx` ON `livaria`.`edicao` (`idlivro` ASC);

CREATE INDEX `fk_editora_livro_editora1_idx` ON `livaria`.`edicao` (`codigoeditora` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `livaria`.`estado`
-- -----------------------------------------------------
START TRANSACTION;
USE `livaria`;
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (35, 'SÃ£o Paulo', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (41, 'ParanÃ¡', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (42, 'Santa Catarina', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (43, 'Rio Grande do Sul', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (50, 'Mato Grosso do Sul', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (11, 'RondÃ´nia', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (12, 'Acre', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (13, 'Amazonas', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (14, 'Roraima', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (15, 'ParÃ¡', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (16, 'AmapÃ¡', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (17, 'Tocantins', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (21, 'MaranhÃ£o', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (24, 'Rio Grande do Norte', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (25, 'ParaÃ­ba', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (26, 'Pernambuco', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (27, 'Alagoas', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (28, 'Sergipe', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (29, 'Bahia', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (31, 'Minas Gerais', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (33, 'Rio de Janeiro', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (51, 'Mato Grosso', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (52, 'GoiÃ¡s', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (53, 'Distrito Federal', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (22, 'PiauÃ­', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (23, 'CearÃ¡', '', DEFAULT);
INSERT INTO `livaria`.`estado` (`codigoestadoIBGE`, `nomeestado`, `regiao`, `siglaestado`) VALUES (32, 'EspÃ­rito Santo', '', DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `livaria`.`cidade`
-- -----------------------------------------------------
START TRANSACTION;
USE `livaria`;
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('municipio', 'uf', 'uf_code', name);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100015', '11', 'RO', Alta Floresta d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100023', '11', 'RO', Ariquemes);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100031', '11', 'RO', Cabixi);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100049', '11', 'RO', Cacoal);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100056', '11', 'RO', Cerejeiras);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100064', '11', 'RO', Colorado do Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100072', '11', 'RO', Corumbiara);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100080', '11', 'RO', Costa Marques);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100098', '11', 'RO', EspigÃ£o d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100106', '11', 'RO', GuajarÃ¡-Mirim);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100114', '11', 'RO', Jaru);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100122', '11', 'RO', Ji-ParanÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100130', '11', 'RO', Machadinho d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100148', '11', 'RO', Nova BrasilÃ¢ndia d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100155', '11', 'RO', Ouro Preto do Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100189', '11', 'RO', Pimenta Bueno);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100205', '11', 'RO', Porto Velho);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100254', '11', 'RO', Presidente MÃ©dici);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100262', '11', 'RO', Rio Crespo);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100288', '11', 'RO', Rolim de Moura);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100296', '11', 'RO', Santa Luzia d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100304', '11', 'RO', Vilhena);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100320', '11', 'RO', SÃ£o Miguel do GuaporÃ©);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100338', '11', 'RO', Nova MamorÃ©);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100346', '11', 'RO', Alvorada d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100379', '11', 'RO', Alto Alegre dos Parecis);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100403', '11', 'RO', Alto ParaÃ­so);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100452', '11', 'RO', Buritis);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100502', '11', 'RO', Novo Horizonte do Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100601', '11', 'RO', CacaulÃ¢ndia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100700', '11', 'RO', Campo Novo de RondÃ´nia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100809', '11', 'RO', Candeias do Jamari);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100908', '11', 'RO', Castanheiras);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100924', '11', 'RO', Chupinguaia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1100940', '11', 'RO', Cujubim);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101005', '11', 'RO', Governador Jorge Teixeira);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101104', '11', 'RO', ItapuÃ£ do Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101203', '11', 'RO', Ministro Andreazza);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101302', '11', 'RO', Mirante da Serra);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101401', '11', 'RO', Monte Negro);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101435', '11', 'RO', Nova UniÃ£o);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101450', '11', 'RO', Parecis);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101468', '11', 'RO', Pimenteiras do Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101476', '11', 'RO', Primavera de RondÃ´nia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101484', '11', 'RO', SÃ£o Felipe d\'Oeste);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101492', '11', 'RO', SÃ£o Francisco do GuaporÃ©);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101500', '11', 'RO', Seringueiras);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101559', '11', 'RO', TeixeirÃ³polis);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101609', '11', 'RO', Theobroma);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101708', '11', 'RO', UrupÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101757', '11', 'RO', Vale do Anari);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1101807', '11', 'RO', Vale do ParaÃ­so);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200013', '12', 'AC', AcrelÃ¢ndia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200054', '12', 'AC', Assis Brasil);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200104', '12', 'AC', BrasilÃ©ia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200138', '12', 'AC', Bujari);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200179', '12', 'AC', Capixaba);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200203', '12', 'AC', Cruzeiro do Sul);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200252', '12', 'AC', EpitaciolÃ¢ndia);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200302', '12', 'AC', FeijÃ³);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200328', '12', 'AC', JordÃ£o);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200336', '12', 'AC', MÃ¢ncio Lima);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200344', '12', 'AC', Manoel Urbano);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200351', '12', 'AC', Marechal Thaumaturgo);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200385', '12', 'AC', PlÃ¡cido de Castro);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200393', '12', 'AC', Porto Walter);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200401', '12', 'AC', Rio Branco);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200427', '12', 'AC', Rodrigues Alves);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200435', '12', 'AC', Santa Rosa do Purus);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200450', '12', 'AC', Senador Guiomard);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200500', '12', 'AC', Sena Madureira);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200609', '12', 'AC', TarauacÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200708', '12', 'AC', Xapuri);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1200807', '12', 'AC', Porto Acre);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300029', '13', 'AM', AlvarÃ£es);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300060', '13', 'AM', AmaturÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300086', '13', 'AM', AnamÃ£);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300102', '13', 'AM', Anori);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300144', '13', 'AM', ApuÃ­);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300201', '13', 'AM', Atalaia do Norte);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300300', '13', 'AM', Autazes);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300409', '13', 'AM', Barcelos);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300508', '13', 'AM', Barreirinha);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300607', '13', 'AM', Benjamin Constant);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300631', '13', 'AM', Beruri);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300680', '13', 'AM', Boa Vista do Ramos);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300706', '13', 'AM', Boca do Acre);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300805', '13', 'AM', Borba);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300839', '13', 'AM', Caapiranga);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1300904', '13', 'AM', Canutama);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301001', '13', 'AM', Carauari);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301100', '13', 'AM', Careiro);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301159', '13', 'AM', Careiro da VÃ¡rzea);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301209', '13', 'AM', Coari);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301308', '13', 'AM', CodajÃ¡s);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301407', '13', 'AM', EirunepÃ©);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301506', '13', 'AM', Envira);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301605', '13', 'AM', Fonte Boa);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301654', '13', 'AM', GuajarÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301704', '13', 'AM', HumaitÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301803', '13', 'AM', Ipixuna);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301852', '13', 'AM', Iranduba);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301902', '13', 'AM', Itacoatiara);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1301951', '13', 'AM', Itamarati);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302009', '13', 'AM', Itapiranga);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302108', '13', 'AM', JapurÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302207', '13', 'AM', JuruÃ¡);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302306', '13', 'AM', JutaÃ­);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302405', '13', 'AM', LÃ¡brea);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302504', '13', 'AM', Manacapuru);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302553', '13', 'AM', Manaquiri);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302603', '13', 'AM', Manaus);
INSERT INTO `livaria`.`cidade` (`codigoIBGE`, `codigocidadeIBGE`, `nomecidade`, `codigoestadoIBGE`) VALUES ('1302702', '13', 'AM', ManicorÃ©);

COMMIT;

