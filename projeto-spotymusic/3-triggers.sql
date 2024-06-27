-- Active: 1711041625749@@127.0.0.1@3306@db_spotymusic
USE db_spotymusic;

CREATE TABLE qtdGeral (
    id_qtdGeral INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    albun_qtdGeral INT,
    artista_qtdGeral INT,
    compositor_qtdGeral INT,
    genero_qtdGeral INT,
    musica_qtdGeral INT,
    playlist_qtdGeral INT,
    dt_qtdGeral timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);


DELIMITER //

CREATE TRIGGER del_albun_qtdGeral
BEFORE DELETE ON albun
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

CREATE TRIGGER del_artista_qtdGeral
BEFORE DELETE ON artista
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

CREATE TRIGGER del_compositor_qtdGeral
BEFORE DELETE ON compositor
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

CREATE TRIGGER del_genero_qtdGeral
BEFORE DELETE ON genero
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

CREATE TRIGGER del_musica_qtdGeral
BEFORE DELETE ON musica
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

CREATE TRIGGER del_playlist_qtdGeral
BEFORE DELETE ON playlist
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END //

DELIMITER ;

DELETE FROM albun WHERE id_albun = 6;
SELECT * FROM qtdgeral;

DELETE FROM artista WHERE id_artista = 2;
SELECT * FROM qtdgeral;

DELETE FROM compositor WHERE id_compositor = 6;
SELECT * FROM qtdgeral;

DELETE FROM genero WHERE id_genero = 1;
SELECT * FROM qtdgeral;

DELETE FROM musica WHERE id_musica = 3;
SELECT * FROM qtdgeral;

DELETE FROM playlist WHERE id_playlist = 2;
SELECT * FROM qtdgeral;
