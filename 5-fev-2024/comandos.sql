-- Active: 1706635174833@@127.0.0.1@3306
CREATE DATABASE db_servicos DEFAULT CHARACTER SET = 'utf8mb4';

USE db_servicos;

CREATE TABLE usuario(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_usuario VARCHAR(120) NOT NULL,
    cpf_usuario VARCHAR(15)
);

CREATE TABLE endereco(
    id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    uf_endereco CHAR(2) NOT NULL,
    cidade_endereco VARCHAR(120) NOT NULL,
    logradouro_endereco VARCHAR(120) NOT NULL,
    fk_id_usuario_endereco INT NOT NULL UNIQUE,
    CONSTRAINT  FK_usuario_endereco FOREIGN KEY (fk_id_usuario_endereco) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);

CREATE TABLE telefone(
    id_telefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero_telefone VARCHAR(20) UNIQUE,
    tipo_telefone VARCHAR(10),
    fk_id_usuario_telefone INT NOT NULL,
    CONSTRAINT  FK_usuario_telefone FOREIGN KEY (fk_id_usuario_telefone) REFERENCES usuario(id_usuario) ON DELETE CASCADE
);


-- DELE ALL
DROP TABLE telefone;
DROP TABLE endereco;
DROP TABLE usuario;

-- INSERCAO
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Joana Maria", "988.665.851-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Joao Carlos", "982.5474.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Francisco Edvan", "988.687.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Carlos Moises", "988.985.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Eduardo Fagundes", "345.674.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Maria Eduarda", "987.674.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Leticia Nunes", "567.674.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Aline Farias", "988.674.345-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Gabriel Henrique", "876.674.871-24");
INSERT INTO usuario(nome_usuario, cpf_usuario) VALUES("Paulo de Tarso", "988.765.871-24");

SELECT * FROM usuario;

INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('DF', 'Santa Maria Sul', 'Qr 309 cONJUNTO X LOTE XX', 1);
SELECT * FROM endereco;