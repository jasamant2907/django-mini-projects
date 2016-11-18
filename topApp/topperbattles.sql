-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.14 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for topper_db
CREATE DATABASE IF NOT EXISTS `topper_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `topper_db`;


-- Dumping structure for table topper_db.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Dumping structure for table topper_db.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Dumping structure for table topper_db.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_permission: ~24 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add api access', 7, 'add_apiaccess'),
	(20, 'Can change api access', 7, 'change_apiaccess'),
	(21, 'Can delete api access', 7, 'delete_apiaccess'),
	(22, 'Can add api key', 8, 'add_apikey'),
	(23, 'Can change api key', 8, 'change_apikey'),
	(24, 'Can delete api key', 8, 'delete_apikey'),
	(25, 'Can add battles', 9, 'add_battles'),
	(26, 'Can change battles', 9, 'change_battles'),
	(27, 'Can delete battles', 9, 'delete_battles');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Dumping structure for table topper_db.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Dumping structure for table topper_db.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Dumping structure for table topper_db.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Dumping structure for table topper_db.battles
CREATE TABLE IF NOT EXISTS `battles` (
  `name` varchar(100) NOT NULL,
  `year` bigint(20) NOT NULL,
  `battle_number` bigint(20) NOT NULL,
  `attacker_king` varchar(100) DEFAULT NULL,
  `defender_king` varchar(100) DEFAULT NULL,
  `attacker_1` varchar(100) NOT NULL,
  `attacker_2` varchar(100) DEFAULT NULL,
  `attacker_3` varchar(100) DEFAULT NULL,
  `attacker_4` varchar(100) DEFAULT NULL,
  `defender_1` varchar(100) DEFAULT NULL,
  `defender_2` varchar(100) DEFAULT NULL,
  `defender_3` varchar(100) DEFAULT NULL,
  `defender_4` varchar(100) DEFAULT NULL,
  `attacker_outcome` varchar(100) DEFAULT NULL,
  `battle_type` varchar(100) DEFAULT NULL,
  `major_death` bit(1) DEFAULT NULL,
  `major_capture` bit(1) DEFAULT NULL,
  `attacker_size` bigint(20) DEFAULT NULL,
  `defender_size` bigint(20) DEFAULT NULL,
  `attacker_commander` varchar(100) DEFAULT NULL,
  `defender_commander` varchar(200) DEFAULT NULL,
  `summer` bit(1) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `region` varchar(100) NOT NULL,
  `note` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='A battles table';

-- Dumping data for table topper_db.battles: ~38 rows (approximately)
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` (`name`, `year`, `battle_number`, `attacker_king`, `defender_king`, `attacker_1`, `attacker_2`, `attacker_3`, `attacker_4`, `defender_1`, `defender_2`, `defender_3`, `defender_4`, `attacker_outcome`, `battle_type`, `major_death`, `major_capture`, `attacker_size`, `defender_size`, `attacker_commander`, `defender_commander`, `summer`, `location`, `region`, `note`) VALUES
	('Battle at the Mummer\'s Ford', 298, 2, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Baratheon', NULL, NULL, NULL, 'win', 'ambush', b'1', b'0', NULL, 120, 'Gregor Clegane', 'Beric Dondarrion', b'1', 'Mummer\'s Ford', 'The Riverlands', NULL),
	('Battle of Castle Black', 300, 28, 'Stannis Baratheon', 'Mance Rayder', 'Free folk', 'Thenns', 'Giants', NULL, 'Night\'s Watch', 'Baratheon', NULL, NULL, 'loss', 'siege', b'1', b'1', 100000, 1240, 'Mance Rayder, Tormund Giantsbane, Harma Dogshead, Magnar Styr, Varamyr', 'Stannis Baratheon, Jon Snow, Donal Noye, Cotter Pyke', b'0', 'Castle Black', 'Beyond the Wall', NULL),
	('Battle of Deepwood Motte', 299, 9, 'Balon/Euron Greyjoy', 'Robb Stark', 'Greyjoy', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', 1000, NULL, 'Asha Greyjoy', NULL, b'1', 'Deepwood Motte', 'The North', NULL),
	('Battle of Duskendale', 299, 22, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'loss', 'pitched battle', b'1', b'0', 3000, NULL, 'Robertt Glover, Helman Tallhart', 'Randyll Tarly, Gregor Clegane', b'1', 'Duskendale', 'The Crownlands', NULL),
	('Battle of Moat Cailin', 299, 8, 'Balon/Euron Greyjoy', 'Robb Stark', 'Greyjoy', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', NULL, NULL, 'Victarion Greyjoy', NULL, b'1', 'Moat Cailin', 'The North', NULL),
	('Battle of Oxcross', 299, 15, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', 'Tully', NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'ambush', b'1', b'1', 6000, 10000, 'Robb Stark, Brynden Tully', 'Stafford Lannister, Roland Crakehall, Antario Jast', b'1', 'Oxcross', 'The Westerlands', NULL),
	('Battle of Riverrun', 298, 3, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Tully', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'1', 15000, 10000, 'Jaime Lannister, Andros Brax', 'Edmure Tully, Tytos Blackwood', b'1', 'Riverrun', 'The Riverlands', NULL),
	('Battle of the Blackwater', 299, 20, 'Stannis Baratheon', 'Joffrey/Tommen Baratheon', 'Baratheon', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'loss', 'pitched battle', b'1', b'1', 21000, 7250, 'Stannis Baratheon, Imry Florent, Guyard Morrigen, Rolland Storm, Salladhor Saan, Davos Seaworth', 'Tyrion Lannister, Jacelyn Bywater, Sandor Clegane, Tywin Lannister, Garlan Tyrell, Mace Tyrell, Randyll Tarly', b'1', 'King\'s Landing', 'The Crownlands', NULL),
	('Battle of the Burning Septry', 299, 23, NULL, NULL, 'Brotherhood without Banners', NULL, NULL, NULL, 'Brave Companions', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', NULL, NULL, NULL, NULL, b'1', NULL, 'The Riverlands', NULL),
	('Battle of the Camps', 298, 6, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', 'Tully', NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'ambush', b'0', b'0', 6000, 12625, 'Robb Stark, Tytos Blackwood, Brynden Tully', 'Lord Andros Brax, Forley Prester', b'1', 'Riverrun', 'The Riverlands', NULL),
	('Battle of the Crag', 299, 19, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'ambush', b'0', b'0', 6000, NULL, 'Robb Stark, Smalljon Umber, Black Walder Frey', 'Rolph Spicer', b'1', 'Crag', 'The Westerlands', NULL),
	('Battle of the Fords', 299, 17, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Tully', NULL, NULL, NULL, 'loss', 'pitched battle', b'0', b'0', 20000, 10000, 'Tywin Lannister, Flement Brax, Gregor Clegane, Addam Marbrand, Lyle Crakehall, Leo Lefford', 'Edmure Tully, Jason Mallister, Karyl Vance', b'1', 'Red Fork', 'The Riverlands', NULL),
	('Battle of the Golden Tooth', 298, 1, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Tully', NULL, NULL, NULL, 'win', 'pitched battle', b'1', b'0', 15000, 4000, 'Jaime Lannister', 'Clement Piper, Vance', b'1', 'Golden Tooth', 'The Westerlands', NULL),
	('Battle of the Green Fork', 298, 4, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'loss', 'pitched battle', b'1', b'1', 18000, 20000, 'Roose Bolton, Wylis Manderly, Medger Cerwyn, Harrion Karstark, Halys Hornwood', 'Tywin Lannister, Gregor Clegane, Kevan Lannister, Addam Marbrand', b'1', 'Green Fork', 'The Riverlands', NULL),
	('Battle of the Ruby Ford', 299, 24, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', NULL, 6000, 'Gregor Clegane', 'Roose Bolton, Wylis Manderly', NULL, 'Ruby Ford', 'The Riverlands', NULL),
	('Battle of the Shield Islands', 300, 32, 'Balon/Euron Greyjoy', 'Joffrey/Tommen Baratheon', 'Greyjoy', NULL, NULL, NULL, 'Tyrell', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', NULL, NULL, 'Euron Greyjoy, Victarion Greyjoy', NULL, b'0', 'Shield Islands', 'The Reach', NULL),
	('Battle of the Stony Shore', 299, 10, 'Balon/Euron Greyjoy', 'Robb Stark', 'Greyjoy', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'ambush', b'0', b'0', 264, NULL, 'Theon Greyjoy', NULL, b'1', 'Stony Shore', 'The North', 'Greyjoy\'s troop number based on the Battle of Deepwood Motte, in which Asha had 1000 soldier on 30 longships. That comes out to ~33 per longship. In the Battle of the Stony Shore, Theon has 8 longships, and just we can estimate that he has 8*33 =265 troops.'),
	('Battle of the Whispering Wood', 298, 5, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', 'Tully', NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'ambush', b'1', b'1', 1875, 6000, 'Robb Stark, Brynden Tully', 'Jaime Lannister', b'1', 'Whispering Wood', 'The Riverlands', NULL),
	('Battle of Torrhen\'s Square', 299, 11, 'Robb Stark', 'Balon/Euron Greyjoy', 'Stark', NULL, NULL, NULL, 'Greyjoy', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', 244, 900, 'Rodrik Cassel, Cley Cerwyn', 'Dagmer Cleftjaw', b'1', 'Torrhen\'s Square', 'The North', 'Greyjoy\'s troop number comes from the 264 estimate to have arrived on the stony shore minus the 20 Theon takes to attack Winterfell. Thus 264-20=244'),
	('Battle of Winterfell', 299, 12, 'Balon/Euron Greyjoy', 'Robb Stark', 'Greyjoy', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'ambush', b'0', b'1', 20, NULL, 'Theon Greyjoy', 'Bran Stark', b'1', 'Winterfell', 'The North', 'It isn\'t mentioned how many Stark men are left in Winterfell, other than "very few".'),
	('Fall of Moat Cailin', 300, 29, 'Joffrey/Tommen Baratheon', 'Balon/Euron Greyjoy', 'Bolton', NULL, NULL, NULL, 'Greyjoy', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', NULL, NULL, 'Ramsey Bolton', NULL, b'0', 'Moat Cailin', 'The North', NULL),
	('Invasion of Ryamsport, Vinetown, and Starfish Harbor', 300, 33, 'Balon/Euron Greyjoy', 'Joffrey/Tommen Baratheon', 'Greyjoy', NULL, NULL, NULL, 'Tyrell', NULL, NULL, NULL, 'win', 'razing', b'0', b'0', NULL, NULL, 'Euron Greyjoy, Victarion Greyjoy', NULL, b'0', 'Ryamsport, Vinetown, Starfish Harbor', 'The Reach', NULL),
	('Retaking of Deepwood Motte', 300, 31, 'Stannis Baratheon', 'Balon/Euron Greyjoy', 'Baratheon', 'Karstark', 'Mormont', 'Glover', 'Greyjoy', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', 4500, 200, 'Stannis Baratheon, Alysane Mormot', 'Asha Greyjoy', b'0', 'Deepwood Motte', 'The North', NULL),
	('Retaking of Harrenhal', 299, 25, 'Joffrey/Tommen Baratheon', NULL, 'Lannister', NULL, NULL, NULL, 'Brave Companions', NULL, NULL, NULL, 'win', 'pitched battle', b'1', b'0', NULL, NULL, 'Gregor Clegane', 'Vargo Hoat', b'1', 'Harrenhal', 'The Riverlands', NULL),
	('Sack of Darry', 298, 7, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', NULL, NULL, NULL, 'Darry', NULL, NULL, NULL, 'win', 'pitched battle', b'0', b'0', NULL, NULL, 'Gregor Clegane', 'Lyman Darry', b'1', 'Darry', 'The Riverlands', NULL),
	('Sack of Harrenhal', 299, 18, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Stark', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'ambush', b'1', b'0', 100, 100, 'Roose Bolton, Vargo Hoat, Robett Glover', 'Amory Lorch', b'1', 'Harrenhal', 'The Riverlands', NULL),
	('Sack of Saltpans', 300, 30, NULL, NULL, 'Brave Companions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'win', 'razing', b'0', b'0', NULL, NULL, 'Rorge', NULL, b'0', 'Saltpans', 'The Riverlands', NULL),
	('Sack of Torrhen\'s Square', 299, 13, 'Balon/Euron Greyjoy', 'Balon/Euron Greyjoy', 'Greyjoy', NULL, NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'siege', b'0', b'1', NULL, NULL, 'Dagmer Cleftjaw', NULL, b'1', 'Torrhen\'s Square', 'The North', NULL),
	('Sack of Winterfell', 299, 14, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Bolton', 'Greyjoy', NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'ambush', b'1', b'0', 618, 2000, 'Ramsay Snow, Theon Greyjoy', 'Rodrik Cassel, Cley Cerwyn, Leobald Tallhart', b'1', 'Winterfell', 'The North', 'Since House Bolton betrays the Starks for House Lannister, we code this battle as between these two houses. Greyjoy men, numbering only 20, don\'t play a major part in the fighting and end up dying anyway.'),
	('Second Seige of Storm\'s End', 300, 34, 'Joffrey/Tommen Baratheon', 'Stannis Baratheon', 'Baratheon', NULL, NULL, NULL, 'Baratheon', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', NULL, 200, 'Mace Tyrell, Mathis Rowan', 'Gilbert Farring', b'0', 'Storm\'s End', 'The Stormlands', NULL),
	('Siege of Darry', 299, 21, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Darry', NULL, NULL, NULL, 'Lannister', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', NULL, NULL, 'Helman Tallhart', NULL, b'1', 'Darry', 'The Riverlands', NULL),
	('Siege of Dragonstone', 300, 35, 'Joffrey/Tommen Baratheon', 'Stannis Baratheon', 'Baratheon', NULL, NULL, NULL, 'Baratheon', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', 2000, NULL, 'Loras Tyrell, Raxter Redwyne', 'Rolland Storm', b'0', 'Dragonstone', 'The Stormlands', NULL),
	('Siege of Raventree', 300, 37, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Bracken', 'Lannister', NULL, NULL, 'Blackwood', NULL, NULL, NULL, 'win', 'siege', b'0', b'1', 1500, NULL, 'Jonos Bracken, Jaime Lannister', 'Tytos Blackwood', b'0', 'Raventree', 'The Riverlands', NULL),
	('Siege of Riverrun', 300, 36, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Lannister', 'Frey', NULL, NULL, 'Tully', NULL, NULL, NULL, 'win', 'siege', b'0', b'0', 3000, NULL, 'Daven Lannister, Ryman Fey, Jaime Lannister', 'Brynden Tully', b'0', 'Riverrun', 'The Riverlands', NULL),
	('Siege of Seagard', 299, 27, 'Robb Stark', 'Joffrey/Tommen Baratheon', 'Frey', NULL, NULL, NULL, 'Mallister', NULL, NULL, NULL, 'win', 'siege', b'0', b'1', NULL, NULL, 'Walder Frey', 'Jason Mallister', b'1', 'Seagard', 'The Riverlands', NULL),
	('Siege of Storm\'s End', 299, 16, 'Stannis Baratheon', 'Renly Baratheon', 'Baratheon', NULL, NULL, NULL, 'Baratheon', NULL, NULL, NULL, 'win', 'siege', b'1', b'0', 5000, 20000, 'Stannis Baratheon, Davos Seaworth', 'Renly Baratheon, Cortnay Penrose, Loras Tyrell, Randyll Tarly, Mathis Rowan', b'1', 'Storm\'s End', 'The Stormlands', NULL),
	('Siege of Winterfell', 300, 38, 'Stannis Baratheon', 'Joffrey/Tommen Baratheon', 'Baratheon', 'Karstark', 'Mormont', 'Glover', 'Bolton', 'Frey', NULL, NULL, NULL, NULL, NULL, NULL, 5000, 8000, 'Stannis Baratheon', 'Roose Bolton', b'0', 'Winterfell', 'The North', NULL),
	('The Red Wedding', 299, 26, 'Joffrey/Tommen Baratheon', 'Robb Stark', 'Frey', 'Bolton', NULL, NULL, 'Stark', NULL, NULL, NULL, 'win', 'ambush', b'1', b'1', 3500, 3500, 'Walder Frey, Roose Bolton, Walder Rivers', 'Robb Stark', b'1', 'The Twins', 'The Riverlands', 'This observation refers to the battle against the Stark men, not the attack on the wedding');
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;


-- Dumping structure for table topper_db.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Dumping structure for table topper_db.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.django_content_type: ~8 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(9, 'battles_api', 'battles'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'tastypie', 'apiaccess'),
	(8, 'tastypie', 'apikey');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Dumping structure for table topper_db.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.django_migrations: ~10 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2016-09-03 08:36:41.088401'),
	(2, 'auth', '0001_initial', '2016-09-03 08:36:50.457939'),
	(3, 'admin', '0001_initial', '2016-09-03 08:36:53.076325'),
	(4, 'contenttypes', '0002_remove_content_type_name', '2016-09-03 08:36:54.545160'),
	(5, 'auth', '0002_alter_permission_name_max_length', '2016-09-03 08:36:55.322340'),
	(6, 'auth', '0003_alter_user_email_max_length', '2016-09-03 08:36:56.126039'),
	(7, 'auth', '0004_alter_user_username_opts', '2016-09-03 08:36:56.212175'),
	(8, 'auth', '0005_alter_user_last_login_null', '2016-09-03 08:36:57.013019'),
	(9, 'auth', '0006_require_contenttypes_0002', '2016-09-03 08:36:57.057100'),
	(10, 'sessions', '0001_initial', '2016-09-03 08:36:57.828125'),
	(11, 'tastypie', '0001_initial', '2016-09-03 14:51:08.142059');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- Dumping structure for table topper_db.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.django_session: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


-- Dumping structure for table topper_db.tastypie_apiaccess
CREATE TABLE IF NOT EXISTS `tastypie_apiaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `request_method` varchar(10) NOT NULL,
  `accessed` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.tastypie_apiaccess: ~0 rows (approximately)
/*!40000 ALTER TABLE `tastypie_apiaccess` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apiaccess` ENABLE KEYS */;


-- Dumping structure for table topper_db.tastypie_apikey
CREATE TABLE IF NOT EXISTS `tastypie_apikey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(128) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `tastypie_apikey_3c6e0b8a` (`key`),
  CONSTRAINT `tastypie_apikey_user_id_e0b406b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table topper_db.tastypie_apikey: ~0 rows (approximately)
/*!40000 ALTER TABLE `tastypie_apikey` DISABLE KEYS */;
/*!40000 ALTER TABLE `tastypie_apikey` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
