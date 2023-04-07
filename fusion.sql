CREATE DATABASE  IF NOT EXISTS `fusion_games` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fusion_games`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fusion_games
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `game_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`,`user_id`),
  KEY `FK709eickf3kc0dujx3ub9i7btf` (`user_id`),
  CONSTRAINT `FK709eickf3kc0dujx3ub9i7btf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKs3y8sdba99dkygcy2vp5mowyl` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` varchar(255) NOT NULL,
  `type` smallint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bnat7xdgvnaq91v9lorohxh27` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES ('c0a80105-8728-175f-8187-286780460000',0),('c0a80105-8728-175f-8187-286780c00002',1),('c0a80106-872f-1d58-8187-2f7da9650000',2),('c0a80105-8728-175f-8187-286780b30001',3);
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `developer` varchar(255) NOT NULL,
  `gameFileUrl` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `net_price` double NOT NULL,
  `pictureUrl` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `discount_id` varchar(255) DEFAULT NULL,
  `minimum_spec_id` varchar(255) NOT NULL,
  `recommended_spec_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7n612t34biop6sble29mloas2` (`gameFileUrl`),
  UNIQUE KEY `UK_dp39yy9j9cn10v9vhyr2j1uaa` (`name`),
  UNIQUE KEY `UK_sdi7m2p0c1hldmqp77yvubg4d` (`pictureUrl`),
  KEY `FKekrja0x509l3d72o8q8ojjjmi` (`discount_id`),
  KEY `FKtfna87dqnhx4tsaboj3dvbtpx` (`minimum_spec_id`),
  KEY `FK77ccfis96ev8r2kv0xugixsga` (`recommended_spec_id`),
  CONSTRAINT `FK77ccfis96ev8r2kv0xugixsga` FOREIGN KEY (`recommended_spec_id`) REFERENCES `gamespec` (`id`),
  CONSTRAINT `FKekrja0x509l3d72o8q8ojjjmi` FOREIGN KEY (`discount_id`) REFERENCES `discounts` (`id`),
  CONSTRAINT `FKtfna87dqnhx4tsaboj3dvbtpx` FOREIGN KEY (`minimum_spec_id`) REFERENCES `gamespec` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_genres`
--

DROP TABLE IF EXISTS `games_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games_genres` (
  `games_id` varchar(255) NOT NULL,
  `genres_id` varchar(255) NOT NULL,
  PRIMARY KEY (`games_id`,`genres_id`),
  KEY `FKa2f1qff6dc81smb1ch8kye7pt` (`genres_id`),
  CONSTRAINT `FKa2f1qff6dc81smb1ch8kye7pt` FOREIGN KEY (`genres_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `FKimvysyqycc8jd84ljmd7gv6fy` FOREIGN KEY (`games_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_genres`
--

LOCK TABLES `games_genres` WRITE;
/*!40000 ALTER TABLE `games_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamespec`
--

DROP TABLE IF EXISTS `gamespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gamespec` (
  `id` varchar(255) NOT NULL,
  `dx_version` int DEFAULT NULL,
  `graphics_card` varchar(255) DEFAULT NULL,
  `memory` int DEFAULT NULL,
  `processor` varchar(255) DEFAULT NULL,
  `storage` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamespec`
--

LOCK TABLES `gamespec` WRITE;
/*!40000 ALTER TABLE `gamespec` DISABLE KEYS */;
/*!40000 ALTER TABLE `gamespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s2mpyuc751lwbr5f12asnw8bl` (`genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES ('c0a80105-8728-175f-8187-286780f20006','ACTION'),('c0a80105-8728-175f-8187-2867812e000b','ADVENTURE'),('c0a80105-8728-175f-8187-28678122000a','FIGHTING'),('c0a80105-8728-175f-8187-286781170009','HORROR'),('c0a80105-8728-175f-8187-2867810b0008','MMO'),('c0a80105-8728-175f-8187-2867813a000c','NARRATION'),('c0a80105-8728-175f-8187-28678145000d','OPENWORLD'),('c0a80105-8728-175f-8187-286781000007','PUZZLE');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library` (
  `game_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`,`user_id`),
  KEY `FK7wjl27o7bpq397tyneve3vwl2` (`user_id`),
  CONSTRAINT `FK3kpt4pemf9g6f2vo8viqe90mc` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `FK7wjl27o7bpq397tyneve3vwl2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_games`
--

DROP TABLE IF EXISTS `ordered_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_games` (
  `game_id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`,`order_id`),
  KEY `FKicrxku2p7p38camcr4gkt3qru` (`order_id`),
  CONSTRAINT `FK4lo1qtc7qb0qisdbnldfjl95a` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  CONSTRAINT `FKicrxku2p7p38camcr4gkt3qru` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_games`
--

LOCK TABLES `ordered_games` WRITE;
/*!40000 ALTER TABLE `ordered_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `total_price` double NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms`
--

DROP TABLE IF EXISTS `platforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms` (
  `id` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1j5p2a2tqfmy7uxi3w2wwxubt` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms`
--

LOCK TABLES `platforms` WRITE;
/*!40000 ALTER TABLE `platforms` DISABLE KEYS */;
INSERT INTO `platforms` VALUES ('c0a80105-8728-175f-8187-286780cd0003','LINUX'),('c0a80105-8728-175f-8187-286780da0004','WINDOWS'),('c0a80105-8728-175f-8187-286780e60005','XBOX');
/*!40000 ALTER TABLE `platforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platforms_games`
--

DROP TABLE IF EXISTS `platforms_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platforms_games` (
  `game_id` varchar(255) NOT NULL,
  `platform_id` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`,`platform_id`),
  KEY `FKlcgpb10sl2321wm5pwfpi563b` (`platform_id`),
  CONSTRAINT `FKlcgpb10sl2321wm5pwfpi563b` FOREIGN KEY (`platform_id`) REFERENCES `platforms` (`id`),
  CONSTRAINT `FKnj3rlo72b4p894nni5qr6gnj3` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platforms_games`
--

LOCK TABLES `platforms_games` WRITE;
/*!40000 ALTER TABLE `platforms_games` DISABLE KEYS */;
/*!40000 ALTER TABLE `platforms_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `country` varchar(255) NOT NULL,
  `credit_Limit` double DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `isAdmin` bit(1) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_70jmct5ej765l57mlcrdhxn1c` (`phonenumber`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('c0a80105-8728-175f-8187-286d50240015','1996-10-14','EG',0,'khaled@gmail.com','Khaled','male',_binary '','Hisham','U5tPUaxVYA65PbTwqWBmiSaNNk+OXFlQaK86vwufjXA=','01278158298','lmaTG9765wLrLIb/sk1XYR90u1+wtXGi','khaledhisham'),('c0a80106-872f-104d-8187-2fb31f120000','2000-09-15','EG',0,'rahma@gmail.com','Rahma','female',_binary '\0','Mustafa','a86xm7WgDLQcLOFr4nIID0iL9a5p4ArmubGTphzKQL8=','01069280098','8ufbMiACLwK+t29HoQ7sQNzEocpdAGOT','rahmamustafa');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish_items`
--

DROP TABLE IF EXISTS `wish_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_items` (
  `game_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`game_id`,`user_id`),
  KEY `FKmvue6977na4a3mja9u45wxgib` (`user_id`),
  CONSTRAINT `FKmvue6977na4a3mja9u45wxgib` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKr48tcvgpkbflymi5wahuvpmhl` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_items`
--

LOCK TABLES `wish_items` WRITE;
/*!40000 ALTER TABLE `wish_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-07 23:09:23
