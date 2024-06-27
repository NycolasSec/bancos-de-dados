-- Active: 1709576080714@@127.0.0.1@3306
CREATE DATABASE db_test DEFAULT CHARACTER SET = 'utf8mb4';

USE db_test;

CREATE TABLE usuario(
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(120) UNIQUE NOT NULL,
    login_usuario VARCHAR(120) UNIQUE NOT NULL,
    senha_usuario VARCHAR(120) NOT NULL
);

CREATE TABLE backupUsuario(
    id_backupUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fk_usuario_backupUsuario INT NOT NULL,
    nome_backupUsuario VARCHAR(120) UNIQUE NOT NULL,
    login_backupUsuario VARCHAR(120) UNIQUE NOT NULL
);

-- INSERCOES

INSERT INTO usuario(nome_usuario, login_usuario, senha_usuario) VALUES 
("Nycolas", "nycolasonrails", "abcdefg"),
("Atylas", "atylasonrails", "a1b2c3"),
("Davi", "davionrails", "alun@"),
("Davidere", "davionhrhrrhrails", "alun@"),
("Daviarar", "davionrahrrhrils", "alun@");


SELECT nome_usuario FROM usuario ;
desc backupUsuario ;

DELIMITER //
CREATE TRIGGER delete_usuario
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
INSERT  INTO backupUsuario VALUES(null, OLD.id_usuario, OLD.nome_usuario, OLD.login_usuario);
END //

DELIMITER ;

DELETE FROM usuario WHERE id_usuario = 4;

SELECT * FROM backupUsuario ;
SELECT * FROM usuario ;

DROP TRIGGER SENAI;