-- Active: 1709143927121@@127.0.0.1@3306
CREATE DATABASE db_oficina
    DEFAULT CHARACTER SET = 'utf8mb4';

USE db_oficina;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_cliente VARCHAR(120) NOT NULL,
    sexo_cliente ENUM("m", "f"),
    logradouro_cliente VARCHAR(250),
    email_cliente VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE cor (
    id_cor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_cor VARCHAR(120) NOT NULL
);

CREATE TABLE carro (
    id_carro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    placa_carro VARCHAR(10) UNIQUE NOT NULL,
    fk_cliente_carro INT NOT NULL,
    fk_modelo_carro INT NOT NULL
);

CREATE TABLE telefone (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numero_telefone CHAR(15) UNIQUE NOT NULL,
    fk_cliente_telefone INT NOT NULL
);

CREATE TABLE marca (
    id_marca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_marca VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE modelo (
    id_modelo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_modelo VARCHAR(120) NOT NULL,
    fk_marca_modelo INT NOT NULL
);

CREATE TABLE notaCor (
    id_notaCor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_cor_notaCor INT NOT NULL,
    fk_carro_notaCor INT NOT NULL
);

-- chaves estrangeiras
ALTER TABLE carro ADD CONSTRAINT FK_cliente_carro
    FOREIGN KEY (fk_cliente_carro)
    REFERENCES cliente (id_cliente)
    ON DELETE CASCADE;

ALTER TABLE carro ADD CONSTRAINT FK_modelo_carro
    FOREIGN KEY (fk_modelo_carro)
    REFERENCES modelo (id_modelo)
    ON DELETE RESTRICT;

ALTER TABLE telefone ADD CONSTRAINT FK_cliente_telefone
    FOREIGN KEY (fk_cliente_telefone)
    REFERENCES cliente (id_cliente)
    ON DELETE CASCADE;

ALTER TABLE modelo ADD CONSTRAINT FK_marca_modelo
    FOREIGN KEY (fk_marca_modelo)
    REFERENCES marca (id_marca)
    ON DELETE RESTRICT;

ALTER TABLE notaCor ADD CONSTRAINT FK_cor_notaCor
    FOREIGN KEY (fk_cor_notaCor)
    REFERENCES cor (id_cor)
    ON DELETE RESTRICT;

ALTER TABLE notaCor ADD CONSTRAINT FK_carro_notaCor
    FOREIGN KEY (fk_carro_notaCor)
    REFERENCES carro (id_carro);

    SHOW TABLES;


-- --- INSERTS

INSERT INTO marca(nome_marca) VALUES
("fiat"),
("chevrolet"),
("toyota"),
("hyunday"),
("honda");

INSERT INTO modelo(nome_modelo, fk_marca_modelo) VALUES
("toro", 1),
("strada", 1),
("mobi", 1),
("onix", 2),
("cruze", 2),
("spin", 2),
("corolla", 3),
("sw4",3),
("corolla hybrid", 3),
("hb20", 4),
("hb20s", 4),
("creta", 4),
("city", 5),
("civic", 5),
("zr-v", 5);

INSERT INTO cliente(nome_cliente, sexo_cliente, logradouro_cliente, email_cliente) VALUES 
("Atylas Ramos", "m", "Santa Maria-DF Qr 309 Conjunto m Lote 78", "nycolas@gmail.com"),
("Erych Lemos", "m", "Samambaia Qr 309 Conjunto g Lote 8", "erych@gmail.com"),
("Davi Jossa", "m", "Samambaia Qr 9 Conjunto g Lote 9", "davi@gmail.com"),
("David Isaque", "m", "Samambaia Qr 120 Conjunto u Lote 10", "david@gmail.com"),
("Raquel Cherazades", "f", "Gama Qr 10 Conjunto l Lote 189", "raquel@gmail.com"),
("Helena Santiago", "f", "Gama Qr 20 Conjunto p Lote 19", "helena@gmail.com"),
("Luiza Sonza", "f", "Pedregal Qr 34 Conjunto h Lote 32", "luiza@gmail.com"),
("Maria Benedita", "f", "Pedregal Qr 234 Conjunto s Lote 56", "maria@gmail.com"),
("Joao Souto", "m", "Pedregal Qr 57 Conjunto b Lote 87", "joaosouto@gmail.com"),
("Mario Cabelo", "m", "Ocidental Qr 87 Conjunto j Lote 19", "mariocabelo@gmail.com"),
("Julia Sodoma", "f", "Ocidental Qr 76 Conjunto x Lote 20", "juliasodoma@gmail.com"),
("Riquelme Jose", "m", "Ocidental Qr 98 Conjunto d Lote 14", "riquelme@gmail.com"),
("Mario Linderios", "m", "Ceu Azul Qr 49 Conjunto e Lote 23", "mariolinderios@gmail.com"),
("Hadassa Haifa", "f", "Ceu Azul Qr 19 Conjunto g Lote 34", "hadassahaifa@gmail.com"),
("Ester Sodomita", "f", "Ceu Azul Qr 48 Conjunto k Lote 67", "estersodomita@gmail.com");

INSERT INTO telefone (numero_telefone, fk_cliente_telefone) VALUES
("61 998085536", 1),
("51 998085765", 2),
("51 998386765", 3),
("61 904386765", 4),
("22 904561765", 5),
("25 904561458", 6),
("22 904561487", 7),
("61 904561903", 8),
("57 904561047", 9),
("57 910471047", 10),
("61 912451047", 11),
("62 910591047", 12),
("62 910471047", 13),
("52 910934178", 14),
("51 910931749", 15);

INSERT INTO cor(nome_cor) VALUES
("azul"),
("laranja"),
("vermelho"),
("verde"),
("amarelo"),
("prata"),
("branco"),
("preto"),
("platinado"),
("cinza"),
("cinza escuro"),
("amarelo canário"),
("verde limão"),
("violeta"),
("azul bebê");

INSERT INTO carro(placa_carro, fk_cliente_carro, fk_modelo_carro) VALUES
("bbb8w33", 1, 15),
("ghj4g38", 2, 14),
("flg1y23", 3, 13),
("sjf5i67", 4, 12),
("oer7a12", 5, 11),
("tyu9f34", 6, 10),
("alf0d97", 7, 9),
("vbf1j22", 8, 8),
("ffg4k66", 9, 7),
("ghj2h99", 10, 6),
("hhj3b10", 11, 5),
("kkl8v57", 12, 4),
("qqr4d02", 13, 3),
("bbt9s15", 14, 2),
("ggh0b37", 15, 1);

INSERT INTO notaCor(fk_cor_notaCor, fk_carro_notaCor) VALUES
(1, 15),
(2, 14),
(3, 13),
(4, 12),
(5, 11),
(6, 10),
(7, 9),
(10, 8),
(9, 7),
(8, 6),
(11, 5),
(12, 4),
(13, 3),
(14, 2),
(15, 1),

(15, 15),
(14, 14),
(13, 13),
(8, 12),
(11, 11),
(12, 8),
(9, 9),
(10, 10),
(7, 7),
(6, 6),
(5, 5),
(4, 4),
(3, 3),
(2, 2),
(1, 1);

desc notaCor;
SHOW TABLES;

-- QUERIES
-- 1
SELECT COUNT(*) FROM carro;

-- 2
SELECT id_carro, nome_modelo, placa_carro  FROM carro
INNER JOIN modelo ON id_modelo = fk_modelo_carro;

-- 3
SELECT nome_cliente, numero_telefone, sexo_cliente FROM cliente
INNER JOIN telefone ON id_cliente = fk_cliente_telefone;

-- 4
SELECT nome_cliente, nome_modelo FROM carro
INNER JOIN cliente ON fk_cliente_carro = id_cliente
INNER JOIN modelo ON fk_modelo_carro = id_modelo;

-- 5
SELECT nome_cliente, nome_modelo, nome_cor FROM carro
INNER JOIN cliente ON fk_cliente_carro = id_cliente
INNER JOIN modelo ON fk_modelo_carro = id_modelo
INNER JOIN notaCor ON fk_carro_notaCor = id_carro
INNER JOIN cor ON fk_cor_notaCor = id_cor;

-- 6
SELECT nome_cliente, nome_modelo, nome_cor, nome_marca FROM carro
INNER JOIN cliente ON fk_cliente_carro = id_cliente
INNER JOIN modelo ON fk_modelo_carro = id_modelo
INNER JOIN marca ON fk_marca_modelo = id_marca
INNER JOIN notaCor ON fk_carro_notaCor = id_carro
INNER JOIN cor ON fk_cor_notaCor = id_cor;
