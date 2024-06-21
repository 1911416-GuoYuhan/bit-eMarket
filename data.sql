-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: 
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Current Database: `coursedesign`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `coursedesign` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `coursedesign`;

--
-- Current Database: `market`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `market` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `market`;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`),
  KEY `cart_user_foreign_idx` (`user_id`),
  KEY `cart_goods_foreign_idx` (`goods_id`),
  CONSTRAINT `cart_goods_foreign` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cart_user_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (4,28,1),(6,2,5),(8,1,9),(13,7,3),(28,1,28),(30,26,9),(32,1,7);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comments` varchar(45) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_goods_foreign_idx` (`goods_id`),
  CONSTRAINT `comment_goods_foreign` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,28,'吉他真精美',NULL),(3,3,28,'带电池吗？',NULL);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品主键',
  `type_id` int(11) DEFAULT NULL COMMENT '商品分类，外键',
  `user_id` int(11) NOT NULL COMMENT '用户外键',
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `price` float(11,2) NOT NULL COMMENT '出售价格',
  `img_url` varchar(45) DEFAULT NULL,
  `real_price` float(11,2) DEFAULT NULL COMMENT '真实价格',
  `create_time` date DEFAULT NULL COMMENT '发布时间',
  `polish_time` date DEFAULT NULL COMMENT '擦亮时间，按该时间进行查询，精确到时分秒',
  `end_time` date DEFAULT NULL COMMENT '下架时间',
  `description` text DEFAULT NULL COMMENT '详细信息',
  `comment_num` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `catelog_id` (`type_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goods_type_foreign` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `goods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (1,6,1,'精美吉他',130.00,'吉他.jpg',160.00,'2017-05-13','2024-06-02','2020-05-23','自用二手吉他，9成新，低价出售，有意者联系。',NULL,1),(3,3,1,'无线鼠标',23.00,'无线鼠标.jpg',48.00,'2017-05-13','2024-06-02','2022-05-23','罗技无线鼠标，自用一个月，9成新。',NULL,1),(4,5,3,'奥索卡短靴',150.00,'短靴.jpg',520.00,'2018-09-11','2024-06-02','2022-05-14','非全新，喜欢联系',NULL,1),(5,1,2,'数码相机',580.00,'相机.jpg',1350.00,'2017-05-14','2024-06-02','2019-03-06','自用的数码相机，一年前购买，非常爱好，无磕碰。可议价。',NULL,0),(6,1,2,'笔记本电脑',690.00,'笔记本电脑.jpg',2300.00,'2017-05-14','2024-06-02','2018-09-10','7成新14寸笔记本电脑，商务本，适合办公，2G内存。',NULL,0),(7,3,2,'收纳盒',15.00,'收纳盒.jpg',36.00,'2017-05-14','2024-06-02','2025-10-05','3层塑料物品收纳盒，毕业了，低价出售。',NULL,1),(8,3,1,'台灯',32.00,'台灯.jpg',58.00,'2017-05-14','2024-06-02','2018-09-10','考研时购买的台灯，可插USB接口。',NULL,1),(9,5,2,'女鞋',35.00,'女鞋.jpg',86.00,'2017-05-14','2024-06-02','2018-09-10','学生女鞋',NULL,1),(16,6,2,'耐克运动书包',56.00,'运动书包.jpg',198.00,'2017-05-14','2024-06-02','2018-09-10','去年年底购买的耐克书包，8成新，无损坏，可以装电脑，很漂亮，有意者联系。',NULL,1),(24,7,3,'玉挂',260.00,'玉挂.jpg',450.00,'2017-05-14','2024-06-02','2018-09-10','纯玉，购买于食品店，有发票。',NULL,1),(28,3,3,'公牛插排',15.00,'公牛插座.jpg',36.00,'2017-05-14','2024-06-02','2022-05-23','京东购买的插排，9成新。',NULL,1),(36,3,2,'手机充电器',15.00,'充电器.jpg',38.00,'2017-05-15','2024-06-02','2022-05-23','华为手机充电器，手机已毁，现转让充电器。',NULL,1),(50,3,20,'电风扇',25.00,'电扇.jpg',50.00,'2018-09-10','2024-06-02','2019-09-11','风大',NULL,1),(61,2,28,'白色摩托车',899.00,'白摩托车.jpg',1500.00,'2024-06-02','2024-06-02','2025-06-04','',NULL,1),(62,5,28,'白色羽绒服',80.00,'白色羽绒服.jpg',250.00,'2024-06-02','2024-06-02','2025-06-03','女生自用',NULL,1),(63,1,28,'荒野大镖客',20.00,'大镖客.png',199.00,'2024-06-02','2024-06-02','2024-08-08','买了没玩',NULL,1),(64,2,28,'黑色摩托车',89.00,'黑摩托车.jpg',580.00,'2024-06-02','2024-06-02','2025-06-18','',NULL,1),(65,4,28,'我不喜欢这世界原装',5.00,'我不.jpg',25.00,'2024-06-02','2024-06-02','2024-08-13','',NULL,1),(66,1,28,'怪物猎人世界',50.00,'怪猎.png',189.00,'2024-06-02','2024-06-02','2024-06-29','ns卡带',NULL,1),(67,5,28,'黑色羽绒服',12.00,'黑色羽绒服.jpg',360.00,'2024-06-02','2024-06-02','2024-06-15','女生自用',NULL,1),(68,2,28,'蓝色摩托车',246.00,'蓝摩托车.jpg',1850.00,'2024-06-02','2024-06-02','2024-06-25','',NULL,1),(69,8,28,'青花瓷碗',2199.00,'瓷器.jpg',3599.00,'2024-06-02','2024-06-02','2024-07-18','贵重瓷器，见面交易',NULL,1),(70,5,28,'老登工装',59.00,'工装.jpg',260.00,'2024-06-02','2024-06-02','2024-09-17','最近很火的工装，买了没穿',NULL,1),(71,1,28,'华为Mate40',1200.00,'手机.jpg',3799.00,'2024-06-02','2024-06-02','2024-10-09','',NULL,1),(72,7,28,'LV皮包',5800.00,'手提包.jpg',23900.00,'2024-06-02','2024-06-02','2024-11-11','',NULL,1),(73,5,28,'碎花洋裙',105.00,'女装.jpg',350.00,'2024-06-02','2024-06-02','2024-06-24','',NULL,1);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`goods_BEFORE_INSERT` BEFORE INSERT ON `goods` FOR EACH ROW
