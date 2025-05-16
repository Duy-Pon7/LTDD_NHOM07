-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shoestore
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (49,1,9,'kiet1'),(50,4,11,'kiet1');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `category_Image` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Lifestyle','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130330/60b58017-810b-45a8-bf14-9993ab87d2ea.png'),(2,'Jordan','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130430/59997606-9a73-4d54-93ab-14e40ec99ba8.png'),(3,'Running','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130493/8b96af0a-bd8f-4a39-ac5e-b33f12b962df.png'),(4,'Basketball','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130521/75afc65a-bb58-4151-8bf3-7c8757cfecf7.png'),(5,'Football','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130556/28945210-e6cd-4644-9678-3354867acf0a.png'),(6,'Gym','https://res.cloudinary.com/dglm2f7sr/image/upload/v1747130583/ec872dfa-ad50-4b91-9bf0-03f736b02bfe.png');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `country` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fullname` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `note` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `payment_method` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `status` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcpl0mjoeqhxvgeeeq5piwpd3i` (`user_id`),
  CONSTRAINT `FKcpl0mjoeqhxvgeeeq5piwpd3i` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (5,'HCM','2025-05-14','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',240000,'kiet123'),(6,'HCM','2025-05-14','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',240000,'kiet123'),(16,'HCM','2025-05-15','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',1240000,'kiet123'),(17,'HCM','2025-05-15','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',4138000,'kiet123'),(18,'HCM','2025-05-15','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',6207000,'kiet123'),(19,'HCM','2025-05-15','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',660000,'kiet123'),(29,'HCM','2025-05-15','Việt Nam','phanduykiet1@gmail.com','Phan Duy Kiệt',NULL,'Pay on Delivery','0365613732','Pending',2249000,'kiet1'),(30,'HCM','2025-05-15','Việt Nam','phanduykiet1@gmail.com','Phan Duy Kiệt',NULL,'Pay with ZaloPay','0365613732','Pending',969000,'kiet1'),(31,'HN','2025-05-16','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay on Delivery','0357776765','Pending',430000,'kiet123'),(32,'HN','2025-05-16','Việt Nam','phanduykiet29@gmail.com','Phan Duy Kiet',NULL,'Pay with ZaloPay','0357776765','Pending',1080000,'kiet123');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs234mi6jususbx4b37k44cipy` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKs234mi6jususbx4b37k44cipy` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (18,1,16,7),(19,2,17,68),(20,3,18,68),(21,3,19,8),(36,1,29,68),(37,1,29,72),(38,1,30,9),(39,1,30,10),(40,1,30,12),(41,1,31,72),(42,1,31,7),(43,1,32,72),(44,1,32,13);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` date DEFAULT NULL,
  `description` varchar(11111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  `is_selling` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `product_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `sold` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (7,'2022-11-21','Inspired by the original low-profile tennis shoes, the Nike Killshot 2 updates the upper with various textured leathers to create a fresh look. From soft suedes to smooth leathers with the perfect sheen, it\'s courtside attitude with a modern touch. To prove you\'re on top, the rubber gum sole adds the cherry on the bottom.',1,1,250000,'Nike Killshot 2 Leather',96,24,1),(8,'2022-01-21','Comfortable, durable and timeless—it\'s number one for a reason. The classic \'80s construction pairs smooth leather with bold details for style that tracks whether you\'re on court or on the go.',1,1,220000,'Nike Air Force 1 \'07',97,73,1),(9,'2022-10-02','Grounded in greatness, the Air Jordan Rev is designed to give your swings optimal torque and speed. A moveable Air Zoom unit strategically placed in one shoe helps you power a strong, stable swing by capturing the energy generated when your trail foot pushes off. Welcome to the revolution.',1,1,190000,'Air Jordan Rev',99,21,2),(10,'2022-10-10','Comfortable, durable and timeless—it\'s number one for a reason. The classic \'80s construction pairs smooth leather with bold details for style that tracks whether you\'re on court or on the go.',1,1,549000,'Air Jordan 1 Low',99,91,2),(11,'2022-03-09','Celebrate MJ\'s legacy with this shout-out to Chicago\'s 312 area code. With elements from three iconic Jordans (the AJ3, AJ1 and Air Alpha Force), it\'s a modern mash-up that reps the best.',1,1,520000,'Air Jordan Legacy 312 Low',99,11,2),(12,'2022-10-10','Skinny fit jeans by BDG. Rigid denim with a low-rise waist and skinny fit. Classic 5-pocket style with a zip fly & button closure. Urban Outfitters exclusive.',1,1,230000,'BDG Low Rise Skinny Jean',99,76,3),(13,'2022-10-09','Skinny fit jeans by Rolla’s in rigid denim. Features a mid-rise waist and fitted with pockets. Includes a zip fly and button closure.',1,1,599999,'Rolla’s Stinger Skinny Fit Jean',99,91,3),(14,'2022-11-07','Stripe pattern mesh basketball shorts by Standard Cloth. Fitted with pockets at the sides and back. Includes an elastic waistband with an adjustable tie at the waist. Urban Outfitters exclusive.',1,1,180000,'Standard Cloth Striped Mesh Basketball Short',100,20,3),(68,'2025-05-15','Maximum cushioning in the Vomero provides a comfortable ride for everyday runs. Our softest, most cushioned ride has lightweight ZoomX foam stacked on top of responsive ReactX foam in the midsole. Plus, a redesigned traction pattern offers a smooth heel-to-toe transition.',1,1,206900,'Nike Vomero 18',86,14,3),(69,'2022-10-10','Maximum cushioning in the Vomero provides a comfortable ride for everyday runs. Our softest, most cushioned ride has lightweight ZoomX foam stacked on top of responsive ReactX foam in the midsole. Plus, a redesigned traction pattern offers a smooth heel-to-toe transition.',1,1,399999,'Nike Vomero 19',100,20,5),(70,'2022-10-10','Maximum cushioning in the Vomero provides a comfortable ride for everyday runs. Our softest, most cushioned ride has lightweight ZoomX foam stacked on top of responsive ReactX foam in the midsole. Plus, a redesigned traction pattern offers a smooth heel-to-toe transition.',1,1,180000,'Nike Vomero 20',100,20,5),(71,'2022-11-07','From under-rated at EYBL to MVP at the highest level, KD has always been single-minded on hoops. This special KD18 is dedicated to the next generation looking to make the leap just like the Slim Reaper did. A combo of Air Zoom cushioning and Nike Air gives you unreal responsive cushioning, so you can hoop all day. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.',1,1,699999,'KD18 EYBL EP',100,20,5),(72,'2025-05-15','From under-rated at EYBL to MVP at the highest level, KD has always been single-minded on hoops. This special KD18 is dedicated to the next generation looking to make the leap just like the Slim Reaper did. A combo of Air Zoom cushioning and Nike Air gives you unreal responsive cushioning, so you can hoop all day. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.',1,1,180000,'KD18 EP',92,28,4),(73,'2025-05-15','From under-rated at EYBL to MVP at the highest level, KD has always been single-minded on hoops. This special KD18 is dedicated to the next generation looking to make the leap just like the Slim Reaper did. A combo of Air Zoom cushioning and Nike Air gives you unreal responsive cushioning, so you can hoop all day. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.',1,1,520000,'KD19 EP',100,20,4),(74,'2022-10-10','From under-rated at EYBL to MVP at the highest level, KD has always been single-minded on hoops. This special KD18 is dedicated to the next generation looking to make the leap just like the Slim Reaper did. A combo of Air Zoom cushioning and Nike Air gives you unreal responsive cushioning, so you can hoop all day. With its extra-durable rubber outsole, this version gives you traction for outdoor courts.',1,1,599999,'KD18 EYBL EP',100,20,4),(75,'2025-05-15','Nike Air Monarch IV sets you up for working out with durable leather on top for support. Lightweight foam teams up with Nike Air cushioning for comfort in every stride.',1,1,180000,'Nike Air Monarch IV',99,21,6),(77,'2022-10-10','Nike Air Monarch IV sets you up for working out with durable leather on top for support. Lightweight foam teams up with Nike Air cushioning for comfort in every stride.',1,1,189999,'Nike Air Monarch VIII',100,20,6),(78,'2025-05-15','The sneaker that always steps out with a fresh blast of eye-catching attitude. The Air Jordan 1 Low SE has the profile and timeless details that you adore, in colours that resonate with your personal expression.',1,1,299999,'Air Jordan 1 Low SE',111,0,2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url_image` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6oo0cvcdtb6qmwsga468uuukk` (`product_id`),
  CONSTRAINT `FK6oo0cvcdtb6qmwsga468uuukk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (25,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293762/97365690-ed46-47f4-8e12-489f18f44aad.png',7),(26,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293800/399a9df6-32e1-441d-9764-2519f2d00d59.png',7),(27,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293762/97365690-ed46-47f4-8e12-489f18f44aad.png',7),(28,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293800/399a9df6-32e1-441d-9764-2519f2d00d59.png',7),(29,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293849/60fdb1d6-c02b-41dd-a5e3-d67940a522a4.png',8),(30,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293894/ff594b42-7143-43aa-9f23-da824597bde5.png',8),(31,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293849/60fdb1d6-c02b-41dd-a5e3-d67940a522a4.png',8),(32,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747293894/ff594b42-7143-43aa-9f23-da824597bde5.png',8),(33,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294071/fd457e9c-2747-412a-8651-19f1c37e04b1.png',9),(34,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294100/ee54a7d1-705b-453c-9330-42dd6164ad7c.png',9),(35,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294071/fd457e9c-2747-412a-8651-19f1c37e04b1.png',9),(36,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294100/ee54a7d1-705b-453c-9330-42dd6164ad7c.png',9),(37,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294561/b3813e2e-acc5-4cb8-9160-fc2be985984e.png',10),(38,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294577/5d57a1b9-1647-4172-af3f-f62ff536d7ef.png',10),(39,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294561/b3813e2e-acc5-4cb8-9160-fc2be985984e.png',10),(40,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294577/5d57a1b9-1647-4172-af3f-f62ff536d7ef.png',10),(41,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294601/16d7f030-421b-4c39-912c-e83898835574.png',11),(42,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294601/16d7f030-421b-4c39-912c-e83898835574.png',11),(43,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294601/16d7f030-421b-4c39-912c-e83898835574.png',11),(44,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294601/16d7f030-421b-4c39-912c-e83898835574.png',11),(45,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294666/e4db549e-5a48-4363-9061-5e234c961268.png',12),(46,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294666/e4db549e-5a48-4363-9061-5e234c961268.png',12),(47,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294666/e4db549e-5a48-4363-9061-5e234c961268.png',12),(48,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747294666/e4db549e-5a48-4363-9061-5e234c961268.png',12),(49,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295764/612706e9-9578-4cf8-9768-49270fd62a93.png',13),(50,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295784/aebc7af9-b570-4927-b858-46f79c911781.png',13),(51,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295764/612706e9-9578-4cf8-9768-49270fd62a93.png',13),(52,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295784/aebc7af9-b570-4927-b858-46f79c911781.png',13),(53,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295821/0ebc712f-6a1d-4acf-9e89-5fcfa3666aea.png',14),(54,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295850/dc14e122-c390-4d12-97f7-ff696a57627e.png',14),(55,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295821/0ebc712f-6a1d-4acf-9e89-5fcfa3666aea.png',14),(56,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295850/dc14e122-c390-4d12-97f7-ff696a57627e.png',14),(213,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747294764/ShoeStore/s1d1duup0zucqu7fvrph.jpg',68),(214,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747294765/ShoeStore/cp6i9yjj5tngkn8kh8pg.jpg',68),(215,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747294767/ShoeStore/xr7vgk4dic9v0zpatdcm.jpg',68),(216,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747294769/ShoeStore/gc06xehxw6sj2vmbxxpz.jpg',68),(217,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295964/c246b129-f004-4be8-8096-7e54deb42596.png',69),(218,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295964/c246b129-f004-4be8-8096-7e54deb42596.png',69),(219,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295964/c246b129-f004-4be8-8096-7e54deb42596.png',69),(220,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747295964/c246b129-f004-4be8-8096-7e54deb42596.png',69),(221,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296022/b1667e92-e112-4a80-8cb3-ee91313ab7ac.png',70),(222,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296022/b1667e92-e112-4a80-8cb3-ee91313ab7ac.png',70),(223,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296022/b1667e92-e112-4a80-8cb3-ee91313ab7ac.png',70),(224,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296022/b1667e92-e112-4a80-8cb3-ee91313ab7ac.png',70),(225,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296057/d1e47b8e-802f-44aa-845d-bf9112b7a135.png',71),(226,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296057/d1e47b8e-802f-44aa-845d-bf9112b7a135.png',71),(227,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296057/d1e47b8e-802f-44aa-845d-bf9112b7a135.png',71),(228,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296057/d1e47b8e-802f-44aa-845d-bf9112b7a135.png',71),(229,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',72),(230,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',72),(231,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',72),(232,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',72),(233,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296234/08ce740d-3cd0-43c9-b4be-fd6e8e5f086a.png',73),(234,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296234/08ce740d-3cd0-43c9-b4be-fd6e8e5f086a.png',73),(235,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296234/08ce740d-3cd0-43c9-b4be-fd6e8e5f086a.png',73),(236,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296234/08ce740d-3cd0-43c9-b4be-fd6e8e5f086a.png',73),(237,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296287/98bc3290-c81c-4b7e-a623-5adb33c926dc.png',74),(238,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296287/98bc3290-c81c-4b7e-a623-5adb33c926dc.png',74),(239,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296287/98bc3290-c81c-4b7e-a623-5adb33c926dc.png',74),(240,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296287/98bc3290-c81c-4b7e-a623-5adb33c926dc.png',74),(241,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296337/afbd342f-c8b1-4bde-b6c6-43adf0862df6.png',75),(242,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296337/afbd342f-c8b1-4bde-b6c6-43adf0862df6.png',75),(243,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296337/afbd342f-c8b1-4bde-b6c6-43adf0862df6.png',75),(244,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296337/afbd342f-c8b1-4bde-b6c6-43adf0862df6.png',75),(249,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',77),(250,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',77),(251,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',77),(252,'https://res.cloudinary.com/dglm2f7sr/image/upload/v1747296185/61b2d9b9-389b-476e-b155-41fe733e6483.png',77),(253,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747324136/ShoeStore/vq96zyoq1xiecrknlxir.jpg',78),(254,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747324138/ShoeStore/bnozc8ip90ng9ofxjysp.jpg',78),(255,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747324140/ShoeStore/dj94bf6zx5pfbnutgmra.jpg',78),(256,'http://res.cloudinary.com/dglm2f7sr/image/upload/v1747324142/ShoeStore/sf39xehdf8urxdsapdsp.jpg',78);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `avatar` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `login_type` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone_number` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `role` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_name` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `address` varchar(1111) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','phanduykiet29@gmail.com','default','MQ==','0357776765','admin','Phan Duy Kiet','HCM'),('duy','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','nhoxqd@gmail.com','default','MTIz',NULL,'user','duy truong quoc',NULL),('kiet','https://haycafe.vn/wp-content/uploads/2022/02/Avatar-trang-den.png','phanduykiet22@gmail.com','default','MQ==',NULL,'user','kiet',NULL),('kiet1','http://res.cloudinary.com/dglm2f7sr/image/upload/v1747323944/Avatar/f4nricgcnefzalxjayqp.jpg','phanduykiet1@gmail.com','default','MQ==','0365612874','user','Phan Duy K','HCM'),('kiet123','http://res.cloudinary.com/dglm2f7sr/image/upload/v1747355353/Avatar/ykf1znua8pzeglykha1m.jpg','phanduykiet29@gmail.com','default','MTIz','0357776765','user','Phan Duy Kiet','HCM'),('kiet29','http://res.cloudinary.com/dglm2f7sr/image/upload/v1747303049/Avatar/ctlxjmpq8vkj3iio2cog.jpg','phanduykiet10@gmail.com','default','MTIz','0365613732','user','Phan Duy Kiệt','HCM');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16  7:50:58
