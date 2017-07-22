-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           5.7.14 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Export de la structure de la base pour lachinerie
DROP DATABASE IF EXISTS `lachinerie`;
CREATE DATABASE IF NOT EXISTS `lachinerie` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `lachinerie`;

-- Export de la structure de la table lachinerie. articles
DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.articles : ~4 rows (environ)
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'CHOC : Ben Klock n\'a jamais su mixer !', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat', '2017-06-24 22:53:56', '2017-06-24 22:53:57'),
	(2, 'Quelle platine pour mon pitichat ?', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat', '2017-06-24 22:54:16', '2017-06-24 22:54:16'),
	(3, 'Kerry Chandler de retour à Lyon !', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat', '2017-06-24 22:54:49', '2017-06-24 22:54:49'),
	(4, 'Grosse sortie sur Yoyaku', 'accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat', '2017-06-24 22:55:14', '2017-06-24 22:55:14');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. article_categories
DROP TABLE IF EXISTS `article_categories`;
CREATE TABLE IF NOT EXISTS `article_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categorie_id` int(10) unsigned NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_categories_article_id_foreign` (`article_id`),
  KEY `article_categories_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `article_categories_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `article_categories_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.article_categories : ~6 rows (environ)
/*!40000 ALTER TABLE `article_categories` DISABLE KEYS */;
INSERT INTO `article_categories` (`id`, `categorie_id`, `article_id`, `created_at`, `updated_at`) VALUES
	(1, 4, 3, '2017-06-25 00:55:57', '2017-06-25 00:55:58'),
	(2, 3, 3, '2017-06-25 00:55:56', '2017-06-25 00:55:56'),
	(3, 1, 3, '2017-06-25 00:56:11', '2017-06-25 00:56:11'),
	(4, 2, 1, '2017-06-25 00:56:25', '2017-06-25 00:56:26'),
	(5, 5, 2, '2017-06-25 00:56:34', '2017-06-25 00:56:34'),
	(6, 1, 4, '2017-06-25 00:56:42', '2017-06-25 00:56:42');
/*!40000 ALTER TABLE `article_categories` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. artistes
DROP TABLE IF EXISTS `artistes`;
CREATE TABLE IF NOT EXISTS `artistes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.artistes : ~2 rows (environ)
/*!40000 ALTER TABLE `artistes` DISABLE KEYS */;
INSERT INTO `artistes` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Sweely', '2017-06-25 00:36:31', '2017-06-25 00:36:31'),
	(2, 'DJ Lettuce', '2017-06-25 00:36:47', '2017-06-25 00:36:47');
/*!40000 ALTER TABLE `artistes` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. categories
DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isLocale` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.categories : ~7 rows (environ)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `libelle`, `isLocale`, `created_at`, `updated_at`) VALUES
	(1, 'House', 0, '2017-06-25 00:37:01', '2017-06-25 00:37:01'),
	(2, 'Techno', 0, '2017-06-25 00:37:05', '2017-06-25 00:37:06'),
	(3, 'Lyon', 1, '2017-06-25 00:37:13', '2017-06-25 00:37:14'),
	(4, 'Evènement', 0, '2017-06-25 00:37:36', '2017-06-25 00:37:36'),
	(5, 'Gear', 0, '2017-06-25 00:37:43', '2017-06-25 00:37:43'),
	(6, 'Toulouse', 1, '2017-07-05 10:14:26', '2017-07-05 10:14:27'),
	(7, 'Paris', 1, '2017-07-05 10:14:42', '2017-07-05 10:14:42');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. categorie_users
DROP TABLE IF EXISTS `categorie_users`;
CREATE TABLE IF NOT EXISTS `categorie_users` (
  `user_id` int(10) unsigned NOT NULL,
  `categorie_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`categorie_id`),
  KEY `categorie_users_categorie_id_foreign` (`categorie_id`),
  CONSTRAINT `categorie_users_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `categorie_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.categorie_users : ~1 rows (environ)
/*!40000 ALTER TABLE `categorie_users` DISABLE KEYS */;
INSERT INTO `categorie_users` (`user_id`, `categorie_id`, `created_at`, `updated_at`) VALUES
	(2, 2, '2017-07-22 16:33:13', '2017-07-22 16:33:13');
/*!40000 ALTER TABLE `categorie_users` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. disques
DROP TABLE IF EXISTS `disques`;
CREATE TABLE IF NOT EXISTS `disques` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disque_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_id` int(10) unsigned NOT NULL,
  `image_url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disques_label_id_foreign` (`label_id`),
  CONSTRAINT `disques_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.disques : ~2 rows (environ)
/*!40000 ALTER TABLE `disques` DISABLE KEYS */;
INSERT INTO `disques` (`id`, `disque_title`, `label_id`, `image_url`, `created_at`, `updated_at`) VALUES
	(1, 'Calm Down Homie', 1, 'resources/img/disques/1/1.jpg', '2017-06-25 00:48:37', '2017-06-25 00:48:38'),
	(2, 'Chill David Hasselhoff', 1, 'resources/img/disques/2/2.jpg', '2017-06-25 00:48:55', '2017-06-25 00:48:55');
/*!40000 ALTER TABLE `disques` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. disque_titres
DROP TABLE IF EXISTS `disque_titres`;
CREATE TABLE IF NOT EXISTS `disque_titres` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `track_number` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disque_id` int(10) unsigned NOT NULL,
  `titre_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disque_titres_disque_id_foreign` (`disque_id`),
  KEY `disque_titres_titre_id_foreign` (`titre_id`),
  CONSTRAINT `disque_titres_disque_id_foreign` FOREIGN KEY (`disque_id`) REFERENCES `disques` (`id`),
  CONSTRAINT `disque_titres_titre_id_foreign` FOREIGN KEY (`titre_id`) REFERENCES `titres` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.disque_titres : ~8 rows (environ)
/*!40000 ALTER TABLE `disque_titres` DISABLE KEYS */;
INSERT INTO `disque_titres` (`id`, `track_number`, `disque_id`, `titre_id`, `created_at`, `updated_at`) VALUES
	(1, 'A1', 1, 5, '2017-06-25 00:49:50', '2017-06-25 00:49:51'),
	(2, 'A2', 1, 6, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(3, 'B1', 1, 7, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(4, 'B2', 1, 8, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(5, 'A1', 2, 1, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(6, 'A2', 2, 2, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(7, 'B1', 2, 3, '2017-06-25 00:50:21', '2017-06-25 00:50:22'),
	(8, 'B2', 2, 4, '2017-06-25 00:50:21', '2017-06-25 00:50:22');
/*!40000 ALTER TABLE `disque_titres` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. droits
DROP TABLE IF EXISTS `droits`;
CREATE TABLE IF NOT EXISTS `droits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.droits : ~4 rows (environ)
/*!40000 ALTER TABLE `droits` DISABLE KEYS */;
INSERT INTO `droits` (`id`, `libelle`, `code`, `created_at`, `updated_at`) VALUES
	(1, 'Création', 'CREATE', '2017-06-25 00:45:11', '2017-06-25 00:45:11'),
	(2, 'Suppression', 'DELETE', '2017-06-25 00:45:22', '2017-06-25 00:45:22'),
	(3, 'Consultation', 'READ', '2017-06-25 00:45:53', '2017-06-25 00:45:53'),
	(4, 'Modification', 'EDIT', '2017-06-25 00:46:06', '2017-06-25 00:46:06');
/*!40000 ALTER TABLE `droits` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. droits_roles
DROP TABLE IF EXISTS `droits_roles`;
CREATE TABLE IF NOT EXISTS `droits_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `droit_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `droits_roles_role_id_foreign` (`role_id`),
  KEY `droits_roles_droit_id_foreign` (`droit_id`),
  CONSTRAINT `droits_roles_droit_id_foreign` FOREIGN KEY (`droit_id`) REFERENCES `droits` (`id`),
  CONSTRAINT `droits_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.droits_roles : ~6 rows (environ)
/*!40000 ALTER TABLE `droits_roles` DISABLE KEYS */;
INSERT INTO `droits_roles` (`id`, `role_id`, `droit_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 3, '2017-06-25 00:46:32', '2017-06-25 00:46:32'),
	(2, 1, 1, '2017-06-25 00:46:32', '2017-06-25 00:46:32'),
	(3, 1, 4, '2017-06-25 00:46:32', '2017-06-25 00:46:32'),
	(4, 1, 2, '2017-06-25 00:46:32', '2017-06-25 00:46:32'),
	(5, 2, 3, '2017-06-25 00:46:32', '2017-06-25 00:46:32'),
	(6, 2, 1, '2017-06-25 00:46:32', '2017-06-25 00:46:32');
/*!40000 ALTER TABLE `droits_roles` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. labels
DROP TABLE IF EXISTS `labels`;
CREATE TABLE IF NOT EXISTS `labels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.labels : ~5 rows (environ)
/*!40000 ALTER TABLE `labels` DISABLE KEYS */;
INSERT INTO `labels` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Chineurs de House', '2017-06-25 00:38:03', '2017-06-25 00:38:03'),
	(2, 'Chineurs de Techno', '2017-06-25 00:38:15', '2017-06-25 00:38:16'),
	(3, 'Comic Sans', '2017-06-25 00:38:25', '2017-06-25 00:38:25'),
	(4, 'Nation House', '2017-06-25 00:38:32', '2017-06-25 00:38:32'),
	(5, 'Nation Techno', '2017-06-25 00:38:41', '2017-06-25 00:38:41');
/*!40000 ALTER TABLE `labels` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.migrations : ~17 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(54, '2014_06_24_161538_create_artistes_table', 1),
	(55, '2014_06_24_161559_create_categories_table', 1),
	(56, '2014_06_24_162205_create_droits_table', 1),
	(57, '2014_06_24_162239_create_roles_table', 1),
	(58, '2014_06_24_162341_create_section_types_table', 1),
	(59, '2014_06_24_162442_create_titres_table', 1),
	(60, '2014_06_24_164553_create_labels_table', 1),
	(61, '2014_10_12_000000_create_password_resets_table', 1),
	(62, '2014_10_12_000000_create_users_table', 1),
	(63, '2017_06_24_161522_create_article_categories_table', 1),
	(64, '2017_06_24_161618_create_disques_table', 1),
	(65, '2017_06_24_161638_create_disque_titres_table', 1),
	(66, '2017_06_24_162227_create_droits_roles_table', 1),
	(67, '2017_06_24_162249_create_sections_table', 1),
	(70, '2014_06_24_153140_create_articles_table', 2),
	(71, '2017_06_24_221404_create_titre_artistes_table', 3),
	(72, '2017_07_22_140914_create_categorie_users_table', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.password_resets : ~0 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.roles : ~4 rows (environ)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `libelle`, `code`, `created_at`, `updated_at`) VALUES
	(1, 'Administrateur', 'ADMIN', '2017-06-25 00:39:02', '2017-06-25 00:39:02'),
	(2, 'Rédacteur en chef', 'REDAC_CHEF', '2017-06-25 00:39:17', '2017-06-25 00:39:17'),
	(3, 'Chef de section', 'SECT_CHEF', '2017-06-25 00:39:29', '2017-06-25 00:39:29'),
	(4, 'Utilisateur', 'USER', '2017-06-25 00:39:43', '2017-06-25 00:39:43');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. sections
DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(10) unsigned NOT NULL,
  `typeSection_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_typesection_id_foreign` (`typeSection_id`),
  KEY `sections_article_id_foreign` (`article_id`),
  CONSTRAINT `sections_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  CONSTRAINT `sections_typesection_id_foreign` FOREIGN KEY (`typeSection_id`) REFERENCES `section_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.sections : ~8 rows (environ)
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` (`id`, `content`, `article_id`, `typeSection_id`, `created_at`, `updated_at`) VALUES
	(1, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 1, 1, '2017-07-05 11:46:29', '2017-07-05 11:46:30'),
	(2, 'resources/img/articles/1/1.png', 1, 2, '2017-07-05 11:48:19', '2017-07-05 11:48:20'),
	(3, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 2, 1, '2017-07-05 14:08:36', '2017-07-05 14:08:37'),
	(4, 'resources/img/articles/2/2.png', 2, 2, '2017-07-05 14:09:32', '2017-07-05 14:09:33'),
	(5, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 3, 1, '2017-07-05 14:13:13', '2017-07-05 14:13:14'),
	(6, 'resources/img/articles/3/3.png', 3, 2, '2017-07-05 14:13:41', '2017-07-05 14:13:42'),
	(7, 'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?', 4, 1, '2017-07-05 14:13:13', '2017-07-05 14:13:14'),
	(8, 'resources/img/articles/4/4.png', 4, 2, '2017-07-05 14:13:41', '2017-07-05 14:13:42');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. section_types
DROP TABLE IF EXISTS `section_types`;
CREATE TABLE IF NOT EXISTS `section_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.section_types : ~2 rows (environ)
/*!40000 ALTER TABLE `section_types` DISABLE KEYS */;
INSERT INTO `section_types` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
	(1, 'Texte', '2017-06-25 00:40:01', '2017-06-25 00:40:01'),
	(2, 'Image', '2017-06-25 00:40:05', '2017-06-25 00:40:06');
/*!40000 ALTER TABLE `section_types` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. titres
DROP TABLE IF EXISTS `titres`;
CREATE TABLE IF NOT EXISTS `titres` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `track_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.titres : ~8 rows (environ)
/*!40000 ALTER TABLE `titres` DISABLE KEYS */;
INSERT INTO `titres` (`id`, `track_title`, `created_at`, `updated_at`) VALUES
	(1, 'Dusty Space Jam', '2017-06-25 00:40:21', '2017-06-25 00:40:22'),
	(2, 'GREAS3CAKE', '2017-06-25 00:40:34', '2017-06-25 00:40:34'),
	(3, 'E45FIPI', '2017-06-25 00:40:46', '2017-06-25 00:40:46'),
	(4, 'Juicy Flips', '2017-06-25 00:40:56', '2017-06-25 00:40:56'),
	(5, 'Please Stay', '2017-06-25 00:41:11', '2017-06-25 00:41:12'),
	(6, 'I Gotta Keep On', '2017-06-25 00:41:29', '2017-06-25 00:41:30'),
	(7, 'Break Down', '2017-06-25 00:41:41', '2017-06-25 00:41:41'),
	(8, 'On The Run', '2017-06-25 00:41:53', '2017-06-25 00:41:53');
/*!40000 ALTER TABLE `titres` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. titre_artistes
DROP TABLE IF EXISTS `titre_artistes`;
CREATE TABLE IF NOT EXISTS `titre_artistes` (
  `titre_id` int(10) unsigned NOT NULL,
  `artiste_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`titre_id`,`artiste_id`),
  KEY `titre_artistes_artiste_id_foreign` (`artiste_id`),
  CONSTRAINT `titre_artistes_artiste_id_foreign` FOREIGN KEY (`artiste_id`) REFERENCES `artistes` (`id`),
  CONSTRAINT `titre_artistes_titre_id_foreign` FOREIGN KEY (`titre_id`) REFERENCES `titres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.titre_artistes : ~8 rows (environ)
/*!40000 ALTER TABLE `titre_artistes` DISABLE KEYS */;
INSERT INTO `titre_artistes` (`titre_id`, `artiste_id`, `created_at`, `updated_at`) VALUES
	(1, 2, '2017-06-25 00:43:39', '2017-06-25 00:43:39'),
	(2, 2, '2017-06-25 00:43:08', '2017-06-25 00:43:09'),
	(3, 2, '2017-06-25 00:43:12', '2017-06-25 00:43:13'),
	(4, 2, '2017-06-25 00:43:10', '2017-06-25 00:43:11'),
	(5, 1, '2017-06-25 00:44:19', '2017-06-25 00:44:22'),
	(6, 1, '2017-06-25 00:43:50', '2017-06-25 00:43:51'),
	(7, 1, '2017-06-25 00:44:13', '2017-06-25 00:44:13'),
	(8, 1, '2017-06-25 00:44:00', '2017-06-25 00:44:00');
/*!40000 ALTER TABLE `titre_artistes` ENABLE KEYS */;

-- Export de la structure de la table lachinerie. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Export de données de la table lachinerie.users : ~2 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `firstname`, `email`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'xNWiaYgWzd', 'MVkWprxm5i', 'Sg8W9wjIOs@gmail.com', '123456', 3, NULL, NULL, NULL),
	(2, '4R2uKW8vG6', 'uARS9eR8jd', 'sCJLzW1JGv@gmail.com', '$2y$10$YEQzroU91wXh.PwxjgonjuyqgYDwF3H4XbmNBwP0EP8.rEuloFZ8W', 4, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
