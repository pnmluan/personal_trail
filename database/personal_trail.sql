-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: personal_trail
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `content` text,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `publish_date` datetime DEFAULT NULL,
  `clean_url` varchar(100) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clean_url_UNIQUE` (`clean_url`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Ligula Tristique Malesuada Venenatis Fermentum','Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.\n\nDonec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Pha','<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur. Curabitur blandit tempus porttitor. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>\n\n<p>Donec sed odio dui consectetur adipiscing elit. Etiam adipiscing tincidunt elit, eu convallis felis suscipit ut. Phasellus rhoncus tincidunt auctor. Nullam eu sagittis mauris. Donec non dolor ac elit aliquam tincidunt at at sapien. Aenean tortor libero, condimentum ac laoreet vitae, varius tempor nisi. Duis non arcu vel lectus.</p>\n\n<blockquote>\n<p>Pellentesque non diam et tortor dignissim bibendum. Neque sit amet mauris egestas quis mattis velit fringilla. Curabitur viver justo sed scelerisque. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam.</p>\n<small>VERY IMPORTANT PERSON</small></blockquote>\n\n<h3>Sit Vulputate Bibendum Purus</h3>\n\n<p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Aenean lacinia bibendum nulla sed consectetur. Cras mattis consectetur purus sit amet fermentum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc1-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc1.jpg\" /></a></p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc2-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc2.jpg\" /></a></p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc3-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc3.jpg\" /></a></p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc4-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc4.jpg\" /></a></p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc5-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc5.jpg\" /></a></p>\n\n<p><a href=\"http://themes.iki-bir.com/juno7/style/images/art/bc6-full.jpg\"><img alt=\"\" src=\"http://themes.iki-bir.com/juno7/style/images/art/bc6.jpg\" /></a></p>\n\n<p>Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Nullam id dolor id nibh ultricies vehicula ut id elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Donec sed odio dui. Donec id elit non mi porta gravida at eget metus. Maecenas faucibus mollis interdum. Cras mattis consectetur purus sit amet fermentum. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>\n',0,1,'2017-03-09 00:00:00','ligula-tristique-malesuada-venenatis-fermentum','active','2017-03-09 06:41:51',NULL,'2017-03-09 06:41:51',NULL,NULL,NULL);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `clean_url` varchar(100) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clean_url_UNIQUE` (`clean_url`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Lifestyle','Life of Style','lifestyle','active','2017-03-06 09:39:52',NULL,'2017-03-09 01:43:06',NULL,NULL,NULL),(2,'Photography','The beautiful images around us','photography','active','2017-03-06 09:56:29',NULL,'2017-03-09 01:43:23',NULL,NULL,NULL),(3,'Journal','A walk to remember','journal','active','2017-03-06 09:57:49',NULL,'2017-03-09 01:45:04',NULL,NULL,NULL),(4,'Works','The creative works','works','active','2017-03-06 09:58:10',NULL,'2017-03-09 01:45:07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_03_08_164317_create_users_table',1),(2,'2016_03_08_164400_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pictures`
--

DROP TABLE IF EXISTS `pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pictures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) NOT NULL,
  `article_id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pictures`
--

LOCK TABLES `pictures` WRITE;
/*!40000 ALTER TABLE `pictures` DISABLE KEYS */;
INSERT INTO `pictures` VALUES (1,NULL,'14890422130.jpg',1,'active','2017-03-09 06:50:13',NULL,'2017-03-09 06:50:13',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `filepath` varchar(255) NOT NULL,
  `status` varchar(45) DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `created_user_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_user_id` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `deleted_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (1,'test123','123','1488967066.jpg','active','2017-03-08 09:57:46',NULL,'2017-03-08 10:27:06',NULL,NULL,NULL),(2,'test','123','1488968775.jpg','active','2017-03-08 10:26:15',NULL,'2017-03-08 10:26:15',NULL,NULL,NULL),(3,'tser','df','1488968844.jpg','active','2017-03-08 10:27:25',NULL,'2017-03-08 10:27:25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','johndoe@example.com','$2y$10$cAaNYrtm7IFmk3DixZ4deOOrK8pDh7D.DHOWmn8hCBUmup8w0xbNS','lm9ARsbhv5',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-09 17:06:01
