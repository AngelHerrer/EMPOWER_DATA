-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: escuela
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_alumnos`
--

DROP TABLE IF EXISTS `t_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_alumnos` (
  `id_t_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `ap_paterno` varchar(80) DEFAULT NULL,
  `ap_materno` varchar(80) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_t_usuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_alumnos`
--

LOCK TABLES `t_alumnos` WRITE;
/*!40000 ALTER TABLE `t_alumnos` DISABLE KEYS */;
INSERT INTO `t_alumnos` VALUES (1,'John','Dow','Down',1),(2,'angel','herrera','dominguez',NULL);
/*!40000 ALTER TABLE `t_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_calificaciones`
--

DROP TABLE IF EXISTS `t_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_calificaciones` (
  `id_t_calificaciones` int(11) NOT NULL AUTO_INCREMENT,
  `id_t_materias` int(11) NOT NULL,
  `id_t_usuarios` int(11) NOT NULL,
  `calificacion` decimal(10,2) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_t_calificaciones`),
  KEY `id_t_materias` (`id_t_materias`),
  CONSTRAINT `t_calificaciones_ibfk_1` FOREIGN KEY (`id_t_materias`) REFERENCES `t_materias` (`id_t_materias`),
  CONSTRAINT `t_calificaciones_ibfk_2` FOREIGN KEY (`id_t_materias`) REFERENCES `t_materias` (`id_t_materias`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_calificaciones`
--

LOCK TABLES `t_calificaciones` WRITE;
/*!40000 ALTER TABLE `t_calificaciones` DISABLE KEYS */;
INSERT INTO `t_calificaciones` VALUES (1,1,1,10.00,'2018-08-08','2018-08-08 20:32:51','2018-08-08 20:32:51'),(2,2,2,9.00,'2018-08-08','2018-08-08 20:33:27','2018-08-08 20:33:27'),(3,3,2,9.00,'2018-08-08','2018-08-08 20:43:18','2018-08-08 20:43:18');
/*!40000 ALTER TABLE `t_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_materias`
--

DROP TABLE IF EXISTS `t_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_materias` (
  `id_t_materias` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `activo` int(1) DEFAULT NULL,
  PRIMARY KEY (`id_t_materias`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_materias`
--

LOCK TABLES `t_materias` WRITE;
/*!40000 ALTER TABLE `t_materias` DISABLE KEYS */;
INSERT INTO `t_materias` VALUES (1,'matematicas',1),(2,'programacion I',1),(3,'ingenieria de sofware',1);
/*!40000 ALTER TABLE `t_materias` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-08  18:05:18
