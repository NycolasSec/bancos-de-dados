
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

INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('DF', 'Santa Maria Sul', 'Qr 309 Conjunto X LOTE XX', 1);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('GO', 'Goiania', 'Qr 440 Conjunto X LOTE XX', 2);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('RJ', 'Rio de Janeiro', 'Qr 123 Conjunto X LOTE XX', 3);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('SP', 'Sao Paulo', 'Qr 453 Conjunto X LOTE XX', 4);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('RS', 'Santo', 'Qr 23 Conjunto X LOTE XX', 5);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('DF', 'Brasilia', 'Qr 54 Conjunto X LOTE XX', 6);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('RJ', 'Prainha', 'Qr 567 Conjunto X LOTE XX', 7);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('SP', 'Boca do Lobo', 'Qr 235 Conjunto X LOTE XX', 8);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('ES', 'Santo', 'Qr 123 Conjunto X LOTE XX', 9);
INSERT INTO endereco(uf_endereco, cidade_endereco, logradouro_endereco, fk_id_usuario_endereco) VALUES ('RS', 'Luziania', 'Qr 78 Conjunto X LOTE XX', 10);
SELECT * FROM endereco;

INSERT INTO telefone(numero_telefone, tipo_telefone, fk_id_usuario_telefone)
VALUES  ("+55 65 998085330","whatsapp", "1"),
        ("+67 61 998085330","fixo", "2"),
        ("+23 61 967085330","fixo", "3"),
        ("+46 45 967765330","whatsapp", "4"),
        ("+78 45 967765570","whatsapp", "5"),
        ("+98 35 967765578","whatsapp", "6"),
        ("+13 65 969645578","fixo", "7"),
        ("+46 87 969645590","fixo", "8"),
        ("+57 25 969647590","whatsapp", "9"),
        ("+24 25 966547590","fixo", "10");

INSERT INTO telefone(numero_telefone, tipo_telefone, fk_id_usuario_telefone)
VALUES  (NULL,"", "5"),(NULL,"", "6");
select * FROM telefone;

SELECT COUNT(*) AS QUANTIDADE FROM usuario;

SELECT COUNT(numero_telefone) AS QUANTIDADE, tipo_telefone FROM telefone WHERE numero_telefone IS NOT NULL GROUP BY tipo_telefone;

SELECT id_usuario, nome_usuario FROM usuario ORDER BY nome_usuario ;

SELECT id_usuario, nome_usuario FROM usuario ORDER BY id_usuario DESC ;

SELECT COUNT(uf_endereco) AS QUANTIDADE, uf_endereco FROM endereco GROUP BY uf_endereco;

SELECT id_usuario, nome_usuario, logradouro_endereco FROM usuario INNER JOIN endereco ON id_usuario = fk_id_usuario_endereco;

SELECT id_usuario, nome_usuario, logradouro_endereco, uf_endereco FROM usuario INNER JOIN endereco ON id_usuario = fk_id_usuario_endereco;

SELECT id_usuario, nome_usuario,id_endereco, logradouro_endereco, cidade_endereco, uf_endereco, numero_telefone FROM usuario 
INNER JOIN endereco ON id_usuario = fk_id_usuario_endereco 
INNER JOIN telefone ON id_usuario = fk_id_usuario_telefone 
WHERE numero_telefone IS NOT NULL ORDER BY id_endereco;