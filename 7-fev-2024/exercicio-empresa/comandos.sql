-- Active: 1706635174833@@127.0.0.1@3306
CREATE DATABASE db_empresa
    DEFAULT CHARACTER SET = 'utf8mb4';

USE db_empresa;

-- CRIACAO DOS BANCOS
CREATE TABLE departamento(
    id_departamento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_departamento VARCHAR(120) NOT NULL,
    logradouro_departamento VARCHAR(150) NOT NULL
);

CREATE TABLE empregado(
    id_empregado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_empregado VARCHAR(120) NOT NULL,
    salario_empregado DECIMAL(10,2) NOT NULL,
    sexo_empregado VARCHAR(1) NOT NULL,
    fk_id_departamento_empregado INT NOT NULL,
    CONSTRAINT fk_departamento FOREIGN KEY (fk_id_departamento_empregado) REFERENCES departamento(id_departamento)
);


-- INSERCAO DOS DADOS
INSERT INTO departamento(nome_departamento,logradouro_departamento) VALUES
    ("Tecnologia", "Bloco A"),
    ("Esporte", "Bloco B"),
    ("RH", "Bloco C"),
    ("Administração", "Bloco D"),
    ("Informatica", "Bloco E"),
    ("Eletrica", "Bloco F"),
    ("Judicial", "Bloco G"),
    ("Segurança", "Bloco H"),
    ("Limpeza", "Bloco I"),
    ("Atendimento", "Bloco J")
;

INSERT INTO empregado(nome_empregado, salario_empregado, sexo_empregado, fk_id_departamento_empregado) VALUES
    ("Saulo de Tarso", 3400.00, "m", 1),
    ("Paulo César", 3560.00, "m", 9),
    ("Ana Catarina", 1450.00, "f", 3),
    ("João Pedro", 1550.00, "m", 4),
    ("Maria da Silva", 1250.00, "f", 2),
    ("Joana Costa", 1250.00, "f", 8),
    ("Mario Gonçalves", 3500.00, "m", 7),
    ("Leandra Vascaina", 3400.00, "f", 6),
    ("Virginia", 2500.00, "f", 5),
    ("Felca Robocop", 2800.00, "m", 10);

-- BUSCAS
SELECT nome_empregado, salario_empregado, logradouro_departamento, sexo_empregado FROM empregado 
INNER JOIN departamento ON fk_id_departamento_empregado = id_departamento WHERE sexo_empregado = "f";

SELECT nome_empregado,nome_departamento,  logradouro_departamento FROM empregado 
INNER JOIN departamento ON fk_id_departamento_empregado = id_departamento  WHERE nome_empregado = "Felca Robocop";