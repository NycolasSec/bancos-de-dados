-- Active: 1706635174833@@127.0.0.1@3306@db_biblioteca
/* Lógico_1: */
CREATE DATABASE db_biblioteca;

USE db_biblioteca;

CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    nome_livro VARCHAR(120) NOT NULL,
    isbn_livro VARCHAR(20) NOT NULL,
    dt_lancamento_livro DATE NOT NULL,
    num_pagina_livro INT NOT NULL,
    preco_livro FLOAT(10,2) NOT NULL,
    fk_autor_livro INT NOT NULL,
    fk_editora_livro INT NOT NULL,
    fk_genero_livro INT NOT NULL,
    UNIQUE (nome_livro, isbn_livro)
);

CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(120) NOT NULL,
    cpf_autor VARCHAR(15) UNIQUE NOT NULL,
    sexo_autor VARCHAR(1) NOT NULL,
    email_autor VARCHAR(120) NOT NULL
);



CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(120) NOT NULL,
    contato_editora VARCHAR(20) NOT NULL,
    email_editora VARCHAR(120) NOT NULL,
    cnpj_editora VARCHAR(20) NOT NULL
);

CREATE TABLE genero (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(20) NOT NULL
);

-- CHAVES ESTRANGEIRAS
ALTER TABLE livro ADD CONSTRAINT FK_autor
    FOREIGN KEY (fk_autor_livro)
    REFERENCES autor(id_autor)
    ON DELETE RESTRICT;
 
ALTER TABLE livro ADD CONSTRAINT FK_editora
    FOREIGN KEY (fk_editora_livro)
    REFERENCES editora (id_editora)
    ON DELETE RESTRICT;
 
ALTER TABLE livro ADD CONSTRAINT FK_genero
    FOREIGN KEY (fk_genero_livro)
    REFERENCES genero (id_genero)
    ON DELETE RESTRICT;

-- INSERTS
INSERT INTO genero(nome_genero) VALUES("Ação"), ("Infantil"), ("Romance"), ("Suspense");

INSERT INTO editora(nome_editora, contato_editora, email_editora, cnpj_editora) VALUES
("Abril", "+55 (61) 99808-7609", "editora_abril@gmail.com", "32229926000140"),
("Globo", "+55 (65) 99808-7609", "globo_editora@gmail.com", "66766044000135"),
("Universo", "+55 (76) 99808-7609", "universo_livros@gmail.com", "66766044000135"),
("Conhecer", "+55 (51) 99808-7609", "conhecer_lendo@gmail.com", "66766044000135");

INSERT INTO autor(nome_autor, cpf_autor, sexo_autor, email_autor) VALUES
("Nycolas R.", "78645687234", "m", "nycolas.r@gmail.com"),
("Andressa S.", "98783787645", "f", "andressa.s@gmail.com"),
("C.S Lewis", "18467887187", "m", "cs.lewis@gmail.com"),
("Tolkien", "45664887156", "m", "tolkien@gmail.com");

INSERT INTO livro(nome_livro, isbn_livro, dt_lancamento_livro, num_pagina_livro, preco_livro, fk_autor_livro, fk_editora_livro, fk_genero_livro) VALUES
("Lua Nova", "567678702279", "1950/08/09", 345, 250, 1, 4, 3),
("A terra do nunca", "9788533302273", "1989/07/08", 76, 350, 2, 4, 3),
("O sol nascente", "5647678602273", "1999/05/21", 256, 550, 1, 4, 3),
("O anão", "56464802278", "2001/11/13", 45, 150, 4, 4, 3),
("A corda", "67834802458", "2001/01/06", 78, 50, 3, 1, 4),
("A corda bamba", "4563554298", "1978/12/13", 98, 560, 2, 1, 4),
("Senhor do mundo", "6563554290", "1984/05/12", 256, 80, 1, 1, 4),
("Os dois mundos", "3547654290", "2005/03/06", 98, 90, 4, 1, 4),
("O laptop", "1443454290", "1899/08/31", 145, 120, 3, 2, 2),
("Código Davinci", "47544856870", "1978/05/09", 346, 140, 2, 2, 2),
("Davi o grande rei", "13235487360", "2007/09/12", 76, 70, 1, 2, 2),
("A escola amaldiçoada", "16535454360", "2001/10/11", 457, 30, 4, 2, 2),
("Afreira", "16535454369", "2012/10/09", 289, 230, 3, 3, 1),
("A casa branca", "78544854369", "2004/07/21", 190, 150, 2, 3, 1),
("A escola negra", "25446754368", "2009/02/13", 120, 240, 4, 3, 1),
("A caixa amaldiçoada", "46675714368", "1983/09/07", 678, 450, 1, 3, 1);

