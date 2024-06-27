-- Active: 1709576080714@@127.0.0.1@3306@db_filmes
DROP DATABASE db_filmes;

CREATE DATABASE db_filmes;

USE db_filmes;

CREATE TABLE filme(
    id_filme INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ano_filme YEAR NOT NULL,
    titulo_filme VARCHAR(120) NOT NULL UNIQUE,
    avaliacao_filme TEXT,
    classificacao_filme ENUM("LIVRE", "10", "12", "14", "16", "18"),
    genero_filme ENUM("ação", "aventura", "comédia","romance", "terror") NOT NULL
);

CREATE TABLE filmeBackupDelete(
    id_filmeBackupDelete INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ano_filmeBackupDelete YEAR NOT NULL,
    titulo_filmeBackupDelete VARCHAR(120) NOT NULL UNIQUE,
    avaliacao_filmeBackupDelete TEXT,
    classificacao_filmeBackupDelete ENUM("LIVRE", "10", "12", "14", "16", "18"),
    genero_filmeBackupDelete ENUM("ação", "aventura", "comédia","romance", "terror") NOT NULL
);

CREATE TABLE ator(
    id_ator INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_ator VARCHAR(120) NOT NULL UNIQUE,
    sexo_ator ENUM("f", "m") NOT NULL
);

CREATE TABLE atorBackupDelete(
    id_atorBackupDelete INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_atorBackupDelete VARCHAR(120) NOT NULL UNIQUE,
    sexo_atorBackupDelete ENUM("f", "m") NOT NULL
);

CREATE TABLE elenco(
    id_elenco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_ator_elenco INT NOT NULL,
    fk_filme_elenco INT NOT NULL
);

CREATE TABLE elencoBackupInsert(
    id_elencoBackupInsert INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fk_ator_elencoBackupInsert INT NOT NULL,
    fk_filme_elencoBackupInsert INT NOT NULL
);

ALTER TABLE elenco ADD CONSTRAINT FK_ator_elenco
    FOREIGN KEY (fk_ator_elenco)
    REFERENCES ator(id_ator) ON DELETE RESTRICT;

ALTER TABLE elenco ADD CONSTRAINT FK_filme_elenco
    FOREIGN KEY (fk_filme_elenco)
    REFERENCES filme(id_filme) ON DELETE RESTRICT;


-- TRIGGERS
DELIMITER //

CREATE TRIGGER insert_on_elenco
AFTER INSERT ON elenco
FOR EACH ROW
BEGIN
INSERT INTO elencoBackupInsert VALUES(null, NEW.fk_ator_elenco,NEW.fk_filme_elenco);
END //

CREATE TRIGGER delete_on_ator
BEFORE DELETE ON ator
FOR EACH ROW
BEGIN
INSERT INTO atorBackupDelete VALUES(null,OLD.nome_ator, OLD.sexo_ator);
END //

CREATE TRIGGER delete_on_filme
BEFORE DELETE ON filme
FOR EACH ROW
BEGIN
INSERT INTO filmeBackupDelete VALUES(null, OLD.ano_filme, OLD.titulo_filme, OLD.avaliacao_filme, OLD.classificacao_filme, OLD.genero_filme);
END //

DELIMITER ;
-- TRIGGERS


-- INSERTS 
INSERT into filme(ano_filme, titulo_filme, avaliacao_filme, classificacao_filme, genero_filme) VALUES 
    ("1972", "O Poderoso Chefão", "9.2", "14", "drama"),
    ("1994", "Um Sonho de Liberdade", "9.3", "16", "drama"),
    ("2008", "Batman: O Cavaleiro das Trevas", "9.0", "12", "ação"),
    ("2001", "O Senhor dos Anéis: A Sociedade do Anel", "8.9", "12", "aventura"),
    ("1994", "Forrest Gump: O Contador de Histórias", "8.8", "14", "drama"),
    ("2002", "O Senhor dos Anéis: As Duas Torres", "88.8", "12", "aventura"),
    ("1980", "Star Wars: Episódio V - O Império Contra-Ataca", "8.7", "LIVRE", "aventura"),
    ("1999", "Matrix", "8.7", "14", "ação"),
    ("2014", "Interestelar", "8.7", "10", "drama"),
    ("1985", "De Volta para o Futuro", "8.5", "LIVRE", "ação");

