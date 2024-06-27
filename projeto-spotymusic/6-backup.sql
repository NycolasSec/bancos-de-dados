-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_spotymusic
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albun`
--

DROP TABLE IF EXISTS `albun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albun` (
  `id_albun` int(11) NOT NULL AUTO_INCREMENT,
  `nome_albun` varchar(120) NOT NULL,
  `anoLancamento_albun` year(4) NOT NULL,
  `fk_artista_albun` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_albun`),
  UNIQUE KEY `nome_albun` (`nome_albun`),
  KEY `FK_artista_albun` (`fk_artista_albun`),
  CONSTRAINT `FK_artista_albun` FOREIGN KEY (`fk_artista_albun`) REFERENCES `artista` (`id_artista`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albun`
--

/*!40000 ALTER TABLE `albun` DISABLE KEYS */;
INSERT INTO `albun` VALUES (1,'Vagalume',2024,1),(2,'Renegado',2024,NULL),(3,'Volta pra mim',2024,3),(4,'Arco íris',2024,4),(5,'Anonimato',2024,5),(7,'Diante de mim',2024,NULL),(8,'Solteiro',2024,3),(9,'Tudo junto',2024,4),(10,'Eu e ela',2024,5);
/*!40000 ALTER TABLE `albun` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_albun_qtdGeral
BEFORE DELETE ON albun
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `nome_artista` varchar(120) NOT NULL,
  `fk_genero_artista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE KEY `nome_artista` (`nome_artista`),
  KEY `FK_genero_artista` (`fk_genero_artista`),
  CONSTRAINT `FK_genero_artista` FOREIGN KEY (`fk_genero_artista`) REFERENCES `genero` (`id_genero`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Nycolas Valval',NULL),(3,'Davi Santinho',3),(4,'Dassa Haifa',4),(5,'Andrea Novaes',5);
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_artista_qtdGeral
BEFORE DELETE ON artista
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compositor`
--

DROP TABLE IF EXISTS `compositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositor` (
  `id_compositor` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compositor` varchar(120) NOT NULL,
  `fk_genero_compositor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compositor`),
  KEY `FK_genero_compositor` (`fk_genero_compositor`),
  CONSTRAINT `FK_genero_compositor` FOREIGN KEY (`fk_genero_compositor`) REFERENCES `genero` (`id_genero`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositor`
--

/*!40000 ALTER TABLE `compositor` DISABLE KEYS */;
INSERT INTO `compositor` VALUES (1,'Jorge Abreu',NULL),(2,'Mario outo',2),(3,'Paulo Gomes da Silva',3),(4,'Paulo Miguel',4),(5,'Lucas da Silva',5),(7,'Thalles Medeiros',2),(8,'Lucas Amorin',3),(9,'Daniel Madureira',4),(10,'Rômulo da Silva',5);
/*!40000 ALTER TABLE `compositor` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_compositor_qtdGeral
BEFORE DELETE ON compositor
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nome_genero` varchar(50) NOT NULL,
  PRIMARY KEY (`id_genero`),
  UNIQUE KEY `nome_genero` (`nome_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (5,'blues'),(4,'bolsa nova'),(3,'forró'),(2,'sertanejo');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_genero_qtdGeral
BEFORE DELETE ON genero
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `musica`
--

DROP TABLE IF EXISTS `musica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musica` (
  `id_musica` int(11) NOT NULL AUTO_INCREMENT,
  `duracao_musica` time NOT NULL,
  `nome_musica` varchar(120) NOT NULL,
  `fk_compositor_musica` int(11) DEFAULT NULL,
  `fk_genero_musica` int(11) DEFAULT NULL,
  `fk_albun_musica` int(11) DEFAULT NULL,
  `fk_artista_musica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_musica`),
  UNIQUE KEY `nome_musica` (`nome_musica`),
  KEY `FK_compositor_musica` (`fk_compositor_musica`),
  KEY `FK_genero_musica` (`fk_genero_musica`),
  KEY `FK_albun_musica` (`fk_albun_musica`),
  KEY `FK_artista_musica` (`fk_artista_musica`),
  CONSTRAINT `FK_albun_musica` FOREIGN KEY (`fk_albun_musica`) REFERENCES `albun` (`id_albun`) ON DELETE SET NULL,
  CONSTRAINT `FK_artista_musica` FOREIGN KEY (`fk_artista_musica`) REFERENCES `artista` (`id_artista`) ON DELETE SET NULL,
  CONSTRAINT `FK_compositor_musica` FOREIGN KEY (`fk_compositor_musica`) REFERENCES `compositor` (`id_compositor`) ON DELETE SET NULL,
  CONSTRAINT `FK_genero_musica` FOREIGN KEY (`fk_genero_musica`) REFERENCES `genero` (`id_genero`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musica`
--

/*!40000 ALTER TABLE `musica` DISABLE KEYS */;
INSERT INTO `musica` VALUES (1,'00:06:34','Anunciação',1,NULL,1,1),(2,'00:06:34','Construção',1,NULL,1,1),(4,'00:02:34','Como Uma Onda',1,NULL,1,1),(5,'00:03:34','Amor I Love You',1,NULL,1,1),(6,'00:06:34','Como É Grande o Meu Amor Por Você',1,NULL,NULL,1),(7,'00:07:34','Como Nossos Pais',1,NULL,NULL,1),(8,'00:04:34','País Tropical',1,NULL,NULL,1),(9,'00:06:34','Malandro é Malandro e Mané é Mané',1,NULL,NULL,1),(10,'00:09:34','Da Lama Ao Caos',1,NULL,NULL,1),(11,'00:07:34','Eu Quero É Botar Meu Bloco Na Rua',2,2,2,NULL),(12,'00:01:34','Panis Et Circenses',2,2,2,NULL),(13,'00:04:34','Alegria, Alegria',2,2,2,NULL),(14,'00:02:34','O Mundo É Um Moinho',2,2,2,NULL),(15,'00:07:34','Garota de Ipanema',2,2,2,NULL),(16,'00:02:34','Trem das Onze',2,2,7,NULL),(17,'00:03:34','Sangue Latino',2,2,7,NULL),(18,'00:06:34','Foi Um Rio Que Passou em Minha Vida',2,2,7,NULL),(19,'00:07:34','Chega de Saudade',2,2,7,NULL),(20,'00:09:34','Asa Branca',2,2,7,NULL),(21,'00:01:34','O Trem Azul',3,3,3,3),(22,'00:03:34','Andar Com Fé',3,3,3,3),(23,'00:04:34','Pra Não Dizer Que Não Falei Das Flores',3,3,3,3),(24,'00:02:34','Marvada Pinga',3,3,3,3),(25,'00:08:34','Canção da América',3,3,3,3),(26,'00:09:34','Me Chama',3,3,8,3),(27,'00:07:34','Mistério do Planeta',3,3,8,3),(28,'00:06:34','Deixa Isso Pra Lá',3,3,8,3),(29,'00:04:34','Conversa de Botequim',3,3,8,3),(30,'00:02:34','Quem de Nós Dois',3,3,8,3),(31,'00:07:34','Fácil',4,4,4,4),(32,'00:09:34','O Mar',4,4,4,4),(33,'00:01:34','Segredos',4,4,4,4),(34,'00:03:34','Eu Te Devoro',4,4,4,4),(35,'00:04:34','Presente de Um Beija Flor',4,4,4,4),(36,'00:02:34','Inútil',4,4,9,4),(37,'00:04:34','Pérola Negra',4,4,9,4),(38,'00:06:34','Não Existe Amor Em SP',4,4,9,4),(39,'00:06:34','Diário de Um Detento',4,4,9,4),(40,'00:02:34','Metamorfose Ambulante',4,4,9,4),(41,'00:06:34','Primeiros Erros (Chove)',5,5,5,5),(42,'00:03:34','Gostava Tanto de Você',5,5,5,5),(43,'00:04:34','Na Rua, Na Chuva, Na Fazenda',5,5,5,5),(44,'00:08:34','Luar do Sertão',5,5,5,5),(45,'00:06:34','Ideologia',5,5,5,5),(46,'00:09:34','Planeta Água',5,5,10,5),(47,'00:03:34','A Flor e o Espinho',5,5,10,5),(48,'00:02:34','Envelheço Na Cidade',5,5,10,5),(49,'00:04:34','Olhar 43',5,5,10,5),(50,'00:03:34','Só Os Loucos Sabem',5,5,10,5),(51,'00:07:34','Sá Marina',NULL,NULL,NULL,1),(52,'00:07:34','Pra Você Guardei o Amor (part. Ana Cañas)',NULL,NULL,NULL,1),(53,'00:06:34','Alucinação',NULL,NULL,NULL,1),(54,'00:09:34','Garotos II (O Outro Lado)',NULL,NULL,NULL,1),(55,'00:00:34','O Segundo Sol',NULL,NULL,NULL,1),(56,'00:03:34','Chão de Estrelas',NULL,NULL,1,1),(57,'00:05:34','Maria Chiquinha',NULL,NULL,1,1),(58,'00:06:34','Devolva-Me',NULL,NULL,1,1),(59,'00:07:34','Com Mais de Trinta',NULL,NULL,1,1),(60,'00:03:34','Vapor Barato',NULL,NULL,1,1),(61,'00:04:34','Brasileirinho',7,2,7,NULL),(62,'00:09:34','Carcará',7,2,7,NULL),(63,'00:01:34','Borbulhas de Amor',7,2,7,NULL),(64,'00:04:34','Timidez',7,2,7,NULL),(65,'00:02:34','Ovelha Negra',7,2,7,NULL),(66,'00:03:34','Canta Canta, Minha Gente',7,2,2,NULL),(67,'00:06:34','Rua Augusta',7,2,2,NULL),(68,'00:04:34','Deixa a Vida Me Levar',7,2,2,NULL),(69,'00:09:34','A Dois Passos do Paraíso',7,2,2,NULL),(70,'00:08:34','Minha Namorada',7,2,2,NULL),(71,'00:04:34','Diz Que Fui Por Aí',8,3,8,3),(72,'00:06:34','Pais e Filhos',8,3,8,3),(73,'00:02:34','Meu Mundo Caiu',8,3,8,3),(74,'00:07:34','Último Romance',8,3,8,3),(75,'00:05:34','Fogo e Paixão',8,3,8,3),(76,'00:08:34','Tocando Em Frente',8,3,3,3),(77,'00:09:34','Paciência',8,3,3,3),(78,'00:03:34','Rindo à Toa',8,3,3,3),(79,'00:05:34','A Barata',8,3,3,3),(80,'00:04:34','Lenha',8,3,3,3),(81,'00:06:34','Pai',9,4,9,4),(82,'00:08:34','Por Você',9,4,9,4),(83,'00:02:34','Alma',9,4,9,4),(84,'00:04:34','Mulher de Fases',9,4,9,4),(85,'00:05:34','Mantenha o Respeito',9,4,9,4),(86,'00:03:34','Roots Bloody Roots',9,4,4,4),(87,'00:07:34','Até Quando?',9,4,4,4),(88,'00:09:34','Minha Alma (A Paz Que Eu Não Quero)',9,4,4,4),(89,'00:04:34','Velha Infância',9,4,4,4),(90,'00:06:34','Aonde Quer Que Eu Vá',9,4,4,4),(91,'00:03:34','A Noite do Meu Bem',10,5,10,5),(92,'00:07:34','Chão de Giz',10,5,10,5),(93,'00:06:34','Sutilmente',10,5,10,5),(94,'00:08:34','Camila Camila',10,5,10,5),(95,'00:05:34','Máscara',10,5,10,5),(96,'00:09:34','Somos Quem Podemos Ser',10,5,5,5),(97,'00:02:34','Parabéns da Xuxa',10,5,5,5),(98,'00:04:34','Menina Veneno',10,5,5,5),(99,'00:06:34','Pelados Em Santos',10,5,5,5),(100,'00:05:34','Whisky',10,5,5,5);
/*!40000 ALTER TABLE `musica` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_musica_qtdGeral
BEFORE DELETE ON musica
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `musicaplaylist`
--

DROP TABLE IF EXISTS `musicaplaylist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicaplaylist` (
  `id_musicaPlaylist` int(11) NOT NULL AUTO_INCREMENT,
  `fk_playlist_musicaPlaylist` int(11) DEFAULT NULL,
  `fk_musica_musicaPlaylist` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_musicaPlaylist`),
  KEY `FK_playlist_musicaPlaylist` (`fk_playlist_musicaPlaylist`),
  KEY `FK_musica_musicaPlaylist` (`fk_musica_musicaPlaylist`),
  CONSTRAINT `FK_musica_musicaPlaylist` FOREIGN KEY (`fk_musica_musicaPlaylist`) REFERENCES `musica` (`id_musica`) ON DELETE SET NULL,
  CONSTRAINT `FK_playlist_musicaPlaylist` FOREIGN KEY (`fk_playlist_musicaPlaylist`) REFERENCES `playlist` (`id_playlist`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicaplaylist`
--

/*!40000 ALTER TABLE `musicaplaylist` DISABLE KEYS */;
INSERT INTO `musicaplaylist` VALUES (1,1,37),(2,1,1),(3,1,28),(4,1,49),(5,1,81),(6,1,20),(7,1,15),(8,1,54),(9,1,46),(10,1,73),(11,NULL,73),(12,NULL,5),(13,NULL,59),(14,NULL,23),(15,NULL,72),(16,NULL,62),(17,NULL,32),(18,NULL,89),(19,NULL,30),(20,NULL,56),(21,3,70),(22,3,93),(23,3,28),(24,3,50),(25,3,14),(26,3,56),(27,3,59),(28,3,54),(29,3,41),(30,3,71),(31,5,5),(32,5,87),(33,5,100),(34,5,27),(35,5,37),(36,5,56),(37,5,38),(38,5,96),(39,5,2),(40,5,90),(41,6,93),(42,6,55),(43,6,15),(44,6,43),(45,6,30),(46,6,58),(47,6,17),(48,6,94),(49,6,77),(50,6,67),(51,8,24),(52,8,61),(53,8,76),(54,8,48),(55,8,14),(56,8,94),(57,8,91),(58,8,36),(59,8,12),(60,8,43),(61,7,31),(62,7,32),(63,7,33),(64,7,34),(65,7,35),(66,7,36),(67,7,37),(68,7,38),(69,7,39),(70,7,40);
/*!40000 ALTER TABLE `musicaplaylist` ENABLE KEYS */;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL AUTO_INCREMENT,
  `nome_playlist` varchar(120) NOT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Pra chorar'),(3,'Top Brasil'),(4,'Pra agitar na balada'),(5,'Top academia'),(6,'Volta pra ex'),(7,'Top bolsa nova'),(8,'As melhores de prima vera');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER del_playlist_qtdGeral
BEFORE DELETE ON playlist
FOR EACH ROW
BEGIN
INSERT INTO qtdGeral VALUES(null, (SELECT COUNT(id_albun) FROM albun), (SELECT COUNT(id_artista) FROM artista), (SELECT COUNT(id_compositor) FROM compositor), (SELECT COUNT(id_genero) FROM genero), (SELECT COUNT(id_musica) FROM musica), (SELECT COUNT(id_playlist) FROM playlist), null);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `qtdgeral`
--

DROP TABLE IF EXISTS `qtdgeral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qtdgeral` (
  `id_qtdGeral` int(11) NOT NULL AUTO_INCREMENT,
  `albun_qtdGeral` int(11) DEFAULT NULL,
  `artista_qtdGeral` int(11) DEFAULT NULL,
  `compositor_qtdGeral` int(11) DEFAULT NULL,
  `genero_qtdGeral` int(11) DEFAULT NULL,
  `musica_qtdGeral` int(11) DEFAULT NULL,
  `playlist_qtdGeral` int(11) DEFAULT NULL,
  `dt_qtdGeral` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_qtdGeral`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qtdgeral`
--

/*!40000 ALTER TABLE `qtdgeral` DISABLE KEYS */;
INSERT INTO `qtdgeral` VALUES (1,10,5,10,5,100,8,'2024-03-20 19:58:48'),(2,9,5,10,5,100,8,'2024-03-20 19:58:48'),(3,9,4,10,5,100,8,'2024-03-20 19:58:48'),(4,9,4,9,5,100,8,'2024-03-20 19:58:48'),(5,9,4,9,4,100,8,'2024-03-20 19:58:48'),(6,9,4,9,4,99,8,'2024-03-20 19:58:48');
/*!40000 ALTER TABLE `qtdgeral` ENABLE KEYS */;

--
-- Dumping routines for database 'db_spotymusic'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-20 17:06:04
