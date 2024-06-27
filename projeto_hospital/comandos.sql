-- Active: 1709576080714@@127.0.0.1@3306@db_hospital
/* Logico: */

-- CRIACAO DO BANCO

DROP DATABASE IF EXISTS `db_hospital`;

CREATE DATABASE `db_hospital`;

USE `db_hospital`;

-- CRIACAO DO BANCO


-- CRIACAO DAS TABELAS

CREATE TABLE hospital (
    id_hospital INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_hospital VARCHAR(120) NOT NULL,
    cidade_hospital VARCHAR(120) NOT NULL
);

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_paciente VARCHAR(120) NOT NULL,
    sexo_paciente ENUM("m", "f") NOT NULL,
    email_paciente VARCHAR(120) UNIQUE NOT NULL,
    dt_nascimento_paciente DATE NOT NULL
);

CREATE TABLE pacienteBackupDelete (
    id_pacienteBackupDelete INT PRIMARY KEY NOT NULL,
    nome_pacienteBackupDelete VARCHAR(120) NOT NULL,
    sexo_pacienteBackupDelete ENUM("m", "f") NOT NULL,
    email_pacienteBackupDelete VARCHAR(120) UNIQUE NOT NULL,
    dt_nascimento_pacienteBackupDelete DATE NOT NULL
);

CREATE TABLE medico (
    id_medico INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_medico VARCHAR(120) NOT NULL,
    sexo_medico ENUM("m","f") NOT NULL,
    especialidade_medico VARCHAR(120) NOT NULL,
    fk_hospital_medico INT NOT NULL
);

CREATE TABLE medicoBackupDelete(
    id_medicoBackupDelete INT PRIMARY KEY NOT NULL,
    nome_medicoBackupDelete VARCHAR(120) NOT NULL,
    sexo_medicoBackupDelete ENUM("m","f") NOT NULL,
    especialidade_medicoBackupDelete VARCHAR(120) NOT NULL,
    fk_hospital_medicoBackupDelete INT NOT NULL
);

CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    diagnostico_consulta VARCHAR(255),
    dt_consulta DATETIME NOT NULL,
    fk_medico_consulta INT NOT NULL,
    fk_paciente_consulta INT NOT NULL
);

CREATE TABLE consultaBackupDelete (
    id_consulta INT PRIMARY KEY NOT NULL,
    diagnostico_consulta VARCHAR(255),
    dt_consulta DATETIME NOT NULL,
    fk_medico_consulta INT NOT NULL,
    fk_paciente_consulta INT NOT NULL
);

CREATE TABLE internacao (
    id_internacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    dt_entrada_internacao DATETIME NOT NULL,
    dt_saida_internacao DATETIME NOT NULL,
    fk_consulta_internacao INT NOT NULL
);

CREATE TABLE consultaComInternacao(
    id_consultaComInternacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fk_consulta_consultaComInternacao INT UNIQUE NOT NULL,
    fk_internacao_consultaComInternacao INT UNIQUE NOT NULL,
    medico_consultaComInternacao VARCHAR(120) NOT NULL,
    paciente_consultaComInternacao VARCHAR(120) NOT NULL
);

-- CRIACAO DAS TABELAS


-- ALTER PARA AS CHAVES ESTRANGEIRAS

ALTER TABLE medico ADD CONSTRAINT FK_hospital_medico
    FOREIGN KEY (fk_hospital_medico)
    REFERENCES hospital (id_hospital)
    ON DELETE CASCADE;

ALTER TABLE consulta ADD CONSTRAINT FK_medico_consulta
    FOREIGN KEY (fk_medico_consulta)
    REFERENCES medico (id_medico)
    ON DELETE CASCADE;

ALTER TABLE consulta ADD CONSTRAINT FK_paciente_consulta
    FOREIGN KEY (fk_paciente_consulta)
    REFERENCES paciente (id_paciente)
    ON DELETE CASCADE;

