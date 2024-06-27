
DROP DATABASE db_veiculos;
CREATE DATABASE db_veiculos;


USE db_veiculos;

CREATE TABLE veiculo(
    id_veiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo_veiculo VARCHAR(120) NOT NULL,
    placa_veiculo VARCHAR(10) NOT NULL UNIQUE,
    ano_veiculo DATE ,
    valor_veiculo DECIMAL(10,2) NOT NULL
);

CREATE TABLE backupVeiculo(
    id_backupVeiculo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_veiculo_backupVeiculo INT NOT NULL,
    modelo_veiculo_backupVeiculo VARCHAR(120) NOT NULL,
    placa_veiculo_backupVeiculo VARCHAR(10) NOT NULL UNIQUE,
    ano_veiculo_backupVeiculo DATE ,
    valor_veiculo_backupVeiculo DECIMAL(10,2) NOT NULL
);

-- INSERTS

INSERT INTO veiculo VALUES
(null, "chevet", "wer4r4rr", "2012-04-07", 5400.00),
(null, "opala", "wer4fgt5", "2013-01-01", 2500.00),
(null, "fusca", "gh5yui87", "2017-01-01", 3200.00),
(null, "palio", "gfg4ui87", "2005-01-01", 5400.00),
(null, "uno", "gfggr687", "2004-01-01", 6500.00),
(null, "camaro", "g56tr687", "2001-01-01", 4000.00);

DESC veiculo;

DELIMITER //
CREATE TRIGGER delete_veiculo
BEFORE DELETE ON veiculo
FOR EACH ROW
BEGIN
INSERT INTO backupVeiculo VALUES(null, OLD.id_veiculo, OLD.modelo_veiculo, OLD.placa_veiculo, OLD.ano_veiculo, OLD.valor_veiculo);
END //

DELIMITER ;

DELETE FROM veiculo WHERE id_veiculo = 1;

SELECT * FROM backupVeiculo;