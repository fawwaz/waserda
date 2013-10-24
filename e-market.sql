-- MySQL dump 10.13  Distrib 5.1.37, for Win32 (ia32)
--
-- Host: localhost    Database: e-market
-- ------------------------------------------------------
-- Server version	5.1.37

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
-- Table structure for table `data_barang`
--

DROP TABLE IF EXISTS `data_barang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_barang` (
  `id_barang` int(11) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  PRIMARY KEY (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_barang`
--

LOCK TABLES `data_barang` WRITE;
/*!40000 ALTER TABLE `data_barang` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_barang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_kartu_kredit`
--

DROP TABLE IF EXISTS `data_kartu_kredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_kartu_kredit` (
  `no_kartu` varchar(50) NOT NULL,
  `nama_pemegang_kartu` varchar(45) NOT NULL,
  `expired_date` date NOT NULL,
  PRIMARY KEY (`no_kartu`),
  UNIQUE KEY `no_kartu_UNIQUE` (`no_kartu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_kartu_kredit`
--

LOCK TABLES `data_kartu_kredit` WRITE;
/*!40000 ALTER TABLE `data_kartu_kredit` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_kartu_kredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_keranjang`
--

DROP TABLE IF EXISTS `data_keranjang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_keranjang` (
  `id_user` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  PRIMARY KEY (`id_user`,`id_barang`),
  CONSTRAINT `fk_data_keranjang_data_user` FOREIGN KEY (`id_user`) REFERENCES `data_user` (`id_user`),
  CONSTRAINT `fk_data_keranjang_data_barang1` FOREIGN KEY (`id_user`) REFERENCES `data_barang` (`id_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_keranjang`
--

LOCK TABLES `data_keranjang` WRITE;
/*!40000 ALTER TABLE `data_keranjang` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_keranjang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_user`
--

DROP TABLE IF EXISTS `data_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `no_handphone` varchar(15) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `provinsi` varchar(45) NOT NULL,
  `kota` varchar(45) NOT NULL,
  `kabupaten` varchar(45) DEFAULT NULL,
  `kodepos` varchar(10) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_user`
--

LOCK TABLES `data_user` WRITE;
/*!40000 ALTER TABLE `data_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_kk`
--

DROP TABLE IF EXISTS `user_kk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_kk` (
  `id_user` int(11) NOT NULL,
  `no_kartu` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`,`no_kartu`),
  UNIQUE KEY `no_kartu_UNIQUE` (`no_kartu`),
  CONSTRAINT `fk_user_kk_data_user1` FOREIGN KEY (`id_user`) REFERENCES `data_user` (`id_user`),
  CONSTRAINT `fk_user_kk_data_kartu_kredit1` FOREIGN KEY (`no_kartu`) REFERENCES `data_kartu_kredit` (`no_kartu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_kk`
--

LOCK TABLES `user_kk` WRITE;
/*!40000 ALTER TABLE `user_kk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_kk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-19 19:22:34