-- EXERCICIOS
-- 01
SELECT nome_livro FROM livro;

-- 02
SELECT nome_editora FROM editora;

-- 03
SELECT nome_livro, nome_editora FROM livro INNER JOIN editora ON  fk_editora_livro = id_editora;

-- 04
SELECT nome_autor FROM autor;

-- 05
SELECT nome_autor, nome_livro FROM autor INNER JOIN livro ON fk_autor_livro = id_autor;

-- 06
SELECT nome_livro, preco_livro  FROM livro;

-- 07
SELECT nome_autor, email_autor, nome_livro, preco_livro FROM autor INNER JOIN livro ON id_autor = fk_autor_livro;

-- 08 
SELECT nome_autor, sexo_autor, nome_livro, nome_editora FROM autor
INNER JOIN livro ON id_autor = fk_autor_livro
INNER JOIN editora ON fk_editora_livro = id_editora;

-- 09
SELECT id_editora, nome_livro FROM editora INNER JOIN livro ON id_editora = fk_editora_livro;

-- 10
SELECT nome_autor, nome_livro, isbn_livro, nome_genero FROM livro
INNER JOIN autor ON fk_autor_livro = id_autor
INNER JOIN genero ON fk_genero_livro = id_genero ;

-- 11
SELECT nome_genero, nome_livro FROM genero INNER JOIN livro ON id_genero = fk_genero_livro;

-- 12
SELECT COUNT(*) as Quantidade FROM autor;

-- 13
SELECT sexo_autor, COUNT(*) as Quantidade FROM autor GROUP BY sexo_autor;

--14
SELECT nome_livro, preco_livro, (preco_livro * 2) as Duas_unidades FROM livro;

-- 15
SELECT nome_livro, preco_livro, (preco_livro * 0.15) as Desconto FROM livro;

-- 16
SELECT nome_livro, (preco_livro + (preco_livro * 0.15)) as Preco_com_acrescimo FROM livro;

-- 17
SELECT COUNT(*) FROM editora;

-- 18
SELECT COUNT(*) as Quantidade FROM genero;

-- 19
SELECT COUNT(*) as Quantidade, nome_genero FROM livro 
INNER JOIN genero ON fk_genero_livro = id_genero GROUP BY nome_genero;

-- 20 
SELECT nome_livro, preco_livro, nome_genero, nome_editora, email_editora FROM livro 
INNER JOIN genero ON fk_genero_livro = id_genero
INNER JOIN editora ON fk_editora_livro = id_editora;

--21
SELECT nome_livro, preco_livro, nome_genero, nome_editora, cnpj_editora FROM livro
INNER JOIN genero ON fk_genero_livro = id_genero
INNER JOIN editora ON fk_editora_livro = id_editora;

-- 22
SELECT nome_editora, cnpj_editora, nome_livro, dt_lancamento_livro FROM editora
INNER JOIN livro ON id_editora = fk_editora_livro;

-- 23
SELECT nome_livro, dt_lancamento_livro FROM livro WHERE dt_lancamento_livro >"2000/00/00" AND dt_lancamento_livro < "2024/00/00";

--24
SELECT nome_livro, dt_lancamento_livro, preco_livro, (preco_livro * 0.5) as Desconto FROM livro WHERE dt_lancamento_livro = "2001/11/13";

-- 25
SELECT nome_genero, nome_livro, isbn_livro, nome_editora, contato_editora, email_editora FROM genero
INNER JOIN livro ON id_genero = fk_genero_livro
INNER JOIN editora ON fk_editora_livro = id_editora WHERE nome_genero = "Romance";

-- 26
SELECT nome_autor, cpf_autor, nome_genero FROM autor 
INNER JOIN genero ON nome_genero = "Infantil";

-- 27
CREATE VIEW livro_Editora as SELECT nome_livro, isbn_livro, dt_lancamento_livro, nome_editora FROM livro
INNER JOIN editora ON fk_editora_livro = id_editora;

-- 28
CREATE VIEW livro_Valor_Editora as SELECT nome_livro, preco_livro, nome_editora FROM livro
INNER JOIN editora ON fk_editora_livro = id_editora;

-- 29
CREATE VIEW Editora_com_desconto as SELECT nome_editora, nome_livro, preco_livro, (preco_livro - (preco_livro * 0.3)) as Preco_com_desconto FROM editora
INNER JOIN livro ON id_editora = fk_editora_livro WHERE nome_editora = "Abril";

-- 30
SHOW FULL TABLES IN db_biblioteca WHERE TABLE_TYPE LIKE 'VIEW';