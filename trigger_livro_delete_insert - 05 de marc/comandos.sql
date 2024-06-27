-- Active: 1709576080714@@127.0.0.1@3306
CREATE DATABASE db_livro2 DEFAULT CHARACTER SET = 'utf8mb4';

USE db_livro2;

CREATE TABLE livro(
    id_livro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    titulo_livro VARCHAR(120) NOT NULL,
    autor_livro VARCHAR(120) NOT NULL,
    valor_livro DECIMAL(10,2) NOT NULL
);

CREATE TABLE livroBackupInsert(
    id_livroBackup INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_livro_livroBackup INT NOT NULL,
    titulo_livro_livroBackup VARCHAR(120) NOT NULL,
    autor_livro_livroBackup VARCHAR(120) NOT NULL,
    valor_livro_livroBackup DECIMAL(10,2) NOT NULL
);

CREATE TABLE livroBackupDelete(
    id_livroBackup INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_livro_livroBackup INT NOT NULL,
    titulo_livro_livroBackup VARCHAR(120) NOT NULL,
    autor_livro_livroBackup VARCHAR(120) NOT NULL,
    valor_livro_livroBackup DECIMAL(10,2) NOT NULL
);

DELIMITER //

CREATE TRIGGER insert_on_livro
AFTER INSERT ON livro
FOR EACH ROW
BEGIN
INSERT INTO livroBackupInsert VALUES(null, NEW.id_livro, NEW.titulo_livro, NEW.autor_livro, NEW.valor_livro);
END //

CREATE TRIGGER insert_on_livro_delete
BEFORE DELETE ON livro
FOR EACH ROW
BEGIN
INSERT INTO livroBackupDelete VALUES(null, OLD.id_livro, OLD.titulo_livro, OLD.autor_livro, OLD.valor_livro);
END //

DELIMITER ;

INSERT INTO livro VALUES
(null, "Sereia", "Nycolas", 50.00),
(null, "O gigante", "Davi", 150.00),
(null, "Senhor dos aneis", "Atylas", 80.00);

INSERT INTO livro VALUES (null, "Cachorro", "Jorge", 100.00);

SELECT * FROM livro;

SELECT * FROM livroBackupInsert;

DELETE FROM livro WHERE id_livro = 1 OR id_livro = 3;
DELETE FROM livro WHERE id_livro = 4;

SELECT * FROM livroBackupDelete;