ALTER TABLE internacao ADD CONSTRAINT FK_consulta_internacao
    FOREIGN KEY (fk_consulta_internacao)
    REFERENCES consulta (id_consulta)
    ON DELETE CASCADE;

-- ALTER PARA AS CHAVES ESTRANGEIRAS


-- TRIGGERS

DELIMITER //

-- consulta_com_internacao
CREATE TRIGGER consulta_com_internacao
AFTER INSERT ON `internacao`
FOR EACH ROW
BEGIN
INSERT INTO consultaComInternacao VALUES(null, NEW.fk_consulta_internacao, NEW.id_internacao,
(
    SELECT nome_medico FROM consulta
    INNER JOIN medico ON fk_medico_consulta = id_medico
    WHERE id_consulta = NEW.fk_consulta_internacao
),
(
    SELECT nome_paciente FROM consulta
    INNER JOIN paciente ON fk_paciente_consulta = id_paciente
    WHERE id_consulta = NEW.fk_consulta_internacao
    )
);
END //

-- delete_on_medico
CREATE TRIGGER delete_on_medico
BEFORE DELETE ON medico
FOR EACH ROW
BEGIN
INSERT INTO medicoBackupDelete VALUES(OLD.id_medico, OLD.nome_medico, OLD.sexo_medico, OLD.especialidade_medico, OLD.fk_hospital_medico);
END //

-- delete_on_paciente
CREATE TRIGGER delete_on_paciente
BEFORE DELETE ON paciente
FOR EACH ROW
BEGIN
INSERT INTO pacienteBackupDelete VALUES(OLD.id_paciente, OLD.nome_paciente, OLD.sexo_paciente, OLD.email_paciente, OLD.dt_nascimento_paciente);
END //

-- delete_on_consulta
CREATE TRIGGER delete_on_consulta
BEFORE DELETE ON consulta
FOR EACH ROW
BEGIN
INSERT INTO consultaBackupDelete VALUES(OLD.id_consulta, OLD.diagnostico_consulta, OLD.dt_consulta, OLD.fk_medico_consulta, OLD.fk_paciente_consulta);
END //

DELIMITER ;

-- TRIGGERS


-- INSERCOES

-- PACIENTES
INSERT INTO paciente VALUES
(null, "Nycolas Ramos", 'm', "nycolas@gmailcom", "1983-09-09"),
(null, "Francisco Amaral", 'm', "franciscoamaral@gmailcom", "1996-07-16"),
(null, "Aline Sousa", 'f', "aline_sousa@gmailcom", "1983-09-09"),
(null, "João Alexandre", 'm', "joaoalexandre@gmailcom", "2003-12-19"),
(null, "Adriana Júnior", 'f', "adrianajunior@gmailcom", "1991-01-06"),
(null, "Maria Clara", 'f', "mariaclara@gmailcom", "1992-04-13"),
(null, "Antônio Leite", 'm', "antonioleite@gmailcom", "1998-03-15"),
(null, "Paulo de Tarso", 'm', "paulodetarso@gmailcom", "1999-09-10"),
(null, "Ana Aparecida", 'f', "anaaparecida@gmailcom", "1994-05-19"),
(null, "Francisca Calota", 'f', "franciscacalota@gmailcom", "1993-02-09"),
(null, "Carlos de Sousa", 'm', "carlosdesousa@gmailcom", "1992-03-12"),
(null, "Juliana de Sousa", 'f', "julianadesousa@gmailcom", "1995-04-03"),
(null, "José Alves", 'm', "josealves@gmailcom", "2001-10-12"),
(null, "Fernanda Joaquim", 'f', "fernandajoaquim@gmailcom", "1993-05-01"),
(null, "Camila Medeiros", 'f', "camilamedeiros@gmailcom", "1985-12-05");

-- HOSPITAL
INSERT INTO `hospital` VALUES(null, "Hospital São Pedro", "Santa Maria - DF");