INSERT INTO ator(nome_ator, sexo_ator) VALUES
    ("Marlon Brando", "m"),("Al Pacino", "m"),("James Caan", "m"),("Diane Keaton", "f"),
    ("Morgan Freeman", "m"),("Tim Robbins", "m"),("Bob Gunton", "m"),("Willian Sadler", "m"),
    ("Christian Bale", "m"),("Heath Ledger", "m"),("Aaron Eckhart", "m"),("Michael Caine", "m"),
    ("Elijah Wood", "m"),("Ian McKellen", "m"),("Orlando Bloom", "m"),("Sean Bean", "m"),
    ("Tom Hanks", "m"),("Robin Wright", "f"),("Gary Sinise", "m"),("Sally Field", "f"),
    ("Viggo Mortensen", "m"),
    ("Mark Hamill", "m"),("Harrison Ford", "m"),("Carrie Fisher", "f"),("Billy Dee Williams", "m"),
    ("Keanu Reeves", "m"),("Laurence Fishburne", "m"),("Carrie-Anne Moss", "f"),("Hugo Weaving", "m"),
    ("Matthew McConaughey", "m"),("Anne Hathaway", "f"),("Jessica Chastain", "f"),("Mackenzie Foy", "f"),
    ("Michael J. Fox", "m"),("Christopher Lloyd", "m"),("Lea Thompson", "f"),("Crispin Glover", "m");

INSERT INTO elenco (fk_ator_elenco, fk_filme_elenco) VALUES
    (1,1),(2,1),(3,1),(4,1),
    (5,2),(6,2),(7,2),(8,2),
    (9,3),(10,3),(11,3),(12,3),
    (13,4),(14,4),(15,4),(16,4),
    (17,5),(18,5),(19,5),(20,5),
    (21,6),
    (22,7),(23,7),(24,7),(25,7),
    (26,8),(27,8),(28,8),(29,8),
    (30,9),(31,9),(32,9),(33,9),
    (34,10),(35,10),(36,10),(37,10);
-- INSERTS 


-- VIEWS
CREATE VIEW atorFilme AS SELECT nome_ator, titulo_filme FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme;
SELECT * FROM atorfilme;

CREATE VIEW qtdAtorSexo AS SELECT COUNT(nome_ator) AS quantidade, sexo_ator AS sexo  FROM ator GROUP BY sexo_ator;
SELECT * FROM qtdatorsexo;

CREATE VIEW qtdAtorGeneroAventura AS SELECT genero_filme, COUNT(nome_ator) FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme
 WHERE genero_filme = "aventura" GROUP BY genero_filme;
SELECT * FROM qtdatorgeneroAventura;
-- VIEWS


-- QUERIES
-- 1 - Selecione todos os atores
SELECT nome_ator FROM ator;

-- 2 - Selecione todos os filmes
SELECT titulo_filme FROM filme;

-- 3 - Selecione todos os filmes e seu ano de lancamento que foram gravados entre 1999 e 2005
SELECT titulo_filme, ano_filme FROM filme WHERE ano_filme BETWEEN "1999" AND "2005";

-- 4 Selecione todos os atores e seu sexo do sexo masculino
SELECT nome_ator, sexo_ator FROM ator WHERE sexo_ator = 'm';

-- 5 Selecione todos os atores e seu sexo do sexo feminino
SELECT nome_ator, sexo_ator FROM ator WHERE sexo_ator = 'f';

-- 6 Retorne a quantidade de atores agrupada por sexo
SELECT COUNT(nome_ator) AS quantidade, sexo_ator AS sexo  FROM ator GROUP BY sexo_ator;

-- 7 - Retorne todos os atores e seus respesctivos filmes.
SELECT nome_ator, titulo_filme FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme;

-- 8 - Retorne os atores, seus respesctivos filmes e data de lançamento do filme dos filmes lançados entre 1998 e 2010.
SELECT nome_ator, titulo_filme, ano_filme FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme
WHERE ano_filme BETWEEN "1998" AND "2010";

-- 9 - Selecione os atores do sexo feminino e seus filmes;
SELECT nome_ator, titulo_filme FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme
WHERE sexo_ator = 'f';

-- 10 - Selecione os atores do sexo masculino que fizeram filmes de aventura e seus filmes
SELECT nome_ator, titulo_filme FROM elenco
INNER JOIN ator ON fk_ator_elenco = id_ator
INNER JOIN filme ON fk_filme_elenco = id_filme
WHERE genero_filme = 'aventura' AND sexo_ator = 'm';
-- QUERIES


-- Test TRIGGERS
SELECT * FROM elencobackupinsert;


SELECT * FROM filme;
DELETE FROM filme WHERE id_filme = 2;
SELECT * FROM filmebackupdelete;


DELETE FROM ator WHERE id_ator = 2;
SELECT * FROM atorbackupdelete;
-- Test TRIGGERS
