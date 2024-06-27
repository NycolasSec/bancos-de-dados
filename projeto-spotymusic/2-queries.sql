-- Active: 1711041625749@@127.0.0.1@3306@db_spotymusic
USE db_spotymusic;

-- -- -- -- --
-- 1
SELECT nome_albun FROM albun;

-- 2
SELECT nome_artista FROM artista;

-- 3
SELECT nome_compositor FROM compositor;

-- 4
SELECT nome_genero FROM genero;

-- 5
SELECT nome_musica, duracao_musica FROM musica ORDER BY nome_musica;

-- 6
SELECT nome_playlist FROM playlist;

-- -- -- -- --


-- -- -- -- --
-- 7
SELECT COUNT(nome_albun) AS qtd_albun FROM albun;

-- 8
SELECT COUNT(nome_artista) AS qtd_artista FROM artista;

-- 9
SELECT COUNT(nome_compositor) AS qtd_compositor FROM compositor;

-- 10
SELECT COUNT(nome_genero) AS qtd_genero FROM genero;

-- 11
SELECT COUNT(nome_musica) AS qtd_musica FROM musica;

-- 12
SELECT COUNT(nome_playlist) AS qtd_playlist FROM playlist;

-- 13
SELECT COUNT(nome_musica) AS qtd_musicaEmPlaylist FROM musicaplaylist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica;
-- -- -- -- --


-- -- -- -- --
-- 14
SELECT nome_albun, COUNT(id_musica) FROM albun
INNER JOIN musica ON fk_albun_musica = id_albun GROUP BY nome_albun;

-- 15
SELECT nome_artista, COUNT(id_musica) FROM artista
INNER JOIN musica ON fk_albun_musica = id_artista GROUP BY nome_artista;

-- 16
SELECT nome_compositor, COUNT(id_musica) FROM compositor
INNER JOIN musica ON fk_compositor_musica = id_compositor GROUP BY nome_compositor;

-- 17
SELECT nome_genero, COUNT(id_musica) FROM genero
INNER JOIN musica ON fk_genero_musica = id_genero GROUP BY nome_genero;

-- 18
SELECT nome_playlist, COUNT(id_musica) FROM musicaplaylist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica
INNER JOIN playlist ON `fk_playlist_musicaPlaylist` = id_playlist GROUP BY nome_playlist;
-- -- -- -- --


-- -- -- -- --
-- 19
SELECT nome_albun, nome_musica FROM albun
INNER JOIN musica ON fk_albun_musica = id_albun;

-- 20
SELECT nome_artista, nome_musica FROM artista
INNER JOIN musica ON fk_albun_musica = id_artista;

-- 21
SELECT nome_compositor, nome_musica FROM compositor
INNER JOIN musica ON fk_compositor_musica = id_compositor;

-- 22
SELECT nome_genero, nome_musica FROM genero
INNER JOIN musica ON fk_genero_musica = id_genero ORDER BY nome_musica;

-- 23
SELECT nome_musica, nome_playlist FROM musicaplaylist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica
INNER JOIN playlist ON `fk_playlist_musicaPlaylist` = id_playlist;
-- -- -- -- --


-- -- -- -- --
-- 24
SELECT nome_albun, nome_genero from albun
lEFT JOIN artista ON fk_artista_albun = id_artista
LEFT JOIN genero ON fk_genero_artista = id_genero;

-- 25
SELECT nome_artista, nome_genero from artista
LEFT JOIN genero ON fk_genero_artista = id_genero;

-- 26
SELECT nome_compositor, nome_genero from compositor
LEFT JOIN genero ON fk_genero_compositor= id_genero;

-- 27
SELECT nome_playlist,nome_musica, nome_genero FROM playlist
INNER JOIN musicaplaylist ON `fk_playlist_musicaPlaylist` = id_playlist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica
INNER JOIN genero ON fk_genero_musica = id_genero;

-- 27
SELECT nome_playlist,nome_musica, nome_genero FROM playlist
INNER JOIN musicaplaylist ON `fk_playlist_musicaPlaylist` = id_playlist
INNER JOIN musica ON `fk_musica_musicaPlaylist` = id_musica
INNER JOIN genero ON fk_genero_musica = id_genero
WHERE duracao_musica BETWEEN "00:03:00" AND "00:04:00";
-- -- -- -- --


-- -- -- -- --
-- 28
SELECT nome_musica, duracao_musica FROM musica WHERE duracao_musica BETWEEN "00:03:00" AND "00:04:00";

-- 29
SELECT nome_musica, duracao_musica FROM musica WHERE duracao_musica < "00:03:00";

-- 30
SELECT nome_musica, nome_genero, duracao_musica FROM musica
INNER JOIN genero ON fk_genero_musica = id_genero
WHERE duracao_musica BETWEEN "00:04:00" AND "00:08:00";
-- -- -- -- --