-- MEDICO
INSERT INTO medico VALUES
(null, "João Alexandre", 'm', "cirurgia cardiovascular", 1),
(null, "Paulo de Tarso", 'm', "pediatria", 1),
(null, "Julha de Sousa", 'f', "neurologia", 1),
(null, "Maria Joaquim", 'f', "coloproctologia", 1),
(null, "Francisco Amaral", 'm', "imunologia", 1),
(null, "Jheniffer Aparecida", 'f', "demartologia", 1),
(null, "Atylas Ramos", 'm', "anestesiologia", 1),
(null, "Maria Clara", 'f', "patologia", 1),
(null, "Henrique de Sousa", 'm', "neurocirurgia", 1),
(null, "Aline Sousa", 'f', "cardiologia", 1),
(null, "Lucas Leite", 'm', "urologia", 1),
(null, "Camila Medeiros", 'f', "psiquiatria", 1),
(null, "Francisca Calota", 'f', "infectologia", 1),
(null, "Letícia Júnior", 'f', "cirurgia geral", 1),
(null, "Hadassa Haifa", 'f', "oftalmologia", 1);

-- CONSULTA
INSERT INTO consulta VALUES
(null, "Cirurgia de revascularização do miocárdio.", "2019-08-10 10:11:00", 1, 3),
(null, "Prevenção", "2019-07-10 14:17:00", 2, 12),
(null, "Distúrbios estrutural do sistema nervoso.", "2019-07-01 22:19:00", 3, 13),
(null, "Prevenção intestino grosso.", "2019-09-20 15:23:00", 4, 5),
(null, "Avaliação de imunidade.", "2019-04-20 08:14:00", 5, 10),
(null, "Infecção de pele.", "2019-04-11 19:11:00", 6, 11),
(null, "Dor crônica aguda.", "2020-03-20 12:03:00", 7, 8),
(null, "Aids", "2020-03-19 08:06:00", 8, 14),
(null, "Traumatismo craniano.", "2020-03-17 09:12:00", 9, 1),
(null, "Gordura no coração.", "2020-02-07 07:07:00", 10, 4),
(null, "Falha nos rins.", "2020-02-02 04:13:00", 11, 6),
(null, "Transtorno afetivo bipolar.", "2021-11-19 22:09:00", 12, 15),
(null, "Infecção hospitalar.", "2021-11-21 23:11:00", 13, 9),
(null, "Cirurgia Abdominal.", "2021-12-05 11:10:00", 14, 7),
(null, "Degeneração macular.", "2021-1-03 10:05:00", 15, 2);

-- INTERNAÇÃO
INSERT INTO internacao VALUES
(null, "2019-08-10 11:23:00", "2019-08-12 12:11:00", 1),
(null, "2019-07-01 23:45:00", "2019-07-12 10:09:00", 3),
(null, "2020-03-20 13:17:00", "2020-04-02 22:34:00", 7),
(null, "2020-02-02 05:34:00", "2020-02-15 13:45:00", 11),
(null, "2021-01-03 11:12:00", "2021-01-20 19:55:00", 15);

-- INSERCOES


-- TEST TRIGGERS

DELETE FROM medico WHERE id_medico = FLOOR(RAND() * ((SELECT COUNT(*) FROM consulta) + 1));
SELECT * FROM medicobackupdelete;


DELETE FROM paciente WHERE id_paciente = FLOOR(RAND() * ((SELECT COUNT(*) FROM consulta) + 1));
SELECT * FROM pacientebackupdelete;


DELETE FROM consulta WHERE id_consulta = FLOOR(RAND() * ((SELECT COUNT(*) FROM medico) + 1));
SELECT * FROM consultabackupdelete;

SELECT * FROM consultacominternacao;

-- TEST TRIGGERS


-- VIEWS

CREATE VIEW consultas AS
SELECT nome_medico, nome_paciente, diagnostico_consulta FROM consulta
INNER JOIN paciente ON fk_paciente_consulta = id_paciente
INNER JOIN medico ON fk_medico_consulta = id_medico;

CREATE VIEW especialidade_diagnostico AS
SELECT especialidade_medico, diagnostico_consulta FROM medico
INNER JOIN consulta ON id_medico = fk_medico_consulta;
;

