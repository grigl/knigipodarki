-- MySQL dump 10.13  Distrib 5.5.22, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: knigipodarki
-- ------------------------------------------------------
-- Server version	5.5.22-0ubuntu1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state_name` varchar(255) DEFAULT NULL,
  `alternative_phone` varchar(255) DEFAULT NULL,
  `secondname` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_firstname` (`firstname`),
  KEY `index_addresses_on_lastname` (`lastname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjustments`
--

DROP TABLE IF EXISTS `adjustments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `mandatory` tinyint(1) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `originator_id` int(11) DEFAULT NULL,
  `originator_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_adjustments_on_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjustments`
--

LOCK TABLES `adjustments` WRITE;
/*!40000 ALTER TABLE `adjustments` DISABLE KEYS */;
/*!40000 ALTER TABLE `adjustments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `viewable_id` int(11) DEFAULT NULL,
  `viewable_type` varchar(50) DEFAULT NULL,
  `attachment_content_type` varchar(255) DEFAULT NULL,
  `attachment_file_name` varchar(255) DEFAULT NULL,
  `attachment_size` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `type` varchar(75) DEFAULT NULL,
  `attachment_updated_at` datetime DEFAULT NULL,
  `attachment_width` int(11) DEFAULT NULL,
  `attachment_height` int(11) DEFAULT NULL,
  `alt` text,
  PRIMARY KEY (`id`),
  KEY `index_assets_on_viewable_id` (`viewable_id`),
  KEY `index_assets_on_viewable_type_and_type` (`viewable_type`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculators`
--

DROP TABLE IF EXISTS `calculators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `calculable_id` int(11) NOT NULL,
  `calculable_type` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=574015645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculators`
--

LOCK TABLES `calculators` WRITE;
/*!40000 ALTER TABLE `calculators` DISABLE KEYS */;
INSERT INTO `calculators` VALUES (13537749,'Calculator::FlatRate',13537749,'ShippingMethod','2012-09-10 14:27:17','2012-09-10 14:27:17'),(192811543,'Calculator::FlatRate',192811543,'ShippingMethod','2012-09-10 14:27:17','2012-09-10 14:27:17'),(491052212,'Calculator::FlatRate',713097208,'Promotion','2012-09-10 14:27:17','2012-09-10 14:27:17'),(574015644,'Calculator::FlatRate',574015644,'ShippingMethod','2012-09-10 14:27:17','2012-09-10 14:27:17');
/*!40000 ALTER TABLE `calculators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_configurations_on_name_and_type` (`name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'Default configuration','2012-09-10 14:27:13','2012-09-10 14:27:13','AppConfiguration'),(2,'Editor configuration','2012-09-10 19:54:54','2012-09-10 19:54:54','EditorConfiguration');
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso_name` varchar(255) DEFAULT NULL,
  `iso` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `iso3` varchar(255) DEFAULT NULL,
  `numcode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'AFGHANISTAN','AF','Afghanistan','AFG',4),(2,'ALBANIA','AL','Albania','ALB',8),(3,'ALGERIA','DZ','Algeria','DZA',12),(4,'AMERICAN SAMOA','AS','American Samoa','ASM',16),(5,'ANDORRA','AD','Andorra','AND',20),(6,'ANGOLA','AO','Angola','AGO',24),(7,'ANGUILLA','AI','Anguilla','AIA',660),(8,'ANTIGUA AND BARBUDA','AG','Antigua and Barbuda','ATG',28),(9,'ARGENTINA','AR','Argentina','ARG',32),(10,'ARMENIA','AM','Armenia','ARM',51),(11,'ARUBA','AW','Aruba','ABW',533),(12,'AUSTRALIA','AU','Australia','AUS',36),(13,'AUSTRIA','AT','Austria','AUT',40),(14,'AZERBAIJAN','AZ','Azerbaijan','AZE',31),(15,'BAHAMAS','BS','Bahamas','BHS',44),(16,'BAHRAIN','BH','Bahrain','BHR',48),(17,'BANGLADESH','BD','Bangladesh','BGD',50),(18,'BARBADOS','BB','Barbados','BRB',52),(19,'BELARUS','BY','Belarus','BLR',112),(20,'BELGIUM','BE','Belgium','BEL',56),(21,'BELIZE','BZ','Belize','BLZ',84),(22,'BENIN','BJ','Benin','BEN',204),(23,'BERMUDA','BM','Bermuda','BMU',60),(24,'BHUTAN','BT','Bhutan','BTN',64),(25,'BOLIVIA','BO','Bolivia','BOL',68),(26,'BOSNIA AND HERZEGOVINA','BA','Bosnia and Herzegovina','BIH',70),(27,'BOTSWANA','BW','Botswana','BWA',72),(28,'BRAZIL','BR','Brazil','BRA',76),(29,'BRUNEI DARUSSALAM','BN','Brunei Darussalam','BRN',96),(30,'BULGARIA','BG','Bulgaria','BGR',100),(31,'BURKINA FASO','BF','Burkina Faso','BFA',854),(32,'BURUNDI','BI','Burundi','BDI',108),(33,'CAMBODIA','KH','Cambodia','KHM',116),(34,'CAMEROON','CM','Cameroon','CMR',120),(35,'CANADA','CA','Canada','CAN',124),(36,'CAPE VERDE','CV','Cape Verde','CPV',132),(37,'CAYMAN ISLANDS','KY','Cayman Islands','CYM',136),(38,'CENTRAL AFRICAN REPUBLIC','CF','Central African Republic','CAF',140),(39,'CHAD','TD','Chad','TCD',148),(40,'CHILE','CL','Chile','CHL',152),(41,'CHINA','CN','China','CHN',156),(42,'COLOMBIA','CO','Colombia','COL',170),(43,'COMOROS','KM','Comoros','COM',174),(44,'CONGO','CG','Congo','COG',178),(45,'CONGO, THE DEMOCRATIC REPUBLIC OF THE','CD','Congo, the Democratic Republic of the','COD',180),(46,'COOK ISLANDS','CK','Cook Islands','COK',184),(47,'COSTA RICA','CR','Costa Rica','CRI',188),(48,'COTE D\'IVOIRE','CI','Cote D\'Ivoire','CIV',384),(49,'CROATIA','HR','Croatia','HRV',191),(50,'CUBA','CU','Cuba','CUB',192),(51,'CYPRUS','CY','Cyprus','CYP',196),(52,'CZECH REPUBLIC','CZ','Czech Republic','CZE',203),(53,'DENMARK','DK','Denmark','DNK',208),(54,'DJIBOUTI','DJ','Djibouti','DJI',262),(55,'DOMINICA','DM','Dominica','DMA',212),(56,'DOMINICAN REPUBLIC','DO','Dominican Republic','DOM',214),(57,'ECUADOR','EC','Ecuador','ECU',218),(58,'EGYPT','EG','Egypt','EGY',818),(59,'EL SALVADOR','SV','El Salvador','SLV',222),(60,'EQUATORIAL GUINEA','GQ','Equatorial Guinea','GNQ',226),(61,'ERITREA','ER','Eritrea','ERI',232),(62,'ESTONIA','EE','Estonia','EST',233),(63,'ETHIOPIA','ET','Ethiopia','ETH',231),(64,'FALKLAND ISLANDS (MALVINAS)','FK','Falkland Islands (Malvinas)','FLK',238),(65,'FAROE ISLANDS','FO','Faroe Islands','FRO',234),(66,'FIJI','FJ','Fiji','FJI',242),(67,'FINLAND','FI','Finland','FIN',246),(68,'FRANCE','FR','France','FRA',250),(69,'FRENCH GUIANA','GF','French Guiana','GUF',254),(70,'FRENCH POLYNESIA','PF','French Polynesia','PYF',258),(71,'GABON','GA','Gabon','GAB',266),(72,'GAMBIA','GM','Gambia','GMB',270),(73,'GEORGIA','GE','Georgia','GEO',268),(74,'GERMANY','DE','Germany','DEU',276),(75,'GHANA','GH','Ghana','GHA',288),(76,'GIBRALTAR','GI','Gibraltar','GIB',292),(77,'GREECE','GR','Greece','GRC',300),(78,'GREENLAND','GL','Greenland','GRL',304),(79,'GRENADA','GD','Grenada','GRD',308),(80,'GUADELOUPE','GP','Guadeloupe','GLP',312),(81,'GUAM','GU','Guam','GUM',316),(82,'GUATEMALA','GT','Guatemala','GTM',320),(83,'GUINEA','GN','Guinea','GIN',324),(84,'GUINEA-BISSAU','GW','Guinea-Bissau','GNB',624),(85,'GUYANA','GY','Guyana','GUY',328),(86,'HAITI','HT','Haiti','HTI',332),(87,'HOLY SEE (VATICAN CITY STATE)','VA','Holy See (Vatican City State)','VAT',336),(88,'HONDURAS','HN','Honduras','HND',340),(89,'HONG KONG','HK','Hong Kong','HKG',344),(90,'HUNGARY','HU','Hungary','HUN',348),(91,'ICELAND','IS','Iceland','ISL',352),(92,'INDIA','IN','India','IND',356),(93,'INDONESIA','ID','Indonesia','IDN',360),(94,'IRAN, ISLAMIC REPUBLIC OF','IR','Iran, Islamic Republic of','IRN',364),(95,'IRAQ','IQ','Iraq','IRQ',368),(96,'IRELAND','IE','Ireland','IRL',372),(97,'ISRAEL','IL','Israel','ISR',376),(98,'ITALY','IT','Italy','ITA',380),(99,'JAMAICA','JM','Jamaica','JAM',388),(100,'JAPAN','JP','Japan','JPN',392),(101,'JORDAN','JO','Jordan','JOR',400),(102,'KAZAKHSTAN','KZ','Kazakhstan','KAZ',398),(103,'KENYA','KE','Kenya','KEN',404),(104,'KIRIBATI','KI','Kiribati','KIR',296),(105,'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','KP','North Korea','PRK',408),(106,'KOREA, REPUBLIC OF','KR','South Korea','KOR',410),(107,'KUWAIT','KW','Kuwait','KWT',414),(108,'KYRGYZSTAN','KG','Kyrgyzstan','KGZ',417),(109,'LAO PEOPLE\'S DEMOCRATIC REPUBLIC','LA','Lao People\'s Democratic Republic','LAO',418),(110,'LATVIA','LV','Latvia','LVA',428),(111,'LEBANON','LB','Lebanon','LBN',422),(112,'LESOTHO','LS','Lesotho','LSO',426),(113,'LIBERIA','LR','Liberia','LBR',430),(114,'LIBYAN ARAB JAMAHIRIYA','LY','Libyan Arab Jamahiriya','LBY',434),(115,'LIECHTENSTEIN','LI','Liechtenstein','LIE',438),(116,'LITHUANIA','LT','Lithuania','LTU',440),(117,'LUXEMBOURG','LU','Luxembourg','LUX',442),(118,'MACAO','MO','Macao','MAC',446),(119,'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','MK','Macedonia','MKD',807),(120,'MADAGASCAR','MG','Madagascar','MDG',450),(121,'MALAWI','MW','Malawi','MWI',454),(122,'MALAYSIA','MY','Malaysia','MYS',458),(123,'MALDIVES','MV','Maldives','MDV',462),(124,'MALI','ML','Mali','MLI',466),(125,'MALTA','MT','Malta','MLT',470),(126,'MARSHALL ISLANDS','MH','Marshall Islands','MHL',584),(127,'MARTINIQUE','MQ','Martinique','MTQ',474),(128,'MAURITANIA','MR','Mauritania','MRT',478),(129,'MAURITIUS','MU','Mauritius','MUS',480),(130,'MEXICO','MX','Mexico','MEX',484),(131,'MICRONESIA, FEDERATED STATES OF','FM','Micronesia, Federated States of','FSM',583),(132,'MOLDOVA, REPUBLIC OF','MD','Moldova, Republic of','MDA',498),(133,'MONACO','MC','Monaco','MCO',492),(134,'MONGOLIA','MN','Mongolia','MNG',496),(135,'MONTSERRAT','MS','Montserrat','MSR',500),(136,'MOROCCO','MA','Morocco','MAR',504),(137,'MOZAMBIQUE','MZ','Mozambique','MOZ',508),(138,'MYANMAR','MM','Myanmar','MMR',104),(139,'NAMIBIA','NA','Namibia','NAM',516),(140,'NAURU','NR','Nauru','NRU',520),(141,'NEPAL','NP','Nepal','NPL',524),(142,'NETHERLANDS','NL','Netherlands','NLD',528),(143,'NETHERLANDS ANTILLES','AN','Netherlands Antilles','ANT',530),(144,'NEW CALEDONIA','NC','New Caledonia','NCL',540),(145,'NEW ZEALAND','NZ','New Zealand','NZL',554),(146,'NICARAGUA','NI','Nicaragua','NIC',558),(147,'NIGER','NE','Niger','NER',562),(148,'NIGERIA','NG','Nigeria','NGA',566),(149,'NIUE','NU','Niue','NIU',570),(150,'NORFOLK ISLAND','NF','Norfolk Island','NFK',574),(151,'NORTHERN MARIANA ISLANDS','MP','Northern Mariana Islands','MNP',580),(152,'NORWAY','NO','Norway','NOR',578),(153,'OMAN','OM','Oman','OMN',512),(154,'PAKISTAN','PK','Pakistan','PAK',586),(155,'PALAU','PW','Palau','PLW',585),(156,'PANAMA','PA','Panama','PAN',591),(157,'PAPUA NEW GUINEA','PG','Papua New Guinea','PNG',598),(158,'PARAGUAY','PY','Paraguay','PRY',600),(159,'PERU','PE','Peru','PER',604),(160,'PHILIPPINES','PH','Philippines','PHL',608),(161,'PITCAIRN','PN','Pitcairn','PCN',612),(162,'POLAND','PL','Poland','POL',616),(163,'PORTUGAL','PT','Portugal','PRT',620),(164,'PUERTO RICO','PR','Puerto Rico','PRI',630),(165,'QATAR','QA','Qatar','QAT',634),(166,'REUNION','RE','Reunion','REU',638),(167,'ROMANIA','RO','Romania','ROM',642),(168,'RUSSIAN FEDERATION','RU','Российская Федерация','RUS',643),(169,'RWANDA','RW','Rwanda','RWA',646),(170,'SAINT HELENA','SH','Saint Helena','SHN',654),(171,'SAINT KITTS AND NEVIS','KN','Saint Kitts and Nevis','KNA',659),(172,'SAINT LUCIA','LC','Saint Lucia','LCA',662),(173,'SAINT PIERRE AND MIQUELON','PM','Saint Pierre and Miquelon','SPM',666),(174,'SAINT VINCENT AND THE GRENADINES','VC','Saint Vincent and the Grenadines','VCT',670),(175,'SAMOA','WS','Samoa','WSM',882),(176,'SAN MARINO','SM','San Marino','SMR',674),(177,'SAO TOME AND PRINCIPE','ST','Sao Tome and Principe','STP',678),(178,'SAUDI ARABIA','SA','Saudi Arabia','SAU',682),(179,'SENEGAL','SN','Senegal','SEN',686),(180,'SEYCHELLES','SC','Seychelles','SYC',690),(181,'SIERRA LEONE','SL','Sierra Leone','SLE',694),(182,'SINGAPORE','SG','Singapore','SGP',702),(183,'SLOVAKIA','SK','Slovakia','SVK',703),(184,'SLOVENIA','SI','Slovenia','SVN',705),(185,'SOLOMON ISLANDS','SB','Solomon Islands','SLB',90),(186,'SOMALIA','SO','Somalia','SOM',706),(187,'SOUTH AFRICA','ZA','South Africa','ZAF',710),(188,'SPAIN','ES','Spain','ESP',724),(189,'SRI LANKA','LK','Sri Lanka','LKA',144),(190,'SUDAN','SD','Sudan','SDN',736),(191,'SURINAME','SR','Suriname','SUR',740),(192,'SVALBARD AND JAN MAYEN','SJ','Svalbard and Jan Mayen','SJM',744),(193,'SWAZILAND','SZ','Swaziland','SWZ',748),(194,'SWEDEN','SE','Sweden','SWE',752),(195,'SWITZERLAND','CH','Switzerland','CHE',756),(196,'SYRIAN ARAB REPUBLIC','SY','Syrian Arab Republic','SYR',760),(197,'TAIWAN, PROVINCE OF CHINA','TW','Taiwan','TWN',158),(198,'TAJIKISTAN','TJ','Tajikistan','TJK',762),(199,'TANZANIA, UNITED REPUBLIC OF','TZ','Tanzania, United Republic of','TZA',834),(200,'THAILAND','TH','Thailand','THA',764),(201,'TOGO','TG','Togo','TGO',768),(202,'TOKELAU','TK','Tokelau','TKL',772),(203,'TONGA','TO','Tonga','TON',776),(204,'TRINIDAD AND TOBAGO','TT','Trinidad and Tobago','TTO',780),(205,'TUNISIA','TN','Tunisia','TUN',788),(206,'TURKEY','TR','Turkey','TUR',792),(207,'TURKMENISTAN','TM','Turkmenistan','TKM',795),(208,'TURKS AND CAICOS ISLANDS','TC','Turks and Caicos Islands','TCA',796),(209,'TUVALU','TV','Tuvalu','TUV',798),(210,'UGANDA','UG','Uganda','UGA',800),(211,'UKRAINE','UA','Ukraine','UKR',804),(212,'UNITED ARAB EMIRATES','AE','United Arab Emirates','ARE',784),(213,'UNITED KINGDOM','GB','United Kingdom','GBR',826),(214,'UNITED STATES','US','United States','USA',840),(215,'URUGUAY','UY','Uruguay','URY',858),(216,'UZBEKISTAN','UZ','Uzbekistan','UZB',860),(217,'VANUATU','VU','Vanuatu','VUT',548),(218,'VENEZUELA','VE','Venezuela','VEN',862),(219,'VIET NAM','VN','Viet Nam','VNM',704),(220,'VIRGIN ISLANDS, BRITISH','VG','Virgin Islands, British','VGB',92),(221,'VIRGIN ISLANDS, U.S.','VI','Virgin Islands, U.S.','VIR',850),(222,'WALLIS AND FUTUNA','WF','Wallis and Futuna','WLF',876),(223,'WESTERN SAHARA','EH','Western Sahara','ESH',732),(224,'YEMEN','YE','Yemen','YEM',887),(225,'ZAMBIA','ZM','Zambia','ZMB',894),(226,'ZIMBABWE','ZW','Zimbabwe','ZWE',716);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcards`
--

DROP TABLE IF EXISTS `creditcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `creditcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `cc_type` varchar(255) DEFAULT NULL,
  `last_digits` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `start_month` varchar(255) DEFAULT NULL,
  `start_year` varchar(255) DEFAULT NULL,
  `issue_number` varchar(255) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `gateway_customer_profile_id` varchar(255) DEFAULT NULL,
  `gateway_payment_profile_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcards`
--

LOCK TABLES `creditcards` WRITE;
/*!40000 ALTER TABLE `creditcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateways`
--

DROP TABLE IF EXISTS `gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) DEFAULT 'development',
  `server` varchar(255) DEFAULT 'test',
  `test_mode` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateways`
--

LOCK TABLES `gateways` WRITE;
/*!40000 ALTER TABLE `gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_units`
--

DROP TABLE IF EXISTS `inventory_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variant_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `lock_version` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `shipment_id` int(11) DEFAULT NULL,
  `return_authorization_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_inventory_units_on_variant_id` (`variant_id`),
  KEY `index_inventory_units_on_order_id` (`order_id`),
  KEY `index_inventory_units_on_shipment_id` (`shipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_units`
--

LOCK TABLES `inventory_units` WRITE;
/*!40000 ALTER TABLE `inventory_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_items`
--

DROP TABLE IF EXISTS `line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `variant_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_line_items_on_order_id` (`order_id`),
  KEY `index_line_items_on_variant_id` (`variant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_items`
--

LOCK TABLES `line_items` WRITE;
/*!40000 ALTER TABLE `line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_entries`
--

DROP TABLE IF EXISTS `log_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `details` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_entries`
--

LOCK TABLES `log_entries` WRITE;
/*!40000 ALTER TABLE `log_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_methods`
--

DROP TABLE IF EXISTS `mail_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_methods`
--

LOCK TABLES `mail_methods` WRITE;
/*!40000 ALTER TABLE `mail_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_types`
--

DROP TABLE IF EXISTS `option_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `presentation` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_types`
--

LOCK TABLES `option_types` WRITE;
/*!40000 ALTER TABLE `option_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_types_prototypes`
--

DROP TABLE IF EXISTS `option_types_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_types_prototypes` (
  `prototype_id` int(11) DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_types_prototypes`
--

LOCK TABLES `option_types_prototypes` WRITE;
/*!40000 ALTER TABLE `option_types_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_types_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_values`
--

DROP TABLE IF EXISTS `option_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `presentation` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_values`
--

LOCK TABLES `option_values` WRITE;
/*!40000 ALTER TABLE `option_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_values_variants`
--

DROP TABLE IF EXISTS `option_values_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_values_variants` (
  `variant_id` int(11) DEFAULT NULL,
  `option_value_id` int(11) DEFAULT NULL,
  KEY `index_option_values_variants_on_variant_id` (`variant_id`),
  KEY `index_option_values_variants_on_variant_id_and_option_value_id` (`variant_id`,`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_values_variants`
--

LOCK TABLES `option_values_variants` WRITE;
/*!40000 ALTER TABLE `option_values_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_values_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `number` varchar(15) DEFAULT NULL,
  `item_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `adjustment_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `credit_total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `completed_at` datetime DEFAULT NULL,
  `bill_address_id` int(11) DEFAULT NULL,
  `ship_address_id` int(11) DEFAULT NULL,
  `payment_total` decimal(8,2) DEFAULT '0.00',
  `shipping_method_id` int(11) DEFAULT NULL,
  `shipment_state` varchar(255) DEFAULT NULL,
  `payment_state` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `special_instructions` text,
  PRIMARY KEY (`id`),
  KEY `index_orders_on_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `body` mediumtext,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `show_in_header` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_footer` tinyint(1) NOT NULL DEFAULT '0',
  `foreign_link` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `visible` tinyint(1) DEFAULT '1',
  `meta_keywords` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `show_in_sidebar` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_pages_on_slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (3,'Информация','<!-- .about -->\r\n <section class=\"about\" id=\"about\">\r\n\r\n <h1>О нас</h1>\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_shop.png\" alt=\"\">\r\n <h2>Магазин</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_contacts.png\" alt=\"\">\r\n <h2>Контакты</h2>\r\n <p>\r\n Санкт-Петербург, Лиговский пр., 74 (войти во двор, 1-ый этаж, слева от входа в Этажи) посмотреть на карте.\r\n </p>\r\n <p>\r\n +7(812)715 33 07<br>\r\n +7(953)140 80 87<br><br>\r\n <a href=\"\">info@knigibodarki.ru</a>\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n </section>\r\n <!-- /.about -->\r\n\r\n <!-- .about -->\r\n <section class=\"about\" id=\"payment\">\r\n\r\n <h1>Оплата</h1>\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_robo.png\" alt=\"\">\r\n <h2>Робокасса</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_cash.png\" alt=\"\">\r\n <h2>Наличными курьеру</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n </section>\r\n <!-- /.about -->\r\n\r\n <!-- .about -->\r\n <section class=\"about\" id=\"delivery\">\r\n\r\n <h1>Доставка</h1>\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_delivery.png\" alt=\"\">\r\n <h2>Курьерская</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_mail.png\" alt=\"\">\r\n <h2>EMS Почта России</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n <img  src=\"/images/about_postamat.png\" alt=\"\">\r\n <h2>Постамат</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n <img  src=\"/images/about_self.png\" alt=\"\">\r\n <h2>Самовывоз</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n </section>\r\n <!-- /.about -->\r\n\r\n <!-- .about -->\r\n <section class=\"about\" id=\"contacts\">\r\n\r\n <h1>Сотрудничество</h1>\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_distrib.png\" alt=\"\">\r\n <h2>Поставщикам</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n <img  src=\"/images/about_opt.png\" alt=\"\">\r\n <h2>Опт</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n <!-- item -->\r\n <article>\r\n <img  src=\"/images/about_req.png\" alt=\"\">\r\n <h2>Реквизиты</h2>\r\n <p>\r\n КнигиПодарки - это симбиоз книжного магазина и магазина подарков. «Выбирать должно быть интересно» - говорим мы и предлагаем Вам продукцию различных дизайнерских студий. Каждая вещь в нашем магазине хорошо продумана и качественно сделана, владеть ею приятно, а дарить её жалко. Или тоже приятно, если себе или очень любимому человеку.\r\n </p>\r\n </article>\r\n <!-- /item -->\r\n\r\n </section>\r\n <!-- /.about -->','/info','2012-09-10 21:11:05','2012-09-10 21:22:51',0,0,'',0,1,'','','',0);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `active` tinyint(1) DEFAULT '1',
  `environment` varchar(255) DEFAULT 'development',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `display_on` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `response_code` varchar(255) DEFAULT NULL,
  `avs_response` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferences`
--

DROP TABLE IF EXISTS `preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `owner_type` varchar(50) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_type` varchar(50) DEFAULT NULL,
  `value` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_prefs_on_owner_attr_pref` (`owner_id`,`owner_type`,`name`,`group_id`,`group_type`)
) ENGINE=InnoDB AUTO_INCREMENT=243735674 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferences`
--

LOCK TABLES `preferences` WRITE;
/*!40000 ALTER TABLE `preferences` DISABLE KEYS */;
INSERT INTO `preferences` VALUES (1,'default_locale',1,'Configuration',NULL,NULL,'ru','2012-09-10 14:27:13','2012-09-10 21:29:38'),(2,'default_country_id',1,'Configuration',NULL,NULL,'168','2012-09-10 14:27:13','2012-09-10 21:29:38'),(3,'allow_ssl_in_production',1,'Configuration',NULL,NULL,'0','2012-09-10 14:27:13','2012-09-10 21:29:38'),(4,'disable_bill_address',1,'Configuration',NULL,NULL,'1','2012-09-10 14:27:13','2012-09-10 21:29:38'),(5,'admin_interface_logo',1,'Configuration',NULL,NULL,'admin/logo.png','2012-09-10 14:27:13','2012-09-10 14:27:13'),(6,'store_email',1,'Configuration',NULL,NULL,'test@site.ru','2012-09-10 14:27:13','2012-09-10 14:27:13'),(7,'store_phone',1,'Configuration',NULL,NULL,'+7 (495) 1234567','2012-09-10 14:27:13','2012-09-10 14:27:13'),(8,'products_per_page',1,'Configuration',NULL,NULL,'9','2012-09-10 14:27:14','2012-09-10 21:29:38'),(59769363,'amount',491052212,'Calculator',NULL,NULL,'5','2012-09-10 14:27:17','2012-09-10 14:27:17'),(87531454,'amount',192811543,'Calculator',NULL,NULL,'10','2012-09-10 14:27:17','2012-09-10 14:27:17'),(174063089,'amount',574015644,'Calculator',NULL,NULL,'5','2012-09-10 14:27:17','2012-09-10 14:27:17'),(243735672,'amount',13537749,'Calculator',NULL,NULL,'15','2012-09-10 14:27:17','2012-09-10 14:27:17'),(243735673,'checkout_zone',1,'Configuration',NULL,NULL,'РФ','2012-09-10 14:30:49','2012-09-10 14:30:49');
/*!40000 ALTER TABLE `preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_groups`
--

DROP TABLE IF EXISTS `product_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `order` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_groups_on_name` (`name`),
  KEY `index_product_groups_on_permalink` (`permalink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_groups`
--

LOCK TABLES `product_groups` WRITE;
/*!40000 ALTER TABLE `product_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_groups_products`
--

DROP TABLE IF EXISTS `product_groups_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_groups_products` (
  `product_id` int(11) DEFAULT NULL,
  `product_group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_groups_products`
--

LOCK TABLES `product_groups_products` WRITE;
/*!40000 ALTER TABLE `product_groups_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_groups_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option_types`
--

DROP TABLE IF EXISTS `product_option_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_option_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `option_type_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option_types`
--

LOCK TABLES `product_option_types` WRITE;
/*!40000 ALTER TABLE `product_option_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_option_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_properties`
--

DROP TABLE IF EXISTS `product_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_product_properties_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_properties`
--

LOCK TABLES `product_properties` WRITE;
/*!40000 ALTER TABLE `product_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_scopes`
--

DROP TABLE IF EXISTS `product_scopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_scopes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `arguments` text,
  PRIMARY KEY (`id`),
  KEY `index_product_scopes_on_name` (`name`),
  KEY `index_product_scopes_on_product_group_id` (`product_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_scopes`
--

LOCK TABLES `product_scopes` WRITE;
/*!40000 ALTER TABLE `product_scopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_scopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `available_on` datetime DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  `shipping_category_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `count_on_hand` int(11) NOT NULL DEFAULT '0',
  `export_to_yandex_market` tinyint(1) NOT NULL DEFAULT '1',
  `external_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_products_on_available_on` (`available_on`),
  KEY `index_products_on_deleted_at` (`deleted_at`),
  KEY `index_products_on_name` (`name`),
  KEY `index_products_on_permalink` (`permalink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_promotion_rules`
--

DROP TABLE IF EXISTS `products_promotion_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_promotion_rules` (
  `product_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  KEY `index_products_promotion_rules_on_product_id` (`product_id`),
  KEY `index_products_promotion_rules_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_promotion_rules`
--

LOCK TABLES `products_promotion_rules` WRITE;
/*!40000 ALTER TABLE `products_promotion_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_promotion_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_taxons`
--

DROP TABLE IF EXISTS `products_taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_taxons` (
  `product_id` int(11) DEFAULT NULL,
  `taxon_id` int(11) DEFAULT NULL,
  KEY `index_products_taxons_on_product_id` (`product_id`),
  KEY `index_products_taxons_on_taxon_id` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_taxons`
--

LOCK TABLES `products_taxons` WRITE;
/*!40000 ALTER TABLE `products_taxons` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_rules`
--

DROP TABLE IF EXISTS `promotion_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `promotion_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_group_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_promotion_rules_on_product_group_id` (`product_group_id`),
  KEY `index_promotion_rules_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_rules`
--

LOCK TABLES `promotion_rules` WRITE;
/*!40000 ALTER TABLE `promotion_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_rules_users`
--

DROP TABLE IF EXISTS `promotion_rules_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_rules_users` (
  `user_id` int(11) DEFAULT NULL,
  `promotion_rule_id` int(11) DEFAULT NULL,
  KEY `index_promotion_rules_users_on_user_id` (`user_id`),
  KEY `index_promotion_rules_users_on_promotion_rule_id` (`promotion_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_rules_users`
--

LOCK TABLES `promotion_rules_users` WRITE;
/*!40000 ALTER TABLE `promotion_rules_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_rules_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `combine` tinyint(1) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `starts_at` datetime DEFAULT NULL,
  `match_policy` varchar(255) DEFAULT 'all',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `presentation` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties_prototypes`
--

DROP TABLE IF EXISTS `properties_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties_prototypes` (
  `prototype_id` int(11) DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties_prototypes`
--

LOCK TABLES `properties_prototypes` WRITE;
/*!40000 ALTER TABLE `properties_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `properties_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prototypes`
--

DROP TABLE IF EXISTS `prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prototypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prototypes`
--

LOCK TABLES `prototypes` WRITE;
/*!40000 ALTER TABLE `prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `return_authorizations`
--

DROP TABLE IF EXISTS `return_authorizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `return_authorizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `order_id` int(11) DEFAULT NULL,
  `reason` text,
  `state` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `return_authorizations`
--

LOCK TABLES `return_authorizations` WRITE;
/*!40000 ALTER TABLE `return_authorizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `return_authorizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_roles_users_on_role_id` (`role_id`),
  KEY `index_roles_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(1,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20081216193152'),('20090311090247'),('20090625125735'),('20090814113100'),('20090814142845'),('20090823005402'),('20090827180351'),('20090829000527'),('20090904192342'),('20090923100315'),('20091007134354'),('20091008091614'),('20091012120519'),('20091015110842'),('20091015153048'),('20091016174634'),('20091017175558'),('20091021133257'),('20091104151730'),('20091126190904'),('20091209153045'),('20091209202200'),('20091211203813'),('20091212161118'),('20091213222815'),('20091214183826'),('20091219021134'),('20100105090147'),('20100105132138'),('20100107141738'),('20100111205525'),('20100112151511'),('20100113090919'),('20100113203104'),('20100121160010'),('20100121183934'),('20100125145351'),('20100126103714'),('20100204105222'),('20100209025806'),('20100209144531'),('20100213103131'),('20100214212536'),('20100223170312'),('20100223183812'),('20100224153127'),('20100301163454'),('20100306153445'),('20100317120946'),('20100323085528'),('20100419190933'),('20100419194457'),('20100426100726'),('20100427121301'),('20100501084722'),('20100501095202'),('20100502163939'),('20100504142133'),('20100506180619'),('20100506185838'),('20100528155333'),('20100528185820'),('20100605152042'),('20100624110730'),('20100624123336'),('20100624175547'),('20100811163637'),('20100811205836'),('20100812162326'),('20100813023502'),('20100813185745'),('20100816212146'),('20100817152723'),('20100819170125'),('20100820135707'),('20100901171814'),('20100903203949'),('20100923095305'),('20100923162011'),('20100929151905'),('20101008190536'),('20101026184700'),('20101026184714'),('20101026184746'),('20101026184808'),('20101026184833'),('20101026184855'),('20101026184916'),('20101026184932'),('20101026184950'),('20101026184959'),('20101026185022'),('20101026192225'),('20101028151745'),('20101103212716'),('20101111133551'),('20101117031806'),('20101214150824'),('20101217012656'),('20101219201531'),('20101223215658'),('20110110094042'),('20110110130847'),('20110111122537'),('20110302102208'),('20110314192118'),('20110330125354'),('20110404120925'),('20110510080413'),('20120802072440');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipments`
--

DROP TABLE IF EXISTS `shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `shipped_at` datetime DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shipments_on_number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipments`
--

LOCK TABLES `shipments` WRITE;
/*!40000 ALTER TABLE `shipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_categories`
--

DROP TABLE IF EXISTS `shipping_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_categories`
--

LOCK TABLES `shipping_categories` WRITE;
/*!40000 ALTER TABLE `shipping_categories` DISABLE KEYS */;
INSERT INTO `shipping_categories` VALUES (1,'По умолчанию','2012-09-10 14:27:17','2012-09-10 14:27:17');
/*!40000 ALTER TABLE `shipping_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_methods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `display_on` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=574015645 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_methods`
--

LOCK TABLES `shipping_methods` WRITE;
/*!40000 ALTER TABLE `shipping_methods` DISABLE KEYS */;
INSERT INTO `shipping_methods` VALUES (13537749,1,'Курьером','2012-09-10 14:27:17','2012-09-10 14:27:17',NULL),(192811543,1,'Почта России (по предоплате)','2012-09-10 14:27:17','2012-09-10 14:27:17',NULL),(574015644,1,'Почта России (наложным платежём)','2012-09-10 14:27:17','2012-09-10 14:27:17',NULL);
/*!40000 ALTER TABLE `shipping_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_events`
--

DROP TABLE IF EXISTS `state_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stateful_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `previous_state` varchar(255) DEFAULT NULL,
  `stateful_type` varchar(255) DEFAULT NULL,
  `next_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_events`
--

LOCK TABLES `state_events` WRITE;
/*!40000 ALTER TABLE `state_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Республика Адыгея','RU-AD',168),(2,'Республика Башкортостан','RU-BA',168),(3,'Республика Бурятия','RU-BU',168),(4,'Республика Алтай','RU-AL',168),(5,'Республика Дагестан','RU-DA',168),(6,'Республика Ингушетия','RU-IN',168),(7,'Кабардино-Балкарская республика','RU-KB',168),(8,'Республика Калмыкия','RU-KL',168),(9,'Карачаево-Черкесская республика','RU-KC',168),(10,'Республика Карелия','RU-KR',168),(11,'Республика Коми','RU-KO',168),(12,'Республика Марий Эл','RU-ME',168),(13,'Республика Мордовия','RU-MO',168),(14,'Республика Саха (Якутия)','RU-SA',168),(15,'Республика Северная Осетия — Алания','RU-SE',168),(16,'Республика Татарстан','RU-TA',168),(17,'Республика Тыва','RU-TY',168),(18,'Удмуртская республика','RU-UD',168),(19,'Республика Хакасия','RU-KK',168),(20,'Чеченская республика','RU-CE',168),(21,'Чувашская республика','RU-CU',168),(22,'Алтайский край','RU-ALT',168),(23,'Краснодарский край','RU-KDA',168),(24,'Красноярский край','RU-KIA',168),(25,'Приморский край','RU-PRI',168),(26,'Ставропольский край','RU-STA',168),(27,'Хабаровский край','RU-KHA',168),(28,'Амурская область','RU-AMU',168),(29,'Архангельская область','RU-ARK',168),(30,'Астраханская область','RU-AST',168),(31,'Белгородская область','RU-BEL',168),(32,'Брянская область','RU-BRY',168),(33,'Владимирская область','RU-VLA',168),(34,'Волгоградская область','RU-VGG',168),(35,'Вологодская область','RU-VLG',168),(36,'Воронежская область','RU-VOR',168),(37,'Ивановская область','RU-IVA',168),(38,'Иркутская область','RU-IRK',168),(39,'Калининградская область','RU-KGD',168),(40,'Калужская область','RU-KLU',168),(41,'Камчатский край','RU-KAM',168),(42,'Кемеровская область','RU-KEM',168),(43,'Кировская область','RU-KIR',168),(44,'Костромская область','RU-KOS',168),(45,'Курганская область','RU-KGN',168),(46,'Курская область','RU-KRS',168),(47,'Ленинградская область','RU-LEN',168),(48,'Липецкая область','RU-LIP',168),(49,'Магаданская область','RU-MAG',168),(50,'Московская область','RU-MOS',168),(51,'Мурманская область','RU-MUR',168),(52,'Нижегородская область','RU-NIZ',168),(53,'Новгородская область','RU-NGR',168),(54,'Новосибирская область','RU-NVS',168),(55,'Омская область','RU-OMS',168),(56,'Оренбургская область','RU-ORE',168),(57,'Орловская область','RU-ORL',168),(58,'Пензенская область','RU-PNZ',168),(59,'Пермский край','RU-PER',168),(60,'Псковская область','RU-PSK',168),(61,'Ростовская область','RU-ROS',168),(62,'Рязанская область','RU-RYA',168),(63,'Самарская область','RU-SAM',168),(64,'Саратовская область','RU-SAR',168),(65,'Сахалинская область','RU-SAK',168),(66,'Свердловская область','RU-SVE',168),(67,'Смоленская область','RU-SMO',168),(68,'Тамбовская область','RU-TAM',168),(69,'Тверская область','RU-TVE',168),(70,'Томская область','RU-TOM',168),(71,'Тульская область','RU-TUL',168),(72,'Тюменская область','RU-TYU',168),(73,'Ульяновская область','RU-ULY',168),(74,'Челябинская область','RU-CHE',168),(75,'Забайкальский край','RU-ZAB',168),(76,'Ярославская область','RU-YAR',168),(77,'Москва','RU-MOW',168),(78,'Санкт-Петербург','RU-SPE',168),(79,'Еврейская автономная область','RU-YEV',168),(83,'Ненецкий автономный округ','RU-NEN',168),(86,'Ханты-Мансийский автономный округ - Югра','RU-KHM',168),(87,'Чукотский автономный округ','RU-CHU',168),(89,'Ямало-Ненецкий автономный округ','RU-YAN',168);
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_categories`
--

DROP TABLE IF EXISTS `tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_categories`
--

LOCK TABLES `tax_categories` WRITE;
/*!40000 ALTER TABLE `tax_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `amount` decimal(8,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomies`
--

DROP TABLE IF EXISTS `taxonomies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `show_on_homepage` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomies`
--

LOCK TABLES `taxonomies` WRITE;
/*!40000 ALTER TABLE `taxonomies` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxons`
--

DROP TABLE IF EXISTS `taxons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxonomy_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_taxons_on_permalink` (`permalink`),
  KEY `index_taxons_on_parent_id` (`parent_id`),
  KEY `index_taxons_on_taxonomy_id` (`taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxons`
--

LOCK TABLES `taxons` WRITE;
/*!40000 ALTER TABLE `taxons` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokenized_permissions`
--

DROP TABLE IF EXISTS `tokenized_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokenized_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissable_id` int(11) DEFAULT NULL,
  `permissable_type` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokenized_name_and_type` (`permissable_id`,`permissable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokenized_permissions`
--

LOCK TABLES `tokenized_permissions` WRITE;
/*!40000 ALTER TABLE `tokenized_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokenized_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `environment` varchar(255) DEFAULT NULL,
  `analytics_id` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `encrypted_password` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `persistence_token` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `perishable_token` varchar(255) DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `ship_address_id` int(11) DEFAULT NULL,
  `bill_address_id` int(11) DEFAULT NULL,
  `authentication_token` varchar(255) DEFAULT NULL,
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_persistence_token` (`persistence_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'spree@example.com','0f13a46430b6f167847046ff1314e0515aaef2cccbcd7ce5ca88cf1e14352f73ca22ed50aaca99708ab32d984f4dbd33f157977dc4943c72bd7b1aa092fc84d1','t0hSHGKs2j01xKSrYyXB',NULL,'2012-09-10 14:27:57','2012-09-10 19:54:51',NULL,NULL,NULL,1,0,NULL,'2012-09-10 19:54:51','2012-09-10 19:54:51','10.0.2.2','10.0.2.2','spree@example.com',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `sku` varchar(255) NOT NULL DEFAULT '',
  `price` decimal(8,2) NOT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  `height` decimal(8,2) DEFAULT NULL,
  `width` decimal(8,2) DEFAULT NULL,
  `depth` decimal(8,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `is_master` tinyint(1) DEFAULT '0',
  `count_on_hand` int(11) NOT NULL DEFAULT '0',
  `cost_price` decimal(8,2) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_variants_on_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_members`
--

DROP TABLE IF EXISTS `zone_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `zoneable_id` int(11) DEFAULT NULL,
  `zoneable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=764978543 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_members`
--

LOCK TABLES `zone_members` WRITE;
/*!40000 ALTER TABLE `zone_members` DISABLE KEYS */;
INSERT INTO `zone_members` VALUES (764978542,1,168,'Country','2012-09-10 14:27:17','2012-09-10 14:27:17');
/*!40000 ALTER TABLE `zone_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,'РФ','Российская Федерация','2012-09-10 14:27:17','2012-09-10 14:27:17');
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-09-11  1:36:04
