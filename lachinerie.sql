-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Sam 24 Juin 2017 à 22:59
-- Version du serveur :  5.7.14
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lachinerie`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'CHOC : Ben Klock n\'a jamais su mixer !', '2017-06-24 22:53:56', '2017-06-24 22:53:57'),
(2, 'Quelle platine pour mon pitichat ?', '2017-06-24 22:54:16', '2017-06-24 22:54:16'),
(3, 'Kerry Chandler de retour à Lyon !', '2017-06-24 22:54:49', '2017-06-24 22:54:49'),
(4, 'Grosse sortie sur Yoyaku', '2017-06-24 22:55:14', '2017-06-24 22:55:14');

-- --------------------------------------------------------

--
-- Structure de la table `article_categories`
--

CREATE TABLE `article_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `categorie_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `article_categories`
--

INSERT INTO `article_categories` (`id`, `categorie_id`, `article_id`, `created_at`, `updated_at`) VALUES
(1, 4, 3, '2017-06-24 22:55:57', '2017-06-24 22:55:58'),
(2, 3, 3, '2017-06-24 22:55:56', '2017-06-24 22:55:56'),
(3, 1, 3, '2017-06-24 22:56:11', '2017-06-24 22:56:11'),
(4, 2, 1, '2017-06-24 22:56:25', '2017-06-24 22:56:26'),
(5, 5, 2, '2017-06-24 22:56:34', '2017-06-24 22:56:34'),
(6, 1, 4, '2017-06-24 22:56:42', '2017-06-24 22:56:42');

-- --------------------------------------------------------

--
-- Structure de la table `artistes`
--

CREATE TABLE `artistes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `artistes`
--

INSERT INTO `artistes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sweely', '2017-06-24 22:36:31', '2017-06-24 22:36:31'),
(2, 'DJ Lettuce', '2017-06-24 22:36:47', '2017-06-24 22:36:47');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'House', '2017-06-24 22:37:01', '2017-06-24 22:37:01'),
(2, 'Techno', '2017-06-24 22:37:05', '2017-06-24 22:37:06'),
(3, 'Lyon', '2017-06-24 22:37:13', '2017-06-24 22:37:14'),
(4, 'Evènement', '2017-06-24 22:37:36', '2017-06-24 22:37:36'),
(5, 'Gear', '2017-06-24 22:37:43', '2017-06-24 22:37:43');

-- --------------------------------------------------------

--
-- Structure de la table `disques`
--

CREATE TABLE `disques` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `disques`
--

INSERT INTO `disques` (`id`, `title`, `label_id`, `created_at`, `updated_at`) VALUES
(1, 'Calm Down Homie', 1, '2017-06-24 22:48:37', '2017-06-24 22:48:38'),
(2, 'Chill David Hasselhoff', 1, '2017-06-24 22:48:55', '2017-06-24 22:48:55');

-- --------------------------------------------------------

--
-- Structure de la table `disque_titres`
--

CREATE TABLE `disque_titres` (
  `id` int(10) UNSIGNED NOT NULL,
  `track_number` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disque_id` int(10) UNSIGNED NOT NULL,
  `titre_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `disque_titres`
--

INSERT INTO `disque_titres` (`id`, `track_number`, `disque_id`, `titre_id`, `created_at`, `updated_at`) VALUES
(1, 'A1', 1, 5, '2017-06-24 22:49:50', '2017-06-24 22:49:51'),
(2, 'A2', 1, 6, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(3, 'B1', 1, 7, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(4, 'B2', 1, 8, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(5, 'A1', 2, 1, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(6, 'A2', 2, 2, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(7, 'B1', 2, 3, '2017-06-24 22:50:21', '2017-06-24 22:50:22'),
(8, 'B2', 2, 4, '2017-06-24 22:50:21', '2017-06-24 22:50:22');

-- --------------------------------------------------------

--
-- Structure de la table `droits`
--

CREATE TABLE `droits` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `droits`
--

INSERT INTO `droits` (`id`, `libelle`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Création', 'CREATE', '2017-06-24 22:45:11', '2017-06-24 22:45:11'),
(2, 'Suppression', 'DELETE', '2017-06-24 22:45:22', '2017-06-24 22:45:22'),
(3, 'Consultation', 'READ', '2017-06-24 22:45:53', '2017-06-24 22:45:53'),
(4, 'Modification', 'EDIT', '2017-06-24 22:46:06', '2017-06-24 22:46:06');

-- --------------------------------------------------------

--
-- Structure de la table `droits_roles`
--

CREATE TABLE `droits_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `droit_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `droits_roles`
--

INSERT INTO `droits_roles` (`id`, `role_id`, `droit_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2017-06-24 22:46:32', '2017-06-24 22:46:32'),
(2, 1, 1, '2017-06-24 22:46:32', '2017-06-24 22:46:32'),
(3, 1, 4, '2017-06-24 22:46:32', '2017-06-24 22:46:32'),
(4, 1, 2, '2017-06-24 22:46:32', '2017-06-24 22:46:32'),
(5, 2, 3, '2017-06-24 22:46:32', '2017-06-24 22:46:32'),
(6, 2, 1, '2017-06-24 22:46:32', '2017-06-24 22:46:32');

