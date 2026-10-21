-- MariaDB dump 10.19  Distrib 10.11.19-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: zedwgsyk_maventech
-- ------------------------------------------------------
-- Server version	10.11.19-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_notifications`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `admin_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(40) NOT NULL DEFAULT 'info',
  `title` varchar(180) NOT NULL,
  `body` varchar(400) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created_at`),
  KEY `idx_read` (`read_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;

--
-- Table structure for table `admin_remember_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `admin_remember_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(32) NOT NULL,
  `validator_hash` char(64) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `last_used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `idx_rt_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_remember_tokens`
--

/*!40000 ALTER TABLE `admin_remember_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_remember_tokens` ENABLE KEYS */;

--
-- Table structure for table `ai_citations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `ai_citations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(40) NOT NULL,
  `model` varchar(60) DEFAULT NULL,
  `query` text NOT NULL,
  `response` mediumtext NOT NULL,
  `mentions_brand` tinyint(1) NOT NULL DEFAULT 0,
  `mentions_url` tinyint(1) NOT NULL DEFAULT 0,
  `product_count` int(11) NOT NULL DEFAULT 0,
  `cited_urls_json` text DEFAULT NULL,
  `tokens_in` int(11) DEFAULT NULL,
  `tokens_out` int(11) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `ran_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_engine_time` (`engine`,`ran_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ai_citations`
--

/*!40000 ALTER TABLE `ai_citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ai_citations` ENABLE KEYS */;

--
-- Table structure for table `blog_media`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `blog_media` (
  `post_id` varchar(100) NOT NULL,
  `mime` varchar(40) NOT NULL DEFAULT 'image/webp',
  `bytes` longblob NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_media`
--

/*!40000 ALTER TABLE `blog_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_media` ENABLE KEYS */;

--
-- Table structure for table `blog_posts`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `blog_posts` (
  `id` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` varchar(50) NOT NULL,
  `read_time` varchar(20) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  `ai_generated` tinyint(1) NOT NULL DEFAULT 0,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `target_region` varchar(4) NOT NULL DEFAULT 'US',
  `indexnow_status` varchar(20) NOT NULL DEFAULT '',
  `verified_http` smallint(6) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `internal_links_count` int(11) NOT NULL DEFAULT 0,
  `content_fingerprint` varchar(64) NOT NULL DEFAULT '',
  `is_featured_trends` tinyint(1) NOT NULL DEFAULT 0,
  `faq_json` mediumtext DEFAULT NULL,
  `lead` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(320) DEFAULT NULL,
  `meta_keywords` varchar(320) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_featured_trends` (`is_featured_trends`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;

--
-- Table structure for table `categories`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `categories` (
  `slug` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_group` varchar(24) NOT NULL DEFAULT 'standalone',
  `nav_heading` varchar(48) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`slug`),
  KEY `idx_cat_group` (`category_group`,`sort_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT IGNORE INTO `categories` VALUES
('antivirus','Antivirus','antivirus','ANTIVIRUS',99),
('apps','Microsoft Apps','microsoft','APPS',99),
('bitdefender','Bitdefender','antivirus','ANTIVIRUS',10),
('mcafee','McAfee','antivirus','ANTIVIRUS',20),
('microsoft-project','Microsoft Project','microsoft','APPS',10),
('microsoft-visio','Microsoft Visio','microsoft','APPS',20),
('office','Microsoft Office','microsoft','OFFICE FOR PC',99),
('office-2019-mac','Office 2019 for Mac','microsoft','OFFICE FOR MAC',30),
('office-2019-pc','Office 2019 for PC','microsoft','OFFICE FOR PC',30),
('office-2021-mac','Office 2021 for Mac','microsoft','OFFICE FOR MAC',20),
('office-2021-pc','Office 2021 for PC','microsoft','OFFICE FOR PC',20),
('office-2024-mac','Office 2024 for Mac','microsoft','OFFICE FOR MAC',10),
('office-2024-pc','Office 2024 for PC','microsoft','OFFICE FOR PC',10),
('office-mac','Office for Mac','microsoft','OFFICE FOR MAC',99),
('office-pc','Office for PC','microsoft','OFFICE FOR PC',99),
('windows','Windows OS','microsoft','WINDOWS',99),
('windows-10','Windows 10','microsoft','WINDOWS',20),
('windows-11','Windows 11','microsoft','WINDOWS',10);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

--
-- Table structure for table `chat_leads`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `chat_leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `callback_requested` tinyint(1) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `status` enum('new','contacted','qualified','converted','lost') NOT NULL DEFAULT 'new',
  `assigned_to` int(11) DEFAULT NULL,
  `requested_product` varchar(120) DEFAULT NULL,
  `country` varchar(8) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `chat_token` varchar(40) NOT NULL DEFAULT '',
  `typing_admin_at` datetime DEFAULT NULL,
  `typing_customer_at` datetime DEFAULT NULL,
  `admin_notified_at` datetime DEFAULT NULL,
  `admin_seen_at` datetime DEFAULT NULL,
  `agent_name` varchar(120) DEFAULT NULL,
  `client_ip` varchar(45) DEFAULT NULL,
  `email_relay_at` datetime DEFAULT NULL,
  `pa_choice` varchar(20) DEFAULT NULL,
  `pa_choice_at` datetime DEFAULT NULL,
  `human_verified_at` datetime DEFAULT NULL,
  `lead_choice` varchar(20) DEFAULT NULL,
  `lead_choice_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_leads`
--

/*!40000 ALTER TABLE `chat_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_leads` ENABLE KEYS */;

--
-- Table structure for table `chat_messages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `sender` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `message` text NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `read_at` datetime DEFAULT NULL,
  `attachment_url` varchar(500) DEFAULT NULL,
  `attachment_type` varchar(20) DEFAULT NULL,
  `attachment_name` varchar(255) DEFAULT NULL,
  `relayed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead` (`lead_id`),
  KEY `idx_sent` (`sent_at`),
  KEY `idx_unread` (`sender`,`read_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_messages`
--

/*!40000 ALTER TABLE `chat_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_messages` ENABLE KEYS */;

--
-- Table structure for table `company_info_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `company_info_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field_key` varchar(60) NOT NULL,
  `old_value` mediumtext NOT NULL,
  `new_value` mediumtext NOT NULL,
  `changed_by` varchar(120) NOT NULL DEFAULT 'admin',
  `sweep_count` int(11) NOT NULL DEFAULT 0,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_field_key` (`field_key`),
  KEY `idx_changed_at` (`changed_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info_history`
--

/*!40000 ALTER TABLE `company_info_history` DISABLE KEYS */;
INSERT IGNORE INTO `company_info_history` VALUES
(1,'company_legal_name','','Maventech LLC','admin',0,'2026-09-21 08:45:06'),
(2,'company_id_prefix','','MVN','admin',0,'2026-09-21 08:45:06');
/*!40000 ALTER TABLE `company_info_history` ENABLE KEYS */;

--
-- Table structure for table `customer_reviews`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customer_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_slug` varchar(80) DEFAULT NULL,
  `customer_email` varchar(180) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `ai_generated` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('pending','published','hidden') NOT NULL DEFAULT 'pending',
  `request_token` varchar(64) NOT NULL,
  `request_sent_at` timestamp NULL DEFAULT current_timestamp(),
  `submitted_at` timestamp NULL DEFAULT NULL,
  `region` varchar(8) NOT NULL DEFAULT 'US',
  `admin_seen_at` datetime DEFAULT NULL,
  `google_shared_at` datetime DEFAULT NULL,
  `google_nudge_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `request_token` (`request_token`),
  KEY `order_id` (`order_id`),
  KEY `status` (`status`),
  KEY `idx_cr_slug_status` (`product_slug`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5468 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_reviews`
--

/*!40000 ALTER TABLE `customer_reviews` DISABLE KEYS */;
INSERT IGNORE INTO `customer_reviews` VALUES
(7,4,'microsoft-office-2024-professional-plus-windows','test@example.com','Test Buyer',NULL,NULL,0,'pending','819b03952ff13e84049aaca17edd5b93','2026-06-23 06:44:06',NULL,'US',NULL,NULL,NULL),
(8,NULL,'microsoft-project-professional-2021-pc','matthew.adams65@hotmail.com','Matthew Adams',4,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','7444c171da59784d9bdf079ae52b1ca0','2026-09-16 13:55:28','2026-09-16 13:55:28','AU',NULL,NULL,NULL),
(9,NULL,'bitdefender-small-office-security-5-devices-1-year','stephanie.brown68@gmail.com','Stephanie Brown',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','01a032933259e5e2b6899a6e88588a74','2026-09-16 13:39:18','2026-09-16 13:39:18','US',NULL,NULL,NULL),
(10,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','juan.white13@outlook.com','Juan White',2,'Very straightforward process. Key came fast and worked immediately.',1,'published','6f6338bed5a7447a4dd76f0dabc4c6e9','2026-09-16 08:18:44','2026-09-16 08:18:44','AU','2026-09-16 19:26:36',NULL,NULL),
(11,NULL,'microsoft-office-2021-home-business-windows','stephanie.green54@hotmail.com','Stephanie Green',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','c3568444e7c59f75443f53cb3e5a0962','2026-09-15 15:59:08','2026-09-15 15:59:08','US',NULL,NULL,NULL),
(12,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','stephen.wright90@hotmail.com','Stephen Wright',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','e4ae8bdeb30ff137c365606d06d7d07c','2026-09-15 08:57:10','2026-09-15 08:57:10','US',NULL,NULL,NULL),
(13,NULL,'microsoft-office-home-and-student-2019-mac','raj.smith24@yahoo.com','Raj Smith',4,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','e4b4ef5c28cb96cbf74c713f42cf5547','2026-09-15 05:21:24','2026-09-15 05:21:24','US',NULL,NULL,NULL),
(14,NULL,'microsoft-office-2024-professional-plus-windows','nancy.thompson22@yahoo.com','Nancy Thompson',5,'Quick delivery and a legit license. Happy customer here.',1,'published','310c0195f23e9498269ab52f4173cafc','2026-09-14 10:35:43','2026-09-14 10:35:43','CA',NULL,NULL,NULL),
(15,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','robert.lewis35@gmail.com','Robert Lewis',5,'Activation was painless and the key was valid immediately.',1,'published','65093e9ab7b0e9e11eb77328eefe9214','2026-09-14 09:29:37','2026-09-14 09:29:37','CA',NULL,NULL,NULL),
(16,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','eric.flores15@yahoo.com','Eric Flores',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','61b24f322987208f9d5fd4d01bcba6bf','2026-09-14 11:51:00','2026-09-14 11:51:00','GB',NULL,NULL,NULL),
(17,NULL,'bitdefender-small-office-security-5-devices-1-year','maria.adams73@gmail.com','Maria Adams',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','7fdc6b75e2465b1bcffe320d4e8b083a','2026-09-14 08:02:14','2026-09-14 08:02:14','EU',NULL,NULL,NULL),
(18,NULL,'microsoft-project-professional-2021-pc','emily.lopez76@yahoo.com','Emily Lopez',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','504d902eebff75c51813b2c9114c0c7f','2026-09-14 12:56:26','2026-09-14 12:56:26','GB',NULL,NULL,NULL),
(19,NULL,'microsoft-office-2021-professional-plus-windows','timothy.scott45@icloud.com','Timothy Scott',5,'Ordered late at night and still got the key within minutes.',1,'published','413e587e145a0c81c1651305aa9cfe54','2026-09-13 08:31:26','2026-09-13 08:31:26','EU',NULL,NULL,NULL),
(20,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','emily.adams54@icloud.com','Emily Adams',4,'Good product for the money. Everything was quick and easy.',1,'published','794b2de1818f022e60c67a53d4902693','2026-09-13 05:58:14','2026-09-13 05:58:14','US',NULL,NULL,NULL),
(21,NULL,'ms-visio-professional-2019-pc','karen.miller94@hotmail.com','Karen Miller',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','4d07d7ba097077fac6b60fa02fb96022','2026-09-13 08:15:57','2026-09-13 08:15:57','EU',NULL,NULL,NULL),
(22,NULL,'microsoft-office-2021-home-business-windows','paul.brown12@gmail.com','Paul Brown',4,'Really good price and prompt delivery. Working great so far.',1,'published','dc05cc426189f2c1f5ad820af7c22173','2026-09-13 10:42:09','2026-09-13 10:42:09','AU',NULL,NULL,NULL),
(23,NULL,'ms-project-professional-2019-pc','kenneth.hernandez48@icloud.com','Kenneth Hernandez',5,'The activation guide was clear and I was up and running fast.',1,'published','1f35a3f458d650b3887a68dc94f4c800','2026-09-13 11:43:36','2026-09-13 11:43:36','US',NULL,NULL,NULL),
(24,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','margaret.harris48@icloud.com','Margaret Harris',4,'Works great on my PC. No issues after several weeks of use.',1,'published','5f3e2a6b63a08fa680b6bd1ee8b2a8d3','2026-09-12 10:50:40','2026-09-12 10:50:40','GB',NULL,NULL,NULL),
(25,NULL,'windows-10-home','george.allen26@outlook.com','George Allen',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','f68b92ec518cf173930274c5d12a4cc8','2026-09-12 15:30:52','2026-09-12 15:30:52','GB',NULL,NULL,NULL),
(26,NULL,'microsoft-office-home-and-business-2019-mac','paul.martinez18@gmail.com','Paul Martinez',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','77c85e1c4b5af4d94fe1122606342afa','2026-09-12 05:21:28','2026-09-12 05:21:28','AU',NULL,NULL,NULL),
(27,NULL,'microsoft-project-professional-2021-pc','george.lee19@gmail.com','George Lee',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','73df26584d7f5734c685c01a1997406a','2026-09-12 09:04:44','2026-09-12 09:04:44','US',NULL,NULL,NULL),
(28,NULL,'microsoft-office-2024-professional-plus-windows','george.rodriguez32@icloud.com','George Rodriguez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','abc3e7bd45ccf601750481a483f51093','2026-09-11 16:37:22','2026-09-11 16:37:22','US',NULL,NULL,NULL),
(29,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','paul.torres34@yahoo.com','Paul Torres',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','efeeec539f812b4261797ea64c003b05','2026-09-11 13:22:44','2026-09-11 13:22:44','EU',NULL,NULL,NULL),
(30,NULL,'microsoft-visio-2024-professional-windows-pc','joseph.young83@hotmail.com','Joseph Young',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','3866fa97c6ef2928ad69e08caa2998dd','2026-09-11 17:08:57','2026-09-11 17:08:57','US',NULL,NULL,NULL),
(31,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','ashley.brown64@icloud.com','Ashley Brown',3,'Quick delivery and a legit license. Happy customer here.',1,'published','8caad79d0c01ae13e20a91cd4581596e','2026-09-10 06:18:51','2026-09-10 06:18:51','US','2026-09-16 19:26:36',NULL,NULL),
(32,NULL,'microsoft-office-home-and-business-2019-mac','david.anderson89@icloud.com','David Anderson',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','ee63669255af1af0cfe430012c5f8e2c','2026-09-10 09:39:52','2026-09-10 09:39:52','CA',NULL,NULL,NULL),
(33,NULL,'microsoft-office-home-and-business-2019-mac','thomas.rivera25@hotmail.com','Thomas Rivera',5,'Activated without a hitch. Great communication throughout.',1,'published','dc70b9b20b8d0d5d7f5331db0c217d3e','2026-09-10 06:54:09','2026-09-10 06:54:09','CA',NULL,NULL,NULL),
(34,NULL,'microsoft-office-2019-home-student-windows','elizabeth.lopez92@gmail.com','Elizabeth Lopez',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','c4042e9de2b0bfe1dc0da0ce57f7d23f','2026-09-10 09:18:27','2026-09-10 09:18:27','CA',NULL,NULL,NULL),
(35,NULL,'microsoft-office-home-business-2024-mac','andrew.wilson35@gmail.com','Andrew Wilson',5,'Much cheaper than the official store and it activated without any issues.',1,'published','b824bbb7390b281270623b26894925ff','2026-09-10 08:56:40','2026-09-10 08:56:40','AU',NULL,NULL,NULL),
(36,NULL,'microsoft-office-home-2024-pc','deborah.green75@yahoo.com','Deborah Green',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','8f67a5bcd30cc4be731396956ba4790a','2026-09-10 16:32:16','2026-09-10 16:32:16','US',NULL,NULL,NULL),
(37,NULL,'microsoft-visio-2021-professional-windows-pc','amanda.ramirez60@yahoo.com','Amanda Ramirez',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','e9b66bb2e5164933cbd7d02df82e2289','2026-09-10 09:28:49','2026-09-10 09:28:49','US',NULL,NULL,NULL),
(38,NULL,'microsoft-excel-2021-windows','andrew.gonzalez89@icloud.com','Andrew Gonzalez',4,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','02c2bb3224a1454043e5f4d9e279e112','2026-09-09 17:35:48','2026-09-09 17:35:48','CA',NULL,NULL,NULL),
(39,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','jessica.allen66@gmail.com','Jessica Allen',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','4e817f90f29164eaf25c90e20d9c2f6d','2026-09-09 12:06:04','2026-09-09 12:06:04','US',NULL,NULL,NULL),
(40,NULL,'microsoft-project-2024-professional-pc','anna.williams28@yahoo.com','Anna Williams',4,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','91016f7d8dafc9db8057228ec51445a6','2026-09-09 09:36:40','2026-09-09 09:36:40','CA',NULL,NULL,NULL),
(41,NULL,'microsoft-office-home-and-business-2019-mac','elizabeth.gonzalez84@yahoo.com','Elizabeth Gonzalez',5,'The email with my key and instructions came through in minutes.',1,'published','660f7c458142c85c26b6fd3b84e957e3','2026-09-09 14:18:11','2026-09-09 14:18:11','AU',NULL,NULL,NULL),
(42,NULL,'bitdefender-small-office-security-5-devices-1-year','melissa.jones66@gmail.com','Melissa Jones',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','9e946eb0d28f1960167182a739214733','2026-09-09 07:02:22','2026-09-09 07:02:22','US',NULL,NULL,NULL),
(43,NULL,'windows-11-pro','steven.jackson36@yahoo.com','Steven Jackson',3,'Activated without a hitch. Great communication throughout.',1,'published','b94510147c24a79074b2cc55e01cdf64','2026-09-09 04:14:36','2026-09-09 04:14:36','GB','2026-09-16 19:26:36',NULL,NULL),
(44,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','juan.johnson79@hotmail.com','Juan Johnson',2,'No issues whatsoever. Key came fast and activated first time.',1,'published','5ebf1939359928bd1a2103e74de325fe','2026-09-08 14:06:24','2026-09-08 14:06:24','US','2026-09-16 19:26:36',NULL,NULL),
(45,NULL,'microsoft-office-home-2024-pc','justin.martin41@outlook.com','Justin Martin',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','4741774bd4f34fe9e9aaedc2ee16338f','2026-09-08 04:45:52','2026-09-08 04:45:52','US',NULL,NULL,NULL),
(46,NULL,'windows-10-home','daniel.davis76@hotmail.com','Daniel Davis',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','ef9850a4e66ba41434e9dbcda3de7d30','2026-09-08 11:43:18','2026-09-08 11:43:18','US',NULL,NULL,NULL),
(47,NULL,'microsoft-visio-2021-professional-windows-pc','patricia.taylor30@outlook.com','Patricia Taylor',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','cfb341b0e0aeaa8b5212845ff8efa5bc','2026-09-07 15:14:19','2026-09-07 15:14:19','GB',NULL,NULL,NULL),
(48,NULL,'microsoft-office-2021-professional-plus-windows','nancy.carter62@outlook.com','Nancy Carter',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','182c58296e205728e90db77acbdec611','2026-09-07 05:53:15','2026-09-07 05:53:15','US',NULL,NULL,NULL),
(49,NULL,'microsoft-office-2019-professional-plus-windows','emily.harris55@outlook.com','Emily Harris',5,'Activated without a hitch. Great communication throughout.',1,'published','8d3b969da1fe8a57beabb87e3cd69c1d','2026-09-07 11:41:26','2026-09-07 11:41:26','US',NULL,NULL,NULL),
(50,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','nicole.campbell95@yahoo.com','Nicole Campbell',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','de69c1e512f367e61971534eb53319ca','2026-09-07 14:29:13','2026-09-07 14:29:13','EU',NULL,NULL,NULL),
(51,NULL,'ms-project-professional-2019-pc','maria.scott49@hotmail.com','Maria Scott',4,'Activated without a hitch. Great communication throughout.',1,'published','3c94e7d1488e0f4cbc23b0cb32af0189','2026-09-07 10:43:39','2026-09-07 10:43:39','AU',NULL,NULL,NULL),
(52,NULL,'microsoft-office-2021-professional-plus-windows','richard.clark13@hotmail.com','Richard Clark',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','c06faf25650ef0ddeea3dae5739f51df','2026-09-06 04:46:00','2026-09-06 04:46:00','US',NULL,NULL,NULL),
(53,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','stephen.martinez32@icloud.com','Stephen Martinez',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','ffb70f95b8e88f96d4648631dbea0d86','2026-09-06 15:25:14','2026-09-06 15:25:14','US',NULL,NULL,NULL),
(54,NULL,'windows-10-pro','donald.young65@gmail.com','Donald Young',4,'Much cheaper than the official store and it activated without any issues.',1,'published','f2100ee29ed03a466647ddab3c867aec','2026-09-06 07:45:09','2026-09-06 07:45:09','EU',NULL,NULL,NULL),
(55,NULL,'windows-10-pro','matthew.wright79@gmail.com','Matthew Wright',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','70cf6349d31b9915487ce5fbc69498aa','2026-09-06 11:28:40','2026-09-06 11:28:40','GB',NULL,NULL,NULL),
(56,NULL,'windows-11-home','timothy.lopez41@hotmail.com','Timothy Lopez',5,'Superb service. The whole process took less than five minutes.',1,'published','9c69c34a657b5804f817dc90757b9c6c','2026-09-06 08:46:45','2026-09-06 08:46:45','US',NULL,NULL,NULL),
(57,NULL,'microsoft-office-home-2024-pc','edward.baker20@yahoo.com','Edward Baker',5,'The email with my key and instructions came through in minutes.',1,'published','958170ab7bd5afb144bed7cee11d2f2f','2026-09-06 07:48:12','2026-09-06 07:48:12','US',NULL,NULL,NULL),
(58,NULL,'microsoft-office-home-business-2024-mac','kimberly.lee18@icloud.com','Kimberly Lee',5,'Activated without a hitch. Great communication throughout.',1,'published','6c48aca04dc813f95f27e08c506e5d31','2026-09-06 10:04:15','2026-09-06 10:04:15','US',NULL,NULL,NULL),
(59,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kevin.clark93@gmail.com','Kevin Clark',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','b89815075c39fc95025bc5f013986360','2026-09-05 06:04:10','2026-09-05 06:04:10','GB',NULL,NULL,NULL),
(60,NULL,'microsoft-excel-2021-windows','ronald.hall78@gmail.com','Ronald Hall',5,'Activation was painless and the key was valid immediately.',1,'published','76b5a20c9d75f62783d5543546b1801d','2026-09-05 09:49:58','2026-09-05 09:49:58','CA',NULL,NULL,NULL),
(61,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','matthew.wilson44@outlook.com','Matthew Wilson',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','192d1eefb828046126407c849d0a008a','2026-09-05 17:46:41','2026-09-05 17:46:41','CA',NULL,NULL,NULL),
(62,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','justin.hill88@icloud.com','Justin Hill',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','831e674dd4618a300fcbf2330dbcecf5','2026-09-04 14:48:12','2026-09-04 14:48:12','US',NULL,NULL,NULL),
(63,NULL,'microsoft-excel-2021-windows','nancy.jones38@icloud.com','Nancy Jones',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','99b8c955b509253cb2e259f92b03d240','2026-09-04 07:18:21','2026-09-04 07:18:21','CA',NULL,NULL,NULL),
(64,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','sarah.anderson82@gmail.com','Sarah Anderson',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','d22af5d48c5b6bfe2bbf84997e7c5587','2026-09-04 17:04:47','2026-09-04 17:04:47','GB',NULL,NULL,NULL),
(65,NULL,'microsoft-office-2021-home-student-mac','sharon.nelson88@gmail.com','Sharon Nelson',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','445d8802aaf218c3bfbe9b69559633f8','2026-09-04 09:58:57','2026-09-04 09:58:57','EU',NULL,NULL,NULL),
(66,NULL,'windows-10-pro','timothy.perez21@gmail.com','Timothy Perez',5,'Activation was painless and the key was valid immediately.',1,'published','fed8aa88a20b7ddb1d7164443611d3c0','2026-09-04 08:06:23','2026-09-04 08:06:23','AU',NULL,NULL,NULL),
(67,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','jeffrey.ramirez66@outlook.com','Jeffrey Ramirez',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','84781931c210befad72e6774e2dc8664','2026-09-03 10:51:14','2026-09-03 10:51:14','GB',NULL,NULL,NULL),
(68,NULL,'ms-project-professional-2019-pc','kathleen.patel13@gmail.com','Kathleen Patel',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','952ffc6dff57e0d8ff71f0707b3d82c5','2026-09-03 13:57:05','2026-09-03 13:57:05','AU',NULL,NULL,NULL),
(69,NULL,'microsoft-office-2021-home-business-mac','maria.campbell37@icloud.com','Maria Campbell',3,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','a798ddb9704e2730a5e4fbac510d9ebe','2026-09-03 14:33:54','2026-09-03 14:33:54','EU','2026-09-16 19:26:36',NULL,NULL),
(70,NULL,'microsoft-office-2019-professional-plus-windows','mark.miller46@outlook.com','Mark Miller',4,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','82f313b6588ec048a8a4c1ef48325adb','2026-09-03 09:06:46','2026-09-03 09:06:46','AU',NULL,NULL,NULL),
(71,NULL,'ms-visio-professional-2019-pc','richard.davis99@yahoo.com','Richard Davis',4,'Good product for the money. Everything was quick and easy.',1,'published','233cea50c1d4b4509a19a3e35c26e2ba','2026-09-03 06:35:51','2026-09-03 06:35:51','US',NULL,NULL,NULL),
(72,NULL,'microsoft-visio-2024-professional-windows-pc','priya.perez35@yahoo.com','Priya Perez',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','46840a47ed05365a3c060f7c32f06f36','2026-09-03 16:47:36','2026-09-03 16:47:36','GB',NULL,NULL,NULL),
(73,NULL,'microsoft-office-2021-home-business-mac','ashley.lewis97@gmail.com','Ashley Lewis',5,'Activated without a hitch. Great communication throughout.',1,'published','d8ab06d1f1fcef4eb1625dbb3ab72cb6','2026-09-02 14:16:24','2026-09-02 14:16:24','GB',NULL,NULL,NULL),
(74,NULL,'microsoft-office-2019-home-student-windows','ashley.carter93@icloud.com','Ashley Carter',5,'Superb service. The whole process took less than five minutes.',1,'published','b10d4308836a859ce8f6823e5fe53fe8','2026-09-02 14:04:30','2026-09-02 14:04:30','CA',NULL,NULL,NULL),
(75,NULL,'microsoft-project-professional-2021-pc','david.williams40@yahoo.com','David Williams',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','55f220e359c6f97a5146f1bac36dfc32','2026-09-02 05:00:52','2026-09-02 05:00:52','CA',NULL,NULL,NULL),
(76,NULL,'microsoft-office-2021-home-student-mac','patricia.green52@outlook.com','Patricia Green',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','485b6621d75ecfe67f0bb6439492af67','2026-09-02 07:46:02','2026-09-02 07:46:02','US',NULL,NULL,NULL),
(77,NULL,'microsoft-project-2024-professional-pc','susan.williams76@yahoo.com','Susan Williams',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','7cff7b858e4acb5e56d2912dad5dd561','2026-09-01 08:06:18','2026-09-01 08:06:18','US',NULL,NULL,NULL),
(78,NULL,'microsoft-office-2019-home-business-pc','mary.martinez43@gmail.com','Mary Martinez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','6d1339ec349fdbe919340993149fa05c','2026-09-01 08:42:39','2026-09-01 08:42:39','CA',NULL,NULL,NULL),
(79,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','melissa.miller10@outlook.com','Melissa Miller',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','7d90345ff5f381e2503c1c29533cf73c','2026-09-01 07:23:31','2026-09-01 07:23:31','US',NULL,NULL,NULL),
(80,NULL,'microsoft-project-professional-2021-pc','edward.ramirez21@hotmail.com','Edward Ramirez',5,'Really good price and prompt delivery. Working great so far.',1,'published','f6c651e03b3f5a1608ecb5d5b07bb515','2026-09-01 17:32:14','2026-09-01 17:32:14','GB',NULL,NULL,NULL),
(81,NULL,'microsoft-excel-2021-windows','ryan.hernandez34@gmail.com','Ryan Hernandez',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','3e68114646b55a6659963a656f7e2953','2026-09-01 10:33:54','2026-09-01 10:33:54','US',NULL,NULL,NULL),
(82,NULL,'microsoft-project-professional-2021-pc','priya.green44@yahoo.com','Priya Green',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','9fa1bba0a1de8baf25d0506525e8a22f','2026-09-01 07:25:44','2026-09-01 07:25:44','US',NULL,NULL,NULL),
(83,NULL,'microsoft-office-home-business-2024-mac','emily.jones62@hotmail.com','Emily Jones',4,'No issues whatsoever. Key came fast and activated first time.',1,'published','6ccf0bab4f0436b40f0a80274295d46b','2026-08-31 15:50:51','2026-08-31 15:50:51','GB',NULL,NULL,NULL),
(84,NULL,'microsoft-visio-2024-professional-windows-pc','eric.wright77@gmail.com','Eric Wright',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','4a475d9937efe7fb1cc5830803a86373','2026-08-31 17:37:07','2026-08-31 17:37:07','CA',NULL,NULL,NULL),
(85,NULL,'bitdefender-small-office-security-5-devices-1-year','ronald.king88@yahoo.com','Ronald King',5,'Activation was painless and the key was valid immediately.',1,'published','5b4490067032b71a9acfe1685c42f121','2026-08-31 15:53:47','2026-08-31 15:53:47','US',NULL,NULL,NULL),
(86,NULL,'microsoft-office-home-2024-mac','olga.miller24@hotmail.com','Olga Miller',3,'Key worked instantly and activated on the first try. Great price too.',1,'published','6fb1cfb597209b6dd9fcaef9f44cfa99','2026-08-30 15:25:02','2026-08-30 15:25:02','CA','2026-09-16 19:26:36',NULL,NULL),
(87,NULL,'microsoft-office-home-2024-mac','andrew.campbell61@yahoo.com','Andrew Campbell',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','cb70fe384ea65838090bbcab157b9845','2026-08-30 10:44:12','2026-08-30 10:44:12','CA',NULL,NULL,NULL),
(88,NULL,'microsoft-office-home-and-student-2019-mac','hiroshi.nelson19@hotmail.com','Hiroshi Nelson',5,'Activated without a hitch. Great communication throughout.',1,'published','21383fa03e7a55103c79a3bb8dd829e3','2026-08-30 10:13:42','2026-08-30 10:13:42','GB',NULL,NULL,NULL),
(89,NULL,'microsoft-office-2021-professional-plus-windows','olga.gonzalez76@yahoo.com','Olga Gonzalez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','1e2604e42f7095b5eba78cfe1748153c','2026-08-30 07:53:17','2026-08-30 07:53:17','AU',NULL,NULL,NULL),
(90,NULL,'windows-11-pro','laura.rodriguez98@icloud.com','Laura Rodriguez',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','60112021be6d6a6108834e084b9da873','2026-08-30 04:09:52','2026-08-30 04:09:52','US',NULL,NULL,NULL),
(91,NULL,'microsoft-visio-2024-professional-windows-pc','angela.torres71@icloud.com','Angela Torres',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','821e61f33558b30a372233aff45b6742','2026-08-29 05:21:26','2026-08-29 05:21:26','GB',NULL,NULL,NULL),
(92,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','juan.thompson50@hotmail.com','Juan Thompson',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','9bdfcada910bce1ef2fb317a75b119d1','2026-08-29 09:28:10','2026-08-29 09:28:10','US',NULL,NULL,NULL),
(93,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','anna.hernandez47@hotmail.com','Anna Hernandez',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','76e8c7e4d5a4d6c6e0589697f4f127de','2026-08-29 17:30:05','2026-08-29 17:30:05','US',NULL,NULL,NULL),
(94,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','raj.jackson88@outlook.com','Raj Jackson',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','4a2e05c8977651013f4699da4333674c','2026-08-29 16:13:46','2026-08-29 16:13:46','US',NULL,NULL,NULL),
(95,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','michael.nguyen50@hotmail.com','Michael Nguyen',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','11a018ee2b6d007c6c185f1e797768c9','2026-08-29 09:39:04','2026-08-29 09:39:04','US',NULL,NULL,NULL),
(96,NULL,'microsoft-project-professional-2021-pc','amanda.jones85@hotmail.com','Amanda Jones',3,'Legit key at a fraction of the retail price. Great experience.',1,'published','aa9c2c17fa52e912bd641f611c54c298','2026-08-29 15:41:04','2026-08-29 15:41:04','EU','2026-09-16 19:26:36',NULL,NULL),
(97,NULL,'ms-visio-professional-2019-pc','thomas.mitchell10@hotmail.com','Thomas Mitchell',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','82f06cfed06a7cdff6d1624c270079d0','2026-08-28 04:05:12','2026-08-28 04:05:12','AU',NULL,NULL,NULL),
(98,NULL,'microsoft-project-2024-professional-pc','gary.campbell15@yahoo.com','Gary Campbell',5,'Customer service was responsive and the product key was genuine.',1,'published','e8ea71104759284c49b3f2606060bb46','2026-08-28 10:03:49','2026-08-28 10:03:49','CA',NULL,NULL,NULL),
(99,NULL,'microsoft-office-home-2024-mac','sarah.lopez64@outlook.com','Sarah Lopez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','44269dc4bed5b5ba0ee448f6b034f995','2026-08-28 14:09:11','2026-08-28 14:09:11','US',NULL,NULL,NULL),
(100,NULL,'windows-11-home','edward.patel77@outlook.com','Edward Patel',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','6d1f109026c5060cb61d8c3fc032f705','2026-08-28 06:51:11','2026-08-28 06:51:11','US',NULL,NULL,NULL),
(101,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','mary.campbell97@gmail.com','Mary Campbell',3,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','1ec7f7e04c766b8d9e545f421b8310ac','2026-08-28 11:36:17','2026-08-28 11:36:17','US','2026-09-16 19:26:36',NULL,NULL),
(102,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','donna.davis69@hotmail.com','Donna Davis',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','ce6cfb52c2a241cbd547e5a08f45f152','2026-08-28 07:30:08','2026-08-28 07:30:08','US',NULL,NULL,NULL),
(103,NULL,'microsoft-office-2024-professional-plus-windows','lisa.allen80@outlook.com','Lisa Allen',5,'The activation guide was clear and I was up and running fast.',1,'published','2dc3fd33e10e5418fd01b67794b9999b','2026-08-27 14:42:51','2026-08-27 14:42:51','GB',NULL,NULL,NULL),
(104,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','angela.adams84@gmail.com','Angela Adams',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','ef1eb77536857c9f9bd1ebf0800a34dc','2026-08-27 15:24:48','2026-08-27 15:24:48','EU',NULL,NULL,NULL),
(105,NULL,'microsoft-office-2019-home-student-windows','amy.miller95@yahoo.com','Amy Miller',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','93eefd1cb7fb1aeb42c7417536feb298','2026-08-27 05:07:55','2026-08-27 05:07:55','US',NULL,NULL,NULL),
(106,NULL,'bitdefender-small-office-security-5-devices-1-year','kimberly.martin98@hotmail.com','Kimberly Martin',5,'Activated without a hitch. Great communication throughout.',1,'published','e969ed135e86ddf0e400150053e20050','2026-08-27 09:00:24','2026-08-27 09:00:24','US',NULL,NULL,NULL),
(107,NULL,'microsoft-office-2019-home-business-pc','justin.patel82@gmail.com','Justin Patel',2,'Activation was painless and the key was valid immediately.',1,'published','14e20aa58bea27919d6ed4cea7fc854e','2026-08-27 11:39:37','2026-08-27 11:39:37','US','2026-09-16 19:26:36',NULL,NULL),
(108,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','carlos.williams32@outlook.com','Carlos Williams',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','641148e043fae84df031553847e78fe2','2026-08-27 12:08:47','2026-08-27 12:08:47','AU',NULL,NULL,NULL),
(109,NULL,'microsoft-project-2024-professional-pc','nancy.johnson30@icloud.com','Nancy Johnson',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','0fdaa2f556a0ec83e665ab9d2124c8a3','2026-08-26 04:55:46','2026-08-26 04:55:46','GB',NULL,NULL,NULL),
(110,NULL,'microsoft-visio-2021-professional-windows-pc','sofia.rivera83@hotmail.com','Sofia Rivera',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','86e866d66edbfc68a4618faf7f98c726','2026-08-26 09:27:34','2026-08-26 09:27:34','US',NULL,NULL,NULL),
(111,NULL,'microsoft-visio-2021-professional-windows-pc','christopher.garcia73@outlook.com','Christopher Garcia',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','bac8fdaf048c780ec21439e59e65b71c','2026-08-26 12:13:05','2026-08-26 12:13:05','AU',NULL,NULL,NULL),
(112,NULL,'windows-11-pro','angela.williams70@icloud.com','Angela Williams',5,'The step-by-step activation instructions were really helpful.',1,'published','631073951ccc3f4f159322e257b1852c','2026-08-26 10:15:03','2026-08-26 10:15:03','US',NULL,NULL,NULL),
(113,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','kevin.mitchell29@icloud.com','Kevin Mitchell',5,'Good product for the money. Everything was quick and easy.',1,'published','b833e3abe40b6b7c9e1829cb131872f4','2026-08-25 16:36:48','2026-08-25 16:36:48','US',NULL,NULL,NULL),
(114,NULL,'microsoft-visio-2024-professional-windows-pc','gary.hill68@outlook.com','Gary Hill',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','85cc9e87786813139b42517f1ffdb5e9','2026-08-25 10:51:52','2026-08-25 10:51:52','US',NULL,NULL,NULL),
(115,NULL,'microsoft-office-2019-home-business-pc','amy.sanchez69@gmail.com','Amy Sanchez',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','8d2fe174fc94e4ae9cb5cefa98030ded','2026-08-25 07:04:27','2026-08-25 07:04:27','CA',NULL,NULL,NULL),
(116,NULL,'windows-10-pro','angela.perez31@gmail.com','Angela Perez',4,'Works great on my PC. No issues after several weeks of use.',1,'published','001cfdb7266e9fba331c0502f44514f4','2026-08-25 14:01:44','2026-08-25 14:01:44','US',NULL,NULL,NULL),
(117,NULL,'microsoft-office-home-and-student-2019-mac','deborah.smith53@icloud.com','Deborah Smith',5,'Activation was painless and the key was valid immediately.',1,'published','81d1848991e16cd2d716beada7d2e0d9','2026-08-25 08:11:38','2026-08-25 08:11:38','EU',NULL,NULL,NULL),
(118,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','sharon.miller25@yahoo.com','Sharon Miller',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','3ac5051bd9be7e11a0abed62de978dc8','2026-08-24 08:48:38','2026-08-24 08:48:38','US',NULL,NULL,NULL),
(119,NULL,'microsoft-visio-2021-professional-windows-pc','paul.mitchell67@gmail.com','Paul Mitchell',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','5a84032eca1a78a0665efc17108583db','2026-08-24 13:21:42','2026-08-24 13:21:42','EU',NULL,NULL,NULL),
(120,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','amy.clark19@gmail.com','Amy Clark',4,'Works great on my PC. No issues after several weeks of use.',1,'published','e250417376f83653937d17952c17d430','2026-08-24 05:48:08','2026-08-24 05:48:08','CA',NULL,NULL,NULL),
(121,NULL,'microsoft-office-home-and-student-2019-mac','barbara.sanchez68@hotmail.com','Barbara Sanchez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','c8be21b9cf2290eee3bf4c25e4d7547a','2026-08-24 13:00:24','2026-08-24 13:00:24','US',NULL,NULL,NULL),
(122,NULL,'microsoft-project-2024-professional-pc','donald.perez95@gmail.com','Donald Perez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','538bc213de16c79ae17910051a151e5d','2026-08-24 12:38:01','2026-08-24 12:38:01','US',NULL,NULL,NULL),
(123,NULL,'microsoft-office-2021-home-student-windows','stephanie.gonzalez82@icloud.com','Stephanie Gonzalez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','6f0af82dd0c88073df0fba28037e006f','2026-08-23 07:08:01','2026-08-23 07:08:01','GB',NULL,NULL,NULL),
(124,NULL,'microsoft-office-home-business-2024-pc','stephanie.allen82@hotmail.com','Stephanie Allen',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','e3e0d73ca0364e3e56fd191ab171b1f9','2026-08-23 16:07:37','2026-08-23 16:07:37','US',NULL,NULL,NULL),
(125,NULL,'bitdefender-small-office-security-5-devices-1-year','nicole.lewis82@icloud.com','Nicole Lewis',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','1f81f35382175dbec78bf1635ebd364e','2026-08-23 08:46:36','2026-08-23 08:46:36','US',NULL,NULL,NULL),
(126,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','mary.hall59@hotmail.com','Mary Hall',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','b5c0b6383e12046d563cbf8b225fcaf6','2026-08-23 12:25:41','2026-08-23 12:25:41','US',NULL,NULL,NULL),
(127,NULL,'bitdefender-small-office-security-5-devices-1-year','carlos.miller27@hotmail.com','Carlos Miller',4,'Really good price and prompt delivery. Working great so far.',1,'published','5984220727364277988b55dac439cd2b','2026-08-22 09:36:30','2026-08-22 09:36:30','CA',NULL,NULL,NULL),
(128,NULL,'microsoft-visio-2024-professional-windows-pc','thomas.brown20@gmail.com','Thomas Brown',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','f32595c134d0f1c13b17e53c62652205','2026-08-22 06:40:38','2026-08-22 06:40:38','US',NULL,NULL,NULL),
(129,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','hiroshi.white41@icloud.com','Hiroshi White',5,'Good product for the money. Everything was quick and easy.',1,'published','7a986a279021d69c92639893c88aa9b4','2026-08-22 14:26:03','2026-08-22 14:26:03','US',NULL,NULL,NULL),
(130,NULL,'windows-10-pro','joseph.jones33@icloud.com','Joseph Jones',4,'Superb service. The whole process took less than five minutes.',1,'published','41a181d4a766565310208fef3c9400fd','2026-08-22 08:09:16','2026-08-22 08:09:16','US',NULL,NULL,NULL),
(131,NULL,'microsoft-project-professional-2021-pc','charles.garcia98@yahoo.com','Charles Garcia',4,'Everything went smoothly from purchase to activation. Recommended.',1,'published','d3d55218738ecc3065a27a40cae02fb4','2026-08-22 14:57:24','2026-08-22 14:57:24','GB',NULL,NULL,NULL),
(132,NULL,'windows-11-home','amy.flores93@hotmail.com','Amy Flores',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','efa0d5dc299718c67cc473e6e1bdad2b','2026-08-21 10:12:43','2026-08-21 10:12:43','US',NULL,NULL,NULL),
(133,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','richard.hall22@outlook.com','Richard Hall',5,'Customer service was responsive and the product key was genuine.',1,'published','5343b84cb53e1ccb5d462165c216c6ad','2026-08-21 06:42:16','2026-08-21 06:42:16','US',NULL,NULL,NULL),
(134,NULL,'microsoft-visio-2024-professional-windows-pc','william.young21@yahoo.com','William Young',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','4cae0fce7ce20257e59f74b3e427d347','2026-08-21 08:02:30','2026-08-21 08:02:30','US',NULL,NULL,NULL),
(135,NULL,'microsoft-office-2019-home-business-pc','larry.gonzalez89@yahoo.com','Larry Gonzalez',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','d497b2d54fad3ce4db536bcfe32d0904','2026-08-21 12:13:43','2026-08-21 12:13:43','GB',NULL,NULL,NULL),
(136,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','michelle.anderson88@gmail.com','Michelle Anderson',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','e4defba8da711cca65f65570a407999f','2026-08-20 17:32:02','2026-08-20 17:32:02','GB',NULL,NULL,NULL),
(137,NULL,'microsoft-visio-2021-professional-windows-pc','anthony.jones25@gmail.com','Anthony Jones',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','b8639eb2de40d383f79743b72a2e6643','2026-08-20 06:12:26','2026-08-20 06:12:26','US',NULL,NULL,NULL),
(138,NULL,'windows-10-pro','betty.jackson27@hotmail.com','Betty Jackson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','89b83cc94fcd6702db97efa2c8cb6eea','2026-08-20 09:49:20','2026-08-20 09:49:20','US',NULL,NULL,NULL),
(139,NULL,'microsoft-office-2024-professional-plus-windows','ahmed.carter10@gmail.com','Ahmed Carter',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','63d9787a5f576b92bafa9ad1e9d3b55b','2026-08-20 11:42:54','2026-08-20 11:42:54','US',NULL,NULL,NULL),
(140,NULL,'ms-visio-professional-2019-pc','barbara.flores20@icloud.com','Barbara Flores',4,'Works great on my PC. No issues after several weeks of use.',1,'published','f39cc95151196e44ffdadb2fbd839ba4','2026-08-20 04:01:24','2026-08-20 04:01:24','US',NULL,NULL,NULL),
(141,NULL,'microsoft-project-2024-professional-pc','michael.harris92@hotmail.com','Michael Harris',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','b7880051e542d4dbdbdd539e4045a193','2026-08-20 10:49:57','2026-08-20 10:49:57','AU',NULL,NULL,NULL),
(142,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','nancy.king38@outlook.com','Nancy King',5,'Solid experience overall. The key worked and support was helpful.',1,'published','5b0ddd89de298ff7c23080fa02acca33','2026-08-19 09:35:30','2026-08-19 09:35:30','GB',NULL,NULL,NULL),
(143,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','jason.wright15@hotmail.com','Jason Wright',5,'Solid experience overall. The key worked and support was helpful.',1,'published','a4e4d5a1da1858bff83061bbdd8f800c','2026-08-19 05:53:59','2026-08-19 05:53:59','US',NULL,NULL,NULL),
(144,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','kimberly.gonzalez30@yahoo.com','Kimberly Gonzalez',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','2d66b6d19d6770c141e9a730535b98cb','2026-08-19 07:31:48','2026-08-19 07:31:48','US',NULL,NULL,NULL),
(145,NULL,'microsoft-office-home-business-2024-mac','melissa.walker93@outlook.com','Melissa Walker',5,'Much cheaper than the official store and it activated without any issues.',1,'published','151a993189eac32f6c9b84e05a5536b6','2026-08-19 17:49:43','2026-08-19 17:49:43','CA',NULL,NULL,NULL),
(146,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','william.hall40@outlook.com','William Hall',4,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','ee0d643fab446bc578055616a78e8bc9','2026-08-18 08:38:35','2026-08-18 08:38:35','CA',NULL,NULL,NULL),
(147,NULL,'microsoft-office-2019-home-business-pc','stephanie.carter21@outlook.com','Stephanie Carter',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','8621258beaf18259dde77740baa3b18c','2026-08-18 11:52:55','2026-08-18 11:52:55','US',NULL,NULL,NULL),
(148,NULL,'microsoft-office-home-and-student-2019-mac','daniel.torres24@outlook.com','Daniel Torres',5,'Second time ordering from this store. Reliable every time.',1,'published','f63d04c45483ee7bcd980b2e53c79a51','2026-08-18 16:53:30','2026-08-18 16:53:30','US',NULL,NULL,NULL),
(149,NULL,'microsoft-office-2019-home-business-pc','juan.thomas94@gmail.com','Juan Thomas',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','669a7078f2f3164cbaf706f915e6de19','2026-08-17 05:30:12','2026-08-17 05:30:12','US',NULL,NULL,NULL),
(150,NULL,'microsoft-office-2019-home-student-windows','larry.hernandez44@icloud.com','Larry Hernandez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','a82d57b3d68fda1ffc6ef4d6f91adf52','2026-08-17 17:01:55','2026-08-17 17:01:55','US',NULL,NULL,NULL),
(151,NULL,'microsoft-office-2019-professional-plus-windows','john.hall49@outlook.com','John Hall',3,'Delivered on time and it works perfectly. Five stars.',1,'published','223b3adf14fdf46cbd0f9f1b2f9d1ba1','2026-08-17 04:06:28','2026-08-17 04:06:28','US','2026-09-16 19:26:36',NULL,NULL),
(152,NULL,'microsoft-project-professional-2021-pc','john.wilson54@gmail.com','John Wilson',5,'Activation was painless and the key was valid immediately.',1,'published','6ffd70bcadfd82c88a94f06d4927fecf','2026-08-16 09:17:05','2026-08-16 09:17:05','GB',NULL,NULL,NULL),
(153,NULL,'microsoft-office-2021-home-business-windows','michael.lewis77@yahoo.com','Michael Lewis',5,'Quick delivery and a legit license. Happy customer here.',1,'published','ea71659269b8f7a038f0be0e1baa64d1','2026-08-16 09:43:42','2026-08-16 09:43:42','CA',NULL,NULL,NULL),
(154,NULL,'microsoft-word-2021-windows','mark.perez70@outlook.com','Mark Perez',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','331bf7b620cdba29a5f61dbc5e1b258a','2026-08-16 14:23:28','2026-08-16 14:23:28','US',NULL,NULL,NULL),
(155,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','susan.young68@icloud.com','Susan Young',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','11fe35232a30b894a87ff10b9f29cee7','2026-08-16 05:36:35','2026-08-16 05:36:35','US',NULL,NULL,NULL),
(156,NULL,'microsoft-excel-2021-windows','rebecca.hill23@icloud.com','Rebecca Hill',5,'Activation was painless and the key was valid immediately.',1,'published','0df96e88a127546ca476923cfdfaea0c','2026-08-16 14:33:35','2026-08-16 14:33:35','GB',NULL,NULL,NULL),
(157,NULL,'microsoft-visio-2021-professional-windows-pc','jennifer.green23@gmail.com','Jennifer Green',4,'Solid experience overall. The key worked and support was helpful.',1,'published','f2625512c6eb475e91a4e031ac1d8691','2026-08-16 15:56:11','2026-08-16 15:56:11','AU',NULL,NULL,NULL),
(158,NULL,'windows-11-pro','david.martin14@hotmail.com','David Martin',4,'Product key arrived quickly and worked on my new PC right away.',1,'published','31e55742c6311720f59c737468459e77','2026-08-15 07:17:46','2026-08-15 07:17:46','US',NULL,NULL,NULL),
(159,NULL,'microsoft-word-2021-windows','maria.johnson16@icloud.com','Maria Johnson',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','013780f74b6e5bc59c936c39e7cbb0bf','2026-08-15 08:12:27','2026-08-15 08:12:27','CA',NULL,NULL,NULL),
(160,NULL,'microsoft-project-professional-2021-pc','angela.hernandez15@hotmail.com','Angela Hernandez',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','aa062e2aaca310e917cf47ebb8d9255c','2026-08-15 04:57:51','2026-08-15 04:57:51','US',NULL,NULL,NULL),
(161,NULL,'microsoft-visio-2024-professional-windows-pc','robert.brown53@yahoo.com','Robert Brown',4,'Customer service was responsive and the product key was genuine.',1,'published','bb3d2173dc420d46ebaa206dbc41f1fe','2026-08-15 09:57:30','2026-08-15 09:57:30','US',NULL,NULL,NULL),
(162,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','sharon.thompson83@yahoo.com','Sharon Thompson',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','81ce3577a6fba29484ef381369b68e94','2026-08-15 06:29:06','2026-08-15 06:29:06','AU',NULL,NULL,NULL),
(163,NULL,'windows-10-home','raj.williams79@gmail.com','Raj Williams',5,'Quick delivery and a legit license. Happy customer here.',1,'published','147f2fe756e55dfff0d700ea13dc0c53','2026-08-15 05:09:57','2026-08-15 05:09:57','US',NULL,NULL,NULL),
(164,NULL,'microsoft-office-2019-home-business-pc','amanda.harris83@yahoo.com','Amanda Harris',4,'The step-by-step activation instructions were really helpful.',1,'published','03b3619a77b296333a291cf96d3816cd','2026-08-14 10:50:07','2026-08-14 10:50:07','US',NULL,NULL,NULL),
(165,NULL,'microsoft-excel-2021-windows','sofia.mitchell70@gmail.com','Sofia Mitchell',5,'Ordered late at night and still got the key within minutes.',1,'published','90a48b84affbd5f70f6794e3e3cfb0d1','2026-08-14 17:08:59','2026-08-14 17:08:59','EU',NULL,NULL,NULL),
(166,NULL,'windows-10-pro','melissa.green17@outlook.com','Melissa Green',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','a38892a5ef9506fb37c302f2420bfd91','2026-08-14 08:16:51','2026-08-14 08:16:51','EU',NULL,NULL,NULL),
(167,NULL,'microsoft-office-2024-professional-plus-windows','cynthia.hall35@icloud.com','Cynthia Hall',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','6ccbeb23e2f53fa61987fc5dec403932','2026-08-14 12:49:26','2026-08-14 12:49:26','EU',NULL,NULL,NULL),
(168,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','kevin.rivera98@outlook.com','Kevin Rivera',2,'Ordered late at night and still got the key within minutes.',1,'published','1ba59e20c38f1138f25338e19328c702','2026-08-14 15:18:52','2026-08-14 15:18:52','CA','2026-09-16 19:26:36',NULL,NULL),
(169,NULL,'microsoft-office-2021-home-business-mac','christopher.adams70@hotmail.com','Christopher Adams',4,'Great value. The download links they sent were official and safe.',1,'published','bd4cbe51dbc0d9401a20e3beaca4ab28','2026-08-14 06:46:09','2026-08-14 06:46:09','EU',NULL,NULL,NULL),
(170,NULL,'microsoft-office-2024-professional-plus-windows','kathleen.robinson53@gmail.com','Kathleen Robinson',5,'Quick delivery and a legit license. Happy customer here.',1,'published','9e600645a3f1db819b3c334afcdbc9d7','2026-08-13 04:43:36','2026-08-13 04:43:36','US',NULL,NULL,NULL),
(171,NULL,'microsoft-word-2021-windows','matthew.hill42@gmail.com','Matthew Hill',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','d02442bfb47783c6619ff05699e25cd2','2026-08-13 16:20:10','2026-08-13 16:20:10','US',NULL,NULL,NULL),
(172,NULL,'microsoft-excel-2021-windows','kimberly.torres54@icloud.com','Kimberly Torres',5,'Solid experience overall. The key worked and support was helpful.',1,'published','8561e9b0a471df59bb87109450dbd6b3','2026-08-13 12:40:50','2026-08-13 12:40:50','EU',NULL,NULL,NULL),
(173,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','mark.anderson79@hotmail.com','Mark Anderson',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','f8f35eb3677cac56b013bee750d774cb','2026-08-13 16:26:52','2026-08-13 16:26:52','US',NULL,NULL,NULL),
(174,NULL,'ms-project-professional-2019-pc','ashley.gonzalez13@icloud.com','Ashley Gonzalez',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','7d10fdfe5bf5e552d869d0cd3d319c96','2026-08-13 05:58:15','2026-08-13 05:58:15','US',NULL,NULL,NULL),
(175,NULL,'bitdefender-small-office-security-5-devices-1-year','jennifer.gonzalez84@gmail.com','Jennifer Gonzalez',5,'Quick, easy, and it just works. No complaints at all.',1,'published','4b2c9b7d47beba2ae564a2530325df8e','2026-08-13 08:28:41','2026-08-13 08:28:41','CA',NULL,NULL,NULL),
(176,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','amy.garcia54@hotmail.com','Amy Garcia',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','a15ac6584821c0276c19d2dd43197c69','2026-08-12 09:11:43','2026-08-12 09:11:43','CA',NULL,NULL,NULL),
(177,NULL,'windows-11-pro','gary.martin18@outlook.com','Gary Martin',4,'The email with my key and instructions came through in minutes.',1,'published','270aafe832cae79701efc1f5b9d4d76b','2026-08-12 15:17:01','2026-08-12 15:17:01','GB',NULL,NULL,NULL),
(178,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','thomas.baker10@icloud.com','Thomas Baker',5,'Saved over half the retail price and the license is completely genuine.',1,'published','f344c84b419c036aa89337237bbaf8d1','2026-08-12 09:46:54','2026-08-12 09:46:54','GB',NULL,NULL,NULL),
(179,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','charles.miller74@outlook.com','Charles Miller',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','b91719b2222b5e4f02b1739ce95649b0','2026-08-12 15:16:34','2026-08-12 15:16:34','CA',NULL,NULL,NULL),
(180,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','sharon.sanchez58@hotmail.com','Sharon Sanchez',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','c1fee0f3d300d3c9ac7b998ad9f3677b','2026-08-12 11:14:23','2026-08-12 11:14:23','GB',NULL,NULL,NULL),
(181,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','timothy.garcia79@hotmail.com','Timothy Garcia',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','cedd72e0cc2af1fc6b315729df247c43','2026-08-12 08:04:40','2026-08-12 08:04:40','US',NULL,NULL,NULL),
(182,NULL,'microsoft-office-2021-professional-plus-windows','george.mitchell97@yahoo.com','George Mitchell',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','bfd793f11f0f5d128d6da34a71992b9d','2026-08-11 06:34:21','2026-08-11 06:34:21','CA',NULL,NULL,NULL),
(183,NULL,'microsoft-office-2021-professional-plus-windows','nicole.wilson55@icloud.com','Nicole Wilson',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','3854db57c872c6ce6679d35c08dcde82','2026-08-11 12:06:51','2026-08-11 12:06:51','GB',NULL,NULL,NULL),
(184,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','ashley.moore74@outlook.com','Ashley Moore',5,'The activation guide was clear and I was up and running fast.',1,'published','dd1d6fb1eab24be158a2c81aa48f698f','2026-08-11 11:19:58','2026-08-11 11:19:58','US',NULL,NULL,NULL),
(185,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','margaret.moore52@outlook.com','Margaret Moore',2,'Delivered on time and it works perfectly. Five stars.',1,'published','9e84c94b8dab4609bfb767b4a11d573a','2026-08-11 13:10:23','2026-08-11 13:10:23','US','2026-09-16 19:26:36',NULL,NULL),
(186,NULL,'microsoft-office-2019-home-business-pc','samantha.lee34@outlook.com','Samantha Lee',4,'Saved over half the retail price and the license is completely genuine.',1,'published','bca7c3f3e9f123281ae4e8b3d76fa358','2026-08-11 09:11:50','2026-08-11 09:11:50','US',NULL,NULL,NULL),
(187,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','joshua.smith55@hotmail.com','Joshua Smith',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','7ce4cde60e2ea5eb666abb53b0e13aa4','2026-08-11 06:10:20','2026-08-11 06:10:20','US',NULL,NULL,NULL),
(188,NULL,'microsoft-office-2019-professional-plus-windows','deborah.garcia29@yahoo.com','Deborah Garcia',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','97034c0aa3b017393b4c25c0a058b3eb','2026-08-10 05:10:48','2026-08-10 05:10:48','CA',NULL,NULL,NULL),
(189,NULL,'microsoft-office-2019-home-business-pc','deborah.gonzalez21@yahoo.com','Deborah Gonzalez',4,'Was up and running the same hour I ordered. Very impressed.',1,'published','539c7f051c7137d6c424b750e6c54dd0','2026-08-10 11:04:30','2026-08-10 11:04:30','US',NULL,NULL,NULL),
(190,NULL,'microsoft-office-2024-professional-plus-windows','daniel.nelson53@hotmail.com','Daniel Nelson',4,'Key worked instantly and activated on the first try. Great price too.',1,'published','f82468b0e1d1eb5d2494ab427d159519','2026-08-10 07:39:02','2026-08-10 07:39:02','US',NULL,NULL,NULL),
(191,NULL,'microsoft-office-home-2024-mac','ahmed.mitchell96@hotmail.com','Ahmed Mitchell',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','32cd7a04bfe4618c7862984d08d9703c','2026-08-09 04:41:09','2026-08-09 04:41:09','GB',NULL,NULL,NULL),
(192,NULL,'microsoft-office-home-and-student-2019-mac','john.baker76@hotmail.com','John Baker',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','546133a91615c4cb728b2db61b193105','2026-08-09 12:16:54','2026-08-09 12:16:54','US',NULL,NULL,NULL),
(193,NULL,'microsoft-office-2021-home-business-windows','amanda.perez10@yahoo.com','Amanda Perez',2,'The email with my key and instructions came through in minutes.',1,'published','9df43496228bd1fda541664d6773ddb9','2026-08-09 09:09:13','2026-08-09 09:09:13','US','2026-09-16 19:26:36',NULL,NULL),
(194,NULL,'microsoft-word-2021-windows','donald.martin67@hotmail.com','Donald Martin',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','4956d8149a7e80cfd24e0c9c5ba42ae2','2026-08-09 10:51:25','2026-08-09 10:51:25','GB',NULL,NULL,NULL),
(195,NULL,'microsoft-project-professional-2021-pc','elizabeth.lewis74@yahoo.com','Elizabeth Lewis',5,'Ordered late at night and still got the key within minutes.',1,'published','8fae81d2645c0bd6b4fe3c33fc773ee6','2026-08-09 13:49:53','2026-08-09 13:49:53','GB',NULL,NULL,NULL),
(196,NULL,'microsoft-office-2021-home-business-windows','gary.nelson27@icloud.com','Gary Nelson',4,'Works great on my PC. No issues after several weeks of use.',1,'published','788e2e331adefdac6d51c1207b8e01fe','2026-08-08 13:08:41','2026-08-08 13:08:41','EU',NULL,NULL,NULL),
(197,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','laura.nguyen32@icloud.com','Laura Nguyen',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','ab0a1ce8f156c3d8c2eecc95faa4f0b3','2026-08-08 17:25:58','2026-08-08 17:25:58','US',NULL,NULL,NULL),
(198,NULL,'windows-11-home','melissa.martinez50@yahoo.com','Melissa Martinez',3,'Quick delivery and a legit license. Happy customer here.',1,'published','a4f485b994b4084fdafdc3e3cb619659','2026-08-08 13:08:37','2026-08-08 13:08:37','US','2026-09-16 19:26:36',NULL,NULL),
(199,NULL,'microsoft-office-home-2024-pc','justin.gonzalez98@gmail.com','Justin Gonzalez',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','a7cfad7357f253cbf8537de496f26440','2026-08-08 17:31:33','2026-08-08 17:31:33','US',NULL,NULL,NULL),
(200,NULL,'bitdefender-small-office-security-5-devices-1-year','ahmed.hall41@yahoo.com','Ahmed Hall',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','ac82a89278f1ab7b73d39a3dcfb80134','2026-08-08 16:20:12','2026-08-08 16:20:12','US',NULL,NULL,NULL),
(201,NULL,'microsoft-office-2021-home-business-mac','brian.clark79@hotmail.com','Brian Clark',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','fd6972adbabe4840c978bce0859a8e37','2026-08-07 06:07:02','2026-08-07 06:07:02','CA',NULL,NULL,NULL),
(202,NULL,'microsoft-office-2021-home-student-windows','jeffrey.lewis34@gmail.com','Jeffrey Lewis',4,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','0d9af2b2c29278850490d7d102b0915f','2026-08-07 17:05:25','2026-08-07 17:05:25','US',NULL,NULL,NULL),
(203,NULL,'microsoft-project-2024-professional-pc','maria.brown73@icloud.com','Maria Brown',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','89b2a7c21cf0132042627f9f53036813','2026-08-07 05:30:45','2026-08-07 05:30:45','US',NULL,NULL,NULL),
(204,NULL,'microsoft-visio-2024-professional-windows-pc','linda.nguyen64@gmail.com','Linda Nguyen',5,'The email with my key and instructions came through in minutes.',1,'published','6a76b13f9e0030ac52bfa1589876d047','2026-08-07 06:02:58','2026-08-07 06:02:58','US',NULL,NULL,NULL),
(205,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','laura.walker26@icloud.com','Laura Walker',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','1213d889bdf413cada2597e622cee24d','2026-08-07 16:59:13','2026-08-07 16:59:13','US',NULL,NULL,NULL),
(206,NULL,'microsoft-office-home-business-2024-mac','anthony.johnson17@outlook.com','Anthony Johnson',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','1c6bdcb49180e2c62c2469f0f61e5c13','2026-08-06 06:42:18','2026-08-06 06:42:18','US',NULL,NULL,NULL),
(207,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','priya.patel91@icloud.com','Priya Patel',5,'The activation guide was clear and I was up and running fast.',1,'published','708e6ac701abfcff28fdd59f520fbb1f','2026-08-06 07:47:53','2026-08-06 07:47:53','US',NULL,NULL,NULL),
(208,NULL,'microsoft-visio-2021-professional-windows-pc','ryan.rivera57@yahoo.com','Ryan Rivera',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','8effd4d965a09d12aba474d7cadb9b9e','2026-08-06 12:48:00','2026-08-06 12:48:00','GB',NULL,NULL,NULL),
(209,NULL,'microsoft-office-2021-home-student-windows','nancy.sanchez88@icloud.com','Nancy Sanchez',5,'The email with my key and instructions came through in minutes.',1,'published','88d65da143e61b52c384f8d95cacef3f','2026-08-06 04:11:15','2026-08-06 04:11:15','CA',NULL,NULL,NULL),
(210,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','eric.mitchell88@gmail.com','Eric Mitchell',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','7ad99207281252f371dd4150f0ffebd4','2026-08-06 07:19:56','2026-08-06 07:19:56','US',NULL,NULL,NULL),
(211,NULL,'ms-visio-professional-2019-pc','deborah.thomas67@icloud.com','Deborah Thomas',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','7a88a9ced08b6d9bd2aa4b2b56f947fe','2026-08-05 04:40:33','2026-08-05 04:40:33','US',NULL,NULL,NULL),
(212,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','karen.young59@hotmail.com','Karen Young',5,'The step-by-step activation instructions were really helpful.',1,'published','ab98e04392813999892a0fd421831b30','2026-08-05 07:06:10','2026-08-05 07:06:10','US',NULL,NULL,NULL),
(213,NULL,'microsoft-office-home-business-2024-mac','maria.garcia12@icloud.com','Maria Garcia',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','715b9bc47b634170c5406a6c99c7a656','2026-08-05 15:42:51','2026-08-05 15:42:51','CA',NULL,NULL,NULL),
(214,NULL,'microsoft-office-home-and-student-2019-mac','richard.nelson44@outlook.com','Richard Nelson',4,'Key worked instantly and activated on the first try. Great price too.',1,'published','92f5ea1c7b703d8ac17945e3ebe7b54f','2026-08-05 16:54:12','2026-08-05 16:54:12','US',NULL,NULL,NULL),
(215,NULL,'microsoft-office-2021-home-business-mac','sarah.sanchez47@icloud.com','Sarah Sanchez',4,'Delivered on time and it works perfectly. Five stars.',1,'published','1203b0432bb799dade3b4926953e2399','2026-08-05 06:50:35','2026-08-05 06:50:35','EU',NULL,NULL,NULL),
(216,NULL,'windows-10-home','sarah.thomas12@outlook.com','Sarah Thomas',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','7fb228e02da7a9ec3aae9b6eabc58dec','2026-08-04 04:02:52','2026-08-04 04:02:52','US',NULL,NULL,NULL),
(217,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','elizabeth.young22@gmail.com','Elizabeth Young',5,'Delivered on time and it works perfectly. Five stars.',1,'published','ba53c15c508e71a7c7c423a5eb9e45b8','2026-08-04 08:49:57','2026-08-04 08:49:57','US',NULL,NULL,NULL),
(218,NULL,'microsoft-office-2021-home-business-mac','ronald.nguyen19@gmail.com','Ronald Nguyen',4,'The activation guide was clear and I was up and running fast.',1,'published','876c5067bfe5cdaa65ec7c8ed2a29f89','2026-08-04 16:04:09','2026-08-04 16:04:09','US',NULL,NULL,NULL),
(219,NULL,'microsoft-word-2021-windows','lisa.thomas49@hotmail.com','Lisa Thomas',3,'Much cheaper than the official store and it activated without any issues.',1,'published','069aaaad16ec360d49a239da7c6da6d9','2026-08-03 08:44:20','2026-08-03 08:44:20','GB','2026-09-16 19:26:36',NULL,NULL),
(220,NULL,'microsoft-office-2019-professional-plus-windows','jessica.lee76@hotmail.com','Jessica Lee',3,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','61aaf3b6ac7f161b713ace9cd7fe7b9f','2026-08-03 06:29:39','2026-08-03 06:29:39','US','2026-09-16 19:26:36',NULL,NULL),
(221,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','amanda.mitchell37@icloud.com','Amanda Mitchell',4,'Good product for the money. Everything was quick and easy.',1,'published','8e1f2fd2b7cb9cc34d3090a2f8d297b2','2026-08-03 09:51:57','2026-08-03 09:51:57','US',NULL,NULL,NULL),
(222,NULL,'microsoft-office-2019-professional-plus-windows','elizabeth.moore17@icloud.com','Elizabeth Moore',4,'Great value. The download links they sent were official and safe.',1,'published','3b954905f3fafb0c0388e3a7c619c58d','2026-08-03 04:24:04','2026-08-03 04:24:04','GB',NULL,NULL,NULL),
(223,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','ryan.brown65@gmail.com','Ryan Brown',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','4dcc53100bdc90dcddf57576d07c0f2f','2026-08-03 11:15:11','2026-08-03 11:15:11','AU',NULL,NULL,NULL),
(224,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','rebecca.carter79@hotmail.com','Rebecca Carter',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','11a2d34897876db404d9830028dd19df','2026-08-03 09:55:40','2026-08-03 09:55:40','GB',NULL,NULL,NULL),
(225,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','betty.lewis87@outlook.com','Betty Lewis',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','f5ad0f17cc6fd7a3ff6b9ced29912127','2026-08-02 09:23:47','2026-08-02 09:23:47','US',NULL,NULL,NULL),
(226,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','lisa.garcia44@yahoo.com','Lisa Garcia',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','21fccd94f3e479c6b05ef552c2e1071e','2026-08-02 10:38:52','2026-08-02 10:38:52','US',NULL,NULL,NULL),
(227,NULL,'microsoft-office-home-and-business-2019-mac','ryan.white28@icloud.com','Ryan White',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','9ef4c4b8418df42e244cb45fc75e8510','2026-08-02 08:51:21','2026-08-02 08:51:21','US',NULL,NULL,NULL),
(228,NULL,'microsoft-office-2021-home-student-windows','deborah.clark49@outlook.com','Deborah Clark',5,'The step-by-step activation instructions were really helpful.',1,'published','4019763f69b3812d1a245e51cc12221d','2026-08-02 17:13:27','2026-08-02 17:13:27','US',NULL,NULL,NULL),
(229,NULL,'microsoft-office-2019-home-business-pc','maria.gonzalez88@outlook.com','Maria Gonzalez',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','7938279600495056783d57a44c42691a','2026-08-02 07:35:03','2026-08-02 07:35:03','GB',NULL,NULL,NULL),
(230,NULL,'windows-10-home','emily.hernandez66@hotmail.com','Emily Hernandez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','1192bccf8f28c30e301b1443c156e15f','2026-08-02 12:58:16','2026-08-02 12:58:16','US',NULL,NULL,NULL),
(231,NULL,'windows-10-pro','donna.carter26@icloud.com','Donna Carter',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','cf8f43df3af966b3fe68a32cae7f47fc','2026-08-02 11:38:45','2026-08-02 11:38:45','US',NULL,NULL,NULL),
(232,NULL,'microsoft-office-home-2024-pc','ronald.gonzalez45@hotmail.com','Ronald Gonzalez',3,'Was up and running the same hour I ordered. Very impressed.',1,'published','f284401f96a4a58f93e1c9c7655f34d9','2026-08-01 04:27:25','2026-08-01 04:27:25','US','2026-09-16 19:26:36',NULL,NULL),
(233,NULL,'microsoft-office-2021-home-student-windows','daniel.gonzalez14@gmail.com','Daniel Gonzalez',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','11d7164c0a7967ec228b8aab6ed7519e','2026-08-01 08:06:55','2026-08-01 08:06:55','CA',NULL,NULL,NULL),
(234,NULL,'windows-11-home','charles.moore64@hotmail.com','Charles Moore',3,'Solid experience overall. The key worked and support was helpful.',1,'published','a3076dea8695ef880ba24f4ba306976a','2026-08-01 16:07:50','2026-08-01 16:07:50','CA','2026-09-16 19:26:36',NULL,NULL),
(235,NULL,'windows-10-home','susan.moore63@icloud.com','Susan Moore',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','5f0e75aa03d009e9e25dea5c97fcf1dd','2026-08-01 12:13:47','2026-08-01 12:13:47','US',NULL,NULL,NULL),
(236,NULL,'microsoft-office-2021-home-business-mac','nicole.rodriguez45@icloud.com','Nicole Rodriguez',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','89d13e6e13967c1c637a1b08b59b675e','2026-08-01 16:39:17','2026-08-01 16:39:17','GB',NULL,NULL,NULL),
(237,NULL,'microsoft-office-home-2024-mac','karen.jones47@gmail.com','Karen Jones',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','5baae7804c9af339a8d819401b98fe2f','2026-08-01 10:35:16','2026-08-01 10:35:16','AU',NULL,NULL,NULL),
(238,NULL,'microsoft-office-home-and-business-2019-mac','margaret.rodriguez84@outlook.com','Margaret Rodriguez',5,'The email with my key and instructions came through in minutes.',1,'published','c87b3ba6c9c42ef33695c90670155beb','2026-08-01 06:29:49','2026-08-01 06:29:49','CA',NULL,NULL,NULL),
(239,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','ronald.anderson56@icloud.com','Ronald Anderson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','4100576f2e64efcb5dfa0bcad1e0dc69','2026-07-31 17:15:21','2026-07-31 17:15:21','US',NULL,NULL,NULL),
(240,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','melissa.hernandez98@yahoo.com','Melissa Hernandez',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','286c80839f71c9a5a0a36dbdedf94f1d','2026-07-31 11:21:23','2026-07-31 11:21:23','GB',NULL,NULL,NULL),
(241,NULL,'bitdefender-small-office-security-5-devices-1-year','nancy.nelson52@gmail.com','Nancy Nelson',5,'Ordered late at night and still got the key within minutes.',1,'published','1f74c1609469cf1b806e366031c4bcea','2026-07-31 15:12:42','2026-07-31 15:12:42','US',NULL,NULL,NULL),
(242,NULL,'microsoft-office-home-and-student-2019-mac','charles.hill83@outlook.com','Charles Hill',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','27b06100eb52d5105ef362f2ca145302','2026-07-31 08:12:37','2026-07-31 08:12:37','US',NULL,NULL,NULL),
(243,NULL,'microsoft-excel-2021-windows','william.lopez71@yahoo.com','William Lopez',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','8873aa87a4cc8f24b591953cb1e5a716','2026-07-31 10:35:08','2026-07-31 10:35:08','US',NULL,NULL,NULL),
(244,NULL,'microsoft-office-2019-professional-plus-windows','timothy.white83@gmail.com','Timothy White',4,'Everything went smoothly from purchase to activation. Recommended.',1,'published','920f2ada8d891de9eddf932a54e19c1b','2026-07-31 15:47:27','2026-07-31 15:47:27','US',NULL,NULL,NULL),
(245,NULL,'windows-10-home','brian.jackson96@icloud.com','Brian Jackson',5,'Good product for the money. Everything was quick and easy.',1,'published','bacc9900d7f1fdee3f9b745c53aabf38','2026-07-31 11:59:54','2026-07-31 11:59:54','US',NULL,NULL,NULL),
(246,NULL,'microsoft-office-2019-home-student-windows','mark.garcia86@icloud.com','Mark Garcia',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','478632dc63bfd9ccaa16d33d96ab68c8','2026-07-30 11:18:20','2026-07-30 11:18:20','EU',NULL,NULL,NULL),
(247,NULL,'microsoft-office-home-2024-mac','daniel.hernandez56@gmail.com','Daniel Hernandez',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','ec445b2ed3a510974559055e246186b8','2026-07-30 12:38:31','2026-07-30 12:38:31','CA',NULL,NULL,NULL),
(248,NULL,'microsoft-excel-2021-windows','ronald.campbell26@hotmail.com','Ronald Campbell',5,'Really good price and prompt delivery. Working great so far.',1,'published','1ab575b9cf913e878dda4c4c7bb24be6','2026-07-30 07:49:47','2026-07-30 07:49:47','CA',NULL,NULL,NULL),
(249,NULL,'microsoft-office-2021-home-student-mac','daniel.white27@icloud.com','Daniel White',4,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','514eeab58240d527d39e2094def424f7','2026-07-30 06:59:09','2026-07-30 06:59:09','US',NULL,NULL,NULL),
(250,NULL,'microsoft-office-home-and-business-2019-mac','sharon.thomas91@gmail.com','Sharon Thomas',4,'Activated without a hitch. Great communication throughout.',1,'published','68b70c7f8dab24f40e38fc263ed929d4','2026-07-30 15:32:09','2026-07-30 15:32:09','GB',NULL,NULL,NULL),
(251,NULL,'ms-project-professional-2019-pc','sarah.walker92@yahoo.com','Sarah Walker',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','96f0d627673349b468c7b35d521c6139','2026-07-30 10:19:52','2026-07-30 10:19:52','CA',NULL,NULL,NULL),
(252,NULL,'microsoft-office-home-business-2024-mac','paul.johnson60@outlook.com','Paul Johnson',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','6c9afbc8871173fcfce04003e4555dae','2026-07-30 05:26:49','2026-07-30 05:26:49','US',NULL,NULL,NULL),
(253,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','mark.davis95@gmail.com','Mark Davis',5,'Much cheaper than the official store and it activated without any issues.',1,'published','2b6ebbdff9acf7144abfeec51e55c07e','2026-07-29 12:16:54','2026-07-29 12:16:54','US',NULL,NULL,NULL),
(254,NULL,'ms-project-professional-2019-pc','patricia.king17@outlook.com','Patricia King',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','dd97417ce63d225392a206ae99cd1925','2026-07-29 09:32:22','2026-07-29 09:32:22','EU',NULL,NULL,NULL),
(255,NULL,'microsoft-visio-2021-professional-windows-pc','juan.perez65@icloud.com','Juan Perez',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','0113bf78b6f343b20adce42ea4f5dde8','2026-07-29 14:48:29','2026-07-29 14:48:29','EU',NULL,NULL,NULL),
(256,NULL,'windows-11-pro','brian.harris53@hotmail.com','Brian Harris',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','08139bcbb37f85c672f5e6dc59ad1781','2026-07-29 10:26:18','2026-07-29 10:26:18','EU',NULL,NULL,NULL),
(257,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','margaret.adams19@icloud.com','Margaret Adams',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','0b80ec7bef6250ce7551607c4952a489','2026-07-29 07:46:35','2026-07-29 07:46:35','US',NULL,NULL,NULL),
(258,NULL,'ms-project-professional-2019-pc','james.carter43@outlook.com','James Carter',4,'Customer service was responsive and the product key was genuine.',1,'published','aa4a24acab039ac31f4fdc63293d723f','2026-07-29 06:06:07','2026-07-29 06:06:07','US',NULL,NULL,NULL),
(259,NULL,'windows-10-pro','justin.nelson21@outlook.com','Justin Nelson',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','28c34a53f86e836533c813a5fc655b1f','2026-07-28 07:35:28','2026-07-28 07:35:28','AU',NULL,NULL,NULL),
(260,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','cynthia.green72@icloud.com','Cynthia Green',4,'The step-by-step activation instructions were really helpful.',1,'published','a0f11d88668627fed5bf54d0385be21f','2026-07-28 17:29:27','2026-07-28 17:29:27','US',NULL,NULL,NULL),
(261,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','gary.miller89@hotmail.com','Gary Miller',2,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','de9c1b141b5bb277e28355991ceecc5a','2026-07-28 14:23:23','2026-07-28 14:23:23','US','2026-09-16 19:26:36',NULL,NULL),
(262,NULL,'microsoft-visio-2024-professional-windows-pc','thomas.wilson18@icloud.com','Thomas Wilson',5,'Good product for the money. Everything was quick and easy.',1,'published','8be1c5dcfda986ae2ab8bd5cac5626c1','2026-07-28 15:15:38','2026-07-28 15:15:38','US',NULL,NULL,NULL),
(263,NULL,'ms-visio-professional-2019-pc','susan.miller20@gmail.com','Susan Miller',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','89b689c8f0cc7e94faddd75eb26abb5b','2026-07-27 14:22:11','2026-07-27 14:22:11','AU',NULL,NULL,NULL),
(264,NULL,'microsoft-office-home-2024-mac','charles.young73@icloud.com','Charles Young',4,'Great value. The download links they sent were official and safe.',1,'published','550cc8a3a43bf2a9ca12bfcf34062285','2026-07-27 11:31:41','2026-07-27 11:31:41','US',NULL,NULL,NULL),
(265,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','maria.mitchell51@yahoo.com','Maria Mitchell',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','38795050ccddb36f309fce0565548598','2026-07-27 04:32:49','2026-07-27 04:32:49','GB',NULL,NULL,NULL),
(266,NULL,'microsoft-office-2024-professional-plus-windows','angela.clark81@icloud.com','Angela Clark',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','41edf9105e76c49bc94d7a45bb7ade5d','2026-07-27 07:47:46','2026-07-27 07:47:46','GB',NULL,NULL,NULL),
(267,NULL,'microsoft-office-home-business-2024-pc','donald.brown18@yahoo.com','Donald Brown',4,'Product key arrived quickly and worked on my new PC right away.',1,'published','6eb820d1303da41bf39e4c3b251069d7','2026-07-27 15:57:46','2026-07-27 15:57:46','US',NULL,NULL,NULL),
(268,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','barbara.johnson96@outlook.com','Barbara Johnson',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','96c374a958e443fe7444fd8fde360b17','2026-07-27 15:39:28','2026-07-27 15:39:28','GB',NULL,NULL,NULL),
(269,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','jessica.jackson17@gmail.com','Jessica Jackson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','6fbb0cbebb88975bebdc1c512540180a','2026-07-27 09:23:36','2026-07-27 09:23:36','US',NULL,NULL,NULL),
(270,NULL,'microsoft-office-home-and-student-2019-mac','cynthia.adams23@outlook.com','Cynthia Adams',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','2626e8748e7770abbfdfa96ab5ef6b98','2026-07-26 10:37:19','2026-07-26 10:37:19','US',NULL,NULL,NULL),
(271,NULL,'windows-10-home','michelle.rivera37@icloud.com','Michelle Rivera',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','4c41a2ad36c63e5cc0151ec50a766167','2026-07-26 15:52:28','2026-07-26 15:52:28','CA',NULL,NULL,NULL),
(272,NULL,'microsoft-excel-2021-windows','matthew.brown31@hotmail.com','Matthew Brown',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','08b04a4f51ff2670a5d970b28db8f36d','2026-07-26 13:38:36','2026-07-26 13:38:36','US',NULL,NULL,NULL),
(273,NULL,'windows-11-home','rebecca.davis14@icloud.com','Rebecca Davis',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','be4719e010cf7ee125baf47d7bd665a8','2026-07-26 09:01:37','2026-07-26 09:01:37','CA',NULL,NULL,NULL),
(274,NULL,'microsoft-office-home-business-2024-pc','rebecca.gonzalez43@outlook.com','Rebecca Gonzalez',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','6615ce7dfb0ffd5d186070f62d035d8d','2026-07-26 12:07:50','2026-07-26 12:07:50','GB',NULL,NULL,NULL),
(275,NULL,'microsoft-project-2024-professional-pc','stephen.robinson36@hotmail.com','Stephen Robinson',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','36f0b54cef94298c2665d8ccf130af6b','2026-07-25 09:55:17','2026-07-25 09:55:17','US',NULL,NULL,NULL),
(276,NULL,'microsoft-excel-2021-windows','donald.flores56@gmail.com','Donald Flores',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','0c2b89698ebb53035b87bfd9ab40b598','2026-07-25 16:00:48','2026-07-25 16:00:48','AU',NULL,NULL,NULL),
(277,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','ryan.nguyen60@outlook.com','Ryan Nguyen',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','4448c8fc746124ee27be3ecd64e4384c','2026-07-25 13:09:34','2026-07-25 13:09:34','CA',NULL,NULL,NULL),
(278,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','michael.torres35@yahoo.com','Michael Torres',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','0275e5d803c337530d0f60f563797fec','2026-07-25 09:43:27','2026-07-25 09:43:27','US',NULL,NULL,NULL),
(279,NULL,'microsoft-office-2021-home-business-mac','barbara.gonzalez69@gmail.com','Barbara Gonzalez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','7aedcc1e5332296cd7b74d3f99b8221e','2026-07-25 17:45:40','2026-07-25 17:45:40','CA',NULL,NULL,NULL),
(280,NULL,'microsoft-visio-2021-professional-windows-pc','paul.martin83@hotmail.com','Paul Martin',5,'Quick delivery and a legit license. Happy customer here.',1,'published','d9fd83fc4c4b72ed2c7a07537d7a17b8','2026-07-25 15:13:32','2026-07-25 15:13:32','US',NULL,NULL,NULL),
(281,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','lisa.moore21@icloud.com','Lisa Moore',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','05a895a9e5fd8e68913426317da3e254','2026-07-25 10:01:30','2026-07-25 10:01:30','US',NULL,NULL,NULL),
(282,NULL,'microsoft-visio-2024-professional-windows-pc','betty.miller98@hotmail.com','Betty Miller',5,'Great value. The download links they sent were official and safe.',1,'published','406e31027c6daa1a83a80dd00bc7928a','2026-07-24 13:14:45','2026-07-24 13:14:45','EU',NULL,NULL,NULL),
(283,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','sharon.rodriguez46@icloud.com','Sharon Rodriguez',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','8852fe5a7021b4f8fe7033e01df5c1b2','2026-07-24 05:56:07','2026-07-24 05:56:07','US',NULL,NULL,NULL),
(284,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','joseph.scott46@gmail.com','Joseph Scott',5,'The step-by-step activation instructions were really helpful.',1,'published','28cbc0918bdf05c3540b85cb7c0f124f','2026-07-24 11:30:12','2026-07-24 11:30:12','US',NULL,NULL,NULL),
(285,NULL,'microsoft-office-2019-home-student-windows','richard.rivera82@icloud.com','Richard Rivera',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','05485b9f741c22620f7c43dc8e352dd0','2026-07-24 17:18:29','2026-07-24 17:18:29','US',NULL,NULL,NULL),
(286,NULL,'windows-10-pro','kenneth.williams61@outlook.com','Kenneth Williams',5,'Saved over half the retail price and the license is completely genuine.',1,'published','4342bdba60f76dc9f53dbcb0680c4e66','2026-07-24 17:49:18','2026-07-24 17:49:18','US',NULL,NULL,NULL),
(287,NULL,'microsoft-project-2024-professional-pc','ahmed.smith43@outlook.com','Ahmed Smith',2,'Fast, reliable and affordable. Exactly as advertised.',1,'published','d7dda9f1c37094f1ec7b7244e5d4645e','2026-07-24 13:42:44','2026-07-24 13:42:44','AU','2026-09-16 19:26:36',NULL,NULL),
(288,NULL,'microsoft-office-2021-home-business-mac','wei.green76@hotmail.com','Wei Green',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','4bbbeb706cab94b1850b904e9887090f','2026-07-23 10:54:08','2026-07-23 10:54:08','US',NULL,NULL,NULL),
(289,NULL,'microsoft-office-home-and-student-2019-mac','donna.miller87@gmail.com','Donna Miller',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','ec582e17c5b0c1d3f1c129984f41d27f','2026-07-23 16:55:53','2026-07-23 16:55:53','US',NULL,NULL,NULL),
(290,NULL,'windows-11-home','jason.scott47@yahoo.com','Jason Scott',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','690e3938421a6b6afcc7073ce87884ee','2026-07-23 05:58:16','2026-07-23 05:58:16','GB',NULL,NULL,NULL),
(291,NULL,'microsoft-project-2024-professional-pc','nicole.walker53@hotmail.com','Nicole Walker',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','0e13258408bf246ad17fc28c16b17bc9','2026-07-23 16:56:26','2026-07-23 16:56:26','AU',NULL,NULL,NULL),
(292,NULL,'windows-10-pro','jennifer.harris61@outlook.com','Jennifer Harris',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','9aef000a9be77be659b81160664c2c64','2026-07-23 17:57:53','2026-07-23 17:57:53','US',NULL,NULL,NULL),
(293,NULL,'microsoft-office-home-business-2024-pc','paul.flores98@gmail.com','Paul Flores',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','24e3dbeb173183ff23c0c838e60ab829','2026-07-23 07:13:28','2026-07-23 07:13:28','EU',NULL,NULL,NULL),
(294,NULL,'microsoft-excel-2021-windows','thomas.rodriguez60@yahoo.com','Thomas Rodriguez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','195aeddc8e880673290fd249a1a46999','2026-07-23 17:45:52','2026-07-23 17:45:52','US',NULL,NULL,NULL),
(295,NULL,'microsoft-office-home-and-student-2019-mac','david.moore92@icloud.com','David Moore',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','98519051b12e21025be3704b6a1c3abb','2026-07-22 16:00:38','2026-07-22 16:00:38','CA',NULL,NULL,NULL),
(296,NULL,'microsoft-office-2019-professional-plus-windows','christopher.smith51@hotmail.com','Christopher Smith',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','481e23c8009e68f8c40593c0537d76fe','2026-07-22 06:52:01','2026-07-22 06:52:01','US',NULL,NULL,NULL),
(297,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','maria.king80@yahoo.com','Maria King',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','cac09dda3d3e5a943898d8ce919da277','2026-07-22 09:28:37','2026-07-22 09:28:37','US',NULL,NULL,NULL),
(298,NULL,'microsoft-office-2021-home-business-windows','thomas.campbell51@gmail.com','Thomas Campbell',4,'Great value. The download links they sent were official and safe.',1,'published','2e9da1789027eafa8568ceb157ec0481','2026-07-21 11:13:10','2026-07-21 11:13:10','US',NULL,NULL,NULL),
(299,NULL,'microsoft-office-home-and-business-2019-mac','raj.young16@hotmail.com','Raj Young',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','e1f8bdbf36dd52df8d038ac75f573613','2026-07-21 16:02:21','2026-07-21 16:02:21','CA',NULL,NULL,NULL),
(300,NULL,'ms-visio-professional-2019-pc','laura.davis46@icloud.com','Laura Davis',4,'Much cheaper than the official store and it activated without any issues.',1,'published','451ace4bb6a26741d1972c852a71a00b','2026-07-21 15:03:15','2026-07-21 15:03:15','US',NULL,NULL,NULL),
(301,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','robert.lee80@hotmail.com','Robert Lee',5,'Solid experience overall. The key worked and support was helpful.',1,'published','bbd3e8500db000cc44463d6c1c541a03','2026-07-21 06:39:20','2026-07-21 06:39:20','CA',NULL,NULL,NULL),
(302,NULL,'microsoft-visio-2024-professional-windows-pc','robert.nelson42@outlook.com','Robert Nelson',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','72be7502d64dc6f0549c4ca58136c93e','2026-07-21 13:55:36','2026-07-21 13:55:36','US',NULL,NULL,NULL),
(303,NULL,'microsoft-office-2021-home-student-mac','james.thompson83@icloud.com','James Thompson',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','58b0f6106e01e9075ca17754b0be8cee','2026-07-21 14:56:07','2026-07-21 14:56:07','US',NULL,NULL,NULL),
(304,NULL,'ms-visio-professional-2019-pc','david.carter34@hotmail.com','David Carter',5,'The activation guide was clear and I was up and running fast.',1,'published','e202cbfdbee7be922cb9b4b9a4d38ca1','2026-07-20 08:26:09','2026-07-20 08:26:09','EU',NULL,NULL,NULL),
(305,NULL,'microsoft-office-2019-home-student-windows','deborah.flores43@icloud.com','Deborah Flores',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','5adb9ae2990f83d684339c53d8be8ef2','2026-07-20 14:30:57','2026-07-20 14:30:57','AU',NULL,NULL,NULL),
(306,NULL,'windows-11-home','emily.martin32@hotmail.com','Emily Martin',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','685b738212b5a478e7680139c28072b1','2026-07-20 13:50:42','2026-07-20 13:50:42','GB',NULL,NULL,NULL),
(307,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','melissa.white87@icloud.com','Melissa White',5,'Activated without a hitch. Great communication throughout.',1,'published','3d146f5a7e6301f6f90ab147b99ed81c','2026-07-20 09:36:43','2026-07-20 09:36:43','GB',NULL,NULL,NULL),
(308,NULL,'microsoft-office-2019-home-business-pc','michael.mitchell10@gmail.com','Michael Mitchell',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','811a0544646148dc4c0d192b0d10195e','2026-07-20 08:24:01','2026-07-20 08:24:01','GB',NULL,NULL,NULL),
(309,NULL,'microsoft-office-2019-professional-plus-windows','elizabeth.martinez35@yahoo.com','Elizabeth Martinez',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','6adc83522eb86d4bb18d5e8be6c3bf14','2026-07-20 12:52:50','2026-07-20 12:52:50','US',NULL,NULL,NULL),
(310,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','donald.white53@outlook.com','Donald White',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','c6de8a785fb1e7e90306c4bb033d155f','2026-07-19 11:16:44','2026-07-19 11:16:44','US',NULL,NULL,NULL),
(311,NULL,'microsoft-visio-2021-professional-windows-pc','hiroshi.walker84@icloud.com','Hiroshi Walker',4,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','9ca9474e9b85be5ccc551edeee499249','2026-07-19 11:42:22','2026-07-19 11:42:22','US',NULL,NULL,NULL),
(312,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','pamela.allen30@hotmail.com','Pamela Allen',4,'The step-by-step activation instructions were really helpful.',1,'published','7f576efe2f5d134278884b1a65b18b3a','2026-07-19 14:24:41','2026-07-19 14:24:41','US',NULL,NULL,NULL),
(313,NULL,'microsoft-office-2021-home-student-windows','laura.allen67@gmail.com','Laura Allen',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','3940168c7bade0d44ab7db03b5d11681','2026-07-18 09:57:16','2026-07-18 09:57:16','US',NULL,NULL,NULL),
(314,NULL,'windows-10-home','donald.hill24@yahoo.com','Donald Hill',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','398a6df9fb68523b272ead804a59db90','2026-07-18 11:16:34','2026-07-18 11:16:34','US',NULL,NULL,NULL),
(315,NULL,'microsoft-office-2021-professional-plus-windows','larry.williams46@gmail.com','Larry Williams',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','93db75761909c84342801b73efad09d4','2026-07-18 15:28:00','2026-07-18 15:28:00','US',NULL,NULL,NULL),
(316,NULL,'microsoft-office-home-business-2024-pc','gary.nguyen77@icloud.com','Gary Nguyen',2,'Second time ordering from this store. Reliable every time.',1,'published','53ed1545aa69f8faa0f78b2b0ee8d2fb','2026-07-18 07:02:09','2026-07-18 07:02:09','US','2026-09-16 19:26:36',NULL,NULL),
(317,NULL,'bitdefender-small-office-security-5-devices-1-year','kevin.thomas87@icloud.com','Kevin Thomas',4,'Much cheaper than the official store and it activated without any issues.',1,'published','fafa0229ce676789a35f1672b5c4e661','2026-07-18 07:49:13','2026-07-18 07:49:13','US',NULL,NULL,NULL),
(318,NULL,'microsoft-excel-2021-windows','susan.harris31@yahoo.com','Susan Harris',5,'The email with my key and instructions came through in minutes.',1,'published','78b25c2ba589dae4ad2a0b812ae7ce0f','2026-07-18 16:45:43','2026-07-18 16:45:43','CA',NULL,NULL,NULL),
(319,NULL,'bitdefender-small-office-security-5-devices-1-year','priya.king42@gmail.com','Priya King',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','568e9cbf7c3b3af2590f18bc557b0ac5','2026-07-17 07:20:59','2026-07-17 07:20:59','EU',NULL,NULL,NULL),
(320,NULL,'microsoft-office-2021-home-business-mac','cynthia.lopez33@hotmail.com','Cynthia Lopez',5,'Really good price and prompt delivery. Working great so far.',1,'published','e0788b9620849e38db8a0cbe1a410bbe','2026-07-17 15:52:14','2026-07-17 15:52:14','EU',NULL,NULL,NULL),
(321,NULL,'microsoft-office-2021-home-student-mac','jessica.rodriguez41@yahoo.com','Jessica Rodriguez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','8a8bcb9125670505aeb3d2b73f698877','2026-07-17 07:07:21','2026-07-17 07:07:21','US',NULL,NULL,NULL),
(322,NULL,'microsoft-office-2021-home-student-mac','olga.perez35@outlook.com','Olga Perez',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','37ef9e59ce47fbc35eafb58773983c59','2026-07-17 10:07:58','2026-07-17 10:07:58','US',NULL,NULL,NULL),
(323,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','emily.anderson26@yahoo.com','Emily Anderson',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','6915e1103003c6894d40e891baaf6d9a','2026-07-17 04:43:42','2026-07-17 04:43:42','CA',NULL,NULL,NULL),
(324,NULL,'microsoft-visio-2024-professional-windows-pc','george.nguyen32@icloud.com','George Nguyen',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','ae27752947823b76379c4643f54a1329','2026-07-17 17:53:36','2026-07-17 17:53:36','US',NULL,NULL,NULL),
(325,NULL,'microsoft-office-2021-professional-plus-windows','kenneth.king30@gmail.com','Kenneth King',5,'Second time ordering from this store. Reliable every time.',1,'published','c2f240d0b2119f7a1cbf90866b534848','2026-07-17 06:38:19','2026-07-17 06:38:19','GB',NULL,NULL,NULL),
(326,NULL,'microsoft-office-home-and-business-2019-mac','ryan.rodriguez48@gmail.com','Ryan Rodriguez',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','f1cd1bb4145705553f5d3b404c7091d5','2026-07-16 10:11:44','2026-07-16 10:11:44','EU',NULL,NULL,NULL),
(327,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','ronald.miller59@icloud.com','Ronald Miller',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','55689ff44aeb29d01ddbb051651085a0','2026-07-16 16:39:06','2026-07-16 16:39:06','US',NULL,NULL,NULL),
(328,NULL,'microsoft-office-2021-home-business-mac','emily.green25@yahoo.com','Emily Green',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','92f206f5479f1056491aa006e47f04b1','2026-07-16 17:58:03','2026-07-16 17:58:03','US',NULL,NULL,NULL),
(329,NULL,'microsoft-office-2021-home-business-windows','john.davis91@outlook.com','John Davis',4,'Delivered on time and it works perfectly. Five stars.',1,'published','1ea1bd7ef2dedeb1f0109978b497b870','2026-07-16 13:53:21','2026-07-16 13:53:21','CA',NULL,NULL,NULL),
(330,NULL,'microsoft-visio-2024-professional-windows-pc','sarah.clark56@gmail.com','Sarah Clark',4,'Quick delivery and a legit license. Happy customer here.',1,'published','119359b7b0be8c62cbc7d3222a7960dc','2026-07-16 11:39:05','2026-07-16 11:39:05','CA',NULL,NULL,NULL),
(331,NULL,'microsoft-visio-2021-professional-windows-pc','david.thomas30@yahoo.com','David Thomas',4,'Ordered late at night and still got the key within minutes.',1,'published','1f5b1c201ba53e44a18df3bdc1e8d04b','2026-07-16 10:59:01','2026-07-16 10:59:01','US',NULL,NULL,NULL),
(332,NULL,'microsoft-office-2019-home-student-windows','ryan.nelson32@icloud.com','Ryan Nelson',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','2912ae6c99c88e05c8d96c2191f4e97b','2026-07-15 12:03:10','2026-07-15 12:03:10','US',NULL,NULL,NULL),
(333,NULL,'ms-project-professional-2019-pc','angela.rivera72@yahoo.com','Angela Rivera',4,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','1459fbbc05ad892eca7740ab19bda3ec','2026-07-15 09:18:10','2026-07-15 09:18:10','GB',NULL,NULL,NULL),
(334,NULL,'bitdefender-small-office-security-5-devices-1-year','karen.perez20@icloud.com','Karen Perez',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','f187b4e66d94c59449fe29cc00e94ea0','2026-07-15 04:15:25','2026-07-15 04:15:25','EU',NULL,NULL,NULL),
(335,NULL,'microsoft-office-2021-home-student-mac','olga.white61@yahoo.com','Olga White',4,'Much cheaper than the official store and it activated without any issues.',1,'published','4489d2e6802283cba996e2b9eef0690f','2026-07-15 06:55:40','2026-07-15 06:55:40','US',NULL,NULL,NULL),
(336,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','anthony.allen94@hotmail.com','Anthony Allen',5,'Quick, easy, and it just works. No complaints at all.',1,'published','10cd0c3af2acdd7467699a807d2cef0b','2026-07-14 09:07:37','2026-07-14 09:07:37','AU',NULL,NULL,NULL),
(337,NULL,'microsoft-visio-2021-professional-windows-pc','amy.adams25@hotmail.com','Amy Adams',5,'Second time ordering from this store. Reliable every time.',1,'published','d744759b379c2ead2dae968c489f1b84','2026-07-14 08:19:59','2026-07-14 08:19:59','US',NULL,NULL,NULL),
(338,NULL,'windows-10-pro','betty.lee49@hotmail.com','Betty Lee',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','6f112eef5ea42809de88a0534fdfabc7','2026-07-14 05:37:20','2026-07-14 05:37:20','US',NULL,NULL,NULL),
(339,NULL,'microsoft-office-home-business-2024-pc','ryan.sanchez52@icloud.com','Ryan Sanchez',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','1605bccaaf3768fc706bb65f573ae0cd','2026-07-13 09:18:15','2026-07-13 09:18:15','CA',NULL,NULL,NULL),
(340,NULL,'microsoft-office-2019-professional-plus-windows','ashley.nguyen63@gmail.com','Ashley Nguyen',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','1660ad29ed0e793d142325128ea02aff','2026-07-13 07:50:13','2026-07-13 07:50:13','GB',NULL,NULL,NULL),
(341,NULL,'microsoft-office-home-and-student-2019-mac','ashley.torres38@outlook.com','Ashley Torres',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','483e6bf16aff97d96c2e851165ebb721','2026-07-13 05:25:35','2026-07-13 05:25:35','US',NULL,NULL,NULL),
(342,NULL,'windows-10-home','ronald.rivera12@icloud.com','Ronald Rivera',4,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','69c17d323020394b483dcd176ccc9afa','2026-07-12 09:46:51','2026-07-12 09:46:51','CA',NULL,NULL,NULL),
(343,NULL,'microsoft-project-professional-2021-pc','angela.mitchell23@hotmail.com','Angela Mitchell',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','95bf0c39cf39f7ffc249d381a262cd70','2026-07-12 08:19:55','2026-07-12 08:19:55','US',NULL,NULL,NULL),
(344,NULL,'microsoft-office-2019-professional-plus-windows','joshua.wright18@yahoo.com','Joshua Wright',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','5d4168d6ef522065388080262f422539','2026-07-12 16:38:37','2026-07-12 16:38:37','EU',NULL,NULL,NULL),
(345,NULL,'microsoft-office-home-2024-mac','david.jackson61@outlook.com','David Jackson',4,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','fea2f16724464868c5baf3d8a70cc924','2026-07-12 15:32:36','2026-07-12 15:32:36','CA',NULL,NULL,NULL),
(346,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','kevin.torres68@icloud.com','Kevin Torres',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','75fd9f9d0cb473097e0f421bc7225838','2026-07-12 17:55:43','2026-07-12 17:55:43','GB',NULL,NULL,NULL),
(347,NULL,'microsoft-project-2024-professional-pc','james.smith45@gmail.com','James Smith',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','c5fb9da9022e01cb36d45142fc477384','2026-07-12 08:30:14','2026-07-12 08:30:14','CA',NULL,NULL,NULL),
(348,NULL,'microsoft-office-2021-home-business-windows','sharon.campbell84@outlook.com','Sharon Campbell',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','1709329f9671b940b60b893153b2888c','2026-07-11 15:47:18','2026-07-11 15:47:18','US',NULL,NULL,NULL),
(349,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','kevin.lee53@hotmail.com','Kevin Lee',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','f2a1fbb9c271ed17cc0a264524f3bf1f','2026-07-11 17:59:04','2026-07-11 17:59:04','EU',NULL,NULL,NULL),
(350,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','sofia.baker59@hotmail.com','Sofia Baker',5,'The activation guide was clear and I was up and running fast.',1,'published','139824336843fd459cfa69b79aa2a10c','2026-07-11 07:49:41','2026-07-11 07:49:41','US',NULL,NULL,NULL),
(351,NULL,'microsoft-office-2021-home-student-mac','jeffrey.carter43@gmail.com','Jeffrey Carter',2,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','d710bda3955093a69cb314c978ebf428','2026-07-11 17:13:33','2026-07-11 17:13:33','AU','2026-09-16 19:26:36',NULL,NULL),
(352,NULL,'microsoft-office-2024-professional-plus-windows','susan.carter81@gmail.com','Susan Carter',4,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','482d153053b58da528dc969b31cf4117','2026-07-11 15:08:51','2026-07-11 15:08:51','GB',NULL,NULL,NULL),
(353,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','karen.hall64@hotmail.com','Karen Hall',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','ce45b32c78cf368f998d8d504cd2b43e','2026-07-11 15:53:36','2026-07-11 15:53:36','GB',NULL,NULL,NULL),
(354,NULL,'microsoft-office-2021-home-business-windows','george.ramirez34@icloud.com','George Ramirez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','7ad724e45ee85053cc8108792a9608b6','2026-07-11 13:03:09','2026-07-11 13:03:09','EU',NULL,NULL,NULL),
(355,NULL,'windows-11-pro','linda.robinson40@yahoo.com','Linda Robinson',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','66d5fa6ecec507503b34a3871fdcd29d','2026-07-10 07:50:59','2026-07-10 07:50:59','US',NULL,NULL,NULL),
(356,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','nancy.adams25@yahoo.com','Nancy Adams',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','3676137ab96ad1967b2feb316c749700','2026-07-10 07:48:31','2026-07-10 07:48:31','EU',NULL,NULL,NULL),
(357,NULL,'microsoft-office-2021-home-business-windows','matthew.clark45@outlook.com','Matthew Clark',5,'Great value. The download links they sent were official and safe.',1,'published','a7ff790594f81fb2212b995f872a619e','2026-07-10 04:04:57','2026-07-10 04:04:57','CA',NULL,NULL,NULL),
(358,NULL,'microsoft-excel-2021-windows','donald.hall75@outlook.com','Donald Hall',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','2127238e116589f3702e075657a17563','2026-07-10 17:17:41','2026-07-10 17:17:41','AU',NULL,NULL,NULL),
(359,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','raj.lee31@yahoo.com','Raj Lee',5,'Saved over half the retail price and the license is completely genuine.',1,'published','05889c528a26b41493dac406e5bba9e2','2026-07-10 04:42:57','2026-07-10 04:42:57','US',NULL,NULL,NULL),
(360,NULL,'microsoft-office-home-and-business-2019-mac','nancy.white30@hotmail.com','Nancy White',4,'Good product for the money. Everything was quick and easy.',1,'published','956c3a3f74c7909191b0ae32a082aed8','2026-07-10 13:31:18','2026-07-10 13:31:18','US',NULL,NULL,NULL),
(361,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','timothy.adams16@yahoo.com','Timothy Adams',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','3541b233226815fde2291ec8ef2f2d42','2026-07-10 09:15:24','2026-07-10 09:15:24','AU',NULL,NULL,NULL),
(362,NULL,'ms-visio-professional-2019-pc','linda.martin99@icloud.com','Linda Martin',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','6670aab1a37f0d81f13d64a7c488bc60','2026-07-09 07:38:54','2026-07-09 07:38:54','GB',NULL,NULL,NULL),
(363,NULL,'windows-10-pro','ahmed.moore74@icloud.com','Ahmed Moore',4,'Great value. The download links they sent were official and safe.',1,'published','b938b4de736f385b411373db66ee331d','2026-07-09 16:15:56','2026-07-09 16:15:56','US',NULL,NULL,NULL),
(364,NULL,'microsoft-visio-2024-professional-windows-pc','mark.baker72@outlook.com','Mark Baker',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','62ac41106b32aff9a3157728cc0c8623','2026-07-09 06:48:21','2026-07-09 06:48:21','US',NULL,NULL,NULL),
(365,NULL,'ms-project-professional-2019-pc','wei.wright25@gmail.com','Wei Wright',4,'Activated without a hitch. Great communication throughout.',1,'published','9c66e7f67879c20633ce8a9d06d74c91','2026-07-09 11:50:08','2026-07-09 11:50:08','CA',NULL,NULL,NULL),
(366,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','ryan.baker60@hotmail.com','Ryan Baker',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','c6832d6946075f2380ec15a361db2d8d','2026-07-09 13:52:40','2026-07-09 13:52:40','CA',NULL,NULL,NULL),
(367,NULL,'microsoft-office-2021-home-business-windows','william.sanchez65@hotmail.com','William Sanchez',5,'Activation was painless and the key was valid immediately.',1,'published','be0cf85c8330ca42bb2515bbee419834','2026-07-08 12:30:57','2026-07-08 12:30:57','EU',NULL,NULL,NULL),
(368,NULL,'microsoft-office-home-2024-pc','ahmed.gonzalez81@hotmail.com','Ahmed Gonzalez',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','0d8eb971278a6dfd114ff1a499a151e5','2026-07-08 05:31:24','2026-07-08 05:31:24','CA',NULL,NULL,NULL),
(369,NULL,'windows-10-home','james.mitchell18@outlook.com','James Mitchell',5,'Much cheaper than the official store and it activated without any issues.',1,'published','2eef74a82f7c3b7f0f690e6da72fdb36','2026-07-08 17:52:42','2026-07-08 17:52:42','CA',NULL,NULL,NULL),
(370,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','sharon.green19@gmail.com','Sharon Green',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','63f8005d2f1d8af8d9e34e6c43bdbdc2','2026-07-07 04:13:57','2026-07-07 04:13:57','US',NULL,NULL,NULL),
(371,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','deborah.wright10@hotmail.com','Deborah Wright',5,'Really good price and prompt delivery. Working great so far.',1,'published','2e7aacf76379025b58dd23160777dc68','2026-07-07 13:18:31','2026-07-07 13:18:31','US',NULL,NULL,NULL),
(372,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','stephanie.white59@icloud.com','Stephanie White',4,'Would recommend to anyone looking for a legit key at a good price.',1,'published','670b48f0408cdd3ec83b3199927fe018','2026-07-07 14:16:51','2026-07-07 14:16:51','US',NULL,NULL,NULL),
(373,NULL,'microsoft-project-2024-professional-pc','ahmed.green75@icloud.com','Ahmed Green',4,'Activated without a hitch. Great communication throughout.',1,'published','06c3f130fc0c0073664c040f0be571b9','2026-07-06 17:13:42','2026-07-06 17:13:42','EU',NULL,NULL,NULL),
(374,NULL,'microsoft-office-2021-professional-plus-windows','matthew.young61@hotmail.com','Matthew Young',4,'Ordered late at night and still got the key within minutes.',1,'published','66f115f73c4542bb6fc194de31ea5b4a','2026-07-06 09:02:06','2026-07-06 09:02:06','US',NULL,NULL,NULL),
(375,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','anthony.nelson36@gmail.com','Anthony Nelson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','8cf0aa5a7df3e063d2b34a682a5d4ee4','2026-07-06 09:29:35','2026-07-06 09:29:35','US',NULL,NULL,NULL),
(376,NULL,'microsoft-office-2021-home-business-windows','timothy.campbell38@icloud.com','Timothy Campbell',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','dddd6d3fdacd8ba35f9bf2f530e1eeca','2026-07-05 07:32:02','2026-07-05 07:32:02','US',NULL,NULL,NULL),
(377,NULL,'microsoft-office-2021-home-student-mac','joshua.lewis71@icloud.com','Joshua Lewis',5,'Delivered on time and it works perfectly. Five stars.',1,'published','dbe7df0b73aaceaee61ccc48f06ebd15','2026-07-05 07:46:36','2026-07-05 07:46:36','US',NULL,NULL,NULL),
(378,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','lisa.lopez53@icloud.com','Lisa Lopez',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','c3b4812cf0d51e7af71cd18a8bdafa9a','2026-07-05 08:57:03','2026-07-05 08:57:03','US',NULL,NULL,NULL),
(379,NULL,'microsoft-visio-2024-professional-windows-pc','richard.robinson36@gmail.com','Richard Robinson',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','c59284403b515fe8ce13b8c367475867','2026-07-04 13:29:36','2026-07-04 13:29:36','US',NULL,NULL,NULL),
(380,NULL,'microsoft-office-2021-home-student-windows','larry.patel59@yahoo.com','Larry Patel',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','d92367ddef1f29c333ef0ec2c957f937','2026-07-04 14:33:46','2026-07-04 14:33:46','CA',NULL,NULL,NULL),
(381,NULL,'ms-visio-professional-2019-pc','margaret.rivera53@gmail.com','Margaret Rivera',4,'Honestly better than I expected. Delivery was almost instant.',1,'published','0ea7817643928a543d561cd5a2245442','2026-07-04 16:22:55','2026-07-04 16:22:55','CA',NULL,NULL,NULL),
(382,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','daniel.lee86@yahoo.com','Daniel Lee',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','0416f7968692d684e55da2b90eafad20','2026-07-04 13:13:09','2026-07-04 13:13:09','GB',NULL,NULL,NULL),
(383,NULL,'microsoft-office-home-business-2024-mac','anthony.smith38@icloud.com','Anthony Smith',5,'Activated without a hitch. Great communication throughout.',1,'published','91c8d68bb731fe17fd3481f07712b1a4','2026-07-04 07:39:26','2026-07-04 07:39:26','US',NULL,NULL,NULL),
(384,NULL,'microsoft-word-2021-windows','pamela.smith56@outlook.com','Pamela Smith',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','55d1357397360b43a743671cba6d1b7c','2026-07-04 15:28:08','2026-07-04 15:28:08','AU',NULL,NULL,NULL),
(385,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','michelle.martinez97@yahoo.com','Michelle Martinez',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','c229e10b93d75080247a1491a6ce4fc4','2026-07-04 09:16:28','2026-07-04 09:16:28','US',NULL,NULL,NULL),
(386,NULL,'microsoft-office-2021-home-business-windows','melissa.williams13@gmail.com','Melissa Williams',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','2518ba77546418077ee7fb736aece0c9','2026-07-03 10:29:51','2026-07-03 10:29:51','US',NULL,NULL,NULL),
(387,NULL,'microsoft-office-2021-home-student-mac','jeffrey.allen66@hotmail.com','Jeffrey Allen',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','70d4260cefcafadd608761aeb3bec426','2026-07-03 11:10:20','2026-07-03 11:10:20','CA',NULL,NULL,NULL),
(388,NULL,'microsoft-visio-2021-professional-windows-pc','edward.martinez76@gmail.com','Edward Martinez',5,'Quick delivery and a legit license. Happy customer here.',1,'published','6e0a6cd8f68714f2bd23919e25e1f31d','2026-07-03 06:14:06','2026-07-03 06:14:06','US',NULL,NULL,NULL),
(389,NULL,'microsoft-office-home-2024-mac','john.nelson11@outlook.com','John Nelson',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','d54a01d36eb63c70673ae1900f0bcc84','2026-07-03 14:24:28','2026-07-03 14:24:28','EU',NULL,NULL,NULL),
(390,NULL,'microsoft-office-2024-professional-plus-windows','anthony.garcia57@yahoo.com','Anthony Garcia',5,'Solid experience overall. The key worked and support was helpful.',1,'published','e3b355c3fc1cf5df6160eb9180d5094f','2026-07-03 04:56:58','2026-07-03 04:56:58','US',NULL,NULL,NULL),
(391,NULL,'microsoft-office-2021-professional-plus-windows','anthony.green78@hotmail.com','Anthony Green',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','b5ddfa894659037f928b3e3c15632b01','2026-07-02 08:31:37','2026-07-02 08:31:37','US',NULL,NULL,NULL),
(392,NULL,'microsoft-office-home-and-business-2019-mac','cynthia.torres61@gmail.com','Cynthia Torres',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','1cab53f4e97dbca478e9695aec748fd0','2026-07-02 16:53:46','2026-07-02 16:53:46','US',NULL,NULL,NULL),
(393,NULL,'microsoft-visio-2021-professional-windows-pc','barbara.king54@icloud.com','Barbara King',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','1aeb1f17eb9527ca13bd297feaa232d8','2026-07-02 11:36:03','2026-07-02 11:36:03','CA',NULL,NULL,NULL),
(394,NULL,'microsoft-office-2021-home-student-windows','elizabeth.rodriguez44@yahoo.com','Elizabeth Rodriguez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','7887405cf2824a6ba386d9ee4bf6ba50','2026-07-02 04:34:52','2026-07-02 04:34:52','EU',NULL,NULL,NULL),
(395,NULL,'windows-11-home','sofia.young83@hotmail.com','Sofia Young',5,'Much cheaper than the official store and it activated without any issues.',1,'published','c037f8f2e9540985d7440554ba649718','2026-07-01 06:15:52','2026-07-01 06:15:52','CA',NULL,NULL,NULL),
(396,NULL,'microsoft-office-home-business-2024-mac','joseph.gonzalez23@outlook.com','Joseph Gonzalez',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','cdef9f9aca3c9e476e831d9c382f9025','2026-07-01 08:31:13','2026-07-01 08:31:13','GB',NULL,NULL,NULL),
(397,NULL,'microsoft-office-home-2024-pc','juan.rodriguez16@hotmail.com','Juan Rodriguez',5,'Quick, easy, and it just works. No complaints at all.',1,'published','6d506bde8a00c70779ad28c24decb902','2026-07-01 09:46:30','2026-07-01 09:46:30','GB',NULL,NULL,NULL),
(398,NULL,'microsoft-office-home-and-business-2019-mac','emily.lee49@hotmail.com','Emily Lee',5,'The activation guide was clear and I was up and running fast.',1,'published','a3b82eef6fbf2058d32ba6a7448b13e9','2026-07-01 09:22:51','2026-07-01 09:22:51','AU',NULL,NULL,NULL),
(399,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','barbara.martin81@icloud.com','Barbara Martin',4,'The activation guide was clear and I was up and running fast.',1,'published','50bda14fec4a09cd3dfb3de3348cd0a4','2026-06-30 15:53:18','2026-06-30 15:53:18','EU',NULL,NULL,NULL),
(400,NULL,'bitdefender-small-office-security-5-devices-1-year','stephen.hall12@outlook.com','Stephen Hall',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','e913395a51cb98d9d182bf1a3f04a0ff','2026-06-30 16:53:00','2026-06-30 16:53:00','EU',NULL,NULL,NULL),
(401,NULL,'windows-11-home','ahmed.white10@hotmail.com','Ahmed White',5,'Really good price and prompt delivery. Working great so far.',1,'published','df4d0182dd3e9054efad6575dc79c33e','2026-06-30 16:03:55','2026-06-30 16:03:55','EU',NULL,NULL,NULL),
(402,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','sandra.miller37@icloud.com','Sandra Miller',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','2a720e1ecd00936bd3ffabda04fb764b','2026-06-30 07:09:49','2026-06-30 07:09:49','US',NULL,NULL,NULL),
(403,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','edward.moore79@hotmail.com','Edward Moore',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','a262b9ea14a9a991e790d91dd9688a45','2026-06-30 11:15:25','2026-06-30 11:15:25','US',NULL,NULL,NULL),
(404,NULL,'microsoft-word-2021-windows','george.martinez91@outlook.com','George Martinez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','fb869a3d7240a0f9b9b5dd5166d31ab9','2026-06-30 17:40:43','2026-06-30 17:40:43','US',NULL,NULL,NULL),
(405,NULL,'bitdefender-small-office-security-5-devices-1-year','samantha.ramirez29@hotmail.com','Samantha Ramirez',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','e7f3410d6b95b2df4e134a3a5afd607b','2026-06-29 17:35:12','2026-06-29 17:35:12','GB',NULL,NULL,NULL),
(406,NULL,'ms-project-professional-2019-pc','barbara.smith56@yahoo.com','Barbara Smith',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','88711343bb1ae13be5b08b201f74d1f1','2026-06-29 04:38:19','2026-06-29 04:38:19','GB',NULL,NULL,NULL),
(407,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','nancy.smith14@icloud.com','Nancy Smith',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','ed589b049bbf6c0a5d850cbfb5d77ae4','2026-06-29 17:31:06','2026-06-29 17:31:06','GB',NULL,NULL,NULL),
(408,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','stephanie.smith52@yahoo.com','Stephanie Smith',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','e9ac2a72114abfd270ea18abeb6e26d0','2026-06-29 16:14:06','2026-06-29 16:14:06','US',NULL,NULL,NULL),
(409,NULL,'bitdefender-small-office-security-5-devices-1-year','margaret.jackson48@outlook.com','Margaret Jackson',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','5de0a2095598cdeb5d868896fe96eaff','2026-06-29 06:00:43','2026-06-29 06:00:43','US',NULL,NULL,NULL),
(410,NULL,'microsoft-office-2024-professional-plus-windows','michael.adams86@hotmail.com','Michael Adams',4,'Saved over half the retail price and the license is completely genuine.',1,'published','b4e76d10c7ac01910e6e852f21d153c9','2026-06-28 06:38:37','2026-06-28 06:38:37','GB',NULL,NULL,NULL),
(411,NULL,'ms-visio-professional-2019-pc','betty.green93@hotmail.com','Betty Green',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','5472929fccf1b0916e1aa64abbdf52d7','2026-06-28 08:14:51','2026-06-28 08:14:51','GB',NULL,NULL,NULL),
(412,NULL,'windows-10-home','gary.harris72@icloud.com','Gary Harris',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','bead1dffc53de05f630c1a30de804146','2026-06-28 06:35:51','2026-06-28 06:35:51','AU',NULL,NULL,NULL),
(413,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','raj.king14@outlook.com','Raj King',5,'Excellent service. The activation guide made setup really easy.',1,'published','6505ab35175e7298008e35178c9ec731','2026-06-28 16:10:49','2026-06-28 16:10:49','US',NULL,NULL,NULL),
(414,NULL,'windows-11-pro','linda.green31@hotmail.com','Linda Green',4,'Good product for the money. Everything was quick and easy.',1,'published','5429b591ff97203149956e75f8c7e61b','2026-06-28 09:49:24','2026-06-28 09:49:24','US',NULL,NULL,NULL),
(415,NULL,'microsoft-office-home-2024-pc','christopher.walker36@hotmail.com','Christopher Walker',5,'Second time ordering from this store. Reliable every time.',1,'published','d55c8dc39f8be6c6f40704c00e5ccb74','2026-06-28 11:36:28','2026-06-28 11:36:28','AU',NULL,NULL,NULL),
(416,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','cynthia.rodriguez81@gmail.com','Cynthia Rodriguez',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','2ee2e139811eeb70b408242db70b66cd','2026-06-28 14:15:18','2026-06-28 14:15:18','GB',NULL,NULL,NULL),
(417,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','steven.harris63@icloud.com','Steven Harris',3,'Great value. The download links they sent were official and safe.',1,'published','970479537c392070acaf6e06c373498c','2026-06-27 11:01:29','2026-06-27 11:01:29','EU','2026-09-16 19:26:36',NULL,NULL),
(418,NULL,'microsoft-office-home-business-2024-pc','lisa.sanchez83@yahoo.com','Lisa Sanchez',5,'Works great on my PC. No issues after several weeks of use.',1,'published','6342e492fe98239e8507fe590c1e6038','2026-06-27 14:39:53','2026-06-27 14:39:53','US',NULL,NULL,NULL),
(419,NULL,'microsoft-office-home-and-business-2019-mac','susan.taylor87@hotmail.com','Susan Taylor',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','b7188f5b22e8590b94d6a92fc4c6261c','2026-06-27 13:20:34','2026-06-27 13:20:34','CA',NULL,NULL,NULL),
(420,NULL,'microsoft-office-2021-home-student-windows','linda.young10@hotmail.com','Linda Young',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','cf5251fdaf3c2cade6a0760867c71728','2026-06-27 11:41:29','2026-06-27 11:41:29','GB',NULL,NULL,NULL),
(421,NULL,'ms-visio-professional-2019-pc','sandra.anderson44@gmail.com','Sandra Anderson',4,'Great value. The download links they sent were official and safe.',1,'published','ef5ba40a6e788b5bf37e37e700dc15f8','2026-06-27 06:42:00','2026-06-27 06:42:00','GB',NULL,NULL,NULL),
(422,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','gary.walker85@yahoo.com','Gary Walker',5,'Good product for the money. Everything was quick and easy.',1,'published','078a998127057675105a6cc1af9e156d','2026-06-27 14:05:42','2026-06-27 14:05:42','US',NULL,NULL,NULL),
(423,NULL,'ms-project-professional-2019-pc','jason.miller25@icloud.com','Jason Miller',3,'Second time ordering from this store. Reliable every time.',1,'published','0770f66d986162332f90e8b029fd5a1c','2026-06-27 07:19:50','2026-06-27 07:19:50','GB','2026-09-16 19:26:36',NULL,NULL),
(424,NULL,'microsoft-office-home-business-2024-mac','raj.wright78@gmail.com','Raj Wright',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','7ae07ff67469d1af620a8b5cf92540d9','2026-06-26 05:48:40','2026-06-26 05:48:40','CA',NULL,NULL,NULL),
(425,NULL,'microsoft-office-2021-professional-plus-windows','daniel.brown82@outlook.com','Daniel Brown',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','700bc84ba7021a08113741ca8a37874d','2026-06-26 13:30:40','2026-06-26 13:30:40','US',NULL,NULL,NULL),
(426,NULL,'microsoft-project-2024-professional-pc','david.clark32@yahoo.com','David Clark',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','96f083308241a14d500a2771762f345e','2026-06-26 12:49:16','2026-06-26 12:49:16','GB',NULL,NULL,NULL),
(427,NULL,'microsoft-office-2021-home-student-windows','priya.mitchell48@icloud.com','Priya Mitchell',3,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','58cc63c9645c4ca2709a18b1ad70fe6d','2026-06-26 10:16:02','2026-06-26 10:16:02','EU','2026-09-16 19:26:36',NULL,NULL),
(428,NULL,'microsoft-office-home-2024-pc','brian.gonzalez64@yahoo.com','Brian Gonzalez',5,'The activation guide was clear and I was up and running fast.',1,'published','fdda2481e612a1fdad3d580fd820c46c','2026-06-26 16:13:20','2026-06-26 16:13:20','GB',NULL,NULL,NULL),
(429,NULL,'microsoft-office-2021-home-business-windows','elizabeth.wright41@hotmail.com','Elizabeth Wright',5,'Activated without a hitch. Great communication throughout.',1,'published','64f623aa193865ee47079d381d49cfef','2026-06-26 16:33:42','2026-06-26 16:33:42','CA',NULL,NULL,NULL),
(430,NULL,'microsoft-office-2021-home-business-mac','olga.martinez94@yahoo.com','Olga Martinez',3,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','a626e4c3e4820b554c1d48830d5573bf','2026-06-26 08:00:39','2026-06-26 08:00:39','GB','2026-09-16 19:26:36',NULL,NULL),
(431,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','richard.anderson64@yahoo.com','Richard Anderson',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','507df083c05767ce175a52df962173ed','2026-06-25 04:47:22','2026-06-25 04:47:22','GB',NULL,NULL,NULL),
(432,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','justin.adams27@gmail.com','Justin Adams',3,'Product key arrived quickly and worked on my new PC right away.',1,'published','6574e9c92333200e2ebee125666a83ec','2026-06-25 09:50:21','2026-06-25 09:50:21','US','2026-09-16 19:26:36',NULL,NULL),
(433,NULL,'microsoft-project-professional-2021-pc','amy.moore33@yahoo.com','Amy Moore',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','ee242d443880df49a8e14ee033b40d3d','2026-06-25 06:24:06','2026-06-25 06:24:06','GB',NULL,NULL,NULL),
(434,NULL,'microsoft-office-2021-home-business-windows','charles.robinson11@icloud.com','Charles Robinson',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','b2f1073c7729082e8578b09047ac8fa0','2026-06-25 15:12:06','2026-06-25 15:12:06','AU',NULL,NULL,NULL),
(435,NULL,'microsoft-office-2024-professional-plus-windows','sofia.campbell84@icloud.com','Sofia Campbell',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','7a255020b474f68c01b98eb41af8b5d6','2026-06-25 15:40:11','2026-06-25 15:40:11','CA',NULL,NULL,NULL),
(436,NULL,'windows-11-home','kevin.allen96@yahoo.com','Kevin Allen',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','cc2a4af557c094fa65ff7f1bf96e1960','2026-06-24 04:02:56','2026-06-24 04:02:56','CA',NULL,NULL,NULL),
(437,NULL,'ms-project-professional-2019-pc','susan.king73@gmail.com','Susan King',4,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','20995581b585c55d3cab0c4afeb1e9ea','2026-06-24 14:40:20','2026-06-24 14:40:20','GB',NULL,NULL,NULL),
(438,NULL,'microsoft-visio-2024-professional-windows-pc','joshua.anderson75@icloud.com','Joshua Anderson',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','dffe83c60c996d9fbf21a3596618392c','2026-06-24 15:00:05','2026-06-24 15:00:05','GB',NULL,NULL,NULL),
(439,NULL,'ms-visio-professional-2019-pc','gary.scott37@hotmail.com','Gary Scott',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','2637f653a839e953295f193623489413','2026-06-24 09:24:50','2026-06-24 09:24:50','CA',NULL,NULL,NULL),
(440,NULL,'microsoft-office-home-business-2024-pc','sofia.sanchez44@gmail.com','Sofia Sanchez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','bcb6fc2b1b28708bb5597648e842ea49','2026-06-24 06:39:24','2026-06-24 06:39:24','CA',NULL,NULL,NULL),
(441,NULL,'microsoft-visio-2021-professional-windows-pc','olga.king76@icloud.com','Olga King',5,'Activation was painless and the key was valid immediately.',1,'published','6d1a6167d9a873bcf534dc8f4650eac1','2026-06-24 13:11:39','2026-06-24 13:11:39','US',NULL,NULL,NULL),
(442,NULL,'microsoft-office-2021-home-student-windows','raj.miller97@outlook.com','Raj Miller',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','7eecadea4666f942d0c82c259dc50bc1','2026-06-23 11:23:02','2026-06-23 11:23:02','US',NULL,NULL,NULL),
(443,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','barbara.young28@icloud.com','Barbara Young',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','ec6c9d8728f090fde51efcf78f03850c','2026-06-23 07:32:23','2026-06-23 07:32:23','AU',NULL,NULL,NULL),
(444,NULL,'microsoft-office-home-business-2024-pc','william.robinson68@hotmail.com','William Robinson',4,'The step-by-step activation instructions were really helpful.',1,'published','80ad993c8d6d0671156db3f12d1268f2','2026-06-23 12:39:18','2026-06-23 12:39:18','US',NULL,NULL,NULL),
(445,NULL,'microsoft-office-home-2024-mac','paul.nguyen98@icloud.com','Paul Nguyen',5,'Great value. The download links they sent were official and safe.',1,'published','b1137fc5bffc945848ae465bcb72d510','2026-06-23 06:57:12','2026-06-23 06:57:12','US',NULL,NULL,NULL),
(446,NULL,'microsoft-office-2021-home-student-mac','cynthia.miller22@hotmail.com','Cynthia Miller',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','c334079bd9c58ba3956c1f4799febe94','2026-06-22 06:59:30','2026-06-22 06:59:30','US',NULL,NULL,NULL),
(447,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','david.smith36@icloud.com','David Smith',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','aa74c1180edb13b75129cabd421d0808','2026-06-22 13:25:24','2026-06-22 13:25:24','AU',NULL,NULL,NULL),
(448,NULL,'microsoft-visio-2024-professional-windows-pc','robert.young44@hotmail.com','Robert Young',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','6146ead91c0c896665184ec9e33b6ccd','2026-06-22 15:32:01','2026-06-22 15:32:01','US',NULL,NULL,NULL),
(449,NULL,'microsoft-visio-2024-professional-windows-pc','george.jones93@gmail.com','George Jones',4,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','1d6b648b3eaed8a42fb99f2d09c086c5','2026-06-22 06:00:46','2026-06-22 06:00:46','US',NULL,NULL,NULL),
(450,NULL,'microsoft-office-2019-home-student-windows','carlos.lee62@gmail.com','Carlos Lee',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','b91f371f0f0f8e6f9e0a7315d9d381d9','2026-06-22 08:30:51','2026-06-22 08:30:51','US',NULL,NULL,NULL),
(451,NULL,'microsoft-office-2021-professional-plus-windows','matthew.scott62@hotmail.com','Matthew Scott',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','d726044b4ce03906a5c0ebf9c84b4ad6','2026-06-21 15:39:05','2026-06-21 15:39:05','AU',NULL,NULL,NULL),
(452,NULL,'microsoft-visio-2024-professional-windows-pc','james.moore51@icloud.com','James Moore',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','9cb60320911f48787d5e6cc6a591cf7b','2026-06-21 16:56:54','2026-06-21 16:56:54','US',NULL,NULL,NULL),
(453,NULL,'windows-11-pro','susan.jones10@gmail.com','Susan Jones',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','096f4a6393201a6d41bda027a1e44d3d','2026-06-21 17:50:08','2026-06-21 17:50:08','US',NULL,NULL,NULL),
(454,NULL,'ms-visio-professional-2019-pc','donald.moore11@outlook.com','Donald Moore',5,'Second time ordering from this store. Reliable every time.',1,'published','06f4776c91276a66f14ee9224baad627','2026-06-21 13:11:57','2026-06-21 13:11:57','US',NULL,NULL,NULL),
(455,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','anna.brown87@outlook.com','Anna Brown',5,'Activation was painless and the key was valid immediately.',1,'published','1bf0ddc88f91b6c5e3a1b4e708b239bf','2026-06-21 08:43:29','2026-06-21 08:43:29','US',NULL,NULL,NULL),
(456,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','kenneth.taylor43@yahoo.com','Kenneth Taylor',5,'Good product for the money. Everything was quick and easy.',1,'published','21d55f67b3d1b0c8d3826993bc9186bc','2026-06-20 04:23:31','2026-06-20 04:23:31','GB',NULL,NULL,NULL),
(457,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','steven.king59@gmail.com','Steven King',5,'Delivered on time and it works perfectly. Five stars.',1,'published','0f1e7f1a68c6155b7f4f8fe3000e94cc','2026-06-20 11:10:46','2026-06-20 11:10:46','US',NULL,NULL,NULL),
(458,NULL,'microsoft-office-2021-home-business-mac','samantha.sanchez98@gmail.com','Samantha Sanchez',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','123b4840b18611180fc2c5c8ad3065a4','2026-06-20 13:30:01','2026-06-20 13:30:01','GB',NULL,NULL,NULL),
(459,NULL,'windows-11-home','samantha.gonzalez34@hotmail.com','Samantha Gonzalez',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','b5a58ac45c3cac7bf312be37c3792974','2026-06-20 12:27:06','2026-06-20 12:27:06','US',NULL,NULL,NULL),
(460,NULL,'microsoft-office-2019-home-student-windows','jeffrey.gonzalez48@outlook.com','Jeffrey Gonzalez',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','ea01a966df42c494ff88f94a8fed0f61','2026-06-19 07:05:39','2026-06-19 07:05:39','CA',NULL,NULL,NULL),
(461,NULL,'microsoft-office-2021-home-business-mac','christopher.lewis40@outlook.com','Christopher Lewis',5,'Ordered late at night and still got the key within minutes.',1,'published','7540e04d8953035bd7f14e890f71fea2','2026-06-19 11:32:14','2026-06-19 11:32:14','GB',NULL,NULL,NULL),
(462,NULL,'microsoft-visio-2021-professional-windows-pc','juan.king37@hotmail.com','Juan King',5,'Superb service. The whole process took less than five minutes.',1,'published','45aaadbdcb4476091cf623c2a710392a','2026-06-19 06:13:25','2026-06-19 06:13:25','US',NULL,NULL,NULL),
(463,NULL,'microsoft-office-2021-professional-plus-windows','juan.campbell29@hotmail.com','Juan Campbell',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','afcb7fb0df5b2975b83a7b96f846cf5c','2026-06-19 15:57:36','2026-06-19 15:57:36','US',NULL,NULL,NULL),
(464,NULL,'bitdefender-small-office-security-5-devices-1-year','patricia.hernandez48@icloud.com','Patricia Hernandez',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','42a51e362cb6c9f6d62ddf5e704dd9fe','2026-06-18 16:01:34','2026-06-18 16:01:34','US',NULL,NULL,NULL),
(465,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','eric.taylor41@gmail.com','Eric Taylor',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','9fae8dc3dbb4ef4d0d1aec3b34e44abe','2026-06-18 17:06:13','2026-06-18 17:06:13','US',NULL,NULL,NULL),
(466,NULL,'microsoft-office-2019-professional-plus-windows','larry.young78@hotmail.com','Larry Young',4,'The step-by-step activation instructions were really helpful.',1,'published','280d646d522b18568cb76b01e51384c1','2026-06-18 14:36:46','2026-06-18 14:36:46','EU',NULL,NULL,NULL),
(467,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','kenneth.martin94@yahoo.com','Kenneth Martin',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','2bcbb8c5db3529cc49bbeb31f145a70f','2026-06-18 17:44:58','2026-06-18 17:44:58','US',NULL,NULL,NULL),
(468,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','christopher.clark56@icloud.com','Christopher Clark',5,'Delivered on time and it works perfectly. Five stars.',1,'published','548fa58530c170122f5992dbee06d4bf','2026-06-17 05:46:32','2026-06-17 05:46:32','CA',NULL,NULL,NULL),
(469,NULL,'microsoft-word-2021-windows','george.hall73@icloud.com','George Hall',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','5d2fcb4872455a8e4e965d8a165cf9b2','2026-06-17 14:05:27','2026-06-17 14:05:27','CA',NULL,NULL,NULL),
(470,NULL,'windows-11-pro','rebecca.sanchez95@yahoo.com','Rebecca Sanchez',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','a14b63f4e5acbeb1ceb721383498c21f','2026-06-17 08:17:29','2026-06-17 08:17:29','EU',NULL,NULL,NULL),
(471,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','jeffrey.adams82@gmail.com','Jeffrey Adams',5,'Much cheaper than the official store and it activated without any issues.',1,'published','25976145c20e50e530838fe006f0ec7d','2026-06-17 08:10:57','2026-06-17 08:10:57','US',NULL,NULL,NULL),
(472,NULL,'microsoft-office-2021-home-business-mac','joseph.wilson50@hotmail.com','Joseph Wilson',3,'Genuine key, best price I found online. Will buy from here again.',1,'published','a775b2e524e40216f925379226b316c8','2026-06-16 05:18:43','2026-06-16 05:18:43','EU','2026-09-16 19:26:36',NULL,NULL),
(473,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','carlos.davis59@hotmail.com','Carlos Davis',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','171a1693ab3ac0da4b0fe478455ae4aa','2026-06-16 12:28:37','2026-06-16 12:28:37','EU',NULL,NULL,NULL),
(474,NULL,'microsoft-office-home-2024-pc','juan.lee85@outlook.com','Juan Lee',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','908d85dd05bfeba8aaaf69f99e49a09c','2026-06-16 13:40:33','2026-06-16 13:40:33','US',NULL,NULL,NULL),
(475,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','paul.garcia61@icloud.com','Paul Garcia',5,'Really good price and prompt delivery. Working great so far.',1,'published','d23016d0e08fd57403946c1fdcfd6818','2026-06-16 06:04:02','2026-06-16 06:04:02','AU',NULL,NULL,NULL),
(476,NULL,'microsoft-visio-2021-professional-windows-pc','melissa.allen95@yahoo.com','Melissa Allen',4,'Ordered late at night and still got the key within minutes.',1,'published','316ff4fc664a8482e5dc7a72ca6db4fe','2026-06-16 11:20:04','2026-06-16 11:20:04','AU',NULL,NULL,NULL),
(477,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','maria.nguyen53@yahoo.com','Maria Nguyen',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','f3c2cf28ea0370ff57ee8c679999fc62','2026-06-16 09:33:02','2026-06-16 09:33:02','CA',NULL,NULL,NULL),
(478,NULL,'microsoft-office-home-2024-mac','timothy.rivera76@icloud.com','Timothy Rivera',5,'Quick, easy, and it just works. No complaints at all.',1,'published','8d399ed720f97e346216b9fe88663b29','2026-06-16 16:11:14','2026-06-16 16:11:14','US',NULL,NULL,NULL),
(479,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','laura.taylor33@gmail.com','Laura Taylor',5,'Good product for the money. Everything was quick and easy.',1,'published','0f583e19d97fe641a2550d7619c844fa','2026-06-15 14:41:53','2026-06-15 14:41:53','CA',NULL,NULL,NULL),
(480,NULL,'microsoft-office-home-and-student-2019-mac','ahmed.torres70@gmail.com','Ahmed Torres',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','ef3165ead14321681adbf76110bb8294','2026-06-15 12:26:56','2026-06-15 12:26:56','CA',NULL,NULL,NULL),
(481,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','eric.jackson27@outlook.com','Eric Jackson',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','becdfe45a5f45b28b084b050c14dd704','2026-06-15 10:31:36','2026-06-15 10:31:36','AU',NULL,NULL,NULL),
(482,NULL,'windows-10-home','laura.miller61@icloud.com','Laura Miller',4,'Customer service was responsive and the product key was genuine.',1,'published','a6067bc1dabadc256afc7f45bdb421d4','2026-06-15 05:58:30','2026-06-15 05:58:30','CA',NULL,NULL,NULL),
(483,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','stephen.taylor46@hotmail.com','Stephen Taylor',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','666b6d9e8680e65def0e26f43fdd15fd','2026-06-15 05:59:52','2026-06-15 05:59:52','US',NULL,NULL,NULL),
(484,NULL,'microsoft-office-2021-home-student-mac','donna.nguyen97@gmail.com','Donna Nguyen',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','b4860a88d246cd145270d25ef05e99f1','2026-06-15 07:52:47','2026-06-15 07:52:47','CA',NULL,NULL,NULL),
(485,NULL,'windows-10-pro','joseph.harris55@yahoo.com','Joseph Harris',3,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','1c941ea2184fb7896faa93ce05badd4a','2026-06-14 04:51:18','2026-06-14 04:51:18','CA','2026-09-16 19:26:36',NULL,NULL),
(486,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','mark.carter35@gmail.com','Mark Carter',5,'Great value. The download links they sent were official and safe.',1,'published','ef36d406779b134ed33080324712c03e','2026-06-14 15:10:16','2026-06-14 15:10:16','GB',NULL,NULL,NULL),
(487,NULL,'microsoft-office-2021-home-business-mac','margaret.martinez17@gmail.com','Margaret Martinez',5,'Delivered on time and it works perfectly. Five stars.',1,'published','d0f1913755c21d220df50769ac54a4f4','2026-06-14 08:08:12','2026-06-14 08:08:12','AU',NULL,NULL,NULL),
(488,NULL,'microsoft-word-2021-windows','larry.ramirez30@outlook.com','Larry Ramirez',5,'Really good price and prompt delivery. Working great so far.',1,'published','58fe54437192af01fb93ec9174c0a081','2026-06-14 13:13:34','2026-06-14 13:13:34','CA',NULL,NULL,NULL),
(489,NULL,'microsoft-office-home-business-2024-mac','gary.lopez88@hotmail.com','Gary Lopez',5,'The activation guide was clear and I was up and running fast.',1,'published','974c58a14614297296d062a9f5c2ab39','2026-06-14 11:09:11','2026-06-14 11:09:11','US',NULL,NULL,NULL),
(490,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','cynthia.hernandez22@hotmail.com','Cynthia Hernandez',4,'Great value. The download links they sent were official and safe.',1,'published','edd084d9918bf8409cea1c73011c55bc','2026-06-13 06:39:57','2026-06-13 06:39:57','CA',NULL,NULL,NULL),
(491,NULL,'microsoft-visio-2024-professional-windows-pc','elizabeth.smith42@yahoo.com','Elizabeth Smith',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','125d8c35d8aad258aa3166bc23bae1fd','2026-06-13 17:57:13','2026-06-13 17:57:13','CA',NULL,NULL,NULL),
(492,NULL,'microsoft-office-home-2024-mac','kathleen.wright67@yahoo.com','Kathleen Wright',5,'Activation was painless and the key was valid immediately.',1,'published','f5ad8446b77c5ea5a891a2d1ddd80a15','2026-06-13 08:28:21','2026-06-13 08:28:21','US',NULL,NULL,NULL),
(493,NULL,'ms-visio-professional-2019-pc','stephanie.wilson76@hotmail.com','Stephanie Wilson',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','77ff1570fbff9c9a8e055dd41c59492d','2026-06-13 04:53:39','2026-06-13 04:53:39','CA',NULL,NULL,NULL),
(494,NULL,'microsoft-office-home-2024-mac','sofia.harris61@icloud.com','Sofia Harris',3,'No issues whatsoever. Key came fast and activated first time.',1,'published','17d07200bf1fe7233fd7bce7b90f198a','2026-06-12 11:32:02','2026-06-12 11:32:02','CA','2026-09-16 19:26:36',NULL,NULL),
(495,NULL,'bitdefender-small-office-security-5-devices-1-year','juan.garcia38@yahoo.com','Juan Garcia',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','79e877514d0c35c3c40326bc030f9511','2026-06-12 05:11:02','2026-06-12 05:11:02','US',NULL,NULL,NULL),
(496,NULL,'microsoft-office-home-business-2024-pc','mary.lewis26@icloud.com','Mary Lewis',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','c1d726a3503c4870a9f639566a1f2919','2026-06-12 10:30:41','2026-06-12 10:30:41','US',NULL,NULL,NULL),
(497,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','kathleen.mitchell68@icloud.com','Kathleen Mitchell',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','b4a8e24f617387571333c8f71cfb660e','2026-06-12 06:52:10','2026-06-12 06:52:10','US',NULL,NULL,NULL),
(498,NULL,'microsoft-excel-2021-windows','raj.nguyen11@hotmail.com','Raj Nguyen',4,'The email with my key and instructions came through in minutes.',1,'published','f1be0ff4a899c5f451892a5526f04748','2026-06-12 15:00:16','2026-06-12 15:00:16','US',NULL,NULL,NULL),
(499,NULL,'microsoft-office-2024-professional-plus-windows','stephen.moore88@icloud.com','Stephen Moore',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','9c0467e1869b1683f1a591e1d77cda26','2026-06-11 06:12:08','2026-06-11 06:12:08','EU',NULL,NULL,NULL),
(500,NULL,'microsoft-office-2021-home-student-windows','joshua.clark12@icloud.com','Joshua Clark',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','0322a1ce9f0be3c8af44c71fe1cfedae','2026-06-11 13:14:34','2026-06-11 13:14:34','CA',NULL,NULL,NULL),
(501,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','melissa.king89@hotmail.com','Melissa King',4,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','7b19b01d0ff4089216c48c4eb4046b52','2026-06-11 11:33:29','2026-06-11 11:33:29','GB',NULL,NULL,NULL),
(502,NULL,'microsoft-office-home-and-student-2019-mac','anna.lopez74@outlook.com','Anna Lopez',5,'Good product for the money. Everything was quick and easy.',1,'published','6428bfc3f44526f1eba7a01257dbc002','2026-06-11 04:00:29','2026-06-11 04:00:29','US',NULL,NULL,NULL),
(503,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','david.taylor27@hotmail.com','David Taylor',5,'Great value. The download links they sent were official and safe.',1,'published','89b45d8579ac4be68d8bdd8f6f0c5d39','2026-06-11 15:09:24','2026-06-11 15:09:24','US',NULL,NULL,NULL),
(504,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','kevin.moore60@icloud.com','Kevin Moore',4,'Customer service was responsive and the product key was genuine.',1,'published','9a31ca982c160bc53f82b55352af8836','2026-06-11 08:07:48','2026-06-11 08:07:48','US',NULL,NULL,NULL),
(505,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','robert.lopez35@yahoo.com','Robert Lopez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','2723cd27bb060e1fdb60b3bd602f372b','2026-06-10 17:12:52','2026-06-10 17:12:52','US',NULL,NULL,NULL),
(506,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','sharon.young35@hotmail.com','Sharon Young',4,'Would recommend to anyone looking for a legit key at a good price.',1,'published','5af92d26ef017cb63f6effe89ba84287','2026-06-10 12:15:19','2026-06-10 12:15:19','GB',NULL,NULL,NULL),
(507,NULL,'microsoft-project-professional-2021-pc','lisa.rivera67@gmail.com','Lisa Rivera',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','a959abe555827499eb81c3c374bcb10b','2026-06-10 05:31:59','2026-06-10 05:31:59','AU',NULL,NULL,NULL),
(508,NULL,'microsoft-office-home-2024-mac','eric.hall38@icloud.com','Eric Hall',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','c5ca75d628d886d17e39d6797e8aab67','2026-06-10 16:44:51','2026-06-10 16:44:51','US',NULL,NULL,NULL),
(509,NULL,'microsoft-visio-2021-professional-windows-pc','george.rivera20@icloud.com','George Rivera',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','bbf40e19d28748aa26a2815df0438f84','2026-06-10 14:06:20','2026-06-10 14:06:20','AU',NULL,NULL,NULL),
(510,NULL,'microsoft-office-2021-home-business-mac','jeffrey.jones35@outlook.com','Jeffrey Jones',4,'Solid experience overall. The key worked and support was helpful.',1,'published','c0d9944580885a33f28bbabbc9e859a4','2026-06-10 05:29:12','2026-06-10 05:29:12','US',NULL,NULL,NULL),
(511,NULL,'microsoft-office-home-2024-mac','patricia.nelson16@icloud.com','Patricia Nelson',5,'Works great on my PC. No issues after several weeks of use.',1,'published','07f2c572bf55383a57fb5f245656aaaa','2026-06-09 05:07:37','2026-06-09 05:07:37','US',NULL,NULL,NULL),
(512,NULL,'microsoft-office-home-business-2024-mac','donald.nelson89@yahoo.com','Donald Nelson',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','8b3a54a0d4cf3c0fdfcac316015319ac','2026-06-09 14:54:59','2026-06-09 14:54:59','EU',NULL,NULL,NULL),
(513,NULL,'microsoft-office-2021-home-student-mac','george.scott73@yahoo.com','George Scott',4,'Much cheaper than the official store and it activated without any issues.',1,'published','e27230dc75dce413d4664a7460dceb19','2026-06-09 07:27:45','2026-06-09 07:27:45','US',NULL,NULL,NULL),
(514,NULL,'microsoft-office-home-and-student-2019-mac','richard.adams12@gmail.com','Richard Adams',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','55ff33cf54470968f7ade565e6c23aca','2026-06-09 05:38:28','2026-06-09 05:38:28','US',NULL,NULL,NULL),
(515,NULL,'microsoft-visio-2024-professional-windows-pc','edward.lopez88@gmail.com','Edward Lopez',5,'Quick, easy, and it just works. No complaints at all.',1,'published','da792ada3ed8288265d80b58b5e73113','2026-06-09 08:53:22','2026-06-09 08:53:22','US',NULL,NULL,NULL),
(516,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','maria.robinson52@gmail.com','Maria Robinson',5,'Quick, easy, and it just works. No complaints at all.',1,'published','1a97db6a0c8caf555ff0c159c2f4b634','2026-06-09 06:18:40','2026-06-09 06:18:40','EU',NULL,NULL,NULL),
(517,NULL,'ms-project-professional-2019-pc','brian.brown59@icloud.com','Brian Brown',5,'Superb service. The whole process took less than five minutes.',1,'published','54cd11b0435dde34cf02b7012600c332','2026-06-08 08:22:32','2026-06-08 08:22:32','GB',NULL,NULL,NULL),
(518,NULL,'microsoft-project-professional-2021-pc','kevin.johnson27@hotmail.com','Kevin Johnson',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','477a7c175888e789ee2f93911be747ee','2026-06-08 05:33:55','2026-06-08 05:33:55','US',NULL,NULL,NULL),
(519,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','kathleen.miller37@yahoo.com','Kathleen Miller',5,'Really good price and prompt delivery. Working great so far.',1,'published','480fdc99752c97c880c01a658dcdf6c7','2026-06-08 17:42:12','2026-06-08 17:42:12','CA',NULL,NULL,NULL),
(520,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','timothy.jones35@gmail.com','Timothy Jones',5,'Delivered on time and it works perfectly. Five stars.',1,'published','f4d9411ab8618decc515842199733a65','2026-06-08 10:55:07','2026-06-08 10:55:07','EU',NULL,NULL,NULL),
(521,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','jessica.flores43@hotmail.com','Jessica Flores',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','27ebed107946ed5d4a7077e916f925c8','2026-06-08 17:33:36','2026-06-08 17:33:36','US',NULL,NULL,NULL),
(522,NULL,'microsoft-office-2021-home-student-windows','barbara.garcia32@gmail.com','Barbara Garcia',4,'Everything went smoothly from purchase to activation. Recommended.',1,'published','c9d519be4e9df63c40f2d7053b367d5d','2026-06-08 04:11:04','2026-06-08 04:11:04','US',NULL,NULL,NULL),
(523,NULL,'microsoft-excel-2021-windows','thomas.moore72@outlook.com','Thomas Moore',5,'The activation guide was clear and I was up and running fast.',1,'published','8f0d4e7912f9a6361ceaa04854190515','2026-06-08 14:35:42','2026-06-08 14:35:42','GB',NULL,NULL,NULL),
(524,NULL,'microsoft-office-home-2024-mac','sandra.hernandez65@hotmail.com','Sandra Hernandez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','5ef2dd93c86c87d2522a447b55d09179','2026-06-07 17:59:32','2026-06-07 17:59:32','CA',NULL,NULL,NULL),
(525,NULL,'bitdefender-small-office-security-5-devices-1-year','stephanie.adams87@gmail.com','Stephanie Adams',5,'Quick, easy, and it just works. No complaints at all.',1,'published','fcb5a7f41cb75573f0be77da435050a8','2026-06-07 13:37:52','2026-06-07 13:37:52','EU',NULL,NULL,NULL),
(526,NULL,'windows-11-pro','maria.anderson21@gmail.com','Maria Anderson',5,'Customer service was responsive and the product key was genuine.',1,'published','2f5f42a6ebb137a69da95f910e399df2','2026-06-07 10:29:37','2026-06-07 10:29:37','CA',NULL,NULL,NULL),
(527,NULL,'microsoft-office-2024-professional-plus-windows','jason.lee83@gmail.com','Jason Lee',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','ab46578726d27bdfeec4026bfad50366','2026-06-07 06:47:18','2026-06-07 06:47:18','EU',NULL,NULL,NULL),
(528,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','robert.ramirez45@gmail.com','Robert Ramirez',4,'Delivered on time and it works perfectly. Five stars.',1,'published','8292668b0d0dcc62328d7cb2b5dd7267','2026-06-07 10:12:13','2026-06-07 10:12:13','US',NULL,NULL,NULL),
(529,NULL,'microsoft-office-2021-professional-plus-windows','raj.nelson98@outlook.com','Raj Nelson',4,'Much cheaper than the official store and it activated without any issues.',1,'published','9fd9f5e6bfd7d6f4507d715ea87d564e','2026-06-07 15:49:14','2026-06-07 15:49:14','US',NULL,NULL,NULL),
(530,NULL,'windows-10-pro','juan.wilson65@yahoo.com','Juan Wilson',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','fa1d3798055c8a55b165895f538ff495','2026-06-06 06:32:19','2026-06-06 06:32:19','US',NULL,NULL,NULL),
(531,NULL,'microsoft-project-2024-professional-pc','john.wright92@icloud.com','John Wright',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','f3bc24b06a938bcfd00262e7dbae1c04','2026-06-06 12:56:39','2026-06-06 12:56:39','GB',NULL,NULL,NULL),
(532,NULL,'microsoft-word-2021-windows','patricia.robinson74@icloud.com','Patricia Robinson',4,'Would recommend to anyone looking for a legit key at a good price.',1,'published','4243f5bc1e96d109eadf0f9caad1aea7','2026-06-06 06:52:57','2026-06-06 06:52:57','GB',NULL,NULL,NULL),
(533,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','george.brown89@yahoo.com','George Brown',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','00badb505d119c25a8d628bbe55c3582','2026-06-05 07:00:55','2026-06-05 07:00:55','CA',NULL,NULL,NULL),
(534,NULL,'microsoft-office-home-business-2024-mac','christopher.campbell82@yahoo.com','Christopher Campbell',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','413a08bef567e7adaddcab717839f626','2026-06-05 15:12:24','2026-06-05 15:12:24','US',NULL,NULL,NULL),
(535,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','ahmed.robinson84@gmail.com','Ahmed Robinson',4,'Activation was painless and the key was valid immediately.',1,'published','a7de9586eb783ff2a75e3dbef4595dde','2026-06-05 15:22:58','2026-06-05 15:22:58','CA',NULL,NULL,NULL),
(536,NULL,'microsoft-office-2021-home-student-mac','richard.mitchell44@gmail.com','Richard Mitchell',5,'The email with my key and instructions came through in minutes.',1,'published','fe0122b8d7cd74cb06ec3173ceb1f15a','2026-06-05 10:02:20','2026-06-05 10:02:20','US',NULL,NULL,NULL),
(537,NULL,'microsoft-office-home-and-student-2019-mac','deborah.martinez26@yahoo.com','Deborah Martinez',4,'Customer service was responsive and the product key was genuine.',1,'published','e699d565d6bb3ee5632fea205127c890','2026-06-05 12:42:43','2026-06-05 12:42:43','CA',NULL,NULL,NULL),
(538,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','steven.davis26@outlook.com','Steven Davis',4,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','461b9ec42c28b9d6ead28e12b25f480f','2026-06-05 06:12:48','2026-06-05 06:12:48','EU',NULL,NULL,NULL),
(539,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','margaret.carter51@hotmail.com','Margaret Carter',5,'Good product for the money. Everything was quick and easy.',1,'published','e21aa171f06ebc2ec4feeea04ec5e9fc','2026-06-05 12:52:32','2026-06-05 12:52:32','US',NULL,NULL,NULL),
(540,NULL,'microsoft-office-2021-home-business-windows','michael.white40@yahoo.com','Michael White',5,'Second time ordering from this store. Reliable every time.',1,'published','c19935afb15a3aaea06d6fcbf77d0a46','2026-06-04 17:35:10','2026-06-04 17:35:10','GB',NULL,NULL,NULL),
(541,NULL,'windows-11-home','donald.clark23@gmail.com','Donald Clark',4,'Quick, easy, and it just works. No complaints at all.',1,'published','df569f578cb3910887de81f61917d025','2026-06-04 17:01:56','2026-06-04 17:01:56','US',NULL,NULL,NULL),
(542,NULL,'microsoft-office-home-and-student-2019-mac','charles.walker51@icloud.com','Charles Walker',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','0ad2cd927f637166e09addef5b4510b2','2026-06-04 13:18:50','2026-06-04 13:18:50','AU',NULL,NULL,NULL),
(543,NULL,'microsoft-office-2019-professional-plus-windows','kimberly.thompson32@outlook.com','Kimberly Thompson',5,'The step-by-step activation instructions were really helpful.',1,'published','15136600e5f59c4c17415dc9c2c4a6b7','2026-06-04 17:26:03','2026-06-04 17:26:03','US',NULL,NULL,NULL),
(544,NULL,'microsoft-excel-2021-windows','stephanie.clark51@outlook.com','Stephanie Clark',5,'Quick delivery and a legit license. Happy customer here.',1,'published','d215a03d0040825cd2dae90817399e17','2026-06-03 04:08:53','2026-06-03 04:08:53','US',NULL,NULL,NULL),
(545,NULL,'windows-11-home','elizabeth.white70@yahoo.com','Elizabeth White',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','62434013134027360a889aae3d0a6c8b','2026-06-03 12:48:54','2026-06-03 12:48:54','US',NULL,NULL,NULL),
(546,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','ahmed.johnson38@outlook.com','Ahmed Johnson',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','ccc838efb96b45f587e23e75c9bec65a','2026-06-03 12:22:46','2026-06-03 12:22:46','CA',NULL,NULL,NULL),
(547,NULL,'microsoft-office-2021-home-business-mac','hiroshi.hall87@yahoo.com','Hiroshi Hall',5,'Quick delivery and a legit license. Happy customer here.',1,'published','88d2e7cd0dacf97ba2a878d7255e281f','2026-06-03 06:48:08','2026-06-03 06:48:08','US',NULL,NULL,NULL),
(548,NULL,'microsoft-visio-2021-professional-windows-pc','priya.campbell58@yahoo.com','Priya Campbell',4,'Quick delivery and a legit license. Happy customer here.',1,'published','022e9b197737599551d2824c96f74b38','2026-06-02 15:07:15','2026-06-02 15:07:15','EU',NULL,NULL,NULL),
(549,NULL,'microsoft-office-2021-home-student-windows','melissa.wilson81@outlook.com','Melissa Wilson',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','9d12e16f962aa9a62aa05f4df79a782b','2026-06-02 14:29:24','2026-06-02 14:29:24','CA',NULL,NULL,NULL),
(550,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','timothy.jackson91@gmail.com','Timothy Jackson',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','f5699b8d13a157dbfed50400e9afc982','2026-06-02 17:46:24','2026-06-02 17:46:24','US',NULL,NULL,NULL),
(551,NULL,'microsoft-office-2019-home-business-pc','sandra.lewis64@icloud.com','Sandra Lewis',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','9857916a126a515cdd899f7dc7edf862','2026-06-02 11:24:00','2026-06-02 11:24:00','GB',NULL,NULL,NULL),
(552,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','rebecca.ramirez42@outlook.com','Rebecca Ramirez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','77e8b85e5c8ce446bf31b63daa9dbfb6','2026-06-02 14:09:26','2026-06-02 14:09:26','US',NULL,NULL,NULL),
(553,NULL,'microsoft-office-home-2024-pc','jason.robinson89@outlook.com','Jason Robinson',5,'Good product for the money. Everything was quick and easy.',1,'published','247e7f021c817b7b4c20bad8e7f9e6f2','2026-06-01 16:03:16','2026-06-01 16:03:16','US',NULL,NULL,NULL),
(554,NULL,'bitdefender-small-office-security-5-devices-1-year','steven.robinson27@yahoo.com','Steven Robinson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','90cc55dbcb49703c85a77ec382c351be','2026-06-01 06:34:24','2026-06-01 06:34:24','US',NULL,NULL,NULL),
(555,NULL,'microsoft-office-2021-home-student-windows','brian.jones47@outlook.com','Brian Jones',5,'Really good price and prompt delivery. Working great so far.',1,'published','6018c175ed75e7bf62305ca9500cdedf','2026-06-01 12:20:14','2026-06-01 12:20:14','CA',NULL,NULL,NULL),
(556,NULL,'microsoft-office-2024-professional-plus-windows','stephanie.perez44@icloud.com','Stephanie Perez',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','8875e81e974a6403d3d0bc3dda128e9c','2026-06-01 13:16:42','2026-06-01 13:16:42','GB',NULL,NULL,NULL),
(557,NULL,'microsoft-office-home-business-2024-mac','thomas.clark81@icloud.com','Thomas Clark',4,'Quick, easy, and it just works. No complaints at all.',1,'published','d29c67788c6936ccb65c7269df57a0ab','2026-06-01 06:33:40','2026-06-01 06:33:40','US',NULL,NULL,NULL),
(558,NULL,'microsoft-office-home-2024-mac','nicole.sanchez35@outlook.com','Nicole Sanchez',5,'Activation was painless and the key was valid immediately.',1,'published','735a5d464a1d0f35d51c00f304e9773e','2026-05-31 17:02:54','2026-05-31 17:02:54','GB',NULL,NULL,NULL),
(559,NULL,'microsoft-visio-2024-professional-windows-pc','david.robinson46@gmail.com','David Robinson',4,'Quick delivery and a legit license. Happy customer here.',1,'published','d4465d432702c058e87197aeabdcbb23','2026-05-31 09:26:04','2026-05-31 09:26:04','GB',NULL,NULL,NULL),
(560,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','sarah.flores34@hotmail.com','Sarah Flores',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','859cd1acb1eef69744db1874ea963bcc','2026-05-31 08:11:31','2026-05-31 08:11:31','EU',NULL,NULL,NULL),
(561,NULL,'windows-11-pro','sarah.perez76@gmail.com','Sarah Perez',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','5470423ad85bb12a1ea5eb39c6aa485a','2026-05-30 04:27:05','2026-05-30 04:27:05','US',NULL,NULL,NULL),
(562,NULL,'microsoft-office-2024-professional-plus-windows','stephen.thompson54@gmail.com','Stephen Thompson',4,'Quick, easy, and it just works. No complaints at all.',1,'published','fd5d1899e6756a2ca3409f8e33832631','2026-05-30 08:00:17','2026-05-30 08:00:17','AU',NULL,NULL,NULL),
(563,NULL,'microsoft-excel-2021-windows','joshua.adams35@outlook.com','Joshua Adams',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','cc4117bf0a9bb110f0c82cd45e6fb975','2026-05-30 06:22:31','2026-05-30 06:22:31','US',NULL,NULL,NULL),
(564,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','joshua.king88@hotmail.com','Joshua King',4,'Customer service was responsive and the product key was genuine.',1,'published','01a036700748e89ce8e23cb94e09fea5','2026-05-29 08:34:27','2026-05-29 08:34:27','US',NULL,NULL,NULL),
(565,NULL,'microsoft-office-2021-home-business-windows','gary.white43@outlook.com','Gary White',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','7573c5f049c7d45ae36e5aa6f73d49ef','2026-05-29 15:22:16','2026-05-29 15:22:16','US',NULL,NULL,NULL),
(566,NULL,'microsoft-office-2021-home-student-windows','kimberly.scott80@hotmail.com','Kimberly Scott',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','312984cc5089e5e9a263e28d805a9e38','2026-05-29 17:55:07','2026-05-29 17:55:07','US',NULL,NULL,NULL),
(567,NULL,'microsoft-word-2021-windows','priya.carter51@icloud.com','Priya Carter',3,'Saved over half the retail price and the license is completely genuine.',1,'published','9802f1b5ed7cc7b8629a95332cd860c8','2026-05-29 14:20:37','2026-05-29 14:20:37','GB','2026-09-16 19:26:36',NULL,NULL),
(568,NULL,'microsoft-office-2019-home-business-pc','sharon.mitchell81@icloud.com','Sharon Mitchell',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','ab397e1313f3c103449237d6ff7e547c','2026-05-29 09:22:26','2026-05-29 09:22:26','EU',NULL,NULL,NULL),
(569,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','robert.flores85@hotmail.com','Robert Flores',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','0302094f595f00edd82aac11e1cf7b1e','2026-05-28 13:42:48','2026-05-28 13:42:48','GB',NULL,NULL,NULL),
(570,NULL,'microsoft-office-2021-home-student-windows','amy.campbell13@hotmail.com','Amy Campbell',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','8acc6c1bac030b49104b093401062d74','2026-05-28 09:02:27','2026-05-28 09:02:27','US',NULL,NULL,NULL),
(571,NULL,'windows-11-home','linda.carter91@gmail.com','Linda Carter',3,'Customer service was responsive and the product key was genuine.',1,'published','383b1db18c0f4a917d7bd240035b300c','2026-05-28 14:39:11','2026-05-28 14:39:11','GB','2026-09-16 19:26:36',NULL,NULL),
(572,NULL,'microsoft-visio-2021-professional-windows-pc','lisa.miller49@outlook.com','Lisa Miller',5,'Much cheaper than the official store and it activated without any issues.',1,'published','8f9288a37faa1395969636aef56e641a','2026-05-27 16:13:43','2026-05-27 16:13:43','CA',NULL,NULL,NULL),
(573,NULL,'microsoft-office-2019-home-student-windows','christopher.mitchell32@outlook.com','Christopher Mitchell',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','4120dcb1adef57e815e1d9e7005429e9','2026-05-27 06:23:30','2026-05-27 06:23:30','AU',NULL,NULL,NULL),
(574,NULL,'microsoft-office-home-business-2024-mac','ryan.torres62@gmail.com','Ryan Torres',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','c5806d6bd6546afbaad0074d0864ecb7','2026-05-27 13:57:53','2026-05-27 13:57:53','US',NULL,NULL,NULL),
(575,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','george.white99@icloud.com','George White',5,'Really good price and prompt delivery. Working great so far.',1,'published','c2bd381fc1add16cadce525070b05021','2026-05-27 13:16:57','2026-05-27 13:16:57','GB',NULL,NULL,NULL),
(576,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','deborah.scott14@gmail.com','Deborah Scott',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','054e9a3bdb0e94a4f4be61dcee5f64e1','2026-05-27 15:02:50','2026-05-27 15:02:50','CA',NULL,NULL,NULL),
(577,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','jennifer.nguyen32@outlook.com','Jennifer Nguyen',5,'The activation guide was clear and I was up and running fast.',1,'published','7eae10746e749c44be4f913801f8dcaa','2026-05-26 10:35:54','2026-05-26 10:35:54','GB',NULL,NULL,NULL),
(578,NULL,'windows-11-home','michelle.patel34@outlook.com','Michelle Patel',4,'Activated without a hitch. Great communication throughout.',1,'published','144fd10bf7234565eb886c6467dd2b9e','2026-05-26 13:09:45','2026-05-26 13:09:45','GB',NULL,NULL,NULL),
(579,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','carlos.anderson40@gmail.com','Carlos Anderson',2,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','e7a67a0642def968b41158ea35b3e165','2026-05-26 04:20:29','2026-05-26 04:20:29','US','2026-09-16 19:26:36',NULL,NULL),
(580,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','joshua.mitchell47@gmail.com','Joshua Mitchell',5,'Solid experience overall. The key worked and support was helpful.',1,'published','c260d34a8b392515d43ff68ed29d71db','2026-05-26 07:48:06','2026-05-26 07:48:06','US',NULL,NULL,NULL),
(581,NULL,'microsoft-project-2024-professional-pc','james.scott43@gmail.com','James Scott',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','b12038a27f13e66eb18040b80e33daa5','2026-05-26 04:37:08','2026-05-26 04:37:08','US',NULL,NULL,NULL),
(582,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','kevin.rodriguez39@yahoo.com','Kevin Rodriguez',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','98fa98e433f8528a5346a60148c56685','2026-05-26 16:05:52','2026-05-26 16:05:52','GB',NULL,NULL,NULL),
(583,NULL,'microsoft-office-2021-home-business-mac','pamela.carter70@icloud.com','Pamela Carter',5,'Good product for the money. Everything was quick and easy.',1,'published','dd74e633be4243a9b6fe416cde5e56db','2026-05-26 15:32:11','2026-05-26 15:32:11','CA',NULL,NULL,NULL),
(584,NULL,'windows-11-home','kathleen.martin13@hotmail.com','Kathleen Martin',5,'The step-by-step activation instructions were really helpful.',1,'published','cca93bc53ecd8d457850f77d76ea40eb','2026-05-25 17:06:44','2026-05-25 17:06:44','GB',NULL,NULL,NULL),
(585,NULL,'microsoft-word-2021-windows','ronald.wilson38@gmail.com','Ronald Wilson',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','205cb9b43da557dae7656bebd9cbc8e8','2026-05-25 06:10:38','2026-05-25 06:10:38','EU',NULL,NULL,NULL),
(586,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','hiroshi.jackson43@yahoo.com','Hiroshi Jackson',4,'Great value. The download links they sent were official and safe.',1,'published','953dc65d3c7107f56014cdb5313aa489','2026-05-25 05:14:39','2026-05-25 05:14:39','AU',NULL,NULL,NULL),
(587,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','william.mitchell62@yahoo.com','William Mitchell',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','1833c93e3aea2093ca410de69980ba74','2026-05-25 04:20:47','2026-05-25 04:20:47','CA',NULL,NULL,NULL),
(588,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','nancy.williams15@hotmail.com','Nancy Williams',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','b7330e15a588251acb461997483de61c','2026-05-25 05:31:09','2026-05-25 05:31:09','US',NULL,NULL,NULL),
(589,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','donna.patel41@hotmail.com','Donna Patel',4,'Activation was painless and the key was valid immediately.',1,'published','8a74f60b2099baf35806c87d57a27037','2026-05-24 10:03:23','2026-05-24 10:03:23','US',NULL,NULL,NULL),
(590,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','sharon.patel89@icloud.com','Sharon Patel',4,'Works great on my PC. No issues after several weeks of use.',1,'published','36e42247fea1908413da2cb221e899c7','2026-05-24 14:22:28','2026-05-24 14:22:28','US',NULL,NULL,NULL),
(591,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','jessica.smith23@hotmail.com','Jessica Smith',5,'Saved over half the retail price and the license is completely genuine.',1,'published','7c0f8ff880bb013c86df24e6340e7cea','2026-05-24 05:21:25','2026-05-24 05:21:25','EU',NULL,NULL,NULL),
(592,NULL,'windows-10-home','amanda.carter30@hotmail.com','Amanda Carter',5,'Solid experience overall. The key worked and support was helpful.',1,'published','4a36afb571fc040cf5f0f8d9ddc3fc80','2026-05-24 07:50:20','2026-05-24 07:50:20','US',NULL,NULL,NULL),
(593,NULL,'microsoft-project-2024-professional-pc','barbara.patel77@gmail.com','Barbara Patel',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','376700a98aa448483d25e49bdeeabaec','2026-05-23 13:56:59','2026-05-23 13:56:59','GB',NULL,NULL,NULL),
(594,NULL,'microsoft-office-2021-home-business-windows','laura.garcia25@icloud.com','Laura Garcia',5,'Good product for the money. Everything was quick and easy.',1,'published','f8e0dd7dbb2b640fc100c5d909c16b75','2026-05-23 07:55:40','2026-05-23 07:55:40','GB',NULL,NULL,NULL),
(595,NULL,'microsoft-project-2024-professional-pc','michelle.nguyen68@hotmail.com','Michelle Nguyen',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','3fc9dfd86c369c7cd5772d5a26777c60','2026-05-23 04:29:10','2026-05-23 04:29:10','GB',NULL,NULL,NULL),
(596,NULL,'ms-visio-professional-2019-pc','sofia.wilson39@icloud.com','Sofia Wilson',2,'Key worked instantly and activated on the first try. Great price too.',1,'published','88e964cb254ec1d4a2aaf26eeea89fb2','2026-05-23 05:14:24','2026-05-23 05:14:24','US','2026-09-16 19:26:36',NULL,NULL),
(597,NULL,'microsoft-office-2019-home-business-pc','daniel.ramirez85@outlook.com','Daniel Ramirez',4,'Ordered late at night and still got the key within minutes.',1,'published','759772f546460b2bb7420f35b7ec5cb9','2026-05-23 14:49:21','2026-05-23 14:49:21','CA',NULL,NULL,NULL),
(598,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','nicole.anderson24@hotmail.com','Nicole Anderson',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','b7f7440fa095d5adbd9d954c66c3b52a','2026-05-22 17:43:52','2026-05-22 17:43:52','US',NULL,NULL,NULL),
(599,NULL,'microsoft-office-home-2024-pc','james.thomas19@hotmail.com','James Thomas',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','6ebb8468b9e14c2002d7f1a95f85d79f','2026-05-22 16:03:23','2026-05-22 16:03:23','US',NULL,NULL,NULL),
(600,NULL,'microsoft-office-home-2024-pc','timothy.mitchell20@gmail.com','Timothy Mitchell',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','12c7ec09206ce541dd27f1e537c97912','2026-05-22 11:03:10','2026-05-22 11:03:10','CA',NULL,NULL,NULL),
(601,NULL,'microsoft-excel-2021-windows','elizabeth.jackson81@icloud.com','Elizabeth Jackson',2,'Solid experience overall. The key worked and support was helpful.',1,'published','3b5f3aad9f04f1014aaa4b237cabe49e','2026-05-22 10:20:16','2026-05-22 10:20:16','US','2026-09-16 19:26:36',NULL,NULL),
(602,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','joseph.hill38@icloud.com','Joseph Hill',5,'Excellent service. The activation guide made setup really easy.',1,'published','2ade0921f09706bd1738d972cb7cd810','2026-05-22 09:03:53','2026-05-22 09:03:53','US',NULL,NULL,NULL),
(603,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','sandra.thomas53@outlook.com','Sandra Thomas',5,'Superb service. The whole process took less than five minutes.',1,'published','b329f9fbb19dfa416e03a425b4dff874','2026-05-21 14:12:52','2026-05-21 14:12:52','GB',NULL,NULL,NULL),
(604,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','anthony.campbell38@icloud.com','Anthony Campbell',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','8916ddc523e7e80d05126a891b90399f','2026-05-21 07:28:23','2026-05-21 07:28:23','US',NULL,NULL,NULL),
(605,NULL,'microsoft-office-home-business-2024-mac','rebecca.nelson71@icloud.com','Rebecca Nelson',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','c0692ce9b79a4f31685fb7e08d149df2','2026-05-21 04:12:17','2026-05-21 04:12:17','US',NULL,NULL,NULL),
(606,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','raj.davis37@hotmail.com','Raj Davis',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','8479efff092613bc2ddc549fd412243d','2026-05-21 14:01:19','2026-05-21 14:01:19','US',NULL,NULL,NULL),
(607,NULL,'microsoft-office-2021-home-business-mac','justin.flores74@outlook.com','Justin Flores',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','08fa268f8f675bd7fd62eb0e830bc320','2026-05-20 13:13:36','2026-05-20 13:13:36','US',NULL,NULL,NULL),
(608,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','christopher.king37@yahoo.com','Christopher King',4,'The activation guide was clear and I was up and running fast.',1,'published','9666adffe34d04288896044aa756d648','2026-05-20 17:33:41','2026-05-20 17:33:41','CA',NULL,NULL,NULL),
(609,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','carlos.hill65@gmail.com','Carlos Hill',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','8ace9dc43d8e5d21c20dd86104d10a58','2026-05-20 17:16:18','2026-05-20 17:16:18','CA',NULL,NULL,NULL),
(610,NULL,'microsoft-office-2021-home-student-windows','kathleen.clark31@yahoo.com','Kathleen Clark',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','afeb0d84dab790c2564b3aa45c9cc769','2026-05-20 14:04:09','2026-05-20 14:04:09','GB',NULL,NULL,NULL),
(611,NULL,'ms-project-professional-2019-pc','ryan.green95@icloud.com','Ryan Green',4,'Saved over half the retail price and the license is completely genuine.',1,'published','37067078c5d8e6adf2ebe4ed11a48f2a','2026-05-20 15:33:56','2026-05-20 15:33:56','AU',NULL,NULL,NULL),
(612,NULL,'microsoft-project-professional-2021-pc','emily.nelson79@hotmail.com','Emily Nelson',3,'Product key arrived quickly and worked on my new PC right away.',1,'published','2587d9095ef02514f782ebc0bddb1e89','2026-05-20 12:41:55','2026-05-20 12:41:55','GB','2026-09-16 19:26:36',NULL,NULL),
(613,NULL,'microsoft-office-home-and-student-2019-mac','mark.jackson41@hotmail.com','Mark Jackson',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','bdbbeb0ec2250fac6d5fcabe712df2c3','2026-05-19 09:04:22','2026-05-19 09:04:22','CA',NULL,NULL,NULL),
(614,NULL,'microsoft-office-home-2024-mac','nancy.ramirez53@hotmail.com','Nancy Ramirez',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','544cccc4274cb61ec14fb6a70ba42dcb','2026-05-19 12:21:37','2026-05-19 12:21:37','US',NULL,NULL,NULL),
(615,NULL,'microsoft-office-home-2024-mac','amy.harris14@yahoo.com','Amy Harris',5,'Activation was painless and the key was valid immediately.',1,'published','cb8fe2c7f96f3b5bf8d85c9e24d619b7','2026-05-19 08:30:53','2026-05-19 08:30:53','AU',NULL,NULL,NULL),
(616,NULL,'microsoft-office-2021-home-business-mac','angela.anderson40@hotmail.com','Angela Anderson',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','9e3db0f79fddc563bb381c424da6e2e8','2026-05-19 08:00:16','2026-05-19 08:00:16','EU',NULL,NULL,NULL),
(617,NULL,'ms-visio-professional-2019-pc','nicole.young33@gmail.com','Nicole Young',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','fe82fa5b8e2787d5090befbd9c39f8d7','2026-05-19 15:10:00','2026-05-19 15:10:00','GB',NULL,NULL,NULL),
(618,NULL,'ms-project-professional-2019-pc','samantha.baker25@hotmail.com','Samantha Baker',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','0e1b98e5cde6621baac530c97281b253','2026-05-19 17:49:10','2026-05-19 17:49:10','US',NULL,NULL,NULL),
(619,NULL,'microsoft-office-home-and-student-2019-mac','john.rivera80@hotmail.com','John Rivera',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','1e55c7a39137ae96b5283ad9488e9fca','2026-05-18 10:55:00','2026-05-18 10:55:00','AU',NULL,NULL,NULL),
(620,NULL,'microsoft-office-2021-home-business-mac','joseph.patel43@hotmail.com','Joseph Patel',2,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','597c0bfc6e2e9774deb1d859454e4e4d','2026-05-18 11:47:12','2026-05-18 11:47:12','GB','2026-09-16 19:26:36',NULL,NULL),
(621,NULL,'microsoft-office-home-and-business-2019-mac','amanda.smith27@hotmail.com','Amanda Smith',4,'Solid experience overall. The key worked and support was helpful.',1,'published','77bacb0d9a6b6f02789e3ece5fe1216d','2026-05-18 04:50:36','2026-05-18 04:50:36','US',NULL,NULL,NULL),
(622,NULL,'windows-10-home','linda.allen12@outlook.com','Linda Allen',2,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','5cdc69d41f2747cea245c95e2cf6bcb8','2026-05-18 04:05:39','2026-05-18 04:05:39','AU','2026-09-16 19:26:36',NULL,NULL),
(623,NULL,'microsoft-office-home-2024-mac','stephen.nguyen83@hotmail.com','Stephen Nguyen',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','31e6e765fda7f601bfaad6f2c39c7b1e','2026-05-18 16:42:40','2026-05-18 16:42:40','EU',NULL,NULL,NULL),
(624,NULL,'microsoft-office-2021-professional-plus-windows','charles.nelson52@outlook.com','Charles Nelson',5,'Solid experience overall. The key worked and support was helpful.',1,'published','d40cdccc409276978fdd6485debe3d5d','2026-05-18 05:55:07','2026-05-18 05:55:07','US',NULL,NULL,NULL),
(625,NULL,'microsoft-project-professional-2021-pc','deborah.davis80@gmail.com','Deborah Davis',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','a9dbeaf10751c5581027dd452c88da8a','2026-05-17 12:24:43','2026-05-17 12:24:43','US',NULL,NULL,NULL),
(626,NULL,'microsoft-visio-2024-professional-windows-pc','hiroshi.williams67@yahoo.com','Hiroshi Williams',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','4589fb6e6767d90c339bf4d3acf86d3e','2026-05-17 13:05:16','2026-05-17 13:05:16','GB',NULL,NULL,NULL),
(627,NULL,'microsoft-office-2021-home-student-mac','kenneth.lopez63@hotmail.com','Kenneth Lopez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','d7d8fd571d56d897689fb55d54de13f4','2026-05-17 15:37:14','2026-05-17 15:37:14','CA',NULL,NULL,NULL),
(628,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','laura.jackson32@hotmail.com','Laura Jackson',5,'Much cheaper than the official store and it activated without any issues.',1,'published','4a9392c6b9ef9ed80d0789d0358ea229','2026-05-17 17:35:34','2026-05-17 17:35:34','EU',NULL,NULL,NULL),
(629,NULL,'microsoft-project-2024-professional-pc','nicole.lopez32@gmail.com','Nicole Lopez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','b0a323718f8f7d7190494e0de1193c77','2026-05-17 14:05:28','2026-05-17 14:05:28','AU',NULL,NULL,NULL),
(630,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','olga.green18@gmail.com','Olga Green',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','1479efeeb35ad9e522eaf4da04b0420a','2026-05-17 07:48:27','2026-05-17 07:48:27','GB',NULL,NULL,NULL),
(631,NULL,'microsoft-office-home-and-business-2019-mac','thomas.smith21@outlook.com','Thomas Smith',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','02678f50f416c53fd725108d638b7bf6','2026-05-16 15:26:32','2026-05-16 15:26:32','US',NULL,NULL,NULL),
(632,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','joshua.rivera94@hotmail.com','Joshua Rivera',5,'The step-by-step activation instructions were really helpful.',1,'published','9b43f05978466790394a23dc0aa7e80e','2026-05-16 06:58:07','2026-05-16 06:58:07','CA',NULL,NULL,NULL),
(633,NULL,'ms-visio-professional-2019-pc','emily.young99@outlook.com','Emily Young',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','bf5972b285639aa134978fca4fae8ae6','2026-05-16 10:29:41','2026-05-16 10:29:41','GB',NULL,NULL,NULL),
(634,NULL,'microsoft-office-2021-professional-plus-windows','juan.miller15@yahoo.com','Juan Miller',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','a9776b290bdc8d088dd5f927792cedf1','2026-05-15 08:13:21','2026-05-15 08:13:21','GB',NULL,NULL,NULL),
(635,NULL,'microsoft-project-2024-professional-pc','jason.clark90@hotmail.com','Jason Clark',5,'Activation was painless and the key was valid immediately.',1,'published','f91254b04e748b15ae9c6da0c8379bbd','2026-05-15 04:24:36','2026-05-15 04:24:36','AU',NULL,NULL,NULL),
(636,NULL,'microsoft-project-professional-2021-pc','susan.flores52@icloud.com','Susan Flores',4,'Product key arrived quickly and worked on my new PC right away.',1,'published','2c73fd6caecc94a117e0b688be582ed6','2026-05-15 12:24:57','2026-05-15 12:24:57','US',NULL,NULL,NULL),
(637,NULL,'windows-10-home','john.flores36@gmail.com','John Flores',5,'Superb service. The whole process took less than five minutes.',1,'published','0c807d2f518972cd79fc48a8e7cc3c2b','2026-05-14 16:41:06','2026-05-14 16:41:06','US',NULL,NULL,NULL),
(638,NULL,'microsoft-office-2021-home-student-windows','carlos.wilson52@gmail.com','Carlos Wilson',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','b5565d3b28f563429d9d16a7508924ea','2026-05-14 14:33:15','2026-05-14 14:33:15','CA',NULL,NULL,NULL),
(639,NULL,'microsoft-office-home-and-student-2019-mac','daniel.wilson47@gmail.com','Daniel Wilson',2,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','b28a53d444638f8b8b05214f465bc8a9','2026-05-14 10:54:54','2026-05-14 10:54:54','US','2026-09-16 19:26:36',NULL,NULL),
(640,NULL,'microsoft-office-2019-professional-plus-windows','james.allen96@yahoo.com','James Allen',5,'Delivered on time and it works perfectly. Five stars.',1,'published','eed564eea18410d53b63c049db6bb88b','2026-05-14 14:19:40','2026-05-14 14:19:40','GB',NULL,NULL,NULL),
(641,NULL,'windows-11-pro','laura.brown93@hotmail.com','Laura Brown',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','cdd88b4eb945c6c36557de2d2adf09bf','2026-05-14 13:05:11','2026-05-14 13:05:11','US',NULL,NULL,NULL),
(642,NULL,'microsoft-visio-2024-professional-windows-pc','jason.williams61@icloud.com','Jason Williams',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','d90ba94c43c5bc5bb8c130ed501d874b','2026-05-13 15:18:40','2026-05-13 15:18:40','US',NULL,NULL,NULL),
(643,NULL,'microsoft-office-2021-home-business-mac','thomas.jackson26@gmail.com','Thomas Jackson',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','b49e27a0afd072e220960e0bc1afc7a3','2026-05-13 06:06:44','2026-05-13 06:06:44','EU',NULL,NULL,NULL),
(644,NULL,'microsoft-office-home-business-2024-mac','edward.walker49@yahoo.com','Edward Walker',5,'Activated without a hitch. Great communication throughout.',1,'published','7bae69913e89f13a8dd6920e26baa6d2','2026-05-13 11:13:01','2026-05-13 11:13:01','US',NULL,NULL,NULL),
(645,NULL,'microsoft-project-2024-professional-pc','joseph.johnson68@gmail.com','Joseph Johnson',5,'Much cheaper than the official store and it activated without any issues.',1,'published','f74e65153e5c4741502afe49b6ceebfd','2026-05-13 16:15:10','2026-05-13 16:15:10','CA',NULL,NULL,NULL),
(646,NULL,'microsoft-visio-2024-professional-windows-pc','anna.moore50@gmail.com','Anna Moore',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','4e1e3bc229bb068f02d257abd5054ba6','2026-05-12 13:08:45','2026-05-12 13:08:45','CA',NULL,NULL,NULL),
(647,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','gary.wilson12@icloud.com','Gary Wilson',5,'Activated without a hitch. Great communication throughout.',1,'published','830134aa63c20325d7e74bc15186af2d','2026-05-12 04:43:35','2026-05-12 04:43:35','CA',NULL,NULL,NULL),
(648,NULL,'microsoft-office-2021-home-business-windows','timothy.wright23@yahoo.com','Timothy Wright',3,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','ad3dce4a6a8456502efcaeff88d89213','2026-05-12 10:47:57','2026-05-12 10:47:57','US','2026-09-16 19:26:36',NULL,NULL),
(649,NULL,'microsoft-office-2019-home-student-windows','thomas.nguyen75@yahoo.com','Thomas Nguyen',5,'Saved over half the retail price and the license is completely genuine.',1,'published','46be584a5f94a14b2762d2bab910b346','2026-05-12 12:13:13','2026-05-12 12:13:13','CA',NULL,NULL,NULL),
(650,NULL,'microsoft-office-home-2024-mac','michael.rodriguez20@gmail.com','Michael Rodriguez',2,'Superb service. The whole process took less than five minutes.',1,'published','ab933d07ff30474cc7a5778c5301f297','2026-05-12 04:33:11','2026-05-12 04:33:11','US','2026-09-16 19:26:36',NULL,NULL),
(651,NULL,'microsoft-office-2021-professional-plus-windows','sharon.torres17@yahoo.com','Sharon Torres',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','0fbf41674401a76335fa85c77b8faf2f','2026-05-12 15:14:59','2026-05-12 15:14:59','US',NULL,NULL,NULL),
(652,NULL,'microsoft-visio-2021-professional-windows-pc','gary.gonzalez79@yahoo.com','Gary Gonzalez',5,'Ordered late at night and still got the key within minutes.',1,'published','f24672396a3b4cff99717a86ddac58ec','2026-05-11 05:18:56','2026-05-11 05:18:56','US',NULL,NULL,NULL),
(653,NULL,'microsoft-office-2024-professional-plus-windows','david.nelson54@icloud.com','David Nelson',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','914ebd8d435bd5a71c5e72da8ef5a949','2026-05-11 13:38:45','2026-05-11 13:38:45','US',NULL,NULL,NULL),
(654,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kevin.martinez27@yahoo.com','Kevin Martinez',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','8b97cb33e943a0ef8f1fd514e554b7e8','2026-05-11 08:10:07','2026-05-11 08:10:07','US',NULL,NULL,NULL),
(655,NULL,'windows-10-home','jennifer.moore32@icloud.com','Jennifer Moore',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','9e6cfc9042a64939b80ef99e86b14676','2026-05-11 08:44:28','2026-05-11 08:44:28','US',NULL,NULL,NULL),
(656,NULL,'microsoft-excel-2021-windows','michelle.wright42@icloud.com','Michelle Wright',5,'Superb service. The whole process took less than five minutes.',1,'published','0910141f378ee728c66da853add67d68','2026-05-11 08:26:13','2026-05-11 08:26:13','US',NULL,NULL,NULL),
(657,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','margaret.wilson27@icloud.com','Margaret Wilson',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','29480bfe50ce2070374e340963796229','2026-05-11 14:51:43','2026-05-11 14:51:43','AU',NULL,NULL,NULL),
(658,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','george.smith55@icloud.com','George Smith',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','57fe5efb95ac2ab29b9c54687f95dab2','2026-05-10 09:05:18','2026-05-10 09:05:18','CA',NULL,NULL,NULL),
(659,NULL,'windows-10-pro','jennifer.nelson76@icloud.com','Jennifer Nelson',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','45fd2c841be8ad2e52ee8ae14589bf9a','2026-05-10 06:01:12','2026-05-10 06:01:12','AU',NULL,NULL,NULL),
(660,NULL,'microsoft-office-2021-home-business-mac','thomas.adams70@gmail.com','Thomas Adams',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','1dfe85e37b718838217fc0e8f91ac988','2026-05-10 06:45:21','2026-05-10 06:45:21','US',NULL,NULL,NULL),
(661,NULL,'windows-11-home','joseph.martin24@outlook.com','Joseph Martin',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','e1f6b470d93e420c7c46a1729a258078','2026-05-10 13:49:50','2026-05-10 13:49:50','GB',NULL,NULL,NULL),
(662,NULL,'microsoft-office-home-2024-mac','christopher.allen39@outlook.com','Christopher Allen',5,'Second time ordering from this store. Reliable every time.',1,'published','8f5e2997f4b47b113db275e3cc331877','2026-05-10 17:20:01','2026-05-10 17:20:01','GB',NULL,NULL,NULL),
(663,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','wei.campbell65@icloud.com','Wei Campbell',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','0394b44703c15f153bf8242bd82be449','2026-05-10 16:42:33','2026-05-10 16:42:33','EU',NULL,NULL,NULL),
(664,NULL,'microsoft-office-2021-home-student-windows','deborah.thompson62@outlook.com','Deborah Thompson',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','e820bfeab764d4017633c13bb6c5e644','2026-05-09 15:45:54','2026-05-09 15:45:54','US',NULL,NULL,NULL),
(665,NULL,'microsoft-office-home-and-business-2019-mac','olga.hill90@icloud.com','Olga Hill',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','63a2ce7e0cade604eeb55ee748f9ee5f','2026-05-09 07:24:15','2026-05-09 07:24:15','US',NULL,NULL,NULL),
(666,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','daniel.campbell13@yahoo.com','Daniel Campbell',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','912264cb57974af1044cf34150c21d56','2026-05-09 15:13:40','2026-05-09 15:13:40','GB',NULL,NULL,NULL),
(667,NULL,'microsoft-office-2021-home-student-windows','kevin.jackson60@gmail.com','Kevin Jackson',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','221751c871c945a2611f8c1a86e39a63','2026-05-09 07:26:57','2026-05-09 07:26:57','GB',NULL,NULL,NULL),
(668,NULL,'ms-project-professional-2019-pc','ahmed.perez67@yahoo.com','Ahmed Perez',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','850fef123105fa548f2ec3a03f3a4349','2026-05-09 15:36:53','2026-05-09 15:36:53','GB',NULL,NULL,NULL),
(669,NULL,'microsoft-visio-2021-professional-windows-pc','margaret.ramirez61@outlook.com','Margaret Ramirez',4,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','d8187227ab563b768a698581eacea751','2026-05-09 11:13:53','2026-05-09 11:13:53','CA',NULL,NULL,NULL),
(670,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','donna.rodriguez40@yahoo.com','Donna Rodriguez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','5e1c66edb7317540fcdd1cce636a1650','2026-05-08 11:50:42','2026-05-08 11:50:42','EU',NULL,NULL,NULL),
(671,NULL,'microsoft-office-2024-professional-plus-windows','betty.ramirez15@outlook.com','Betty Ramirez',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','3b151451c126fc8182b6784d7d6436dd','2026-05-08 16:23:14','2026-05-08 16:23:14','GB',NULL,NULL,NULL),
(672,NULL,'microsoft-office-2021-home-business-windows','joseph.davis89@outlook.com','Joseph Davis',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','6ac989e451d4f4d839cd6c78ca7d1655','2026-05-08 09:47:31','2026-05-08 09:47:31','GB',NULL,NULL,NULL),
(673,NULL,'microsoft-word-2021-windows','margaret.young92@gmail.com','Margaret Young',5,'Activation was painless and the key was valid immediately.',1,'published','7193ab5de453b348353b0b4b19ace659','2026-05-08 14:48:27','2026-05-08 14:48:27','CA',NULL,NULL,NULL),
(674,NULL,'microsoft-office-2019-home-student-windows','amy.ramirez56@icloud.com','Amy Ramirez',3,'Quick delivery and a legit license. Happy customer here.',1,'published','79fd53887ecefe5e3a72116668eabfd1','2026-05-08 14:54:59','2026-05-08 14:54:59','US','2026-09-16 19:26:36',NULL,NULL),
(675,NULL,'windows-10-pro','sandra.johnson13@hotmail.com','Sandra Johnson',5,'The email with my key and instructions came through in minutes.',1,'published','92fb73b70fa7ca4a4cbc0bc404af14e1','2026-05-08 17:10:04','2026-05-08 17:10:04','CA',NULL,NULL,NULL),
(676,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','david.allen65@gmail.com','David Allen',5,'Customer service was responsive and the product key was genuine.',1,'published','879ffb8570ecd811c65862b8d25c8942','2026-05-07 11:13:22','2026-05-07 11:13:22','AU',NULL,NULL,NULL),
(677,NULL,'microsoft-visio-2024-professional-windows-pc','joshua.nelson76@yahoo.com','Joshua Nelson',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','01a152d77cfb0ad8c363a89e773e6c87','2026-05-07 11:32:32','2026-05-07 11:32:32','GB',NULL,NULL,NULL),
(678,NULL,'windows-11-home','john.young21@hotmail.com','John Young',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','6e43efa1074a26a8b4ee5069fab168a1','2026-05-07 15:24:13','2026-05-07 15:24:13','GB',NULL,NULL,NULL),
(679,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','edward.thomas80@outlook.com','Edward Thomas',5,'Really good price and prompt delivery. Working great so far.',1,'published','135dfe7710b3b93cc49b27f7ba92058b','2026-05-06 09:13:04','2026-05-06 09:13:04','US',NULL,NULL,NULL),
(680,NULL,'microsoft-office-2024-professional-plus-windows','kathleen.carter31@gmail.com','Kathleen Carter',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','aa747cc7b5cdd47e98e8dbc4ef8b07b6','2026-05-06 08:15:48','2026-05-06 08:15:48','US',NULL,NULL,NULL),
(681,NULL,'microsoft-office-2019-professional-plus-windows','samantha.hernandez23@gmail.com','Samantha Hernandez',5,'Good product for the money. Everything was quick and easy.',1,'published','85c88015aab836f89ed10f4da6302cd7','2026-05-06 09:28:26','2026-05-06 09:28:26','US',NULL,NULL,NULL),
(682,NULL,'ms-project-professional-2019-pc','kenneth.davis55@gmail.com','Kenneth Davis',4,'Second time ordering from this store. Reliable every time.',1,'published','055df7f6b77bbc1cd9c76b527fdabc3c','2026-05-06 14:23:28','2026-05-06 14:23:28','US',NULL,NULL,NULL),
(683,NULL,'microsoft-office-2019-home-business-pc','michael.hill45@hotmail.com','Michael Hill',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','d75d8de136d30eb0ff1a98fb1e92f7bd','2026-05-06 06:15:23','2026-05-06 06:15:23','GB',NULL,NULL,NULL),
(684,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','margaret.torres57@yahoo.com','Margaret Torres',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','e5d364794bdaa1bc1ed19f1e71f5ffce','2026-05-05 07:55:42','2026-05-05 07:55:42','GB',NULL,NULL,NULL),
(685,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','kevin.harris40@outlook.com','Kevin Harris',5,'Ordered late at night and still got the key within minutes.',1,'published','6a7210b2a86d9da92f473e877dcf1ad7','2026-05-05 05:08:01','2026-05-05 05:08:01','CA',NULL,NULL,NULL),
(686,NULL,'microsoft-visio-2024-professional-windows-pc','elizabeth.nguyen58@outlook.com','Elizabeth Nguyen',4,'Quick delivery and a legit license. Happy customer here.',1,'published','1f0bda524b3e8444cc5ef96c050ea7ac','2026-05-05 05:25:45','2026-05-05 05:25:45','AU',NULL,NULL,NULL),
(687,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','carlos.mitchell57@yahoo.com','Carlos Mitchell',5,'Quick delivery and a legit license. Happy customer here.',1,'published','92013f44988401055cd84b3dd33bddc0','2026-05-05 05:20:06','2026-05-05 05:20:06','US',NULL,NULL,NULL),
(688,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','christopher.jones48@yahoo.com','Christopher Jones',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','3b40e4712e582d8298dba6f2b01e89dc','2026-05-05 05:38:59','2026-05-05 05:38:59','GB',NULL,NULL,NULL),
(689,NULL,'microsoft-visio-2024-professional-windows-pc','jason.allen10@yahoo.com','Jason Allen',5,'Second time ordering from this store. Reliable every time.',1,'published','94882235ae5273c6316e4afd40a5ddaa','2026-05-04 05:05:48','2026-05-04 05:05:48','GB',NULL,NULL,NULL),
(690,NULL,'microsoft-office-2021-home-student-windows','barbara.robinson74@outlook.com','Barbara Robinson',5,'Superb service. The whole process took less than five minutes.',1,'published','0db07117b6f116074da429f890dc4c3b','2026-05-04 07:18:16','2026-05-04 07:18:16','CA',NULL,NULL,NULL),
(691,NULL,'microsoft-project-2024-professional-pc','lisa.adams52@outlook.com','Lisa Adams',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','056a0f36ef36e4ba1304dc1237ecf359','2026-05-04 14:03:00','2026-05-04 14:03:00','US',NULL,NULL,NULL),
(692,NULL,'microsoft-office-2019-home-student-windows','karen.rivera25@yahoo.com','Karen Rivera',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','8e5d678508ef3b12ad99cc97144bfbfd','2026-05-04 05:15:49','2026-05-04 05:15:49','US',NULL,NULL,NULL),
(693,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','kevin.nelson55@hotmail.com','Kevin Nelson',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','3114eb75c0e6a970279bab4fbb3303ae','2026-05-04 10:03:57','2026-05-04 10:03:57','US',NULL,NULL,NULL),
(694,NULL,'microsoft-office-home-2024-mac','kevin.sanchez49@yahoo.com','Kevin Sanchez',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','52fba924658134a90a57800e9e5b56b5','2026-05-03 07:33:48','2026-05-03 07:33:48','GB',NULL,NULL,NULL),
(695,NULL,'microsoft-office-2024-professional-plus-windows','michelle.walker90@outlook.com','Michelle Walker',4,'The email with my key and instructions came through in minutes.',1,'published','7016e36d0cbfc48bedc78193ad2883a0','2026-05-03 11:21:42','2026-05-03 11:21:42','US',NULL,NULL,NULL),
(696,NULL,'microsoft-office-2019-home-business-pc','stephanie.walker53@yahoo.com','Stephanie Walker',5,'Much cheaper than the official store and it activated without any issues.',1,'published','3938bfda631ee7c4518166b619e43e62','2026-05-03 11:22:00','2026-05-03 11:22:00','AU',NULL,NULL,NULL),
(697,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','hiroshi.smith53@gmail.com','Hiroshi Smith',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','16ebf7968e5206c67b3d455fd0f6ede4','2026-05-03 17:08:16','2026-05-03 17:08:16','AU',NULL,NULL,NULL),
(698,NULL,'microsoft-office-home-and-student-2019-mac','richard.green12@yahoo.com','Richard Green',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','759bb2ef6da995863406dc912a472bf9','2026-05-03 13:13:20','2026-05-03 13:13:20','US',NULL,NULL,NULL),
(699,NULL,'microsoft-excel-2021-windows','priya.rodriguez96@yahoo.com','Priya Rodriguez',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','60141cdd696fb6cfba63b436784e67ee','2026-05-03 15:30:44','2026-05-03 15:30:44','AU',NULL,NULL,NULL),
(700,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','sofia.gonzalez19@hotmail.com','Sofia Gonzalez',3,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','1b7eafdd55ea56ab99d02a6f5e3ba687','2026-05-03 07:07:08','2026-05-03 07:07:08','US','2026-09-16 19:26:36',NULL,NULL),
(701,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','sandra.moore96@outlook.com','Sandra Moore',4,'Activated without a hitch. Great communication throughout.',1,'published','986ecebcace7ff8f94a834f2e19e6423','2026-05-02 15:24:54','2026-05-02 15:24:54','US',NULL,NULL,NULL),
(702,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','michelle.rodriguez69@outlook.com','Michelle Rodriguez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','ecd12646870483af4e9e693237f0ff08','2026-05-02 05:30:40','2026-05-02 05:30:40','EU',NULL,NULL,NULL),
(703,NULL,'windows-11-pro','amy.johnson30@hotmail.com','Amy Johnson',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','991c9048e860f2d1a855c316384d1fad','2026-05-02 17:42:21','2026-05-02 17:42:21','GB',NULL,NULL,NULL),
(704,NULL,'microsoft-office-2019-professional-plus-windows','charles.gonzalez33@gmail.com','Charles Gonzalez',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','a71701fcd7cd562eb6299b49e5dd70b1','2026-05-02 15:21:14','2026-05-02 15:21:14','GB',NULL,NULL,NULL),
(705,NULL,'microsoft-project-2024-professional-pc','maria.hernandez32@icloud.com','Maria Hernandez',5,'The email with my key and instructions came through in minutes.',1,'published','48b42e7ac2a6e959efc52cdfb4c846cb','2026-05-02 16:08:46','2026-05-02 16:08:46','GB',NULL,NULL,NULL),
(706,NULL,'microsoft-office-home-and-business-2019-mac','cynthia.clark65@gmail.com','Cynthia Clark',4,'Customer service was responsive and the product key was genuine.',1,'published','32990be89a4eb9cad8516e9eebb96dd3','2026-05-01 06:30:17','2026-05-01 06:30:17','US',NULL,NULL,NULL),
(707,NULL,'microsoft-office-home-business-2024-mac','sandra.jones45@hotmail.com','Sandra Jones',3,'The activation guide was clear and I was up and running fast.',1,'published','c2424f8eec8594897be3fec2883ce440','2026-05-01 16:10:26','2026-05-01 16:10:26','AU','2026-09-16 19:26:36',NULL,NULL),
(708,NULL,'microsoft-office-2021-home-student-windows','christopher.flores95@hotmail.com','Christopher Flores',5,'Customer service was responsive and the product key was genuine.',1,'published','a64220eedc4ae52dea1ee6a0439ea9f9','2026-05-01 06:14:46','2026-05-01 06:14:46','EU',NULL,NULL,NULL),
(709,NULL,'bitdefender-small-office-security-5-devices-1-year','donna.adams83@hotmail.com','Donna Adams',5,'Quick, easy, and it just works. No complaints at all.',1,'published','698aa645fde8066e3a95f92413e829c8','2026-05-01 13:39:17','2026-05-01 13:39:17','AU',NULL,NULL,NULL),
(710,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','amy.taylor80@yahoo.com','Amy Taylor',5,'Solid experience overall. The key worked and support was helpful.',1,'published','f549bf4247d5d9012d8b23370b93795a','2026-05-01 08:10:25','2026-05-01 08:10:25','US',NULL,NULL,NULL),
(711,NULL,'windows-11-pro','george.torres46@hotmail.com','George Torres',5,'Activated without a hitch. Great communication throughout.',1,'published','2cd14cd87f3ddef33d5a2e19e95c463b','2026-04-30 06:27:30','2026-04-30 06:27:30','GB',NULL,NULL,NULL),
(712,NULL,'ms-project-professional-2019-pc','sandra.williams87@outlook.com','Sandra Williams',2,'Very straightforward process. Key came fast and worked immediately.',1,'published','6a134605419ce1c0e764df25c2e36ae6','2026-04-30 08:28:05','2026-04-30 08:28:05','US','2026-09-16 19:26:36',NULL,NULL),
(713,NULL,'windows-11-pro','priya.nelson42@icloud.com','Priya Nelson',4,'Key worked instantly and activated on the first try. Great price too.',1,'published','93d0f765be500eb09a7a40d5ac20638d','2026-04-30 15:54:31','2026-04-30 15:54:31','US',NULL,NULL,NULL),
(714,NULL,'microsoft-office-home-business-2024-pc','priya.lee86@gmail.com','Priya Lee',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','b2d75c34a6caa0a72717f9733facd181','2026-04-30 08:59:25','2026-04-30 08:59:25','US',NULL,NULL,NULL),
(715,NULL,'microsoft-office-home-2024-pc','margaret.lee36@hotmail.com','Margaret Lee',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','a768c425ffa52e7855f8b6b47cb8a030','2026-04-30 14:33:00','2026-04-30 14:33:00','GB',NULL,NULL,NULL),
(716,NULL,'microsoft-word-2021-windows','james.lopez84@outlook.com','James Lopez',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','e2b9c4d8773147752d9e08f75528d5a3','2026-04-30 11:20:09','2026-04-30 11:20:09','US',NULL,NULL,NULL),
(717,NULL,'microsoft-office-2021-home-business-mac','matthew.martin87@outlook.com','Matthew Martin',4,'Second time ordering from this store. Reliable every time.',1,'published','92fdf237d3fd3f4771eb179201da8903','2026-04-29 05:09:25','2026-04-29 05:09:25','US',NULL,NULL,NULL),
(718,NULL,'microsoft-office-home-2024-pc','linda.walker76@outlook.com','Linda Walker',4,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','c0c7d778303f688bf4a7087b84cfd87a','2026-04-29 17:46:27','2026-04-29 17:46:27','CA',NULL,NULL,NULL),
(719,NULL,'microsoft-office-2021-home-business-windows','susan.garcia68@hotmail.com','Susan Garcia',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','2c3e5f8ce628faac793b25736d2cc831','2026-04-29 12:52:47','2026-04-29 12:52:47','US',NULL,NULL,NULL),
(720,NULL,'microsoft-project-professional-2021-pc','jeffrey.torres70@icloud.com','Jeffrey Torres',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','9ffd468cb712971a2e6f51198ffe8940','2026-04-29 11:37:07','2026-04-29 11:37:07','US',NULL,NULL,NULL),
(721,NULL,'microsoft-office-2024-professional-plus-windows','betty.hill99@outlook.com','Betty Hill',4,'Solid experience overall. The key worked and support was helpful.',1,'published','ba585513b2773fc2cb7dcfe98980cff0','2026-04-29 12:47:42','2026-04-29 12:47:42','US',NULL,NULL,NULL),
(722,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','paul.gonzalez70@gmail.com','Paul Gonzalez',5,'Excellent service. The activation guide made setup really easy.',1,'published','c635b29113a8dbb4311de580634d07b4','2026-04-29 17:56:37','2026-04-29 17:56:37','US',NULL,NULL,NULL),
(723,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','matthew.sanchez38@gmail.com','Matthew Sanchez',3,'No issues whatsoever. Key came fast and activated first time.',1,'published','db2fc679c91cdeb80d22efe4cdbfb486','2026-04-29 08:11:15','2026-04-29 08:11:15','CA','2026-09-16 19:26:36',NULL,NULL),
(724,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','patricia.wright99@hotmail.com','Patricia Wright',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','1af5c83254151debd60337036b317fcb','2026-04-28 05:17:10','2026-04-28 05:17:10','US',NULL,NULL,NULL),
(725,NULL,'microsoft-visio-2024-professional-windows-pc','sandra.harris57@yahoo.com','Sandra Harris',4,'Much cheaper than the official store and it activated without any issues.',1,'published','9745040bd424d390a8c2107b2545faad','2026-04-28 09:51:34','2026-04-28 09:51:34','US',NULL,NULL,NULL),
(726,NULL,'microsoft-office-home-and-student-2019-mac','anthony.martin14@hotmail.com','Anthony Martin',4,'Quick delivery and a legit license. Happy customer here.',1,'published','bd84508f075798e2de32cabc173ebb64','2026-04-28 12:19:21','2026-04-28 12:19:21','GB',NULL,NULL,NULL),
(727,NULL,'microsoft-office-2019-home-business-pc','maria.baker54@hotmail.com','Maria Baker',5,'Quick, easy, and it just works. No complaints at all.',1,'published','236ddb61cba09210a45d74dbfa7e7624','2026-04-27 16:59:51','2026-04-27 16:59:51','US',NULL,NULL,NULL),
(728,NULL,'microsoft-office-2021-home-business-windows','larry.jones27@icloud.com','Larry Jones',5,'Solid experience overall. The key worked and support was helpful.',1,'published','bcbb5a43fd2ca5643bf3d35586e92a5f','2026-04-27 15:16:11','2026-04-27 15:16:11','AU',NULL,NULL,NULL),
(729,NULL,'microsoft-office-2024-professional-plus-windows','kenneth.allen62@outlook.com','Kenneth Allen',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','e0d39b46312cd16641fdb3015e0367cc','2026-04-27 05:41:20','2026-04-27 05:41:20','CA',NULL,NULL,NULL),
(730,NULL,'microsoft-office-2021-professional-plus-windows','laura.jones69@yahoo.com','Laura Jones',3,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','e7c738fec29087ad5918c850a3411036','2026-04-27 06:07:11','2026-04-27 06:07:11','US','2026-09-16 19:26:36',NULL,NULL),
(731,NULL,'bitdefender-small-office-security-5-devices-1-year','justin.garcia17@gmail.com','Justin Garcia',3,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','56ad9e3509222989eadd9ca5b655a321','2026-04-26 15:07:40','2026-04-26 15:07:40','CA','2026-09-16 19:26:36',NULL,NULL),
(732,NULL,'microsoft-project-professional-2021-pc','anna.miller29@yahoo.com','Anna Miller',3,'Very straightforward process. Key came fast and worked immediately.',1,'published','c8ca37d25ae45a59bd30588b3a7b3fde','2026-04-26 10:23:33','2026-04-26 10:23:33','AU','2026-09-16 19:26:36',NULL,NULL),
(733,NULL,'microsoft-office-home-and-business-2019-mac','robert.moore36@hotmail.com','Robert Moore',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','d8ac9eab377f305dab635e50c369b51e','2026-04-26 10:19:51','2026-04-26 10:19:51','US',NULL,NULL,NULL),
(734,NULL,'microsoft-office-home-and-business-2019-mac','juan.carter88@hotmail.com','Juan Carter',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','93b0a4237d31bc44fa7fa8f88c55935b','2026-04-26 10:07:46','2026-04-26 10:07:46','US',NULL,NULL,NULL),
(735,NULL,'microsoft-office-2019-home-student-windows','nancy.martin36@hotmail.com','Nancy Martin',5,'Much cheaper than the official store and it activated without any issues.',1,'published','471175995046c04482122b86216226da','2026-04-26 11:50:36','2026-04-26 11:50:36','CA',NULL,NULL,NULL),
(736,NULL,'microsoft-office-2019-professional-plus-windows','christopher.brown70@yahoo.com','Christopher Brown',3,'Honestly better than I expected. Delivery was almost instant.',1,'published','639cd3e1af519edc5ec88ca35de6a31c','2026-04-26 14:52:53','2026-04-26 14:52:53','GB','2026-09-16 19:26:36',NULL,NULL),
(737,NULL,'microsoft-office-2024-professional-plus-windows','margaret.johnson52@outlook.com','Margaret Johnson',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','b3080bde091acaadc5af3cd24378801b','2026-04-26 08:39:24','2026-04-26 08:39:24','US',NULL,NULL,NULL),
(738,NULL,'windows-11-pro','nancy.perez93@yahoo.com','Nancy Perez',3,'Activated without a hitch. Great communication throughout.',1,'published','1b8d0915ef28e5dcbbf841d0a1da1d38','2026-04-25 15:48:15','2026-04-25 15:48:15','US','2026-09-16 19:26:36',NULL,NULL),
(739,NULL,'windows-11-home','kenneth.walker44@icloud.com','Kenneth Walker',5,'Great value. The download links they sent were official and safe.',1,'published','d130404d434c7aa5068cb487cf959a5e','2026-04-25 14:16:31','2026-04-25 14:16:31','US',NULL,NULL,NULL),
(740,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','anna.thompson62@outlook.com','Anna Thompson',4,'Quick delivery and a legit license. Happy customer here.',1,'published','92f64053f5061a7477729aebf9ce1fcb','2026-04-25 10:47:07','2026-04-25 10:47:07','US',NULL,NULL,NULL),
(741,NULL,'microsoft-visio-2021-professional-windows-pc','maria.martinez65@gmail.com','Maria Martinez',4,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','75c2cd6f903d335df3d4600f1292370d','2026-04-25 13:48:59','2026-04-25 13:48:59','US',NULL,NULL,NULL),
(742,NULL,'ms-project-professional-2019-pc','anthony.williams82@icloud.com','Anthony Williams',5,'Superb service. The whole process took less than five minutes.',1,'published','fb81353ec510de44efb28c8cea8aeccd','2026-04-25 11:30:38','2026-04-25 11:30:38','US',NULL,NULL,NULL),
(743,NULL,'microsoft-office-2024-professional-plus-windows','jennifer.williams78@yahoo.com','Jennifer Williams',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','cb026c35172dd8a42f34b864f52b061a','2026-04-24 07:58:58','2026-04-24 07:58:58','EU',NULL,NULL,NULL),
(744,NULL,'microsoft-office-2024-professional-plus-windows','karen.king19@hotmail.com','Karen King',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','1254090f54254dbd5a6d6634d6a1d372','2026-04-24 05:15:56','2026-04-24 05:15:56','US',NULL,NULL,NULL),
(745,NULL,'microsoft-project-professional-2021-pc','ryan.johnson49@hotmail.com','Ryan Johnson',5,'Saved over half the retail price and the license is completely genuine.',1,'published','872156668550d3cb3e46742fc632b841','2026-04-24 08:04:04','2026-04-24 08:04:04','GB',NULL,NULL,NULL),
(746,NULL,'microsoft-office-home-and-business-2019-mac','michael.garcia67@outlook.com','Michael Garcia',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','dbc90b0004731b104797204bd0d56e0f','2026-04-23 12:20:24','2026-04-23 12:20:24','GB',NULL,NULL,NULL),
(747,NULL,'microsoft-office-2024-professional-plus-windows','amanda.garcia87@outlook.com','Amanda Garcia',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','12798452240ddf215b187dd25eda77bd','2026-04-23 07:39:18','2026-04-23 07:39:18','GB',NULL,NULL,NULL),
(748,NULL,'microsoft-project-professional-2021-pc','jessica.hernandez63@icloud.com','Jessica Hernandez',3,'Very straightforward process. Key came fast and worked immediately.',1,'published','4095839c7cf2d9c66d6fec3e94e973a2','2026-04-23 05:09:47','2026-04-23 05:09:47','CA','2026-09-16 19:26:36',NULL,NULL),
(749,NULL,'microsoft-office-home-and-student-2019-mac','larry.king83@yahoo.com','Larry King',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','7ef77c24c20b7ee7df345f09ae6dbaa7','2026-04-23 08:26:39','2026-04-23 08:26:39','US',NULL,NULL,NULL),
(750,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','andrew.nguyen35@gmail.com','Andrew Nguyen',5,'Activation was painless and the key was valid immediately.',1,'published','549f52df2e93728c515c007756a91ba7','2026-04-23 06:23:16','2026-04-23 06:23:16','US',NULL,NULL,NULL),
(751,NULL,'ms-visio-professional-2019-pc','william.green91@outlook.com','William Green',4,'Activated without a hitch. Great communication throughout.',1,'published','c0671fd512b5a066384972e127bd4838','2026-04-22 11:47:12','2026-04-22 11:47:12','US',NULL,NULL,NULL),
(752,NULL,'microsoft-office-2021-home-business-windows','andrew.robinson74@hotmail.com','Andrew Robinson',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','a68f077e5dfa625b5380575fb333ac14','2026-04-22 04:42:21','2026-04-22 04:42:21','US',NULL,NULL,NULL),
(753,NULL,'microsoft-project-professional-2021-pc','kenneth.white78@outlook.com','Kenneth White',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','26ab363ee98316577d2493652762b8b5','2026-04-22 05:18:10','2026-04-22 05:18:10','US',NULL,NULL,NULL),
(754,NULL,'microsoft-office-2019-home-business-pc','patricia.ramirez74@yahoo.com','Patricia Ramirez',3,'Product key arrived quickly and worked on my new PC right away.',1,'published','04a63621ef2ae4d78863f1cb1bc74d43','2026-04-22 16:53:47','2026-04-22 16:53:47','US','2026-09-16 19:26:36',NULL,NULL),
(755,NULL,'ms-visio-professional-2019-pc','amy.scott49@yahoo.com','Amy Scott',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','a0efe427a9397840677f2ac0882f1bd5','2026-04-22 14:31:37','2026-04-22 14:31:37','US',NULL,NULL,NULL),
(756,NULL,'microsoft-office-2021-professional-plus-windows','stephanie.martin75@icloud.com','Stephanie Martin',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','40a3186d2a952f65af8771b94c81ade5','2026-04-22 08:45:03','2026-04-22 08:45:03','US',NULL,NULL,NULL),
(757,NULL,'ms-visio-professional-2019-pc','nancy.rivera17@yahoo.com','Nancy Rivera',5,'The step-by-step activation instructions were really helpful.',1,'published','ed5737b4fb81d1fac371a15de67e7441','2026-04-22 08:19:20','2026-04-22 08:19:20','CA',NULL,NULL,NULL),
(758,NULL,'windows-11-pro','donna.brown60@icloud.com','Donna Brown',5,'Much cheaper than the official store and it activated without any issues.',1,'published','d8d527a9a851432c116021c8dff28f41','2026-04-21 08:17:22','2026-04-21 08:17:22','US',NULL,NULL,NULL),
(759,NULL,'microsoft-office-2021-home-business-mac','nicole.allen94@yahoo.com','Nicole Allen',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','10032346a5078032a6fa8ee96b239109','2026-04-21 09:15:47','2026-04-21 09:15:47','CA',NULL,NULL,NULL),
(760,NULL,'microsoft-office-2021-professional-plus-windows','andrew.thompson66@outlook.com','Andrew Thompson',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','48ff4eca3b4723affc8e963eb2d99044','2026-04-21 11:59:09','2026-04-21 11:59:09','AU',NULL,NULL,NULL),
(761,NULL,'microsoft-visio-2021-professional-windows-pc','joseph.rodriguez87@outlook.com','Joseph Rodriguez',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','84f0d6270a0413773fb4e36c0d701f6a','2026-04-20 12:22:53','2026-04-20 12:22:53','EU',NULL,NULL,NULL),
(762,NULL,'microsoft-office-2021-home-business-mac','barbara.rodriguez33@gmail.com','Barbara Rodriguez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','1fdcb6d487cfebe2a50ff802cfa2a13a','2026-04-20 12:25:01','2026-04-20 12:25:01','US',NULL,NULL,NULL),
(763,NULL,'microsoft-office-2019-home-student-windows','lisa.white26@gmail.com','Lisa White',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','717402797c3db87a3d543a6b8c4f0917','2026-04-20 16:24:24','2026-04-20 16:24:24','EU',NULL,NULL,NULL),
(764,NULL,'microsoft-visio-2024-professional-windows-pc','robert.gonzalez91@hotmail.com','Robert Gonzalez',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','fe72b632a65f13e6f4dcda57f76cbb15','2026-04-20 06:51:33','2026-04-20 06:51:33','US',NULL,NULL,NULL),
(765,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','michael.lee80@icloud.com','Michael Lee',5,'Activated without a hitch. Great communication throughout.',1,'published','bef30f6dffb8d69defd588741efdcf66','2026-04-20 07:41:59','2026-04-20 07:41:59','GB',NULL,NULL,NULL),
(766,NULL,'microsoft-office-2019-home-student-windows','samantha.moore18@gmail.com','Samantha Moore',5,'The email with my key and instructions came through in minutes.',1,'published','cbc6e7b5c79d078c45a302420ff187e0','2026-04-20 16:27:29','2026-04-20 16:27:29','US',NULL,NULL,NULL),
(767,NULL,'windows-11-home','donna.allen69@yahoo.com','Donna Allen',4,'Activated without a hitch. Great communication throughout.',1,'published','f41b1f820b2e4b3323620e5471f33746','2026-04-20 05:53:06','2026-04-20 05:53:06','AU',NULL,NULL,NULL),
(768,NULL,'microsoft-office-home-business-2024-mac','kevin.anderson42@hotmail.com','Kevin Anderson',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','a3ec080814bd02d23ccedc9266f6187a','2026-04-19 06:06:15','2026-04-19 06:06:15','AU',NULL,NULL,NULL),
(769,NULL,'microsoft-office-2021-home-business-mac','lisa.nelson83@yahoo.com','Lisa Nelson',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','e50ff9609d4ae558f499993e8e759fee','2026-04-19 09:54:19','2026-04-19 09:54:19','CA',NULL,NULL,NULL),
(770,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','lisa.ramirez51@hotmail.com','Lisa Ramirez',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','6e80db525120fc1946f59f483f439034','2026-04-19 04:05:07','2026-04-19 04:05:07','GB',NULL,NULL,NULL),
(771,NULL,'windows-10-pro','richard.nguyen90@hotmail.com','Richard Nguyen',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','7a7a203f3a531543f0c237e87464e2f5','2026-04-19 07:27:40','2026-04-19 07:27:40','EU',NULL,NULL,NULL),
(772,NULL,'microsoft-excel-2021-windows','steven.jones72@gmail.com','Steven Jones',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','2adfbf9f6ff57ae6267923588e1248db','2026-04-19 08:30:09','2026-04-19 08:30:09','US',NULL,NULL,NULL),
(773,NULL,'microsoft-office-2021-home-student-windows','anna.hill56@hotmail.com','Anna Hill',5,'Solid experience overall. The key worked and support was helpful.',1,'published','7a54ca1b65ac76c4f1913641795f13d8','2026-04-18 09:43:22','2026-04-18 09:43:22','US',NULL,NULL,NULL),
(774,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','carlos.smith71@hotmail.com','Carlos Smith',4,'Works great on my PC. No issues after several weeks of use.',1,'published','3338a2d28b61fa9515f1e3efb7fa5870','2026-04-18 14:01:24','2026-04-18 14:01:24','US',NULL,NULL,NULL),
(775,NULL,'microsoft-office-2021-home-business-mac','margaret.scott46@icloud.com','Margaret Scott',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','0a41fd5e316fb4657592c77f9798d3e2','2026-04-18 06:29:15','2026-04-18 06:29:15','EU',NULL,NULL,NULL),
(776,NULL,'windows-11-home','kevin.hernandez89@yahoo.com','Kevin Hernandez',5,'Ordered late at night and still got the key within minutes.',1,'published','ff4e964bfd253ce0d83259842d57a0d1','2026-04-17 14:34:50','2026-04-17 14:34:50','US',NULL,NULL,NULL),
(777,NULL,'microsoft-office-2021-home-business-windows','stephanie.thomas91@hotmail.com','Stephanie Thomas',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','9dead9c1dca79e167e37fac83a6645fc','2026-04-17 07:28:32','2026-04-17 07:28:32','GB',NULL,NULL,NULL),
(778,NULL,'microsoft-project-professional-2021-pc','nancy.anderson72@icloud.com','Nancy Anderson',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','2b8800e0633d83cf2d372b56cccad702','2026-04-17 08:31:02','2026-04-17 08:31:02','CA',NULL,NULL,NULL),
(779,NULL,'windows-11-home','sandra.brown56@gmail.com','Sandra Brown',5,'Works great on my PC. No issues after several weeks of use.',1,'published','21f9559c37120b7f705a8e1339cb3c03','2026-04-17 06:09:27','2026-04-17 06:09:27','GB',NULL,NULL,NULL),
(780,NULL,'microsoft-office-2021-home-student-mac','matthew.garcia71@gmail.com','Matthew Garcia',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','8e82627a6f6f0a54fec8085ec272cc77','2026-04-17 15:37:36','2026-04-17 15:37:36','CA',NULL,NULL,NULL),
(781,NULL,'ms-visio-professional-2019-pc','donald.nguyen10@hotmail.com','Donald Nguyen',3,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','8d1317fcd5294893868e48066bc8c10c','2026-04-16 16:03:38','2026-04-16 16:03:38','EU','2026-09-16 19:26:36',NULL,NULL),
(782,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','joshua.jackson63@hotmail.com','Joshua Jackson',5,'Delivered on time and it works perfectly. Five stars.',1,'published','61015ec05a7001e8be2918fdce5749ea','2026-04-16 05:28:58','2026-04-16 05:28:58','US',NULL,NULL,NULL),
(783,NULL,'microsoft-office-2019-professional-plus-windows','ashley.anderson63@gmail.com','Ashley Anderson',5,'The activation guide was clear and I was up and running fast.',1,'published','147fe4b4cdb00a203c1873d742655f2c','2026-04-16 11:18:55','2026-04-16 11:18:55','CA',NULL,NULL,NULL),
(784,NULL,'ms-visio-professional-2019-pc','deborah.jackson86@icloud.com','Deborah Jackson',5,'Really good price and prompt delivery. Working great so far.',1,'published','60b3126fc0023eeda9696b041844453e','2026-04-16 16:51:45','2026-04-16 16:51:45','US',NULL,NULL,NULL),
(785,NULL,'microsoft-office-home-2024-mac','steven.white51@hotmail.com','Steven White',5,'Really good price and prompt delivery. Working great so far.',1,'published','bf4055f355f1b410ab13b0446a397503','2026-04-16 05:55:10','2026-04-16 05:55:10','US',NULL,NULL,NULL),
(786,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','stephanie.martinez73@yahoo.com','Stephanie Martinez',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','04dca5dd525b74ad9112b47f00466120','2026-04-16 17:54:13','2026-04-16 17:54:13','AU',NULL,NULL,NULL),
(787,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','anna.king87@hotmail.com','Anna King',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','3ad8412811ffc1f9814cc7dfc15075d3','2026-04-16 05:49:53','2026-04-16 05:49:53','GB',NULL,NULL,NULL),
(788,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','kathleen.harris15@outlook.com','Kathleen Harris',5,'Good product for the money. Everything was quick and easy.',1,'published','122dccc7c7b65abd41a9734b1514345b','2026-04-15 14:00:28','2026-04-15 14:00:28','AU',NULL,NULL,NULL),
(789,NULL,'windows-11-pro','kathleen.moore35@hotmail.com','Kathleen Moore',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','8228912ac99751469df02b5a5f70b6cc','2026-04-15 08:39:43','2026-04-15 08:39:43','US',NULL,NULL,NULL),
(790,NULL,'microsoft-project-2024-professional-pc','eric.ramirez12@yahoo.com','Eric Ramirez',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','aae9374ad6f8fe16944767e24ea53944','2026-04-15 16:26:05','2026-04-15 16:26:05','CA',NULL,NULL,NULL),
(791,NULL,'microsoft-office-2021-professional-plus-windows','stephanie.garcia12@hotmail.com','Stephanie Garcia',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','fe65e1f712afda9f07e61eab5d8f89c7','2026-04-15 13:13:10','2026-04-15 13:13:10','US',NULL,NULL,NULL),
(792,NULL,'microsoft-office-home-2024-pc','christopher.carter46@icloud.com','Christopher Carter',5,'Much cheaper than the official store and it activated without any issues.',1,'published','c4cf42f03a39d1ace4e0977c54e0de7a','2026-04-15 14:38:07','2026-04-15 14:38:07','US',NULL,NULL,NULL),
(793,NULL,'microsoft-office-2019-professional-plus-windows','stephen.torres12@icloud.com','Stephen Torres',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','0ef25dcf0428922e8e7c0f1776966440','2026-04-15 05:12:43','2026-04-15 05:12:43','GB',NULL,NULL,NULL),
(794,NULL,'microsoft-office-2019-home-student-windows','matthew.jackson51@outlook.com','Matthew Jackson',5,'Saved over half the retail price and the license is completely genuine.',1,'published','99f51fdff7d320b21dcb8bc661cbc9a1','2026-04-15 05:09:28','2026-04-15 05:09:28','US',NULL,NULL,NULL),
(795,NULL,'microsoft-project-2024-professional-pc','ashley.smith34@hotmail.com','Ashley Smith',4,'Saved over half the retail price and the license is completely genuine.',1,'published','d8331012509165865608d620c7e5fb43','2026-04-14 10:50:30','2026-04-14 10:50:30','CA',NULL,NULL,NULL),
(796,NULL,'microsoft-office-home-and-business-2019-mac','betty.sanchez55@hotmail.com','Betty Sanchez',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','fcdcebadadee95eb846bdcd079cd4294','2026-04-14 04:35:22','2026-04-14 04:35:22','EU',NULL,NULL,NULL),
(797,NULL,'bitdefender-small-office-security-5-devices-1-year','thomas.martinez98@hotmail.com','Thomas Martinez',5,'Quick, easy, and it just works. No complaints at all.',1,'published','1c1bae490c5e399ec9f2be8ad74bc5bd','2026-04-14 15:36:05','2026-04-14 15:36:05','US',NULL,NULL,NULL),
(798,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','stephanie.young19@yahoo.com','Stephanie Young',4,'Really good price and prompt delivery. Working great so far.',1,'published','ec4f34ffb3b72c85523e5fcf7b785be8','2026-04-14 08:45:11','2026-04-14 08:45:11','US',NULL,NULL,NULL),
(799,NULL,'microsoft-office-home-2024-mac','ashley.jackson10@outlook.com','Ashley Jackson',5,'Solid experience overall. The key worked and support was helpful.',1,'published','f668b3825e4f9fe4944225e62ff509b7','2026-04-14 17:13:06','2026-04-14 17:13:06','CA',NULL,NULL,NULL),
(800,NULL,'ms-project-professional-2019-pc','olga.ramirez63@hotmail.com','Olga Ramirez',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','2f69a41aab8968f149b9445dc57bc7b8','2026-04-14 17:39:04','2026-04-14 17:39:04','GB',NULL,NULL,NULL),
(801,NULL,'microsoft-office-2021-home-student-mac','olga.sanchez26@outlook.com','Olga Sanchez',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','3800e79acf1235073ea8e40f3599a1d1','2026-04-14 06:22:12','2026-04-14 06:22:12','GB',NULL,NULL,NULL),
(802,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','paul.miller83@hotmail.com','Paul Miller',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','1d84a21330153f7daa8fa4eae2779dc4','2026-04-13 08:18:56','2026-04-13 08:18:56','US',NULL,NULL,NULL),
(803,NULL,'microsoft-office-2024-professional-plus-windows','linda.flores44@gmail.com','Linda Flores',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','972349f9a90f5872c66bf903768e9190','2026-04-13 05:32:07','2026-04-13 05:32:07','GB',NULL,NULL,NULL),
(804,NULL,'windows-10-pro','ahmed.taylor74@icloud.com','Ahmed Taylor',5,'Ordered late at night and still got the key within minutes.',1,'published','5ad3ac4d941e3ad07c16c07f311e9617','2026-04-13 05:52:15','2026-04-13 05:52:15','CA',NULL,NULL,NULL),
(805,NULL,'ms-visio-professional-2019-pc','jennifer.lewis51@outlook.com','Jennifer Lewis',5,'Second time ordering from this store. Reliable every time.',1,'published','941513530391b07ab3ac679281b94a23','2026-04-13 15:49:46','2026-04-13 15:49:46','GB',NULL,NULL,NULL),
(806,NULL,'microsoft-word-2021-windows','joseph.garcia73@gmail.com','Joseph Garcia',4,'Really good price and prompt delivery. Working great so far.',1,'published','dbbe435558998eec01b549b6422c1b39','2026-04-13 07:05:54','2026-04-13 07:05:54','US',NULL,NULL,NULL),
(807,NULL,'microsoft-office-2021-home-business-windows','james.adams81@yahoo.com','James Adams',3,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','38b712ca3d69124c648f60c9178b1ded','2026-04-12 14:12:42','2026-04-12 14:12:42','US','2026-09-16 19:26:36',NULL,NULL),
(808,NULL,'windows-10-home','mark.campbell37@hotmail.com','Mark Campbell',5,'Activated without a hitch. Great communication throughout.',1,'published','d9c3f426842f4869f689dde56877e63c','2026-04-12 06:19:10','2026-04-12 06:19:10','CA',NULL,NULL,NULL),
(809,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','ronald.brown44@yahoo.com','Ronald Brown',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','5ed086ed866062ec4b241da224f032b8','2026-04-12 10:36:58','2026-04-12 10:36:58','US',NULL,NULL,NULL),
(810,NULL,'microsoft-office-home-business-2024-pc','amy.young57@icloud.com','Amy Young',5,'Customer service was responsive and the product key was genuine.',1,'published','8c28aac22bd55c4122a31867650a8e53','2026-04-12 08:34:22','2026-04-12 08:34:22','AU',NULL,NULL,NULL),
(811,NULL,'microsoft-office-home-2024-mac','stephen.smith94@icloud.com','Stephen Smith',2,'Ordered late at night and still got the key within minutes.',1,'published','934653bd961dbea2b958a4f075642610','2026-04-11 04:12:07','2026-04-11 04:12:07','US','2026-09-16 19:26:36',NULL,NULL),
(812,NULL,'microsoft-office-2021-home-student-mac','jason.lopez54@yahoo.com','Jason Lopez',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','caef56cf572b8406617f657a70dd5fc1','2026-04-11 10:37:34','2026-04-11 10:37:34','US',NULL,NULL,NULL),
(813,NULL,'microsoft-office-2019-professional-plus-windows','melissa.perez32@hotmail.com','Melissa Perez',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','7c9d26e989808e0b40329ff44fb26f05','2026-04-11 16:12:32','2026-04-11 16:12:32','CA',NULL,NULL,NULL),
(814,NULL,'windows-11-home','patricia.davis18@icloud.com','Patricia Davis',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','a19f30d6ab8d0b9c11d726c52ebd3d3e','2026-04-11 15:24:15','2026-04-11 15:24:15','GB',NULL,NULL,NULL),
(815,NULL,'microsoft-project-professional-2021-pc','andrew.lee26@outlook.com','Andrew Lee',2,'No issues whatsoever. Key came fast and activated first time.',1,'published','ff747660f47d7bbc90c8921e7265ce2c','2026-04-11 14:37:36','2026-04-11 14:37:36','US','2026-09-16 19:26:36',NULL,NULL),
(816,NULL,'microsoft-office-home-and-student-2019-mac','sarah.ramirez34@yahoo.com','Sarah Ramirez',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','af7ee46146cf792e5138b7c92888a39a','2026-04-11 14:01:00','2026-04-11 14:01:00','GB',NULL,NULL,NULL),
(817,NULL,'microsoft-office-2021-professional-plus-windows','susan.anderson58@hotmail.com','Susan Anderson',5,'Ordered late at night and still got the key within minutes.',1,'published','6dd4b1890e742d8713e57c2fbc15fd8a','2026-04-11 05:29:41','2026-04-11 05:29:41','US',NULL,NULL,NULL),
(818,NULL,'microsoft-office-2019-home-business-pc','betty.rodriguez19@outlook.com','Betty Rodriguez',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','c6569aeba2281bafdda0228dbf3f1397','2026-04-10 07:23:45','2026-04-10 07:23:45','US',NULL,NULL,NULL),
(819,NULL,'microsoft-office-home-and-business-2019-mac','anna.adams50@yahoo.com','Anna Adams',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','3f1782d213c3dd71a0915e0b3a0ef966','2026-04-10 15:16:21','2026-04-10 15:16:21','EU',NULL,NULL,NULL),
(820,NULL,'microsoft-office-home-business-2024-mac','michael.wilson16@icloud.com','Michael Wilson',3,'The activation guide was clear and I was up and running fast.',1,'published','a7c76fc7fa511ce19c56d504a46baf56','2026-04-10 08:45:24','2026-04-10 08:45:24','US','2026-09-16 19:26:36',NULL,NULL),
(821,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','linda.hill69@hotmail.com','Linda Hill',5,'Works great on my PC. No issues after several weeks of use.',1,'published','21ec17813ab678fe830186a609808d3a','2026-04-10 15:19:52','2026-04-10 15:19:52','US',NULL,NULL,NULL),
(822,NULL,'microsoft-office-home-2024-pc','sandra.clark21@outlook.com','Sandra Clark',3,'Customer service was responsive and the product key was genuine.',1,'published','0b6b8e5102fc1e1d3a118ddd43cb8ee0','2026-04-09 16:34:58','2026-04-09 16:34:58','US','2026-09-16 19:26:36',NULL,NULL),
(823,NULL,'bitdefender-small-office-security-5-devices-1-year','jennifer.jones48@hotmail.com','Jennifer Jones',5,'The activation guide was clear and I was up and running fast.',1,'published','afc5992bb1eb1ca857e1cc82d8006b3c','2026-04-09 09:47:41','2026-04-09 09:47:41','US',NULL,NULL,NULL),
(824,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','brian.patel91@gmail.com','Brian Patel',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','fe6f3e9b144669f40f8c672a2ce595e2','2026-04-09 05:45:15','2026-04-09 05:45:15','CA',NULL,NULL,NULL),
(825,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','linda.jones92@hotmail.com','Linda Jones',5,'Quick delivery and a legit license. Happy customer here.',1,'published','798757a6bfe4512e6c7cfd8a273dc680','2026-04-09 15:13:35','2026-04-09 15:13:35','CA',NULL,NULL,NULL),
(826,NULL,'microsoft-office-2021-professional-plus-windows','priya.young95@outlook.com','Priya Young',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','7433c7de1c162ed9b3b0becee4a66f00','2026-04-09 05:23:43','2026-04-09 05:23:43','CA',NULL,NULL,NULL),
(827,NULL,'microsoft-office-home-and-business-2019-mac','karen.garcia19@outlook.com','Karen Garcia',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','6b66d93e87d5a0ef69a7425a1c170192','2026-04-08 12:02:02','2026-04-08 12:02:02','GB',NULL,NULL,NULL),
(828,NULL,'microsoft-office-2021-home-business-windows','ashley.flores27@icloud.com','Ashley Flores',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','5600dac0f1c8345e4d762867f2366739','2026-04-08 10:30:18','2026-04-08 10:30:18','US',NULL,NULL,NULL),
(829,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','jason.martin97@yahoo.com','Jason Martin',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','766d0228f55e21ec9ace0038452b3f20','2026-04-08 09:45:21','2026-04-08 09:45:21','US',NULL,NULL,NULL),
(830,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','matthew.moore70@hotmail.com','Matthew Moore',5,'Great value. The download links they sent were official and safe.',1,'published','5042200643dce2641128102474045b27','2026-04-08 09:27:17','2026-04-08 09:27:17','GB',NULL,NULL,NULL),
(831,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','samantha.torres10@hotmail.com','Samantha Torres',4,'Was up and running the same hour I ordered. Very impressed.',1,'published','12dbca16870b2377299af9c1bb8cea9a','2026-04-07 07:32:09','2026-04-07 07:32:09','CA',NULL,NULL,NULL),
(832,NULL,'microsoft-office-2021-home-student-windows','robert.martin86@gmail.com','Robert Martin',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','47088b1002b3a04d43c087e8d0f48f97','2026-04-07 07:38:31','2026-04-07 07:38:31','US',NULL,NULL,NULL),
(833,NULL,'microsoft-office-2021-home-business-mac','sharon.allen60@hotmail.com','Sharon Allen',4,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','c0985f0f97b43c26b7e0f252c981922a','2026-04-07 11:38:35','2026-04-07 11:38:35','EU',NULL,NULL,NULL),
(834,NULL,'microsoft-office-2019-home-business-pc','ryan.young39@hotmail.com','Ryan Young',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','96ec77af6fa33accc62f871bb6e6e322','2026-04-06 09:38:57','2026-04-06 09:38:57','GB',NULL,NULL,NULL),
(835,NULL,'microsoft-office-home-business-2024-pc','richard.scott10@hotmail.com','Richard Scott',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','08a7704bf15ce3cd48ee5eaaa165c1dd','2026-04-06 08:53:18','2026-04-06 08:53:18','GB',NULL,NULL,NULL),
(836,NULL,'microsoft-office-home-business-2024-mac','jason.garcia44@hotmail.com','Jason Garcia',4,'Quick delivery and a legit license. Happy customer here.',1,'published','035b86e3f9fcab5c8d5d673114d61822','2026-04-06 17:01:03','2026-04-06 17:01:03','GB',NULL,NULL,NULL),
(837,NULL,'microsoft-project-professional-2021-pc','charles.hall56@outlook.com','Charles Hall',4,'Everything went smoothly from purchase to activation. Recommended.',1,'published','9a6f9714efd3de58c026f8b540c7b8c4','2026-04-06 16:06:46','2026-04-06 16:06:46','US',NULL,NULL,NULL),
(838,NULL,'windows-11-pro','anna.robinson40@hotmail.com','Anna Robinson',5,'The step-by-step activation instructions were really helpful.',1,'published','0457844f3bdc8dec6aa095d726fb3526','2026-04-06 16:56:45','2026-04-06 16:56:45','CA',NULL,NULL,NULL),
(839,NULL,'microsoft-office-2021-home-student-windows','jessica.adams45@gmail.com','Jessica Adams',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','666780a466722bfe567e95c2a045a5a3','2026-04-06 14:34:26','2026-04-06 14:34:26','GB',NULL,NULL,NULL),
(840,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','emily.davis65@outlook.com','Emily Davis',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','d75f523ffcadfcca60010cd16ab53697','2026-04-06 11:24:53','2026-04-06 11:24:53','US',NULL,NULL,NULL),
(841,NULL,'microsoft-office-2019-professional-plus-windows','laura.williams50@icloud.com','Laura Williams',5,'Superb service. The whole process took less than five minutes.',1,'published','2978e8a2e9ee4aefa6f09417e2f42170','2026-04-05 14:20:54','2026-04-05 14:20:54','US',NULL,NULL,NULL),
(842,NULL,'microsoft-office-2019-home-student-windows','anthony.young94@icloud.com','Anthony Young',5,'Really good price and prompt delivery. Working great so far.',1,'published','51b6362ebfd9ba6c1868c6c46e83d141','2026-04-05 10:14:37','2026-04-05 10:14:37','GB',NULL,NULL,NULL),
(843,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','betty.allen73@gmail.com','Betty Allen',5,'Much cheaper than the official store and it activated without any issues.',1,'published','ee571d4ff3582e89d9b737ab30d4c58c','2026-04-05 06:33:30','2026-04-05 06:33:30','CA',NULL,NULL,NULL),
(844,NULL,'windows-10-pro','kimberly.campbell79@yahoo.com','Kimberly Campbell',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','c2b89c4118332bbada20f8364ff8b0a0','2026-04-04 08:42:08','2026-04-04 08:42:08','US',NULL,NULL,NULL),
(845,NULL,'microsoft-visio-2021-professional-windows-pc','pamela.perez16@hotmail.com','Pamela Perez',5,'Customer service was responsive and the product key was genuine.',1,'published','ea8f3a5bb004ee0603ab5df19a500650','2026-04-04 12:06:00','2026-04-04 12:06:00','US',NULL,NULL,NULL),
(846,NULL,'microsoft-word-2021-windows','patricia.hill33@outlook.com','Patricia Hill',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','77d42ef4af299dfdf561ce1dc7f72a87','2026-04-04 16:31:39','2026-04-04 16:31:39','US',NULL,NULL,NULL),
(847,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','jennifer.rivera89@icloud.com','Jennifer Rivera',4,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','9a95e5976004bf1d959ef3f8b6f592d0','2026-04-04 05:33:01','2026-04-04 05:33:01','GB',NULL,NULL,NULL),
(848,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','christopher.ramirez23@hotmail.com','Christopher Ramirez',5,'The activation guide was clear and I was up and running fast.',1,'published','f34e72b9cf5501b090a8a9b1f5dab47c','2026-04-04 08:56:12','2026-04-04 08:56:12','US',NULL,NULL,NULL),
(849,NULL,'microsoft-visio-2021-professional-windows-pc','betty.white18@hotmail.com','Betty White',3,'Genuine key, best price I found online. Will buy from here again.',1,'published','0d1c76d3454fa171aa3167116b916e6c','2026-04-04 06:59:33','2026-04-04 06:59:33','GB','2026-09-16 19:26:36',NULL,NULL),
(850,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','james.anderson90@icloud.com','James Anderson',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','eb1184341e7f2eff1d396405a49acdf4','2026-04-03 09:17:58','2026-04-03 09:17:58','EU',NULL,NULL,NULL),
(851,NULL,'microsoft-office-home-business-2024-pc','larry.lee50@icloud.com','Larry Lee',4,'Excellent service. The activation guide made setup really easy.',1,'published','59d65d7c3ba6aad969e9b36720d046d8','2026-04-03 06:40:19','2026-04-03 06:40:19','CA',NULL,NULL,NULL),
(852,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','richard.perez41@gmail.com','Richard Perez',5,'Great value. The download links they sent were official and safe.',1,'published','9effb9d8c8d66e72dd947a53637d43b0','2026-04-03 14:44:55','2026-04-03 14:44:55','US',NULL,NULL,NULL),
(853,NULL,'microsoft-project-2024-professional-pc','olga.nelson46@yahoo.com','Olga Nelson',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','a3e11b12435b0e9ad1eec5f7223d9fe8','2026-04-03 15:29:41','2026-04-03 15:29:41','US',NULL,NULL,NULL),
(854,NULL,'windows-10-pro','joseph.baker81@gmail.com','Joseph Baker',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','e91819a236d536dc5146fae469264473','2026-04-03 08:40:01','2026-04-03 08:40:01','US',NULL,NULL,NULL),
(855,NULL,'microsoft-office-home-and-business-2019-mac','karen.green14@yahoo.com','Karen Green',5,'Much cheaper than the official store and it activated without any issues.',1,'published','cef368461a038b6b5f83869f16d819df','2026-04-03 08:48:04','2026-04-03 08:48:04','EU',NULL,NULL,NULL),
(856,NULL,'microsoft-office-2021-home-student-windows','michelle.wilson92@yahoo.com','Michelle Wilson',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','3653cfbfdf7e20501d8326abb01e5bed','2026-04-03 13:23:22','2026-04-03 13:23:22','US',NULL,NULL,NULL),
(857,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kathleen.williams88@yahoo.com','Kathleen Williams',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','933c6554dfa42e9f0373cf40396de713','2026-04-02 13:47:44','2026-04-02 13:47:44','AU',NULL,NULL,NULL),
(858,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','mary.williams40@gmail.com','Mary Williams',5,'Really good price and prompt delivery. Working great so far.',1,'published','f9f2aed943fc7c92537d876e7fd57742','2026-04-02 04:04:59','2026-04-02 04:04:59','CA',NULL,NULL,NULL),
(859,NULL,'microsoft-office-2021-home-student-mac','donna.king13@gmail.com','Donna King',4,'Customer service was responsive and the product key was genuine.',1,'published','2af07732c5942f89be6285c32f74fb36','2026-04-02 13:24:50','2026-04-02 13:24:50','US',NULL,NULL,NULL),
(860,NULL,'ms-visio-professional-2019-pc','ryan.ramirez35@icloud.com','Ryan Ramirez',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','4c4f5fde305f38a2e9034f36dee2eec8','2026-04-02 17:55:22','2026-04-02 17:55:22','US',NULL,NULL,NULL),
(861,NULL,'microsoft-office-2019-home-student-windows','nancy.hill14@hotmail.com','Nancy Hill',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','e55cdff45095918006fab2fef6511e10','2026-04-02 11:52:18','2026-04-02 11:52:18','US',NULL,NULL,NULL),
(862,NULL,'microsoft-office-home-and-student-2019-mac','priya.lewis76@hotmail.com','Priya Lewis',5,'The email with my key and instructions came through in minutes.',1,'published','701844c49cf7ab1decd8f5690280cd91','2026-04-02 11:41:23','2026-04-02 11:41:23','US',NULL,NULL,NULL),
(863,NULL,'microsoft-project-2024-professional-pc','david.harris81@yahoo.com','David Harris',3,'Superb service. The whole process took less than five minutes.',1,'published','a96c732da36948f48d806c140ca70ec1','2026-04-02 13:29:16','2026-04-02 13:29:16','GB','2026-09-16 19:26:36',NULL,NULL),
(864,NULL,'microsoft-office-2021-home-business-windows','george.baker37@yahoo.com','George Baker',5,'Really good price and prompt delivery. Working great so far.',1,'published','f8421c658789e9e9647075ce24ea73a2','2026-04-01 16:56:40','2026-04-01 16:56:40','CA',NULL,NULL,NULL),
(865,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','sandra.king79@outlook.com','Sandra King',5,'Activated without a hitch. Great communication throughout.',1,'published','2246c3ef2b710191be24fc3b05910388','2026-04-01 10:38:46','2026-04-01 10:38:46','GB',NULL,NULL,NULL),
(866,NULL,'bitdefender-small-office-security-5-devices-1-year','patricia.wilson92@hotmail.com','Patricia Wilson',4,'Delivered on time and it works perfectly. Five stars.',1,'published','904ad829dc0060c00b86456905095b36','2026-04-01 10:22:33','2026-04-01 10:22:33','CA',NULL,NULL,NULL),
(867,NULL,'microsoft-office-2021-home-student-mac','eric.rodriguez14@yahoo.com','Eric Rodriguez',5,'Saved over half the retail price and the license is completely genuine.',1,'published','ffa460b3fd21afc620ae6efad3824b89','2026-04-01 13:20:22','2026-04-01 13:20:22','US',NULL,NULL,NULL),
(868,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','deborah.harris91@gmail.com','Deborah Harris',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','dec39d6e594d34f3bf9ec6a8dd51df39','2026-04-01 05:41:34','2026-04-01 05:41:34','US',NULL,NULL,NULL),
(869,NULL,'microsoft-project-2024-professional-pc','raj.clark46@gmail.com','Raj Clark',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','51629c8bedd2c9679827c9046b19cbd4','2026-04-01 13:38:26','2026-04-01 13:38:26','CA',NULL,NULL,NULL),
(870,NULL,'microsoft-project-2024-professional-pc','jason.adams57@icloud.com','Jason Adams',4,'Really good price and prompt delivery. Working great so far.',1,'published','f13f776e83e5783909b13ee59b5d9dae','2026-04-01 08:50:46','2026-04-01 08:50:46','US',NULL,NULL,NULL),
(871,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','joseph.taylor47@hotmail.com','Joseph Taylor',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','6007e69a9380efff87fc6df2000ff9e5','2026-03-31 08:18:24','2026-03-31 08:18:24','GB',NULL,NULL,NULL),
(872,NULL,'microsoft-office-home-and-business-2019-mac','gary.patel16@gmail.com','Gary Patel',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','dd2f6dbb689c432acb2a2a41248a1102','2026-03-31 12:03:08','2026-03-31 12:03:08','US',NULL,NULL,NULL),
(873,NULL,'microsoft-office-home-2024-mac','larry.nguyen79@yahoo.com','Larry Nguyen',5,'Great value. The download links they sent were official and safe.',1,'published','acf662534c7698bf33fef046f45edd95','2026-03-31 07:45:02','2026-03-31 07:45:02','CA',NULL,NULL,NULL),
(874,NULL,'microsoft-office-2021-home-business-mac','betty.rivera27@yahoo.com','Betty Rivera',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','9d9b99823edd441f35538342a91ddc25','2026-03-31 17:48:22','2026-03-31 17:48:22','AU',NULL,NULL,NULL),
(875,NULL,'microsoft-office-2021-home-student-mac','justin.perez75@outlook.com','Justin Perez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','4eb333fb7914a030dc1aafc88bb3638b','2026-03-30 15:39:23','2026-03-30 15:39:23','AU',NULL,NULL,NULL),
(876,NULL,'microsoft-excel-2021-windows','thomas.white52@icloud.com','Thomas White',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','46b6dcb511f704253c524011f74ac58f','2026-03-30 10:19:15','2026-03-30 10:19:15','EU',NULL,NULL,NULL),
(877,NULL,'microsoft-office-2019-home-business-pc','brian.lopez17@gmail.com','Brian Lopez',5,'Works great on my PC. No issues after several weeks of use.',1,'published','43c09e829ebfa62a5c77af240c985f45','2026-03-30 09:21:23','2026-03-30 09:21:23','EU',NULL,NULL,NULL),
(878,NULL,'ms-visio-professional-2019-pc','elizabeth.carter40@hotmail.com','Elizabeth Carter',4,'Would recommend to anyone looking for a legit key at a good price.',1,'published','57759080d219bc0564673342adb0ceec','2026-03-30 05:27:26','2026-03-30 05:27:26','GB',NULL,NULL,NULL),
(879,NULL,'windows-11-home','rebecca.miller17@outlook.com','Rebecca Miller',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','558748c82cb1172ff0434102e27c7f76','2026-03-29 06:39:49','2026-03-29 06:39:49','GB',NULL,NULL,NULL),
(880,NULL,'microsoft-office-2024-professional-plus-windows','olga.martin46@gmail.com','Olga Martin',4,'Solid experience overall. The key worked and support was helpful.',1,'published','128bbef918c1bf762f28c06f78041308','2026-03-29 10:18:05','2026-03-29 10:18:05','GB',NULL,NULL,NULL),
(881,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','gary.adams24@outlook.com','Gary Adams',3,'Legit key at a fraction of the retail price. Great experience.',1,'published','913134c4d8e474664d12f41f5a836568','2026-03-29 13:19:24','2026-03-29 13:19:24','US','2026-09-16 19:26:36',NULL,NULL),
(882,NULL,'microsoft-office-2024-professional-plus-windows','wei.carter52@outlook.com','Wei Carter',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','89e59e4e0c6a8089d25da2e19355e6c4','2026-03-29 07:16:14','2026-03-29 07:16:14','GB',NULL,NULL,NULL),
(883,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','timothy.taylor53@gmail.com','Timothy Taylor',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','41a2a84aa155a054b28e59d738d240ce','2026-03-29 13:08:19','2026-03-29 13:08:19','GB',NULL,NULL,NULL),
(884,NULL,'microsoft-visio-2021-professional-windows-pc','christopher.hall66@yahoo.com','Christopher Hall',2,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','d7daa60cbd1be7ea616fde2e3917066a','2026-03-28 08:30:24','2026-03-28 08:30:24','US','2026-09-16 19:26:36',NULL,NULL),
(885,NULL,'microsoft-visio-2024-professional-windows-pc','olga.mitchell36@yahoo.com','Olga Mitchell',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','5086894829b312d8942b7aa283efdc40','2026-03-28 14:00:51','2026-03-28 14:00:51','US',NULL,NULL,NULL),
(886,NULL,'microsoft-office-home-business-2024-pc','margaret.taylor40@hotmail.com','Margaret Taylor',5,'Delivered on time and it works perfectly. Five stars.',1,'published','f1c12ee61cbce24c6f641f8d144233e9','2026-03-28 14:05:28','2026-03-28 14:05:28','US',NULL,NULL,NULL),
(887,NULL,'microsoft-visio-2024-professional-windows-pc','wei.harris44@yahoo.com','Wei Harris',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','c48225b6efe63bc474486dd86ac0fd03','2026-03-28 13:41:44','2026-03-28 13:41:44','US',NULL,NULL,NULL),
(888,NULL,'microsoft-office-2021-home-student-windows','lisa.taylor32@gmail.com','Lisa Taylor',5,'The email with my key and instructions came through in minutes.',1,'published','9f2f37e0c287041e63d5920b6c21a4e3','2026-03-28 04:11:47','2026-03-28 04:11:47','US',NULL,NULL,NULL),
(889,NULL,'microsoft-office-2021-home-student-mac','stephen.scott33@icloud.com','Stephen Scott',4,'The step-by-step activation instructions were really helpful.',1,'published','151133b4101ab0bc03d2ab698c025de4','2026-03-27 06:57:09','2026-03-27 06:57:09','CA',NULL,NULL,NULL),
(890,NULL,'windows-11-home','deborah.rodriguez48@yahoo.com','Deborah Rodriguez',4,'The email with my key and instructions came through in minutes.',1,'published','a13a6e6b75a755a8a8c80e38e13a3e4f','2026-03-27 07:36:39','2026-03-27 07:36:39','US',NULL,NULL,NULL),
(891,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','wei.davis35@gmail.com','Wei Davis',4,'Saved over half the retail price and the license is completely genuine.',1,'published','7b54f42ab9b891e0e51c6e132c30bb79','2026-03-27 16:27:31','2026-03-27 16:27:31','US',NULL,NULL,NULL),
(892,NULL,'microsoft-office-2024-professional-plus-windows','larry.baker47@gmail.com','Larry Baker',5,'Quick delivery and a legit license. Happy customer here.',1,'published','091674a6fa7d2805ea7ddae76ba70039','2026-03-27 08:09:45','2026-03-27 08:09:45','US',NULL,NULL,NULL),
(893,NULL,'ms-project-professional-2019-pc','justin.scott58@outlook.com','Justin Scott',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','2e33ed9dfce3b239144333464bd86cad','2026-03-27 05:45:18','2026-03-27 05:45:18','US',NULL,NULL,NULL),
(894,NULL,'microsoft-office-2024-professional-plus-windows','maria.martin25@outlook.com','Maria Martin',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','b29f1bad173e47c37bb33251bef5192c','2026-03-26 05:01:21','2026-03-26 05:01:21','US',NULL,NULL,NULL),
(895,NULL,'microsoft-project-professional-2021-pc','paul.moore57@hotmail.com','Paul Moore',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','3a708a95f0ffdd94242f7908b268ac2c','2026-03-26 09:27:20','2026-03-26 09:27:20','US',NULL,NULL,NULL),
(896,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','susan.walker88@yahoo.com','Susan Walker',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','8679656713b601e0d2efa9f87eeecf88','2026-03-26 17:53:30','2026-03-26 17:53:30','US',NULL,NULL,NULL),
(897,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','jessica.carter19@yahoo.com','Jessica Carter',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','30a40cead0e7c434795ee01cb2307ba6','2026-03-26 08:49:11','2026-03-26 08:49:11','GB',NULL,NULL,NULL),
(898,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','patricia.lee90@hotmail.com','Patricia Lee',5,'The step-by-step activation instructions were really helpful.',1,'published','a576db138994c727d48135322a0d9017','2026-03-26 10:56:47','2026-03-26 10:56:47','US',NULL,NULL,NULL),
(899,NULL,'windows-10-home','thomas.patel92@gmail.com','Thomas Patel',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','5c15a2dc76c0e3be5759d5b285f3cdff','2026-03-26 05:20:29','2026-03-26 05:20:29','US',NULL,NULL,NULL),
(900,NULL,'microsoft-office-home-2024-pc','john.torres61@gmail.com','John Torres',5,'Good product for the money. Everything was quick and easy.',1,'published','d322fde665d916c142bcf925a89f8097','2026-03-26 07:29:27','2026-03-26 07:29:27','CA',NULL,NULL,NULL),
(901,NULL,'microsoft-office-2021-professional-plus-windows','nicole.lee13@hotmail.com','Nicole Lee',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','c61e5ee87706edf417889eef731d1d8e','2026-03-25 06:31:03','2026-03-25 06:31:03','EU',NULL,NULL,NULL),
(902,NULL,'microsoft-project-professional-2021-pc','robert.sanchez26@outlook.com','Robert Sanchez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','7967e453932b01d4e50073888a40bf53','2026-03-25 15:32:11','2026-03-25 15:32:11','AU',NULL,NULL,NULL),
(903,NULL,'microsoft-office-home-and-student-2019-mac','susan.white95@hotmail.com','Susan White',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','d38f7a90ac3a7ec81fc716f08a09e2ec','2026-03-25 10:04:40','2026-03-25 10:04:40','GB',NULL,NULL,NULL),
(904,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','timothy.baker41@yahoo.com','Timothy Baker',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','6a460d0aa2d5f8fcc68b440aae911987','2026-03-25 15:04:30','2026-03-25 15:04:30','US',NULL,NULL,NULL),
(905,NULL,'microsoft-office-2021-home-business-mac','brian.rodriguez50@gmail.com','Brian Rodriguez',3,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','07e0ff9985c4fd47e632928823949653','2026-03-24 16:45:12','2026-03-24 16:45:12','US','2026-09-16 19:26:36',NULL,NULL),
(906,NULL,'windows-10-pro','cynthia.martin97@outlook.com','Cynthia Martin',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','480377d9842532a8b8e56c20c124d3ff','2026-03-24 12:30:35','2026-03-24 12:30:35','US',NULL,NULL,NULL),
(907,NULL,'ms-visio-professional-2019-pc','hiroshi.nguyen47@hotmail.com','Hiroshi Nguyen',5,'Great value. The download links they sent were official and safe.',1,'published','ef3dc194ce9a82a15261c3f190cb5ee8','2026-03-24 16:36:42','2026-03-24 16:36:42','GB',NULL,NULL,NULL),
(908,NULL,'microsoft-visio-2021-professional-windows-pc','ashley.rodriguez44@outlook.com','Ashley Rodriguez',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','923c1210b9d068bfaaea0d1ab0a64672','2026-03-24 10:27:03','2026-03-24 10:27:03','US',NULL,NULL,NULL),
(909,NULL,'microsoft-office-2024-professional-plus-windows','kimberly.hall60@gmail.com','Kimberly Hall',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','ceb6ff8916b45bc51246fb73857a449f','2026-03-23 07:46:51','2026-03-23 07:46:51','GB',NULL,NULL,NULL),
(910,NULL,'microsoft-office-home-2024-pc','eric.lewis75@icloud.com','Eric Lewis',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','6d684f5308ff3d21b1b7aa0c33e74b7b','2026-03-23 16:43:59','2026-03-23 16:43:59','US',NULL,NULL,NULL),
(911,NULL,'microsoft-office-2019-professional-plus-windows','john.thomas48@hotmail.com','John Thomas',4,'Activated without a hitch. Great communication throughout.',1,'published','db950fd0e25924d0d24b2737b35b2d87','2026-03-23 15:07:06','2026-03-23 15:07:06','US',NULL,NULL,NULL),
(912,NULL,'bitdefender-small-office-security-5-devices-1-year','samantha.brown94@gmail.com','Samantha Brown',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','6422c44e2b91f2dcc4a3e7434f9930d0','2026-03-22 05:29:54','2026-03-22 05:29:54','US',NULL,NULL,NULL),
(913,NULL,'microsoft-office-2021-professional-plus-windows','david.campbell12@yahoo.com','David Campbell',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','afaa9f7064b51dd93fc8e1a7352be2db','2026-03-22 12:50:51','2026-03-22 12:50:51','EU',NULL,NULL,NULL),
(914,NULL,'microsoft-project-2024-professional-pc','patricia.moore52@yahoo.com','Patricia Moore',5,'Quick delivery and a legit license. Happy customer here.',1,'published','ee5e34a433322c8f6bd3d5048fe276d1','2026-03-22 17:37:02','2026-03-22 17:37:02','US',NULL,NULL,NULL),
(915,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','ashley.walker82@outlook.com','Ashley Walker',5,'Customer service was responsive and the product key was genuine.',1,'published','96222a5502d32168dd1ffb3124e361c9','2026-03-22 13:35:47','2026-03-22 13:35:47','GB',NULL,NULL,NULL),
(916,NULL,'microsoft-excel-2021-windows','george.williams45@gmail.com','George Williams',5,'Solid experience overall. The key worked and support was helpful.',1,'published','e7fba757b38696ae0e43f763bcb13b20','2026-03-22 06:27:11','2026-03-22 06:27:11','CA',NULL,NULL,NULL),
(917,NULL,'microsoft-office-2021-professional-plus-windows','eric.green68@outlook.com','Eric Green',5,'Great value. The download links they sent were official and safe.',1,'published','ee506d6cb963ab056c3bf18021d6a7ce','2026-03-22 13:30:02','2026-03-22 13:30:02','GB',NULL,NULL,NULL),
(918,NULL,'microsoft-visio-2024-professional-windows-pc','emily.rodriguez35@outlook.com','Emily Rodriguez',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','f112306e43cddc15e41ff398c577265b','2026-03-22 07:29:15','2026-03-22 07:29:15','US',NULL,NULL,NULL),
(919,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','sarah.hernandez50@icloud.com','Sarah Hernandez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','bef0442f2597a45175c6d1212cf693f0','2026-03-21 06:25:01','2026-03-21 06:25:01','US',NULL,NULL,NULL),
(920,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','donald.jones78@hotmail.com','Donald Jones',4,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','0c73098f3b7525a09cdd253f03a77794','2026-03-21 15:52:24','2026-03-21 15:52:24','CA',NULL,NULL,NULL),
(921,NULL,'microsoft-project-2024-professional-pc','stephen.lewis29@gmail.com','Stephen Lewis',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','4f4b2f4a24de1b5a2a38adeedbe9b5bb','2026-03-21 10:24:17','2026-03-21 10:24:17','US',NULL,NULL,NULL),
(922,NULL,'microsoft-office-2021-home-student-mac','sandra.campbell13@gmail.com','Sandra Campbell',3,'Everything went smoothly from purchase to activation. Recommended.',1,'published','6819a0292fb5f82d07a631a568911a21','2026-03-20 11:21:51','2026-03-20 11:21:51','GB','2026-09-16 19:26:36',NULL,NULL),
(923,NULL,'microsoft-excel-2021-windows','rebecca.wilson89@yahoo.com','Rebecca Wilson',5,'The step-by-step activation instructions were really helpful.',1,'published','762f8f6bbae9b96d9efa6f783ce7a67d','2026-03-20 06:04:48','2026-03-20 06:04:48','AU',NULL,NULL,NULL),
(924,NULL,'microsoft-office-2021-home-business-mac','matthew.rivera41@outlook.com','Matthew Rivera',3,'Great value. The download links they sent were official and safe.',1,'published','51c028cf5bfdf780bddf23af02c49a5a','2026-03-20 04:46:39','2026-03-20 04:46:39','EU','2026-09-16 19:26:36',NULL,NULL),
(925,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','ronald.harris51@outlook.com','Ronald Harris',5,'Quick delivery and a legit license. Happy customer here.',1,'published','80e551f0be94536a1bb08fc1c0f0162c','2026-03-20 11:36:43','2026-03-20 11:36:43','CA',NULL,NULL,NULL),
(926,NULL,'microsoft-office-2019-professional-plus-windows','anthony.nguyen14@gmail.com','Anthony Nguyen',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','4eb1f93e0575f60580903bae7792ea91','2026-03-20 10:42:41','2026-03-20 10:42:41','US',NULL,NULL,NULL),
(927,NULL,'microsoft-office-home-2024-pc','nicole.hill50@hotmail.com','Nicole Hill',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','fd5507a1d8e7391b8e432cc0c2afae05','2026-03-20 09:34:16','2026-03-20 09:34:16','CA',NULL,NULL,NULL),
(928,NULL,'microsoft-office-2021-home-student-windows','jason.king76@icloud.com','Jason King',5,'Superb service. The whole process took less than five minutes.',1,'published','277d14c2d74d517dc5c81c0962027a56','2026-03-20 04:52:29','2026-03-20 04:52:29','EU',NULL,NULL,NULL),
(929,NULL,'microsoft-office-home-2024-pc','hiroshi.jones35@gmail.com','Hiroshi Jones',5,'The activation guide was clear and I was up and running fast.',1,'published','999ce6307bac5059239f61f6558ab2fb','2026-03-19 15:36:49','2026-03-19 15:36:49','GB',NULL,NULL,NULL),
(930,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','anthony.thompson52@hotmail.com','Anthony Thompson',3,'Works great on my PC. No issues after several weeks of use.',1,'published','70775641034b7e793381964f44f710fb','2026-03-19 07:04:40','2026-03-19 07:04:40','US','2026-09-16 19:26:36',NULL,NULL),
(931,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','pamela.thomas15@icloud.com','Pamela Thomas',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','b7fc5c8297e8c14e88bd04aa267e489b','2026-03-19 10:39:32','2026-03-19 10:39:32','GB',NULL,NULL,NULL),
(932,NULL,'windows-11-pro','george.adams59@icloud.com','George Adams',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','ffbf40581206b4580a32d2f5e5070752','2026-03-19 09:11:34','2026-03-19 09:11:34','US',NULL,NULL,NULL),
(933,NULL,'microsoft-office-home-2024-pc','paul.harris27@gmail.com','Paul Harris',4,'Ordered late at night and still got the key within minutes.',1,'published','5191e77cdd11d925ae1b908cffb4b944','2026-03-18 11:08:05','2026-03-18 11:08:05','CA',NULL,NULL,NULL),
(934,NULL,'microsoft-office-home-2024-mac','justin.williams87@icloud.com','Justin Williams',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','430769904f10981ba7f31719567af5e5','2026-03-18 12:25:35','2026-03-18 12:25:35','US',NULL,NULL,NULL),
(935,NULL,'microsoft-office-home-and-business-2019-mac','ahmed.jones36@outlook.com','Ahmed Jones',4,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','04d1aaae98d2cab2d4b6295bcc4abb2a','2026-03-18 17:06:49','2026-03-18 17:06:49','EU',NULL,NULL,NULL),
(936,NULL,'microsoft-office-2021-home-student-mac','kenneth.baker36@gmail.com','Kenneth Baker',5,'Superb service. The whole process took less than five minutes.',1,'published','8ee092b8480499270839697149fa6f04','2026-03-18 07:37:28','2026-03-18 07:37:28','GB',NULL,NULL,NULL),
(937,NULL,'windows-11-home','amy.rivera90@outlook.com','Amy Rivera',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','3fabd6d99c65dd81ebeb99c46ef0d3b2','2026-03-18 14:42:14','2026-03-18 14:42:14','US',NULL,NULL,NULL),
(938,NULL,'microsoft-office-2021-professional-plus-windows','joseph.hall98@hotmail.com','Joseph Hall',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','072684d736dfe631921faea3e016dfc0','2026-03-18 09:36:48','2026-03-18 09:36:48','US',NULL,NULL,NULL),
(939,NULL,'microsoft-visio-2021-professional-windows-pc','betty.young67@outlook.com','Betty Young',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','0ef9ef7b44e852d68e1388c282ac0c51','2026-03-18 06:25:04','2026-03-18 06:25:04','CA',NULL,NULL,NULL),
(940,NULL,'windows-11-pro','richard.wilson82@outlook.com','Richard Wilson',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','4cf7018c7f94f83f0550366fdcefeb61','2026-03-17 04:29:40','2026-03-17 04:29:40','CA',NULL,NULL,NULL),
(941,NULL,'windows-11-home','wei.robinson56@icloud.com','Wei Robinson',4,'Saved over half the retail price and the license is completely genuine.',1,'published','830bb511479a1ba140e2f1d3f77edad5','2026-03-17 14:19:19','2026-03-17 14:19:19','US',NULL,NULL,NULL),
(942,NULL,'microsoft-office-home-and-student-2019-mac','juan.patel88@gmail.com','Juan Patel',4,'Quick delivery and a legit license. Happy customer here.',1,'published','2a23658a5497ed6e08248cb59cf01734','2026-03-17 08:26:27','2026-03-17 08:26:27','US',NULL,NULL,NULL),
(943,NULL,'microsoft-office-2021-home-student-windows','michelle.ramirez61@gmail.com','Michelle Ramirez',2,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','48852217f26e8c29481f40937ce4278d','2026-03-17 16:53:55','2026-03-17 16:53:55','US','2026-09-16 19:26:36',NULL,NULL),
(944,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','lisa.scott77@hotmail.com','Lisa Scott',5,'The email with my key and instructions came through in minutes.',1,'published','f65e11e5f2d7c1e0aeb051e7842c2551','2026-03-17 13:41:03','2026-03-17 13:41:03','US',NULL,NULL,NULL),
(945,NULL,'microsoft-excel-2021-windows','mary.harris11@icloud.com','Mary Harris',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','1f0376c9b5616a545ce11951500ac3b7','2026-03-17 04:38:35','2026-03-17 04:38:35','GB',NULL,NULL,NULL),
(946,NULL,'microsoft-office-2019-home-business-pc','juan.hill15@yahoo.com','Juan Hill',5,'Saved over half the retail price and the license is completely genuine.',1,'published','926b3217b140ad7540b022036e7f1de6','2026-03-16 04:29:24','2026-03-16 04:29:24','US',NULL,NULL,NULL),
(947,NULL,'windows-10-pro','paul.lewis55@hotmail.com','Paul Lewis',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','3f53ae6d3f80dc05d75f6d338ddbcfd2','2026-03-16 10:52:40','2026-03-16 10:52:40','CA',NULL,NULL,NULL),
(948,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','patricia.perez69@gmail.com','Patricia Perez',4,'Quick, easy, and it just works. No complaints at all.',1,'published','43d8991eec2b7a0de6094954b8ab37a6','2026-03-16 05:59:00','2026-03-16 05:59:00','US',NULL,NULL,NULL),
(949,NULL,'microsoft-office-home-2024-mac','betty.mitchell62@outlook.com','Betty Mitchell',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','52918d9bf119c09851bf887452c8bc6e','2026-03-16 16:16:51','2026-03-16 16:16:51','CA',NULL,NULL,NULL),
(950,NULL,'microsoft-office-2024-professional-plus-windows','edward.adams20@yahoo.com','Edward Adams',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','2bd7f0420ab24a62bc7e59f638b6e196','2026-03-16 15:01:27','2026-03-16 15:01:27','CA',NULL,NULL,NULL),
(951,NULL,'windows-10-home','stephanie.wright22@icloud.com','Stephanie Wright',5,'Activated without a hitch. Great communication throughout.',1,'published','278d35567c2d48f2c403ca3e7bb76606','2026-03-16 17:11:14','2026-03-16 17:11:14','US',NULL,NULL,NULL),
(952,NULL,'microsoft-office-2024-professional-plus-windows','timothy.hernandez21@hotmail.com','Timothy Hernandez',4,'Saved over half the retail price and the license is completely genuine.',1,'published','ece49043209e4a56120fcd55527f07c1','2026-03-15 09:57:47','2026-03-15 09:57:47','US',NULL,NULL,NULL),
(953,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','barbara.davis37@hotmail.com','Barbara Davis',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','6331fbca8885c8ccab1feccd471dfcb3','2026-03-15 14:59:58','2026-03-15 14:59:58','GB',NULL,NULL,NULL),
(954,NULL,'microsoft-visio-2024-professional-windows-pc','laura.smith15@gmail.com','Laura Smith',3,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','12d8bb51e45bd2b32bb9a78eb4ba5791','2026-03-15 08:03:30','2026-03-15 08:03:30','GB','2026-09-16 19:26:36',NULL,NULL),
(955,NULL,'microsoft-word-2021-windows','elizabeth.thomas50@gmail.com','Elizabeth Thomas',5,'Delivered on time and it works perfectly. Five stars.',1,'published','d05892945e7d1ed501a2604a86be9a53','2026-03-15 17:49:37','2026-03-15 17:49:37','US',NULL,NULL,NULL),
(956,NULL,'microsoft-office-home-2024-mac','angela.gonzalez14@outlook.com','Angela Gonzalez',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','479b0137b2a6da00cbf1908dbc70d689','2026-03-15 05:44:33','2026-03-15 05:44:33','EU',NULL,NULL,NULL),
(957,NULL,'microsoft-office-2021-home-student-windows','pamela.thompson47@icloud.com','Pamela Thompson',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','432b34d17e71713ea8c3890455ea521f','2026-03-15 16:04:53','2026-03-15 16:04:53','US',NULL,NULL,NULL),
(958,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','charles.mitchell15@outlook.com','Charles Mitchell',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','23af7f477e27c87de65c27425bb3db33','2026-03-14 16:38:03','2026-03-14 16:38:03','CA',NULL,NULL,NULL),
(959,NULL,'windows-10-home','richard.thomas32@gmail.com','Richard Thomas',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','dc7b93001d9e1a7aad0b8a2f1623c83c','2026-03-14 10:50:16','2026-03-14 10:50:16','EU',NULL,NULL,NULL),
(960,NULL,'microsoft-office-home-business-2024-mac','mary.taylor89@icloud.com','Mary Taylor',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','170812f140661849d099577f4d54897d','2026-03-14 11:13:26','2026-03-14 11:13:26','AU',NULL,NULL,NULL),
(961,NULL,'microsoft-office-home-business-2024-pc','jessica.garcia53@outlook.com','Jessica Garcia',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','05b758e3f8c6446853cd087f57aaebf4','2026-03-14 09:41:08','2026-03-14 09:41:08','AU',NULL,NULL,NULL),
(962,NULL,'ms-project-professional-2019-pc','jessica.thompson85@gmail.com','Jessica Thompson',5,'Quick delivery and a legit license. Happy customer here.',1,'published','6c1d684bfe1cbe6b6ff4c015f2e32d45','2026-03-14 13:25:11','2026-03-14 13:25:11','CA',NULL,NULL,NULL),
(963,NULL,'microsoft-office-2021-home-business-mac','paul.williams87@outlook.com','Paul Williams',5,'Much cheaper than the official store and it activated without any issues.',1,'published','ce551efd3482bf937bb3d2fd46bff3d1','2026-03-14 08:13:17','2026-03-14 08:13:17','CA',NULL,NULL,NULL),
(964,NULL,'ms-visio-professional-2019-pc','donald.lopez41@outlook.com','Donald Lopez',3,'Works great on my PC. No issues after several weeks of use.',1,'published','22b464b20cc6fdd1bddb18d8f5441763','2026-03-13 13:06:25','2026-03-13 13:06:25','CA','2026-09-16 19:26:36',NULL,NULL),
(965,NULL,'microsoft-office-2024-professional-plus-windows','wei.martinez66@yahoo.com','Wei Martinez',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','e6dd69bce69398013344016bf1803d37','2026-03-13 08:10:55','2026-03-13 08:10:55','US',NULL,NULL,NULL),
(966,NULL,'microsoft-visio-2021-professional-windows-pc','rebecca.patel74@gmail.com','Rebecca Patel',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','8509a3b591ca5373bff57ac92939ed31','2026-03-13 14:11:58','2026-03-13 14:11:58','AU',NULL,NULL,NULL),
(967,NULL,'windows-10-pro','raj.hill80@yahoo.com','Raj Hill',5,'Quick delivery and a legit license. Happy customer here.',1,'published','f254513f86ff25d3bc89dd04b62dc86e','2026-03-13 11:23:35','2026-03-13 11:23:35','GB',NULL,NULL,NULL),
(968,NULL,'microsoft-office-home-2024-mac','linda.thompson36@icloud.com','Linda Thompson',3,'Legit key at a fraction of the retail price. Great experience.',1,'published','64c73a90e59d278a514d43637ff1bfd2','2026-03-12 04:25:26','2026-03-12 04:25:26','CA','2026-09-16 19:26:36',NULL,NULL),
(969,NULL,'microsoft-office-2021-home-business-mac','ahmed.king44@outlook.com','Ahmed King',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','03b9dac28b7e9f157f42365e48a2498f','2026-03-12 06:17:23','2026-03-12 06:17:23','CA',NULL,NULL,NULL),
(970,NULL,'microsoft-word-2021-windows','edward.mitchell31@hotmail.com','Edward Mitchell',5,'Ordered late at night and still got the key within minutes.',1,'published','5aa88f47ed1f23cca418baa245ea15dc','2026-03-12 16:22:33','2026-03-12 16:22:33','US',NULL,NULL,NULL),
(971,NULL,'microsoft-word-2021-windows','sarah.garcia89@yahoo.com','Sarah Garcia',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','8311b273aacd9107943fcaad24ebcd02','2026-03-12 07:00:13','2026-03-12 07:00:13','GB',NULL,NULL,NULL),
(972,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','john.lopez96@hotmail.com','John Lopez',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','1536c3d10d1afb2c186a652867b5e05f','2026-03-12 04:53:20','2026-03-12 04:53:20','EU',NULL,NULL,NULL),
(973,NULL,'ms-project-professional-2019-pc','melissa.jackson40@gmail.com','Melissa Jackson',3,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','9bfc64617f060d0dcab79840b69dfefb','2026-03-12 06:37:48','2026-03-12 06:37:48','EU','2026-09-16 19:26:36',NULL,NULL),
(974,NULL,'microsoft-office-home-2024-mac','james.walker48@hotmail.com','James Walker',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','c0193043c3bd2e372e2c902e53522744','2026-03-12 06:02:59','2026-03-12 06:02:59','US',NULL,NULL,NULL),
(975,NULL,'microsoft-office-home-business-2024-mac','andrew.king71@icloud.com','Andrew King',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','30e97c6edd0994fb01f0fdda21b2bf8d','2026-03-11 15:18:47','2026-03-11 15:18:47','CA',NULL,NULL,NULL),
(976,NULL,'microsoft-office-home-2024-mac','stephen.lopez52@icloud.com','Stephen Lopez',3,'Quick, easy, and it just works. No complaints at all.',1,'published','be31e3c1550e05359cb36519899b55a2','2026-03-11 09:03:04','2026-03-11 09:03:04','EU','2026-09-16 19:26:36',NULL,NULL),
(977,NULL,'ms-project-professional-2019-pc','justin.smith56@outlook.com','Justin Smith',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','dc0a79dad39fa181eaf75c14c29aa865','2026-03-11 05:53:22','2026-03-11 05:53:22','AU',NULL,NULL,NULL),
(978,NULL,'windows-11-home','christopher.rodriguez56@icloud.com','Christopher Rodriguez',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','41de46c8f4c3d1626ab663c131e4acab','2026-03-10 06:37:59','2026-03-10 06:37:59','CA',NULL,NULL,NULL),
(979,NULL,'microsoft-project-2024-professional-pc','emily.walker65@icloud.com','Emily Walker',4,'Quick delivery and a legit license. Happy customer here.',1,'published','a0307987647cdefbf59cd9a859e6f267','2026-03-10 05:55:04','2026-03-10 05:55:04','GB',NULL,NULL,NULL),
(980,NULL,'microsoft-office-2019-home-business-pc','joshua.brown45@gmail.com','Joshua Brown',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','8df662abbce8f65df648190f4c397746','2026-03-10 16:05:12','2026-03-10 16:05:12','GB',NULL,NULL,NULL),
(981,NULL,'microsoft-office-home-and-student-2019-mac','nicole.gonzalez55@yahoo.com','Nicole Gonzalez',5,'Saved over half the retail price and the license is completely genuine.',1,'published','88688376aaa751ced10fe64ca083136d','2026-03-10 08:49:43','2026-03-10 08:49:43','US',NULL,NULL,NULL),
(982,NULL,'microsoft-word-2021-windows','ronald.jackson55@icloud.com','Ronald Jackson',4,'Solid experience overall. The key worked and support was helpful.',1,'published','f1a0ee61a5a555068a4b9f7d094b0e7e','2026-03-10 09:41:52','2026-03-10 09:41:52','US',NULL,NULL,NULL),
(983,NULL,'microsoft-office-home-and-student-2019-mac','carlos.baker41@hotmail.com','Carlos Baker',5,'Activated without a hitch. Great communication throughout.',1,'published','be2a98dd1c6bf29fb8611c79b677858c','2026-03-09 13:45:52','2026-03-09 13:45:52','US',NULL,NULL,NULL),
(984,NULL,'windows-10-home','maria.taylor11@yahoo.com','Maria Taylor',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','f2dd944aed8e56edb7def07f617a2737','2026-03-09 09:38:10','2026-03-09 09:38:10','US',NULL,NULL,NULL),
(985,NULL,'microsoft-office-home-2024-pc','charles.lee21@outlook.com','Charles Lee',4,'Really good price and prompt delivery. Working great so far.',1,'published','8c6012535a9205986e96b9336b4d5d6e','2026-03-09 10:24:00','2026-03-09 10:24:00','GB',NULL,NULL,NULL),
(986,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','samantha.scott74@outlook.com','Samantha Scott',2,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','764c6ed0ac480cff590f417324953a72','2026-03-08 09:02:54','2026-03-08 09:02:54','US','2026-09-16 19:26:36',NULL,NULL),
(987,NULL,'microsoft-word-2021-windows','kimberly.flores47@hotmail.com','Kimberly Flores',3,'Much cheaper than the official store and it activated without any issues.',1,'published','a012c29ac75ae265dad079d547c11ca7','2026-03-08 17:25:13','2026-03-08 17:25:13','AU','2026-09-16 19:26:36',NULL,NULL),
(988,NULL,'microsoft-word-2021-windows','sarah.green95@gmail.com','Sarah Green',4,'No issues whatsoever. Key came fast and activated first time.',1,'published','d4d5997a8d267d8b80f4ae9e7caffcd2','2026-03-08 13:40:18','2026-03-08 13:40:18','GB',NULL,NULL,NULL),
(989,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','nancy.jackson94@icloud.com','Nancy Jackson',4,'Much cheaper than the official store and it activated without any issues.',1,'published','af757eda9474a56c09f3946189beab75','2026-03-08 13:38:52','2026-03-08 13:38:52','US',NULL,NULL,NULL),
(990,NULL,'microsoft-office-home-2024-mac','nicole.williams77@hotmail.com','Nicole Williams',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','e40d63292cb36aedaef905b35c946013','2026-03-08 11:33:23','2026-03-08 11:33:23','US',NULL,NULL,NULL),
(991,NULL,'microsoft-office-2021-home-business-mac','kathleen.garcia45@icloud.com','Kathleen Garcia',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','5f3ea988fcebb26f14a702c81ca80a1f','2026-03-07 07:18:31','2026-03-07 07:18:31','EU',NULL,NULL,NULL),
(992,NULL,'microsoft-office-home-2024-mac','joseph.miller20@gmail.com','Joseph Miller',5,'Ordered late at night and still got the key within minutes.',1,'published','83c9080f5c15f893488cd09b39408d24','2026-03-07 07:35:29','2026-03-07 07:35:29','US',NULL,NULL,NULL),
(993,NULL,'microsoft-office-2019-professional-plus-windows','mary.thompson67@icloud.com','Mary Thompson',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','7394bb2850f3669af8c3e8307e2f3fc4','2026-03-07 07:00:40','2026-03-07 07:00:40','GB',NULL,NULL,NULL),
(994,NULL,'microsoft-office-2024-professional-plus-windows','wei.thompson92@icloud.com','Wei Thompson',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','d5c3e5c360e7c61e892e27f735162797','2026-03-07 03:55:11','2026-03-07 03:55:11','GB',NULL,NULL,NULL),
(995,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','larry.anderson97@outlook.com','Larry Anderson',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','337df12181994c7ac5295e612ffa1f3c','2026-03-07 08:50:34','2026-03-07 08:50:34','US',NULL,NULL,NULL),
(996,NULL,'microsoft-office-home-business-2024-mac','anthony.flores29@yahoo.com','Anthony Flores',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','dd36b8e45989bc534fc976146d1d662d','2026-03-07 15:40:25','2026-03-07 15:40:25','US',NULL,NULL,NULL),
(997,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','michelle.hall64@icloud.com','Michelle Hall',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','9618957a8554f0da67ebeb7d4afcdddd','2026-03-07 05:37:58','2026-03-07 05:37:58','CA',NULL,NULL,NULL),
(998,NULL,'microsoft-office-2021-home-student-windows','james.wright26@gmail.com','James Wright',5,'Quick delivery and a legit license. Happy customer here.',1,'published','a6efc0fbb19cb4868b533779b85dbeb4','2026-03-06 15:58:26','2026-03-06 15:58:26','US',NULL,NULL,NULL),
(999,NULL,'ms-visio-professional-2019-pc','thomas.miller27@outlook.com','Thomas Miller',4,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','5af5b4d2159b936949acc8b7a1f2a774','2026-03-06 09:29:17','2026-03-06 09:29:17','US',NULL,NULL,NULL),
(1000,NULL,'microsoft-office-2021-professional-plus-windows','raj.robinson94@outlook.com','Raj Robinson',3,'Excellent service. The activation guide made setup really easy.',1,'published','aceb3e3b06c51226269be36dacc12ca2','2026-03-06 05:38:36','2026-03-06 05:38:36','US','2026-09-16 19:26:36',NULL,NULL),
(1001,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','michelle.taylor42@outlook.com','Michelle Taylor',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','9b92503caa630a6c39ce1a652443780f','2026-03-06 10:47:09','2026-03-06 10:47:09','GB',NULL,NULL,NULL),
(1002,NULL,'microsoft-office-2024-professional-plus-windows','george.martin22@outlook.com','George Martin',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','a357a743427df3269a93b6306f498bf3','2026-03-06 14:57:55','2026-03-06 14:57:55','US',NULL,NULL,NULL),
(1003,NULL,'microsoft-office-home-business-2024-pc','cynthia.nelson78@hotmail.com','Cynthia Nelson',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','4fdb38e0a076a928778b473132d6233f','2026-03-06 07:27:01','2026-03-06 07:27:01','US',NULL,NULL,NULL),
(1004,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','ryan.smith62@outlook.com','Ryan Smith',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','528090fde7fb52ea54c476924369d9aa','2026-03-06 16:59:04','2026-03-06 16:59:04','EU',NULL,NULL,NULL),
(1005,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','sandra.thompson55@outlook.com','Sandra Thompson',4,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','208d27db511e66b5d407c37484ec1365','2026-03-05 09:16:26','2026-03-05 09:16:26','CA',NULL,NULL,NULL),
(1006,NULL,'ms-visio-professional-2019-pc','james.white40@gmail.com','James White',5,'The email with my key and instructions came through in minutes.',1,'published','48b80788f621e433a7f198b354dcd2c5','2026-03-05 03:24:46','2026-03-05 03:24:46','US',NULL,NULL,NULL),
(1007,NULL,'microsoft-office-home-2024-mac','william.clark75@gmail.com','William Clark',5,'Works great on my PC. No issues after several weeks of use.',1,'published','460cb839a13d5a9573413877f23a1dc5','2026-03-05 06:25:13','2026-03-05 06:25:13','GB',NULL,NULL,NULL),
(1008,NULL,'microsoft-office-home-and-business-2019-mac','jeffrey.walker12@icloud.com','Jeffrey Walker',5,'Activation was painless and the key was valid immediately.',1,'published','ae9d8864bea68fb255e6aeb7c4a009fa','2026-03-05 03:34:14','2026-03-05 03:34:14','US',NULL,NULL,NULL),
(1009,NULL,'microsoft-project-professional-2021-pc','robert.hill76@hotmail.com','Robert Hill',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','a3835a4618606c32417d507448ecac1f','2026-03-04 04:25:16','2026-03-04 04:25:16','AU',NULL,NULL,NULL),
(1010,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','anthony.mitchell20@outlook.com','Anthony Mitchell',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','a7abffa5d31674839c5b7103c5e607cc','2026-03-04 08:37:17','2026-03-04 08:37:17','US',NULL,NULL,NULL),
(1011,NULL,'microsoft-word-2021-windows','susan.lewis31@gmail.com','Susan Lewis',5,'The email with my key and instructions came through in minutes.',1,'published','1bc114e0aeee2191fb643cf476969ecb','2026-03-04 14:58:36','2026-03-04 14:58:36','US',NULL,NULL,NULL),
(1012,NULL,'microsoft-office-home-business-2024-pc','john.taylor69@gmail.com','John Taylor',5,'The activation guide was clear and I was up and running fast.',1,'published','6f9fde7c8ee6721143308cf3b75285a7','2026-03-04 16:32:30','2026-03-04 16:32:30','US',NULL,NULL,NULL),
(1013,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','cynthia.white49@gmail.com','Cynthia White',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','61bf596caacbf04dab1669048be7d233','2026-03-04 16:28:22','2026-03-04 16:28:22','EU',NULL,NULL,NULL),
(1014,NULL,'microsoft-visio-2024-professional-windows-pc','george.lopez58@outlook.com','George Lopez',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','aa9ffd36df0eb881b30835a2cb14f347','2026-03-04 04:22:29','2026-03-04 04:22:29','CA',NULL,NULL,NULL),
(1015,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','thomas.walker71@hotmail.com','Thomas Walker',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','4a047047e22d574743c3c75e96d67216','2026-03-03 06:24:14','2026-03-03 06:24:14','US',NULL,NULL,NULL),
(1016,NULL,'microsoft-office-2019-home-business-pc','carlos.thompson86@icloud.com','Carlos Thompson',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','8147af0816611db179aadeecbd7546a8','2026-03-03 07:29:29','2026-03-03 07:29:29','US',NULL,NULL,NULL),
(1017,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','carlos.nguyen97@icloud.com','Carlos Nguyen',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','c93f0f7288a948a8b399c514c910d6fb','2026-03-03 04:00:30','2026-03-03 04:00:30','US',NULL,NULL,NULL),
(1018,NULL,'microsoft-office-home-and-student-2019-mac','laura.scott15@gmail.com','Laura Scott',5,'Customer service was responsive and the product key was genuine.',1,'published','d83d9e4fe7f5780da6694c29376691f3','2026-03-03 04:40:50','2026-03-03 04:40:50','EU',NULL,NULL,NULL),
(1019,NULL,'microsoft-office-2019-home-student-windows','carlos.green58@hotmail.com','Carlos Green',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','4a8c16a18b73ba969f94e27b64c66db6','2026-03-02 12:42:46','2026-03-02 12:42:46','US',NULL,NULL,NULL),
(1020,NULL,'microsoft-word-2021-windows','james.young25@outlook.com','James Young',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','f7d2b80605b029cbe1cf8a7c3feab967','2026-03-02 05:39:35','2026-03-02 05:39:35','GB',NULL,NULL,NULL),
(1021,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','sofia.patel60@hotmail.com','Sofia Patel',5,'The activation guide was clear and I was up and running fast.',1,'published','78f04d3f33c2b97e1ad3e0c3e0f7686b','2026-03-02 07:25:31','2026-03-02 07:25:31','CA',NULL,NULL,NULL),
(1022,NULL,'ms-project-professional-2019-pc','angela.nguyen17@hotmail.com','Angela Nguyen',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','20c10210d7d05cc4c4d6d7d97a4d9ce8','2026-03-02 03:01:11','2026-03-02 03:01:11','GB',NULL,NULL,NULL),
(1023,NULL,'microsoft-office-home-business-2024-pc','paul.hill15@outlook.com','Paul Hill',5,'Quick delivery and a legit license. Happy customer here.',1,'published','2f2f76653a50aaae2a0d1ae1cf715719','2026-03-02 09:33:44','2026-03-02 09:33:44','US',NULL,NULL,NULL),
(1024,NULL,'microsoft-visio-2021-professional-windows-pc','andrew.wright68@hotmail.com','Andrew Wright',5,'The activation guide was clear and I was up and running fast.',1,'published','c40340385b2fd2c28371723c82e5b058','2026-03-01 08:54:07','2026-03-01 08:54:07','AU',NULL,NULL,NULL),
(1025,NULL,'microsoft-word-2021-windows','steven.moore88@yahoo.com','Steven Moore',5,'Really good price and prompt delivery. Working great so far.',1,'published','10673eec01d3b5f32cc9304c03f88604','2026-03-01 09:29:13','2026-03-01 09:29:13','US',NULL,NULL,NULL),
(1026,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','justin.wright82@hotmail.com','Justin Wright',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','c5aeb9fc1893259ccf0156d0a87aa169','2026-03-01 08:22:22','2026-03-01 08:22:22','US',NULL,NULL,NULL),
(1027,NULL,'microsoft-excel-2021-windows','ronald.carter55@gmail.com','Ronald Carter',2,'Activated without a hitch. Great communication throughout.',1,'published','fdc6fed72c737b3a5355eb4a05e49360','2026-03-01 10:18:26','2026-03-01 10:18:26','US','2026-09-16 19:26:36',NULL,NULL),
(1028,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','margaret.jones23@gmail.com','Margaret Jones',5,'Ordered late at night and still got the key within minutes.',1,'published','26bd6238da71102724d96a873a99b279','2026-03-01 04:28:40','2026-03-01 04:28:40','CA',NULL,NULL,NULL),
(1029,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','richard.rodriguez35@hotmail.com','Richard Rodriguez',4,'Was up and running the same hour I ordered. Very impressed.',1,'published','db4f036af1c21f0a7232b59f0f2b8ac4','2026-02-28 10:09:24','2026-02-28 10:09:24','US',NULL,NULL,NULL),
(1030,NULL,'microsoft-office-2019-home-student-windows','andrew.flores80@yahoo.com','Andrew Flores',4,'The email with my key and instructions came through in minutes.',1,'published','3a208155c5d4d5cb21a23c2361c7916e','2026-02-28 12:34:37','2026-02-28 12:34:37','US',NULL,NULL,NULL),
(1031,NULL,'windows-11-pro','angela.campbell69@hotmail.com','Angela Campbell',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','d6e148c3f44bc74f3f9c2154e858444e','2026-02-28 15:10:02','2026-02-28 15:10:02','EU',NULL,NULL,NULL),
(1032,NULL,'bitdefender-small-office-security-5-devices-1-year','linda.johnson67@hotmail.com','Linda Johnson',5,'Quick delivery and a legit license. Happy customer here.',1,'published','463b6f1736bf0a4e0ec7b6501d123bd5','2026-02-27 12:50:39','2026-02-27 12:50:39','EU',NULL,NULL,NULL),
(1033,NULL,'microsoft-office-2021-home-business-windows','richard.lee19@outlook.com','Richard Lee',4,'No issues whatsoever. Key came fast and activated first time.',1,'published','b5c2ae761320071072c5e0ffc3b7919a','2026-02-27 05:25:49','2026-02-27 05:25:49','US',NULL,NULL,NULL),
(1034,NULL,'microsoft-visio-2021-professional-windows-pc','gary.lee48@outlook.com','Gary Lee',5,'Excellent service. The activation guide made setup really easy.',1,'published','aca3ca50df2a53d983c2baa0cc066985','2026-02-27 14:06:41','2026-02-27 14:06:41','GB',NULL,NULL,NULL),
(1035,NULL,'microsoft-excel-2021-windows','carlos.ramirez35@outlook.com','Carlos Ramirez',5,'Activation was painless and the key was valid immediately.',1,'published','dd098d48ecc038d22ca8db49ee53d4d6','2026-02-27 08:23:52','2026-02-27 08:23:52','GB',NULL,NULL,NULL),
(1036,NULL,'microsoft-office-2019-home-business-pc','david.young72@icloud.com','David Young',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','be9d92e368aea960970b5b8c87b69eab','2026-02-27 05:35:34','2026-02-27 05:35:34','US',NULL,NULL,NULL),
(1037,NULL,'microsoft-excel-2021-windows','mary.clark75@gmail.com','Mary Clark',4,'Works great on my PC. No issues after several weeks of use.',1,'published','731c668d1f9126927e312b769b0629bd','2026-02-26 16:47:14','2026-02-26 16:47:14','CA',NULL,NULL,NULL),
(1038,NULL,'microsoft-office-2024-professional-plus-windows','david.wilson73@outlook.com','David Wilson',5,'Activation was painless and the key was valid immediately.',1,'published','472498c349d9040ff13f64cbe7abfc23','2026-02-26 07:02:57','2026-02-26 07:02:57','US',NULL,NULL,NULL),
(1039,NULL,'microsoft-project-2024-professional-pc','kimberly.garcia46@icloud.com','Kimberly Garcia',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','7c428ba061f3e68984b41453413c2565','2026-02-26 11:41:27','2026-02-26 11:41:27','EU',NULL,NULL,NULL),
(1040,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','sarah.rodriguez59@icloud.com','Sarah Rodriguez',5,'Customer service was responsive and the product key was genuine.',1,'published','e6df70b62483828c982cc5479f7b7f82','2026-02-26 14:56:00','2026-02-26 14:56:00','AU',NULL,NULL,NULL),
(1041,NULL,'microsoft-office-home-business-2024-mac','stephanie.sanchez92@gmail.com','Stephanie Sanchez',5,'Activated without a hitch. Great communication throughout.',1,'published','28decd4345b1b4ebcdf1693b71fa81b5','2026-02-26 05:42:46','2026-02-26 05:42:46','EU',NULL,NULL,NULL),
(1042,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','eric.scott72@icloud.com','Eric Scott',5,'The activation guide was clear and I was up and running fast.',1,'published','41b872f6b6acdb1824daec862b74e41a','2026-02-26 06:25:42','2026-02-26 06:25:42','US',NULL,NULL,NULL),
(1043,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kenneth.green30@icloud.com','Kenneth Green',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','1b5ece356916e3dafe0c729dcff57e80','2026-02-25 11:01:25','2026-02-25 11:01:25','US',NULL,NULL,NULL),
(1044,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','james.flores35@outlook.com','James Flores',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','ec3cc6dc5316cd4581fcb043c51302b1','2026-02-25 03:55:46','2026-02-25 03:55:46','GB',NULL,NULL,NULL),
(1045,NULL,'windows-10-pro','george.miller96@outlook.com','George Miller',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','da5c2a2e472a162e5ebd008ab4f1345b','2026-02-25 07:14:18','2026-02-25 07:14:18','CA',NULL,NULL,NULL),
(1046,NULL,'microsoft-office-2021-home-business-windows','andrew.ramirez41@icloud.com','Andrew Ramirez',5,'Activated without a hitch. Great communication throughout.',1,'published','d8c0f395928ba3ec7d9317c36b9e4fb9','2026-02-25 09:14:02','2026-02-25 09:14:02','CA',NULL,NULL,NULL),
(1047,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','anthony.adams95@hotmail.com','Anthony Adams',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','b686fff19d5aab801db4050f895f4a32','2026-02-25 05:17:42','2026-02-25 05:17:42','EU',NULL,NULL,NULL),
(1048,NULL,'windows-10-home','priya.clark21@gmail.com','Priya Clark',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','e100a9f26c38143003038a4f99cdc137','2026-02-24 12:28:45','2026-02-24 12:28:45','AU',NULL,NULL,NULL),
(1049,NULL,'microsoft-project-professional-2021-pc','mark.harris84@icloud.com','Mark Harris',5,'Quick delivery and a legit license. Happy customer here.',1,'published','d3cd01e0b64f5b346a6dbaf9b0e758b2','2026-02-24 05:31:17','2026-02-24 05:31:17','US',NULL,NULL,NULL),
(1050,NULL,'microsoft-excel-2021-windows','charles.carter63@hotmail.com','Charles Carter',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','dba2fd65fe906cad07150cf17e28d386','2026-02-24 14:57:17','2026-02-24 14:57:17','CA',NULL,NULL,NULL),
(1051,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','kevin.taylor59@gmail.com','Kevin Taylor',2,'Good product for the money. Everything was quick and easy.',1,'published','f12732f6b4bebb3773d16cf1af0955bc','2026-02-24 07:24:28','2026-02-24 07:24:28','CA','2026-09-16 19:26:36',NULL,NULL),
(1052,NULL,'microsoft-project-2024-professional-pc','deborah.mitchell66@yahoo.com','Deborah Mitchell',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','00a22f688545542e08b795318e57b0d1','2026-02-24 05:22:20','2026-02-24 05:22:20','GB',NULL,NULL,NULL),
(1053,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','olga.campbell19@outlook.com','Olga Campbell',5,'Product key arrived quickly and worked on my new PC right away.',1,'published','0da7b224dd81c5b8434eedf9ae985096','2026-02-24 14:32:19','2026-02-24 14:32:19','GB',NULL,NULL,NULL),
(1054,NULL,'microsoft-project-professional-2021-pc','thomas.king77@hotmail.com','Thomas King',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','e38e91c3a993d6ea60652eabe34da6e2','2026-02-24 11:01:15','2026-02-24 11:01:15','AU',NULL,NULL,NULL),
(1055,NULL,'bitdefender-small-office-security-5-devices-1-year','rebecca.baker75@outlook.com','Rebecca Baker',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','2e24691706e60fe41361126aa696b819','2026-02-23 10:06:40','2026-02-23 10:06:40','US',NULL,NULL,NULL),
(1056,NULL,'microsoft-office-2021-home-student-mac','david.adams53@yahoo.com','David Adams',4,'Activated without a hitch. Great communication throughout.',1,'published','551c44dce9e783e0c4a1397c88a2403c','2026-02-23 03:05:09','2026-02-23 03:05:09','CA',NULL,NULL,NULL),
(1057,NULL,'microsoft-office-home-and-business-2019-mac','juan.baker53@yahoo.com','Juan Baker',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','a8435e1092c80eed1f2d484890617813','2026-02-23 12:31:55','2026-02-23 12:31:55','US',NULL,NULL,NULL),
(1058,NULL,'windows-11-home','richard.taylor79@gmail.com','Richard Taylor',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','d1ce954b71181082267362d5d2f1dc66','2026-02-23 04:00:57','2026-02-23 04:00:57','US',NULL,NULL,NULL),
(1059,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','anna.sanchez44@yahoo.com','Anna Sanchez',4,'Good product for the money. Everything was quick and easy.',1,'published','154c763bd316c4bd70228db290dd4be9','2026-02-22 12:22:20','2026-02-22 12:22:20','US',NULL,NULL,NULL),
(1060,NULL,'microsoft-project-professional-2021-pc','eric.brown76@gmail.com','Eric Brown',3,'Activated without a hitch. Great communication throughout.',1,'published','672d0d8b422c96d73906a6aa18fc49bf','2026-02-22 03:43:48','2026-02-22 03:43:48','US','2026-09-16 19:26:36',NULL,NULL),
(1061,NULL,'microsoft-office-home-2024-pc','william.garcia15@gmail.com','William Garcia',5,'Superb service. The whole process took less than five minutes.',1,'published','349e4f923c5bc83018d034cc08c0db49','2026-02-22 07:12:04','2026-02-22 07:12:04','GB',NULL,NULL,NULL),
(1062,NULL,'microsoft-office-home-2024-mac','carlos.hernandez86@gmail.com','Carlos Hernandez',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','971c5e8ed7b46dcd0931ab6997422669','2026-02-21 10:03:57','2026-02-21 10:03:57','US',NULL,NULL,NULL),
(1063,NULL,'microsoft-project-professional-2021-pc','timothy.flores82@yahoo.com','Timothy Flores',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','4ff69740b7c2e271ab5c6fb53752fe39','2026-02-21 08:21:47','2026-02-21 08:21:47','US',NULL,NULL,NULL),
(1064,NULL,'microsoft-office-2024-professional-plus-windows','larry.allen32@gmail.com','Larry Allen',5,'The email with my key and instructions came through in minutes.',1,'published','0a0e2669e9264b2ed25d9959e9a47f9a','2026-02-21 11:11:32','2026-02-21 11:11:32','CA',NULL,NULL,NULL),
(1065,NULL,'microsoft-office-2021-home-business-windows','raj.rodriguez70@outlook.com','Raj Rodriguez',3,'Second time ordering from this store. Reliable every time.',1,'published','7c34cbb6d52823f9a14fb4e43b997d64','2026-02-21 08:03:12','2026-02-21 08:03:12','US','2026-09-16 19:26:36',NULL,NULL),
(1066,NULL,'microsoft-office-2021-home-student-mac','matthew.king35@yahoo.com','Matthew King',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','aa983ef9dc903950d91a6b509ce13999','2026-02-21 15:28:52','2026-02-21 15:28:52','US',NULL,NULL,NULL),
(1067,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','paul.hernandez12@outlook.com','Paul Hernandez',3,'Customer service was responsive and the product key was genuine.',1,'published','89c848add5f4e6d5be85b3516d4e8b5f','2026-02-21 06:45:49','2026-02-21 06:45:49','US','2026-09-16 19:26:36',NULL,NULL),
(1068,NULL,'microsoft-office-home-business-2024-pc','kevin.davis43@icloud.com','Kevin Davis',3,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','a26cf6ac2e56b31f21faf45e31a9b86b','2026-02-21 05:34:21','2026-02-21 05:34:21','GB','2026-09-16 19:26:36',NULL,NULL),
(1069,NULL,'microsoft-office-2021-home-business-mac','michael.rivera78@yahoo.com','Michael Rivera',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','94d4df5e6a26534de23a7c44fd336eaa','2026-02-20 10:19:23','2026-02-20 10:19:23','US',NULL,NULL,NULL),
(1070,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','daniel.moore99@hotmail.com','Daniel Moore',4,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','3d1d849fb84f0c04d19d0cc389e1a286','2026-02-20 11:55:56','2026-02-20 11:55:56','US',NULL,NULL,NULL),
(1071,NULL,'ms-project-professional-2019-pc','amy.allen15@outlook.com','Amy Allen',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','4172a93323f3a3c3031f4952a4398f07','2026-02-20 14:13:01','2026-02-20 14:13:01','US',NULL,NULL,NULL),
(1072,NULL,'windows-11-home','daniel.jackson79@yahoo.com','Daniel Jackson',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','7f16341180e9141645df49fa55a24efd','2026-02-20 07:42:39','2026-02-20 07:42:39','US',NULL,NULL,NULL),
(1073,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','angela.baker33@gmail.com','Angela Baker',5,'Second time ordering from this store. Reliable every time.',1,'published','d536fc9a4a8c5517713853901392eb3d','2026-02-20 16:23:55','2026-02-20 16:23:55','CA',NULL,NULL,NULL),
(1074,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','linda.perez45@gmail.com','Linda Perez',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','d2ee2ddabd60c910d32d89000ae0c845','2026-02-19 07:29:51','2026-02-19 07:29:51','US',NULL,NULL,NULL),
(1075,NULL,'microsoft-office-2021-home-business-windows','george.campbell48@icloud.com','George Campbell',3,'Saved over half the retail price and the license is completely genuine.',1,'published','7a378216dde99ba1fee73debebde86fa','2026-02-19 13:22:20','2026-02-19 13:22:20','CA','2026-09-16 19:26:36',NULL,NULL),
(1076,NULL,'microsoft-office-2019-professional-plus-windows','laura.martinez44@hotmail.com','Laura Martinez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','303eed239be051901e3f79cfd4df9dcb','2026-02-19 04:12:29','2026-02-19 04:12:29','CA',NULL,NULL,NULL),
(1077,NULL,'microsoft-office-2021-home-business-mac','betty.martinez86@outlook.com','Betty Martinez',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','5ffe73cd0cb959cf42a1d051aa9788ff','2026-02-19 06:41:24','2026-02-19 06:41:24','US',NULL,NULL,NULL),
(1078,NULL,'microsoft-office-2021-home-business-windows','daniel.martin73@outlook.com','Daniel Martin',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','9da376eacf9b32d11e095bf43d056ab8','2026-02-19 03:45:09','2026-02-19 03:45:09','US',NULL,NULL,NULL),
(1079,NULL,'microsoft-office-2019-home-business-pc','edward.hernandez75@hotmail.com','Edward Hernandez',5,'Second time ordering from this store. Reliable every time.',1,'published','d41f15c15626082aa48fc3108f3fc533','2026-02-19 16:19:57','2026-02-19 16:19:57','GB',NULL,NULL,NULL),
(1080,NULL,'microsoft-office-home-business-2024-mac','eric.allen61@icloud.com','Eric Allen',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','abf042a5e07c02cbce7f8d167a46838a','2026-02-19 13:35:37','2026-02-19 13:35:37','CA',NULL,NULL,NULL),
(1081,NULL,'microsoft-office-2019-home-business-pc','william.brown94@outlook.com','William Brown',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','437abb95ff42e944333104b53b613d4f','2026-02-18 16:26:40','2026-02-18 16:26:40','US',NULL,NULL,NULL),
(1082,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','ashley.lopez12@icloud.com','Ashley Lopez',5,'Quick delivery and a legit license. Happy customer here.',1,'published','3b8072d531fb6b8dd2108f07b6342982','2026-02-18 04:39:54','2026-02-18 04:39:54','US',NULL,NULL,NULL),
(1083,NULL,'microsoft-office-home-2024-pc','margaret.green34@gmail.com','Margaret Green',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','e8804827830931dc519fb97192d9ddcb','2026-02-18 08:59:44','2026-02-18 08:59:44','US',NULL,NULL,NULL),
(1084,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','nicole.green68@icloud.com','Nicole Green',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','83a18a799c2429531384dd12ba12c332','2026-02-18 06:17:50','2026-02-18 06:17:50','CA',NULL,NULL,NULL),
(1085,NULL,'bitdefender-small-office-security-5-devices-1-year','kimberly.green59@icloud.com','Kimberly Green',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','34aa2163f52dce0b84d153c0fd1fb6f7','2026-02-18 10:35:06','2026-02-18 10:35:06','GB',NULL,NULL,NULL),
(1086,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','james.robinson33@gmail.com','James Robinson',5,'Really good price and prompt delivery. Working great so far.',1,'published','3d8072f998c8cc37d8b618900989431f','2026-02-18 11:54:43','2026-02-18 11:54:43','US',NULL,NULL,NULL),
(1087,NULL,'microsoft-project-professional-2021-pc','ashley.king93@outlook.com','Ashley King',4,'Superb service. The whole process took less than five minutes.',1,'published','eed664c6418d9723e0a439ff1490b34a','2026-02-18 16:52:16','2026-02-18 16:52:16','US',NULL,NULL,NULL),
(1088,NULL,'microsoft-visio-2021-professional-windows-pc','kathleen.jackson40@hotmail.com','Kathleen Jackson',4,'Quick delivery and a legit license. Happy customer here.',1,'published','9b3febe7505dea745655f4d47124de97','2026-02-17 06:01:15','2026-02-17 06:01:15','EU',NULL,NULL,NULL),
(1089,NULL,'microsoft-office-home-and-student-2019-mac','justin.harris29@hotmail.com','Justin Harris',5,'Great value. The download links they sent were official and safe.',1,'published','ba11fc99c0e2b8950053842953971e2d','2026-02-17 14:57:00','2026-02-17 14:57:00','GB',NULL,NULL,NULL),
(1090,NULL,'microsoft-office-2021-home-business-windows','sarah.lee64@yahoo.com','Sarah Lee',5,'Superb service. The whole process took less than five minutes.',1,'published','53f7a7b8e2020f1c27ea4a94235afe80','2026-02-17 07:03:25','2026-02-17 07:03:25','AU',NULL,NULL,NULL),
(1091,NULL,'microsoft-excel-2021-windows','lisa.perez59@gmail.com','Lisa Perez',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','36532c20680b70f3a5ef8344d2e06925','2026-02-17 14:54:23','2026-02-17 14:54:23','EU',NULL,NULL,NULL),
(1092,NULL,'ms-project-professional-2019-pc','samantha.martinez25@gmail.com','Samantha Martinez',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','c7820683b6d27cb24f46b3a5c808a392','2026-02-17 12:08:04','2026-02-17 12:08:04','US',NULL,NULL,NULL),
(1093,NULL,'ms-project-professional-2019-pc','kenneth.perez53@hotmail.com','Kenneth Perez',5,'Activation was painless and the key was valid immediately.',1,'published','093741aef162cf44ea1e6dfaa955e04b','2026-02-17 15:43:50','2026-02-17 15:43:50','GB',NULL,NULL,NULL),
(1094,NULL,'windows-10-pro','margaret.thompson21@yahoo.com','Margaret Thompson',4,'Great value. The download links they sent were official and safe.',1,'published','aba49684837e04f86c4f893f753a8162','2026-02-16 13:20:31','2026-02-16 13:20:31','CA',NULL,NULL,NULL),
(1095,NULL,'microsoft-office-2021-home-business-mac','carlos.gonzalez13@hotmail.com','Carlos Gonzalez',4,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','eb12982eb7e46202fdba19fbc83ac202','2026-02-16 06:35:10','2026-02-16 06:35:10','CA',NULL,NULL,NULL),
(1096,NULL,'ms-project-professional-2019-pc','nicole.davis45@outlook.com','Nicole Davis',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','ece87a8c6bbdc7a867a93e231e0c7d33','2026-02-16 03:59:53','2026-02-16 03:59:53','GB',NULL,NULL,NULL),
(1097,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','margaret.flores43@icloud.com','Margaret Flores',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','3718ffb43c93b1c5b18006f539ec43dc','2026-02-15 03:47:50','2026-02-15 03:47:50','US',NULL,NULL,NULL),
(1098,NULL,'microsoft-word-2021-windows','priya.anderson91@outlook.com','Priya Anderson',4,'Genuine key, best price I found online. Will buy from here again.',1,'published','1a0060f83871d50cd488392263cf3b32','2026-02-15 16:14:03','2026-02-15 16:14:03','US',NULL,NULL,NULL),
(1099,NULL,'microsoft-visio-2024-professional-windows-pc','karen.sanchez84@yahoo.com','Karen Sanchez',4,'The email with my key and instructions came through in minutes.',1,'published','255ed2bde8fb13f6c42c96db81e04a39','2026-02-15 06:33:08','2026-02-15 06:33:08','US',NULL,NULL,NULL),
(1100,NULL,'microsoft-office-home-2024-pc','christopher.martinez20@gmail.com','Christopher Martinez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','a1f4628e04406bdb73efa7727a8b58a9','2026-02-15 04:44:45','2026-02-15 04:44:45','EU',NULL,NULL,NULL),
(1101,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','michelle.johnson37@icloud.com','Michelle Johnson',3,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','b63dbdd25feaa0d7ebd2dbc6c3cd809a','2026-02-15 06:14:45','2026-02-15 06:14:45','CA','2026-09-16 19:26:36',NULL,NULL),
(1102,NULL,'microsoft-office-home-and-business-2019-mac','steven.torres18@hotmail.com','Steven Torres',4,'Quick, easy, and it just works. No complaints at all.',1,'published','b0e645543c8dbd0c8d9618b307264203','2026-02-15 16:35:40','2026-02-15 16:35:40','US',NULL,NULL,NULL),
(1103,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','john.rodriguez56@gmail.com','John Rodriguez',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','4db972b6fd0b2bb5b9540425c2a9151f','2026-02-14 15:27:04','2026-02-14 15:27:04','US',NULL,NULL,NULL),
(1104,NULL,'microsoft-office-home-and-student-2019-mac','john.campbell94@hotmail.com','John Campbell',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','9aa41fc3c257b7f944085f69e9fc10d3','2026-02-14 11:46:18','2026-02-14 11:46:18','US',NULL,NULL,NULL),
(1105,NULL,'ms-project-professional-2019-pc','pamela.scott14@icloud.com','Pamela Scott',5,'The step-by-step activation instructions were really helpful.',1,'published','3f05828f4323b4d516e8ce581bbde57b','2026-02-14 06:26:04','2026-02-14 06:26:04','US',NULL,NULL,NULL),
(1106,NULL,'microsoft-office-2021-home-student-mac','karen.torres16@hotmail.com','Karen Torres',5,'The email with my key and instructions came through in minutes.',1,'published','e3a6e9278a7abeedf02aa12e53f06010','2026-02-14 12:27:28','2026-02-14 12:27:28','AU',NULL,NULL,NULL),
(1107,NULL,'microsoft-office-2021-home-student-windows','cynthia.garcia99@gmail.com','Cynthia Garcia',5,'The step-by-step activation instructions were really helpful.',1,'published','61fd5c4a0f83e57342fccc1805b616c4','2026-02-13 08:17:46','2026-02-13 08:17:46','GB',NULL,NULL,NULL),
(1108,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','priya.hall69@gmail.com','Priya Hall',3,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','eb2a5993a007ccdec4448d4d9785ef4f','2026-02-13 07:01:18','2026-02-13 07:01:18','GB','2026-09-16 19:26:36',NULL,NULL),
(1109,NULL,'bitdefender-small-office-security-5-devices-1-year','susan.thompson55@outlook.com','Susan Thompson',4,'Was up and running the same hour I ordered. Very impressed.',1,'published','32018b1d345fed1d5aaf87f397bbf716','2026-02-13 08:15:52','2026-02-13 08:15:52','US',NULL,NULL,NULL),
(1110,NULL,'windows-10-pro','ronald.walker72@icloud.com','Ronald Walker',5,'Delivered on time and it works perfectly. Five stars.',1,'published','fef0318bc88aa9be26c8f469b8b74332','2026-02-12 13:36:55','2026-02-12 13:36:55','US',NULL,NULL,NULL),
(1111,NULL,'microsoft-office-2019-home-business-pc','raj.anderson79@hotmail.com','Raj Anderson',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','ff775d0e3e79c041ced6c37891509e2b','2026-02-12 08:57:38','2026-02-12 08:57:38','GB',NULL,NULL,NULL),
(1112,NULL,'windows-11-home','barbara.adams21@icloud.com','Barbara Adams',5,'The email with my key and instructions came through in minutes.',1,'published','4317366b12a5d7b667a4f2d740452bf1','2026-02-12 15:27:09','2026-02-12 15:27:09','EU',NULL,NULL,NULL),
(1113,NULL,'windows-10-pro','andrew.harris69@outlook.com','Andrew Harris',5,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','391c7b9ffd6fd6623dc9d4f66afb5863','2026-02-12 13:07:58','2026-02-12 13:07:58','CA',NULL,NULL,NULL),
(1114,NULL,'ms-project-professional-2019-pc','charles.scott13@outlook.com','Charles Scott',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','6f84ef868a2d3e3736e01f2fa237982c','2026-02-12 13:10:55','2026-02-12 13:10:55','CA',NULL,NULL,NULL),
(1115,NULL,'microsoft-office-2021-home-business-windows','nicole.nguyen33@yahoo.com','Nicole Nguyen',4,'No issues whatsoever. Key came fast and activated first time.',1,'published','cf0898777843a0fbe764d5835097efc8','2026-02-11 03:23:40','2026-02-11 03:23:40','GB',NULL,NULL,NULL),
(1116,NULL,'microsoft-office-home-business-2024-pc','jennifer.lopez79@hotmail.com','Jennifer Lopez',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','c7509198e22ea4aed7f41f1471bb7c40','2026-02-11 08:46:44','2026-02-11 08:46:44','US',NULL,NULL,NULL),
(1117,NULL,'microsoft-project-2024-professional-pc','andrew.thomas36@outlook.com','Andrew Thomas',4,'Saved over half the retail price and the license is completely genuine.',1,'published','51cdd18c13c666dc2b32adc91890b9d6','2026-02-11 07:33:18','2026-02-11 07:33:18','US',NULL,NULL,NULL),
(1118,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','joseph.lee68@hotmail.com','Joseph Lee',4,'The activation guide was clear and I was up and running fast.',1,'published','0ed8b7144ceefbebe75d32adaa8e2a5d','2026-02-11 09:30:10','2026-02-11 09:30:10','US',NULL,NULL,NULL),
(1119,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','patricia.jones90@outlook.com','Patricia Jones',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','0b82f1a2036f3d7e236369ab216707f2','2026-02-11 12:14:05','2026-02-11 12:14:05','US',NULL,NULL,NULL),
(1120,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','emily.king34@outlook.com','Emily King',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','69f6066f5ba2250d37ddc6a7f7bd20b9','2026-02-10 11:17:29','2026-02-10 11:17:29','US',NULL,NULL,NULL),
(1121,NULL,'microsoft-office-home-and-student-2019-mac','elizabeth.king37@outlook.com','Elizabeth King',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','0a402a96da6331015b42cf319f19874b','2026-02-10 14:07:52','2026-02-10 14:07:52','CA',NULL,NULL,NULL),
(1122,NULL,'ms-project-professional-2019-pc','rebecca.harris12@outlook.com','Rebecca Harris',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','cf2205f47cb6a37c77f2a6b089509d8c','2026-02-10 13:19:20','2026-02-10 13:19:20','GB',NULL,NULL,NULL),
(1123,NULL,'windows-10-pro','sandra.sanchez97@icloud.com','Sandra Sanchez',5,'Delivered on time and it works perfectly. Five stars.',1,'published','17481ae68804b2beeb60f00c1425e1b9','2026-02-10 05:42:14','2026-02-10 05:42:14','CA',NULL,NULL,NULL),
(1124,NULL,'microsoft-office-home-and-business-2019-mac','christopher.young15@outlook.com','Christopher Young',4,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','929f4a9bd005527883e47bd15a1f50b7','2026-02-10 05:27:00','2026-02-10 05:27:00','EU',NULL,NULL,NULL),
(1125,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','ashley.wright76@icloud.com','Ashley Wright',5,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','bbc904c06d98d6413e1b238c353d14c6','2026-02-10 07:45:20','2026-02-10 07:45:20','US',NULL,NULL,NULL),
(1126,NULL,'windows-11-pro','ahmed.martinez81@icloud.com','Ahmed Martinez',5,'Much cheaper than the official store and it activated without any issues.',1,'published','7e43dd43a867e5f2c3bb228dcbfff1f3','2026-02-09 06:10:03','2026-02-09 06:10:03','US',NULL,NULL,NULL),
(1127,NULL,'microsoft-project-professional-2021-pc','maria.wilson26@yahoo.com','Maria Wilson',5,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','86766d41b2cb74543b2f7900348b736e','2026-02-09 05:12:49','2026-02-09 05:12:49','AU',NULL,NULL,NULL),
(1128,NULL,'microsoft-office-2021-home-student-mac','sarah.taylor86@icloud.com','Sarah Taylor',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','f5ced68767f49981b1554d55728dd282','2026-02-09 06:48:51','2026-02-09 06:48:51','US',NULL,NULL,NULL),
(1129,NULL,'microsoft-office-2021-professional-plus-windows','jennifer.thompson33@gmail.com','Jennifer Thompson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','445abeee278bad44e8a681651cc8ca54','2026-02-09 06:50:10','2026-02-09 06:50:10','EU',NULL,NULL,NULL),
(1130,NULL,'microsoft-office-2019-professional-plus-windows','kathleen.hill54@gmail.com','Kathleen Hill',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','224942f67c51b5e2f0e39d4ad02ca720','2026-02-08 06:26:47','2026-02-08 06:26:47','EU',NULL,NULL,NULL),
(1131,NULL,'microsoft-office-home-business-2024-pc','charles.lopez62@yahoo.com','Charles Lopez',5,'Really good price and prompt delivery. Working great so far.',1,'published','70fa96bc73808883c2f3e8a5de017099','2026-02-08 12:09:01','2026-02-08 12:09:01','US',NULL,NULL,NULL),
(1132,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','eric.smith97@gmail.com','Eric Smith',5,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','ffc8c8a89d8ecd96cbc0556f06f9b743','2026-02-08 09:34:41','2026-02-08 09:34:41','GB',NULL,NULL,NULL),
(1133,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','jeffrey.hall86@icloud.com','Jeffrey Hall',5,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','130504abbf9e58d65ae8a45f2889c818','2026-02-07 15:14:57','2026-02-07 15:14:57','US',NULL,NULL,NULL),
(1134,NULL,'windows-10-pro','joseph.mitchell17@hotmail.com','Joseph Mitchell',4,'Really good price and prompt delivery. Working great so far.',1,'published','72b53d39ce56b74a38e1531825a42e83','2026-02-07 03:52:39','2026-02-07 03:52:39','US',NULL,NULL,NULL),
(1135,NULL,'microsoft-visio-2024-professional-windows-pc','donna.baker77@hotmail.com','Donna Baker',4,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','0885365574ecd61083b0b60e042c3c7d','2026-02-07 15:18:57','2026-02-07 15:18:57','US',NULL,NULL,NULL),
(1136,NULL,'ms-visio-professional-2019-pc','ronald.davis37@outlook.com','Ronald Davis',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','9381d6bb8b9d68533f4e6b7e3b300956','2026-02-07 12:39:47','2026-02-07 12:39:47','US',NULL,NULL,NULL),
(1137,NULL,'microsoft-office-2021-home-student-windows','amy.hernandez50@yahoo.com','Amy Hernandez',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','4f82b1cb97f0a78c3df22c2619628f63','2026-02-07 14:58:47','2026-02-07 14:58:47','CA',NULL,NULL,NULL),
(1138,NULL,'microsoft-office-2021-home-student-windows','jason.wilson94@outlook.com','Jason Wilson',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','902c9701f51c85d396bc2982a9680772','2026-02-07 09:06:42','2026-02-07 09:06:42','US',NULL,NULL,NULL),
(1139,NULL,'microsoft-excel-2021-windows','lisa.thompson64@yahoo.com','Lisa Thompson',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','482d446b58ed788d0059e57b66906b33','2026-02-07 04:20:11','2026-02-07 04:20:11','EU',NULL,NULL,NULL),
(1140,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','laura.king49@hotmail.com','Laura King',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','03bbda1a2336905a3240acda8b764ab5','2026-02-06 11:26:26','2026-02-06 11:26:26','GB',NULL,NULL,NULL),
(1141,NULL,'microsoft-office-home-business-2024-pc','paul.lee14@yahoo.com','Paul Lee',3,'Much cheaper than the official store and it activated without any issues.',1,'published','6f5bf54eae1b0eb09c92b28fdc59b567','2026-02-06 03:33:09','2026-02-06 03:33:09','CA','2026-09-16 19:26:36',NULL,NULL),
(1142,NULL,'microsoft-office-2021-home-business-windows','ryan.williams43@yahoo.com','Ryan Williams',5,'Solid experience overall. The key worked and support was helpful.',1,'published','f6d5af0a1891b88e5d1b2da5288cdb13','2026-02-06 11:30:24','2026-02-06 11:30:24','US',NULL,NULL,NULL),
(1143,NULL,'microsoft-word-2021-windows','sandra.robinson20@outlook.com','Sandra Robinson',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','e6d80cccbfcff34837244f3e613440e4','2026-02-06 03:07:18','2026-02-06 03:07:18','US',NULL,NULL,NULL),
(1144,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','patricia.torres63@yahoo.com','Patricia Torres',3,'Quick, easy, and it just works. No complaints at all.',1,'published','0cf9c717cd0d62e2ac6a94196303d027','2026-02-05 16:42:14','2026-02-05 16:42:14','US','2026-09-16 19:26:36',NULL,NULL),
(1145,NULL,'microsoft-office-2021-home-business-mac','james.davis34@hotmail.com','James Davis',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','4189d4d341631e9803cf8013843714a8','2026-02-05 12:57:13','2026-02-05 12:57:13','AU',NULL,NULL,NULL),
(1146,NULL,'microsoft-office-home-business-2024-pc','sarah.allen49@yahoo.com','Sarah Allen',5,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','435df64a12125d99bd77292ad6acc1c2','2026-02-05 06:47:10','2026-02-05 06:47:10','US',NULL,NULL,NULL),
(1147,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','stephanie.jackson73@icloud.com','Stephanie Jackson',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','6baa50e4eb199f18d6c8fa3562cf8be0','2026-02-05 08:13:40','2026-02-05 08:13:40','EU',NULL,NULL,NULL),
(1148,NULL,'microsoft-office-home-2024-mac','matthew.smith56@gmail.com','Matthew Smith',4,'The activation guide was clear and I was up and running fast.',1,'published','16f12496b585a7ce1e3f66d16d0ff78b','2026-02-05 08:16:58','2026-02-05 08:16:58','US',NULL,NULL,NULL),
(1149,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','ahmed.scott60@icloud.com','Ahmed Scott',2,'Delivered on time and it works perfectly. Five stars.',1,'published','9472a2069e53b79ef88798023665113c','2026-02-04 07:51:13','2026-02-04 07:51:13','CA','2026-09-16 19:26:36',NULL,NULL),
(1150,NULL,'microsoft-word-2021-windows','amanda.baker96@gmail.com','Amanda Baker',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','607edc759f707e8fa67b39a592f94fde','2026-02-04 08:58:21','2026-02-04 08:58:21','CA',NULL,NULL,NULL),
(1151,NULL,'microsoft-project-professional-2021-pc','richard.lewis49@gmail.com','Richard Lewis',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','8656594334f43aa4a02db2f383c7c946','2026-02-04 14:33:24','2026-02-04 14:33:24','US',NULL,NULL,NULL),
(1152,NULL,'microsoft-office-home-business-2024-pc','deborah.patel99@gmail.com','Deborah Patel',2,'Really good price and prompt delivery. Working great so far.',1,'published','08ae1897dc4140fb3573d9a0a9151869','2026-02-03 03:56:47','2026-02-03 03:56:47','CA','2026-09-16 19:26:36',NULL,NULL),
(1153,NULL,'microsoft-office-home-and-student-2019-mac','kevin.hall43@yahoo.com','Kevin Hall',5,'Saved over half the retail price and the license is completely genuine.',1,'published','409aa6e9d50647c82696d4ef9f24df3f','2026-02-03 12:41:43','2026-02-03 12:41:43','AU',NULL,NULL,NULL),
(1154,NULL,'microsoft-project-2024-professional-pc','jason.davis29@yahoo.com','Jason Davis',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','7a19e92f860fb37a8a39b068d8c10b25','2026-02-03 14:24:27','2026-02-03 14:24:27','US',NULL,NULL,NULL),
(1155,NULL,'microsoft-office-2021-home-business-mac','jessica.walker25@outlook.com','Jessica Walker',4,'Worked exactly as described. No subscription, one-time payment. Love it.',1,'published','1d3fcbf4f70a7abf4a080d647aca4a80','2026-02-03 12:37:43','2026-02-03 12:37:43','AU',NULL,NULL,NULL),
(1156,NULL,'windows-11-pro','brian.hernandez97@outlook.com','Brian Hernandez',5,'Good product for the money. Everything was quick and easy.',1,'published','5f3b4c62a4345a044c0cab49f1a9d612','2026-02-02 14:52:37','2026-02-02 14:52:37','GB',NULL,NULL,NULL),
(1157,NULL,'windows-10-home','wei.walker65@icloud.com','Wei Walker',5,'Solid experience overall. The key worked and support was helpful.',1,'published','aaf1e7b5afcd3635b42312c4094c466d','2026-02-02 07:23:39','2026-02-02 07:23:39','US',NULL,NULL,NULL),
(1158,NULL,'windows-11-pro','amy.thompson88@icloud.com','Amy Thompson',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','6b4d202407fc4e1ff1832f4cd0ac78a3','2026-02-02 16:58:15','2026-02-02 16:58:15','US',NULL,NULL,NULL),
(1159,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','priya.martin16@outlook.com','Priya Martin',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','27b7981ac096db7bef17bc574be311a3','2026-02-02 15:06:43','2026-02-02 15:06:43','US',NULL,NULL,NULL),
(1160,NULL,'microsoft-office-home-2024-mac','sofia.rodriguez54@gmail.com','Sofia Rodriguez',5,'Activated without a hitch. Great communication throughout.',1,'published','24198400ad30199601cdf5ac376f2873','2026-02-02 06:16:43','2026-02-02 06:16:43','CA',NULL,NULL,NULL),
(1161,NULL,'microsoft-office-home-business-2024-mac','rebecca.garcia28@yahoo.com','Rebecca Garcia',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','1afeb164bafc81ba9fabaca3ba776d1e','2026-02-02 15:32:07','2026-02-02 15:32:07','US',NULL,NULL,NULL),
(1162,NULL,'windows-11-home','elizabeth.thompson78@hotmail.com','Elizabeth Thompson',4,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','344d7109657f77b1bea5aa046b072e02','2026-02-02 06:18:22','2026-02-02 06:18:22','US',NULL,NULL,NULL),
(1163,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','samantha.hall56@yahoo.com','Samantha Hall',4,'Superb service. The whole process took less than five minutes.',1,'published','5f2985e0758cd1ecc08e727ef32e372d','2026-02-01 03:03:17','2026-02-01 03:03:17','US',NULL,NULL,NULL),
(1164,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','eric.martinez89@outlook.com','Eric Martinez',5,'Support helped me through activation step by step. Really appreciated it.',1,'published','6170b7028f0c090508cd38a8b105504b','2026-02-01 06:18:44','2026-02-01 06:18:44','US',NULL,NULL,NULL),
(1165,NULL,'microsoft-office-home-and-business-2019-mac','jessica.king16@gmail.com','Jessica King',4,'Was up and running the same hour I ordered. Very impressed.',1,'published','adcd1dcad7c40c16aa07686d0594a739','2026-02-01 10:02:59','2026-02-01 10:02:59','AU',NULL,NULL,NULL),
(1166,NULL,'microsoft-office-home-2024-mac','eric.thompson20@hotmail.com','Eric Thompson',5,'Much cheaper than the official store and it activated without any issues.',1,'published','391a73d047e405b65bc8a43f7288aea7','2026-02-01 08:43:30','2026-02-01 08:43:30','US',NULL,NULL,NULL),
(1167,NULL,'bitdefender-small-office-security-5-devices-1-year','michelle.harris38@outlook.com','Michelle Harris',4,'Superb service. The whole process took less than five minutes.',1,'published','accb0d738b10a77111b94abfcb2d4164','2026-02-01 14:36:38','2026-02-01 14:36:38','US',NULL,NULL,NULL),
(1168,NULL,'microsoft-word-2021-windows','william.campbell26@gmail.com','William Campbell',4,'Very straightforward process. Key came fast and worked immediately.',1,'published','5ad3e0f3a544ba1a396b037382d0310e','2026-02-01 06:22:25','2026-02-01 06:22:25','US',NULL,NULL,NULL),
(1169,NULL,'microsoft-office-home-and-student-2019-mac','anthony.thomas75@hotmail.com','Anthony Thomas',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','cf1512cf4f9ace4326154576645d78db','2026-01-31 13:54:11','2026-01-31 13:54:11','US',NULL,NULL,NULL),
(1170,NULL,'microsoft-excel-2021-windows','stephanie.thompson28@icloud.com','Stephanie Thompson',4,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','5f82b567ead6c2f753010dc89885139b','2026-01-31 15:55:03','2026-01-31 15:55:03','EU',NULL,NULL,NULL),
(1171,NULL,'microsoft-office-2024-professional-plus-windows','margaret.lopez23@icloud.com','Margaret Lopez',4,'Solid experience overall. The key worked and support was helpful.',1,'published','05eb2431c376202caf1e449cd4dee58e','2026-01-31 07:20:05','2026-01-31 07:20:05','EU',NULL,NULL,NULL),
(1172,NULL,'windows-10-pro','barbara.thomas63@hotmail.com','Barbara Thomas',5,'The step-by-step activation instructions were really helpful.',1,'published','4dc8265c3c2651622ae05b4967ee18c6','2026-01-31 13:34:42','2026-01-31 13:34:42','US',NULL,NULL,NULL),
(1173,NULL,'microsoft-office-2019-home-business-pc','joseph.campbell74@outlook.com','Joseph Campbell',5,'Really good price and prompt delivery. Working great so far.',1,'published','d8765bf7c798801df2de1d573850a351','2026-01-31 16:29:07','2026-01-31 16:29:07','US',NULL,NULL,NULL),
(1174,NULL,'microsoft-office-2021-home-business-mac','donald.torres96@icloud.com','Donald Torres',4,'The activation guide was clear and I was up and running fast.',1,'published','7822b43a60c253c6898ab560eb350cc8','2026-01-31 10:52:29','2026-01-31 10:52:29','US',NULL,NULL,NULL),
(1175,NULL,'microsoft-excel-2021-windows','sofia.miller71@gmail.com','Sofia Miller',5,'Superb service. The whole process took less than five minutes.',1,'published','25bad82e097703c17ea216633eb751aa','2026-01-30 06:25:28','2026-01-30 06:25:28','AU',NULL,NULL,NULL),
(1176,NULL,'microsoft-office-home-and-business-2019-mac','margaret.perez63@outlook.com','Margaret Perez',4,'The activation guide was clear and I was up and running fast.',1,'published','8ddfafe5bcd5bcfdc5593b5ead4d5fcf','2026-01-30 06:19:26','2026-01-30 06:19:26','US',NULL,NULL,NULL),
(1177,NULL,'microsoft-office-2019-home-business-pc','olga.lee91@gmail.com','Olga Lee',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','caed30d5f4c86abe28b9d12188985378','2026-01-30 09:54:52','2026-01-30 09:54:52','GB',NULL,NULL,NULL),
(1178,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','michael.smith16@yahoo.com','Michael Smith',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','7205a6e580da69befb3221d6d76ed312','2026-01-30 03:36:39','2026-01-30 03:36:39','US',NULL,NULL,NULL),
(1179,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','joseph.hernandez38@hotmail.com','Joseph Hernandez',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','7a87e640f4aee31dff2821b6666ddfb5','2026-01-30 08:17:27','2026-01-30 08:17:27','GB',NULL,NULL,NULL),
(1180,NULL,'windows-10-pro','michelle.moore40@hotmail.com','Michelle Moore',4,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','b3d8753ee0d0cc85b796a5d62ecea6fa','2026-01-29 04:41:34','2026-01-29 04:41:34','GB',NULL,NULL,NULL),
(1181,NULL,'windows-11-pro','stephen.ramirez89@yahoo.com','Stephen Ramirez',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','6a83b80625ece1d54c647b04969c0adc','2026-01-29 05:31:23','2026-01-29 05:31:23','US',NULL,NULL,NULL),
(1182,NULL,'microsoft-project-2024-professional-pc','sharon.white56@yahoo.com','Sharon White',4,'The email with my key and instructions came through in minutes.',1,'published','11c2db45e767a2d378f5c34a120e9954','2026-01-29 05:47:08','2026-01-29 05:47:08','US',NULL,NULL,NULL),
(1183,NULL,'ms-project-professional-2019-pc','jessica.lewis29@yahoo.com','Jessica Lewis',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','12f1c85fc593448c33f117aa2de09438','2026-01-29 10:43:57','2026-01-29 10:43:57','GB',NULL,NULL,NULL),
(1184,NULL,'microsoft-office-2021-professional-plus-windows','kevin.young88@hotmail.com','Kevin Young',5,'Superb service. The whole process took less than five minutes.',1,'published','d67e30a80e29b67934249deb77e19805','2026-01-28 15:53:42','2026-01-28 15:53:42','US',NULL,NULL,NULL),
(1185,NULL,'microsoft-office-2021-home-business-windows','ashley.clark90@yahoo.com','Ashley Clark',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','b4c41445c5f2861af340d4f6caaa307b','2026-01-28 14:13:32','2026-01-28 14:13:32','GB',NULL,NULL,NULL),
(1186,NULL,'microsoft-office-2021-home-business-mac','pamela.taylor74@icloud.com','Pamela Taylor',4,'Second time ordering from this store. Reliable every time.',1,'published','cbc73d67cf7ae18a268174c816053f7c','2026-01-28 10:52:58','2026-01-28 10:52:58','US',NULL,NULL,NULL),
(1187,NULL,'microsoft-visio-2021-professional-windows-pc','rebecca.scott17@yahoo.com','Rebecca Scott',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','8c618a08a6184b80d07f78a8f6eef838','2026-01-28 06:37:31','2026-01-28 06:37:31','GB',NULL,NULL,NULL),
(1188,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','michelle.lewis15@yahoo.com','Michelle Lewis',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','3cd428bd623c7fe61d0209a89a672c0b','2026-01-28 05:11:01','2026-01-28 05:11:01','CA',NULL,NULL,NULL),
(1189,NULL,'microsoft-excel-2021-windows','deborah.sanchez88@outlook.com','Deborah Sanchez',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','82a31fd24fa3d74c0855fa329ab99260','2026-01-28 05:37:04','2026-01-28 05:37:04','GB',NULL,NULL,NULL),
(1190,NULL,'microsoft-office-2024-professional-plus-windows','mark.martinez81@yahoo.com','Mark Martinez',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','94a0454a7d071e641c700650321c31d9','2026-01-27 13:11:35','2026-01-27 13:11:35','GB',NULL,NULL,NULL),
(1191,NULL,'windows-10-home','nicole.torres95@yahoo.com','Nicole Torres',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','7a052e326d06baede6d17bc3a8fcf895','2026-01-27 04:37:29','2026-01-27 04:37:29','US',NULL,NULL,NULL),
(1192,NULL,'microsoft-office-2021-home-business-mac','maria.hill27@yahoo.com','Maria Hill',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','fef03ebcfbadaf7dc0fe39e4bb5e524c','2026-01-27 11:45:14','2026-01-27 11:45:14','US',NULL,NULL,NULL),
(1193,NULL,'microsoft-project-2024-professional-pc','deborah.martin69@yahoo.com','Deborah Martin',4,'I\'ve bought twice now — same fast, reliable service each time.',1,'published','01f2d01e904a287795bfdf1deed913ec','2026-01-27 05:38:45','2026-01-27 05:38:45','US',NULL,NULL,NULL),
(1194,NULL,'microsoft-office-2021-home-business-mac','samantha.rodriguez59@hotmail.com','Samantha Rodriguez',4,'Ordered late at night and still got the key within minutes.',1,'published','bf4680d42aca9299c5b3a1d1d2ebecac','2026-01-27 13:31:06','2026-01-27 13:31:06','US',NULL,NULL,NULL),
(1195,NULL,'microsoft-office-2021-professional-plus-windows','mark.wilson71@gmail.com','Mark Wilson',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','c7f3a56262b72b5909301a4e5d9b97eb','2026-01-27 13:52:50','2026-01-27 13:52:50','EU',NULL,NULL,NULL),
(1196,NULL,'microsoft-office-2019-home-business-pc','edward.clark45@outlook.com','Edward Clark',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','cbac065568c991e33a8bf50d89c9a78d','2026-01-27 06:22:18','2026-01-27 06:22:18','US',NULL,NULL,NULL),
(1197,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','stephanie.hernandez33@yahoo.com','Stephanie Hernandez',5,'Was up and running the same hour I ordered. Very impressed.',1,'published','7b3853e892243356e94dbf64d613e716','2026-01-26 04:54:10','2026-01-26 04:54:10','CA',NULL,NULL,NULL),
(1198,NULL,'microsoft-visio-2021-professional-windows-pc','ronald.martin33@yahoo.com','Ronald Martin',4,'The whole process took less than 20 minutes. Very impressed with the service.',1,'published','fed813e198b6e73a53152f928703cd6f','2026-01-26 13:09:27','2026-01-26 13:09:27','US',NULL,NULL,NULL),
(1199,NULL,'bitdefender-small-office-security-5-devices-1-year','pamela.anderson93@icloud.com','Pamela Anderson',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','1b99447c7be933b66042381c379347a4','2026-01-26 05:28:59','2026-01-26 05:28:59','CA',NULL,NULL,NULL),
(1200,NULL,'microsoft-visio-2021-professional-windows-pc','samantha.garcia82@outlook.com','Samantha Garcia',5,'Second time ordering from this store. Reliable every time.',1,'published','c682bceacdc1b3d69f3aace1ed8768c0','2026-01-26 16:55:33','2026-01-26 16:55:33','US',NULL,NULL,NULL),
(1201,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','linda.harris87@hotmail.com','Linda Harris',5,'Really good price and prompt delivery. Working great so far.',1,'published','f195248c9ff614f79701f98facf8dd07','2026-01-26 10:19:24','2026-01-26 10:19:24','US',NULL,NULL,NULL),
(1202,NULL,'microsoft-word-2021-mac-lifetime-license-no-subscription','jennifer.anderson25@yahoo.com','Jennifer Anderson',5,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','80593c6fd5d0177ee53171c1a9ad559c','2026-01-26 15:13:12','2026-01-26 15:13:12','US',NULL,NULL,NULL),
(1203,NULL,'microsoft-office-home-business-2024-mac','david.gonzalez92@outlook.com','David Gonzalez',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','1b53013af523eb533ade5c8df54203d1','2026-01-26 14:35:58','2026-01-26 14:35:58','GB',NULL,NULL,NULL),
(1204,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','karen.taylor80@gmail.com','Karen Taylor',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','a9431e1848de4a643cb8b69b82c6f596','2026-01-25 08:18:13','2026-01-25 08:18:13','US',NULL,NULL,NULL),
(1205,NULL,'windows-10-home','elizabeth.nelson75@outlook.com','Elizabeth Nelson',5,'Second time ordering from this store. Reliable every time.',1,'published','d14718f05df1bf46c8c6fae8dd5d9109','2026-01-25 14:14:09','2026-01-25 14:14:09','GB',NULL,NULL,NULL),
(1206,NULL,'microsoft-word-2021-windows','pamela.nguyen28@yahoo.com','Pamela Nguyen',5,'The email with my key and instructions came through in minutes.',1,'published','76d1061e71a8125d9958c30f637782e7','2026-01-25 05:11:53','2026-01-25 05:11:53','US',NULL,NULL,NULL),
(1207,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','steven.hall60@outlook.com','Steven Hall',3,'Really good price and prompt delivery. Working great so far.',1,'published','52da93a78fb6a2fe126c7f70b0c3a57c','2026-01-25 10:46:49','2026-01-25 10:46:49','US','2026-09-16 19:26:36',NULL,NULL),
(1208,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','ryan.patel77@icloud.com','Ryan Patel',4,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','6fc955ac776c9f8ed30bfeb17616b86f','2026-01-25 04:21:10','2026-01-25 04:21:10','US',NULL,NULL,NULL),
(1209,NULL,'microsoft-office-2021-professional-plus-windows','pamela.hall79@icloud.com','Pamela Hall',5,'Really good price and prompt delivery. Working great so far.',1,'published','70a7a6538010f24deea9fae231b06f99','2026-01-25 06:30:35','2026-01-25 06:30:35','US',NULL,NULL,NULL),
(1210,NULL,'windows-11-pro','george.perez52@yahoo.com','George Perez',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','ba34050a9680f832562eca72b8bd543c','2026-01-24 12:56:36','2026-01-24 12:56:36','US',NULL,NULL,NULL),
(1211,NULL,'microsoft-office-home-business-2024-pc','anthony.wright48@hotmail.com','Anthony Wright',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','0a9d6964d851eae8737500c2ea4b0047','2026-01-24 15:37:28','2026-01-24 15:37:28','US',NULL,NULL,NULL),
(1212,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','richard.jackson89@yahoo.com','Richard Jackson',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','da42d6d8dd603cdc5bdc0438af0bc404','2026-01-24 14:38:34','2026-01-24 14:38:34','AU',NULL,NULL,NULL),
(1213,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kenneth.scott90@icloud.com','Kenneth Scott',5,'Activated without a hitch. Great communication throughout.',1,'published','f4aa4feb998679bbadcea1f056c883b8','2026-01-24 10:41:50','2026-01-24 10:41:50','CA',NULL,NULL,NULL),
(1214,NULL,'microsoft-office-2021-home-student-mac','maria.torres28@yahoo.com','Maria Torres',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','903056afd3bbe361f3f86b9d3fa32acc','2026-01-23 08:55:27','2026-01-23 08:55:27','CA',NULL,NULL,NULL),
(1215,NULL,'microsoft-office-2021-home-student-mac','emily.moore84@gmail.com','Emily Moore',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','7afd4677e22d6889103d202b7f382205','2026-01-23 13:53:53','2026-01-23 13:53:53','CA',NULL,NULL,NULL),
(1216,NULL,'microsoft-office-home-2024-mac','david.lopez53@icloud.com','David Lopez',5,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','31e3900e6a4574c7281fcdc565b57998','2026-01-23 04:33:25','2026-01-23 04:33:25','US',NULL,NULL,NULL),
(1217,NULL,'microsoft-office-home-2024-mac','carlos.king83@outlook.com','Carlos King',3,'Activation was painless and the key was valid immediately.',1,'published','1698d7b58e6d57f2f9516f9ec1b08b15','2026-01-23 06:42:30','2026-01-23 06:42:30','GB','2026-09-16 19:26:36',NULL,NULL),
(1218,NULL,'microsoft-office-home-2024-pc','mary.young96@hotmail.com','Mary Young',5,'Customer service was responsive and the product key was genuine.',1,'published','74f8462024a595760add895fd944dc30','2026-01-23 16:12:40','2026-01-23 16:12:40','US',NULL,NULL,NULL),
(1219,NULL,'windows-11-pro','william.gonzalez66@yahoo.com','William Gonzalez',5,'Customer service was responsive and the product key was genuine.',1,'published','65fd440fd1dfc50c492b51c60db3a335','2026-01-22 10:58:57','2026-01-22 10:58:57','US',NULL,NULL,NULL),
(1220,NULL,'windows-10-pro','anthony.clark64@hotmail.com','Anthony Clark',5,'Fast, reliable and affordable. Exactly as advertised.',1,'published','755f865c2b316e59f824842737ec9acb','2026-01-22 06:43:12','2026-01-22 06:43:12','GB',NULL,NULL,NULL),
(1221,NULL,'microsoft-office-home-and-business-2019-mac','michael.miller91@icloud.com','Michael Miller',3,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','3ff336b81c6aa772fa294cacaee9307b','2026-01-22 04:42:35','2026-01-22 04:42:35','AU','2026-09-16 19:26:36',NULL,NULL),
(1222,NULL,'windows-11-pro','william.perez25@yahoo.com','William Perez',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','911d59e18635ecc97dbdf5cef6143481','2026-01-22 08:17:35','2026-01-22 08:17:35','GB',NULL,NULL,NULL),
(1223,NULL,'microsoft-office-2021-home-student-mac','paul.nelson87@icloud.com','Paul Nelson',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','f35687e8664b97c7340bd7183cc02f02','2026-01-22 14:55:34','2026-01-22 14:55:34','US',NULL,NULL,NULL),
(1224,NULL,'microsoft-office-2021-home-student-windows','susan.rodriguez50@outlook.com','Susan Rodriguez',5,'The email with my key and instructions came through in minutes.',1,'published','5219b26ed793425b694db3b100f251ab','2026-01-22 11:11:14','2026-01-22 11:11:14','EU',NULL,NULL,NULL),
(1225,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','amy.brown79@hotmail.com','Amy Brown',4,'Received my product key by email within minutes. Smooth, quick and legit.',1,'published','a4f271bb750f0c5967da1c1056e978fa','2026-01-22 14:53:45','2026-01-22 14:53:45','US',NULL,NULL,NULL),
(1226,NULL,'microsoft-office-2019-home-business-pc','sharon.wright50@outlook.com','Sharon Wright',5,'Quick, easy, and it just works. No complaints at all.',1,'published','1e1ba7fa90e8c61dcc9659e80f9ce669','2026-01-21 15:28:55','2026-01-21 15:28:55','CA',NULL,NULL,NULL),
(1227,NULL,'microsoft-office-2019-home-student-windows','sarah.lewis97@hotmail.com','Sarah Lewis',4,'Key worked instantly and activated on the first try. Great price too.',1,'published','eda7c08bf1c97e39481dabbbc3f2a0be','2026-01-21 07:14:28','2026-01-21 07:14:28','GB',NULL,NULL,NULL),
(1228,NULL,'microsoft-office-home-and-business-2019-mac','andrew.torres84@gmail.com','Andrew Torres',3,'Perfect. Ordered late at night and had my key before I went to bed.',1,'published','d0fa1973da3767c6c57cb905420cd426','2026-01-21 15:43:54','2026-01-21 15:43:54','US','2026-09-16 19:26:36',NULL,NULL),
(1229,NULL,'microsoft-excel-2021-windows','robert.hall66@icloud.com','Robert Hall',4,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','e3bd9e9ac5d894d4ff3f8efbc66f6e2f','2026-01-21 15:40:28','2026-01-21 15:40:28','US',NULL,NULL,NULL),
(1230,NULL,'microsoft-office-2021-home-business-windows','stephanie.johnson69@hotmail.com','Stephanie Johnson',5,'Saved over half the retail price and the license is completely genuine.',1,'published','7aeae3e7859a4ed8985a23a9c3f24116','2026-01-21 13:06:21','2026-01-21 13:06:21','GB',NULL,NULL,NULL),
(1231,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','thomas.young12@yahoo.com','Thomas Young',4,'Great value. The download links they sent were official and safe.',1,'published','d7727839cda7445debcb1be9184782a5','2026-01-21 08:24:08','2026-01-21 08:24:08','AU',NULL,NULL,NULL),
(1232,NULL,'bitdefender-small-office-security-5-devices-1-year','amy.nelson66@icloud.com','Amy Nelson',5,'Best deal I could find and the key is 100% valid. Very pleased.',1,'published','a3dea9d7c1f5092a562a62c12d3170ac','2026-01-21 11:10:08','2026-01-21 11:10:08','CA',NULL,NULL,NULL),
(1233,NULL,'microsoft-office-2021-home-student-windows','samantha.nelson99@icloud.com','Samantha Nelson',5,'No issues whatsoever. Key came fast and activated first time.',1,'published','2f5684723920f44b8a07648ecb9c8e8f','2026-01-20 07:44:53','2026-01-20 07:44:53','CA',NULL,NULL,NULL),
(1234,NULL,'ms-project-professional-2019-pc','joseph.rivera80@icloud.com','Joseph Rivera',5,'Quick delivery and a legit license. Happy customer here.',1,'published','bbde071c68986a778cab381fbb9ec6c8','2026-01-20 10:51:05','2026-01-20 10:51:05','EU',NULL,NULL,NULL),
(1235,NULL,'windows-10-home','charles.harris69@gmail.com','Charles Harris',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','1b67e09fa989227bc17319e9febf664e','2026-01-20 05:15:49','2026-01-20 05:15:49','US',NULL,NULL,NULL),
(1236,NULL,'microsoft-office-2019-home-business-pc','andrew.hill41@icloud.com','Andrew Hill',5,'Would recommend to anyone looking for a legit key at a good price.',1,'published','3a0086315f316e09441198ced69217c6','2026-01-20 07:24:00','2026-01-20 07:24:00','US',NULL,NULL,NULL),
(1237,NULL,'windows-11-pro','ronald.taylor99@outlook.com','Ronald Taylor',5,'Quick delivery and a legit license. Happy customer here.',1,'published','194ca1edd0aa5dc840caa5245b819567','2026-01-20 11:25:34','2026-01-20 11:25:34','GB',NULL,NULL,NULL),
(1238,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','sofia.torres23@outlook.com','Sofia Torres',4,'Quick delivery and a legit license. Happy customer here.',1,'published','ff9ab15cf5804e3c5980111a4d7a012f','2026-01-19 10:05:24','2026-01-19 10:05:24','EU',NULL,NULL,NULL),
(1239,NULL,'microsoft-office-2021-professional-plus-windows','raj.carter60@icloud.com','Raj Carter',5,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','f9556d7f1f29aff3e47207e826db08e7','2026-01-19 08:55:01','2026-01-19 08:55:01','AU',NULL,NULL,NULL),
(1240,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','maria.jones90@yahoo.com','Maria Jones',5,'Quick, easy, and it just works. No complaints at all.',1,'published','8c67e1b09ef45c1b69532c2b33efcc23','2026-01-19 06:16:28','2026-01-19 06:16:28','CA',NULL,NULL,NULL),
(1241,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','justin.sanchez15@outlook.com','Justin Sanchez',4,'Works great on my PC. No issues after several weeks of use.',1,'published','fba4d02f1cd21c27cfd0147c2960b108','2026-01-19 03:39:10','2026-01-19 03:39:10','US',NULL,NULL,NULL),
(1242,NULL,'ms-visio-professional-2019-pc','emily.perez52@gmail.com','Emily Perez',4,'Legit key at a fraction of the retail price. Great experience.',1,'published','bf6dae433e85dde6b0fcf15a760181c5','2026-01-19 07:30:16','2026-01-19 07:30:16','CA',NULL,NULL,NULL),
(1243,NULL,'microsoft-office-home-business-2024-pc','stephen.wilson84@icloud.com','Stephen Wilson',4,'Really good price and prompt delivery. Working great so far.',1,'published','e11998cbad41ca5a147ea7d118a9461a','2026-01-19 15:51:24','2026-01-19 15:51:24','US',NULL,NULL,NULL),
(1244,NULL,'microsoft-office-home-2024-mac','emily.patel85@icloud.com','Emily Patel',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','f327b8e80b2c3fd7393ef85306c33631','2026-01-19 07:44:02','2026-01-19 07:44:02','CA',NULL,NULL,NULL),
(1245,NULL,'microsoft-visio-2021-professional-windows-pc','jessica.young88@outlook.com','Jessica Young',4,'Instant delivery as promised. The license is genuine and validated online.',1,'published','52fcc3fba9663ad5bf360bb68fbcd895','2026-01-18 09:37:58','2026-01-18 09:37:58','GB',NULL,NULL,NULL),
(1246,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','charles.brown37@gmail.com','Charles Brown',5,'Instant delivery as promised. The license is genuine and validated online.',1,'published','67b77ddce558db4c3ae7748b572979ba','2026-01-18 16:29:38','2026-01-18 16:29:38','US',NULL,NULL,NULL),
(1247,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','susan.lee65@outlook.com','Susan Lee',5,'Superb service. The whole process took less than five minutes.',1,'published','cfa0c2165abcfe61bbaf796d1e382058','2026-01-18 08:58:01','2026-01-18 08:58:01','GB',NULL,NULL,NULL),
(1248,NULL,'microsoft-office-home-2024-mac','edward.wright97@gmail.com','Edward Wright',2,'Second time ordering from this store. Reliable every time.',1,'published','8c55a7141ecccb0b917aef87b3fcc78c','2026-01-18 11:42:15','2026-01-18 11:42:15','US','2026-09-16 19:26:36',NULL,NULL),
(1249,NULL,'microsoft-office-home-2024-pc','deborah.hill18@outlook.com','Deborah Hill',5,'Customer service was responsive and the product key was genuine.',1,'published','5c8d0f91b88e3d79e8ab76f23bf80862','2026-01-18 05:06:24','2026-01-18 05:06:24','US',NULL,NULL,NULL),
(1250,NULL,'windows-10-pro','david.ramirez93@yahoo.com','David Ramirez',5,'Second time ordering from this store. Reliable every time.',1,'published','b6db7b936198fe425c93210c3ba98edd','2026-01-17 11:20:53','2026-01-17 11:20:53','US',NULL,NULL,NULL),
(1251,NULL,'microsoft-office-2019-professional-plus-windows','eric.gonzalez48@icloud.com','Eric Gonzalez',5,'Activated without a hitch. Great communication throughout.',1,'published','20aeade27c12eeb4d7c4d6e8ecd390f9','2026-01-17 15:26:02','2026-01-17 15:26:02','GB',NULL,NULL,NULL),
(1252,NULL,'bitdefender-small-office-security-5-devices-1-year','betty.carter43@yahoo.com','Betty Carter',5,'Took a chance and it paid off — genuine key, instant delivery.',1,'published','c75a58145ca740237b874dc047c4fff9','2026-01-17 08:36:41','2026-01-17 08:36:41','CA',NULL,NULL,NULL),
(1253,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','nancy.rodriguez90@icloud.com','Nancy Rodriguez',4,'Fast, reliable and affordable. Exactly as advertised.',1,'published','2bb26d76ac520fc34ad876278169e028','2026-01-17 06:38:14','2026-01-17 06:38:14','US',NULL,NULL,NULL),
(1254,NULL,'bitdefender-antivirus-for-mac-1-mac-2-years','kenneth.young70@icloud.com','Kenneth Young',5,'Simple checkout and the key activated right away. Saved me a lot of money.',1,'published','df48999f6e680aae7a202e4d068cf913','2026-01-17 07:09:09','2026-01-17 07:09:09','CA',NULL,NULL,NULL),
(1255,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','gary.robinson49@hotmail.com','Gary Robinson',5,'Ordered late at night and still got the key within minutes.',1,'published','0b22dca82cae7877463a877cad0d74f5','2026-01-17 10:01:09','2026-01-17 10:01:09','CA',NULL,NULL,NULL),
(1256,NULL,'microsoft-office-2019-professional-plus-windows','carlos.rodriguez47@hotmail.com','Carlos Rodriguez',4,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','a8be1c0b4544f8e53cba0d465eab8658','2026-01-16 04:49:12','2026-01-16 04:49:12','US',NULL,NULL,NULL),
(1257,NULL,'ms-project-professional-2019-pc','jason.martinez53@outlook.com','Jason Martinez',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','3c7840ed2e3c2bbf544a88115b991281','2026-01-16 07:39:32','2026-01-16 07:39:32','CA',NULL,NULL,NULL),
(1258,NULL,'windows-11-home','lisa.jackson52@gmail.com','Lisa Jackson',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','f15e00669bf870740b11ef73eabf1653','2026-01-16 06:14:01','2026-01-16 06:14:01','US',NULL,NULL,NULL),
(1259,NULL,'bitdefender-antivirus-for-mac-3-mac-1-year','michelle.brown82@hotmail.com','Michelle Brown',5,'Set everything up in minutes. Very straightforward and trustworthy.',1,'published','6f25a7a15dddbae92d2929b897ba21f2','2026-01-16 07:20:29','2026-01-16 07:20:29','AU',NULL,NULL,NULL),
(1260,NULL,'bitdefender-small-office-security-5-devices-1-year','brian.lewis69@gmail.com','Brian Lewis',4,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','99a3b3eceeee583375efc35b5adf708e','2026-01-16 14:01:33','2026-01-16 14:01:33','US',NULL,NULL,NULL),
(1261,NULL,'microsoft-project-2024-professional-pc','andrew.perez66@yahoo.com','Andrew Perez',5,'Smooth transaction, clear instructions, and a working license. Thanks!',1,'published','56fc5b765b9257b6b2b8660bc917ddc8','2026-01-16 08:07:43','2026-01-16 08:07:43','EU',NULL,NULL,NULL),
(1262,NULL,'ms-visio-professional-2019-pc','paul.smith29@icloud.com','Paul Smith',5,'Genuine key, best price I found online. Will buy from here again.',1,'published','07963bb5230e5e887b91bf46ec08001d','2026-01-16 14:05:19','2026-01-16 14:05:19','CA',NULL,NULL,NULL),
(1263,NULL,'windows-11-pro','deborah.moore47@yahoo.com','Deborah Moore',5,'The email with my key and instructions came through in minutes.',1,'published','fd5ec31520d057f5bc9e2fc849d9298a','2026-01-15 07:26:33','2026-01-15 07:26:33','CA',NULL,NULL,NULL),
(1264,NULL,'ms-project-professional-2019-pc','timothy.williams77@outlook.com','Timothy Williams',5,'Solid experience overall. The key worked and support was helpful.',1,'published','2e2f8bffccfa6ed6b2b6c92133e3e23d','2026-01-15 13:06:44','2026-01-15 13:06:44','EU',NULL,NULL,NULL),
(1265,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','cynthia.flores80@hotmail.com','Cynthia Flores',4,'Solid experience overall. The key worked and support was helpful.',1,'published','6aae97bc9e9da344d376193e5fb25ea0','2026-01-15 16:39:34','2026-01-15 16:39:34','US',NULL,NULL,NULL),
(1266,NULL,'microsoft-excel-2021-windows','kimberly.ramirez73@outlook.com','Kimberly Ramirez',5,'Second time ordering from this store. Reliable every time.',1,'published','8aa82ed08ba199298060b567263433d0','2026-01-14 11:14:56','2026-01-14 11:14:56','US',NULL,NULL,NULL),
(1267,NULL,'microsoft-office-home-and-student-2019-mac','robert.johnson81@icloud.com','Robert Johnson',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','dc577600a8c32d75eec11ddcf40d5f52','2026-01-14 07:50:08','2026-01-14 07:50:08','GB',NULL,NULL,NULL),
(1268,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','rebecca.hernandez84@hotmail.com','Rebecca Hernandez',4,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','bef9e5d0735d16df4432a00da5a1d3e5','2026-01-14 16:34:22','2026-01-14 16:34:22','AU',NULL,NULL,NULL),
(1269,NULL,'windows-10-home','matthew.martinez94@gmail.com','Matthew Martinez',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','4bbd21fa6b606fba03cbff5bc50caa09','2026-01-13 05:43:11','2026-01-13 05:43:11','AU',NULL,NULL,NULL),
(1270,NULL,'microsoft-office-home-2024-pc','timothy.nelson97@outlook.com','Timothy Nelson',5,'Activation was painless and the key was valid immediately.',1,'published','71a39bf5b8bae92d5296cd402c7951f9','2026-01-13 07:26:36','2026-01-13 07:26:36','GB',NULL,NULL,NULL),
(1271,NULL,'microsoft-visio-2021-professional-windows-pc','melissa.taylor46@hotmail.com','Melissa Taylor',5,'Works great on my PC. No issues after several weeks of use.',1,'published','91fd867ba80e82a1a0e5ea3cb9545621','2026-01-13 11:04:19','2026-01-13 11:04:19','CA',NULL,NULL,NULL),
(1272,NULL,'microsoft-office-2021-home-student-windows','sarah.martinez49@icloud.com','Sarah Martinez',4,'Honestly better than I expected. Delivery was almost instant.',1,'published','da708bc134ba788be68d3d998ae3ac8a','2026-01-13 12:36:13','2026-01-13 12:36:13','EU',NULL,NULL,NULL),
(1273,NULL,'bitdefender-premium-vpn-unlimited-devices-1-year','angela.sanchez68@gmail.com','Angela Sanchez',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','bebd6f6f06f550e62d0cebeaffbdfd07','2026-01-13 10:57:23','2026-01-13 10:57:23','GB',NULL,NULL,NULL),
(1274,NULL,'microsoft-office-2024-professional-plus-windows','kimberly.robinson76@gmail.com','Kimberly Robinson',5,'Easy checkout, instant email delivery, key activated with no problems.',1,'published','fa8a30858e22f2f203da06bfd15e0656','2026-01-13 07:16:08','2026-01-13 07:16:08','AU',NULL,NULL,NULL),
(1275,NULL,'ms-visio-professional-2019-pc','robert.garcia98@icloud.com','Robert Garcia',5,'Good product for the money. Everything was quick and easy.',1,'published','180f91a5346297300c80f50e9edd64dc','2026-01-12 15:21:11','2026-01-12 15:21:11','AU',NULL,NULL,NULL),
(1276,NULL,'bitdefender-antivirus-for-mac-3-mac-2-years','joseph.wright37@icloud.com','Joseph Wright',3,'Fast, reliable and affordable. Exactly as advertised.',1,'published','9def0be01d37dc87a45ad29571f77b80','2026-01-12 12:33:28','2026-01-12 12:33:28','US','2026-09-16 19:26:36',NULL,NULL),
(1277,NULL,'microsoft-visio-2024-professional-windows-pc','wei.nelson53@hotmail.com','Wei Nelson',4,'Fast digital delivery and the license activated perfectly. Highly recommend.',1,'published','04b42d5a5bab187a92b5512b789e5ce0','2026-01-12 07:26:38','2026-01-12 07:26:38','GB',NULL,NULL,NULL),
(1278,NULL,'microsoft-office-home-2024-pc','edward.thompson33@hotmail.com','Edward Thompson',5,'Quick delivery and a legit license. Happy customer here.',1,'published','3ba8f3ef75c9e756f4c342721b91619d','2026-01-12 06:49:27','2026-01-12 06:49:27','US',NULL,NULL,NULL),
(1279,NULL,'microsoft-office-home-2024-pc','hiroshi.harris35@outlook.com','Hiroshi Harris',4,'Support helped me through activation step by step. Really appreciated it.',1,'published','522e3d6e2572e172986d1bb335336feb','2026-01-12 05:59:35','2026-01-12 05:59:35','US',NULL,NULL,NULL),
(1280,NULL,'microsoft-office-home-2024-pc','joshua.flores23@outlook.com','Joshua Flores',4,'Works great on my PC. No issues after several weeks of use.',1,'published','53fbd7ed27478b51c926423ee47a49fd','2026-01-12 09:02:52','2026-01-12 09:02:52','CA',NULL,NULL,NULL),
(1281,NULL,'ms-project-professional-2019-pc','ashley.sanchez67@outlook.com','Ashley Sanchez',4,'Superb service. The whole process took less than five minutes.',1,'published','37bf1437ce3acf482f66d0903323c6bc','2026-01-11 06:43:40','2026-01-11 06:43:40','US',NULL,NULL,NULL),
(1282,NULL,'microsoft-excel-2021-mac-lifetime-license-no-subscription','deborah.king17@icloud.com','Deborah King',2,'Legit key, fast email delivery, and a fair price. Couldn\'t ask for more.',1,'published','e563471d39ca910468c94e55847081ac','2026-01-11 09:37:53','2026-01-11 09:37:53','GB','2026-09-16 19:26:36',NULL,NULL),
(1283,NULL,'windows-10-home','matthew.walker81@hotmail.com','Matthew Walker',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','b812de83f877f648810ec05e5a8bf4c2','2026-01-11 04:32:53','2026-01-11 04:32:53','CA',NULL,NULL,NULL),
(1284,NULL,'windows-11-home','elizabeth.brown89@hotmail.com','Elizabeth Brown',5,'Was skeptical at first but everything worked exactly as described. Very happy.',1,'published','9c5738b7a91b8a7ba1921c6b59ed0ab2','2026-01-11 10:38:55','2026-01-11 10:38:55','EU',NULL,NULL,NULL),
(1285,NULL,'microsoft-office-2021-home-student-windows','barbara.ramirez84@gmail.com','Barbara Ramirez',3,'Quick delivery and a legit license. Happy customer here.',1,'published','c430e02e7eb1af098d5dfee8c2769501','2026-01-11 07:54:07','2026-01-11 07:54:07','US','2026-09-16 19:26:36',NULL,NULL),
(1286,NULL,'microsoft-office-2019-professional-plus-windows','amanda.thompson44@yahoo.com','Amanda Thompson',5,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','53736d04eb7e09028f946d9375f94b56','2026-01-11 14:32:05','2026-01-11 14:32:05','AU',NULL,NULL,NULL),
(1287,NULL,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','karen.rodriguez84@hotmail.com','Karen Rodriguez',5,'Key worked instantly and activated on the first try. Great price too.',1,'published','9a7ffd7caf980068a5fa15acde74b4b6','2026-01-10 12:11:17','2026-01-10 12:11:17','GB',NULL,NULL,NULL),
(1288,NULL,'microsoft-office-2019-home-business-pc','juan.sanchez56@yahoo.com','Juan Sanchez',5,'Activated on my laptop with zero problems. Exactly what I needed.',1,'published','e88d6f40d54898f7e850ef0820b0fd92','2026-01-10 14:42:04','2026-01-10 14:42:04','US',NULL,NULL,NULL),
(1289,NULL,'microsoft-visio-2021-professional-windows-pc','raj.brown58@outlook.com','Raj Brown',5,'Superb service. The whole process took less than five minutes.',1,'published','3f7773b5062ba6c68840fce36847a550','2026-01-10 11:13:13','2026-01-10 11:13:13','US',NULL,NULL,NULL),
(1290,NULL,'microsoft-office-home-2024-pc','john.sanchez67@hotmail.com','John Sanchez',3,'Key worked instantly and activated on the first try. Great price too.',1,'published','2bd938e4222ff8af66946c00a080f075','2026-01-09 08:25:24','2026-01-09 08:25:24','US','2026-09-16 19:26:36',NULL,NULL),
(1291,NULL,'microsoft-office-home-2024-pc','emily.allen61@gmail.com','Emily Allen',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','405c29f591f185968f05e39c989a4a04','2026-01-09 12:07:28','2026-01-09 12:07:28','AU',NULL,NULL,NULL),
(1292,NULL,'microsoft-office-2024-professional-plus-windows','rebecca.martinez59@yahoo.com','Rebecca Martinez',4,'Bought it, got the key in about 15 minutes, activated no problem. A+',1,'published','f02c5fb93dcf53fdf972540be0c6262c','2026-01-09 05:20:07','2026-01-09 05:20:07','AU',NULL,NULL,NULL),
(1293,NULL,'windows-10-pro','kevin.garcia58@gmail.com','Kevin Garcia',2,'Bought this for my new laptop. Installed and activated in minutes.',1,'published','2ac81f5b58ac960b9e7cbb23abfd784d','2026-01-09 04:40:20','2026-01-09 04:40:20','GB','2026-09-16 19:26:36',NULL,NULL),
(1294,NULL,'microsoft-office-2019-home-business-pc','sarah.baker39@icloud.com','Sarah Baker',5,'Works great on my PC. No issues after several weeks of use.',1,'published','3037a243af78d8b22796b4b9e72c680c','2026-01-09 09:07:43','2026-01-09 09:07:43','US',NULL,NULL,NULL),
(1295,NULL,'microsoft-word-2021-windows','justin.ramirez40@yahoo.com','Justin Ramirez',5,'Very straightforward process. Key came fast and worked immediately.',1,'published','f23352f21c0d5802b44354a58c921444','2026-01-08 10:10:52','2026-01-08 10:10:52','GB',NULL,NULL,NULL),
(1296,NULL,'bitdefender-antivirus-for-mac-1-mac-1-year','raj.gonzalez41@outlook.com','Raj Gonzalez',4,'The step-by-step activation instructions were really helpful.',1,'published','46e4eb0a477aae6b278ca16d50277fcf','2026-01-08 15:01:52','2026-01-08 15:01:52','CA',NULL,NULL,NULL),
(1297,NULL,'microsoft-office-2021-professional-plus-windows','paul.perez36@gmail.com','Paul Perez',5,'Everything went smoothly from purchase to activation. Recommended.',1,'published','106d52648e735c74f13b079b2dc679c2','2026-01-08 06:04:12','2026-01-08 06:04:12','EU',NULL,NULL,NULL),
(1298,NULL,'microsoft-excel-2021-windows','laura.thomas36@yahoo.com','Laura Thomas',4,'Second time ordering from this store. Reliable every time.',1,'published','80b815da5fd786d7ca3469101f0a3ecb','2026-01-08 04:02:47','2026-01-08 04:02:47','US',NULL,NULL,NULL),
(1299,NULL,'bitdefender-small-office-security-5-devices-1-year','jennifer.smith21@outlook.com','Jennifer Smith',5,'Great experience — instant delivery, easy activation, and support answered fast.',1,'published','c1f3a510a573a41919df56189662773e','2026-01-08 04:46:44','2026-01-08 04:46:44','US',NULL,NULL,NULL),
(1300,NULL,'microsoft-office-2021-home-business-windows','pamela.martin69@hotmail.com','Pamela Martin',5,'Honestly better than I expected. Delivery was almost instant.',1,'published','b9324b4616b36c2be7d7a0e29b3dbb23','2026-01-08 04:15:47','2026-01-08 04:15:47','GB',NULL,NULL,NULL),
(1301,NULL,'microsoft-office-home-and-business-2019-mac','jeffrey.baker52@outlook.com','Jeffrey Baker',5,'Great value. The download links they sent were official and safe.',1,'published','2a90f7a7cff742488552ee01204f0c4e','2026-01-07 14:46:07','2026-01-07 14:46:07','US',NULL,NULL,NULL),
(1302,NULL,'windows-11-home','george.hill86@yahoo.com','George Hill',4,'Delivery was quick and the product works flawlessly. Thank you!',1,'published','13bf972d5dfb08a440d40394d96b7252','2026-01-07 05:31:47','2026-01-07 05:31:47','US',NULL,NULL,NULL),
(1304,NULL,'microsoft-project-professional-2021-pc','patricia.rivera40@yahoo.com','Patricia Rivera',5,'Customer service was responsive and the product key was genuine.',1,'published','e6ce1c1252ad82b8db29807f7cc3703e','2026-01-07 16:52:36','2026-01-07 16:52:36','EU',NULL,NULL,NULL),
(1306,NULL,'mcafee-premium-individual-1-year-unlimited-devices-usa','angela.ramirez11@icloud.com','Angela Ramirez',5,'Solid experience overall. The key worked and support was helpful.',1,'published','1dc5c0677b763b154ac3db6d0f4ba0fc','2026-01-07 07:35:24','2026-01-07 07:35:24','US',NULL,NULL,NULL),
(1307,NULL,'microsoft-visio-2021-professional-windows-pc','daniel.perez56@outlook.com','Daniel Perez',5,'Legit key at a fraction of the retail price. Great experience.',1,'published','762c6bf1e88d390888304c9ea350414b','2026-01-07 14:22:03','2026-01-07 14:22:03','EU',NULL,NULL,NULL),
(1308,1,'microsoft-office-2024-professional-plus-windows','cjs-test@example.com','Collect Tester',NULL,NULL,0,'pending','6f52c8a33188c138af8ba1a0b465c0da','2026-09-16 15:18:54',NULL,'US',NULL,NULL,NULL),
(1309,7,'microsoft-office-2024-professional-plus-windows','qa.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','cf551b0a97c78e55a9454f5a9efd9639','2026-09-16 15:25:08',NULL,'US',NULL,NULL,NULL),
(1314,23,'windows-11-pro','testcjs+1789587361@example.com','Test User',NULL,NULL,0,'pending','4c8e6943d557f38a6ea18168471e9cce','2026-09-16 15:36:06',NULL,'US',NULL,NULL,NULL),
(1315,30,'microsoft-office-2024-professional-plus-windows','qa.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','3c5a14c4eb8e598dc42d30a1a9221806','2026-09-16 15:38:00',NULL,'US',NULL,NULL,NULL),
(1316,32,'microsoft-office-2024-professional-plus-windows','qa17.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','edc6d087d9171540828da7661ad839a3','2026-09-16 15:38:09',NULL,'US',NULL,NULL,NULL),
(1319,42,'microsoft-office-home-2024-pc','qa26.jan.success@example.com','QA SUCCESS',NULL,NULL,0,'pending','45a34ff9402826cb446f1bcdb42d9104','2026-09-17 08:23:26',NULL,'US',NULL,NULL,NULL),
(1320,45,'microsoft-office-home-2024-pc','qa26.jan.badexp@example.com','QA BADEXP',NULL,NULL,0,'pending','6dc5140b0857e27a68562bc98baf9450','2026-09-17 08:23:33',NULL,'US',NULL,NULL,NULL),
(1321,46,'microsoft-office-home-2024-pc','qa26.jan.adm.success@example.com','QA ADM.SUCCESS',NULL,NULL,0,'pending','116d83c4861515561814becf81392731','2026-09-17 08:23:38',NULL,'US',NULL,NULL,NULL),
(1322,49,'microsoft-office-2024-professional-plus-windows','qa22.ok@example.com','QA22 OK',NULL,NULL,0,'pending','433c8eaf58756ca077aaa8c03744d355','2026-09-17 08:23:48',NULL,'US',NULL,NULL,NULL),
(1323,50,'microsoft-office-2024-professional-plus-windows','qa22.okadmin@example.com','QA22 OKADMIN',NULL,NULL,0,'pending','3573fd0dcb2af58a7817ebc99c24be9b','2026-09-17 08:23:53',NULL,'US',NULL,NULL,NULL),
(1324,56,'microsoft-office-2024-professional-plus-windows','qa17.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','ff3628c74e9cc6c3d877e257ef7409f1','2026-09-17 08:24:17',NULL,'US',NULL,NULL,NULL),
(1329,70,'microsoft-office-2024-professional-plus-windows','qa.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','91a31af02540e203ffb2bdd495ae2291','2026-09-17 08:27:47',NULL,'US',NULL,NULL,NULL),
(5424,72,'microsoft-office-home-2024-pc','qa26.jan.success@example.com','QA SUCCESS',NULL,NULL,0,'pending','300a8f066aab726bf7e0385cbf8fc0c3','2026-09-17 08:28:37',NULL,'US',NULL,NULL,NULL),
(5425,75,'microsoft-office-home-2024-pc','qa26.jan.badexp@example.com','QA BADEXP',NULL,NULL,0,'pending','bb11343212e1a7a79ffccb9760f93ab3','2026-09-17 08:28:45',NULL,'US',NULL,NULL,NULL),
(5426,76,'microsoft-office-home-2024-pc','qa26.jan.adm.success@example.com','QA ADM.SUCCESS',NULL,NULL,0,'pending','60a2ba9d1c8da9134bcb578ce8ed6c2a','2026-09-17 08:28:49',NULL,'US',NULL,NULL,NULL),
(5427,84,'microsoft-office-2024-professional-plus-windows','qa.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','0bc7958696a2b13118f0e5e89b312b94','2026-09-17 08:29:22',NULL,'US',NULL,NULL,NULL),
(5428,85,'microsoft-office-2024-professional-plus-windows','qa17.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','7acab1098c125cd5bef4c13b81579583','2026-09-17 08:29:30',NULL,'US',NULL,NULL,NULL),
(5431,95,'microsoft-office-2024-professional-plus-windows','qa26.jan.pwsuccess@example.com','PW Success',NULL,NULL,0,'pending','60efc5057ded4206f1817271e769e705','2026-09-17 08:33:02',NULL,'US',NULL,NULL,NULL),
(5432,99,'microsoft-office-home-2024-pc','qa.paypal@example.com','Test Buyer',NULL,NULL,0,'pending','2fb184cfd68c97cf326e6ae13002e556','2026-09-20 18:43:08',NULL,'US',NULL,NULL,NULL),
(5433,101,'microsoft-office-home-2024-pc','qa.3ds@example.com','Three DS',NULL,NULL,0,'pending','e5457e707274197a86ec1cd69afbfc59','2026-09-20 18:46:38',NULL,'US',NULL,NULL,NULL),
(5434,113,'microsoft-office-2024-professional-plus-windows','qa.ok4242@example.com','QA OK4242',NULL,NULL,0,'pending','9cc53ea8873d1075b6a1976ed4321ff2','2026-09-20 18:59:19',NULL,'US',NULL,NULL,NULL),
(5435,118,'microsoft-office-home-2024-pc','qa.pp@example.com','QA Buyer',NULL,NULL,0,'pending','612630978e42d59420fc9682fc1c7815','2026-09-20 19:05:39',NULL,'US',NULL,NULL,NULL),
(5436,128,'windows-11-pro','ppdecline@test.com','CCREJECT-IF Tester',NULL,NULL,0,'pending','8a74874d68dddf5fae21142b1dece7a6','2026-09-20 19:52:16',NULL,'US',NULL,NULL,NULL),
(5437,137,'windows-11-pro','qa.ppcard@example.com','Jane Doe',NULL,NULL,0,'pending','7f31868f9b8edc8ded22cb502b5ca6b0','2026-09-20 20:18:57',NULL,'US',NULL,NULL,NULL),
(5438,144,'windows-11-pro','buyer_test@example.com','John Tester',NULL,NULL,0,'pending','b964e11f04eaecfb92b664e3f45d5fa6','2026-09-20 22:02:06',NULL,'US',NULL,NULL,NULL),
(5439,146,'windows-11-pro','buyer_test@example.com','John Tester',NULL,NULL,0,'pending','b11f4a39d5c089bd380b70cb9fec80cc','2026-09-20 22:06:22',NULL,'US',NULL,NULL,NULL),
(5440,148,'windows-11-pro','buyer_test@example.com','John Tester',NULL,NULL,0,'pending','33614ea60ab4c88a1d4f9f1bff860553','2026-09-20 22:07:49',NULL,'US',NULL,NULL,NULL),
(5441,153,'bitdefender-antivirus-for-mac-1-mac-1-year','qa@example.com','Qa Tester',NULL,NULL,0,'pending','c0475123dc1146a4e79bd46beff986fb','2026-09-21 01:37:21',NULL,'US',NULL,NULL,NULL),
(5442,155,'bitdefender-antivirus-for-mac-1-mac-1-year','john.tester@example.com','John Tester',NULL,NULL,0,'pending','ad4eb5e17821ed9eb132ff78bacfc175','2026-09-21 01:44:23',NULL,'US',NULL,NULL,NULL),
(5443,157,'bitdefender-antivirus-for-mac-1-mac-1-year','cadtest@example.com','CadTest Buyer',NULL,NULL,0,'pending','9c3cdb6e9b0fc08b9d6f46d028c94019','2026-09-21 02:02:24',NULL,'US',NULL,NULL,NULL),
(5444,1,'microsoft-office-home-2024-pc','buyer+test@example.com','QA Tester',NULL,NULL,0,'pending','f72d35875422214901ba6e11aa683615','2026-09-21 06:47:57',NULL,'CA',NULL,NULL,NULL),
(5445,2,'microsoft-office-home-2024-pc','buyer+test@example.com','QA Tester',NULL,NULL,0,'pending','9299b77f1f711a21fdd17c23b57343cb','2026-09-21 06:48:08',NULL,'CA',NULL,NULL,NULL),
(5448,8,'microsoft-office-2024-professional-plus-windows','cadpp@example.com','Cad Paypal',NULL,NULL,0,'pending','80ccde71f9ce2465b3d148630908e7da','2026-09-21 07:01:02',NULL,'CA',NULL,NULL,NULL),
(5449,2,'microsoft-office-home-2024-mac','robert.leach1@yahoo.com','Robert Leach',NULL,NULL,0,'pending','f2afc51caa04721313b5628cd8aa21e0','2026-09-27 00:03:47',NULL,'US',NULL,NULL,NULL),
(5450,3,'microsoft-office-home-2024-pc','jbholliday75@yahoo.com','John Holliday',NULL,NULL,0,'pending','acdbb2123085b3b0184ed060b1777fa3','2026-09-28 11:30:24',NULL,'US',NULL,NULL,NULL),
(5451,4,'microsoft-excel-2021-windows','dalanennor@yahoo.com','Mari-Anne Ennor',NULL,NULL,0,'pending','e2811c6b158111db6be83ac327d8c189','2026-10-01 17:03:32',NULL,'US',NULL,NULL,NULL),
(5454,10,'microsoft-office-2024-professional-plus-windows','opentest@example.com','Joseph Panek',NULL,NULL,0,'pending','8fbb2704214acc5b898650a02964e868','2026-10-10 07:54:34',NULL,'US',NULL,NULL,NULL),
(5455,11,'microsoft-office-2024-professional-plus-windows','opentest@example.com','Joseph Panek',NULL,NULL,0,'pending','d417d17f769f5ab3387d1373b16dbfa5','2026-10-10 07:54:59',NULL,'US',NULL,NULL,NULL),
(5456,12,'microsoft-office-2024-professional-plus-windows','dltest@example.com','Parth Hari',NULL,NULL,0,'pending','1ab75567f2f9464f71d4ba5f557c9d03','2026-10-10 08:07:21',NULL,'US',NULL,NULL,NULL),
(5457,2,'microsoft-office-2024-professional-plus-windows','rg1@example.com','Claire Groleau',NULL,NULL,0,'pending','6969e804f33d353fa635f27d0bc7c6bf','2026-10-11 14:41:13',NULL,'US',NULL,NULL,NULL),
(5458,35,'microsoft-office-2024-professional-plus-windows','rg1@example.com','Claire Groleau',NULL,NULL,0,'pending','d0f5a38d8e7441456e161dd5e86f42a5','2026-10-14 17:45:20',NULL,'US',NULL,NULL,NULL),
(5459,1,'bitdefender-antivirus-for-mac-1-mac-1-year','real.buyer@example.com','Real Buyer',NULL,NULL,0,'pending','3ff3d4345e880b424b3d31df8e1a578d','2026-10-20 08:38:52',NULL,'US',NULL,NULL,NULL),
(5460,3,'microsoft-office-2024-professional-plus-windows','intl.IN@example.com','Test India',NULL,NULL,0,'pending','77c76ce031cb854cf0ed90f8c8fe707f','2026-10-20 13:23:27',NULL,'US',NULL,NULL,NULL),
(5461,5,'microsoft-office-2024-professional-plus-windows','intl.JP@example.com','Test Japan',NULL,NULL,0,'pending','aec6bcb755e45676174c368dd5c52848','2026-10-20 13:23:37',NULL,'US',NULL,NULL,NULL),
(5462,6,'microsoft-office-2024-professional-plus-windows','intl.CA@example.com','Test Canada',NULL,NULL,0,'pending','2a7acfed8817050538f4ba3f3ff4a77a','2026-10-20 13:23:43',NULL,'US',NULL,NULL,NULL),
(5463,9,'microsoft-office-2024-professional-plus-windows','intl.AE@example.com','Test UAE',NULL,NULL,0,'pending','512962a7512749dd19e2aba5fedffde6','2026-10-20 13:25:49',NULL,'US',NULL,NULL,NULL),
(5464,13,'microsoft-office-2024-professional-plus-windows','intl.JP@example.com','Test Japan',NULL,NULL,0,'pending','12d45c0cff085ae986adf6a6862df4eb','2026-10-20 13:26:06',NULL,'US',NULL,NULL,NULL),
(5465,14,'microsoft-office-2024-professional-plus-windows','intl.CA@example.com','Test Canada',NULL,NULL,0,'pending','4b93ff77c48a0983f41e522a0c3ab2a5','2026-10-20 13:26:12',NULL,'US',NULL,NULL,NULL),
(5466,15,'microsoft-office-2024-professional-plus-windows','intl.AU@example.com','Test Australia',NULL,NULL,0,'pending','c79446d4541df5686063c9a50689f7cb','2026-10-20 13:26:15',NULL,'US',NULL,NULL,NULL),
(5467,16,'microsoft-office-2024-professional-plus-windows','intl.HK@example.com','Test HongKong',NULL,NULL,0,'pending','25f40e99a75e3ed22f9070d437359315','2026-10-20 13:26:18',NULL,'US',NULL,NULL,NULL);
/*!40000 ALTER TABLE `customer_reviews` ENABLE KEYS */;

--
-- Table structure for table `customer_subscriptions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `customer_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(32) NOT NULL DEFAULT '',
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(40) NOT NULL DEFAULT '',
  `plan_slug` varchar(64) NOT NULL DEFAULT '',
  `plan_name` varchar(120) NOT NULL DEFAULT '',
  `customer_name` varchar(160) NOT NULL DEFAULT '',
  `email` varchar(190) NOT NULL DEFAULT '',
  `phone` varchar(48) NOT NULL DEFAULT '',
  `country` varchar(8) NOT NULL DEFAULT 'US',
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(8) NOT NULL DEFAULT 'USD',
  `gateway` varchar(20) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `assigned_department` varchar(40) NOT NULL DEFAULT '',
  `assigned_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email` (`email`),
  KEY `idx_plan` (`plan_slug`),
  KEY `idx_cust` (`customer_id`),
  KEY `idx_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_subscriptions`
--

/*!40000 ALTER TABLE `customer_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_subscriptions` ENABLE KEYS */;

--
-- Table structure for table `dmca_findings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `dmca_findings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(100) NOT NULL,
  `suspected_url` varchar(500) NOT NULL,
  `suspected_host` varchar(200) DEFAULT NULL,
  `confidence` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('pending','dismissed','reported','taken_down') NOT NULL DEFAULT 'pending',
  `scanned_with` varchar(60) DEFAULT NULL,
  `ran_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_post` (`post_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dmca_findings`
--

/*!40000 ALTER TABLE `dmca_findings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dmca_findings` ENABLE KEYS */;

--
-- Table structure for table `email_followup_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_followup_schedule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `stage` tinyint(4) NOT NULL DEFAULT 1,
  `scheduled_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `status` enum('pending','sent','skipped','failed') NOT NULL DEFAULT 'pending',
  `note` varchar(255) NOT NULL DEFAULT '',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_stage` (`order_id`,`stage`),
  KEY `idx_status_time` (`status`,`scheduled_at`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_followup_schedule`
--

/*!40000 ALTER TABLE `email_followup_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_followup_schedule` ENABLE KEYS */;

--
-- Table structure for table `email_open_events`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_open_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outbox_id` int(11) NOT NULL,
  `tracking_token` varchar(64) DEFAULT NULL,
  `opened_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ip` varchar(45) DEFAULT NULL,
  `country` varchar(80) DEFAULT NULL,
  `region` varchar(80) DEFAULT NULL,
  `city` varchar(80) DEFAULT NULL,
  `isp` varchar(160) DEFAULT NULL,
  `device` varchar(120) DEFAULT NULL,
  `client` varchar(120) DEFAULT NULL,
  `user_agent` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_open_outbox` (`outbox_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_open_events`
--

/*!40000 ALTER TABLE `email_open_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_open_events` ENABLE KEYS */;

--
-- Table structure for table `email_outbox`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `html` mediumtext NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'queued',
  `note` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `delivered_at` datetime DEFAULT NULL,
  `opened_at` datetime DEFAULT NULL,
  `opened_count` int(11) NOT NULL DEFAULT 0,
  `tracking_token` varchar(64) DEFAULT NULL,
  `provider_id` varchar(120) DEFAULT NULL,
  `clicked_at` datetime DEFAULT NULL,
  `click_count` int(11) NOT NULL DEFAULT 0,
  `template_code` varchar(60) DEFAULT NULL,
  `attachments_json` text DEFAULT NULL,
  `retry_count` int(11) NOT NULL DEFAULT 0,
  `max_retries` int(11) NOT NULL DEFAULT 3,
  `next_retry_at` timestamp NULL DEFAULT NULL,
  `error_details` text DEFAULT NULL,
  `last_error` varchar(255) DEFAULT NULL,
  `message_id` varchar(190) DEFAULT NULL,
  `bounced_at` timestamp NULL DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT 5,
  `bounce_notified_at` timestamp NULL DEFAULT NULL,
  `gw_mode` varchar(10) DEFAULT NULL,
  `sender_name` varchar(190) DEFAULT NULL,
  `reply_to_addr` varchar(190) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_outbox_status_retry` (`status`,`next_retry_at`),
  KEY `idx_outbox_order` (`order_id`),
  KEY `idx_outbox_tpl` (`template_code`),
  KEY `idx_outbox_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_outbox`
--

/*!40000 ALTER TABLE `email_outbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_outbox` ENABLE KEYS */;

--
-- Table structure for table `email_template_versions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_template_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `version_num` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `html` mediumtext NOT NULL,
  `edited_by_email` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_template_versions`
--

/*!40000 ALTER TABLE `email_template_versions` DISABLE KEYS */;
INSERT IGNORE INTO `email_template_versions` VALUES
(1,3,1,'Following up on your inquiry — {{company_name}}','<p>Hi {{customer_name}},</p><p>Thanks for your interest in our software. A member of our team will reach out shortly to assist you.</p>','admin@maventechsoftware.com','2026-06-12 10:26:56'),
(2,3,2,'fgdfgdsgdsffgsdgsdg','<p>Hi {{customer_name}},</p><p>Thanks for your interest in our software. A member of our team will reach out shortly to assist you.</p>','admin@maventechsoftware.com','2026-06-12 10:28:57'),
(3,3,3,'fgdfgdsgdsffgsdgsdg','<p>Hi {{customer_name}},</p><p>Thanks for your interest in our software. A member of our team will reach out shortly to assist you.</p>','admin@maventechsoftware.com','2026-06-12 10:29:08'),
(4,3,4,'','<p>Hi {{customer_name}},</p><p>Thanks for your interest in our software. A member of our team will reach out shortly to assist you.</p>','admin@maventechsoftware.com','2026-06-12 10:29:14'),
(5,1,1,'Your Microsoft product key — Order #{{order_number}}','','admin@maventechsoftware.com','2026-06-12 10:35:27');
/*!40000 ALTER TABLE `email_template_versions` ENABLE KEYS */;

--
-- Table structure for table `email_templates`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(60) NOT NULL,
  `name` varchar(120) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `html` mediumtext NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `current_version` int(11) NOT NULL DEFAULT 1,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_templates`
--

/*!40000 ALTER TABLE `email_templates` DISABLE KEYS */;
INSERT IGNORE INTO `email_templates` VALUES
(2,'order_pending','Order Pending Payment','Order {{order_number}} — payment pending · {{company_name}}','<!doctype html><html><body style=\"margin:0;padding:0;background:#fffbeb;font-family:Segoe UI,Helvetica,Arial,sans-serif;color:#1f2937;\">\n<div style=\"max-width:640px;margin:0 auto;padding:30px 16px;\">\n  <div style=\"background:#fff;border-radius:18px;overflow:hidden;box-shadow:0 6px 28px rgba(15,23,42,.06);\">\n    <!-- Brand header -->\n    <div style=\"background:#fff;padding:24px 32px;border-bottom:1px solid #f1f3f5;display:flex;align-items:center;justify-content:space-between;\">\n      <div>\n        <div style=\"font-size:20px;font-weight:800;color:#0f172a;\">\n          <img src=\"{{brand_logo_src}}\" alt=\"\" height=\"28\" style=\"display:inline-block;height:28px;width:auto;max-width:140px;border-radius:7px;margin-right:8px;vertical-align:-6px;\">{{company_name}}\n        </div>\n        <div style=\"font-size:10px;color:#94a3b8;letter-spacing:1.8px;font-weight:600;margin-top:2px;\">AUTHORIZED MICROSOFT RESELLER</div>\n      </div>\n      <span style=\"font-size:11px;color:#92400e;font-weight:700;background:#fef3c7;padding:6px 12px;border-radius:999px;\">&#9203; PAYMENT PENDING</span>\n    </div>\n\n    <div style=\"padding:30px 32px;\">\n      <h1 style=\"margin:0 0 6px;font-size:22px;color:#0f172a;font-weight:700;\">Almost there, {{customer_name}}!</h1>\n      <p style=\"margin:0 0 18px;font-size:14px;color:#475569;line-height:1.6;\">\n        Your order has been placed but we haven&rsquo;t received your payment yet. Once it&rsquo;s confirmed, we&rsquo;ll email you the license key + step-by-step install guide instantly.\n      </p>\n\n      <!-- Order summary -->\n      <table width=\"100%\" style=\"border-collapse:separate;border-spacing:0;background:#f8fafc;border-radius:12px;margin-bottom:20px;font-size:13px;color:#475569;\">\n        <tr>\n          <td style=\"padding:14px 18px;\">Order #<br><strong style=\"color:#0f172a;font-size:15px;\">{{order_number}}</strong></td>\n          <td style=\"padding:14px 18px;\">Amount Due<br><strong style=\"color:#0f172a;font-size:15px;\">${{amount}}</strong></td>\n          <td style=\"padding:14px 18px;\">Account<br><strong style=\"color:#0f172a;font-size:13px;\">{{customer_email}}</strong></td>\n        </tr>\n      </table>\n\n      <!-- Statement / merchant name notice -->\n      <div style=\"border:1px solid #bfdbfe;background:#eff6ff;border-radius:12px;padding:16px;margin:0 0 20px;\">\n        <div style=\"font-weight:700;color:#1e40af;font-size:14px;margin-bottom:6px;\">&#128179; Look for this on your statement</div>\n        <p style=\"margin:0;font-size:13px;color:#1e3a8a;line-height:1.6;\">\n          When the charge goes through, it will appear as\n          <strong style=\"font-family:\'SF Mono\',Menlo,monospace;background:#fff;padding:2px 8px;border-radius:6px;letter-spacing:1px;color:#1d4ed8;\">{{statement_name}}</strong>\n          on your card or bank statement. There&rsquo;s no need to do anything else &mdash; we&rsquo;ll send delivery as soon as it clears.\n        </p>\n      </div>\n\n      <!-- What happens next -->\n      <h2 style=\"font-size:15px;color:#0f172a;margin:24px 0 10px;\">What happens next?</h2>\n      <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr><td style=\"padding:10px 14px;background:#f0f9ff;border-radius:10px;border:1px solid #bfdbfe;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#3b82f6,#1d4ed8);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">1</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">Payment confirmation</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">We&rsquo;ll verify the transaction (usually within minutes for cards &middot; up to 1 hour for PayPal).</div></td>\n          </tr></table>\n        </td></tr>\n        <tr><td style=\"height:8px;\"></td></tr>\n        <tr><td style=\"padding:10px 14px;background:#fff7ed;border-radius:10px;border:1px solid #fed7aa;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#f59e0b,#d97706);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">2</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">License key delivery</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">You&rsquo;ll get a second email with the genuine key, official download link and full activation guide.</div></td>\n          </tr></table>\n        </td></tr>\n        <tr><td style=\"height:8px;\"></td></tr>\n        <tr><td style=\"padding:10px 14px;background:#ecfdf5;border-radius:10px;border:1px solid #a7f3d0;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#10b981,#047857);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">3</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">Install &amp; activate</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">Run the installer, sign in with a Microsoft Account and enter the key &mdash; activation is instant.</div></td>\n          </tr></table>\n        </td></tr>\n      </table>\n\n      <!-- Support + AI chat -->\n      <div style=\"margin-top:24px;background:linear-gradient(135deg,#f5f3ff,#ede9fe);border:1px solid #c7d2fe;border-radius:14px;padding:18px;\">\n        <div style=\"font-weight:700;color:#5b21b6;font-size:14px;margin-bottom:6px;\">&#129302; Need help right now?</div>\n        <p style=\"margin:0 0 12px;font-size:13px;color:#475569;line-height:1.6;\">Our <strong>AI chat assistant</strong> is online 24/7 to answer questions about your order, activation or compatibility &mdash; right inside our website.</p>\n        <a href=\"{{site_url}}/?openchat=1\" style=\"display:inline-block;padding:10px 22px;background:linear-gradient(135deg,#7c3aed,#5b21b6);color:#fff;border-radius:999px;text-decoration:none;font-weight:700;font-size:13px;\">&#128172; Open Live Chat</a>\n        <a href=\"mailto:{{support_email}}\" style=\"display:inline-block;padding:10px 22px;border:1px solid #c7d2fe;color:#5b21b6;border-radius:999px;text-decoration:none;font-weight:700;font-size:13px;margin-left:6px;\">&#9993; Email Support</a>\n      </div>\n\n      <p style=\"font-size:12px;color:#64748b;margin-top:20px;\">\n        Already paid? Please ignore this email &mdash; you&rsquo;ll receive your license key as soon as your payment is verified.\n      </p>\n    </div>\n\n    <div style=\"background:#f8fafc;padding:18px 32px;border-top:1px solid #f1f3f5;font-size:12px;color:#64748b;text-align:center;\">\n      <strong style=\"color:#0f172a;\">Need help?</strong> <a href=\"mailto:{{support_email}}\" style=\"color:#3b82f6;text-decoration:none;\">{{support_email}}</a> &middot; {{support_phone}}<br>\n      <span style=\"font-size:11px;color:#94a3b8;\">&copy; {{year}} {{company_name}}. All rights reserved.</span>\n    </div>\n  </div>\n</div>{{tracking_pixel}}</body></html>',1,1,'2026-10-13 17:13:41'),
(3,'lead_followup','Lead Follow-up','Hi {{customer_name}} — saved your cart at {{company_name}} (10% off inside)','<!doctype html><html><body style=\"margin:0;padding:0;background:#f8fafc;font-family:Segoe UI,Helvetica,Arial,sans-serif;color:#1f2937;\">\n<div style=\"max-width:620px;margin:0 auto;padding:30px 16px;\">\n  <div style=\"background:#fff;border-radius:18px;overflow:hidden;box-shadow:0 6px 28px rgba(15,23,42,.06);\">\n    <!-- Brand header -->\n    <div style=\"background:#fff;padding:24px 32px;border-bottom:1px solid #f1f3f5;display:flex;align-items:center;justify-content:space-between;\">\n      <div>\n        <div style=\"font-size:20px;font-weight:800;color:#0f172a;letter-spacing:.3px;\">\n          <img src=\"{{brand_logo_src}}\" alt=\"\" height=\"28\" style=\"display:inline-block;height:28px;width:auto;max-width:140px;border-radius:7px;margin-right:8px;vertical-align:-6px;\">{{company_name}}\n        </div>\n        <div style=\"font-size:10px;color:#94a3b8;letter-spacing:1.8px;font-weight:600;margin-top:2px;\">AUTHORIZED MICROSOFT RESELLER</div>\n      </div>\n      <span style=\"font-size:11px;color:#2563eb;font-weight:700;background:#dbeafe;padding:6px 12px;border-radius:999px;\">&#128075; CHECKING IN</span>\n    </div>\n\n    <div style=\"padding:30px 32px;\">\n      <h1 style=\"margin:0 0 8px;font-size:22px;color:#0f172a;font-weight:700;\">Hi {{customer_name}}, still thinking it over?</h1>\n      <p style=\"margin:0 0 18px;font-size:14px;color:#475569;line-height:1.65;\">\n        We noticed you were browsing genuine Microsoft license keys on our store but didn&rsquo;t finish checking out. No worries &mdash; we&rsquo;re saving your cart for you, and we wanted to make sure you have everything you need to decide.\n      </p>\n\n      <!-- Why buy from us -->\n      <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" style=\"margin:0 0 22px;\">\n        <tr>\n          <td style=\"padding:14px;background:#ecfdf5;border:1px solid #a7f3d0;border-radius:12px;width:33%;text-align:center;\">\n            <div style=\"font-size:22px;\">&#10003;</div>\n            <div style=\"font-weight:700;color:#065f46;font-size:13px;margin-top:4px;\">100% Genuine</div>\n            <div style=\"font-size:11.5px;color:#475569;margin-top:2px;\">Direct from authorized channels</div>\n          </td>\n          <td style=\"width:8px;\"></td>\n          <td style=\"padding:14px;background:#eff6ff;border:1px solid #bfdbfe;border-radius:12px;width:33%;text-align:center;\">\n            <div style=\"font-size:22px;\">&#9889;</div>\n            <div style=\"font-weight:700;color:#1e40af;font-size:13px;margin-top:4px;\">Instant Delivery</div>\n            <div style=\"font-size:11.5px;color:#475569;margin-top:2px;\">Email within 15&ndash;30 minutes</div>\n          </td>\n          <td style=\"width:8px;\"></td>\n          <td style=\"padding:14px;background:#fff7ed;border:1px solid #fed7aa;border-radius:12px;width:33%;text-align:center;\">\n            <div style=\"font-size:22px;\">&#127942;</div>\n            <div style=\"font-weight:700;color:#9a3412;font-size:13px;margin-top:4px;\">Lifetime License</div>\n            <div style=\"font-size:11.5px;color:#475569;margin-top:2px;\">One purchase, no subscription</div>\n          </td>\n        </tr>\n      </table>\n\n      <!-- Exclusive discount -->\n      <div style=\"background:linear-gradient(135deg,#fef3c7,#fde68a);border:1px dashed #f59e0b;border-radius:14px;padding:18px;text-align:center;margin:0 0 24px;\">\n        <div style=\"font-size:12px;color:#92400e;letter-spacing:1.5px;font-weight:700;\">EXCLUSIVE OFFER &middot; JUST FOR YOU</div>\n        <div style=\"font-size:26px;font-weight:800;color:#0f172a;margin:6px 0;\">10% OFF your order</div>\n        <div style=\"font-size:13px;color:#78350f;\">Use code <code style=\"background:#fff;padding:3px 10px;border-radius:6px;font-weight:700;letter-spacing:1px;\">WELCOME10</code> at checkout</div>\n      </div>\n\n      <div style=\"text-align:center;margin:0 0 20px;\">\n        <a href=\"{{site_url}}/shop.php\" style=\"display:inline-block;padding:13px 34px;background:linear-gradient(135deg,#3b82f6,#1d4ed8);color:#fff;border-radius:999px;text-decoration:none;font-weight:700;box-shadow:0 6px 18px rgba(59,130,246,.35);\">Continue Shopping &rarr;</a>\n      </div>\n\n      <!-- Questions / chat -->\n      <div style=\"background:#f8fafc;border-radius:12px;padding:16px;border:1px solid #e2e8f0;font-size:13px;color:#475569;line-height:1.7;\">\n        <strong style=\"color:#0f172a;\">Questions before you buy?</strong> Reply to this email, call us, or chat with our <strong>AI assistant</strong> on the site &mdash; we&rsquo;re here Mon&ndash;Sat to help you pick the right product.\n      </div>\n    </div>\n\n    <div style=\"background:#f8fafc;padding:18px 32px;border-top:1px solid #f1f3f5;font-size:12px;color:#64748b;text-align:center;\">\n      <strong style=\"color:#0f172a;\">Talk to a human:</strong> <a href=\"mailto:{{support_email}}\" style=\"color:#3b82f6;text-decoration:none;\">{{support_email}}</a> &middot; {{support_phone}}<br>\n      <span style=\"font-size:11px;color:#94a3b8;\">&copy; {{year}} {{company_name}}. All rights reserved.</span>\n    </div>\n  </div>\n</div>{{tracking_pixel}}</body></html>',1,5,'2026-10-13 17:13:41'),
(4,'refund_confirm','Refund Confirmation','Refund initiated for order {{order_number}} — {{company_name}}','<!doctype html><html><body style=\"margin:0;padding:0;background:#f8fafc;font-family:Segoe UI,Helvetica,Arial,sans-serif;color:#1f2937;\">\n<div style=\"max-width:620px;margin:0 auto;padding:30px 16px;\">\n  <div style=\"background:#fff;border-radius:18px;overflow:hidden;box-shadow:0 6px 28px rgba(15,23,42,.06);\">\n    <!-- Brand header -->\n    <div style=\"background:#fff;padding:24px 32px;border-bottom:1px solid #f1f3f5;display:flex;align-items:center;justify-content:space-between;\">\n      <div>\n        <div style=\"font-size:20px;font-weight:800;color:#0f172a;\">\n          <img src=\"{{brand_logo_src}}\" alt=\"\" height=\"28\" style=\"display:inline-block;height:28px;width:auto;max-width:140px;border-radius:7px;margin-right:8px;vertical-align:-6px;\">{{company_name}}\n        </div>\n        <div style=\"font-size:10px;color:#94a3b8;letter-spacing:1.8px;font-weight:600;margin-top:2px;\">AUTHORIZED MICROSOFT RESELLER</div>\n      </div>\n      <span style=\"font-size:11px;color:#7e22ce;font-weight:700;background:#f3e8ff;padding:6px 12px;border-radius:999px;\">&#128179; REFUND INITIATED</span>\n    </div>\n\n    <div style=\"padding:30px 32px;\">\n      <h1 style=\"margin:0 0 8px;font-size:22px;color:#0f172a;font-weight:700;\">Your refund is on its way, {{customer_name}}</h1>\n      <p style=\"margin:0 0 18px;font-size:14px;color:#475569;line-height:1.65;\">\n        We&rsquo;ve initiated the refund for your order. The amount will be credited back to the <strong>same bank account / card</strong> you used at checkout. Most banks process this within <strong>3&ndash;5 business working days</strong>, though some may take a little longer depending on their settlement schedule.\n      </p>\n\n      <!-- Refund summary -->\n      <table width=\"100%\" style=\"border-collapse:separate;border-spacing:0;background:#f8fafc;border-radius:12px;margin-bottom:22px;font-size:13px;color:#475569;\">\n        <tr>\n          <td style=\"padding:14px 18px;\">Order #<br><strong style=\"color:#0f172a;font-size:15px;\">{{order_number}}</strong></td>\n          <td style=\"padding:14px 18px;\">Refund Amount<br><strong style=\"color:#059669;font-size:15px;\">${{amount}}</strong></td>\n          <td style=\"padding:14px 18px;\">Initiated<br><strong style=\"color:#0f172a;font-size:13px;\">Today</strong></td>\n        </tr>\n      </table>\n\n      <!-- Timeline -->\n      <h2 style=\"font-size:15px;color:#0f172a;margin:0 0 10px;\">When will I see the money?</h2>\n      <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr><td style=\"padding:12px 14px;background:#ecfdf5;border-radius:10px;border:1px solid #a7f3d0;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#10b981,#047857);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">&#10003;</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">Refund initiated today</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">We&rsquo;ve pushed the reversal to our payment processor.</div></td>\n          </tr></table>\n        </td></tr>\n        <tr><td style=\"height:8px;\"></td></tr>\n        <tr><td style=\"padding:12px 14px;background:#f0f9ff;border-radius:10px;border:1px solid #bfdbfe;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#3b82f6,#1d4ed8);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">&#9201;</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">3&ndash;5 business working days</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">The amount will appear in your authorized bank account / card statement.</div></td>\n          </tr></table>\n        </td></tr>\n        <tr><td style=\"height:8px;\"></td></tr>\n        <tr><td style=\"padding:12px 14px;background:#fff7ed;border-radius:10px;border:1px solid #fed7aa;\">\n          <table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr>\n            <td valign=\"top\" width=\"46\"><div style=\"background:linear-gradient(135deg,#f59e0b,#d97706);color:#fff;font-weight:700;width:36px;height:36px;border-radius:50%;text-align:center;line-height:36px;\">&#9888;</div></td>\n            <td valign=\"top\" style=\"padding-left:8px;\"><div style=\"font-weight:700;color:#0f172a;\">Don&rsquo;t see it after 5 business days?</div><div style=\"font-size:13px;color:#475569;margin-top:2px;\">Reach out and we&rsquo;ll share the bank reference / ARN so your bank can locate it.</div></td>\n          </tr></table>\n        </td></tr>\n      </table>\n\n      <!-- Apology box -->\n      <div style=\"margin-top:22px;background:linear-gradient(135deg,#fef3c7,#fff7ed);border:1px solid #fed7aa;border-radius:14px;padding:18px;\">\n        <div style=\"font-weight:700;color:#92400e;font-size:14px;margin-bottom:6px;\">We&rsquo;re truly sorry for the inconvenience.</div>\n        <p style=\"margin:0;font-size:13px;color:#78350f;line-height:1.65;\">\n          Whatever made the experience fall short of your expectations, we&rsquo;d love to hear about it. A quick reply with what went wrong helps us do better for the next customer &mdash; and we&rsquo;d be grateful if you gave us another chance in the future.\n        </p>\n      </div>\n    </div>\n\n    <div style=\"background:#f8fafc;padding:18px 32px;border-top:1px solid #f1f3f5;font-size:12px;color:#64748b;text-align:center;\">\n      <strong style=\"color:#0f172a;\">Questions about your refund?</strong> <a href=\"mailto:{{support_email}}\" style=\"color:#3b82f6;text-decoration:none;\">{{support_email}}</a> &middot; {{support_phone}}<br>\n      <span style=\"font-size:11px;color:#94a3b8;\">Reference order <strong>{{order_number}}</strong> in your reply &middot; &copy; {{year}} {{company_name}}.</span>\n    </div>\n  </div>\n</div>{{tracking_pixel}}</body></html>',1,1,'2026-10-13 17:13:41'),
(5,'review_request','Review Request (post-purchase feedback)','How was your purchase, {{customer_name}}? — quick 1-tap review','<!doctype html><html><body style=\"margin:0;padding:0;background:#f8fafc;font-family:Segoe UI,Helvetica,Arial,sans-serif;color:#1f2937;\">\n<div style=\"max-width:620px;margin:0 auto;padding:30px 16px;\">\n  <div style=\"background:#fff;border-radius:18px;overflow:hidden;box-shadow:0 6px 28px rgba(15,23,42,.06);\">\n    <!-- Brand header -->\n    <div style=\"background:linear-gradient(135deg,#0ea5e9,#2563eb);padding:28px 32px;text-align:center;color:#fff;\">\n      <div style=\"display:inline-block;background:rgba(255,255,255,.18);border-radius:14px;padding:8px 14px;font-weight:800;font-size:22px;letter-spacing:.3px;\">\n        <img src=\"{{brand_logo_src}}\" alt=\"\" height=\"28\" style=\"display:inline-block;height:28px;width:auto;max-width:140px;border-radius:7px;margin-right:8px;vertical-align:-6px;\">{{company_name}}\n      </div>\n      <div style=\"font-size:11px;letter-spacing:1.8px;font-weight:600;margin-top:8px;opacity:.95;\">AUTHORIZED MICROSOFT RESELLER</div>\n    </div>\n\n    <div style=\"padding:32px;\">\n      <h1 style=\"margin:0 0 8px;font-size:24px;color:#0f172a;font-weight:700;text-align:center;\">How did we do, {{customer_name}}?</h1>\n      <p style=\"margin:0 0 4px;color:#475569;text-align:center;font-size:14px;line-height:1.6;\">We hope you&rsquo;re loving <strong style=\"color:#0f172a;\">{{product_name}}</strong>.<br>Tap a star below &mdash; one click sends us your rating.</p>\n\n      <div style=\"text-align:center;margin:24px 0 6px;\">\n        <a href=\"{{review_url}}&rating=1\" style=\"text-decoration:none;display:inline-block;margin:0 4px;font-size:42px;line-height:1;color:#f59e0b;text-shadow:0 2px 6px rgba(245,158,11,0.35);\" title=\"Rate 1 star\">&#9733;</a><a href=\"{{review_url}}&rating=2\" style=\"text-decoration:none;display:inline-block;margin:0 4px;font-size:42px;line-height:1;color:#f59e0b;text-shadow:0 2px 6px rgba(245,158,11,0.35);\" title=\"Rate 2 stars\">&#9733;</a><a href=\"{{review_url}}&rating=3\" style=\"text-decoration:none;display:inline-block;margin:0 4px;font-size:42px;line-height:1;color:#f59e0b;text-shadow:0 2px 6px rgba(245,158,11,0.35);\" title=\"Rate 3 stars\">&#9733;</a><a href=\"{{review_url}}&rating=4\" style=\"text-decoration:none;display:inline-block;margin:0 4px;font-size:42px;line-height:1;color:#f59e0b;text-shadow:0 2px 6px rgba(245,158,11,0.35);\" title=\"Rate 4 stars\">&#9733;</a><a href=\"{{review_url}}&rating=5\" style=\"text-decoration:none;display:inline-block;margin:0 4px;font-size:42px;line-height:1;color:#f59e0b;text-shadow:0 2px 6px rgba(245,158,11,0.35);\" title=\"Rate 5 stars\">&#9733;</a>\n      </div>\n      <p style=\"text-align:center;font-size:12px;color:#94a3b8;margin:0 0 22px;\">\n        <strong style=\"color:#f59e0b;\">1</strong> = needs work &nbsp;&middot;&nbsp; <strong style=\"color:#f59e0b;\">5</strong> = excellent\n      </p>\n\n      <!-- AI-assist card -->\n      <div style=\"background:linear-gradient(135deg,#eef2ff,#f5f3ff);border:1px solid #c7d2fe;border-radius:14px;padding:18px;margin:0 0 20px;\">\n        <div style=\"font-weight:700;color:#3730a3;font-size:14px;margin-bottom:4px;\">&#10024; Need help finding the words?</div>\n        <div style=\"font-size:13px;color:#475569;line-height:1.6;\">After you pick a star rating, our <strong>AI assistant</strong> can draft a thoughtful comment for you in one click &mdash; or you can write it manually. Either way, your feedback helps thousands of other customers.</div>\n      </div>\n\n      <div style=\"text-align:center;margin:0 0 22px;\">\n        <a href=\"{{review_url}}\" style=\"display:inline-block;padding:13px 34px;background:linear-gradient(135deg,#3b82f6,#1d4ed8);color:#fff;border-radius:999px;text-decoration:none;font-weight:700;box-shadow:0 6px 18px rgba(59,130,246,.35);\">Write a full review &rarr;</a>\n      </div>\n\n      <div style=\"text-align:center;border-top:1px solid #f1f3f5;padding-top:18px;margin-top:14px;\">\n        <div style=\"font-size:13px;color:#0f172a;font-weight:600;\">Thanks for your valuable feedback!</div>\n        <div style=\"font-size:12px;color:#94a3b8;margin-top:4px;\">Your review helps us keep prices low and service genuine.</div>\n      </div>\n    </div>\n\n    <div style=\"background:#f8fafc;padding:18px 32px;border-top:1px solid #f1f3f5;font-size:12px;color:#64748b;text-align:center;\">\n      <strong style=\"color:#0f172a;\">Need help?</strong> <a href=\"mailto:{{support_email}}\" style=\"color:#3b82f6;text-decoration:none;\">{{support_email}}</a> &middot; {{support_phone}}<br>\n      <span style=\"font-size:11px;color:#94a3b8;\">&copy; {{year}} {{company_name}}. All rights reserved.</span>\n    </div>\n  </div>\n</div>{{tracking_pixel}}</body></html>',1,1,'2026-10-13 17:13:41');
/*!40000 ALTER TABLE `email_templates` ENABLE KEYS */;

--
-- Table structure for table `email_unsubscribes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `email_unsubscribes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(190) NOT NULL,
  `reason` varchar(120) NOT NULL DEFAULT '',
  `source` varchar(40) NOT NULL DEFAULT 'link',
  `unsubscribed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_unsubscribes`
--

/*!40000 ALTER TABLE `email_unsubscribes` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_unsubscribes` ENABLE KEYS */;

--
-- Table structure for table `faqs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT IGNORE INTO `faqs` VALUES
(1,'Are these genuine Microsoft Office licenses?','Yes, all our licenses are genuine and sourced from authorized software clearing houses. Every license key is verified for authenticity before delivery.'),
(2,'What is a perpetual license?','A perpetual license means you own the software forever with a one-time purchase. There are no recurring subscription fees, and you can use the software for as long as you want.'),
(3,'How quickly will I receive my license key?','License keys are delivered via email within 15-30 minutes of successful payment confirmation. You will receive download instructions along with your activation key.'),
(4,'Can I install this on multiple computers?','Each license is valid for one device. If you need licenses for multiple computers, please contact our sales team for volume discounts.'),
(5,'What if I need technical support?','Our expert support team is available Monday through Saturday, 9 AM to 6 PM EST. We provide free professional support for installation, activation, and any issues you may encounter.'),
(6,'Is my payment information secure?','Absolutely. Our checkout is SSL-encrypted and PCI-compliant. We never store your payment details on our servers and use trusted payment processors for all transactions.');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;

--
-- Table structure for table `form_rate_limit`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `form_rate_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_hash` varchar(64) NOT NULL,
  `form` varchar(24) NOT NULL DEFAULT 'contact',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_ip_form` (`ip_hash`,`form`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_rate_limit`
--

/*!40000 ALTER TABLE `form_rate_limit` DISABLE KEYS */;
INSERT IGNORE INTO `form_rate_limit` VALUES
(2,'47f7877e5451e2cd854d9f4f95015240a7dfc7986c41099f30e97c11e6db299c','contact','2026-10-01 09:57:03'),
(3,'47f7877e5451e2cd854d9f4f95015240a7dfc7986c41099f30e97c11e6db299c','contact','2026-10-01 10:03:55'),
(1,'47f7877e5451e2cd854d9f4f95015240a7dfc7986c41099f30e97c11e6db299c','volume','2026-10-01 09:56:15'),
(4,'47f7877e5451e2cd854d9f4f95015240a7dfc7986c41099f30e97c11e6db299c','volume','2026-10-01 12:32:18');
/*!40000 ALTER TABLE `form_rate_limit` ENABLE KEYS */;

--
-- Table structure for table `gsc_queries`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `gsc_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `impressions` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `ctr` decimal(8,4) NOT NULL DEFAULT 0.0000,
  `position` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cluster_key` varchar(120) NOT NULL DEFAULT '',
  `uploaded_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_query` (`query`),
  KEY `idx_cluster` (`cluster_key`),
  KEY `idx_impr` (`impressions`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gsc_queries`
--

/*!40000 ALTER TABLE `gsc_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `gsc_queries` ENABLE KEYS */;

--
-- Table structure for table `lead_notes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `lead_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `author_name` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lead_notes`
--

/*!40000 ALTER TABLE `lead_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lead_notes` ENABLE KEYS */;

--
-- Table structure for table `license_keys`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `license_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_slug` varchar(191) NOT NULL,
  `license_key` varchar(120) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'available',
  `order_id` int(11) DEFAULT NULL,
  `assigned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `region` varchar(8) NOT NULL DEFAULT 'US',
  PRIMARY KEY (`id`),
  KEY `idx_lk_slug_status` (`product_slug`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license_keys`
--

/*!40000 ALTER TABLE `license_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `license_keys` ENABLE KEYS */;

--
-- Table structure for table `newsletter_subscribers`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `source` varchar(60) NOT NULL DEFAULT 'footer',
  `ip` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletter_subscribers`
--

/*!40000 ALTER TABLE `newsletter_subscribers` DISABLE KEYS */;
INSERT IGNORE INTO `newsletter_subscribers` VALUES
(1,'pat+cf73efccc2@offer.aibusinesssites.com','footer','104.28.160.252','2026-09-22 23:36:04');
/*!40000 ALTER TABLE `newsletter_subscribers` ENABLE KEYS */;

--
-- Table structure for table `newsletters`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `preheader` varchar(255) NOT NULL DEFAULT '',
  `body_html` mediumtext NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `total_recipients` int(11) NOT NULL DEFAULT 0,
  `sent_count` int(11) NOT NULL DEFAULT 0,
  `blog_post_id` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `sent_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;

--
-- Table structure for table `order_items`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_slug` varchar(191) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `country` varchar(5) NOT NULL DEFAULT 'US',
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL DEFAULT 'card',
  `currency` varchar(5) NOT NULL DEFAULT 'USD',
  `subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `pro_assist` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `gw_mode` varchar(10) NOT NULL DEFAULT 'test',
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_status` varchar(20) NOT NULL DEFAULT 'delivered',
  `stripe_session_id` varchar(120) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `card_statement_name` varchar(120) DEFAULT NULL,
  `region` varchar(8) NOT NULL DEFAULT 'US',
  `ip_address` varchar(45) DEFAULT NULL,
  `card_brand` varchar(30) DEFAULT NULL,
  `card_type` varchar(20) DEFAULT NULL,
  `billing_country` varchar(8) DEFAULT NULL,
  `timeline` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`timeline`)),
  `card_last4` varchar(4) DEFAULT NULL,
  `card_bin` varchar(6) DEFAULT NULL,
  `card_cvv_status` varchar(24) DEFAULT NULL,
  `card_exp` varchar(7) DEFAULT NULL,
  `card_country` varchar(8) DEFAULT NULL,
  `card_funding` varchar(20) DEFAULT NULL,
  `paypal_funding_source` varchar(40) DEFAULT NULL,
  `paypal_payer_email` varchar(180) DEFAULT NULL,
  `paypal_payer_id` varchar(60) DEFAULT NULL,
  `paypal_funding_card_brand` varchar(30) DEFAULT NULL,
  `paypal_funding_card_last4` varchar(4) DEFAULT NULL,
  `paypal_funding_bank_name` varchar(60) DEFAULT NULL,
  `transaction_id` varchar(120) DEFAULT NULL,
  `subscription_plan` varchar(64) DEFAULT NULL,
  `risk_score` smallint(6) DEFAULT NULL,
  `risk_level` varchar(20) NOT NULL DEFAULT '',
  `company_name` varchar(120) NOT NULL DEFAULT '',
  `payment_intent_id` varchar(120) NOT NULL DEFAULT '',
  `payment_status` varchar(24) DEFAULT NULL,
  `payment_error_code` varchar(80) DEFAULT NULL,
  `payment_error_message` varchar(500) DEFAULT NULL,
  `payment_attempts` int(11) NOT NULL DEFAULT 0,
  `last_activity_at` datetime DEFAULT NULL,
  `recovery_email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `admin_cancelled` tinyint(1) NOT NULL DEFAULT 0,
  `retry_token` char(40) DEFAULT NULL,
  `forensics` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `idx_payment_status` (`payment_status`),
  KEY `idx_recovery_sweep` (`recovery_email_sent`,`last_activity_at`),
  KEY `idx_retry_token` (`retry_token`),
  KEY `idx_orders_created` (`created_at`),
  KEY `idx_orders_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `pages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `pages` (
  `slug` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `updated` varchar(50) DEFAULT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT IGNORE INTO `pages` VALUES
('activation-help','Activation Help','December 2024','<p class=\"lead\">Having trouble activating your software? Follow these guides to resolve common activation issues.</p>\n\n<h2>Microsoft Office Activation</h2>\n<h3><i class=\"bi bi-wifi text-success me-2\"></i>Online Activation (Recommended)</h3>\n<ol><li>Open any Office app (Word, Excel, PowerPoint)</li><li>Sign in with your Microsoft account</li><li>Go to File &gt; Account</li><li>Click \"Change License\" or \"Activate Product\"</li><li>Enter your 25-character product key</li><li>Click \"Activate\" and follow the prompts</li></ol>\n<h3><i class=\"bi bi-telephone-fill text-primary me-2\"></i>Phone Activation</h3>\n<p>If online activation fails:</p>\n<ol><li>Open any Office app</li><li>Go to File &gt; Account &gt; Activate Product</li><li>Select \"I want to activate by telephone\"</li><li>Call the number provided</li><li>Follow the automated system to complete activation</li></ol>\n\n<h2>Windows Activation</h2>\n<h3><i class=\"bi bi-wifi text-success me-2\"></i>Activate Windows Online</h3>\n<ol><li>Open Settings (Windows key + I)</li><li>Go to Update &amp; Security &gt; Activation</li><li>Click \"Change product key\"</li><li>Enter your 25-character license key</li><li>Click \"Next\" to activate</li></ol>\n<h3><i class=\"bi bi-telephone-fill text-primary me-2\"></i>Activate Windows by Phone</h3>\n<ol><li>Open Command Prompt as Administrator</li><li>Type: <code>slui 4</code> and press Enter</li><li>Select your country</li><li>Call the provided number</li><li>Follow the automated prompts</li></ol>\n\n<h2>Common Activation Errors</h2>\n<div class=\"alert alert-danger d-flex gap-3 align-items-start\"><i class=\"bi bi-x-octagon-fill fs-4 flex-shrink-0\"></i><div><strong>\"Product key has already been used\"</strong><br><em>Possible causes:</em> key previously activated on another device, or a typing error.<ul class=\"mb-0 mt-1\"><li>Double-check the key is entered correctly</li><li>If purchased from us, contact support with your order number</li><li>We will verify and assist with activation</li></ul></div></div>\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div><strong>\"Product key is not valid\"</strong><br><em>Possible causes:</em> wrong product for the key, or key entered with errors.<ul class=\"mb-0 mt-1\"><li>Verify you\'re installing the correct product version</li><li>Check for similar characters (0 vs O, 1 vs I)</li><li>Remove any extra spaces</li><li>Contact support if the issue persists</li></ul></div></div>\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-cloud-slash-fill fs-4 flex-shrink-0\"></i><div><strong>\"Unable to reach activation servers\"</strong><ul class=\"mb-0 mt-1\"><li>Check your internet connection</li><li>Disable VPN if active</li><li>Temporarily disable firewall/antivirus</li><li>Try again later (servers may be busy)</li></ul></div></div>\n\n<h2>Activation Limits</h2>\n<h3>How many devices can I activate?</h3>\n<table class=\"table table-bordered align-middle\" style=\"max-width:520px;\">\n<thead><tr><th>Product</th><th>Activation Limit</th></tr></thead>\n<tbody>\n<tr><td><i class=\"bi bi-house-fill text-primary me-1\"></i>Office Home</td><td><span class=\"badge text-bg-primary\">1 PC or Mac</span></td></tr>\n<tr><td><i class=\"bi bi-briefcase-fill text-primary me-1\"></i>Office Professional</td><td><span class=\"badge text-bg-primary\">1 PC</span></td></tr>\n<tr><td><i class=\"bi bi-windows text-primary me-1\"></i>Windows 10/11</td><td><span class=\"badge text-bg-primary\">1 PC</span></td></tr>\n</tbody>\n</table>\n\n<h2>Contact Support</h2>\n<p>If you\'re still having activation issues:</p>\n<ul>\n<li><strong>Email:</strong> <a href=\"mailto:{{company_email}}\">{{company_email}}</a></li>\n<li><strong>Phone:</strong> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></li>\n<li><strong>Live Chat:</strong> Available on our website</li>\n</ul>\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-lightbulb-fill fs-4 flex-shrink-0\"></i><div><strong>Please have ready:</strong><ul class=\"mb-0 mt-1\"><li>Your order number</li><li>Product key (first 5 characters only)</li><li>Error message received</li></ul></div></div>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('affiliate-program','Affiliate Program',NULL,'<p class=\"lead\">Earn competitive commissions promoting genuine Microsoft software. Industry-leading payouts, real-time tracking, marketing assets and dedicated affiliate managers. Apply today.</p>'),
('contact-us','Contact Us',NULL,'<p class=\"lead\">Reach our team anytime via phone, email or live chat. Phone: {{support_phone}} • Email: {{company_email}} • Hours: Monday-Saturday, 9 AM-6 PM EST.</p>'),
('cookie-policy','Cookie Policy','January 1, 2026','<p class=\"lead\">We use a small number of cookies to keep the store working smoothly and understand how it is used. Here\'s the full picture.</p>\n\n<h2><i class=\"bi bi-cookie text-primary me-2\"></i>Types of Cookies We Use</h2>\n<table class=\"table table-bordered align-middle\">\n<thead><tr><th>Type</th><th>Purpose</th><th>Duration</th></tr></thead>\n<tbody>\n<tr><td><span class=\"badge text-bg-danger\">Essential</span></td><td>Shopping cart, checkout session, sign-in state</td><td>Session</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Preferences</span></td><td>Your currency and light/dark theme choice</td><td>Up to 12 months</td></tr>\n<tr><td><span class=\"badge text-bg-info\">Analytics</span></td><td>Anonymous usage statistics that help us improve</td><td>Up to 12 months</td></tr>\n</tbody>\n</table>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-shield-fill-check fs-4 flex-shrink-0\"></i><div><strong>No advertising trackers.</strong> We do not use third-party advertising cookies, and we never sell browsing data.</div></div>\n\n<h2><i class=\"bi bi-sliders text-primary me-2\"></i>Managing Cookies</h2>\n<ul>\n<li>Every modern browser lets you block or delete cookies in its privacy settings</li>\n<li>Blocking <strong>essential</strong> cookies may prevent the cart and checkout from working</li>\n<li>Preference cookies simply reset your currency and theme if removed</li>\n</ul>\n\n<p>For more on how we handle data, read our <a href=\"page.php?slug=privacy-policy\">Privacy Policy</a>.</p>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('customer-reviews','Customer Reviews',NULL,'<p class=\"lead\">4.6/5 from 5,519+ verified Shopper Approved reviews. Read what our customers say about authenticity, delivery speed, and support quality.</p>'),
('disclaimer','Disclaimer','January 1, 2026','<p class=\"lead\">Please read this disclaimer carefully before using our website or purchasing from our store.</p>\n\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>Independent reseller.</strong> {{company_name}} is an independent reseller of genuine software licenses. We are not affiliated with, endorsed by, or sponsored by Microsoft Corporation, Bitdefender, or McAfee. All product names, logos, and brands are property of their respective owners and are used for identification purposes only.</div></div>\n\n<h2><i class=\"bi bi-card-checklist text-primary me-2\"></i>Product Information</h2>\n<ul>\n<li>We make every effort to keep product descriptions, pricing, and availability accurate and current</li>\n<li>Specifications ultimately come from the software vendor and may change without notice</li>\n<li>Screenshots and imagery are illustrative and may differ from the latest software versions</li>\n</ul>\n\n<h2><i class=\"bi bi-link-45deg text-primary me-2\"></i>External Links</h2>\n<p>Our site links to official vendor resources (for example, setup.office.com) for downloads and activation. We are not responsible for the content or availability of external websites.</p>\n\n<h2><i class=\"bi bi-exclamation-octagon-fill text-warning me-2\"></i>Warranty &amp; Liability</h2>\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div>The website and its content are provided \"as is\" without warranties of any kind. Software functionality is warranted by its vendor under the vendor\'s own license terms. Our liability is limited as described in our <a href=\"page.php?slug=terms-of-service\">Terms of Service</a>.</div></div>\n\n<h2><i class=\"bi bi-patch-check-fill text-success me-2\"></i>What We Do Stand Behind</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<tbody>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Genuine, activatable license keys</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Instant digital delivery by email</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Free installation &amp; activation support</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>30-day money-back guarantee</td></tr>\n</tbody>\n</table>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('do-not-sell','Do Not Sell My Personal Information','January 1, 2026','<p class=\"lead\">Under the California Consumer Privacy Act (CCPA) and similar laws, you have the right to opt out of the sale of your personal information.</p>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-shield-fill-check fs-4 flex-shrink-0\"></i><div><strong>Good news: we do not sell personal information — including mobile phone numbers and SMS opt-in consent, which are never shared with third parties or affiliates for marketing.</strong> Not for money, not in exchange for services — period. Your data is used only to fulfil orders and provide support.</div></div>\n\n<h2><i class=\"bi bi-person-fill-lock text-primary me-2\"></i>Your Privacy Rights</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:640px;\">\n<thead><tr><th>Right</th><th>Our response time</th></tr></thead>\n<tbody>\n<tr><td><span class=\"badge text-bg-primary\">Know</span> what data we hold about you</td><td>Within 30 days</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Delete</span> your personal data</td><td>Within 30 days</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Opt out</span> of any future data sale</td><td>Immediate — already our default</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Non-discrimination</span> for exercising rights</td><td>Always</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-envelope-paper-fill text-primary me-2\"></i>How to Submit a Request</h2>\n<ol>\n<li>Email <a href=\"mailto:{{company_email}}\">{{company_email}}</a> with the subject \"Privacy Request\"</li>\n<li>Tell us which right you want to exercise</li>\n<li>Include the email address used on your orders so we can verify your identity</li>\n</ol>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('faqs','FAQs',NULL,'<p class=\"lead\">Quick answers to the questions we hear most often. Can\'t find yours? <a href=\"contact.php\">Contact us</a> any time.</p>\n\n<h2><span class=\"badge text-bg-primary me-2\"><i class=\"bi bi-box-seam\"></i></span>Orders &amp; Delivery</h2>\n<p><strong>How fast is delivery?</strong> License keys are emailed within 15–30 minutes of payment — usually just a few minutes. No physical shipment, ever.</p>\n<p><strong>Where do I find my key after purchase?</strong> In your order confirmation email, and any time under <a href=\"account.php\">My Account</a> (verify your order email to view orders and keys).</p>\n\n<h2><span class=\"badge text-bg-success me-2\"><i class=\"bi bi-key\"></i></span>Licensing</h2>\n<p><strong>Are these genuine licenses?</strong> Yes — every key is a genuine product license that activates directly with the official vendor (Microsoft, Bitdefender, McAfee).</p>\n<p><strong>Is this a subscription?</strong> No. Unless a product clearly states a term (e.g., antivirus 1-year plans), Office and Windows licenses are one-time purchases for lifetime use on one device.</p>\n<table class=\"table table-bordered align-middle\" style=\"max-width:560px;\">\n<thead><tr><th>License type</th><th>Term</th><th>Devices</th></tr></thead>\n<tbody>\n<tr><td>Office 2019/2021/2024</td><td><span class=\"badge text-bg-success\">Lifetime</span></td><td>1 PC or Mac</td></tr>\n<tr><td>Windows 10/11</td><td><span class=\"badge text-bg-success\">Lifetime</span></td><td>1 PC</td></tr>\n<tr><td>Antivirus plans</td><td><span class=\"badge text-bg-warning text-dark\">1–2 Years</span></td><td>As stated per plan</td></tr>\n</tbody>\n</table>\n\n<h2><span class=\"badge text-bg-warning text-dark me-2\"><i class=\"bi bi-credit-card\"></i></span>Payments &amp; Refunds</h2>\n<p><strong>Which payment methods are accepted?</strong> Visa, Mastercard, American Express, PayPal, Apple Pay, and Google Pay. Payments are processed over a secure encrypted connection.</p>\n<p><strong>What is the refund policy?</strong> A 30-day money-back guarantee applies. Start a request on the <a href=\"returns.php\">Return &amp; Refund</a> page or read the full <a href=\"page.php?slug=refund-policy\">Refund Policy</a>.</p>\n\n<h2><span class=\"badge text-bg-info me-2\"><i class=\"bi bi-headset\"></i></span>Support</h2>\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>Free installation help is included with every order.</strong> Email, call, or use live chat and we\'ll walk you through setup step by step.</div></div>\n\n<div class=\"card p-4 my-4\" style=\"background: rgba(37,99,235,.05);\"><h5 class=\"fw-bold mb-2\"><i class=\"bi bi-building-fill-check text-primary me-2\"></i>About This Store</h5><p class=\"small mb-2\">This website is operated by <strong>{{company_name}}</strong>, an independent reseller of genuine software licenses. We are not Microsoft, Bitdefender, or McAfee; all trademarks belong to their respective owners.</p><div class=\"row small g-2\"><div class=\"col-md-6\"><i class=\"bi bi-geo-alt-fill text-primary me-1\"></i>101 NW 83rd St, Kansas City, MO 64118, United States</div><div class=\"col-md-6\"><i class=\"bi bi-envelope-fill text-primary me-1\"></i><a href=\"mailto:{{company_email}}\">{{company_email}}</a></div><div class=\"col-md-6\"><i class=\"bi bi-telephone-fill text-primary me-1\"></i><a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></div><div class=\"col-md-6\"><i class=\"bi bi-clock-fill text-primary me-1\"></i>Mon–Fri 9 AM – 6 PM EST</div></div></div>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('help-center','Help Center','December 2024','<p class=\"lead\">Find answers to common questions and get the support you need for your software purchases.</p>\n\n<div class=\"row g-3 my-3\">\n  <div class=\"col-md-6\"><a href=\"page.php?slug=installation-guide\" class=\"card p-3 h-100 text-decoration-none d-flex flex-row align-items-center gap-3\"><i class=\"bi bi-download fs-3 text-primary\"></i><span><strong class=\"d-block\">Installation Guide</strong><small class=\"text-secondary\">Step-by-step installation instructions</small></span></a></div>\n  <div class=\"col-md-6\"><a href=\"page.php?slug=activation-help\" class=\"card p-3 h-100 text-decoration-none d-flex flex-row align-items-center gap-3\"><i class=\"bi bi-key-fill fs-3 text-success\"></i><span><strong class=\"d-block\">Activation Help</strong><small class=\"text-secondary\">How to activate your software</small></span></a></div>\n  <div class=\"col-md-6\"><a href=\"page.php?slug=refund-policy\" class=\"card p-3 h-100 text-decoration-none d-flex flex-row align-items-center gap-3\"><i class=\"bi bi-arrow-counterclockwise fs-3 text-warning\"></i><span><strong class=\"d-block\">Refund Policy</strong><small class=\"text-secondary\">Our 30-day money-back guarantee</small></span></a></div>\n  <div class=\"col-md-6\"><a href=\"contact.php\" class=\"card p-3 h-100 text-decoration-none d-flex flex-row align-items-center gap-3\"><i class=\"bi bi-chat-dots-fill fs-3 text-info\"></i><span><strong class=\"d-block\">Contact Us</strong><small class=\"text-secondary\">Get in touch with our team</small></span></a></div>\n</div>\n\n<h2>Frequently Asked Questions</h2>\n\n<h3><span class=\"badge text-bg-primary me-2\"><i class=\"bi bi-box-seam\"></i></span>Orders &amp; Delivery</h3>\n<p><strong>How will I receive my product?</strong> All products are delivered digitally via email. You will receive your license key and download instructions within minutes of purchase.</p>\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div><strong>I haven\'t received my order. What should I do?</strong><ul class=\"mb-0 mt-1\"><li>Check your spam/junk folder</li><li>Verify the email address used at checkout</li><li>Wait up to 24 hours for processing</li><li>Contact our support team if you still haven\'t received it</li></ul></div></div>\n<p><strong>Can I get a physical copy?</strong> We only offer digital delivery. No physical products are shipped.</p>\n\n<h3><span class=\"badge text-bg-success me-2\"><i class=\"bi bi-key\"></i></span>Installation &amp; Activation</h3>\n<p><strong>How do I install my software?</strong> See our <a href=\"page.php?slug=installation-guide\">Installation Guide</a> for detailed step-by-step instructions.</p>\n<div class=\"alert alert-danger d-flex gap-3 align-items-start\"><i class=\"bi bi-x-octagon-fill fs-4 flex-shrink-0\"></i><div><strong>My license key isn\'t working. What should I do?</strong><ul class=\"mb-0 mt-1\"><li>Ensure you\'re entering the key correctly (no extra spaces)</li><li>Make sure you\'re using the right version of the software</li><li>Check our <a href=\"page.php?slug=activation-help\">Activation Help</a> page</li><li>Contact support if issues persist</li></ul></div></div>\n\n<h3><span class=\"badge text-bg-warning text-dark me-2\"><i class=\"bi bi-credit-card\"></i></span>Payments &amp; Refunds</h3>\n<p><strong>What payment methods do you accept?</strong> We accept Visa, Mastercard, American Express, PayPal, Apple Pay, and Google Pay.</p>\n<table class=\"table table-bordered align-middle\" style=\"max-width:560px;\">\n<thead><tr><th>Topic</th><th>Our Policy</th></tr></thead>\n<tbody>\n<tr><td><i class=\"bi bi-arrow-counterclockwise text-warning me-1\"></i>Refund window</td><td>30-day money-back guarantee</td></tr>\n<tr><td><i class=\"bi bi-lightning-charge-fill text-warning me-1\"></i>Delivery time</td><td>Typically 15–30 minutes by email</td></tr>\n<tr><td><i class=\"bi bi-credit-card-fill text-primary me-1\"></i>Billing</td><td>One-time payment — no subscription, no hidden fees</td></tr>\n</tbody>\n</table>\n<p><strong>Can I get a refund?</strong> Yes, we offer a 30-day money-back guarantee. See our <a href=\"page.php?slug=refund-policy\">Refund Policy</a> for details, or start a request on the <a href=\"returns.php\">Return &amp; Refund</a> page.</p>\n\n<div class=\"card p-4 my-4\" style=\"background: rgba(37,99,235,.05);\"><h5 class=\"fw-bold mb-2\"><i class=\"bi bi-building-fill-check text-primary me-2\"></i>About This Store</h5><p class=\"small mb-2\">This website is operated by <strong>{{company_name}}</strong>, an independent reseller of genuine software licenses. We are not Microsoft, Bitdefender, or McAfee; all trademarks belong to their respective owners.</p><div class=\"row small g-2\"><div class=\"col-md-6\"><i class=\"bi bi-geo-alt-fill text-primary me-1\"></i>101 NW 83rd St, Kansas City, MO 64118, United States</div><div class=\"col-md-6\"><i class=\"bi bi-envelope-fill text-primary me-1\"></i><a href=\"mailto:{{company_email}}\">{{company_email}}</a></div><div class=\"col-md-6\"><i class=\"bi bi-telephone-fill text-primary me-1\"></i><a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></div><div class=\"col-md-6\"><i class=\"bi bi-clock-fill text-primary me-1\"></i>Mon–Fri 9 AM – 6 PM EST</div></div></div>\n\n<h2>Contact Support</h2>\n<p>Still need help? Our support team is ready to assist:</p>\n<ul>\n<li><strong>Email:</strong> <a href=\"mailto:{{company_email}}\">{{company_email}}</a></li>\n<li><strong>Phone:</strong> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></li>\n<li><strong>Live Chat:</strong> Available on our website</li>\n<li><strong>Hours:</strong> Monday–Friday, 9 AM – 6 PM EST</li>\n</ul>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('installation-guide','Installation Guide','December 2024','<p class=\"lead\">Follow these step-by-step instructions to install your software.</p>\n\n<h2>Before You Begin</h2>\n<h3>System Requirements</h3>\n<div class=\"row g-3 my-2\">\n  <div class=\"col-md-6\"><div class=\"card p-3 h-100\"><strong class=\"text-primary\"><i class=\"bi bi-file-earmark-word-fill me-2\"></i>For Microsoft Office</strong><ul class=\"small mb-0 mt-2\"><li>Windows 10 or later / macOS 10.14 or later</li><li>4GB RAM (8GB recommended)</li><li>4GB available disk space</li><li>Internet connection for activation</li></ul></div></div>\n  <div class=\"col-md-6\"><div class=\"card p-3 h-100\"><strong class=\"text-primary\"><i class=\"bi bi-windows me-2\"></i>For Windows OS</strong><ul class=\"small mb-0 mt-2\"><li>1 GHz processor</li><li>4GB RAM (8GB for Windows 11)</li><li>64GB storage (Windows 11 requires 64GB+)</li><li>DirectX 12 compatible graphics</li></ul></div></div>\n</div>\n\n<h2>Microsoft Office Installation</h2>\n<h3><span class=\"badge text-bg-primary me-2\">1</span>Download Office</h3>\n<ol><li>Visit <a href=\"https://setup.office.com\" target=\"_blank\" rel=\"noopener\">setup.office.com</a></li><li>Sign in with your Microsoft account (or create one)</li><li>Enter your 25-character product key</li><li>Click \"Install Office\"</li></ol>\n<h3><span class=\"badge text-bg-primary me-2\">2</span>Run the Installer</h3>\n<ol><li>Open the downloaded file</li><li>Click \"Yes\" if prompted by User Account Control</li><li>Wait for Office to download and install</li></ol>\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div>This may take <strong>15–30 minutes</strong> depending on your internet speed.</div></div>\n<h3><span class=\"badge text-bg-primary me-2\">3</span>Activate Office</h3>\n<ol><li>Open any Office application (Word, Excel, etc.)</li><li>Sign in with your Microsoft account</li><li>Your license will be activated automatically</li></ol>\n\n<h2>Windows Installation</h2>\n<h3><span class=\"badge text-bg-success me-2\">1</span>Create Installation Media</h3>\n<ol><li>Download the Windows Media Creation Tool from Microsoft</li><li>Run the tool and select \"Create installation media\"</li><li>Choose USB flash drive (8GB minimum)</li><li>Follow the prompts to create bootable media</li></ol>\n<h3><span class=\"badge text-bg-success me-2\">2</span>Install Windows</h3>\n<ol><li>Insert the USB drive and restart your computer</li><li>Boot from the USB drive (press F12, F2, or Del during startup)</li><li>Follow the Windows setup wizard</li><li>Enter your product key when prompted</li></ol>\n<h3><span class=\"badge text-bg-success me-2\">3</span>Activate Windows</h3>\n<ol><li>Go to Settings &gt; Update &amp; Security &gt; Activation</li><li>Click \"Change product key\"</li><li>Enter your 25-character license key</li><li>Click \"Next\" to activate</li></ol>\n\n<h2>Troubleshooting</h2>\n<div class=\"alert alert-danger d-flex gap-3 align-items-start\"><i class=\"bi bi-x-octagon-fill fs-4 flex-shrink-0\"></i><div><strong>\"Product key already used\" error</strong><ul class=\"mb-0 mt-1\"><li>Ensure you\'re using a new, unused key</li><li>Contact support if you purchased a new license</li></ul></div></div>\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div><strong>Installation stuck or frozen</strong><ul class=\"mb-0 mt-1\"><li>Check your internet connection</li><li>Disable antivirus temporarily</li><li>Restart the installation</li></ul></div></div>\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>Activation failed</strong><ul class=\"mb-0 mt-1\"><li>Verify your product key is entered correctly</li><li>Ensure you have an internet connection</li><li>See our <a href=\"page.php?slug=activation-help\">Activation Help</a> page</li></ul></div></div>\n\n<h2>Need Help?</h2>\n<p>If you encounter any issues:</p>\n<ul>\n<li><strong>Email:</strong> <a href=\"mailto:{{company_email}}\">{{company_email}}</a></li>\n<li><strong>Phone:</strong> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></li>\n<li><strong>Live Chat:</strong> Available on our website</li>\n</ul>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('my-account','My Account',NULL,'<p class=\"lead\">Manage your orders, view your license keys, update billing details, and access support tickets. Sign in to your {{company_name}} account for instant access to your purchase history and downloadable software.</p>'),
('payment-policy','Payment Policy','January 1, 2026','<p class=\"lead\">Clear pricing, trusted payment providers, and bank-grade security on every transaction.</p>\n\n<h2><i class=\"bi bi-credit-card-fill text-primary me-2\"></i>Accepted Payment Methods</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>Method</th><th>Notes</th></tr></thead>\n<tbody>\n<tr><td><span class=\"pay-badge me-1\">VISA</span><span class=\"pay-badge me-1\">MC</span><span class=\"pay-badge\">AMEX</span></td><td>All major credit and debit cards — entered on PCI-DSS compliant hosted card fields</td></tr>\n<tr><td><span class=\"pay-badge\">PayPal</span></td><td>Pay with your PayPal balance, a linked bank account, or a debit/credit card as a PayPal guest</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-currency-exchange text-primary me-2\"></i>Currencies</h2>\n<p>Prices can be <strong>displayed</strong> in <strong>USD, EUR, GBP, CAD, and AUD</strong> — select your currency from the menu in the site header and totals update automatically. Payments are <strong>charged in USD</strong> unless your currency is shown as the checkout currency; the exact amount you will be charged is always displayed on the checkout page before you pay, and your bank converts it at its own rate.</p>\n\n<h2><i class=\"bi bi-shield-lock-fill text-primary me-2\"></i>Payment Security</h2>\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-lock-fill fs-4 flex-shrink-0\"></i><div><ul class=\"mb-0\"><li>SSL encryption on every page</li><li>PCI-DSS compliant processing through trusted providers</li><li>We never see or store your full card number</li></ul></div></div>\n\n<h2><i class=\"bi bi-receipt-cutoff text-primary me-2\"></i>Billing Notes</h2>\n<ul>\n<li>Software licenses are <strong>one-time charges</strong> — no auto-renewal, no hidden subscription</li>\n<li>Antivirus plans state their term clearly (e.g., 1 year); they do not renew automatically through us</li>\n<li>Your statement will show a descriptor referencing our store</li>\n<li>Orders flagged by fraud screening may be delayed up to 24 hours or refunded</li>\n</ul>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('privacy-policy','Privacy Policy','January 1, 2026','<p class=\"lead\">Your privacy matters to us. This policy explains what information we collect, why we collect it, and the choices you have.</p>\n\n<h2><i class=\"bi bi-clipboard-data-fill text-primary me-2\"></i>Information We Collect</h2>\n<table class=\"table table-bordered align-middle\">\n<thead><tr><th>Category</th><th>Examples</th><th>Why we need it</th></tr></thead>\n<tbody>\n<tr><td><strong>Order details</strong></td><td>Name, email, billing country</td><td>To deliver your license and receipt</td></tr>\n<tr><td><strong>Payment data</strong></td><td>Processed by our payment providers</td><td>To complete your purchase securely — we never store card numbers</td></tr>\n<tr><td><strong>Support history</strong></td><td>Messages, chat transcripts</td><td>To resolve your questions faster</td></tr>\n<tr><td><strong>Usage data</strong></td><td>Pages visited, device type</td><td>To improve the store experience</td></tr>\n<tr><td><strong>Phone number</strong></td><td>Mobile number you give us at checkout, on the contact form or in chat</td><td>To reach you about your order, a requested call-back, or by text message where you have opted in</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-gear-fill text-primary me-2\"></i>How We Use Your Information</h2>\n<ul>\n<li>Delivering license keys and order confirmations by email</li>\n<li>Providing installation, activation, and refund support</li>\n<li>Preventing fraud and securing your account</li>\n<li>Improving our website, catalog, and service quality</li>\n</ul>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-shield-fill-check fs-4 flex-shrink-0\"></i><div><strong>We never sell your personal and SMS consent information.</strong> Data is shared only with the service providers required to complete your order (payment processing, email delivery) — nothing more. Mobile phone numbers and SMS opt-in consent are never sold, rented or shared with third parties or affiliates for marketing purposes. See <a href=\"page.php?slug=do-not-sell\">Do Not Sell My Info</a>.</div></div>\n\n<h2 id=\"sms-policy\"><i class=\"bi bi-chat-dots-fill text-primary me-2\"></i>SMS / Text Messaging Policy</h2>\n<p>If you provide your mobile number and opt in (by ticking the SMS consent box on our forms, asking for a call-back or text in chat, or texting us first), {{company_name}} may send you text messages about your order and support requests. Consent to receive texts is <strong>not</strong> a condition of purchase.</p>\n<table class=\"table table-bordered align-middle\">\n<tbody>\n<tr><td style=\"width:220px;\"><strong>What we may text you</strong></td><td>Order confirmations, license-key delivery notices, activation and installation help, call-back scheduling, and replies to your support requests. Promotional texts are sent only if you separately opt in to them.</td></tr>\n<tr><td><strong>Message frequency</strong></td><td>Varies — typically 1–5 messages per order or support conversation.</td></tr>\n<tr><td><strong>Cost</strong></td><td>Message and data rates may apply according to your mobile plan. Carriers are not liable for delayed or undelivered messages.</td></tr>\n<tr><td><strong>Opt out</strong></td><td>Reply <strong>STOP</strong> to any message to cancel at any time; you will receive a one-time confirmation and no further texts. Reply <strong>HELP</strong> for help, or contact <a href=\"mailto:{{company_email}}\">{{company_email}}</a> / <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a>.</td></tr>\n<tr><td><strong>No sharing of SMS consent</strong></td><td>Your mobile number and SMS opt-in consent are <strong>never sold, rented or shared</strong> with third parties or affiliates for marketing or promotional purposes. They are shared only with the messaging provider that transmits the texts you requested, and only for that purpose.</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-person-fill-check text-primary me-2\"></i>Your Rights</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>Right</th><th>What it means</th></tr></thead>\n<tbody>\n<tr><td><span class=\"badge text-bg-primary\">Access</span></td><td>Request a copy of the data we hold about you</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Correction</span></td><td>Ask us to fix inaccurate information</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Deletion</span></td><td>Ask us to erase your data, subject to legal retention rules</td></tr>\n<tr><td><span class=\"badge text-bg-primary\">Opt-out</span></td><td>Unsubscribe from marketing emails at any time; reply <strong>STOP</strong> to end text messages</td></tr>\n</tbody>\n</table>\n<p>To exercise any right, email <a href=\"mailto:{{company_email}}\">{{company_email}}</a> — we respond within 30 days.</p>\n\n<h2><i class=\"bi bi-lock-fill text-primary me-2\"></i>Data Security &amp; Retention</h2>\n<p>All traffic is protected with SSL encryption and payments are handled by PCI-compliant providers. Order records are retained only as long as required for accounting and warranty purposes.</p>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('refund-policy','Refund Policy','January 1, 2026','<p class=\"lead\">Your satisfaction is our top priority. Every order is backed by a straightforward <strong>30-day money-back guarantee — no questions asked</strong>.</p>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-patch-check-fill fs-4 flex-shrink-0\"></i><div><strong>30-Day Money-Back Guarantee — Full Refund, No Questions Asked.</strong><br>If you change your mind, order the wrong edition, or the product simply doesn&rsquo;t work for you, contact us within 30 days of purchase and we&rsquo;ll refund you in full. This applies to <strong>both defective and non-defective products</strong>.</div></div>\n\n<h2><i class=\"bi bi-list-check text-primary me-2\"></i>What&rsquo;s Covered</h2>\n<p>Our 30-day money-back guarantee covers <strong>every product we sell, for any reason</strong>. Because we deliver 100% digitally by email, there is nothing to package or mail back &mdash; just tell us you&rsquo;d like a refund and we&rsquo;ll process it.</p>\n<table class=\"table table-bordered align-middle\">\n<thead><tr><th>Situation</th><th>Refund</th></tr></thead>\n<tbody>\n<tr><td>Changed your mind (buyer&rsquo;s remorse)</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Full refund within 30 days</span></td></tr>\n<tr><td>Ordered the wrong edition or product</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Full refund or free exchange</span></td></tr>\n<tr><td>Key doesn&rsquo;t activate / product defective</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Full refund</span></td></tr>\n<tr><td>Order not received within 24 hours</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Full refund</span></td></tr>\n<tr><td>Not satisfied for any other reason</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Full refund within 30 days</span></td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-arrow-right-circle-fill text-primary me-2\"></i>How to Request a Refund</h2>\n<p>Because every product is delivered digitally by email, <strong>you never need to ship anything back to us</strong>. Just follow these three steps:</p>\n<ol>\n<li>Open the <a href=\"returns.php\"><strong>Return &amp; Refund Request</strong></a> page.</li>\n<li>Enter the email address you used at checkout and click <em>Find Orders</em>.</li>\n<li>Click <em>Request Refund</em> next to the order you would like refunded.</li>\n</ol>\n<p class=\"small text-secondary\">Prefer to contact us directly? Email <a href=\"mailto:{{company_email}}\">{{company_email}}</a> or call <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a> with your order number &mdash; we&rsquo;ll take care of it right away.</p>\n\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>No shipping required.</strong> All products on this store are digital license keys delivered by email. There is nothing to mail back &mdash; simply submit a refund request online and your money is on its way.</div></div>\n\n<h2><i class=\"bi bi-clock-history text-primary me-2\"></i>Processing Times</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:560px;\">\n<tbody>\n<tr><td><i class=\"bi bi-inbox-fill text-primary me-1\"></i>Request review</td><td>Within 24 hours</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Approval &amp; processing</td><td>1&ndash;2 business days</td></tr>\n<tr><td><i class=\"bi bi-bank text-primary me-1\"></i>Funds returned to your account</td><td>3&ndash;10 business days, depending on your bank</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-shield-check text-primary me-2\"></i>How &amp; Where Your Refund Is Issued</h2>\n<ul>\n<li>Refunds are always issued to the <strong>original payment method</strong> (credit card, PayPal, Apple Pay, Google Pay, or the card you used at checkout).</li>\n<li>We <strong>never</strong> ask for your card number, PIN, or bank details by email, phone, or chat &mdash; the refund is processed automatically by our payment provider.</li>\n<li>If your original card has been closed, contact us and we&rsquo;ll arrange the refund to a valid alternative payment method.</li>\n</ul>\n\n<h2><i class=\"bi bi-question-circle text-primary me-2\"></i>Frequently Asked Refund Questions</h2>\n<p><strong>Do I have to return the software or key before I get my refund?</strong><br>No. Because the product is digital, there is nothing to ship or return. Simply submit the online refund request &mdash; we&rsquo;ll disable the key on our side and issue your refund.</p>\n<p><strong>What if I already installed / activated the product?</strong><br>Your 30-day money-back guarantee still applies. Submit the request the same way and let our team know &mdash; we&rsquo;ll deactivate the license from our records and refund your payment.</p>\n<p><strong>Is there a restocking fee?</strong><br>No restocking fee. Ever. You get 100% of what you paid back.</p>\n<p><strong>What about subscription plans (Protection Hub)?</strong><br>The same 30-day money-back guarantee applies. Cancel any time in the first 30 days for a full refund of the amount charged.</p>\n\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('return-policy','Return Policy','January 1, 2026','<p class=\"lead\">This <strong>Return Policy</strong> explains what you can return, how to initiate a return, and what happens on our side after we receive your request. It works hand-in-hand with our <a href=\"refund-policy.php\">Refund Policy</a>, which explains the money side (how much is refunded, when it lands, to which payment method).</p>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-arrow-return-left fs-4 flex-shrink-0\"></i><div><strong>All products are digitally delivered by email. Nothing needs to be shipped back.</strong><br>To &ldquo;return&rdquo; a product simply means telling us you want to cancel it &mdash; we&rsquo;ll deactivate the license key on our records and issue a refund to the original payment method.</div></div>\n\n<h2><i class=\"bi bi-list-check text-primary me-2\"></i>What Can Be Returned</h2>\n<table class=\"table table-bordered align-middle\">\n<thead><tr><th>Product type</th><th>Return window</th><th>Notes</th></tr></thead>\n<tbody>\n<tr><td>Microsoft Office &amp; Windows license keys</td><td><span class=\"badge text-bg-success\">30 days</span></td><td>Return by cancellation — no shipment required</td></tr>\n<tr><td>Antivirus &amp; VPN subscriptions</td><td><span class=\"badge text-bg-success\">30 days</span></td><td>Return by cancellation — remaining term will be voided</td></tr>\n<tr><td>Protection Hub subscription plans</td><td><span class=\"badge text-bg-success\">30 days</span></td><td>Full return of the plan &mdash; recurring billing paused</td></tr>\n<tr><td>Products where the key was already activated</td><td><span class=\"badge text-bg-success\">30 days</span></td><td>Return still allowed &mdash; we&rsquo;ll deactivate on our side</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-1-circle-fill text-primary me-2\"></i>How to Initiate a Return</h2>\n<ol>\n<li>Visit our <a href=\"returns.php\"><strong>Returns page</strong></a>.</li>\n<li>Enter the email address you used at checkout and click <em>Find Orders</em>.</li>\n<li>Locate the order and click <em>Request Return</em>. A short form will collect the reason (optional but appreciated).</li>\n<li>You&rsquo;ll receive an email confirmation within a few minutes. Our team then processes the return (details below).</li>\n</ol>\n\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>Prefer to email or call?</strong> Send your order number to <a href=\"mailto:{{company_email}}\">{{company_email}}</a> or dial <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a> &mdash; we&rsquo;ll handle it manually. No online form required.</div></div>\n\n<h2><i class=\"bi bi-gear-wide-connected text-primary me-2\"></i>What Happens on Our Side</h2>\n<ol>\n<li><strong>Verification (within 24 hours).</strong> We match the request to your order and confirm the license key belongs to you.</li>\n<li><strong>Deactivation.</strong> The license key is deactivated in our vendor records so it cannot be re-used. You do not need to uninstall the software from your device &mdash; it will simply revert to an unactivated state at the vendor&rsquo;s next check.</li>\n<li><strong>Handoff to Refund Processing.</strong> Once the return is verified &amp; the key deactivated, we hand off to the refund pipeline &mdash; see our <a href=\"refund-policy.php\">Refund Policy</a> for how the money is returned (original payment method, 3&ndash;10 business days depending on your bank).</li>\n</ol>\n\n<h2><i class=\"bi bi-clock-history text-primary me-2\"></i>Timelines</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<tbody>\n<tr><td><i class=\"bi bi-inbox-fill text-primary me-1\"></i>Return request received</td><td>Instant email confirmation</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Team review &amp; verification</td><td>Within 24 hours</td></tr>\n<tr><td><i class=\"bi bi-shield-slash text-warning me-1\"></i>Key deactivation</td><td>Within 24 hours of verification</td></tr>\n<tr><td><i class=\"bi bi-bank text-primary me-1\"></i>Refund issued (see <a href=\"refund-policy.php\">Refund Policy</a>)</td><td>1&ndash;2 business days after verification</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-question-circle text-primary me-2\"></i>Frequently Asked Return Questions</h2>\n<p><strong>Do I have to physically return anything?</strong><br>No. Every product on this store is a digital license key delivered by email &mdash; there is nothing to package, print or ship. The whole return happens online.</p>\n<p><strong>Do I need to uninstall the software?</strong><br>No. We&rsquo;ll deactivate the key on the vendor side. At the vendor&rsquo;s next check the installation will revert to an unactivated state, and you can install a fresh key at any time.</p>\n<p><strong>Can I return part of an order (some keys but not all)?</strong><br>Yes &mdash; on the <a href=\"returns.php\">Returns page</a> select only the line items you wish to return. The remaining keys stay active.</p>\n<p><strong>What if I bought the wrong edition?</strong><br>Contact us instead of filing a return &mdash; we&rsquo;ll swap the key for the correct edition at no cost within the 30-day window.</p>\n<p><strong>Is there a re-stocking fee or return shipping fee?</strong><br>No fees. Ever. Digital products have zero return cost.</p>\n\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">Our support team is happy to walk you through any return &mdash; before or after you file it.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"returns.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\"><i class=\"bi bi-arrow-return-left me-1\"></i>Start a Return</a><a href=\"refund-policy.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Read Refund Policy</a></div></div>'),
('returns-refunds','Returns & Refunds',NULL,'<p class=\"lead\">We stand behind every license we sell with a straightforward <strong>30-day money-back guarantee &mdash; no questions asked</strong>.</p>\n\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-patch-check-fill fs-4 flex-shrink-0\"></i><div><strong>30-Day Money-Back Guarantee &mdash; Full Refund, No Questions Asked.</strong><br>Not happy with your purchase for any reason? Contact us within 30 days for a full refund. Applies to <strong>both defective and non-defective products</strong>.</div></div>\n\n<h2>Refund Eligibility</h2>\n<p>Because every product on this store is delivered digitally, <strong>there is nothing to ship back</strong>. Every order is eligible for a full refund within 30 days for any reason.</p>\n<table class=\"table table-bordered align-middle\">\n<thead><tr><th>Situation</th><th>Eligible?</th><th>What to do</th></tr></thead>\n<tbody>\n<tr><td>Changed your mind (buyer&rsquo;s remorse)</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Yes</span></td><td>Submit a request &mdash; full refund within 30 days</td></tr>\n<tr><td>Bought the wrong edition or product</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Yes</span></td><td>Full refund or free exchange</td></tr>\n<tr><td>Key doesn&rsquo;t activate / product defective</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Yes</span></td><td>Full refund &mdash; contact support first if you&rsquo;d like us to try to fix it</td></tr>\n<tr><td>Order not delivered within 24 hours</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Yes</span></td><td>Contact support or request refund</td></tr>\n<tr><td>Product already installed or activated</td><td><span class=\"badge text-bg-success\"><i class=\"bi bi-check-lg\"></i> Yes</span></td><td>Still eligible within 30 days &mdash; the license will be deactivated on our side</td></tr>\n</tbody>\n</table>\n\n<h2>How to Request a Refund</h2>\n<ol>\n<li>Go to the <a href=\"returns.php\"><strong>Return &amp; Refund Request</strong></a> page</li>\n<li>Enter the email address used for your order and click <em>Find Orders</em></li>\n<li>Click <em>Request Refund</em> next to the order</li>\n<li>Our team reviews the request and responds within 24 hours</li>\n</ol>\n\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-info-circle-fill fs-4 flex-shrink-0\"></i><div><strong>No shipping, no packaging, no fuss.</strong> Everything on this store is digital &mdash; you never need to mail anything back to receive your refund.</div></div>\n\n<h2>Processing Times</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:560px;\">\n<thead><tr><th>Step</th><th>Timeline</th></tr></thead>\n<tbody>\n<tr><td><i class=\"bi bi-inbox-fill text-primary me-1\"></i>Request review</td><td>Within 24 hours</td></tr>\n<tr><td><i class=\"bi bi-check-circle-fill text-success me-1\"></i>Approval &amp; processing</td><td>1&ndash;2 business days</td></tr>\n<tr><td><i class=\"bi bi-bank text-primary me-1\"></i>Funds back on your card/PayPal</td><td>3&ndash;10 business days (depends on your bank)</td></tr>\n</tbody>\n</table>\n\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div><strong>Please note:</strong> refunds are issued to the original payment method only. We never ask for your card number by email or phone.</div></div>\n\n<div class=\"text-center my-4\"><a href=\"returns.php\" class=\"btn btn-primary rounded-pill px-4 fw-semibold\">Start a Refund Request</a></div>\n\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('shipping-delivery','Shipping & Delivery','January 1, 2026','<p class=\"lead\">Everything we sell is delivered digitally — no boxes, no couriers, no waiting at the door.</p>\n\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-send-fill fs-4 flex-shrink-0\"></i><div><strong>100% digital delivery.</strong> No physical products are shipped. Your license key and download instructions arrive by email.</div></div>\n\n<h2><i class=\"bi bi-stopwatch-fill text-primary me-2\"></i>Delivery Timeline</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>Step</th><th>When</th></tr></thead>\n<tbody>\n<tr><td><i class=\"bi bi-receipt text-primary me-1\"></i>Order confirmation</td><td><span class=\"badge text-bg-success\">Instant</span></td></tr>\n<tr><td><i class=\"bi bi-key-fill text-primary me-1\"></i>License key email</td><td><span class=\"badge text-bg-primary\">15–30 minutes</span> (typically much faster)</td></tr>\n<tr><td><i class=\"bi bi-shield-exclamation text-primary me-1\"></i>Orders held for review</td><td>Up to 24 hours in rare cases</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-envelope-open-fill text-primary me-2\"></i>What Your Delivery Email Contains</h2>\n<ul>\n<li>Your 25-character product key</li>\n<li>Official download link for the software</li>\n<li>Step-by-step installation and activation instructions</li>\n<li>Your order number for support reference</li>\n</ul>\n\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div><strong>Haven\'t received your order?</strong><ul class=\"mb-0 mt-1\"><li>Check your spam/junk folder first</li><li>Confirm the email address used at checkout</li><li>View your order any time under <a href=\"account.php\">My Account</a></li><li>Still missing after 24 hours? <a href=\"contact.php\">Contact support</a></li></ul></div></div>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('terms-of-service','Terms of Service','January 1, 2026','<p class=\"lead\">These terms govern your use of our website and your purchase of software licenses from {{company_name}}. By placing an order, you agree to them.</p>\n\n<h2><span class=\"badge text-bg-primary me-2\">1</span>Who We Are</h2>\n<p>{{company_name}} is an independent reseller of genuine software licenses. We are not Microsoft, Bitdefender, or McAfee; all trademarks belong to their respective owners.</p>\n\n<h2><span class=\"badge text-bg-primary me-2\">2</span>Products &amp; Licensing</h2>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>License type</th><th>Term</th><th>Use rights</th></tr></thead>\n<tbody>\n<tr><td>Office / Windows retail licenses</td><td><span class=\"badge text-bg-success\">Lifetime</span></td><td>1 device unless stated otherwise</td></tr>\n<tr><td>Antivirus subscriptions</td><td><span class=\"badge text-bg-warning text-dark\">Term-based</span></td><td>Devices and duration as stated per plan</td></tr>\n</tbody>\n</table>\n<p>Each license is intended for activation by the purchaser. Resale of keys purchased from us is not permitted.</p>\n\n<h2><span class=\"badge text-bg-primary me-2\">3</span>Orders, Pricing &amp; Delivery</h2>\n<ul>\n<li>Prices are shown in your selected currency and confirmed at checkout</li>\n<li>Delivery is 100% digital — license keys arrive by email, typically within 15–30 minutes</li>\n<li>We may cancel and refund orders flagged by our fraud-prevention checks</li>\n</ul>\n\n<h2><span class=\"badge text-bg-primary me-2\">4</span>Acceptable Use</h2>\n<div class=\"row g-3 my-2\">\n<div class=\"col-md-6\"><div class=\"alert alert-success h-100 mb-0\"><strong><i class=\"bi bi-check-circle-fill me-1\"></i>You may</strong><ul class=\"mb-0 mt-1 small\"><li>Activate your license on the permitted device(s)</li><li>Request support for installation and activation</li><li>Transfer Office to a new device you own (where Microsoft permits)</li></ul></div></div>\n<div class=\"col-md-6\"><div class=\"alert alert-danger h-100 mb-0\"><strong><i class=\"bi bi-x-circle-fill me-1\"></i>You may not</strong><ul class=\"mb-0 mt-1 small\"><li>Resell or redistribute license keys</li><li>Use our content or branding without permission</li><li>Attempt to disrupt or misuse the website</li></ul></div></div>\n</div>\n\n<h2><span class=\"badge text-bg-primary me-2\">5</span>Refunds</h2>\n<p>Our money-back guarantee is described in the <a href=\"page.php?slug=refund-policy\">Refund Policy</a>. Requests can be started on the <a href=\"returns.php\">Return &amp; Refund</a> page.</p>\n\n<h2><span class=\"badge text-bg-primary me-2\">6</span>Liability</h2>\n<div class=\"alert alert-warning d-flex gap-3 align-items-start\"><i class=\"bi bi-exclamation-triangle-fill fs-4 flex-shrink-0\"></i><div>To the maximum extent permitted by law, our liability for any claim related to an order is limited to the amount you paid for that order. We are not liable for indirect or consequential losses.</div></div>\n\n<h2><span class=\"badge text-bg-primary me-2\">7</span>Changes &amp; Governing Law</h2>\n<p>We may update these terms from time to time; the version published here applies to new orders. These terms are governed by the laws of the State of Missouri, USA.</p>\n<h2 id=\"sms-terms\"><span class=\"badge text-bg-primary me-2\">8</span>Text Messaging (SMS) Terms</h2>\n<p>Customer-care text messages are an optional convenience. The disclosure below applies whenever you text us or opt in to receive texts from us; the full policy is in our <a href=\"page.php?slug=privacy-policy#sms-policy\">Privacy Policy</a>.</p>\n{{sms_disclosure}}\n\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5><p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p><p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p><div class=\"d-flex gap-2 flex-wrap\"><a href=\"contact.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Contact Us</a><a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>'),
('why-choose-us','Why Choose Us',NULL,'<p class=\"lead\">When you purchase Microsoft software, you deserve a partner who delivers genuine products, transparent pricing, and service that stands behind every order. Here is what sets {{company_name}} apart.</p>\n\n<h2><i class=\"bi bi-patch-check-fill text-success me-2\"></i>Genuine Products</h2>\n<h3>Authentic Licenses, Every Time</h3>\n<ul>\n<li>Sourced exclusively through authorized distribution channels</li>\n<li>Activates directly with Microsoft\'s own servers</li>\n<li>Eligible for official updates and vendor support</li>\n<li>Valid for the lifetime of the product — no subscription required</li>\n</ul>\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-shield-fill-check fs-4 flex-shrink-0\"></i><div><strong>Verified authenticity.</strong> Every key is validated end-to-end before delivery — your license stays active permanently and every product feature works exactly as Microsoft intended.</div></div>\n\n<h2><i class=\"bi bi-tags-fill text-warning me-2\"></i>Unbeatable Prices</h2>\n<p>Save up to <strong>70% off retail pricing</strong> without compromising authenticity. Our pricing advantage comes from structure, not shortcuts:</p>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>How we keep prices low</th><th>What it means for you</th></tr></thead>\n<tbody>\n<tr><td>Volume licensing partnerships</td><td>Wholesale rates passed directly to you</td></tr>\n<tr><td>Direct sourcing relationships</td><td>No middle-man markup on any product</td></tr>\n<tr><td>Lean, digital-only operations</td><td>Low overhead reflected in every price tag</td></tr>\n</tbody>\n</table>\n<div class=\"alert alert-info d-flex gap-3 align-items-start\"><i class=\"bi bi-cash-coin fs-4 flex-shrink-0\"></i><div><strong>Price match commitment.</strong> Found the same genuine product for less? <a href=\"contact.php\">Contact us</a> — we will do our best to match it.</div></div>\n\n<h2><i class=\"bi bi-lightning-charge-fill text-warning me-2\"></i>Instant Digital Delivery</h2>\n<ul>\n<li>No waiting on physical shipments — ever</li>\n<li>License keys delivered by email within 15–30 minutes</li>\n<li>Download links included with every order</li>\n<li>Automated delivery operates around the clock</li>\n</ul>\n<div class=\"alert alert-success d-flex gap-3 align-items-start\"><i class=\"bi bi-tree-fill fs-4 flex-shrink-0\"></i><div><strong>Greener by design.</strong> Digital delivery eliminates plastic packaging and shipping emissions entirely.</div></div>\n\n<h2><i class=\"bi bi-headset text-primary me-2\"></i>Expert Customer Support</h2>\n<p>Our specialists assist at every stage — from choosing the right edition to troubleshooting after installation.</p>\n<table class=\"table table-bordered align-middle\" style=\"max-width:620px;\">\n<thead><tr><th>Channel</th><th>Best for</th><th>Availability</th></tr></thead>\n<tbody>\n<tr><td><i class=\"bi bi-chat-dots-fill text-primary me-1\"></i>Live Chat</td><td>Instant answers</td><td>Mon–Sat, 9 AM–6 PM EST</td></tr>\n<tr><td><i class=\"bi bi-envelope-fill text-primary me-1\"></i>Email</td><td>Detailed assistance</td><td>Replies within 24 hours</td></tr>\n<tr><td><i class=\"bi bi-telephone-fill text-primary me-1\"></i>Phone</td><td>Personal guidance</td><td>Mon–Fri, 9 AM–6 PM EST</td></tr>\n<tr><td><i class=\"bi bi-life-preserver text-primary me-1\"></i>Help Center</td><td>Self-service guides</td><td>24/7</td></tr>\n</tbody>\n</table>\n\n<h2><i class=\"bi bi-people-fill text-primary me-2\"></i>Trusted by Thousands</h2>\n<ul>\n<li><strong>4.6+ star</strong> independent verified rating</li>\n<li><strong>50,000+</strong> satisfied customers worldwide</li>\n<li>Thousands of verified post-delivery reviews — <a href=\"reviews.php\">read them here</a></li>\n</ul>\n\n<h2><i class=\"bi bi-arrow-counterclockwise text-success me-2\"></i>30-Day Money-Back Guarantee</h2>\n<p>Shop with complete confidence: a full refund within 30 days, no interrogation, no hassle. Start any request from our <a href=\"returns.php\">Return &amp; Refund</a> page.</p>\n\n<h2><i class=\"bi bi-lock-fill text-primary me-2\"></i>Secure Shopping</h2>\n<ul>\n<li>SSL encryption across every page</li>\n<li>PCI-compliant payment processing through trusted providers</li>\n<li>Your data is never sold — see our <a href=\"page.php?slug=privacy-policy\">Privacy Policy</a></li>\n</ul>\n\n<h2>Ready to Experience the Difference?</h2>\n<ul>\n<li><strong>Email:</strong> <a href=\"mailto:{{company_email}}\">{{company_email}}</a></li>\n<li><strong>Phone:</strong> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></li>\n<li><strong>Live Chat:</strong> Available on our website</li>\n</ul>\n<div class=\"card p-4 mt-4\"><h5 class=\"fw-bold mb-2\">Questions about this policy?</h5>\n<p class=\"small text-secondary mb-2\">If you have any questions about this policy, please contact us.</p>\n<p class=\"small mb-3\"><a href=\"mailto:{{company_email}}\">{{company_email}}</a> <span class=\"text-secondary mx-1\">|</span> <a href=\"tel:{{support_phone_tel}}\">{{support_phone}}</a></p>\n<div class=\"d-flex gap-2 flex-wrap\"><a href=\"shop.php\" class=\"btn btn-sm btn-primary rounded-pill px-3\">Browse Products</a>\n<a href=\"index.php\" class=\"btn btn-sm btn-outline-primary rounded-pill px-3\">Back to Home</a></div></div>');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token_hash` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  `used_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user` (`user_id`),
  KEY `idx_token` (`token_hash`),
  KEY `idx_expires` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `proassist_schedules`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `proassist_schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_number` varchar(40) NOT NULL DEFAULT '',
  `customer_name` varchar(120) NOT NULL DEFAULT '',
  `customer_email` varchar(160) NOT NULL DEFAULT '',
  `customer_phone` varchar(40) NOT NULL DEFAULT '',
  `scheduled_at` datetime NOT NULL,
  `scheduled_utc` datetime NOT NULL,
  `tz` varchar(40) NOT NULL DEFAULT 'America/New_York',
  `status` enum('pending','confirmed','done','missed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_lead` (`lead_id`),
  KEY `idx_sched_utc` (`scheduled_utc`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proassist_schedules`
--

/*!40000 ALTER TABLE `proassist_schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `proassist_schedules` ENABLE KEYS */;

--
-- Table structure for table `product_ai_chats`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `product_ai_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_slug` varchar(160) NOT NULL,
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `session_id` varchar(64) NOT NULL DEFAULT '',
  `question` text NOT NULL,
  `answer` mediumtext DEFAULT NULL,
  `tokens_in` int(11) DEFAULT NULL,
  `tokens_out` int(11) DEFAULT NULL,
  `ms_latency` int(11) DEFAULT NULL,
  `helpful` tinyint(1) DEFAULT NULL,
  `user_ip` varchar(45) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_slug_time` (`product_slug`,`created_at`),
  KEY `idx_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_ai_chats`
--

/*!40000 ALTER TABLE `product_ai_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_ai_chats` ENABLE KEYS */;

--
-- Table structure for table `products`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) NOT NULL,
  `name` varchar(255) NOT NULL,
  `platform` varchar(20) NOT NULL DEFAULT 'Windows',
  `category` varchar(50) NOT NULL,
  `badge` varchar(50) DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  `rating` decimal(2,1) NOT NULL DEFAULT 4.5,
  `reviews` int(11) NOT NULL DEFAULT 0,
  `image` varchar(500) DEFAULT NULL,
  `apps` varchar(255) NOT NULL DEFAULT '',
  `region` varchar(8) NOT NULL DEFAULT 'US',
  `sku` varchar(80) DEFAULT NULL,
  `gtin` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `license_type` varchar(30) NOT NULL DEFAULT 'lifetime',
  `version` varchar(60) DEFAULT NULL,
  `brand` varchar(60) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_description` varchar(180) DEFAULT NULL,
  `seo_refreshed_at` datetime DEFAULT NULL,
  `ai_summary` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `activation_url_mode` varchar(10) NOT NULL DEFAULT 'ai',
  `install_url_mode` varchar(10) NOT NULL DEFAULT 'ai',
  `activation_url` varchar(500) DEFAULT NULL,
  `install_guide_url` varchar(500) DEFAULT NULL,
  `installer_url` varchar(500) DEFAULT NULL,
  `sold_base` int(11) NOT NULL DEFAULT 0,
  `meta_keywords` text DEFAULT NULL,
  `sale_starts_at` datetime DEFAULT NULL,
  `sale_ends_at` datetime DEFAULT NULL,
  `gallery_images` text DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT IGNORE INTO `products` VALUES
(1,'microsoft-office-2024-professional-plus-windows','Microsoft Office 2024 Professional Plus (Windows)','Windows','office-2024-pc','Best Seller',0,209.99,323.06,0.0,0,'/uploads/products/microsoft-office-2024-professional-plus-windows.webp','word,excel,powerpoint,outlook,access','US','SKU-04377215','2000411112963',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2024-professional-plus-windows','',129,'buy office 2024 professional plus, office 2024 professional plus product key, office 2024 professional plus price, office 2024 professional plus license, purchase office 2024 professional plus, buy office 2024 pro plus, office 2024 pro plus key',NULL,NULL,NULL,0),
(2,'microsoft-office-2024-professional-plus-lifetime-license-windows-pc','Microsoft Office 2024 Professional Plus Lifetime License Windows PC','Windows','office-2024-pc',NULL,0,219.99,338.45,0.0,0,'/uploads/products/microsoft-office-2024-professional-plus-windows.webp','word,excel,powerpoint,outlook,access','US','SKU-71CDA4E3','2005952661277',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2024-professional-plus-lifetime-license-windows-pc','https://c2rsetup-officeapps.b-cdn.net/Office%202024%20Pro%20Plus.exe',99,'buy office 2024 professional plus lifetime, office 2024 professional plus lifetime product key, office 2024 professional plus lifetime price, office 2024 professional plus lifetime license, purchase office 2024 professional plus lifetime, office 2024 lifetime license, office 2024 pro plus lifetime',NULL,NULL,NULL,0),
(3,'microsoft-office-home-2024-pc','Microsoft Office Home 2024 (PC)','Windows','office-2024-pc','Best Seller',1,126.99,195.37,0.0,0,'/uploads/products/microsoft-office-home-2024-pc.webp','word,excel,powerpoint','US','SKU-0F64EAAC','2006151039133',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-2024-pc','https://std.mscdn2024.com/Office_2024_EN_standard_64Bits.exe',102,'buy microsoft office home 2024, microsoft office home 2024 product key, microsoft office home 2024 price, microsoft office home 2024 license, purchase microsoft office home 2024',NULL,NULL,NULL,0),
(4,'microsoft-office-home-business-2024-pc','Microsoft Office Home & Business 2024 (PC)','Windows','office-2024-pc','Hot Pick',1,228.99,249.99,0.0,0,'/uploads/products/microsoft-office-home-business-2024-pc.webp','word,excel,powerpoint,outlook','US','SKU-253726E9','2004103559876',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-business-2024-pc','https://std.mscdn2024.com/Office_2024_EN_standard_64Bits.exe',81,'buy office home and business 2024, office home and business 2024 product key, office home and business 2024 price, office home and business 2024 license, purchase office home and business 2024',NULL,NULL,NULL,0),
(5,'microsoft-office-2021-home-business-windows','Microsoft Office 2021 Home & Business (Windows)','Windows','office-2021-pc',NULL,0,184.99,249.99,0.0,0,'/uploads/products/microsoft-office-2021-home-business-windows.webp','word,excel,powerpoint,outlook','US','SKU-7CA3B9C1','2009521101560',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2021-home-business-windows','https://setup.office.com/?ms.officeurl=setup',114,'buy office 2021 home and business, office 2021 home and business product key, office 2021 home and business price, office 2021 home and business license, purchase office 2021 home and business',NULL,NULL,NULL,0),
(6,'microsoft-office-2021-professional-plus-windows','Microsoft Office 2021 Professional Plus (Windows)','Windows','office-2021-pc','Best Seller',0,154.99,238.45,0.0,0,'/uploads/products/microsoft-office-2021-professional-plus-windows.webp','word,excel,powerpoint,outlook,access','US','SKU-7D271F29','2004481114179',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2021-professional-plus-windows','https://setup.office.com/?ms.officeurl=setup',102,'buy office 2021 professional plus, office 2021 professional plus product key, office 2021 professional plus price, office 2021 professional plus license, purchase office 2021 professional plus, office 2021 pro plus buy',NULL,NULL,NULL,0),
(7,'microsoft-office-2021-home-student-windows','Microsoft Office 2021 Home & Student (Windows)','Windows','office-2021-pc',NULL,0,109.99,149.99,0.0,0,'/uploads/products/microsoft-office-2021-home-student-windows.webp','word,excel,powerpoint','US','SKU-95EF0342','2001531411486',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2021-home-student-windows','https://setup.office.com/?ms.officeurl=setup',117,'buy office 2021 home and student, office 2021 home and student product key, office 2021 home and student price, office 2021 home and student license, purchase office 2021 home and student',NULL,NULL,NULL,0),
(8,'microsoft-word-2021-windows','Microsoft Word 2021 (Windows)','Windows','office-2021-pc',NULL,0,105.30,129.99,0.0,0,'/uploads/products/microsoft-word-2021-windows.webp','word','US','SKU-4E4FFA60','2006157511077',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-word-2021-windows','https://setup.office.com/?ms.officeurl=setup',93,'buy microsoft word 2021, microsoft word 2021 product key, microsoft word 2021 price, microsoft word 2021 license, purchase microsoft word 2021, buy microsoft word, microsoft word product key, microsoft word purchase',NULL,NULL,NULL,0),
(9,'microsoft-excel-2021-windows','Microsoft Excel 2021 (Windows)','Windows','office-2021-pc',NULL,0,111.95,129.99,0.0,0,'/uploads/products/microsoft-excel-2021-windows.webp','excel','US','SKU-C3CFEF0D',NULL,2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-excel-2021-windows','https://maventechsoftware.com/office-setup.php',114,'buy microsoft excel 2021, microsoft excel 2021 product key, microsoft excel 2021 price, microsoft excel 2021 license, purchase microsoft excel 2021, buy microsoft excel, microsoft excel product key',NULL,NULL,NULL,0),
(10,'microsoft-office-2019-home-student-windows','Microsoft Office 2019 Home & Student (Windows)','Windows','office-2019-pc',NULL,0,89.99,138.45,0.0,0,'/uploads/products/microsoft-office-2019-home-student-windows.webp','word,excel,powerpoint','US','SKU-2A473431','2004145100470',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2019-home-student-windows','https://setup.office.com/?ms.officeurl=setup',69,'buy office 2019 home and student, office 2019 home and student product key, office 2019 home and student price, office 2019 home and student license, purchase office 2019 home and student',NULL,NULL,NULL,0),
(11,'microsoft-office-2019-home-business-pc','Microsoft Office 2019 Home & Business (PC)','Windows','office-2019-pc',NULL,0,149.99,219.99,0.0,0,'/uploads/products/microsoft-office-2019-home-business-pc.webp','word,excel,powerpoint,outlook','US','SKU-1D9CB946','2005144811718',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2019-home-business-pc','https://setup.office.com/?ms.officeurl=setup',105,'buy office 2019 home and business, office 2019 home and business product key, office 2019 home and business price, office 2019 home and business license, purchase office 2019 home and business',NULL,NULL,NULL,0),
(12,'microsoft-office-2019-professional-plus-windows','Microsoft Office 2019 Professional Plus (Windows)','Windows','office-2019-pc','Best Seller',0,129.99,199.98,0.0,0,'/uploads/products/microsoft-office-2019-professional-plus-windows.webp','word,excel,powerpoint,outlook,access','US','SKU-D983C7E2','2004158910066',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2019-professional-plus-windows','https://setup.office.com/?ms.officeurl=setup',87,'buy office 2019 professional plus, office 2019 professional plus product key, office 2019 professional plus price, office 2019 professional plus license, purchase office 2019 professional plus',NULL,NULL,NULL,0),
(13,'microsoft-office-home-business-2024-mac','Microsoft Office Home & Business 2024 (Mac)','Mac','office-2024-mac','Best Seller',0,194.99,249.99,0.0,0,'/uploads/products/microsoft-office-home-business-2024-mac.webp','word,excel,powerpoint,outlook','US','SKU-48D5F446','2005910314108',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-business-2024-mac','https://mac.mscdn2024.com/',84,'buy office home and business 2024 for mac, office home and business 2024 for mac product key, office home and business 2024 for mac price, office home and business 2024 for mac license, purchase office home and business 2024 for mac, microsoft office home 2024 for mac, office home & business 2024 for mac',NULL,NULL,NULL,0),
(14,'microsoft-office-home-2024-mac','Microsoft Office Home 2024 (Mac)','Mac','office-2024-mac','Hot Pick',1,126.99,195.37,0.0,0,'/uploads/products/microsoft-office-home-2024-mac.webp','word,excel,powerpoint','US','SKU-93BF0180','2001380141176',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-2024-mac','https://mac.mscdn2024.com/',132,'buy microsoft office home 2024 mac, microsoft office home 2024 mac product key, microsoft office home 2024 mac price, microsoft office home 2024 mac license, purchase microsoft office home 2024 mac',NULL,NULL,NULL,0),
(15,'microsoft-office-2021-home-student-mac','Microsoft Office 2021 Home & Student (Mac)','Mac','office-2021-mac',NULL,0,114.99,149.99,0.0,0,'/uploads/products/microsoft-office-2021-home-student-mac.webp','word,excel,powerpoint','US','SKU-A65BC424','2008615117104',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2021-home-student-mac','https://mac.mscdn2024.com/',93,'buy office 2021 home and student mac, office 2021 home and student mac product key, office 2021 home and student mac price, office 2021 home and student mac license, purchase office 2021 home and student mac',NULL,NULL,NULL,0),
(16,'microsoft-office-2021-home-business-mac','Microsoft Office 2021 Home & Business (Mac)','Mac','office-2021-mac',NULL,0,174.99,249.99,0.0,0,'/uploads/products/microsoft-office-2021-home-business-mac.webp','word,excel,powerpoint,outlook','US','SKU-2FE8BE6E','2001365641004',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-2021-home-business-mac','https://mac.mscdn2024.com/',138,'buy office 2021 home and business mac, office 2021 home and business mac product key, office 2021 home and business mac price, office 2021 home and business mac license, purchase office 2021 home and business mac, buy microsoft office for mac',NULL,NULL,NULL,0),
(17,'microsoft-word-2021-mac-lifetime-license-no-subscription','Microsoft Word 2021 (Mac) Lifetime License No Subscription','Mac','office-2021-mac',NULL,0,117.99,149.99,0.0,0,'/uploads/products/microsoft-word-2021-mac-lifetime-license-no-subscription.webp','word','US','SKU-68E3855E','2001141461574',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-word-2021-mac-lifetime-license-no-subscription','https://mac.mscdn2024.com/',96,'buy microsoft word for mac, microsoft word for mac product key, microsoft word for mac price, microsoft word for mac license, purchase microsoft word for mac, buy ms word for mac, word for mac one time purchase',NULL,NULL,NULL,0),
(18,'microsoft-excel-2021-mac-lifetime-license-no-subscription','Microsoft Excel 2021 (Mac) Lifetime License No Subscription','Mac','office-2021-mac',NULL,0,119.99,149.99,0.0,0,'/uploads/products/microsoft-excel-2021-mac-lifetime-license-no-subscription.webp','excel','US','SKU-B7C9A47C','2001115114154',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-excel-2021-mac-lifetime-license-no-subscription','https://mac.mscdn2024.com/',102,'buy microsoft excel for mac, microsoft excel for mac product key, microsoft excel for mac price, microsoft excel for mac license, purchase microsoft excel for mac, buy excel for mac',NULL,NULL,NULL,0),
(19,'microsoft-office-home-and-business-2019-mac','Microsoft Office Home And Business 2019 (Mac)','Mac','office-2019-mac',NULL,0,124.99,192.29,0.0,0,'/uploads/products/microsoft-office-home-and-business-2019-mac.webp','word,excel,powerpoint,outlook','US','SKU-72B817C3','2004913151055',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-and-business-2019-mac','https://setup.office.com',105,'buy office 2019 home and business mac, office 2019 home and business mac product key, office 2019 home and business mac price, office 2019 home and business mac license, purchase office 2019 home and business mac',NULL,NULL,NULL,0),
(20,'microsoft-office-home-and-student-2019-mac','Microsoft Office Home And Student 2019 (Mac)','Mac','office-2019-mac',NULL,0,94.99,146.14,0.0,0,'/uploads/products/microsoft-office-home-and-student-2019-mac.webp','word,excel,powerpoint','US','SKU-AF38DA9F','2002721039619',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-office-home-and-student-2019-mac','https://setup.office.com',108,'buy office 2019 home and student mac, office 2019 home and student mac product key, office 2019 home and student mac price, office 2019 home and student mac license, purchase office 2019 home and student mac',NULL,NULL,NULL,0),
(21,'windows-11-home','Windows 11 Home','Windows','windows-11',NULL,1,59.99,92.29,0.0,0,'/uploads/products/windows-11-home.webp','','US','SKU-58625CF0','2001069149127',NULL,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://account.microsoft.com/account','/install-guide.php?slug=windows-11-home','https://go.microsoft.com/fwlink/?linkid=2171764',108,'buy windows 11 home, windows 11 home product key, windows 11 home price, windows 11 home license, purchase windows 11 home, windows 11 home key',NULL,NULL,NULL,0),
(22,'windows-11-pro','Windows 11 Pro','Windows','windows-11','Best Seller',1,79.99,123.06,0.0,0,'/uploads/products/windows-11-pro.webp','','US','SKU-DD7C7A56','2001315121488',NULL,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://account.microsoft.com/account','/install-guide.php?slug=windows-11-pro','https://go.microsoft.com/fwlink/?linkid=2171764',96,'buy windows 11 pro, windows 11 pro product key, windows 11 pro price, windows 11 pro license, purchase windows 11 pro, buy windows 11 pro key, windows 11 pro lifetime license, where to buy windows 11 product key',NULL,NULL,NULL,0),
(23,'windows-10-home','Windows 10 Home','Windows','windows-10',NULL,0,49.99,76.91,0.0,0,'/uploads/products/windows-10-home.webp','','US','SKU-83CA6BCF','2008120111062',NULL,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://account.microsoft.com/account','/install-guide.php?slug=windows-10-home','https://www.microsoft.com/en-in/software-download/windows10',87,'buy windows 10 home, windows 10 home product key, windows 10 home price, windows 10 home license, purchase windows 10 home, windows 10 home key',NULL,NULL,NULL,0),
(24,'windows-10-pro','Windows 10 Pro','Windows','windows-10','Best Seller',0,69.99,107.68,0.0,0,'/uploads/products/windows-10-pro.webp','','US','SKU-C807BFDF','2000781121138',NULL,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://account.microsoft.com/account','/install-guide.php?slug=windows-10-pro','https://www.microsoft.com/en-in/software-download/windows10',105,'buy windows 10 pro, windows 10 pro product key, windows 10 pro price, windows 10 pro license, purchase windows 10 pro, windows 10 pro key, where do i buy a windows 10 product key',NULL,NULL,NULL,0),
(25,'microsoft-project-2024-professional-pc','Microsoft Project 2024 Professional (PC)','Windows','microsoft-project','Best Seller',1,199.99,307.68,0.0,0,'/uploads/products/microsoft-project-2024-professional-pc.webp','','US','SKU-8DA49D6A','2004022612454',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-project-2024-professional-pc','https://setup.office.com',114,'buy microsoft project 2024, microsoft project 2024 product key, microsoft project 2024 price, microsoft project 2024 license, purchase microsoft project 2024, buy microsoft project, ms project product key',NULL,NULL,NULL,0),
(26,'microsoft-project-professional-2021-pc','Microsoft Project Professional 2021 (PC)','Windows','microsoft-project',NULL,0,159.99,246.14,0.0,0,'/uploads/products/microsoft-project-professional-2021-pc.webp','','US','SKU-58BB62DF','2002120146857',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-project-professional-2021-pc','https://setup.office.com',111,'buy microsoft project 2021, microsoft project 2021 product key, microsoft project 2021 price, microsoft project 2021 license, purchase microsoft project 2021, project professional 2021',NULL,NULL,NULL,0),
(27,'ms-project-professional-2019-pc','MS Project Professional 2019 (PC)','Windows','microsoft-project',NULL,0,129.99,199.98,0.0,0,'/uploads/products/ms-project-professional-2019-pc.webp','','US','SKU-4FAF9699','2007141360213',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=ms-project-professional-2019-pc','https://setup.office.com',111,'buy microsoft project 2019, microsoft project 2019 product key, microsoft project 2019 price, microsoft project 2019 license, purchase microsoft project 2019',NULL,NULL,NULL,0),
(28,'microsoft-visio-2024-professional-windows-pc','Microsoft Visio 2024 Professional (Windows PC)','Windows','microsoft-visio',NULL,1,199.99,249.99,0.0,0,'/uploads/products/microsoft-visio-2024-professional-windows-pc.webp','','US','SKU-0EF1E74E','2000715414213',2024,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-visio-2024-professional-windows-pc','https://setup.office.com',117,'buy microsoft visio 2024, microsoft visio 2024 product key, microsoft visio 2024 price, microsoft visio 2024 license, purchase microsoft visio 2024, buy microsoft visio, ms visio product key',NULL,NULL,NULL,0),
(29,'microsoft-visio-2021-professional-windows-pc','Microsoft Visio 2021 Professional (Windows PC)','Windows','microsoft-visio',NULL,0,169.99,229.99,0.0,0,'/uploads/products/microsoft-visio-2021-professional-windows-pc.webp','','US','SKU-F96E899E','2004512121060',2021,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=microsoft-visio-2021-professional-windows-pc','https://setup.office.com',126,'buy microsoft visio 2021, microsoft visio 2021 product key, microsoft visio 2021 price, microsoft visio 2021 license, purchase microsoft visio 2021, visio professional 2021',NULL,NULL,NULL,0),
(30,'ms-visio-professional-2019-pc','MS Visio Professional 2019 (PC)','Windows','microsoft-visio',NULL,0,149.99,199.99,0.0,0,'/uploads/products/ms-visio-professional-2019-pc.webp','','US','SKU-4005073B','2004471124126',2019,'lifetime',NULL,'Microsoft',NULL,NULL,NULL,NULL,1,'manual','manual','https://setup.office.com','/install-guide.php?slug=ms-visio-professional-2019-pc','https://setup.office.com',102,'buy microsoft visio 2019, microsoft visio 2019 product key, microsoft visio 2019 price, microsoft visio 2019 license, purchase microsoft visio 2019',NULL,NULL,NULL,0),
(31,'bitdefender-premium-vpn-unlimited-devices-1-year','Bitdefender Premium VPN — Unlimited Devices, 1 Year','Windows','bitdefender',NULL,0,49.99,76.91,0.0,0,'/uploads/products/bitdefender-premium-vpn-unlimited-devices-1-year.webp','','US','SKU-9A2DB69A','2001391451240',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/answer/13418/','https://central.bitdefender.com',99,'buy bitdefender premium vpn, bitdefender premium vpn price, bitdefender premium vpn deal, bitdefender premium vpn best price, bitdefender vpn price, bitdefender vpn unlimited devices',NULL,NULL,NULL,0),
(32,'bitdefender-antivirus-for-mac-1-mac-1-year','Bitdefender Antivirus for Mac — 1 Mac, 1 Year','Mac','bitdefender',NULL,0,29.99,46.14,0.0,0,'/uploads/products/bitdefender-antivirus-for-mac-1-mac-1-year.webp','','US','SKU-2C0BD827','2005151582137',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/','https://central.bitdefender.com',111,'buy bitdefender antivirus for mac, bitdefender antivirus for mac price, bitdefender antivirus for mac deal, bitdefender antivirus for mac best price, buy bitdefender antivirus, antivirus for mac buy, bitdefender for mac 1 year',NULL,NULL,NULL,0),
(33,'bitdefender-antivirus-for-mac-1-mac-2-years','Bitdefender Antivirus for Mac — 1 Mac, 2 Years','Mac','bitdefender',NULL,0,49.99,76.91,0.0,0,'/uploads/products/bitdefender-antivirus-for-mac-1-mac-2-years.webp','','US','SKU-1E105BE9','2009041366142',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/','https://central.bitdefender.com',126,'buy bitdefender for mac 2 years, bitdefender for mac 2 years price, bitdefender for mac 2 years deal, bitdefender for mac 2 years best price, bitdefender antivirus for mac 2 years',NULL,NULL,NULL,0),
(34,'bitdefender-antivirus-for-mac-3-mac-1-year','Bitdefender Antivirus for Mac — 3 Mac, 1 Year','Mac','bitdefender',NULL,0,49.99,76.91,0.0,0,'/uploads/products/bitdefender-antivirus-for-mac-3-mac-1-year.webp','','US','SKU-484FB06F','2001111131513',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/','https://central.bitdefender.com',105,'buy bitdefender for 3 macs, bitdefender for 3 macs price, bitdefender for 3 macs deal, bitdefender for 3 macs best price, bitdefender antivirus 3 macs',NULL,NULL,NULL,0),
(35,'bitdefender-antivirus-for-mac-3-mac-2-years','Bitdefender Antivirus for Mac — 3 Mac, 2 Years','Mac','bitdefender',NULL,0,79.99,123.06,0.0,0,'/uploads/products/bitdefender-antivirus-for-mac-3-mac-2-years.webp','','US','SKU-73230F17','2005122410117',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/','https://central.bitdefender.com',123,'buy bitdefender 3 macs 2 years, bitdefender 3 macs 2 years price, bitdefender 3 macs 2 years deal, bitdefender 3 macs 2 years best price',NULL,NULL,NULL,0),
(36,'bitdefender-small-office-security-5-devices-1-year','Bitdefender Small Office Security — 5 Devices, 1 Year','Windows','bitdefender',NULL,0,89.99,138.45,0.0,0,'/uploads/products/bitdefender-small-office-security-5-devices-1-year.webp','','US','SKU-3CDBADC9','2003714122745',NULL,'lifetime',NULL,'Bitdefender',NULL,NULL,NULL,NULL,1,'manual','ai','https://central.bitdefender.com/','https://www.bitdefender.com/consumer/support/','https://central.bitdefender.com',108,'buy bitdefender small office security, bitdefender small office security price, bitdefender small office security deal, bitdefender small office security best price, antivirus for small business, business antivirus 5 devices',NULL,NULL,NULL,0),
(37,'mcafee-premium-individual-1-year-unlimited-devices-usa','McAfee+ Premium Individual - 1-Year / Unlimited Devices - USA','Windows','mcafee','Best Seller',0,52.29,61.52,0.0,0,'/uploads/products/mcafee-premium-individual-1-year-unlimited-devices-usa.webp','','US','SKU-86C9E0D2','2004521205133',NULL,'lifetime',NULL,'McAfee',NULL,NULL,NULL,NULL,1,'manual','ai','https://www.mcafee.com/activate','https://www.mcafee.com/support/','https://home.mcafee.com',81,'buy mcafee premium, mcafee premium price, mcafee premium deal, mcafee premium best price, buy mcafee antivirus, mcafee unlimited devices, mcafee 1 year subscription','2026-10-20 13:05:03','2026-10-21 13:05:03','[\"/uploads/products/mcafee-premium-individual-1-year-unlimited-devices-usa.webp\",\"/uploads/products/gallery/mcafee-premium-individual-1-year-unlimited-devices-usa-u1787486368932.webp\",\"/uploads/products/gallery/mcafee-premium-individual-1-year-unlimited-devices-usa-u1787486401171.webp\",\"/uploads/products/gallery/mcafee-premium-individual-1-year-unlimited-devices-usa-u1787486438948.webp\"]',0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

--
-- Table structure for table `push_subscriptions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `push_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `endpoint` varchar(500) NOT NULL,
  `p256dh` varchar(255) NOT NULL,
  `auth` varchar(64) NOT NULL,
  `ua` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_ok_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_endpoint` (`endpoint`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_subscriptions`
--

/*!40000 ALTER TABLE `push_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_subscriptions` ENABLE KEYS */;

--
-- Table structure for table `refund_requests`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `refund_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(40) NOT NULL,
  `email` varchar(190) NOT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refund_requests`
--

/*!40000 ALTER TABLE `refund_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `refund_requests` ENABLE KEYS */;

--
-- Table structure for table `regional_pricing`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `regional_pricing` (
  `product_slug` varchar(80) NOT NULL,
  `region` varchar(8) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `original_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`product_slug`,`region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regional_pricing`
--

/*!40000 ALTER TABLE `regional_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `regional_pricing` ENABLE KEYS */;

--
-- Table structure for table `regions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `regions` (
  `code` varchar(8) NOT NULL,
  `name` varchar(60) NOT NULL,
  `currency` varchar(8) NOT NULL,
  `currency_symbol` varchar(4) NOT NULL,
  `tax_rate` decimal(5,4) NOT NULL DEFAULT 0.0000,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `charge_enabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT IGNORE INTO `regions` VALUES
('AU','Australia','AUD','A$',0.1000,1,0),
('CA','Canada','CAD','C$',0.1300,1,0),
('EU','Europe','EUR','€',0.2000,1,0),
('UK','United Kingdom','GBP','£',0.2000,1,0),
('US','United States','USD','$',0.0000,1,0);
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;

--
-- Table structure for table `reviews`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `initials` varchar(4) NOT NULL,
  `location` varchar(60) DEFAULT '',
  `review_date` date NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `text` text NOT NULL,
  `product` varchar(120) DEFAULT '',
  `verified` tinyint(4) DEFAULT 1,
  `source` varchar(20) NOT NULL DEFAULT 'internal',
  `source_url` varchar(500) DEFAULT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

--
-- Table structure for table `seo_runs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `seo_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `started_at` datetime NOT NULL,
  `ended_at` datetime DEFAULT NULL,
  `indexnow_status` varchar(20) DEFAULT NULL,
  `indexnow_count` int(11) DEFAULT NULL,
  `google_ping` varchar(20) DEFAULT NULL,
  `bing_ping` varchar(20) DEFAULT NULL,
  `wayback_status` varchar(20) DEFAULT NULL,
  `wayback_count` int(11) DEFAULT NULL,
  `llm_calls` int(11) DEFAULT NULL,
  `llm_tokens_in` int(11) DEFAULT NULL,
  `llm_tokens_out` int(11) DEFAULT NULL,
  `products_updated` int(11) DEFAULT NULL,
  `blog_post_id` varchar(100) DEFAULT NULL,
  `blog_post_title` varchar(255) DEFAULT NULL,
  `blog_product_id` int(11) DEFAULT NULL,
  `blog_post_image` varchar(500) DEFAULT NULL,
  `errors_json` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_started_at` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_runs`
--

/*!40000 ALTER TABLE `seo_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_runs` ENABLE KEYS */;

--
-- Table structure for table `settings`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `settings` (
  `k` varchar(80) NOT NULL,
  `v` mediumtext NOT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`k`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT IGNORE INTO `settings` VALUES
('active_region','US','2026-09-21 08:43:46'),
('ads_conversion_beacons','{\"events\":[{\"t\":\"2026-10-01 21:03:36\",\"o\":\"MV2610013C06C\",\"s\":\"fired\"},{\"t\":\"2026-10-10 07:52:02\",\"o\":\"SHOW8715\",\"s\":\"fired\"}]}','2026-10-10 07:52:02'),
('ads_conversion_client_count','2','2026-10-10 07:52:02'),
('ads_conversion_client_first_at','2026-10-01 21:03:36','2026-10-01 17:03:36'),
('ads_conversion_client_last_at','2026-10-10 07:52:02','2026-10-10 07:52:02'),
('ads_conversion_client_last_order','SHOW8715','2026-10-10 07:52:02'),
('ads_conversion_count','56','2026-10-14 17:45:21'),
('ads_conversion_first_fired_at','2026-09-16 19:18:58','2026-09-16 15:18:58'),
('ads_conversion_first_order','MV260916555F5','2026-09-16 15:18:58'),
('ads_conversion_last_fired_at','2026-10-14 17:45:21','2026-10-14 17:45:21'),
('ads_conversion_last_order','TESTQA-PS-OK','2026-10-14 17:45:21'),
('ai_blogger_llm_base_url','','2026-09-21 08:45:32'),
('ai_blogger_llm_key','sk-emergent-7DcB3321897A69cE5F','2026-09-21 08:45:32'),
('ai_blogger_llm_provider','emergent','2026-09-21 08:45:32'),
('ai_citations_last_run_at','2026-09-30 16:56:03','2026-09-30 12:56:03'),
('ai_studio_seo_cols_v','1','2026-09-21 06:19:24'),
('api_token','76ccbedbe8bb1d9ff56dbcd863f1cb7728328c2896fd8732','2026-06-23 06:42:36'),
('autocron_last_log','{\"at\":\"2026-10-21 14:47:06\",\"mode\":\"inline\",\"followups_queued\":0,\"emails_sent\":0,\"ms\":9}','2026-10-21 14:47:06'),
('autocron_last_run','2026-10-21 14:47:06','2026-10-21 14:47:06'),
('autocron_next','1792594326','2026-10-21 14:47:06'),
('auto_sitemap_weekly','1','2026-09-16 14:27:00'),
('bestseller_badges_v1','1','2026-09-16 14:27:09'),
('bing_site_verification_token','AF7E1FB430EA67709B92D54FA12FBEB7','2026-09-16 14:27:09'),
('bing_uet_tag_id','','2026-09-28 01:55:09'),
('card_bin_cache','{\"400000\":{\"funding\":\"credit\",\"country\":\"US\",\"brand\":\"Visa\",\"bank\":\"\",\"ts\":1789945137},\"411111\":{\"funding\":\"debit\",\"country\":\"PL\",\"brand\":\"Visa\",\"bank\":\"Conotoxia Sp. Z O.O\",\"ts\":1789945151},\"555555\":{\"funding\":\"credit\",\"country\":\"US\",\"brand\":\"Mastercard\",\"bank\":\"\",\"ts\":1789945155},\"424242\":{\"funding\":\"credit\",\"country\":\"GB\",\"brand\":\"Visa\",\"bank\":\"\",\"ts\":1789945159},\"407166\":{\"funding\":\"credit\",\"country\":\"US\",\"brand\":\"Visa\",\"bank\":\"Jpmorgan Chase Bank N.A.\",\"ts\":1790888662},\"521853\":{\"funding\":\"credit\",\"country\":\"US\",\"brand\":\"Mastercard\",\"bank\":\"Synchrony Bank\",\"ts\":1791655865}}','2026-10-10 18:11:05'),
('card_enabled','1','2026-09-16 14:27:08'),
('card_main_image_v1','1','2026-09-20 21:51:32'),
('chat_quick_replies','[{\"id\":\"q1\",\"title\":\"Greeting\",\"text\":\"Hi {name}, thanks for reaching out to {brand}! I\'m {agent} — I\'m looking into this for you right now.\"},{\"id\":\"q2\",\"title\":\"Order number\",\"text\":\"Could you share your order number (it starts with #MV) and the email used at checkout so I can pull up your order?\"},{\"id\":\"q3\",\"title\":\"Key delivery\",\"text\":\"Your license key is delivered by email within 15–30 minutes of payment. Please also check Spam\\/Promotions — if it\'s not there, I\'ll resend it right away.\"},{\"id\":\"q4\",\"title\":\"Activation help\",\"text\":\"To activate: open any Office app → Account → Activate (or Change Product Key), paste the key exactly as sent, then restart the app. Let me know what message you see if it fails.\"},{\"id\":\"q5\",\"title\":\"Wrap up\",\"text\":\"Glad I could help, {name}! If anything else comes up, just reply here or email us anytime. Have a great day 😊\"}]','2026-10-12 07:39:37'),
('chat_schema_v3','1','2026-06-23 06:35:37'),
('chat_schema_v4','1','2026-10-09 05:01:57'),
('chat_schema_v5','1','2026-10-12 07:30:54'),
('chat_schema_v6','1','2026-10-20 08:57:30'),
('cjs_owner_default_2026_09_30','1','2026-09-30 19:09:14'),
('clarity_project_id','xcp5vd09fb','2026-09-28 01:55:09'),
('company_address','135 CAROLINA ST G2, VALLEJO, CA 94590','2026-06-12 11:00:47'),
('company_branding_generation','1789994706','2026-09-21 08:45:06'),
('company_brand_vibe','classic','2026-09-21 08:45:06'),
('company_brand_vibe_default','','2026-09-21 08:45:06'),
('company_email','services@maventechsoftware.com','2026-10-15 20:08:37'),
('company_hist_schema_v','1','2026-09-16 14:27:09'),
('company_id_prefix','MVN','2026-09-21 08:45:06'),
('company_legal_name','Maventech LLC','2026-10-14 17:32:28'),
('company_logo','uploads/company/logo-mark.png','2026-10-15 20:06:33'),
('company_logo_motion','pulse','2026-10-01 23:57:13'),
('company_name','Maventech','2026-10-15 20:08:37'),
('company_phone','(888) 823-3590','2026-10-15 20:08:37'),
('company_phone_au','','2026-09-21 08:45:06'),
('company_phone_ca','','2026-09-21 08:45:06'),
('company_phone_eu','','2026-09-21 08:45:06'),
('company_phone_uk','','2026-09-21 08:45:06'),
('company_reg_certificate_url','/uploads/legal/maventech-articles-certificate.pdf','2026-09-30 08:24:46'),
('company_reg_date_filed','2024-09-03','2026-09-30 08:24:46'),
('company_reg_jurisdiction','California, USA','2026-09-30 08:24:46'),
('company_reg_number','202463711253','2026-09-30 08:24:46'),
('contact_phone','(888) 823-3590','2026-09-16 14:27:09'),
('cron_token','0b8166da24a08c53bdd92d069f68b8a8bd643009','2026-06-23 06:35:43'),
('custom_discount_codes','[]','2026-09-21 08:45:06'),
('daily_digest_sent_date','2026-10-21','2026-10-21 14:41:58'),
('db_schema_version','2026-06-cardbrand-backfill','2026-09-16 14:27:09'),
('dmca_last_scan_at','2026-09-30 16:56:14','2026-09-30 12:56:14'),
('emails_last_bounce_sync','1790890077','2026-10-01 17:27:57'),
('email_template_html','','2026-06-12 06:10:17'),
('email_template_subject','Your Microsoft product key — Order #{{order_number}}','2026-06-12 06:10:17'),
('email_tpl_brand_mark_v1','1','2026-10-13 17:13:41'),
('followup_enabled','1','2026-10-14 17:45:13'),
('ga4_measurement_id','G-9824E82NN1','2026-09-16 14:27:09'),
('gateways_seeded_v1','1','2026-09-16 14:27:08'),
('google_ads_purchase_label','VZbdCMiC74gdENDivoRE','2026-09-28 01:55:09'),
('google_ads_tag_id','AW-18263028048','2026-09-16 14:27:09'),
('google_merchant_id','5815017210','2026-09-16 14:27:09'),
('google_nudge_last_tick','2026-10-21 14:11:58','2026-10-21 14:11:58'),
('google_reviews_profile_url','','2026-09-16 14:27:00'),
('google_review_url','https://g.page/r/CY0H1wdUhWorEBM/review','2026-09-16 14:27:00'),
('google_site_verification_token','LFLfhfiA2pQuNPIvUus7TuLMUqKs6jq9TVnOlUkczMQ','2026-09-16 14:27:09'),
('google_tag_id','GT-TQV4X72G','2026-09-16 14:27:09'),
('go_live_check_last_run','{\"ts\":\"2026-09-21T15:26:47+00:00\",\"site\":\"https://maventechsoftware.com\",\"score\":{\"green\":8,\"amber\":0,\"red\":0,\"total\":8}}','2026-09-21 11:26:47'),
('gtm_container_id','GTM-N6Q7FKS2','2026-09-16 15:34:32'),
('gw_card_merchant_name','Five Code Lab','2026-10-14 17:45:13'),
('gw_card_provider','NMI','2026-09-16 14:27:09'),
('gw_card_provider_type','nmi','2026-09-16 14:27:08'),
('gw_card_public_key','checkout_public_7n66b4U3QwffQ26mcsg4jaz4uSbNvWE6','2026-09-16 14:27:08'),
('gw_card_public_key_live','checkout_public_7n66b4U3QwffQ26mcsg4jaz4uSbNvWE6','2026-09-16 14:27:08'),
('gw_card_secret_key','','2026-06-12 06:38:15'),
('gw_card_status','active','2026-09-30 16:04:44'),
('gw_card_webhook_secret','D1F2EADBD231C71AB96FAA962A0A7304','2026-09-16 14:27:08'),
('gw_card_webhook_url','/stripe-webhook.php','2026-06-12 06:38:15'),
('gw_display_names_v2','1','2026-09-16 14:27:08'),
('gw_mode','test','2026-10-02 00:04:59'),
('gw_nmi_collectjs','0','2026-09-30 19:09:14'),
('gw_nmi_cur_test_CAD','{\"ok\":0,\"ts\":1789987787,\"text\":\"The cc payment type [Visa] and\\/or currency [CAD] is not accepted REFID:217694014\"}','2026-09-21 06:49:47'),
('gw_nmi_endpoint','','2026-10-14 17:45:18'),
('gw_nmi_public_key','checkout_public_7n66b4U3QwffQ26mcsg4jaz4uSbNvWE6','2026-09-16 15:51:09'),
('gw_nmi_security_key_live','mRpB7Ydz4uyEG6ev7v9HdRwNVYrqs895','2026-09-16 14:27:08'),
('gw_nmi_security_key_test','mRpB7Ydz4uyEG6ev7v9HdRwNVYrqs895','2026-10-14 17:45:18'),
('gw_nmi_signing_key','D1F2EADBD231C71AB96FAA962A0A7304','2026-09-16 14:27:08'),
('gw_paypal_3ds','when_required','2026-09-20 19:07:01'),
('gw_paypal_account_name','Zedweb Tech','2026-06-12 09:02:04'),
('gw_paypal_client_id','','2026-06-12 06:38:15'),
('gw_paypal_client_id_live','ATWxNFTFCqu_CtrYUBaZrVWUZkt3NSqKfxihElJ4rC3f1W9NuIL-y4wz8FiLC6lkcwm2lS0VFgL538Cd','2026-09-16 14:27:08'),
('gw_paypal_client_id_test','Add8gYb5pQ_xCuVaiSpxFpxDUa8TlSTbw8CH7D9AIj-4oKsgn9-9kIMQD0RLeIZ-QL823r3fcc-b1Kbj','2026-09-16 14:27:08'),
('gw_paypal_provider','PayPal','2026-06-12 06:38:15'),
('gw_paypal_secret','','2026-06-12 06:38:15'),
('gw_paypal_secret_live','EH64yz-CAVlAoEhd3uYa1M8mruKR67099fK5mD-mY8-yMa1ZHBBYdAKFtpzctXPUp5nJ-Kmulu83yBbZ','2026-09-21 02:24:44'),
('gw_paypal_secret_test','EGGTJpGQUZtZaSm6z8B4UrjJ3a9_t9RKiVqJq-rhOAFROXg5RWlY8LzkxOfJh4eqrRzUdVBpskweXd-l','2026-09-16 14:27:08'),
('gw_paypal_show_cards','1','2026-09-20 21:19:27'),
('gw_paypal_status','inactive','2026-10-20 08:46:16'),
('gw_paypal_webhook_id','35J58848HM622782F','2026-09-16 14:27:08'),
('gw_paypal_webhook_id_live','35J58848HM622782F','2026-09-16 14:27:08'),
('gw_paypal_webhook_id_test','56C18964R7715651V','2026-09-16 14:27:08'),
('gw_paypal_webhook_url','https://maventechsoftware.com/paypal-webhook.php','2026-09-21 06:41:20'),
('hc_secret','6248a038208884596b67dc0b083bb6c215b0d4b793573b1d','2026-10-20 08:57:30'),
('ipgeo_40ff44d9e619b17524bf3763204f9cbb','{\"country\":\"United States\",\"region\":\"California\",\"city\":\"San Jose\",\"isp\":\"Google LLC\"}','2026-10-09 07:19:09'),
('ipgeo_5b7b9625dc7d32abf43ac45809b0dd45','{\"country\":\"United States\",\"region\":\"California\",\"city\":\"San Jose\",\"isp\":\"Google LLC\"}','2026-10-12 08:07:27'),
('ipgeo_64c9ff72a6ba4f43ad5b1143999ae29b','{\"country\":\"United States\",\"region\":\"California\",\"city\":\"San Jose\",\"isp\":\"Google LLC\"}','2026-10-20 08:58:16'),
('ipgeo_aba12ba43821bd0813b2f28a96bdc975','{\"country\":\"United States\",\"region\":\"California\",\"city\":\"San Jose\",\"isp\":\"Google LLC\"}','2026-10-12 07:39:00'),
('ipgeo_ba90caaea2c11affb5541c286faa062c','{\"country\":\"United States\",\"region\":\"Iowa\",\"city\":\"Kane\",\"isp\":\"Google LLC\"}','2026-10-10 14:38:20'),
('ipgeo_c0c0d107772c781479a59abaf6a017f1','{\"country\":\"United States\",\"region\":\"California\",\"city\":\"San Jose\",\"isp\":\"Google LLC\"}','2026-10-12 07:38:54'),
('ipgeo_dc3ab7caecae7f42171b2bcc87687769','{\"country\":\"United States\",\"region\":\"District of Columbia\",\"city\":\"Washington\",\"isp\":\"Yahoo Holdings Inc.\"}','2026-10-09 07:19:09'),
('ipgeo_dca8369822c26b5863351969944f07b1','{\"country\":\"United States\",\"region\":\"Washington\",\"city\":\"Seattle\",\"isp\":\"Google LLC\"}','2026-10-09 07:19:09'),
('keywords_seeded_v2','1','2026-09-16 14:27:09'),
('last_sitemap_submit_at','2026-10-21 14:11:59','2026-10-21 14:11:59'),
('last_sitemap_submit_count','45','2026-09-16 14:27:10'),
('last_sitemap_submit_kind','auto_daily','2026-09-16 14:27:10'),
('mailer_schema_v','1','2026-09-16 15:18:55'),
('main_url','','2026-10-21 14:49:30'),
('marketing_seed_v','3','2026-09-16 14:27:09'),
('merchant_return_policy_label','maventech-30-day-refund','2026-09-28 01:55:09'),
('mv_arch_emails','[503,552,504,581,577,573,569,565,562,556,549,545,543,539,537,534,527,524,514,511,508,576,572,568,561,555,548,544,542,538]','2026-10-01 14:13:51'),
('mv_cap_secret','d4539e80d8d7d85332d5581fb5369342fcc136bd491b7c85','2026-10-01 09:50:09'),
('mv_cap_used','{\"d1ee91e05e065fce\":1791999931}','2026-10-14 17:45:31'),
('mv_read_support','[198,190,194,199,210,215,218,217,232,240,1,2]','2026-10-20 16:57:53'),
('notif_spam_purge_v1','1','2026-10-01 09:35:55'),
('orig_price_seed_v1','1','2026-09-16 14:27:09'),
('payment_policy_text_v1','1','2026-09-20 19:41:32'),
('paypal_enabled','0','2026-09-30 16:04:43'),
('perf_idx_v1','1','2026-09-16 14:27:09'),
('phone_normalized_current','+18888233590','2026-09-16 14:27:09'),
('plausible_enabled','0','2026-09-21 08:45:06'),
('plausible_script','','2026-09-21 08:45:06'),
('privacy_sms_policy_v1','1','2026-10-15 19:45:20'),
('proassist_enabled','0','2026-09-21 08:45:06'),
('proassist_price','47.00','2026-09-21 08:45:06'),
('product_links_seed_v','1','2026-09-16 14:27:09'),
('promo_bar_code','MAVEN10','2026-09-21 08:45:06'),
('promo_bar_enabled','1','2026-10-20 13:06:59'),
('promo_bar_percent','10','2026-09-21 08:45:06'),
('push_last_result','{\"sent\":0,\"failed\":1,\"pruned\":0,\"type\":\"payment_failed\",\"title\":\"\\u274c Payment failed \\u2014 Order TEST-1\"}','2026-10-18 07:53:11'),
('push_last_sent_at','1792309991','2026-10-18 07:53:11'),
('regions_au_eu_activated_v1','1','2026-09-16 14:27:09'),
('regions_schema_v','1','2026-09-16 14:27:09'),
('resume_secret','c4ce6f396058049f5226f1db37debd517413b28ca2df9ccb8cff9bf35a3a7901','2026-09-16 15:18:54'),
('reviews_seed_v','7','2026-09-16 14:27:09'),
('reviews_trickle_last','2026-10-21','2026-10-21 14:11:58'),
('save5_code','SAVE5','2026-09-21 08:45:06'),
('save5_percent','5','2026-09-21 08:45:06'),
('save5_popup_enabled','0','2026-09-21 08:45:06'),
('schema_knows_about_cache','Bitdefender\nMcAfee\nMicrosoft','2026-06-23 06:35:25'),
('schema_knows_about_cache_at','1792591918','2026-10-21 14:11:58'),
('seo_bot_cron_token','17907e8807410116','2026-06-23 06:42:36'),
('seo_bot_last_llms_full_txt_at','2026-09-23 14:51:07','2026-09-23 10:51:07'),
('seo_bot_last_llms_txt_at','2026-10-12 07:09:13','2026-10-14 17:45:47'),
('seo_bot_last_run_at','2026-06-23 10:35:58','2026-06-23 06:35:58'),
('seo_bot_llms_full_txt_bytes','60670','2026-09-23 10:51:07'),
('seo_bot_llms_txt_bytes','6375','2026-10-12 07:09:13'),
('seo_freshness_last_refreshed_id','audit-missing-img','2026-10-09 07:00:50'),
('seo_freshness_last_tick_at','2026-10-09 07:00:50','2026-10-09 07:00:50'),
('seo_indexnow_key','70637aac3d7f11fb25ebff658800f8ac','2026-06-23 06:35:58'),
('show_authorized_reseller_badge','1','2026-09-21 08:45:06'),
('site_domain_url','','2026-10-21 14:49:30'),
('smtp_cc','','2026-10-15 20:06:33'),
('smtp_daily_cap','450','2026-10-14 17:45:31'),
('smtp_debug','0','2026-10-01 17:27:17'),
('smtp_enabled','1','2026-10-15 20:06:33'),
('smtp_encryption','tls','2026-09-16 14:27:09'),
('smtp_from_email','techvisio247@gmail.com','2026-10-15 20:06:33'),
('smtp_from_name','Maventech','2026-09-16 14:27:09'),
('smtp_host','smtp.gmail.com','2026-10-14 17:45:31'),
('smtp_max_retries','3','2026-09-21 08:51:44'),
('smtp_password_b64','a3h0c2JhcGJlYmh4c2NudQ==','2026-10-01 17:27:11'),
('smtp_port','587','2026-09-16 14:27:09'),
('smtp_quota_pause_until','0','2026-10-14 17:45:31'),
('smtp_rate_per_min','60','2026-09-21 08:51:44'),
('smtp_reply_to','techvisio247@gmail.com','2026-10-01 17:27:11'),
('smtp_seed_v','1','2026-09-16 14:27:09'),
('smtp_username','techvisio247@gmail.com','2026-10-15 20:06:33'),
('smtp_verify_peer','1','2026-09-16 14:27:09'),
('sold_base_v1','1','2026-09-16 14:27:09'),
('staff_schema_v1','1','2026-06-23 06:41:06'),
('statement_name_card','MAVENTECH','2026-06-12 06:10:17'),
('statement_name_paypal','MAVENTECH LLC','2026-06-12 06:10:17'),
('sub_schema_v','1','2026-09-16 14:27:09'),
('support_phone','(888) 823-3590','2026-09-16 14:27:09'),
('terms_sms_section_v1','1','2026-10-15 20:05:26'),
('toll_free_phone','(888) 823-3590','2026-09-16 14:27:09'),
('vapid_private_pem','-----BEGIN PRIVATE KEY-----\nMIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgNtdEcvNlDgnucvTk\nHnkg2UenYbIgd0nxJnDKtXcuUoWhRANCAASd+XJ6UC+N302Z5/h3V4Dfn3DB9ihd\nfdvDrp71qbA9/TEeWa/jBz/SR1ztwtQ7eidQeMkST+FByOSCDX+J8f9W\n-----END PRIVATE KEY-----\n','2026-09-17 08:28:01'),
('vapid_public_key','BJ35cnpQL43fTZnn-HdXgN-fcMH2KF1928OunvWpsD39MR5Zr-MHP9JHXO3C1Dt6J1B4yRJP4UHI5IINf4nx_1Y','2026-09-17 08:28:01'),
('vendor_urls_v1','1','2026-09-16 14:27:09'),
('verify_status_bing','ok|2026-09-21 12:45:41|Bing Webmaster meta tag matches the saved value.','2026-09-21 08:45:41'),
('verify_status_google','ok|2026-09-21 12:45:39|Google Search Console meta tag matches the saved value.','2026-09-21 08:45:39'),
('vibe_manual_override_at','2026-10-01 23:57:13','2026-10-01 23:57:13'),
('volume_clean_reset_v2','1','2026-10-01 12:23:21'),
('volume_leads_purge_v5','1','2026-10-01 21:48:04'),
('volume_leads_reset_v1','1','2026-10-01 09:35:55'),
('volume_licensing_enabled','0','2026-10-01 16:51:46'),
('volume_notif_purge_v3','1','2026-10-01 12:31:47'),
('volume_notif_purge_v4','1','2026-10-01 21:48:04'),
('volume_outbox_purge_v6','1','2026-10-01 21:48:04'),
('volume_outbox_purge_v7','1','2026-10-14 17:45:31');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

--
-- Table structure for table `stock_notifications`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `stock_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_slug` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `region` varchar(8) NOT NULL DEFAULT 'US',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `notified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pending` (`product_slug`,`region`,`notified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_notifications`
--

/*!40000 ALTER TABLE `stock_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_notifications` ENABLE KEYS */;

--
-- Table structure for table `stripe_events`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `stripe_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` varchar(80) NOT NULL,
  `event_type` varchar(80) NOT NULL,
  `payload` longtext DEFAULT NULL,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_event_id` (`event_id`),
  KEY `idx_event_type` (`event_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe_events`
--

/*!40000 ALTER TABLE `stripe_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe_events` ENABLE KEYS */;

--
-- Table structure for table `subscription_notes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `subscription_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `department` varchar(40) NOT NULL DEFAULT '',
  `author_user_id` int(11) DEFAULT NULL,
  `author_name` varchar(120) NOT NULL DEFAULT '',
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_sub` (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_notes`
--

/*!40000 ALTER TABLE `subscription_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_notes` ENABLE KEYS */;

--
-- Table structure for table `subscription_plans`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `subscription_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(64) NOT NULL,
  `name` varchar(120) NOT NULL,
  `tagline` varchar(255) NOT NULL DEFAULT '',
  `tenure_label` varchar(64) NOT NULL DEFAULT '',
  `duration_months` int(11) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `devices` varchar(40) NOT NULL DEFAULT '',
  `features_json` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 100,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `icon_image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
INSERT IGNORE INTO `subscription_plans` VALUES
(1,'quick-fix','Quick Fix','One-time service · single session','One-Time Service',0,0.00,'1 Device','[\"Immediate issue resolution\",\"Virus and malware removal\",\"PC performance optimization\",\"Software installation and setup\",\"Printer and peripheral configuration\",\"Email setup and troubleshooting\",\"Internet and Wi-Fi troubleshooting\",\"Operating system error fixes\",\"Driver updates\",\"Browser issues and cleanup\",\"Basic data backup assistance\",\"Microsoft Office troubleshooting\",\"One-time security health check\"]',10,1,'2026-06-23 06:35:25','2026-06-23 06:35:25','/assets/images/subscriptions/quick-fix.png'),
(2,'starter-care','Starter Care','Unlimited remote support for 1 year','1 Year',12,0.00,'1 Device','[\"Unlimited remote support for 1 year\",\"Unlimited software troubleshooting\",\"Operating system support\",\"Email and account assistance\",\"Security and antivirus support\",\"Device health checks\",\"Performance tune-ups\",\"Software updates assistance\",\"Printer and scanner support\",\"Browser and application support\",\"New software installation assistance\",\"Data backup guidance\",\"Monthly maintenance recommendations\"]',20,1,'2026-06-23 06:35:25','2026-06-23 06:35:25','/assets/images/subscriptions/starter-care.png'),
(3,'pro-shield','Pro Shield','Transferable protection · up to 3 devices','3 Years',36,0.00,'Up to 3 Devices','[\"Transferable device protection\",\"Device replacement enrollment\",\"Advanced malware and security support\",\"Network and Wi-Fi optimization\",\"Multi-device maintenance\",\"Priority support queue\",\"Annual security audits\",\"Cloud storage setup assistance\",\"Advanced software troubleshooting\",\"Device migration support\",\"Operating system upgrade assistance\",\"Productivity software support\"]',30,1,'2026-06-23 06:35:25','2026-06-23 06:35:25','/assets/images/subscriptions/pro-shield.png'),
(4,'lifetime-elite','Lifetime Elite','10 years support · unlimited devices','10 Years Support',120,0.00,'Unlimited Devices','[\"Unlimited device coverage\",\"Unlimited device transfers\",\"Premium priority support\",\"Dedicated support specialists\",\"Comprehensive security assistance\",\"Advanced malware and ransomware guidance\",\"New device onboarding assistance\",\"Device replacement support\",\"Remote setup for computers, printers, and peripherals\",\"Cloud account support\",\"Data migration assistance\",\"System optimization services\",\"Annual technology health reviews\",\"Personalized technical guidance\",\"Priority scheduling\",\"Family and business device support\"]',40,1,'2026-06-23 06:35:25','2026-06-23 06:35:25','/assets/images/subscriptions/lifetime-elite.png');
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;

--
-- Table structure for table `support_messages`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `support_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(40) DEFAULT '',
  `order_number` varchar(40) DEFAULT '',
  `subject` varchar(190) NOT NULL,
  `message` text NOT NULL,
  `source` varchar(20) DEFAULT 'contact',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `support_messages`
--

/*!40000 ALTER TABLE `support_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `support_messages` ENABLE KEYS */;

--
-- Table structure for table `testimonials`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `initials` varchar(5) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `product` varchar(100) DEFAULT NULL,
  `text` text NOT NULL,
  `rating` int(11) NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT IGNORE INTO `testimonials` VALUES
(1,'Brandon Koch','BK','Mn, USA','Microsoft Office','I ordered software from them and when it didn\'t work I called the customer service and I could not understand the guy, he spoke very poor English and I couldn\'t even understand what he said. So I just canceled it and then he didn\'t want to refund me. I would not deal with them again.',3),
(2,'Alyssa Dickens','AD','USA','Microsoft Office','Overall the site was easy to use and had clear step-by-step instructions.',5),
(3,'ALBERT CHAPMAN','AC','New York, USA','Microsoft Office','I like the price. The only problem was that Microsoft stopped it from working and I had to get the company to fix the problem which they did in a timely manner.',4),
(4,'Mike H','MH','NH, USA','Microsoft Office','Easy to find the software I needed: Office & VISIO. The staff were amazing after I had some initial machine compatibility issues. They resolved everything so quickly. I\'ve got a full set of current software. Mike',5),
(5,'bill delp','BD','USA','Microsoft Office','The software works. Had to load a new laptop.',5),
(6,'Dana','D','Nebraska, USA','Microsoft Office','I never got help and never got my software installed.',2);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;

--
-- Table structure for table `topic_hubs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `topic_hubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) NOT NULL,
  `title` varchar(255) NOT NULL,
  `headline` text NOT NULL,
  `audience` varchar(255) NOT NULL DEFAULT '',
  `categories_json` text NOT NULL,
  `blog_tags_json` text NOT NULL,
  `keywords` text NOT NULL,
  `about_link` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(20) NOT NULL DEFAULT '#0078d4',
  `videos_json` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `source` varchar(16) NOT NULL DEFAULT 'manual',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_slug` (`slug`),
  KEY `idx_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topic_hubs`
--

/*!40000 ALTER TABLE `topic_hubs` DISABLE KEYS */;
INSERT IGNORE INTO `topic_hubs` VALUES
(4,'microsoft-office','Microsoft Office — the complete buying guide','Microsoft Office is a one-time-purchase office suite (Word, Excel, PowerPoint, Outlook, Publisher, Access) sold by Maventech at transparent, competitive pricing. Every licence is genuine, lifetime, activates inside the official Microsoft installer, delivered by email, and protected by a 30-day money-back guarantee.','home users, students, freelancers and small-business owners choosing between Office 2024, 2021 and 2019 on Windows or Mac','[\"office-pc\",\"office-mac\",\"office-2024-pc\",\"office-2021-pc\",\"office-2019-pc\",\"office-2024-mac\",\"office-2021-mac\",\"office-2019-mac\",\"apps\",\"microsoft-project\",\"microsoft-visio\"]','[\"%office%\",\"%word%\",\"%excel%\",\"%powerpoint%\",\"%outlook%\",\"%microsoft 365%\",\"%publisher%\"]','Microsoft Office, Office 2024, Office 2021, Office 2019, Office for Mac, Office for PC, Office one-time purchase, Office one time purchase, buy Microsoft Office key, Microsoft Office product key, Office Home and Student, Office Home and Business, Office Professional Plus, Microsoft Project, Microsoft Visio','category.php?slug=apps','#dc2626','[]',1,'seed','2026-09-16 18:45:53','2026-09-16 18:45:53'),
(5,'windows','Microsoft Windows — Windows 11, 10 and Pro buying guide','Microsoft Windows is the world\'s most-used desktop operating system. Maventech sells original, previously-licensed Windows 11 and Windows 10 product keys (Home, Pro and Education) at transparent, competitive pricing as an independent third-party reseller (not affiliated with Microsoft). Pay once, activate inside the official Windows setup, and keep the product key for life — digital delivery by email and 30-day guarantee.','self-builders, IT teams and home upgraders looking for an original, previously-licensed Windows 11 Pro or Windows 10 product key','[\"windows-11\",\"windows-10\",\"windows\",\"os\"]','[\"%windows 11%\",\"%windows 10%\",\"%windows%\"]','Microsoft Windows, Windows 11 Pro, Windows 11 Home, Windows 10 Pro, Windows 10 Home, Windows product key, buy Windows 11 key, Windows lifetime activation, Windows OEM key, Windows 11 vs 10, upgrade to Windows 11','category.php?slug=windows-11','#0078d4','[]',1,'seed','2026-09-16 18:45:53','2026-09-16 18:45:53'),
(6,'antivirus','Antivirus software — Bitdefender, McAfee & internet-security buying guide','Modern antivirus software protects every device in your household from malware, ransomware and identity theft. Maventech carries genuine Bitdefender and McAfee licences for 1, 3, 5 and 10 devices at transparent, competitive pricing. Activates inside the official vendor installer, delivered by email, with our 30-day money-back guarantee.','home users, families and small businesses choosing between Bitdefender Total Security, McAfee Total Protection and other paid antivirus suites','[\"antivirus\",\"bitdefender\",\"mcafee\",\"internet-security\"]','[\"%bitdefender%\",\"%mcafee%\",\"%antivirus%\",\"%malware%\",\"%ransomware%\",\"%internet security%\"]','antivirus, Bitdefender Total Security, McAfee Total Protection, internet security, anti-malware, ransomware protection, family antivirus plans, best antivirus 2026, antivirus for Mac, multi-device antivirus','category.php?slug=antivirus','#16a34a','[]',1,'seed','2026-09-16 18:45:53','2026-09-16 18:45:53');
/*!40000 ALTER TABLE `topic_hubs` ENABLE KEYS */;

--
-- Table structure for table `transaction_logs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `transaction_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gateway` varchar(20) NOT NULL,
  `transaction_id` varchar(120) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(8) NOT NULL DEFAULT 'USD',
  `status` varchar(40) NOT NULL,
  `raw_response` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `gateway` (`gateway`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_logs`
--

/*!40000 ALTER TABLE `transaction_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_logs` ENABLE KEYS */;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'customer',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `username` varchar(60) DEFAULT NULL,
  `department` varchar(40) NOT NULL DEFAULT '',
  `permissions` text DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `theme_pref` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `uniq_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` VALUES
(1,'admin@maventechsoftware.com','Admin','$2y$10$SyFgzuu.aEUJH/QqX/m50uJTNrHT2CDuWkR3KKnpVuCJj0ZaTuVP.','admin','2026-06-12 05:43:27',NULL,'',NULL,1,'light'),
(2,'services@maventechsoftware.com','Admin','$2y$10$ERwNmkuZde.0FWBsvYf57.KItq.CgVV//26/GRfTga1B91dmj5ODy','admin','2026-09-16 15:25:53',NULL,'',NULL,1,'light');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `vibe_history`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `vibe_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vibe` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL DEFAULT 'manual',
  `started_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_started` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vibe_history`
--

/*!40000 ALTER TABLE `vibe_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `vibe_history` ENABLE KEYS */;

--
-- Table structure for table `vibe_schedule`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `vibe_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vibe` varchar(20) NOT NULL,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `label` varchar(120) NOT NULL DEFAULT '',
  `logo_path` varchar(255) NOT NULL DEFAULT '',
  `coupon_code` varchar(40) NOT NULL DEFAULT '',
  `coupon_percent` int(11) NOT NULL DEFAULT 0,
  `applied_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_starts` (`starts_at`),
  KEY `idx_ends` (`ends_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vibe_schedule`
--

/*!40000 ALTER TABLE `vibe_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `vibe_schedule` ENABLE KEYS */;

--
-- Table structure for table `visitor_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `visitor_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(64) NOT NULL DEFAULT '',
  `ip_hash` varchar(64) NOT NULL DEFAULT '',
  `user_agent` varchar(500) NOT NULL DEFAULT '',
  `os` varchar(40) NOT NULL DEFAULT 'Unknown',
  `browser` varchar(40) NOT NULL DEFAULT 'Unknown',
  `device` varchar(20) NOT NULL DEFAULT 'Desktop',
  `country` varchar(8) NOT NULL DEFAULT '',
  `page_url` varchar(255) NOT NULL DEFAULT '',
  `referer` varchar(255) NOT NULL DEFAULT '',
  `visited_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `idx_visited` (`visited_at`),
  KEY `idx_session` (`session_id`),
  KEY `idx_os` (`os`),
  KEY `idx_device` (`device`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor_log`
--

/*!40000 ALTER TABLE `visitor_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor_log` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-21 14:49:30
