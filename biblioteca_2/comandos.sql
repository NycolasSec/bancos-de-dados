-- Active: 1706635174833@@127.0.0.1@3306@db_biblioteca_2
USE db_biblioteca_2;

DROP TABLE livro;

CREATE TABLE livro (id_livro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_livro VARCHAR(120) ,
uf_livro VARCHAR(2) ,
valor_livro DECIMAL(10,2) ,
num_pagina_livro INT ,
ano_publicacao_livro DATE ,
nome_editora VARCHAR(120) ,
nome_autor VARCHAR(120)  ,
sexo_autor VARCHAR(1) ) ;

DESC livro;

ALTER TABLE livro CHANGE sexo_autor sexo VARCHAR(1);

INSERT INTO livro VALUES
(null, "pequeno principe", "AC", 250, 456, "2012-11-19", "Inventada", "Mariana Leitão", "f"),
(null, "pequeno cão", "RJ", 280, 458, "2012-1-17", "Inventada", "Maria D.", "m"),
(null, "Pequena flor", "DF", 120, 123, "2022-5-17", "Lunar", "Mariana Leitão", "f"),
(null, "pequeno sol", "RJ", 45, 678, "2022-9-11", "Lunar", "Maria D.", "f"),
(null, "pequeno principecarro", "RJ", 355, 456, "2015-3-13", "Lunar", "Mario Cortela", "m"),
(null, "pequena lua", "DF", 230, 980, "2017-5-14", "Solar", "Mario Leite", "m"),
(null, "pequeno chao", "SP", 250, 365, "2012-6-15", "Solar", "Fernanda Sol", "f"),
(null, "A lua", "DF", 90, 876, "207-2-19", "Inventada", "Fernanda Sol", "f"),
(null, "O engma", "SP", 290, 789, "1980-1-18", "Lunar", "Mario Leite", "m"),
(null, "A jaqueta", "RJ", 450, 123, "1980-3-10", "Lunar", "Mario Leite", "m"),
(null, "A escuridao", "GO", 560, 456, "1960-5-14", "Arqueiro", "Leandra Silva", "f"),
(null, "O sol", "GO", 345, 387, "1958-2-16", "Arqueiro", "Leandra Silva", "f"),
(null, "A biblia", "MG", 345, 156, "1952-8-15", "Terra do nunca", "Junior Cesar", "m"),
(null, "A mudança", "MG", 3150, 974, "1972-5-11", "Terra do nunca", "Junior Cesar", "m"),
(null, "Mudancas", "GO", 150, 275, "1962-5-13", "Arqueiro", "Junior Cesar", "m"),
(null, "Ester", "MG", 150, 871, "1982-10-14", "Arqueiro", "Luiza Sonza", "f"),
(null, "O grande Egito", "DF", 340, 273, "1972-10-12", "Mar morto", "Nycolas Ramos", "m"),
(null, "A Mesopotâmia", "CE", 250, 198, "2005-11-18", "Mar morto", "Nycolas Ramos", "m"),
(null, "Os Hebreus", "MG", 340, 476, "2003-12-15", "Inventada", "Nycolas Ramos", "m"),
(null, "Crimeia", "CE", 255, 398, "2008-12-10", "Mar morto", "Luiza Sonza", "f"),
(null, "Zeus", "CE", 230, 145, "2005-10-16", "SENAI", "Luiza Sonza", "f"),
(null, "Hercules", "DF", 65, 356, "2004-11-2", "SENAI", "Joana Souza", "f"),
(null, "Perseu", "CE", 75, 982, "2001-8-2", "Testamento", "Joana Souza", "f"),
(null, "Euclides", "SP", 355, 137, "2010-2-5", "Testamento", "Mario Cortela", "m"),
(null, "Medusa", "DF", 90, 137, "2016-4-1", "SENAI", "Mariana Leitão", "f"),
(null, "Odin", "SP", 120, 547, "2014-7-4", "SENAI", "Mariana Leitão", "f"),
(null, "Thor", "SP", 355, 876, "2012-1-5", "Mundo Invertido", "Guga Queiroz", "m"),
(null, "Berseker", "RJ", 690, 573, "2019-9-3", "Mundo Invertido", "Mariana Leitão", "f"),
(null, "O grande Homen", "AC", 60, 254, "2016-3-9", "Terra Louca", "Guga Queiroz", "m"),
(null, "O segredo do amor", "AC", 180, 244, "2013-5-7", "Terra Louca", "Mariana Leitão", "f");

SELECT * FROM livro;

SELECT nome_livro, nome_editora FROM livro;

SELECT nome_livro, uf_livro FROM livro WHERE sexo = 'm';

SELECT nome_livro, num_pagina_livro FROM livro WHERE sexo = 'm';

SELECT valor_livro FROM livro WHERE uf_livro = 'SP';

SELECT nome_livro, ano_publicacao_livro FROM livro;

SELECT nome_autor, sexo, uf_livro FROM livro WHERE (uf_livro = 'SP' OR uf_livro = 'RJ') AND sexo = 'm';

SELECT count(nome_autor) FROM livro;

SELECT count(*) AS quantidade FROM livro ;

SELECT sexo,COUNT(sexo) AS quantidade FROM livro GROUP BY sexo;

SELECT uf_livro,COUNT(*) AS quantidade FROM livro GROUP BY uf_livro;

SELECT nome_livro, nome_autor, valor_livro FROM livro WHERE valor_livro >= 250;

SELECT SUM(valor_livro) AS ValorTotal from livro;

SELECT AVG(valor_livro) AS MediaPrecoLivro FROM livro;