-- --------------------------------------------------------

--
-- Structure de la table `labels`
--

CREATE TABLE `labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `labels`
--

INSERT INTO `labels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Chineurs de House', '2017-06-24 22:38:03', '2017-06-24 22:38:03'),
(2, 'Chineurs de Techno', '2017-06-24 22:38:15', '2017-06-24 22:38:16'),
(3, 'Comic Sans', '2017-06-24 22:38:25', '2017-06-24 22:38:25'),
(4, 'Nation House', '2017-06-24 22:38:32', '2017-06-24 22:38:32'),
(5, 'Nation Techno', '2017-06-24 22:38:41', '2017-06-24 22:38:41');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(53, '2014_06_24_153140_create_articles_table', 1),
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
(68, '2017_06_24_221404_create_titre_artistes_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`id`, `libelle`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Administrateur', 'ADMIN', '2017-06-24 22:39:02', '2017-06-24 22:39:02'),
(2, 'Rédacteur en chef', 'REDAC_CHEF', '2017-06-24 22:39:17', '2017-06-24 22:39:17'),
(3, 'Chef de section', 'SECT_CHEF', '2017-06-24 22:39:29', '2017-06-24 22:39:29'),
(4, 'Utilisateur', 'USER', '2017-06-24 22:39:43', '2017-06-24 22:39:43');

-- --------------------------------------------------------

--
-- Structure de la table `sections`
--

