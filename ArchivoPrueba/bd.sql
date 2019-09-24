-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webcrawler_development012
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

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
  `number` int(11) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `keyword` varchar(60) NOT NULL,
  `URL` varchar(150) NOT NULL,
  `date_search` datetime NOT NULL,
  `title` varchar(1000) NOT NULL,
  `text` text NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `datepublish` datetime DEFAULT NULL,
  `Observations` text,
  PRIMARY KEY (`number`,`website_name`),
  KEY `articles_websites_keywords_idx` (`keyword`,`website_name`),
  CONSTRAINT `articles_websites_keywords` FOREIGN KEY (`keyword`, `website_name`) REFERENCES `websites_keywords` (`keyword`, `website_name`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `keyword` varchar(100) NOT NULL,
  `datecreation` datetime NOT NULL,
  PRIMARY KEY (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
INSERT INTO `keywords` VALUES ('alphr','2016-02-02 00:00:00'),('health','2016-02-03 00:00:00');
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameters`
--

DROP TABLE IF EXISTS `parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parameters` (
  `idparameter` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameters`
--

LOCK TABLES `parameters` WRITE;
/*!40000 ALTER TABLE `parameters` DISABLE KEYS */;
INSERT INTO `parameters` VALUES (1,'number_process','10'),(2,'number_threads','10'),(3,'number_words_serach','1'),(4,'recursive','1'),(5,'number_pages_search','1000');
/*!40000 ALTER TABLE `parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websites`
--

DROP TABLE IF EXISTS `websites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websites` (
  `name` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `country` varchar(60) NOT NULL,
  `datecreation` datetime NOT NULL,
  PRIMARY KEY (`name`),
  KEY `sites_pk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websites`
--

LOCK TABLES `websites` WRITE;
/*!40000 ALTER TABLE `websites` DISABLE KEYS */;
INSERT INTO `websites` VALUES ('9to5google','https://9to5google.com/','USA','2018-04-02 23:46:11'),('adlatina','http://www.adlatina.com','USA','2018-04-02 23:46:10'),('alphr','http://www.alphr.com/','USA','2018-04-02 23:46:13'),('androidcommunity','https://androidcommunity.com/','USA','2018-04-02 23:46:10'),('aol','https://www.aol.com/','USA','2018-04-02 23:46:11'),('asiaone','http://www.asiaone.com','USA','2018-04-02 23:46:11'),('avclub','https://www.avclub.com','USA','2018-04-02 23:46:14'),('axios','https://www.axios.com/','USA','2018-04-02 23:46:14'),('bgr','http://bgr.com/','USA','2018-04-02 23:46:10'),('bloomberg','https://www.bloomberg.com','USA','2018-04-02 23:46:11'),('bucyrustelegraphforum','http://www.bucyrustelegraphforum.com/','USA','2018-04-02 23:46:15'),('cantonrep','http://www.cantonrep.com/','USA','2018-04-02 23:46:15'),('cbslocal','http://newyork.cbslocal.com','USA','2018-04-02 23:46:10'),('chicagomag','http://www.chicagomag.com/','USA','2018-04-02 23:46:10'),('cnbc','http://www.cnbc.com','USA','2018-04-02 23:46:10'),('cornwalllive','http://www.cornwalllive.com','USA','2018-04-02 23:46:11'),('ctpost','http://www.ctpost.com/','USA','2018-04-02 23:46:14'),('dailybulletin','http://www.dailybulletin.com/','USA','2018-04-02 23:46:14'),('dailynews','http://www.dailynews.com/','USA','2018-04-02 23:46:14'),('dailytribune','http://www.dailytribune.com/','USA','2018-04-02 23:46:14'),('dailyuw','http://www.dailyuw.com/','USA','2018-04-02 23:46:11'),('diariodemocracia','https://www.diariodemocracia.com','USA','2018-04-02 23:46:10'),('elliberal','https://www.elliberal.com.ar','USA','2018-04-02 23:46:10'),('eltiempo','http://www.eltiempo.com','US','2018-04-02 16:46:53'),('engadget','https://www.engadget.com','USA','2018-04-02 23:46:10'),('ew','http://ew.com','USA','2018-04-02 23:46:11'),('fool','https://www.fool.com','USA','2018-04-02 23:46:11'),('forbes','https://www.forbes.com','USA','2018-04-02 23:46:11'),('foxcall managesites(10phoenix','http://www.foxcall managesites(10phoenix.com/','USA','2018-04-02 23:46:11'),('foxnews','http://www.foxnews.com','USA','2018-04-02 23:46:09'),('gamespot','https://www.gamespot.com','USA','2018-04-02 23:46:10'),('greenwichtime','http://www.greenwichtime.com/','USA','2018-04-02 23:46:14'),('haaretz','https://www.haaretz.com','USA','2018-04-02 23:46:14'),('huffingtonpost','http://www.huffingtonpost.com','USA','2018-04-02 23:46:10'),('ign','http://sea.ign.com/','USA','2018-04-02 23:45:59'),('independent','http://www.independent.com/','USA','2018-04-02 23:46:14'),('independentvoice','http://independentvoice.com/','USA','2018-04-02 23:46:14'),('indianexpress','http://indianexpress.com','USA','2018-04-02 23:46:11'),('kotaku','http://kotaku.com','USA','2018-04-02 23:46:10'),('lancastereaglegazette','http://www.lancastereaglegazette.com/','USA','2018-04-02 23:46:14'),('leafly','https://www.leafly.com','USA','2018-04-02 23:46:11'),('lifehacker','http://lifehacker.com','USA','2018-04-02 23:46:10'),('losbanosenterprise','http://www.losbanosenterprise.com/','USA','2018-04-02 23:46:14'),('macworld','https://www.macworld.com/','USA','2018-04-02 23:46:10'),('maderatribune','http://www.maderatribune.com/','USA','2018-04-02 23:46:14'),('mansfieldnewsjournal','http://www.mansfieldnewsjournal.com/','USA','2018-04-02 23:46:15'),('mediaite','http://www.mediaite.com','USA','2018-04-02 23:46:10'),('medicalxpress','https://medicalxpress.com/','USA','2018-04-02 23:46:13'),('medina-gazette','http://www.medina-gazette.com/','USA','2018-04-02 23:46:14'),('mercurynews','http://www.mercurynews.com/','USA','2018-04-02 23:46:14'),('morningjournal','http://www.morningjournal.com/','USA','2018-04-02 23:46:15'),('multichannel','http://www.multichannel.com','USA','2018-04-02 23:46:10'),('nanalyze','https://www.nanalyze.com','USA','2018-04-02 23:46:13'),('nature','https://www.nature.com/','USA','2018-04-02 23:46:13'),('ndtv','http://gadgets.ndtv.com','USA','2018-04-02 23:46:10'),('newscientist','https://www.newscientist.com/','USA','2018-04-02 23:45:59'),('newstimes','http://www.newstimes.com/','USA','2018-04-02 23:46:14'),('norwalkreflector','http://www.norwalkreflector.com/','USA','2018-04-02 23:46:15'),('nymag','http://nymag.com/','USA','2018-04-02 23:45:59'),('pagesix','http://pagesix.com','USA','2018-04-02 23:46:10'),('pcgamer','http://www.pcgamer.com','USA','2018-04-02 23:46:10'),('pcgamesn','https://www.pcgamesn.com','USA','2018-04-02 23:46:11'),('pcworld','http://www.pcworld.com','USA','2018-04-02 23:46:10'),('phys','https://phys.org','USA','2018-04-02 23:46:11'),('post-gazette','http://www.post-gazette.com','USA','2018-04-02 23:46:10'),('psychcentral','https://psychcentral.com','USA','2018-04-02 23:46:11'),('rep-am','http://www.rep-am.com/','USA','2018-04-02 23:46:14'),('reuters','http://www.reuters.com','USA','2018-04-02 23:45:59'),('sacbee','http://www.sacbee.com/','USA','2018-04-02 23:46:14'),('santamariatimes','http://santamariatimes.com/','USA','2018-04-02 23:46:14'),('sbsun','http://www.sbsun.com/','USA','2018-04-02 23:46:14'),('sci-news','http://www.sci-news.com/','USA','2018-04-02 23:46:14'),('scientificamerican','https://www.scientificamerican.com','USA','2018-04-02 23:46:11'),('sgvtribune','http://www.sgvtribune.com/','USA','2018-04-02 23:46:14'),('siasat','https://www.siasat.com','USA','2018-04-02 23:46:11'),('sierranewsonline','http://sierranewsonline.com/','USA','2018-04-02 23:46:14'),('siskiyoudaily','http://www.siskiyoudaily.com/','USA','2018-04-02 23:46:14'),('smdailyjournal','http://www.smdailyjournal.com/','USA','2018-04-02 23:46:14'),('space','https://www.space.com','USA','2018-04-02 23:46:11'),('spacecoastdaily','http://spacecoastdaily.com/','USA','2018-04-02 23:46:11'),('spacedaily','http://www.spacedaily.com','USA','2018-04-02 23:46:11'),('spaceflightinsider','http://www.spaceflightinsider.com','USA','2018-04-02 23:46:11'),('stamfordadvocate','http://www.stamfordadvocate.com/','USA','2018-04-02 23:46:14'),('stltoday','http://www.stltoday.com','USA','2018-04-02 23:46:14'),('streetwisereports','http://www.streetwisereports.com/','USA','2018-04-02 23:46:10'),('syracuse','http://www.syracuse.com','USA','2018-04-02 23:46:11'),('tecake','https://tecake.in/','USA','2018-04-02 23:46:11'),('techcrunch','https://techcrunch.com','USA','2018-04-02 23:46:10'),('techtimes','http://www.techtimes.com/','USA','2018-04-02 23:46:11'),('techzim','http://www.techzim.co.zw','USA','2018-04-02 23:46:10'),('thedailybeast','https://www.thedailybeast.com','USA','2018-04-02 23:46:11'),('thehill','http://thehill.com/','USA','2018-04-02 23:46:11'),('thehimalayantimes','https://thehimalayantimes.com','USA','2018-04-02 23:46:11'),('therip','http://www.therip.com/','USA','2018-04-02 23:46:14'),('thesuburbanite','http://www.thesuburbanite.com/','USA','2018-04-02 23:46:15'),('time','http://time.com','USA','2018-04-02 23:46:10'),('timesreporter','http://www.timesreporter.com/','USA','2018-04-02 23:45:59'),('topix','http://www.topix.com/city/','USA','2018-04-02 23:46:14'),('usatoday','https://www.usatoday.com','USA','2018-04-02 23:46:09'),('usnews','https://www.usnews.com/','USA','2018-04-02 23:46:11'),('utsa','http://www.utsa.edu/t','USA','2018-04-02 23:46:14'),('washingtontimes','http://www.washingtontimes.com','USA','2018-04-02 23:46:10'),('wsj','https://www.wsj.com','USA','2018-04-02 23:46:10'),('wtsp','http://www.wtsp.com','USA','2018-04-02 23:46:10'),('youris','http://www.youris.com/','USA','2018-04-02 23:46:14'),('zawya','https://www.zawya.com','USA','2018-04-02 23:46:11'),('zdnet','http://www.zdnet.com','USA','2018-04-02 23:46:10'),('zeenews','http://zeenews.india.com/','USA','2018-04-02 23:46:11');
/*!40000 ALTER TABLE `websites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websites_keywords`
--

DROP TABLE IF EXISTS `websites_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websites_keywords` (
  `keyword` varchar(100) NOT NULL,
  `website_name` varchar(100) NOT NULL,
  `number_search` int(11) DEFAULT NULL,
  `number_total_articles` int(11) DEFAULT NULL,
  `number_articles_with_keyword` int(11) DEFAULT NULL,
  `last_crawling_date` datetime DEFAULT NULL,
  PRIMARY KEY (`keyword`,`website_name`),
  KEY `websites_keywords_websites_idx` (`website_name`),
  CONSTRAINT `websites_keywords_websites` FOREIGN KEY (`website_name`) REFERENCES `websites` (`name`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `websiteskeywords_keywords` FOREIGN KEY (`keyword`) REFERENCES `keywords` (`keyword`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websites_keywords`
--

LOCK TABLES `websites_keywords` WRITE;
/*!40000 ALTER TABLE `websites_keywords` DISABLE KEYS */;
INSERT INTO `websites_keywords` VALUES ('health','alphr',0,0,0,NULL);
/*!40000 ALTER TABLE `websites_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'webcrawler_development012'
--
/*!50003 DROP PROCEDURE IF EXISTS `manageArticles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manageArticles`(
	IN `p_typeOperation` TINYINT,
	IN `p_keyword` VARCHAR(100),
	IN `p_website_name` VARCHAR(100),
	IN `p_title` VARCHAR(1000) ,
	IN `p_text` TEXT CHARACTER set utf16,
	IN `p_description` VARCHAR(2000),
	IN `p_datepublish` VARCHAR(30),
	IN `p_sitedomain` VARCHAR(100),
	IN `p_url` VARCHAR(200),
	IN `p_observations` TEXT


)
BEGIN

  if (p_typeOperation = 1) then
  
   select 1;
      insert into articles values (p_keyword,p_website_name,p_url,(select now()),p_title,p_text,p_description,p_datepublish,p_observations);
  
  
  end if;
   


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `managekeywords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `managekeywords`(
	IN `p_typeoperation` TINYINT,
	IN `p_keyword` VARCHAR(500)





,
	IN `p_website_name` VARCHAR(100)




)
BEGIN

DECLARE numberRecordswebsites_keywords INT;
DECLARE numberRecordskeywords INT;
 
  -- se Verifica si se desea insertar(1) o eliminar(2)
  if (p_typeoperation = 1) then
  
    Select count(1) into numberRecordskeywords from keywords where keyword = p_keyword; 
   Select count(1) into numberRecordswebsites_keywords from websites_keywords where keyword = p_keyword and website_name = p_website_name;
    
    if (numberRecordskeywords = 0) then
  
       insert into keywords values (p_keyword, (select now()));
       
    end if; 

    if (numberRecordswebsites_keywords = 0) then
  
       insert into websites_keywords values(p_keyword,p_website_name,1,0,0,(select now()));
       
    else
	 
	   update websites_keywords set last_crawling_date = (select now()), number_search = number_search + 1
      where keyword = p_keyword and website_name =p_website_name;									  
     
      
    end if; 

  



    
  else
    
	 delete from websites_keywords where keyword = p_keyword;  
    delete from keywords where keyword = p_keyword;

    
  end if;    


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `managesites` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `managesites`(
	IN `p_typeoperation` TINYINT,
	IN `p_name` VARCHAR(100),
	IN `p_url` VARCHAR(100),
    IN `p_country` VARCHAR(100)
)
BEGIN

DECLARE numberRecords int;

  if (p_typeoperation = 1) then
  
     select count(1) into numberRecords from websites where name = p_name;
     
     if (numberRecords = 0) then
     
        insert into websites values(p_name,p_url,p_country,(select now()));
        
      else   
      
        update websites set name = p_name, url = p_url, country = p_country where name = p_name;
        
     end if;   
  
  else
  
    delete from websites where name = p_name;
  
  end if;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11 18:22:41