BEGIN
 if new.create_time is null then 
      set new.create_time = now(); 
      set new.polish_time = now();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`goods_AFTER_INSERT` AFTER INSERT ON `goods` FOR EACH ROW
BEGIN
if new.type_id is not null
then
update type set number = number+1
where id = new.type_id;
end if;
if new.user_id is not null
then 
update user set goods_num = goods_num+1
where id = new.user_id;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`goods_BEFORE_UPDATE` BEFORE UPDATE ON `goods` FOR EACH ROW
BEGIN
 if new.polish_time is null then 
      set new.polish_time = now();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`goods_AFTER_DELETE` AFTER DELETE ON `goods` FOR EACH ROW
BEGIN
if old.type_id is not null
then
update type set number = number-1
where id = old.type_id;

end if;

if old.user_id is not null
then 
update user set goods_num = goods_num-1
where id = old.user_id;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (10),(10),(10),(10);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trade`
--

DROP TABLE IF EXISTS `trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade` (
  `id` int(11) NOT NULL,
  `saler_id` int(11) NOT NULL COMMENT '卖家id',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '交易状态\n1：未付款 2：未发货 3：正在路上 4：已确认收货 5：已评价',
  `create_time` date DEFAULT NULL COMMENT '交易创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `deal_user_buyer_foreign_idx` (`buyer_id`),
  KEY `deal_user_saler_foreign_idx` (`saler_id`),
  KEY `deal_goods_foreign_idx` (`goods_id`),
  CONSTRAINT `deal_goods_foreign` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deal_user_buyer_foreign` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `deal_user_saler_foreign` FOREIGN KEY (`saler_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='货品交易';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trade`
--

LOCK TABLES `trade` WRITE;
/*!40000 ALTER TABLE `trade` DISABLE KEYS */;
INSERT INTO `trade` VALUES (2,1,28,1,2,'2024-06-02'),(3,2,1,7,4,'2018-09-11'),(4,3,1,24,3,'2018-09-11'),(5,2,1,36,5,'2018-09-11'),(8,2,28,6,2,'2024-06-07'),(9,2,28,5,2,'2024-06-07'),(21,20,1,50,3,'2018-09-11'),(23,3,1,4,2,'2018-09-11'),(26,2,1,16,5,'2018-09-11'),(29,2,1,6,2,'2018-09-13'),(34,1,1,8,2,'2018-09-13');
/*!40000 ALTER TABLE `trade` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`deal_BEFORE_INSERT` BEFORE INSERT ON `trade` FOR EACH ROW
BEGIN
 if new.create_time is null then 
      set new.create_time = now(); 
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`trade_AFTER_INSERT` AFTER INSERT ON `trade` FOR EACH ROW
BEGIN

update goods set status=0 where id = new.goods_id;
update user set coin = coin-(select price from goods where id=new.goods_id) where id=new.buyer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`trade_BEFORE_UPDATE` BEFORE UPDATE ON `trade` FOR EACH ROW
BEGIN

/* 买家付款后的触发事件：从买家账户里扣钱并设置商品状态下架 */
if(new.status = 2)
then
update user set coin = coin-(select price from goods where id=new.goods_id) where id=new.buyer_id;
update goods set status=0 where id = new.goods_id;
end if;

/* 确认收货的触发：当买家确认收货之后要把钱存到卖家账户内 */
if(new.status = 4)
then
update user set coin = coin+(select price from goods where id=new.goods_id) where id=new.saler_id;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`trade_AFTER_DELETE` AFTER DELETE ON `trade` FOR EACH ROW
BEGIN
/* 取消订单的触发器：设置goods表id为goods_id的商品状态上架，买家账户需要加钱*/
update goods set status=1 where id = old.goods_id;
update user set coin=coin+(select goods.price from goods where id=old.goods_id) where id=old.buyer_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `number` int(11) DEFAULT 0 COMMENT '该分类下的商品数量',
  `status` tinyint(10) DEFAULT 0 COMMENT '分类状态，0正常，1暂用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'闲置数码',5,1),(2,'校园代步',3,1),(3,'电器日用',6,1),(4,'图书教材',1,1),(5,'美妆衣物',6,1),(6,'运动棋牌',2,1),(7,'票券小物',2,1),(8,'线下交易',1,1);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录使用的手机号',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `QQ` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '即时通讯',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `goods_num` int(11) DEFAULT 0 COMMENT '发布过的物品数量',
  `power` tinyint(10) DEFAULT 0 COMMENT '权限值，0：普通用户，1：管理员',
  `coin` float DEFAULT 0 COMMENT '账户金额',
  `credit` float DEFAULT 5,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'13500000000','test','test','1758000000','2017-05-10',1,0,6253,3.9375),(2,'13700000001','lzf','123456','1748486486','2017-05-14',6,0,446,4.1875),(3,'15500000000','maj','123456','1948487487','2017-05-14',3,0,0,4.5),(4,'15600000000','lr','123456','1958487487','2017-05-15',0,0,0,5),(5,'19484874876','admin','admin','125697230','2017-05-01',0,1,0,5),(7,'18800000000','ton','123456','468531678','2018-09-06',0,1,50.8,0.625),(20,'15533339693','joker','123456','396558528','2018-09-07',1,0,75.48,2.79688),(22,'1','xiaokeai','hahaha',NULL,'2018-09-08',0,0,0,5),(26,'15946876666','hua','123456',NULL,'2018-09-13',0,0,0,5),(27,'15545135555','messi','messi','155589441','2018-09-13',0,0,50,5),(28,'13600000000','gyh','123456','1183999999','2024-05-30',13,1,98600,5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `market`.`user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
 if new.create_time is null then 
      set new.create_time = now(); 
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `mydatabase`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mydatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mydatabase`;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
  `pay_id` varchar(50) DEFAULT NULL COMMENT '支付ID',
  `value` varchar(500) DEFAULT NULL COMMENT '文字信息',
  `feedbacks_time` varchar(30) DEFAULT NULL COMMENT '时间',
  `feedbacks_status` int(11) DEFAULT NULL COMMENT '类型（1投诉、0建议、-1反馈）',
  `orders_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `feedbacks_id` varchar(50) NOT NULL COMMENT '投诉、建议、反馈信息ID（主键、随机码）',
  `solve_status` int(11) DEFAULT NULL COMMENT '管理员处理状态（1已处理、0未处理、-1不予处理）',
  `solve_value` varchar(500) DEFAULT NULL COMMENT '管理员处理结果信息',
  `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  PRIMARY KEY (`feedbacks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES ('324021bf-aa22-4388-b442-b034a8b6123a','2a7fad7e-4624-4fbc-b186-b16a628236d7','2a7fad7e-4624-4fbc-b186-b16a628236d7','123','2019/12/19 下午8:23:12',3,'080e38f7-f422-4979-946b-d82167139248','3709d98c-7d0b-44bc-8197-fb61aba39c7b',1,'嗯','匡威低帮男鞋'),('324021bf-aa22-4388-b442-b034a8b6123a','2a7fad7e-4624-4fbc-b186-b16a628236d7','2a7fad7e-4624-4fbc-b186-b16a628236d7','这鞋坏了还拿出来卖','2019/12/19 下午5:12:22',1,'080e38f7-f422-4979-946b-d82167139248','dfc64137-9d03-4664-b811-5d86de5afb47',0,'','匡威低帮男鞋'),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','8c5b5a4c-0728-4775-9c3a-3bebd210a698','8c5b5a4c-0728-4775-9c3a-3bebd210a698','商讨如何认识哇','2019/12/19 下午5:31:48',1,'f56a0405-a0e0-4a1b-9332-df084598b2c2','eed92d92-3a8c-4d3c-bd7c-18c46ad73e66',1,'','excelsior 饼干鞋');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `goods_id` varchar(50) NOT NULL COMMENT '商品ID（主键，随机码）',
  `dscrip` varchar(500) DEFAULT NULL COMMENT '商品介绍信息',
  `price` double DEFAULT NULL COMMENT '商品价格',
  `goods_level` double DEFAULT NULL COMMENT '商品新旧程度',
  `up_status` int(11) DEFAULT NULL COMMENT '上架状态',
  `use_status` int(11) DEFAULT NULL COMMENT '可用状态',
  `hot` double DEFAULT NULL COMMENT '热度信息',
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES ('324021bf-aa22-4388-b442-b034a8b6123a','0d9160f9-bcc1-4e07-bed0-1809be3fafbf','多姿多彩的瓷器是中国古代的伟大发明之一，\"瓷器\"与\"中国\"在英文中同为一词，充分说明中国瓷器的精美绝伦完全可以作为中国的代表。 ',25,92,1,1,0,'瓷器碗'),('324021bf-aa22-4388-b442-b034a8b6123a','2a7fad7e-4624-4fbc-b186-b16a628236d7','集复古、流行、环保于一身的ALL STAR帆布鞋，是美国文化的精神象征，以其随心所欲，自由自在没有约束的穿着形态，更成为追求自我时尚的青年人的忠实拍档。',450,96,1,1,0,'匡威低帮男鞋'),('324021bf-aa22-4388-b442-b034a8b6123a','5a8dc2e8-666b-48f4-90d4-96999d7a5e1a','我不喜欢这个世界我只喜欢你 乔一青春暖心故事集暖萌甜宠恋爱 都市爱情青春小说暖心故事 恋爱成长回忆',28,80,1,1,0,'不喜世界 只喜欢你'),('324021bf-aa22-4388-b442-b034a8b6123a','7e82e230-ceac-488e-bd84-22999b268c2c','iPhone 11 Pro是美国Apple（苹果公司）第一支命名为Pro的手机，采用后置三摄设计，配色有暗夜绿、太空灰、银白色和金色四款。售价8699起。二手91新7800，赶快行动。',7800,91,1,1,0,'Iphone 11 Pro'),('324021bf-aa22-4388-b442-b034a8b6123a','8a5cc3bc-3469-40d9-8f96-f4e38094a8d2','Steam平台是Valve公司聘请BitTorrent(BT下载)发明者布拉姆·科恩亲自开发设计的游戏平台。Steam平台是目前全球最大的综合性数字发行平台之一。',206,99,1,1,0,'Steam 特卖'),('324021bf-aa22-4388-b442-b034a8b6123a','8a60cde4-8fa4-4d61-b7c7-3594825fe459','立马车业集团有限公司是专业从事新能源交通工具产品研发、生产制造、应用推广于一体的大型集团化高新技术企业。是中国电动车行业最具影响力的品牌。',1500,75,1,1,0,'立马摩托车'),('324021bf-aa22-4388-b442-b034a8b6123a','8c5b5a4c-0728-4775-9c3a-3bebd210a698','源起于最初的硫化鞋工业，但为了展现“比高还要更高”的热情与希望，这样的硫化鞋品牌成为“EXCELSIOR”。',349,95,1,1,0,'excelsior 饼干鞋'),('324021bf-aa22-4388-b442-b034a8b6123a','96f03b18-b293-4122-b929-3160ec3a0e58','自1854年以来，代代相传至今的路易威登，以卓越品质、杰出创意和精湛工艺成为时尚旅行艺术的象征 。产品包括手提包，旅行用品，小型皮具，配饰，鞋履，成衣，腕表，高级珠宝及个性化订制服务等。',19988,95,1,1,0,'LV 手提包'),('324021bf-aa22-4388-b442-b034a8b6123a','a984563b-e7af-4161-bfae-e4c04c7e8f76','棉衣女2019冬季新款韩版短款面包服宽松加厚学生羽绒棉服小棉袄潮',168,95,1,1,0,'棉衣女'),('324021bf-aa22-4388-b442-b034a8b6123a','adf374a4-4833-48b8-a56d-c0501a5418fe','工装裤本来是男装，但时装化后却更受女孩子的喜爱。工装裤是休闲的、青春的、男孩子气的。',98.99,96,1,1,0,'休闲工装裤男'),('324021bf-aa22-4388-b442-b034a8b6123a','c265cdfe-3d0e-4368-b44a-1401546b8396','Converse诞生于1908年。创办以来Converse坚持品牌的独立性设计，不追随。最初只生产“橡胶鞋”，但很快就开始做网球和篮球鞋。匡威全球总部正式落地美国波士顿。',345,91,1,1,0,'匡威高帮帆布鞋'),('324021bf-aa22-4388-b442-b034a8b6123a','c28992ba-823f-43c8-a0f9-82fac4271c4a','华为P30，是华为公司旗下一款手机。手机搭载海思Kirin 980处理器，屏幕为6.1英寸，分辨率2340*1080像素。 摄像头最大30倍数码变焦。',3000,95,1,1,0,'HUAWEI华为P30'),('324021bf-aa22-4388-b442-b034a8b6123a','d71920f7-2c18-4758-92c0-d0285d56bad6','百褶裙蝴蝶结打底裙秋冬内搭复古碎花连衣裙长袖修身显瘦a字裙潮',189,97,1,1,0,'日系轻熟女装'),('324021bf-aa22-4388-b442-b034a8b6123a','dd879579-4ca8-451b-93c9-b00929633b49','回忆森林春秋日系文艺复古学生工装夹克白色牛仔宽松短外套女上衣',108,99,1,1,0,'学生工装女上衣');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsurl`
--

DROP TABLE IF EXISTS `goodsurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsurl` (
  `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
  `img_url` varchar(200) DEFAULT NULL COMMENT '商品图片URL信息',
  `img_id` varchar(50) NOT NULL,
  PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsurl`
--

LOCK TABLES `goodsurl` WRITE;
/*!40000 ALTER TABLE `goodsurl` DISABLE KEYS */;
INSERT INTO `goodsurl` VALUES ('7b901fe3-25e4-40b5-aafe-8a84fb8e525d','H:/imgUpload/7b901fe3-25e4-40b5-aafe-8a84fb8e525d57b44927-600b-4b55-8d01-fa9935899623.jpg','038d81e7-dfa7-44be-997c-be5e3ea530fc'),('d71920f7-2c18-4758-92c0-d0285d56bad6','H:/imgUpload/d71920f7-2c18-4758-92c0-d0285d56bad63b494e40-ceac-4c75-b8e2-b2762580ac51.jpg','05da8dcb-c576-4b02-94da-b1cc7a518ba3'),('a984563b-e7af-4161-bfae-e4c04c7e8f76','H:/imgUpload/a984563b-e7af-4161-bfae-e4c04c7e8f76c8eaf0af-fd5e-4541-af61-8924ac11eeec.jpg','0a3ee26d-3889-41d3-b72c-2b18dfd8f8b9'),('8c5b5a4c-0728-4775-9c3a-3bebd210a698','H:/imgUpload/8c5b5a4c-0728-4775-9c3a-3bebd210a698dd8127ec-c67a-451e-9cbe-374569a5e33c.jpg','141293cc-7e37-4dee-b409-fa14d2d24875'),('a984563b-e7af-4161-bfae-e4c04c7e8f76','H:/imgUpload/a984563b-e7af-4161-bfae-e4c04c7e8f761dd421f5-a278-4cfd-a61c-de4b41ed494f.jpg','176b9770-65ab-43c3-9f87-10f4cc28bb1b'),('01ce7ae0-dae6-4095-87e9-b03609f84e56','H:/imgUpload/01ce7ae0-dae6-4095-87e9-b03609f84e56a7d0704b-2571-409a-984b-f287acd9b207.jpg','2811d580-94c9-4244-bf75-1ccea2cd16f8'),('8a60cde4-8fa4-4d61-b7c7-3594825fe459','H:/imgUpload/8a60cde4-8fa4-4d61-b7c7-3594825fe459b0e07368-4e75-4f0b-9433-ecb0736768d0.jpg','28b292c1-f527-4643-b310-cfddf2943703'),('0d9160f9-bcc1-4e07-bed0-1809be3fafbf','H:/imgUpload/0d9160f9-bcc1-4e07-bed0-1809be3fafbf2f0a2b16-4131-43a0-a9f7-e4953e1dd3f8.jpg','29cedd43-5d6e-43b0-ace4-ba4ddace9384'),('dd879579-4ca8-451b-93c9-b00929633b49','H:/imgUpload/dd879579-4ca8-451b-93c9-b00929633b49ddb69078-66c6-4b77-b6d7-91a6fa226e09.jpg','2bd354f9-d8d3-450b-b8ad-cebb2b8dc883'),('8a60cde4-8fa4-4d61-b7c7-3594825fe459','H:/imgUpload/8a60cde4-8fa4-4d61-b7c7-3594825fe45939ed2968-e96d-4f30-8af4-c5eb1249f160.jpg','33d02bd4-fa5a-454c-a85a-12b0d99346f8'),('8a5cc3bc-3469-40d9-8f96-f4e38094a8d2','H:/imgUpload/8a5cc3bc-3469-40d9-8f96-f4e38094a8d2294fd0ce-97f7-4377-93a4-671f397ec41e.png','3b69f77d-0fc1-4397-87b3-da640248386c'),('8a5cc3bc-3469-40d9-8f96-f4e38094a8d2','H:/imgUpload/8a5cc3bc-3469-40d9-8f96-f4e38094a8d213ea4361-e69d-4bfe-a1c6-2c8bc94f8739.png','41acfa80-6727-4c9c-ae2d-e68e2f550309'),('8a60cde4-8fa4-4d61-b7c7-3594825fe459','H:/imgUpload/8a60cde4-8fa4-4d61-b7c7-3594825fe459f9d4a3f0-a192-4c09-9037-ab34f4fe0683.jpg','4246c6a6-55d6-4437-b531-3b6138765ffb'),('7e82e230-ceac-488e-bd84-22999b268c2c','H:/imgUpload/7e82e230-ceac-488e-bd84-22999b268c2c2c745fe4-35df-43f8-ad8a-faa2c79e3392.jpg','44c0a685-6226-46ae-826a-679b1da6b5f9'),('dd879579-4ca8-451b-93c9-b00929633b49','H:/imgUpload/dd879579-4ca8-451b-93c9-b00929633b49a66b4f2a-f8f3-4d63-9c94-4ed534befe38.jpg','460f5ac1-e102-4601-939d-6564ec10884b'),('c265cdfe-3d0e-4368-b44a-1401546b8396','H:/imgUpload/c265cdfe-3d0e-4368-b44a-1401546b8396b3360785-3d4b-47f2-8019-b4eb2c15c38d.jpg','4be2964b-7096-47f9-91a4-ffaa8b14965f'),('5a8dc2e8-666b-48f4-90d4-96999d7a5e1a','H:/imgUpload/5a8dc2e8-666b-48f4-90d4-96999d7a5e1a6e5d029f-50cb-4478-95e9-ba174c01e4ac.jpg','5009703e-2674-422a-9a24-72ff518e35e5'),('c28992ba-823f-43c8-a0f9-82fac4271c4a','H:/imgUpload/c28992ba-823f-43c8-a0f9-82fac4271c4a3822d84a-db40-477d-8271-c710da1a444e.jpg','51003712-e998-4ca9-bcfa-1675cadb3e6d'),('2a7fad7e-4624-4fbc-b186-b16a628236d7','H:/imgUpload/2a7fad7e-4624-4fbc-b186-b16a628236d7216c121a-75db-4dfa-8d82-591c3a932630.jpg','51a0d408-8de5-414c-b79e-f900a384b1b9'),('7b901fe3-25e4-40b5-aafe-8a84fb8e525d','H:/imgUpload/7b901fe3-25e4-40b5-aafe-8a84fb8e525d5b0db1c2-7ba4-47c9-b6e3-707a40379b86.jpg','574df010-882c-4ad0-9bc9-79143ce67b6e'),('c265cdfe-3d0e-4368-b44a-1401546b8396','H:/imgUpload/c265cdfe-3d0e-4368-b44a-1401546b8396aea735f9-432d-4d47-88d9-9535c801292d.jpg','624ce2d3-2fe4-4087-89e2-02d9d70b3bdb'),('7e82e230-ceac-488e-bd84-22999b268c2c','H:/imgUpload/7e82e230-ceac-488e-bd84-22999b268c2c0b3ae237-a869-4013-ba16-9680a285f878.jpg','6740d865-5d26-48c3-831b-81fe559ba4ae'),('7e82e230-ceac-488e-bd84-22999b268c2c','H:/imgUpload/7e82e230-ceac-488e-bd84-22999b268c2c56c1ba67-e864-4a2b-8bc4-0b59d2985013.jpg','67a7152b-08fb-4ae8-93f8-9a7616907be6'),('c265cdfe-3d0e-4368-b44a-1401546b8396','H:/imgUpload/c265cdfe-3d0e-4368-b44a-1401546b83963f811b48-a7b1-497c-ac4e-91ffd42b98cb.jpg','6c62a0e8-32bb-4000-aadb-26dd66ebb7a5'),('dd879579-4ca8-451b-93c9-b00929633b49','H:/imgUpload/dd879579-4ca8-451b-93c9-b00929633b49b3c4af51-ba31-4b46-ba38-4c2af7aba172.jpg','70bb657a-f5a1-488f-9a89-30e1ebdb5e75'),('a984563b-e7af-4161-bfae-e4c04c7e8f76','H:/imgUpload/a984563b-e7af-4161-bfae-e4c04c7e8f76462f0d57-7d33-4839-a6dd-e74599d15d5a.jpg','72854d7e-782e-485e-9707-4ae1963e6441'),('a984563b-e7af-4161-bfae-e4c04c7e8f76','H:/imgUpload/a984563b-e7af-4161-bfae-e4c04c7e8f76f98ef433-4826-43d4-abcd-63e62a06c2ab.jpg','729a8d48-7741-4d48-88e6-67e14af633fc'),('7b901fe3-25e4-40b5-aafe-8a84fb8e525d','H:/imgUpload/7b901fe3-25e4-40b5-aafe-8a84fb8e525d559987fc-f453-4aeb-ae1b-8c854d9f286d.jpg','729e8534-fb83-452e-81bf-f60ad5b41a84'),('2a7fad7e-4624-4fbc-b186-b16a628236d7','H:/imgUpload/2a7fad7e-4624-4fbc-b186-b16a628236d78b87df24-7914-438f-9b0d-5245f2083bf9.jpg','7866e69f-3713-448b-8a19-59419d32df27'),('7b901fe3-25e4-40b5-aafe-8a84fb8e525d','H:/imgUpload/7b901fe3-25e4-40b5-aafe-8a84fb8e525d165e43c2-6155-47fd-8524-4a11a345bbd5.jpg','7c08931b-beb3-4bf4-8664-79ad9be015d7'),('adf374a4-4833-48b8-a56d-c0501a5418fe','H:/imgUpload/adf374a4-4833-48b8-a56d-c0501a5418fef0148a18-3037-4873-8bc6-073f3c2ce34a.jpg','8e2c26bf-5b7f-444e-bb8d-e9c237f8d2e0'),('0d9160f9-bcc1-4e07-bed0-1809be3fafbf','H:/imgUpload/0d9160f9-bcc1-4e07-bed0-1809be3fafbf8ca89893-7db6-478c-9c2e-3d3504a4b02f.jpg','906fb3f1-c17a-400c-b37f-b0eb255f6158'),('2a7fad7e-4624-4fbc-b186-b16a628236d7','H:/imgUpload/2a7fad7e-4624-4fbc-b186-b16a628236d7273220fc-d0e9-464d-bd26-0a3017a04f85.jpg','9781caaa-4d98-4b27-bf7b-3bffc7168a49'),('8c5b5a4c-0728-4775-9c3a-3bebd210a698','H:/imgUpload/8c5b5a4c-0728-4775-9c3a-3bebd210a698ef8dafd3-e65b-4d4a-9341-98c3f78b07f4.jpg','9843bd29-ef77-40f6-89a2-5e4bb41f6a5a'),('96f03b18-b293-4122-b929-3160ec3a0e58','H:/imgUpload/96f03b18-b293-4122-b929-3160ec3a0e5810e0836c-0f43-4c59-96f3-ec299fc19e5c.jpg','9b288641-4b60-42d3-bc86-0a19f6e24375'),('5a8dc2e8-666b-48f4-90d4-96999d7a5e1a','H:/imgUpload/5a8dc2e8-666b-48f4-90d4-96999d7a5e1aadde84c7-c7b8-4778-8fbf-84123980ff13.jpg','a1129923-b0ea-47fa-92e8-e68aa2d659d1'),('96f03b18-b293-4122-b929-3160ec3a0e58','H:/imgUpload/96f03b18-b293-4122-b929-3160ec3a0e5888f1dcf6-c31a-4b63-a8f5-cc782a47e1a7.jpg','a246b388-c616-4545-8289-7ce1a5c5ccf4'),('96f03b18-b293-4122-b929-3160ec3a0e58','H:/imgUpload/96f03b18-b293-4122-b929-3160ec3a0e5881d9acaa-24ae-466d-b9ac-4c3e6700f665.jpg','ab130a7a-837b-49f8-9fe4-297a4b423876'),('c265cdfe-3d0e-4368-b44a-1401546b8396','H:/imgUpload/c265cdfe-3d0e-4368-b44a-1401546b839629934770-272e-4bb2-88f3-6fbf00fd2749.jpg','ad6e1ac1-6a0c-4a13-aae8-9200eea9e899'),('d71920f7-2c18-4758-92c0-d0285d56bad6','H:/imgUpload/d71920f7-2c18-4758-92c0-d0285d56bad673a1881e-3cd0-446f-8867-3d74cbd31147.jpg','b088b073-89fd-420c-832c-4f1981d8cf7e'),('01ce7ae0-dae6-4095-87e9-b03609f84e56','H:/imgUpload/01ce7ae0-dae6-4095-87e9-b03609f84e56568f6f85-b8f7-47f0-83d1-5ea0f6fe660a.jpg','bbd27e72-73d6-4740-94f9-7a569a2521a2'),('c28992ba-823f-43c8-a0f9-82fac4271c4a','H:/imgUpload/c28992ba-823f-43c8-a0f9-82fac4271c4ad8c84f81-0a59-492a-81ae-8deebc03a3a7.jpg','c036c94c-cc29-451d-8ffa-7fff1077a639'),('adf374a4-4833-48b8-a56d-c0501a5418fe','H:/imgUpload/adf374a4-4833-48b8-a56d-c0501a5418feca824a2b-2f37-496a-a687-5828c0b00e36.jpg','c07e7b3d-d665-41ac-a7c9-04099b6a6061'),('8a60cde4-8fa4-4d61-b7c7-3594825fe459','H:/imgUpload/8a60cde4-8fa4-4d61-b7c7-3594825fe459959e9829-8f26-4b30-9ace-b86006fc643a.jpg','c3cf754e-87c5-4999-9c33-cc41ba3c93ed'),('d71920f7-2c18-4758-92c0-d0285d56bad6','H:/imgUpload/d71920f7-2c18-4758-92c0-d0285d56bad64b574715-2722-4f2b-be9e-06ca69e8065c.jpg','c55b1beb-54ff-4fdb-bccc-fb3f88c0e043'),('dd879579-4ca8-451b-93c9-b00929633b49','H:/imgUpload/dd879579-4ca8-451b-93c9-b00929633b49ea9dab03-924b-4323-b62a-829df02b951b.jpg','d6424669-c0e7-4dc1-8976-2f74b25daa6f'),('5a8dc2e8-666b-48f4-90d4-96999d7a5e1a','H:/imgUpload/5a8dc2e8-666b-48f4-90d4-96999d7a5e1a3c8005b9-0c7c-43ee-9e32-f232690b733e.jpg','d75b3023-bad0-4311-a390-121bc6756acf'),('d71920f7-2c18-4758-92c0-d0285d56bad6','H:/imgUpload/d71920f7-2c18-4758-92c0-d0285d56bad676bbc98a-9a8f-46ba-83d2-c66a296c5bac.jpg','d8b04034-2c62-41c5-9e8c-c4ca8d8b1856'),('adf374a4-4833-48b8-a56d-c0501a5418fe','H:/imgUpload/adf374a4-4833-48b8-a56d-c0501a5418fe3093bb97-908b-4a7e-b7a7-3abcaca8a00c.jpg','dbc79233-7526-47d8-ab6f-805089e62c66'),('8c5b5a4c-0728-4775-9c3a-3bebd210a698','H:/imgUpload/8c5b5a4c-0728-4775-9c3a-3bebd210a69894da4930-d87f-4b15-a35b-a65c0d97ec37.jpg','e0ff2fdc-7843-43c2-93ab-df3ed5cd908a'),('8c5b5a4c-0728-4775-9c3a-3bebd210a698','H:/imgUpload/8c5b5a4c-0728-4775-9c3a-3bebd210a698f66c18bf-f300-4f4f-8228-4defe7693654.jpg','e27dbff5-0119-4eef-b10c-88b034f2666d'),('adf374a4-4833-48b8-a56d-c0501a5418fe','H:/imgUpload/adf374a4-4833-48b8-a56d-c0501a5418feac4045ca-6b96-48b2-a722-7217dc9d289a.jpg','e4cea2db-47c4-4ea5-9587-ca3c95e7173e'),('01ce7ae0-dae6-4095-87e9-b03609f84e56','H:/imgUpload/01ce7ae0-dae6-4095-87e9-b03609f84e56a83fad89-7db9-41fb-9763-192e7e13ac97.jpg','e53a5977-49e9-438a-b4f3-9b7793e6995f'),('c28992ba-823f-43c8-a0f9-82fac4271c4a','H:/imgUpload/c28992ba-823f-43c8-a0f9-82fac4271c4af8607ac2-c03d-4842-a75a-f585346b9ef2.jpg','e581054f-d4e6-4e43-8d50-9c0bf49b3e78'),('96f03b18-b293-4122-b929-3160ec3a0e58','H:/imgUpload/96f03b18-b293-4122-b929-3160ec3a0e58e600c33c-d486-40c9-aece-91e587d6e3e2.jpg','e8241af8-bd21-4c53-aaaa-22a6620579c0'),('01ce7ae0-dae6-4095-87e9-b03609f84e56','H:/imgUpload/01ce7ae0-dae6-4095-87e9-b03609f84e5663ed7a75-2626-4cca-a688-fbe50bc2273c.jpg','ebe5ea67-f851-485b-b24e-7984a88b0df7'),('2a7fad7e-4624-4fbc-b186-b16a628236d7','H:/imgUpload/2a7fad7e-4624-4fbc-b186-b16a628236d756533181-d645-44b1-b1db-4f8755f76977.jpg','fdb09616-67c1-45fa-bea7-89459deb4dba');
/*!40000 ALTER TABLE `goodsurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
  `orders_status` int(11) DEFAULT NULL COMMENT '订单状态（1已完成、0未完成、-1有异议）',
  `price` double DEFAULT NULL COMMENT '商品价格',
  `pay_id` varchar(50) DEFAULT NULL COMMENT '支付ID',
  `orders_id` varchar(50) NOT NULL COMMENT '订单ID（主键、随机码）',
  `admin_status` int(11) DEFAULT NULL COMMENT '处理状态（1已处理、0未处理）',
  `time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('324021bf-aa22-4388-b442-b034a8b6123a','2a7fad7e-4624-4fbc-b186-b16a628236d7',0,450,'ffbce577-6388-4445-af44-81c911c8c6e4','080e38f7-f422-4979-946b-d82167139248',0,'2019年12月19日'),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','dd879579-4ca8-451b-93c9-b00929633b49',0,108,'6a77f7b2-4602-4e8c-9214-3ccd1a65edbc','2184d944-4d7a-408d-9886-202ead91dcc3',0,'2019年12月19日'),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','adf374a4-4833-48b8-a56d-c0501a5418fe',0,98.99,'a2e276d1-5f24-4faa-bee7-542b3e0494be','2a35d530-26cb-410c-98aa-b016fede4700',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','5a8dc2e8-666b-48f4-90d4-96999d7a5e1a',0,28,'ea34b746-0d1d-4150-8bd6-62698f59a79a','3eb671df-768f-4eb0-80ed-b63e23c4bd41',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','8a5cc3bc-3469-40d9-8f96-f4e38094a8d2',0,206,'60ea4a9e-9700-4cbb-8a06-ab8d5bbccb2c','64af1308-3b1d-4b4d-992e-f25b5c8d27f9',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','8c5b5a4c-0728-4775-9c3a-3bebd210a698',0,349,'6952a7d7-aea0-4a2e-b89a-45eaa56d9678','7167cc99-666f-4a1c-94fc-e4bac62cc386',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','c265cdfe-3d0e-4368-b44a-1401546b8396',0,345,'57150ba1-dff4-423d-a2bc-58f0e9226eb5','87c971b0-bd59-49a0-9d64-ccbaaf6fc79e',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','96f03b18-b293-4122-b929-3160ec3a0e58',0,19988,'0b11ca11-0e07-4006-8003-457c0ebf1d18','954afa6d-5d25-4406-9d71-043a27dd6539',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','2a7fad7e-4624-4fbc-b186-b16a628236d7',0,450,'36c57c41-5188-4f4c-860e-87b723b7c342','b3cb4a4d-2848-40bd-823c-0893e9921b0c',0,'2019年12月19日'),('324021bf-aa22-4388-b442-b034a8b6123a','7e82e230-ceac-488e-bd84-22999b268c2c',0,7800,'cb134a65-bc8f-40cc-b462-9fb76d260879','c3d8d426-749e-48a9-ad9c-dfe4a1203914',0,'2019年12月19日'),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','5a8dc2e8-666b-48f4-90d4-96999d7a5e1a',0,28,'834176e7-4f59-405a-8d71-678358f3254a','e7fa7fca-7db7-40cb-aaed-0d20f4a96e41',0,'2019年12月19日'),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','8c5b5a4c-0728-4775-9c3a-3bebd210a698',0,349,'3820efe0-9fd6-43a2-bfa9-a4054fa90195','f56a0405-a0e0-4a1b-9332-df084598b2c2',0,'2019年12月19日');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordersback`
--

DROP TABLE IF EXISTS `ordersback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordersback` (
  `orders_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
  `feedbacks_id` varchar(50) DEFAULT NULL COMMENT '投诉、建议、反馈信息ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordersback`
--

LOCK TABLES `ordersback` WRITE;
/*!40000 ALTER TABLE `ordersback` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordersback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `pay_id` varchar(50) NOT NULL COMMENT '支付ID（主键，随机码）',
  `price` double DEFAULT NULL COMMENT '费用',
  `status` int(11) DEFAULT NULL COMMENT '费用状态（已经转给卖家1，费用在平台0，已经退回给买家-1）',
  `pay_time` varchar(50) DEFAULT NULL COMMENT '支付时间',
  `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
  `pay_status` int(11) DEFAULT NULL COMMENT '支付状态（已完成1、未完成0、有异议-1）',
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcar`
--

DROP TABLE IF EXISTS `shopcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcar` (
  `user_id` varchar(50) NOT NULL,
  `goods_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcar`
--

LOCK TABLES `shopcar` WRITE;
/*!40000 ALTER TABLE `shopcar` DISABLE KEYS */;
INSERT INTO `shopcar` VALUES ('324021bf-aa22-4388-b442-b034a8b6123a','5a8dc2e8-666b-48f4-90d4-96999d7a5e1a');
/*!40000 ALTER TABLE `shopcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` varchar(50) NOT NULL COMMENT '用户ID，主键（随机码）',
  `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1男，2女）',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '账户启用状态',
  `admin` int(11) DEFAULT NULL COMMENT '是否管理员账户',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('07149a73-bb83-48e5-8722-3d51b3e949a4','ahdsiuhuiah','nioasnd','nioadn',1,'hiuoahsd@anuid.cnin',0,0),('12ebbb3f-4df4-47c7-92ee-e6988db478c1','kkk','jdassdddd','123456a!',0,'asd@asd.c',1,0),('1977d46b-8b56-49dd-815f-3a28196dd631','abiusduas','asdasdas','uiasbndna',1,'nioansdo@ciasdo.como',0,0),('324021bf-aa22-4388-b442-b034a8b6123a','闫孟君','jdassd','jdassd1!',1,'jdassd@163.com',1,1),('61f225aa-4089-48df-af9b-646c61b7c8da','aiushdiuhasd','nuanduona','njoansdoiasd',1,'asiod@nuasnd.cbuin',0,0),('79831d90-4f7b-440b-b6e7-bc7766c2edb7','御风','hhhhh','123456789@hyw',1,'1773261858@qq.com',1,0),('8c243217-99d7-4038-aebd-3121910239d1','asdasdas','asdfddf','asdasda',1,'asdashiu@asdnbuiand.como',0,0),('92bae3b4-0e1b-44a4-b5ab-eb55310341b0','jdasd','jdassdd','jasda1!',2,'asd@asd.c',1,0),('94e3d441-3a7b-441d-aee7-eed9807108e2','asdasbui','nuiasdina','nionioasnd',1,'nioasnoi@nuasd.com',0,0),('9f9a3e3f-ffa2-43ce-bcb1-c922aeb0e977','asdnansdasd','jasidjioasasd','asdadsd',1,'naiosndasdioas@asuaasd.com',0,0),('a399f7fe-e963-4c6c-981e-8e70521afac8','哇哈哈','jdassddd','adsd12!@#!',0,'asdas@asdnu.casd',0,0),('c2c0d448-607e-4b8d-9a5e-f18f9c12291c','aaa','aaa','aaa',2,'',1,1),('e7805d36-e2bc-4b81-a4e1-7dae629c6887','asdasdas','asnduiasndna','nioasndoasd',1,'asda@cin.asdn',0,0),('e7c8e0bb-7a47-4e17-a9ff-2f2f941efc14','asdnansd','jasidjioas','ansiodhioa',1,'naiosndioas@asuaasd.com',0,0),('ec6b94fc-dc8e-425c-bed4-df195cd99d58','nioadnian','uiasbdi','niunasd',1,'ninasd@nuiasnd.com',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mysql`;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `user_host` mediumtext NOT NULL,
  `query_time` time(6) NOT NULL,
  `lock_time` time(6) NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL,
  `thread_id` bigint(21) unsigned NOT NULL,
  `rows_affected` int(11) NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `column_stats`
--

DROP TABLE IF EXISTS `column_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `column_stats` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `column_name` varchar(64) NOT NULL,
  `min_value` varbinary(255) DEFAULT NULL,
  `max_value` varbinary(255) DEFAULT NULL,
  `nulls_ratio` decimal(12,4) DEFAULT NULL,
  `avg_length` decimal(12,4) DEFAULT NULL,
  `avg_frequency` decimal(12,4) DEFAULT NULL,
  `hist_size` tinyint(3) unsigned DEFAULT NULL,
  `hist_type` enum('SINGLE_PREC_HB','DOUBLE_PREC_HB') DEFAULT NULL,
  `histogram` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`db_name`,`table_name`,`column_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=0 COMMENT='Statistics on Columns';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column_stats`
--

LOCK TABLES `column_stats` WRITE;
/*!40000 ALTER TABLE `column_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `column_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Table_name` char(64) NOT NULL DEFAULT '',
  `Column_name` char(64) NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `User` char(80) NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  `Delete_history_priv` enum('N','Y') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=Aria DEFAULT CHARSET=utf8 COLLATE=utf8_bin PAGE_CHECKSUM=1 TRANSACTIONAL=1 COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
