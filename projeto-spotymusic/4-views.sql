-- Active: 1711041625749@@127.0.0.1@3306@db_spotymusic
USE db_spotymusic;

-- TRIGGERS --- ---
CREATE VIEW artistaAlbun AS SELECT nome_albun, nome_artista FROM artista
INNER JOIN albun ON fk_artista_albun = id_artista;

CREATE VIEW musicaAlbun AS SELECT nome_musica, nome_albun FROM musica
INNER JOIN albun ON fk_albun_musica = id_albun;

CREATE VIEW musicaAlbunArtistaCompositor AS SELECT nome_musica, nome_albun, nome_artista, nome_compositor FROM musica
INNER JOIN albun ON fk_albun_musica = id_albun
INNER JOIN artista ON fk_artista_albun = id_artista
INNER JOIN compositor ON fk_compositor_musica = id_compositor;

CREATE VIEW nomeMusicaPlaylist AS SELECT nome_musica, nome_playlist FROM musicaplaylist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica
INNER JOIN playlist ON `fk_playlist_musicaPlaylist` = id_playlist;

CREATE VIEW artistaGenero AS SELECT nome_artista, nome_genero FROM artista
INNER JOIN genero ON fk_genero_artista = id_genero;
-- TRIGGERS --- ---


-- TEST TRIGGERS --- ---
SELECT * FROM artistaalbun;

SELECT * FROM musicaalbun;

SELECT * FROM musicaalbunartistacompositor;

SELECT * FROM nomeMusicaPlaylist;

SELECT * FROM artistaGenero;
-- TEST TRIGGERS --- ---
