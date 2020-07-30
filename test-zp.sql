-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.25-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.3.0.5055
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных test-zp
CREATE DATABASE IF NOT EXISTS `test-zp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `test-zp`;

-- Дамп структуры для таблица test-zp.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Индекс 2` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test-zp.category: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `parent_id`, `name`, `sortorder`, `status`, `created_at`) VALUES
	(1, 0, 'Электроника', 0, 1, '2020-07-30 09:53:42'),
	(2, 1, 'Компьютерная техника', 0, 1, '2020-07-30 09:53:58'),
	(3, 2, 'Компьютеры', 0, 1, '2020-07-30 09:54:17'),
	(4, 3, 'Материнские платы', 0, 1, '2020-07-30 09:54:36'),
	(5, 1, 'Бытовая техника', 0, 1, '2020-07-30 09:55:04'),
	(6, 5, 'Телевизоры', 0, 1, '2020-07-30 09:55:24');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- Дамп структуры для таблица test-zp.category_path
CREATE TABLE IF NOT EXISTS `category_path` (
  `cat_id` int(11) unsigned NOT NULL,
  `path_id` int(11) unsigned NOT NULL,
  `level` int(11) unsigned NOT NULL,
  PRIMARY KEY (`path_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test-zp.category_path: ~14 rows (приблизительно)
/*!40000 ALTER TABLE `category_path` DISABLE KEYS */;
INSERT INTO `category_path` (`cat_id`, `path_id`, `level`) VALUES
	(1, 1, 0),
	(2, 1, 0),
	(3, 1, 0),
	(4, 1, 0),
	(5, 1, 0),
	(2, 2, 1),
	(3, 2, 1),
	(4, 2, 1),
	(3, 3, 2),
	(4, 3, 2),
	(4, 4, 3),
	(5, 5, 1),
	(6, 5, 0),
	(6, 6, 1);
/*!40000 ALTER TABLE `category_path` ENABLE KEYS */;

-- Дамп структуры для таблица test-zp.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) DEFAULT NULL,
  `category_id` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Индекс 2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test-zp.product: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `description`, `price`, `category_id`, `status`, `created_at`) VALUES
	(1, 'Материнская плата 1', NULL, 100.00, 4, 1, '2020-07-30 11:06:44'),
	(2, 'Материнская плата 2', NULL, 150.00, 4, 1, '2020-07-30 11:06:46'),
	(3, 'Телевозор 1', NULL, 200.00, 6, 1, '2020-07-30 11:07:33'),
	(4, 'Телевозор 2', NULL, 250.00, 6, 1, '2020-07-30 11:07:35'),
	(5, 'Материнская плата 1', NULL, 222.00, 4, 1, '2020-07-30 11:59:14'),
	(6, 'Компьютер 1', NULL, 333.00, 3, 1, '2020-07-30 12:34:58');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

-- Дамп структуры для таблица test-zp.product_to_category
CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test-zp.product_to_category: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `product_to_category` DISABLE KEYS */;
INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
	(1, 4),
	(2, 4),
	(3, 6),
	(4, 6),
	(5, 4),
	(6, 3);
/*!40000 ALTER TABLE `product_to_category` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
