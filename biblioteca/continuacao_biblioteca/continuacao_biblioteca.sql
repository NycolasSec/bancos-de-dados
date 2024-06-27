/* Lógico_1: */

CREATE TABLE livro (
    id_livro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_livro VARCHAR(120) UNIQUE NOT NULL,
    estoque_livro INT,
    fk_editora_id_editora INT
);

CREATE TABLE autor (
    id_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_autor VARCHAR(120),
    dt_nascimento_autor DATE,
    nacionalidade_autor VARCHAR(50),
    matricula_autor INT UNIQUE
);

CREATE TABLE editora (
    id_editora INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_editora VARCHAR(120)
);

CREATE TABLE livro_autor (
	id_livro_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_livro_id_livro INT,
    fk_autor_id_autor INT
);
 
ALTER TABLE livro ADD CONSTRAINT fk_editora
    FOREIGN KEY (fk_editora_id_editora)
    REFERENCES editora (id_editora)
    ON DELETE CASCADE;
 
ALTER TABLE livro_autor ADD CONSTRAINT fk_livro
    FOREIGN KEY (fk_livro_id_livro)
    REFERENCES livro (id_livro)
    ON DELETE RESTRICT;
 
ALTER TABLE livro_autor ADD CONSTRAINT FK_autor
    FOREIGN KEY (fk_autor_id_autor)
    REFERENCES autor (id_autor)
    ON DELETE RESTRICT;
    
    