CREATE TABLE `sections` (
  `id` int(10) UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `typeSection_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `section_types`
--

CREATE TABLE `section_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `libelle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `section_types`
--

INSERT INTO `section_types` (`id`, `libelle`, `created_at`, `updated_at`) VALUES
(1, 'Texte', '2017-06-24 22:40:01', '2017-06-24 22:40:01'),
(2, 'Image', '2017-06-24 22:40:05', '2017-06-24 22:40:06');

-- --------------------------------------------------------

--
-- Structure de la table `titres`
--

CREATE TABLE `titres` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `titres`
--

INSERT INTO `titres` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dusty Space Jam	', '2017-06-24 22:40:21', '2017-06-24 22:40:22'),
(2, '	GREAS3CAKE', '2017-06-24 22:40:34', '2017-06-24 22:40:34'),
(3, 'E45FIPI', '2017-06-24 22:40:46', '2017-06-24 22:40:46'),
(4, '	Juicy Flips', '2017-06-24 22:40:56', '2017-06-24 22:40:56'),
(5, 'Please Stay	', '2017-06-24 22:41:11', '2017-06-24 22:41:12'),
(6, '	I Gotta Keep On', '2017-06-24 22:41:29', '2017-06-24 22:41:30'),
(7, 'Break Down', '2017-06-24 22:41:41', '2017-06-24 22:41:41'),
(8, '	On The Run', '2017-06-24 22:41:53', '2017-06-24 22:41:53');

-- --------------------------------------------------------

--
-- Structure de la table `titre_artistes`
--

CREATE TABLE `titre_artistes` (
  `id` int(10) UNSIGNED NOT NULL,
  `titre_id` int(10) UNSIGNED NOT NULL,
  `artiste_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `titre_artistes`
--

INSERT INTO `titre_artistes` (`id`, `titre_id`, `artiste_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2017-06-24 22:43:08', '2017-06-24 22:43:09'),
(2, 4, 2, '2017-06-24 22:43:10', '2017-06-24 22:43:11'),
(3, 3, 2, '2017-06-24 22:43:12', '2017-06-24 22:43:13'),
(4, 1, 2, '2017-06-24 22:43:39', '2017-06-24 22:43:39'),
(5, 6, 1, '2017-06-24 22:43:50', '2017-06-24 22:43:51'),
(6, 8, 1, '2017-06-24 22:44:00', '2017-06-24 22:44:00'),
(7, 7, 1, '2017-06-24 22:44:13', '2017-06-24 22:44:13'),
(8, 5, 1, '2017-06-24 22:44:19', '2017-06-24 22:44:22');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `article_categories`
--
ALTER TABLE `article_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_categories_article_id_foreign` (`article_id`),
  ADD KEY `article_categories_categorie_id_foreign` (`categorie_id`);

--
-- Index pour la table `artistes`
--
ALTER TABLE `artistes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `disques`
--
ALTER TABLE `disques`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disques_label_id_foreign` (`label_id`);

--
-- Index pour la table `disque_titres`
--
ALTER TABLE `disque_titres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disque_titres_disque_id_foreign` (`disque_id`),
  ADD KEY `disque_titres_titre_id_foreign` (`titre_id`);

--
-- Index pour la table `droits`
--
ALTER TABLE `droits`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `droits_roles`
--
ALTER TABLE `droits_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `droits_roles_role_id_foreign` (`role_id`),
  ADD KEY `droits_roles_droit_id_foreign` (`droit_id`);

--
-- Index pour la table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_typesection_id_foreign` (`typeSection_id`),
  ADD KEY `sections_article_id_foreign` (`article_id`);

--
-- Index pour la table `section_types`
--
ALTER TABLE `section_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titres`
--
ALTER TABLE `titres`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `titre_artistes`
--
ALTER TABLE `titre_artistes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `titre_artistes_titre_id_foreign` (`titre_id`),
  ADD KEY `titre_artistes_artiste_id_foreign` (`artiste_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `article_categories`
--
ALTER TABLE `article_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `artistes`
--
ALTER TABLE `artistes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `disques`
--
ALTER TABLE `disques`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `disque_titres`
--
ALTER TABLE `disque_titres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `droits`
--
ALTER TABLE `droits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `droits_roles`
--
ALTER TABLE `droits_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `section_types`
--
ALTER TABLE `section_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `titres`
--
ALTER TABLE `titres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `titre_artistes`
--
ALTER TABLE `titre_artistes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article_categories`
--
ALTER TABLE `article_categories`
  ADD CONSTRAINT `article_categories_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `article_categories_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `disques`
--
ALTER TABLE `disques`
  ADD CONSTRAINT `disques_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`);

--
-- Contraintes pour la table `disque_titres`
--
ALTER TABLE `disque_titres`
  ADD CONSTRAINT `disque_titres_disque_id_foreign` FOREIGN KEY (`disque_id`) REFERENCES `disques` (`id`),
  ADD CONSTRAINT `disque_titres_titre_id_foreign` FOREIGN KEY (`titre_id`) REFERENCES `titres` (`id`);

--
-- Contraintes pour la table `droits_roles`
--
ALTER TABLE `droits_roles`
  ADD CONSTRAINT `droits_roles_droit_id_foreign` FOREIGN KEY (`droit_id`) REFERENCES `droits` (`id`),
  ADD CONSTRAINT `droits_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `sections_typesection_id_foreign` FOREIGN KEY (`typeSection_id`) REFERENCES `section_types` (`id`);

--
-- Contraintes pour la table `titre_artistes`
--
ALTER TABLE `titre_artistes`
  ADD CONSTRAINT `titre_artistes_artiste_id_foreign` FOREIGN KEY (`artiste_id`) REFERENCES `artistes` (`id`),
  ADD CONSTRAINT `titre_artistes_titre_id_foreign` FOREIGN KEY (`titre_id`) REFERENCES `titres` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