CREATE VIEW paciente_internado  AS
SELECT nome_paciente AS Paciente, nome_medico AS Medico, diagnostico_consulta AS Diagnostico FROM internacao
INNER JOIN consulta ON fk_consulta_internacao = id_consulta
INNER JOIN paciente ON fk_paciente_consulta = id_paciente
INNER JOIN medico ON fk_medico_consulta = id_medico;

-- VIEWS


-- TEST VIEWS

SELECT * FROM consultas ;

SELECT * FROM especialidade_diagnostico;

SELECT * FROM paciente_internado;

-- TEST VIEWS


-- INSERTS

-- 1
SELECT nome_paciente, nome_medico FROM consulta
INNER JOIN medico ON id_medico = fk_medico_consulta
INNER JOIN paciente ON id_paciente = fk_paciente_consulta;

-- 2
SELECT nome_paciente, diagnostico_consulta FROM consulta
INNER JOIN paciente ON id_paciente = fk_paciente_consulta;

-- 3
SELECT nome_paciente, dt_nascimento_paciente FROM paciente WHERE YEAR(dt_nascimento_paciente) < "1990";

-- 4
SELECT nome_paciente FROM paciente ;

-- 5
SELECT nome_paciente, dt_nascimento_paciente FROM paciente WHERE YEAR(dt_nascimento_paciente) BETWEEN"1990" AND "2005";

-- 6
SELECT COUNT(*) AS quantidade_paciente FROM paciente;


-- 7
SELECT especialidade_medico, COUNT(*) FROM paciente
INNER JOIN consulta ON id_paciente = fk_paciente_consulta
INNER JOIN medico ON id_medico = fk_medico_consulta
GROUP BY especialidade_medico;

-- 8
SELECT COUNT(*) as qtd_internacao, diagnostico_consulta FROM internacao
INNER JOIN consulta ON id_consulta = fk_consulta_internacao
GROUP BY id_internacao;

-- 9
SELECT COUNT(especialidade_medico), especialidade_medico FROM medico
GROUP BY especialidade_medico;

-- 10
SELECT COUNT(id_consulta) AS qtd_consulta FROM consulta;


-- 11
SELECT nome_medico, diagnostico_consulta  FROM medico
INNER JOIN consulta ON id_medico = fk_medico_consulta
INNER JOIN internacao ON id_consulta = fk_consulta_internacao;

-- 12
SELECT nome_medico, especialidade_medico FROM medico;

-- 13
SELECT nome_medico, nome_paciente, dt_nascimento_paciente, dt_entrada_internacao FROM medico
INNER JOIN consulta ON id_medico = fk_medico_consulta
INNER JOIN internacao ON id_consulta = fk_consulta_internacao
INNER JOIN paciente ON id_paciente = fk_paciente_consulta;

-- 14
SELECT COUNT(id_medico), especialidade_medico FROM medico GROUP BY especialidade_medico;

-- 15
SELECT nome_medico, especialidade_medico FROM medico WHERE (especialidade_medico = "cardiologia" OR especialidade_medico = "pediatria") OR (especialidade_medico = "imunologia" OR especialidade_medico = "oftalmologia");


-- 16
SELECT id_consulta FROM consulta
INNER JOIN internacao ON id_consulta = fk_consulta_internacao;

-- 17
SELECT id_consulta,dt_consulta  FROM consulta;

-- 18
SELECT id_consulta,dt_entrada_internacao, dt_saida_internacao FROM consulta
INNER JOIN internacao ON id_consulta = fk_consulta_internacao
WHERE DATEDIFF(DATE(dt_saida_internacao), DATE(dt_entrada_internacao)) > 5;

-- 19
SELECT id_internacao FROM internacao;

-- 20
SELECT id_consulta,dt_entrada_internacao, dt_saida_internacao FROM consulta
INNER JOIN internacao ON id_consulta = fk_consulta_internacao
WHERE DATEDIFF(DATE(dt_saida_internacao), DATE(dt_entrada_internacao)) = 2;



