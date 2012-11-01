-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Jeu 01 Novembre 2012 à 10:46
-- Version du serveur: 5.1.44
-- Version de PHP: 5.2.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `webTV`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE IF NOT EXISTS `action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `action`
--

INSERT INTO `action` VALUES(1, 'message_write', NULL, NULL);
INSERT INTO `action` VALUES(2, 'message_receive', NULL, NULL);
INSERT INTO `action` VALUES(3, 'user_create', NULL, NULL);
INSERT INTO `action` VALUES(4, 'user_update', NULL, NULL);
INSERT INTO `action` VALUES(5, 'user_remove', NULL, NULL);
INSERT INTO `action` VALUES(6, 'user_admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `episode`
--

CREATE TABLE IF NOT EXISTS `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `video` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `program_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_episode_program` (`program_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `episode`
--


-- --------------------------------------------------------

--
-- Structure de la table `friendship`
--

CREATE TABLE IF NOT EXISTS `friendship` (
  `inviter_id` int(11) NOT NULL,
  `friend_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `acknowledgetime` int(11) DEFAULT NULL,
  `requesttime` int(11) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL,
  `message` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`inviter_id`,`friend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `friendship`
--


-- --------------------------------------------------------

--
-- Structure de la table `lookup`
--

CREATE TABLE IF NOT EXISTS `lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Contenu de la table `lookup`
--

INSERT INTO `lookup` VALUES(1, 'Project', 1, 'ProgramStatus', 1);
INSERT INTO `lookup` VALUES(2, 'Online', 2, 'ProgramStatus', 2);
INSERT INTO `lookup` VALUES(3, 'Archived', 3, 'ProgramStatus', 3);
INSERT INTO `lookup` VALUES(4, 'Project', 1, 'EpisodeStatus', 1);
INSERT INTO `lookup` VALUES(5, 'Online', 2, 'EpisodeStatus', 2);
INSERT INTO `lookup` VALUES(6, 'New', 1, 'ScheduleStatus', 1);
INSERT INTO `lookup` VALUES(7, 'Rebroadcast', 2, 'ScheduleStatus', 2);

-- --------------------------------------------------------

--
-- Structure de la table `membership`
--

CREATE TABLE IF NOT EXISTS `membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `end_date` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `membership`
--


-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `message_read` tinyint(1) NOT NULL,
  `answered` tinyint(1) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `message`
--


-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `payment`
--

INSERT INTO `payment` VALUES(1, 'Prepayment', NULL);
INSERT INTO `payment` VALUES(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `permission`
--

CREATE TABLE IF NOT EXISTS `permission` (
  `principal_id` int(11) NOT NULL,
  `subordinate_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('user','role') NOT NULL,
  `action` int(11) NOT NULL,
  `template` tinyint(1) NOT NULL,
  `comment` text,
  PRIMARY KEY (`principal_id`,`subordinate_id`,`type`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `permission`
--

INSERT INTO `permission` VALUES(1, 0, 'role', 4, 0, '');
INSERT INTO `permission` VALUES(1, 0, 'role', 5, 0, '');
INSERT INTO `permission` VALUES(1, 0, 'role', 6, 0, '');
INSERT INTO `permission` VALUES(1, 0, 'role', 7, 0, '');
INSERT INTO `permission` VALUES(2, 0, 'role', 1, 0, 'Users can write messages');
INSERT INTO `permission` VALUES(2, 0, 'role', 2, 0, 'Users can receive messages');
INSERT INTO `permission` VALUES(2, 0, 'role', 3, 0, 'Users are able to view visits of his profile');

-- --------------------------------------------------------

--
-- Structure de la table `privacysetting`
--

CREATE TABLE IF NOT EXISTS `privacysetting` (
  `user_id` int(10) unsigned NOT NULL,
  `message_new_friendship` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_message` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_profilecomment` tinyint(1) NOT NULL DEFAULT '1',
  `appear_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_online_status` tinyint(1) NOT NULL DEFAULT '1',
  `log_profile_visits` tinyint(1) NOT NULL DEFAULT '1',
  `ignore_users` varchar(255) DEFAULT NULL,
  `public_profile_fields` bigint(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `privacysetting`
--

INSERT INTO `privacysetting` VALUES(1, 1, 1, 1, 1, 1, 1, '', NULL);
INSERT INTO `privacysetting` VALUES(2, 1, 1, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `privacysetting` VALUES(6, 1, 1, 1, 1, 1, 1, '', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `privacy` enum('protected','private','public') NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `show_friends` tinyint(1) DEFAULT '1',
  `allow_comments` tinyint(1) DEFAULT '1',
  `email` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `about` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` VALUES(1, 1, '2012-10-22 19:31:06', 'protected', 'admin', 'admin', 1, 1, 'webmaster@example.com', NULL, NULL, NULL);
INSERT INTO `profile` VALUES(2, 2, '2012-10-22 19:31:06', 'protected', 'demo', 'demo', 1, 1, 'demo@example.com', NULL, NULL, NULL);
INSERT INTO `profile` VALUES(8, 6, '0000-00-00 00:00:00', 'protected', 'test001', 'test001', 1, 1, 'test001@test001.com', 'rue des peoeiep', 'blou', '');

-- --------------------------------------------------------

--
-- Structure de la table `profile_comment`
--

CREATE TABLE IF NOT EXISTS `profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `profile_comment`
--


-- --------------------------------------------------------

--
-- Structure de la table `profile_field`
--

CREATE TABLE IF NOT EXISTS `profile_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hint` text NOT NULL,
  `field_type` varchar(50) NOT NULL DEFAULT '',
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(255) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `related_field_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `profile_field`
--

INSERT INTO `profile_field` VALUES(1, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 1, '', '', '', 'CEmailValidator', '', 0, 3, '');
INSERT INTO `profile_field` VALUES(2, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, '');
INSERT INTO `profile_field` VALUES(3, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, '');
INSERT INTO `profile_field` VALUES(4, 'street', 'Street', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, '');
INSERT INTO `profile_field` VALUES(5, 'city', 'City', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, '');
INSERT INTO `profile_field` VALUES(6, 'about', 'About', '', 'TEXT', 255, 0, 0, '', '', '', '', '', 0, 3, '');

-- --------------------------------------------------------

--
-- Structure de la table `profile_visit`
--

CREATE TABLE IF NOT EXISTS `profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `profile_visit`
--


-- --------------------------------------------------------

--
-- Structure de la table `program`
--

CREATE TABLE IF NOT EXISTS `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_program_author` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `program`
--

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_membership_possible` tinyint(1) NOT NULL DEFAULT '0',
  `price` double DEFAULT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) DEFAULT NULL COMMENT 'How long a membership is valid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` VALUES(1, 'UserManager', 'This users can manage Users', 0, 0, 0);
INSERT INTO `role` VALUES(2, 'Demo', 'Users having the demo role', 0, 0, 0);
INSERT INTO `role` VALUES(3, 'Business', 'Example Business account', 0, 9.99, 7);
INSERT INTO `role` VALUES(4, 'Premium', 'Example Premium account', 0, 19.99, 28);

-- --------------------------------------------------------

--
-- Structure de la table `schedule`
--

CREATE TABLE IF NOT EXISTS `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_id` int(11) NOT NULL,
  `broadcast_time` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_schedule_episode` (`episode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contenu de la table `schedule`
--


-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Contenu de la table `tag`
--

INSERT INTO `tag` VALUES(1, 'humour', 2);
INSERT INTO `tag` VALUES(2, 'image', 1);
INSERT INTO `tag` VALUES(3, 'genial', 1);
INSERT INTO `tag` VALUES(4, 'test', 8);
INSERT INTO `tag` VALUES(5, 'blop', 1);
INSERT INTO `tag` VALUES(6, 'test test', 1);

-- --------------------------------------------------------

--
-- Structure de la table `translation`
--

CREATE TABLE IF NOT EXISTS `translation` (
  `message` varbinary(255) NOT NULL,
  `translation` varchar(255) NOT NULL,
  `language` varchar(5) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`message`,`language`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `translation`
--

INSERT INTO `translation` VALUES('About', 'Über', 'de', 'yum');
INSERT INTO `translation` VALUES('About', 'Acerca', 'es', 'yum');
INSERT INTO `translation` VALUES('About', 'à propos', 'fr', 'yum');
INSERT INTO `translation` VALUES('About', 'Info', 'it', 'yum');
INSERT INTO `translation` VALUES('About', 'Info', 'pl', 'yum');
INSERT INTO `translation` VALUES('Access control', 'Zugangskontrolle', 'de', 'yum');
INSERT INTO `translation` VALUES('Access control', 'Controle d acces', 'fr', 'yum');
INSERT INTO `translation` VALUES('Access control', 'Controllo accesso', 'it', 'yum');
INSERT INTO `translation` VALUES('Action', 'Aktion', 'de', 'yum');
INSERT INTO `translation` VALUES('Action', 'Acción', 'es', 'yum');
INSERT INTO `translation` VALUES('Action', 'Action', 'fr', 'yum');
INSERT INTO `translation` VALUES('Action', 'Azione', 'it', 'yum');
INSERT INTO `translation` VALUES('Actions', 'Aktionen', 'de', 'yum');
INSERT INTO `translation` VALUES('Actions', 'Acciones', 'es', 'yum');
INSERT INTO `translation` VALUES('Actions', 'Actions', 'fr', 'yum');
INSERT INTO `translation` VALUES('Actions', 'Azioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Activated', 'erstmalig Aktiviert', 'de', 'yum');
INSERT INTO `translation` VALUES('Activated', 'Première activation de votre compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Activated', 'Attivato', 'it', 'yum');
INSERT INTO `translation` VALUES('Active', 'Aktiv', 'de', 'yum');
INSERT INTO `translation` VALUES('Active', 'Activo', 'es', 'yum');
INSERT INTO `translation` VALUES('Active', 'Actif', 'fr', 'yum');
INSERT INTO `translation` VALUES('Active', 'Attiv', 'it', 'yum');
INSERT INTO `translation` VALUES('Active', 'Aktiv', 'pl', 'yum');
INSERT INTO `translation` VALUES('Active', 'ÐÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½', 'ru', 'yum');
INSERT INTO `translation` VALUES('Active - First visit', 'Aktiv - erster Besuch', 'de', 'yum');
INSERT INTO `translation` VALUES('Active - First visit', 'Actif - première visite', 'fr', 'yum');
INSERT INTO `translation` VALUES('Active - First visit', 'Attivo - Priva visita', 'it', 'yum');
INSERT INTO `translation` VALUES('Active users', 'Aktive Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Active users', 'Usuarios activos', 'es', 'yum');
INSERT INTO `translation` VALUES('Active users', 'Utiliateurs actifs', 'fr', 'yum');
INSERT INTO `translation` VALUES('Active users', 'Utenti attivi', 'it', 'yum');
INSERT INTO `translation` VALUES('Active users', 'Aktywni uÅ¼ytkownicy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Activities', 'Aktivitäten', 'de', 'yum');
INSERT INTO `translation` VALUES('Activities', 'Actividades', 'es', 'yum');
INSERT INTO `translation` VALUES('Activities', 'Activités', 'fr', 'yum');
INSERT INTO `translation` VALUES('Activities', 'AttivitÃ ', 'it', 'yum');
INSERT INTO `translation` VALUES('Add as a friend', 'Zur Kontaktliste hinzufügen', 'de', 'yum');
INSERT INTO `translation` VALUES('Add as a friend', 'Agregar como amigo', 'es', 'yum');
INSERT INTO `translation` VALUES('Add as a friend', 'Ajouter à ma liste de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Add as a friend', 'Aggiungi un contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('Admin inbox', 'Administratorposteingang', 'de', 'yum');
INSERT INTO `translation` VALUES('Admin inbox', 'Bandeja de entrada de Admin', 'es', 'yum');
INSERT INTO `translation` VALUES('Admin inbox', 'Boite e-mail de l administrateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Admin inbox', 'Admin - Posta in arrivo', 'it', 'yum');
INSERT INTO `translation` VALUES('Admin inbox', 'ZarzÄ…dzaj skrzynkÄ… odbiorczÄ…', 'pl', 'yum');
INSERT INTO `translation` VALUES('Admin sent messages', 'Gesendete Nachrichten des Administrators', 'de', 'yum');
INSERT INTO `translation` VALUES('Admin sent messages', 'Mensajes enviados de Admin', 'es', 'yum');
INSERT INTO `translation` VALUES('Admin sent messages', 'Mail envoyés par l''administrateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Admin sent messages', 'Admin - Messaggi inviati', 'it', 'yum');
INSERT INTO `translation` VALUES('Admin sent messages', 'WiadomoÅ›ci wysÅ‚ane przez administratora', 'pl', 'yum');
INSERT INTO `translation` VALUES('Admin users', 'Administratoren', 'de', 'yum');
INSERT INTO `translation` VALUES('Admin users', 'Usuarios administradores', 'es', 'yum');
INSERT INTO `translation` VALUES('Admin users', 'Administrateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Admin users', 'Utenti admin', 'it', 'yum');
INSERT INTO `translation` VALUES('Admin users', 'Administratorzy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Admin users can not be deleted!', 'Administratoren können nicht gelöscht werden', 'de', 'yum');
INSERT INTO `translation` VALUES('Admin users can not be deleted!', '¡No se pueden eliminar los usuarios Administradores!', 'es', 'yum');
INSERT INTO `translation` VALUES('Admin users can not be deleted!', 'Un compte administrateur ne peut pas être supprimé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Admin users can not be deleted!', 'Utente admin non cancellabile!', 'it', 'yum');
INSERT INTO `translation` VALUES('Admin users can not be deleted!', 'Nie moÅ¼na usunÄ…Ä‡ konta administratora', 'pl', 'yum');
INSERT INTO `translation` VALUES('All', 'Alle', 'de', 'yum');
INSERT INTO `translation` VALUES('All', 'Tous', 'fr', 'yum');
INSERT INTO `translation` VALUES('All', 'Tutto', 'it', 'yum');
INSERT INTO `translation` VALUES('Allow profile comments', 'Profilkommentare erlauben', 'de', 'yum');
INSERT INTO `translation` VALUES('Allow profile comments', 'Permitir comentarios en perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Allow profile comments', 'Autoriser les commentaires de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Allow profile comments', 'Consenti commenti profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Allowed are lowercase letters and digits.', 'Erlaubt sind Kleinbuchstaben und Ziffern.', 'de', 'yum');
INSERT INTO `translation` VALUES('Allowed are lowercase letters and digits.', 'Se permiten letras minúsculas y dígitos', 'es', 'yum');
INSERT INTO `translation` VALUES('Allowed are lowercase letters and digits.', 'Seules les minuscule et les chiffres sont autorisés.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Allowed are lowercase letters and digits.', 'Sono consentiti lettere minuscole e numeri.', 'it', 'yum');
INSERT INTO `translation` VALUES('Allowed are lowercase letters and digits.', 'Erlaubt sind Kleinbuchstaben und Ziffern.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Allowed lowercase letters and digits.', 'Consenti lettere minuscole e numeri.', 'it', 'yum');
INSERT INTO `translation` VALUES('Allowed lowercase letters and digits.', 'Ð”Ð¾Ð¿ÑƒÑÐºÐ°ÑŽÑ‚ÑÑ ÑÑ‚Ñ€Ð¾Ñ‡Ð½Ñ‹Ðµ Ð±ÑƒÐºÐ²Ñ‹ Ð¸ Ñ†Ð¸Ñ„Ñ€Ñ‹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Allowed roles', 'Erlaubte Rollen', 'de', 'yum');
INSERT INTO `translation` VALUES('Allowed roles', 'Roles permitidos', 'es', 'yum');
INSERT INTO `translation` VALUES('Allowed roles', 'Permission rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Allowed roles', 'Ruoli autorizzati', 'it', 'yum');
INSERT INTO `translation` VALUES('Allowed roles', 'DostÄ™pne role', 'pl', 'yum');
INSERT INTO `translation` VALUES('Allowed users', 'Erlaubte Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Allowed users', 'Usuarios permitidos', 'es', 'yum');
INSERT INTO `translation` VALUES('Allowed users', 'Permission utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Allowed users', 'Utenti autorizzati', 'it', 'yum');
INSERT INTO `translation` VALUES('Allowed users', 'DostÄ™pni uÅ¼ytkownicy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'Existiert bereits.', 'de', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'Ya existe.', 'es', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'Existe déjà .', 'fr', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'GiÃ  esistente', 'it', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'Existiert bereits.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Already exists.', 'Ð£Ð¶Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚.', 'ru', 'yum');
INSERT INTO `translation` VALUES('An error occured while saving your changes', 'Es ist ein Fehler aufgetreten.', 'de', 'yum');
INSERT INTO `translation` VALUES('An error occured while saving your changes', 'Ocurrió un error al guardar los cambios', 'es', 'yum');
INSERT INTO `translation` VALUES('An error occured while saving your changes', 'Une erreur est survenue.', 'fr', 'yum');
INSERT INTO `translation` VALUES('An error occured while saving your changes', 'Si Ã¨ verificato un errore durante il salvataggio delle modifiche.', 'it', 'yum');
INSERT INTO `translation` VALUES('An error occured while saving your changes', 'WystÄ…piÅ‚ bÅ‚Ä…d podczas zapisywania Twoich zmian.', 'pl', 'yum');
INSERT INTO `translation` VALUES('An error occured while uploading your avatar image', 'Ein Fehler ist beim hochladen ihres Profilbildes aufgetreten', 'de', 'yum');
INSERT INTO `translation` VALUES('An error occured while uploading your avatar image', 'Une erreur est survenue lors du chargement de votre photo de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('An error occured while uploading your avatar image', 'Si Ã¨ verificato un errore durante il caricamento dell''immagine', 'it', 'yum');
INSERT INTO `translation` VALUES('Answer', 'Antworten', 'de', 'yum');
INSERT INTO `translation` VALUES('Appear in search', 'In der Suche erscheinen', 'de', 'yum');
INSERT INTO `translation` VALUES('Appear in search', 'Je souhaite apparaitre dans les résultats de recherche', 'fr', 'yum');
INSERT INTO `translation` VALUES('Appear in search', 'Mostra nelle ricerche', 'it', 'yum');
INSERT INTO `translation` VALUES('Are you really sure you want to delete your Account?', 'Sind Sie Sicher, dass Sie Ihren Zugang löschen wollen?', 'de', 'yum');
INSERT INTO `translation` VALUES('Are you really sure you want to delete your Account?', '¿Seguro que desea eliminar su cuenta?', 'es', 'yum');
INSERT INTO `translation` VALUES('Are you really sure you want to delete your Account?', 'Etes vous sur de vouloir supprimer votre compte?', 'fr', 'yum');
INSERT INTO `translation` VALUES('Are you really sure you want to delete your Account?', 'Sicuro di voler cancellare il tuo account?', 'it', 'yum');
INSERT INTO `translation` VALUES('Are you really sure you want to delete your Account?', 'Czy jesteÅ› pewien, Å¼e chcesz usunÄ…Ä‡ konto?', 'pl', 'yum');
INSERT INTO `translation` VALUES('Are you sure to delete this item?', 'Sind Sie sicher, dass Sie dieses Element wirklich löschen wollen? ', 'de', 'yum');
INSERT INTO `translation` VALUES('Are you sure to delete this item?', '¿Seguro desea eliminar este elemento?', 'es', 'yum');
INSERT INTO `translation` VALUES('Are you sure to delete this item?', 'Etes vous sur de supprimé cet elément? ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Are you sure to delete this item?', 'Sicuro di cancellare questo elemento?', 'it', 'yum');
INSERT INTO `translation` VALUES('Are you sure to delete this item?', 'Ð’Ñ‹ Ð´ÐµÐ¹ÑÑ‚Ð²Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾ Ñ…Ð¾Ñ‚Ð¸Ñ‚Ðµ ÑƒÐ´Ð°Ð»Ð¸Ñ‚ÑŒ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ?', 'ru', 'yum');
INSERT INTO `translation` VALUES('Are you sure to remove this comment from your profile?', 'Sind Sie sicher, dass sie diesen Kommentar entfernen wollen?', 'de', 'yum');
INSERT INTO `translation` VALUES('Are you sure to remove this comment from your profile?', '¿Estás seguro que deseas borrar este comentario?', 'es', 'yum');
INSERT INTO `translation` VALUES('Are you sure to remove this comment from your profile?', 'Etes vous sur de vouloir supprimer ce commentaire?', 'fr', 'yum');
INSERT INTO `translation` VALUES('Are you sure to remove this comment from your profile?', 'Sicuro di voler eliminare il commento dal tuo profilo?', 'it', 'yum');
INSERT INTO `translation` VALUES('Are you sure you want to remove this friend?', 'Sind Sie sicher, dass Sie diesen Kontakt aus ihrer Liste entfernen wollen?', 'de', 'yum');
INSERT INTO `translation` VALUES('Are you sure you want to remove this friend?', 'àŠtes vous sur de vouloir suprimer ce membre de votre liste de contact?', 'fr', 'yum');
INSERT INTO `translation` VALUES('Are you sure you want to remove this friend?', 'Sicuro di voler rimuovere questo contatto?', 'it', 'yum');
INSERT INTO `translation` VALUES('Assign this role to new users automatically', 'Rolle automatisch an neue Benutzer zuweisen', 'de', 'yum');
INSERT INTO `translation` VALUES('Assign this role to new users automatically', 'Rôle automatique pour un nouveau membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Assign this role to new users automatically', 'Assegna questo ruolo automaticamente ai nuovi utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Avatar image', 'Profilbild', 'de', 'yum');
INSERT INTO `translation` VALUES('Avatar image', 'Tu Avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('Avatar image', 'Image de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Avatar image', 'Avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Back', 'Zurück', 'de', 'yum');
INSERT INTO `translation` VALUES('Back', 'Volver', 'es', 'yum');
INSERT INTO `translation` VALUES('Back', 'Retour', 'fr', 'yum');
INSERT INTO `translation` VALUES('Back', 'Indietro', 'it', 'yum');
INSERT INTO `translation` VALUES('Back to inbox', 'Zurück zum Posteingang', 'de', 'yum');
INSERT INTO `translation` VALUES('Back to inbox', 'Volver a la bandeja de entrada', 'es', 'yum');
INSERT INTO `translation` VALUES('Back to inbox', 'Retour à  la boite mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('Back to inbox', 'Torna alla posta in arrivo', 'it', 'yum');
INSERT INTO `translation` VALUES('Back to my Profile', 'Zurück zu meinem Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('Back to my Profile', 'Volver a mi Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Back to my Profile', 'Retour à  mon profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Back to my Profile', 'Torna al mio profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Back to profile', 'Zurück zum Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('Back to profile', 'Volver a perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Back to profile', 'Retour au profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Back to profile', 'Torna al mio profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Back to profile', 'ZurÃ¼ck zum Profil', 'pl', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Verbannt', 'de', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Excluido', 'es', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Membre banni', 'fr', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Bannato', 'it', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Verbannt', 'pl', 'yum');
INSERT INTO `translation` VALUES('Banned', 'Ð—Ð°Ð±Ð»Ð¾ÐºÐ¸Ñ€Ð¾Ð²Ð°Ð½', 'ru', 'yum');
INSERT INTO `translation` VALUES('Banned users', 'Gesperrte Benuter', 'de', 'yum');
INSERT INTO `translation` VALUES('Banned users', 'Usuarios excluidos', 'es', 'yum');
INSERT INTO `translation` VALUES('Banned users', 'Utilisateur bloqué', 'fr', 'yum');
INSERT INTO `translation` VALUES('Banned users', 'Utenti bannati', 'it', 'yum');
INSERT INTO `translation` VALUES('Banned users', 'Zbanowani uÅ¼ytkownicy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Browse', 'Durchsuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse groups', 'Buscar grupos', 'es', 'yum');
INSERT INTO `translation` VALUES('Browse logged user activities', 'Benutzeraktivitäten', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse logged user activities', 'Consultar bitácora de actividades del usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Browse logged user activities', 'Activité des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse logged user activities', 'Naviga attivitÃ  utenti loggati', 'it', 'yum');
INSERT INTO `translation` VALUES('Browse memberships', 'Mitgliedschaften kaufen', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse memberships', 'Parcourir les membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse memberships', 'Naviga iscrizioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Browse user activities', 'Tätigkeitenhistorie', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse user activities', 'Activité de mon compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse user activities', 'Naviga attivitÃ  utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Browse user groups', 'Benutzergruppen durchsuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse user groups', 'Buscar grupos de usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Browse user groups', 'Rechercher dans un grouppe d utilisateurs', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse user groups', 'Naviga gruppi utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Browse usergroups', 'Gruppen durchsuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse usergroups', 'Rechercher dans les grouppes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse usergroups', 'Naviga gruppi utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Browse users', 'Benutzer durchsuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Browse users', 'Buscar usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Browse users', 'Rechercher dans la liste des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Browse users', 'Naviga utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Cancel', 'Abbrechen', 'de', 'yum');
INSERT INTO `translation` VALUES('Cancel', 'Cancelar', 'es', 'yum');
INSERT INTO `translation` VALUES('Cancel', 'Annuler', 'fr', 'yum');
INSERT INTO `translation` VALUES('Cancel', 'Cancella', 'it', 'yum');
INSERT INTO `translation` VALUES('Cancel deletion', 'Löschvorgang abbrechen', 'de', 'yum');
INSERT INTO `translation` VALUES('Cancel deletion', 'Cancelar eliminación', 'es', 'yum');
INSERT INTO `translation` VALUES('Cancel deletion', 'Stopper la suppression', 'fr', 'yum');
INSERT INTO `translation` VALUES('Cancel deletion', 'Annulla cancellazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Cancel deletion', 'Anuluj usuwanie', 'pl', 'yum');
INSERT INTO `translation` VALUES('Cancel request', 'Anfrage zurückziehen', 'de', 'yum');
INSERT INTO `translation` VALUES('Cancel request', 'Annuler la demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Cancel request', 'Cancella richiesta', 'it', 'yum');
INSERT INTO `translation` VALUES('Cannot set password. Try again.', 'No pudimos guardar tu contraseña. Inténtalo otra vez', 'es', 'yum');
INSERT INTO `translation` VALUES('Category', 'Kategorie', 'de', 'yum');
INSERT INTO `translation` VALUES('Change Password', 'Ð˜Ð·Ð¼ÐµÐ½Ð¸Ñ‚ÑŒ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Change admin Password', 'Administratorpasswort ändern', 'de', 'yum');
INSERT INTO `translation` VALUES('Change admin Password', 'Cambiar contraseña de Admin', 'es', 'yum');
INSERT INTO `translation` VALUES('Change admin Password', 'Changer le mot de passe de l administrateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Change admin Password', 'Modifica password admin', 'it', 'yum');
INSERT INTO `translation` VALUES('Change admin Password', 'ZmieÅ„ hasÅ‚o administratora', 'pl', 'yum');
INSERT INTO `translation` VALUES('Change password', 'Passwort ändern', 'de', 'yum');
INSERT INTO `translation` VALUES('Change password', 'Cambiar contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Change password', 'Modification du mot de ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Change password', 'Cambia password', 'it', 'yum');
INSERT INTO `translation` VALUES('Change password', 'Passwort Ã¤ndern', 'pl', 'yum');
INSERT INTO `translation` VALUES('Changes', 'Änderungen', 'de', 'yum');
INSERT INTO `translation` VALUES('Changes', 'Cambios', 'es', 'yum');
INSERT INTO `translation` VALUES('Changes', 'Modification', 'fr', 'yum');
INSERT INTO `translation` VALUES('Changes', 'Modifiche', 'it', 'yum');
INSERT INTO `translation` VALUES('Changes', 'Zmiany', 'pl', 'yum');
INSERT INTO `translation` VALUES('Changes are saved', 'Änderungen wurden gespeichert.', 'de', 'yum');
INSERT INTO `translation` VALUES('Changes are saved', 'Cambios guardados', 'es', 'yum');
INSERT INTO `translation` VALUES('Changes are saved', 'Les modifications ont bien été enregistrées.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Changes are saved', 'Modifiche salvate.', 'it', 'yum');
INSERT INTO `translation` VALUES('Changes are saved', 'Zmiany zostaÅ‚y zapisane.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Changes is saved.', 'Änderungen wurde gespeichert.', 'de', 'yum');
INSERT INTO `translation` VALUES('Changes is saved.', 'Cambio guardado', 'es', 'yum');
INSERT INTO `translation` VALUES('Changes is saved.', 'Modifications mémorisées.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Changes is saved.', 'Modifiche salvate', 'it', 'yum');
INSERT INTO `translation` VALUES('Changes is saved.', 'Ð˜Ð·Ð¼ÐµÐ½ÐµÐ½Ð¸Ñ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½Ñ‹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Choose All', 'Alle auswählen', 'de', 'yum');
INSERT INTO `translation` VALUES('Choose All', 'Seleccionar todos', 'es', 'yum');
INSERT INTO `translation` VALUES('Choose All', 'Sélectioner tout', 'fr', 'yum');
INSERT INTO `translation` VALUES('Choose All', 'Scegli tutti', 'it', 'yum');
INSERT INTO `translation` VALUES('Choose All', 'Wybierz wszystkie', 'pl', 'yum');
INSERT INTO `translation` VALUES('City', 'Stadt', 'de', 'yum');
INSERT INTO `translation` VALUES('City', 'Ciudad', 'es', 'yum');
INSERT INTO `translation` VALUES('City', 'Ville', 'fr', 'yum');
INSERT INTO `translation` VALUES('City', 'CittÃ ', 'it', 'yum');
INSERT INTO `translation` VALUES('City', 'Miasto', 'pl', 'yum');
INSERT INTO `translation` VALUES('Column Field type in the database.', 'Spaltentyp in der Datenbank', 'de', 'yum');
INSERT INTO `translation` VALUES('Column Field type in the database.', 'Columna tipo de Campo en la base de datos', 'es', 'yum');
INSERT INTO `translation` VALUES('Column Field type in the database.', 'Type de la colone dans la banque de donnée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Column Field type in the database.', 'Tipo di colonna nel database', 'it', 'yum');
INSERT INTO `translation` VALUES('Column Field type in the database.', 'Spaltentyp in der Datenbank', 'pl', 'yum');
INSERT INTO `translation` VALUES('Comment', 'Kommentar', 'de', 'yum');
INSERT INTO `translation` VALUES('Comment', 'Comentario', 'es', 'yum');
INSERT INTO `translation` VALUES('Comment', 'Commentaire', 'fr', 'yum');
INSERT INTO `translation` VALUES('Comment', 'Commento', 'it', 'yum');
INSERT INTO `translation` VALUES('Compose', 'Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Compose', 'Ecrire un message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Compose', 'Scrivi', 'it', 'yum');
INSERT INTO `translation` VALUES('Compose new message', 'Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Compose new message', 'Crear mensaje nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Compose new message', 'Ecrire un nouveau message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Compose new message', 'Scrivi nuovo messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Composing new message', 'Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Composing new message', 'Creando mensaje nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Composing new message', 'Ecrire un nouveau message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Composing new message', 'Scrittura nuovo messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Confirm', 'Bestätigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Confirm', 'Confirmar', 'es', 'yum');
INSERT INTO `translation` VALUES('Confirm', 'Confirmer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Confirm', 'Conferma', 'it', 'yum');
INSERT INTO `translation` VALUES('Confirm deletion', 'Löschvorgang bestätigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Confirm deletion', 'Confirmar eliminación', 'es', 'yum');
INSERT INTO `translation` VALUES('Confirm deletion', 'Confirmation de suppression', 'fr', 'yum');
INSERT INTO `translation` VALUES('Confirm deletion', 'Conferma cancellazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Confirm deletion', 'PotwierdÅº usuwanie', 'pl', 'yum');
INSERT INTO `translation` VALUES('Confirmation pending', 'Bestätigung ausstehend', 'de', 'yum');
INSERT INTO `translation` VALUES('Confirmation pending', 'Esperando confirmación', 'es', 'yum');
INSERT INTO `translation` VALUES('Confirmation pending', 'Confirmation en attente', 'fr', 'yum');
INSERT INTO `translation` VALUES('Confirmation pending', 'In attesa di conferma', 'it', 'yum');
INSERT INTO `translation` VALUES('Content', 'Inhalt', 'de', 'yum');
INSERT INTO `translation` VALUES('Content', 'Texte du message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Content', 'Contenuto', 'it', 'yum');
INSERT INTO `translation` VALUES('Create', 'Anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create', 'Crear', 'es', 'yum');
INSERT INTO `translation` VALUES('Create', 'Créer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create', 'Aggiungi', 'it', 'yum');
INSERT INTO `translation` VALUES('Create', 'Dodaj', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create', 'ÐÐ¾Ð²Ñ‹Ð¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Create Action', 'Crea azione', 'it', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Profilfeld anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Crear Campo de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Nouveau champ de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Aggiungi campo Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Dodaj pole profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create Profile Field', 'Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Create Role', 'Rolle anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create Role', 'Crear Rol', 'es', 'yum');
INSERT INTO `translation` VALUES('Create Role', 'Créer un rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create Role', 'Crea ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create Role', 'Dodaj rolÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create User', 'Benutzer anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create User', 'Crear Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Create User', 'Créer un nouvel utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create User', 'Nuovo utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Create User', 'ÐÐ¾Ð²Ñ‹Ð¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Create Usergroup', 'Neue Gruppe erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create Usergroup', 'Crea gruppo utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Create my profile', 'Mein Profil anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create my profile', 'Crea profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new Translation', 'Neue Übersetzung erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new User', 'Neuen Benutzer anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new Usergroup', 'Neue Gruppe erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new Usergroup', 'Crear nuevo grupo de usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new action', 'Neue Aktion', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new action', 'Crear acción nueva', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new action', 'Nouvelle action', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new action', 'Nuova azione', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new field group', 'Neue Feldgruppe erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new field group', 'Crear campo de grupo nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new field group', 'Créer un nouveau champs dans le groupe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new field group', 'Nuovo campo gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new field group', 'Dodaj nowÄ… grupÄ™ pÃ³l', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create new payment type', 'Neue Zahlungsart hinzufügen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new payment type', 'Créer un nouveau mode de paiement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new payment type', 'Nuovo tipo pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new role', 'Neue Rolle anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new role', 'Crear rol nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new role', 'Créer un nouveau rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new role', 'Nuovo ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new role', 'Dodaj nowÄ… rolÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create new settings profile', 'Neues Einstellungsprofil erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new settings profile', 'Crear ajuste de perfil nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new settings profile', 'créer une nouvelle configuration de profil.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new settings profile', 'Nuova opzion profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new settings profile', 'Dodaj nowe ustawienia profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create new user', 'Crear usuario nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Create new user', 'Créer un nouveau membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new user', 'Nuovo utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Create new user', 'Dodaj nowego uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create new usergroup', 'Neue Gruppe erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create new usergroup', 'Créer un nouveau grouppe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create new usergroup', 'Nuovo usergroup', 'it', 'yum');
INSERT INTO `translation` VALUES('Create payment type', 'Zahlungsart anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create payment type', 'Crea tipo pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Create profile field', 'Ein neues Profilfeld erstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create profile field', 'Crear campo de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Create profile field', 'Créer un nouveau champ de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create profile field', 'Crea campo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create profile field', 'Dodaj pole do profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create profile fields group', 'Crear grupo de campos de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Create profile fields group', 'Nuovo gruppo di campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create profile fields group', 'Dodaj grupÄ™ pÃ³l do profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create role', 'Neue Rolle anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create role', 'Crear rol', 'es', 'yum');
INSERT INTO `translation` VALUES('Create role', 'Créer un nouveau rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create role', 'Crea ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Create role', 'Dodaj rolÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Create user', 'Benutzer anlegen', 'de', 'yum');
INSERT INTO `translation` VALUES('Create user', 'Crear usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Create user', 'Créer un membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Create user', 'Crea utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Create user', 'Dodaj uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('Date', 'Datum', 'de', 'yum');
INSERT INTO `translation` VALUES('Date', 'Fecha', 'es', 'yum');
INSERT INTO `translation` VALUES('Date', 'Date', 'fr', 'yum');
INSERT INTO `translation` VALUES('Date', 'Data', 'it', 'yum');
INSERT INTO `translation` VALUES('Date', 'Data', 'pl', 'yum');
INSERT INTO `translation` VALUES('Default', 'Default', 'de', 'yum');
INSERT INTO `translation` VALUES('Default', 'Predeterminado', 'es', 'yum');
INSERT INTO `translation` VALUES('Default', 'Default', 'fr', 'yum');
INSERT INTO `translation` VALUES('Default', 'Predefinito', 'it', 'yum');
INSERT INTO `translation` VALUES('Default', 'ÐŸÐ¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Delete Account', 'Zugang löschen', 'de', 'yum');
INSERT INTO `translation` VALUES('Delete Account', 'Eliminar Cuenta', 'es', 'yum');
INSERT INTO `translation` VALUES('Delete Account', 'Supprimer le compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Delete Account', 'Cancella account', 'it', 'yum');
INSERT INTO `translation` VALUES('Delete Profile Field', 'Cancella campo Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Delete Profile Field', 'Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Delete User', 'Benutzer löschen', 'de', 'yum');
INSERT INTO `translation` VALUES('Delete User', 'Eliminar Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Delete User', 'Supprimer le membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Delete User', 'Cancella utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Delete User', 'Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Delete account', 'Zugang löschen', 'de', 'yum');
INSERT INTO `translation` VALUES('Delete account', 'Eliminar cuenta', 'es', 'yum');
INSERT INTO `translation` VALUES('Delete account', 'Supprimer ce compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Delete account', 'Cancella account', 'it', 'yum');
INSERT INTO `translation` VALUES('Delete account', 'UsuÅ„ konto', 'pl', 'yum');
INSERT INTO `translation` VALUES('Delete file', 'Cancella file', 'it', 'yum');
INSERT INTO `translation` VALUES('Delete message', 'Nachricht löschen', 'de', 'yum');
INSERT INTO `translation` VALUES('Delete message', 'Eliminar mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Delete message', 'Supprimer le message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Delete message', 'Cancella messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Deleted', 'Gelöscht', 'de', 'yum');
INSERT INTO `translation` VALUES('Deleted', 'Supprimé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Deleted', 'Cancella', 'it', 'yum');
INSERT INTO `translation` VALUES('Deny', 'Ablehnen', 'de', 'yum');
INSERT INTO `translation` VALUES('Deny', 'Negar', 'es', 'yum');
INSERT INTO `translation` VALUES('Deny', 'Refuser', 'fr', 'yum');
INSERT INTO `translation` VALUES('Deny', 'Vietao', 'it', 'yum');
INSERT INTO `translation` VALUES('Description', 'Beschreibung', 'de', 'yum');
INSERT INTO `translation` VALUES('Description', 'Descripción', 'es', 'yum');
INSERT INTO `translation` VALUES('Description', 'Description', 'fr', 'yum');
INSERT INTO `translation` VALUES('Description', 'Descrizione', 'it', 'yum');
INSERT INTO `translation` VALUES('Description', 'Opis', 'pl', 'yum');
INSERT INTO `translation` VALUES('Different users logged in today', 'Anzahl der heute angemeldeten Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Different users logged in today', 'Diferentes usuarios iniciaron sesión hoy', 'es', 'yum');
INSERT INTO `translation` VALUES('Different users logged in today', 'Nombre d utilisateurs inscrits/connectés aujourd hui.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Different users logged in today', 'Numero di utenti connessi oggi', 'it', 'yum');
INSERT INTO `translation` VALUES('Different users logged in today', 'Liczba dzisiejszych unikalnych logowaÅ„', 'pl', 'yum');
INSERT INTO `translation` VALUES('Different viewn Profiles', 'Insgesamt betrachtete Profile', 'de', 'yum');
INSERT INTO `translation` VALUES('Different viewn Profiles', 'Perfiles diferentes vistos', 'es', 'yum');
INSERT INTO `translation` VALUES('Different viewn Profiles', 'Total des profils consultés', 'fr', 'yum');
INSERT INTO `translation` VALUES('Different viewn Profiles', 'Visualizzazioni profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'Reihenfolgenposition, in der das Feld angezeigt wird', 'de', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'Mostrar orden de los campos', 'es', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'Ordre de position dans laquelle le champ apparaitra', 'fr', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'Mostra ordine dei campi.', 'it', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'KolejnoÅ›Ä‡ wyÅ›wietlania pÃ³l.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Display order of fields.', 'ÐŸÐ¾Ñ€ÑÐ´Ð¾Ðº Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð¿Ð¾Ð»ÐµÐ¹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Display order of group.', 'Anzeigereihenfolge der Gruppe.', 'de', 'yum');
INSERT INTO `translation` VALUES('Display order of group.', 'Mostrar orden del grupo', 'es', 'yum');
INSERT INTO `translation` VALUES('Display order of group.', 'Annonces ordonnées du grouppe.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Display order of group.', 'Ordine di visualizzazione del gruppo.', 'it', 'yum');
INSERT INTO `translation` VALUES('Display order of group.', 'WyÅ›wietl kolejnoÅ›Ä‡ grup.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Do not appear in search', 'Nicht in der Suche erscheinen', 'de', 'yum');
INSERT INTO `translation` VALUES('Do not appear in search', 'Ne pas paraitre dans les résultat de recherche', 'fr', 'yum');
INSERT INTO `translation` VALUES('Do not appear in search', 'Non mostrare nelle ricerche', 'it', 'yum');
INSERT INTO `translation` VALUES('Do not show my online status', 'Status verstecken', 'de', 'yum');
INSERT INTO `translation` VALUES('Do not show my online status', 'Ne pas rendre mon profil visible lorsque je suis en ligne', 'fr', 'yum');
INSERT INTO `translation` VALUES('Do not show my online status', 'Non mostrare il mio stato online', 'it', 'yum');
INSERT INTO `translation` VALUES('Do not show the owner of a profile when i visit him', 'Niemandem zeigen, wen ich besucht habe', 'de', 'yum');
INSERT INTO `translation` VALUES('Do not show the owner of a profile when i visit him', 'Ne pas montrer les profils que j ai visité', 'fr', 'yum');
INSERT INTO `translation` VALUES('Do not show the owner of a profile when i visit him', 'Non mostrare al proprietario quando visito il suo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Duration in days', 'Gültigkeitsdauer in Tagen', 'de', 'yum');
INSERT INTO `translation` VALUES('Duration in days', 'Validité en jours', 'fr', 'yum');
INSERT INTO `translation` VALUES('Duration in days', 'Durata in giorni', 'it', 'yum');
INSERT INTO `translation` VALUES('E-Mail address', 'E-Mail Adresse', 'de', 'yum');
INSERT INTO `translation` VALUES('E-Mail address', 'Correo electrónico', 'es', 'yum');
INSERT INTO `translation` VALUES('E-Mail address', 'Adresse e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('E-Mail address', 'Indirizzo email', 'it', 'yum');
INSERT INTO `translation` VALUES('E-Mail already in use. If you have not registered before, please contact our System administrator.', 'Este correo ya está siendo usado por alguien. Si no te habías registrado antes entonces contáctanos', 'es', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'E-mail', 'de', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'Correo electrónico', 'es', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'E-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'E-mail', 'it', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'Mejl', 'pl', 'yum');
INSERT INTO `translation` VALUES('E-mail', 'Ð­Ð»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ð°Ñ Ð¿Ð¾Ñ‡Ñ‚Ð°', 'ru', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Editar', 'es', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Editer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Modifica', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Bearbeiten', 'pl', 'yum');
INSERT INTO `translation` VALUES('Edit', 'Ð ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Edit personal data', 'Persönliche Daten bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Edit personal data', 'Editar datos personales', 'es', 'yum');
INSERT INTO `translation` VALUES('Edit personal data', 'Modifier mes données personnelles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Edit personal data', 'Modifica dati personali', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Profil bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Editar perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Editer le profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Modifica profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Meine Profildaten bearbeiten', 'pl', 'yum');
INSERT INTO `translation` VALUES('Edit profile', 'Ð ÐµÐ´Ð°ÐºÑ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð¿Ñ€Ð¾Ñ„Ð¸Ð»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Edit profile field', 'Profilfeld bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Edit profile field', 'Editar campo del perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Edit profile field', 'Editer les champ du profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Edit profile field', 'Modifica campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit profile field', 'Profilfeld bearbeiten', 'pl', 'yum');
INSERT INTO `translation` VALUES('Edit text', 'Modifica testo', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit this role', 'Diese Rolle bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Edit this role', 'Editar este rol', 'es', 'yum');
INSERT INTO `translation` VALUES('Edit this role', 'Modifier ce rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Edit this role', 'Modifica questo ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Edit this role', 'ZmieÅ„ tÄ™ rolÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'E-Mail ist nicht korrekt.', 'de', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'Email incorrecto', 'es', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'L''adresse e-mail est incorrecte.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'Email non corretta.', 'it', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'Mejl jest niepoprawny.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Email is incorrect.', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ñ Ñ‚Ð°ÐºÐ¸Ð¼ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ñ‹Ð¼ Ð°Ð´Ñ€ÐµÑÐ¾Ð¼ Ð½Ðµ Ð·Ð°Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð¸Ñ€Ð¾Ð²Ð°Ð½.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Email is not set when trying to send Registration Email', 'Debes colocar el correo electrónico para enviar el correo de registro', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Captcha', 'Captcha Überprüfung aktivieren', 'de', 'yum');
INSERT INTO `translation` VALUES('Enable Captcha', 'Habilitar Captcha', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Captcha', 'Activer le controle par Captcha', 'fr', 'yum');
INSERT INTO `translation` VALUES('Enable Captcha', 'Attiva Captcha', 'it', 'yum');
INSERT INTO `translation` VALUES('Enable Captcha', 'WÅ‚Ä…cz Captcha', 'pl', 'yum');
INSERT INTO `translation` VALUES('Enable Email Activation', 'Aktivierung per E-Mail einschalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Enable Email Activation', 'Habilitar Activación por Email', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Email Activation', 'Activer l activation par e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('Enable Email Activation', 'Attiva attivazione via Email', 'it', 'yum');
INSERT INTO `translation` VALUES('Enable Email Activation', 'WÅ‚Ä…cz aktywacjÄ™ mejlem', 'pl', 'yum');
INSERT INTO `translation` VALUES('Enable Profile History', 'Profilhistorie einschalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Enable Profile History', 'Habilitar Historial de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Profile History', 'Activer le protocole des profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Enable Profile History', 'Attiva storico Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Enable Profile History', 'WÅ‚Ä…cz historiÄ™ profilÃ³w', 'pl', 'yum');
INSERT INTO `translation` VALUES('Enable Recovery', 'Wiederherstellung einschalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Enable Recovery', 'Habilitar Recuperación', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Recovery', 'Activer la restauration', 'fr', 'yum');
INSERT INTO `translation` VALUES('Enable Recovery', 'Attiva rispristino', 'it', 'yum');
INSERT INTO `translation` VALUES('Enable Recovery', 'WÅ‚Ä…cz odzyskiwanie haseÅ‚', 'pl', 'yum');
INSERT INTO `translation` VALUES('Enable Registration', 'Registrierung einschalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Enable Registration', 'Habilitar Registro', 'es', 'yum');
INSERT INTO `translation` VALUES('Enable Registration', 'Activer l enregistrement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Enable Registration', 'Attiva registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Enable Registration', 'WÅ‚Ä…cz rejestracjÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('End date', 'Enddatum', 'de', 'yum');
INSERT INTO `translation` VALUES('End date', 'Data scadenza', 'it', 'yum');
INSERT INTO `translation` VALUES('Ends at', 'Endet am', 'de', 'yum');
INSERT INTO `translation` VALUES('Ends at', 'Scade il', 'it', 'yum');
INSERT INTO `translation` VALUES('Error Message', 'Fehlermeldung', 'de', 'yum');
INSERT INTO `translation` VALUES('Error Message', 'Mensaje de Error', 'es', 'yum');
INSERT INTO `translation` VALUES('Error Message', 'Message d erreur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Error Message', 'Messaggio d''errore', 'it', 'yum');
INSERT INTO `translation` VALUES('Error Message', 'Ð¡Ð¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð¾Ð± Ð¾ÑˆÐ¸Ð±ÐºÐµ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Error message when Validation fails.', 'Fehlermeldung falls die Validierung fehlschlägt', 'de', 'yum');
INSERT INTO `translation` VALUES('Error message when Validation fails.', 'Mensaje de error cuando la Validación falla', 'es', 'yum');
INSERT INTO `translation` VALUES('Error message when Validation fails.', 'Message d erreur pour le cas ou la validation échoue', 'fr', 'yum');
INSERT INTO `translation` VALUES('Error message when Validation fails.', 'Messaggio d''errore se fallisce la validazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Error message when you validate the form.', 'Messaggio d''errore durante la validazione del form.', 'it', 'yum');
INSERT INTO `translation` VALUES('Error message when you validate the form.', 'Ð¡Ð¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð¾Ð± Ð¾ÑˆÐ¸Ð±ÐºÐµ Ð¿Ñ€Ð¸ Ð¿Ñ€Ð¾Ð²ÐµÑ€ÐºÐµ Ñ„Ð¾Ñ€Ð¼Ñ‹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Error while processing new avatar image : {error_message}; File was uploaded without resizing', 'Das Bild konnte nicht richtig skaliert werden: {error_message}. Es wurde trotzdem erfolgreich hochgeladen und in ihrem Profil aktiviert.', 'de', 'yum');
INSERT INTO `translation` VALUES('Error while processing new avatar image : {error_message}; File was uploaded without resizing', 'L''image n a pas pu être retaillée automatiquement lors du chargement. : {error_message}. elle a été cependant chargée avec succès et activée dans votre profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Error while processing new avatar image : {error_message}; File was uploaded without resizing', 'Errore processando il nuovo avatar: {error_message}. File caricato senza ridimensionamento.', 'it', 'yum');
INSERT INTO `translation` VALUES('Expired', 'Abgelaufen', 'de', 'yum');
INSERT INTO `translation` VALUES('Field', 'Feld', 'de', 'yum');
INSERT INTO `translation` VALUES('Field', 'Campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field', 'Champ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field', 'Campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field', 'Pole', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field Size', 'Feldgröße', 'de', 'yum');
INSERT INTO `translation` VALUES('Field Size', 'Tamaño del Campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field Size', 'Longueur du champ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field Size', 'Dimensione campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field Size', 'Ð Ð°Ð·Ð¼ÐµÑ€ Ð¿Ð¾Ð»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Field Size min', 'min Feldgröße', 'de', 'yum');
INSERT INTO `translation` VALUES('Field Size min', 'Tamaño mínimo del campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field Size min', 'longueur du champ minimum', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field Size min', 'Dimesione minima campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field Size min', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Field Type', 'Feldtyp', 'de', 'yum');
INSERT INTO `translation` VALUES('Field Type', 'Tipo de Campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field Type', 'Type du champ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field Type', 'Tipo campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field Type', 'Ð¢Ð¸Ð¿ Ð¿Ð¾Ð»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Field group', 'Feldgruppe', 'de', 'yum');
INSERT INTO `translation` VALUES('Field group', 'Grupo de Campos', 'es', 'yum');
INSERT INTO `translation` VALUES('Field group', 'Champ des groupes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field group', 'Campi gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field group', 'Grupa pÃ³l', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'Feldname in der Ursprungssprache', 'de', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'Nombre del campo en el idioma "sourceLanguage".', 'es', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'Non du champ dans la langue standard', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'Nome campo per il linguaggio di "sourceLanguage".', 'it', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'Feldname in der Ursprungssprache', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field name on the language of "sourceLanguage".', 'ÐÐ°Ð·Ð²Ð°Ð½Ð¸Ðµ Ð¿Ð¾Ð»Ñ Ð½Ð° ÑÐ·Ñ‹ÐºÐµ "sourceLanguage".', 'ru', 'yum');
INSERT INTO `translation` VALUES('Field size', 'Feldgröße', 'de', 'yum');
INSERT INTO `translation` VALUES('Field size', 'Tamaño del campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field size', 'Longueur du champ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field size', 'Dimensione campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field size', 'FeldgrÃ¶ÃŸe', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field size column in the database.', 'Dimensione campo nel database', 'it', 'yum');
INSERT INTO `translation` VALUES('Field size column in the database.', 'Ð Ð°Ð·Ð¼ÐµÑ€ Ð¿Ð¾Ð»Ñ ÐºÐ¾Ð»Ð¾Ð½ÐºÐ¸ Ð² Ð±Ð°Ð·Ðµ Ð´Ð°Ð½Ð½Ñ‹Ñ…', 'ru', 'yum');
INSERT INTO `translation` VALUES('Field size in the database.', 'Feldgröße in der Datenbank', 'de', 'yum');
INSERT INTO `translation` VALUES('Field size in the database.', 'Tamaño del campo en la base de datos', 'es', 'yum');
INSERT INTO `translation` VALUES('Field size in the database.', 'Longueur du champ dans la banque de donnée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field size in the database.', 'Dimensione campo nel database', 'it', 'yum');
INSERT INTO `translation` VALUES('Field size in the database.', 'FeldgrÃ¶ÃŸe in der Datenbank', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field type', 'Feldtyp', 'de', 'yum');
INSERT INTO `translation` VALUES('Field type', 'Tipo de campo', 'es', 'yum');
INSERT INTO `translation` VALUES('Field type', 'Type de champ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Field type', 'Tipo campo', 'it', 'yum');
INSERT INTO `translation` VALUES('Field type', 'Feldtyp', 'pl', 'yum');
INSERT INTO `translation` VALUES('Field type column in the database.', 'Tipo campo nel database.', 'it', 'yum');
INSERT INTO `translation` VALUES('Field type column in the database.', 'Ð¢Ð¸Ð¿ Ð¿Ð¾Ð»Ñ ÐºÐ¾Ð»Ð¾Ð½ÐºÐ¸ Ð² Ð±Ð°Ð·Ðµ Ð´Ð°Ð½Ð½Ñ‹Ñ….', 'ru', 'yum');
INSERT INTO `translation` VALUES('Fields with <span class="required">*</span> are required.', 'Felder mit <span class="required">*</span> sind Pflichtfelder.', 'de', 'yum');
INSERT INTO `translation` VALUES('First Name', 'Nome', 'it', 'yum');
INSERT INTO `translation` VALUES('First Name', 'Ð˜Ð¼Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('First name', 'Vorname', 'de', 'yum');
INSERT INTO `translation` VALUES('First name', 'Nombre', 'es', 'yum');
INSERT INTO `translation` VALUES('First name', 'Prénom', 'fr', 'yum');
INSERT INTO `translation` VALUES('First name', 'Cognome', 'it', 'yum');
INSERT INTO `translation` VALUES('First name', 'Vorname', 'pl', 'yum');
INSERT INTO `translation` VALUES('For all', 'Für alle', 'de', 'yum');
INSERT INTO `translation` VALUES('For all', 'Para todos', 'es', 'yum');
INSERT INTO `translation` VALUES('For all', 'Pour tous', 'fr', 'yum');
INSERT INTO `translation` VALUES('For all', 'Per tutti', 'it', 'yum');
INSERT INTO `translation` VALUES('For all', 'Ð”Ð»Ñ Ð²ÑÐµÑ…', 'ru', 'yum');
INSERT INTO `translation` VALUES('Form validation error', 'Error en la validación del formulario', 'es', 'yum');
INSERT INTO `translation` VALUES('Friends', 'Kontakte', 'de', 'yum');
INSERT INTO `translation` VALUES('Friends', 'Amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('Friends', 'Mes contacts', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friends', 'Contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('Friends of {username}', 'Kontakte von {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('Friends of {username}', 'Contact de {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friends of {username}', 'Contatti di {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship', 'Kontakt', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship', 'Amistades', 'es', 'yum');
INSERT INTO `translation` VALUES('Friendship', 'Contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship', 'Contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship confirmed', 'Freundschaft bestätigt', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship confirmed', 'Amistad confirmada', 'es', 'yum');
INSERT INTO `translation` VALUES('Friendship confirmed', 'Demande de contact confirmée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship confirmed', 'Contatto confermato', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship rejected', 'Kontaktanfrage abgelehnt', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship rejected', 'Demande de contact refusée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship rejected', 'Amizicia rigettata', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship request already sent', 'Kontaktbestätigung ausstehend', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship request already sent', 'Ya se envió la solicitud de amistad', 'es', 'yum');
INSERT INTO `translation` VALUES('Friendship request already sent', 'En attente de confirmation', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship request already sent', 'Richiesta di contatto giÃ  inviata', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship request for {username} has been sent', 'Kontaktanfrage an {username} gesendet', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship request for {username} has been sent', 'La solicitud de amistad a {username} ha sido enviada', 'es', 'yum');
INSERT INTO `translation` VALUES('Friendship request for {username} has been sent', 'Demande de contact envoyée à  {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship request for {username} has been sent', 'Inviata richiesta di contatto a {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('Friendship request has been rejected', 'Kontaktanfrage zurückgewiesen', 'de', 'yum');
INSERT INTO `translation` VALUES('Friendship request has been rejected', 'Solicitud de amistad rechazada', 'es', 'yum');
INSERT INTO `translation` VALUES('Friendship request has been rejected', 'Votre demande de contact a été rejetée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Friendship request has been rejected', 'Richiesta di contatto respinta', 'it', 'yum');
INSERT INTO `translation` VALUES('From', 'Von', 'de', 'yum');
INSERT INTO `translation` VALUES('From', 'Desde', 'es', 'yum');
INSERT INTO `translation` VALUES('From', 'De', 'fr', 'yum');
INSERT INTO `translation` VALUES('From', 'Da', 'it', 'yum');
INSERT INTO `translation` VALUES('From', 'Od', 'pl', 'yum');
INSERT INTO `translation` VALUES('General', 'Allgemein', 'de', 'yum');
INSERT INTO `translation` VALUES('General', 'Generale', 'it', 'yum');
INSERT INTO `translation` VALUES('Generate Demo Data', 'Zufallsbenutzer erzeugen', 'de', 'yum');
INSERT INTO `translation` VALUES('Generate Demo Data', 'Genera datos de prueba', 'es', 'yum');
INSERT INTO `translation` VALUES('Generate Demo Data', 'Générer un compte membre-démo', 'fr', 'yum');
INSERT INTO `translation` VALUES('Generate Demo Data', 'Genera dati demo', 'it', 'yum');
INSERT INTO `translation` VALUES('Go to profile of {username}', 'Zum Profil von {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('Go to profile of {username}', 'Ir al perfil de {username}', 'es', 'yum');
INSERT INTO `translation` VALUES('Go to profile of {username}', 'Voir le profil de {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Go to profile of {username}', 'Vai al profilo di {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('Grant permission', 'Berechtigung zuweisen', 'de', 'yum');
INSERT INTO `translation` VALUES('Grant permission', 'Otorgar permiso', 'es', 'yum');
INSERT INTO `translation` VALUES('Grant permission', 'Attribuer une permission ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Grant permission', 'Assegna permesso', 'it', 'yum');
INSERT INTO `translation` VALUES('Group Name', 'Gruppenname', 'de', 'yum');
INSERT INTO `translation` VALUES('Group Name', 'Nombre de grupo', 'es', 'yum');
INSERT INTO `translation` VALUES('Group Name', 'Nom du groupe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Group Name', 'Nome gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Group Name', 'Nazwa grupy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Group name on the language of "sourceLanguage".', 'Gruppenname in der Basissprache.', 'de', 'yum');
INSERT INTO `translation` VALUES('Group name on the language of "sourceLanguage".', 'Nombre del grupo en el idioma "sourceLanguage".', 'es', 'yum');
INSERT INTO `translation` VALUES('Group name on the language of "sourceLanguage".', 'Nom du groupe dans la langue principale.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Group name on the language of "sourceLanguage".', 'Il nome del gruppo nella lingua di base.', 'it', 'yum');
INSERT INTO `translation` VALUES('Group name on the language of "sourceLanguage".', 'Nazwa grupy w jÄ™zyku uÅ¼ytkownika.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Group owner', 'Gruppeneigentümer', 'de', 'yum');
INSERT INTO `translation` VALUES('Group owner', 'Dueño del grupo', 'es', 'yum');
INSERT INTO `translation` VALUES('Group owner', 'Propriétaire du groupe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Group owner', 'Proprietario gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Group title', 'Titel der Gruppe', 'de', 'yum');
INSERT INTO `translation` VALUES('Group title', 'Título del grupo', 'es', 'yum');
INSERT INTO `translation` VALUES('Group title', 'Titre du grouppe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Group title', 'Titolo gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Having', 'Anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Having', 'Annonce', 'fr', 'yum');
INSERT INTO `translation` VALUES('Having', 'Visualizza', 'it', 'yum');
INSERT INTO `translation` VALUES('Hidden', 'Verstecken', 'de', 'yum');
INSERT INTO `translation` VALUES('Hidden', 'Escondido', 'es', 'yum');
INSERT INTO `translation` VALUES('Hidden', 'Caché', 'fr', 'yum');
INSERT INTO `translation` VALUES('Hidden', 'Nascosto', 'it', 'yum');
INSERT INTO `translation` VALUES('Hidden', 'Ð¡ÐºÑ€Ñ‹Ñ‚', 'ru', 'yum');
INSERT INTO `translation` VALUES('How expensive is a membership?', 'Preis der Mitgliedschaft', 'de', 'yum');
INSERT INTO `translation` VALUES('How expensive is a membership?', 'Prix de l''abonement', 'fr', 'yum');
INSERT INTO `translation` VALUES('How expensive is a membership?', 'Quanto costa l''iscrizione?', 'it', 'yum');
INSERT INTO `translation` VALUES('How many days will the membership be valid after payment?', 'Wie viele Tage ist die Mitgliedschaft nach Zahlungseingang gültig?', 'de', 'yum');
INSERT INTO `translation` VALUES('How many days will the membership be valid after payment?', 'Nombre de jours pour la validité d un abbonement après paiement?', 'fr', 'yum');
INSERT INTO `translation` VALUES('How many days will the membership be valid after payment?', 'Quanti giorni Ã¨ valida l''iscrizione dopo il pagamento?', 'it', 'yum');
INSERT INTO `translation` VALUES('Ignore', 'Ignorieren', 'de', 'yum');
INSERT INTO `translation` VALUES('Ignore', 'Ignorar', 'es', 'yum');
INSERT INTO `translation` VALUES('Ignore', 'Ignorer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Ignore', 'Ignora', 'it', 'yum');
INSERT INTO `translation` VALUES('Ignored users', 'Ignorierliste', 'de', 'yum');
INSERT INTO `translation` VALUES('Ignored users', 'Usuarios ignorados', 'es', 'yum');
INSERT INTO `translation` VALUES('Ignored users', 'Liste noire', 'fr', 'yum');
INSERT INTO `translation` VALUES('Ignored users', 'Utenti ignorati', 'it', 'yum');
INSERT INTO `translation` VALUES('Inactive users', 'Inaktive Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Inactive users', 'Usuarios inactivos', 'es', 'yum');
INSERT INTO `translation` VALUES('Inactive users', 'Utilisateur inactif', 'fr', 'yum');
INSERT INTO `translation` VALUES('Inactive users', 'Utenti inattivi', 'it', 'yum');
INSERT INTO `translation` VALUES('Inactive users', 'Nieaktywni uÅ¼ytkownicy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL', 'El enlace de activación que usaste es incorrecto', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'Falsche Aktivierungs URL.', 'de', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'URL de activación incorrecta.', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'Le lien d activation de votre compte est incorrect ou périmé. Consultez notre FAQ: mot clé= inscription ou contactez gratuitement notre Help-Center en ligne sur la page d aide.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'URL di attivazione incorretto', 'it', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'Falsche Aktivierungs URL.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect activation URL.', 'ÐÐµÐ¿Ñ€Ð°Ð²Ð¸Ð»ÑŒÐ½Ð°Ñ ÑÑÑ‹Ð»ÐºÐ° Ð°ÐºÑ‚Ð¸Ð²Ð°Ñ†Ð¸Ð¸ ÑƒÑ‡ÐµÑ‚Ð½Ð¾Ð¹ Ð·Ð°Ð¿Ð¸ÑÐ¸.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'Falsches Passwort (minimale Länge 4 Zeichen).', 'de', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'Contraseña incorrecta (debe tener mínimo 4 caracteres).', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'Mot de passe incorrect (longueur minimal de 4 charactères).', 'fr', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'Password sbagliata (lunga almeno 4 caratteri).', 'it', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'Falsches Passwort (minimale LÃ¤nge 4 Zeichen).', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect password (minimal length 4 symbols).', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð°Ñ Ð´Ð»Ð¸Ð½Ð° Ð¿Ð°Ñ€Ð¾Ð»Ñ 4 ÑÐ¸Ð¼Ð²Ð¾Ð»Ð°.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'Recovery link ist falsch.', 'de', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'Enlace de recuperación que usaste es incorrecto', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'Le lien de restauration est incorrect ou périmé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'Link ripristino incorretto.', 'it', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'Recovery link ist falsch.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect recovery link.', 'ÐÐµÐ¿Ñ€Ð°Ð²Ð¸Ð»ÑŒÐ½Ð°Ñ ÑÑÑ‹Ð»ÐºÐ° Ð²Ð¾ÑÑ‚Ð°Ð½Ð¾Ð²Ð»ÐµÐ½Ð¸Ñ Ð¿Ð°Ñ€Ð¾Ð»Ñ.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Im Benutzernamen sind nur Buchstaben und Zahlen erlaubt.', 'de', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Caracteres incorrectos. (A-z0-9)', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Pour le choix de votre nom d utilisateur seules les lettres de l alphabet et les chiffres sont acceptés .', 'fr', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Sono consentiti solo lettere e numeri', 'it', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Im Benutzernamen sind nur Buchstaben und Zahlen erlaubt.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect symbol''s. (A-z0-9)', 'Ð’ Ð¸Ð¼ÐµÐ½Ð¸ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ Ð´Ð¾Ð¿ÑƒÑÐºÐ°ÑŽÑ‚ÑÑ Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ð»Ð°Ñ‚Ð¸Ð½ÑÐºÐ¸Ðµ Ð±ÑƒÐºÐ²Ñ‹ Ð¸ Ñ†Ð¸Ñ„Ñ€Ñ‹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Falscher Benutzername (Länge zwischen 3 und 20 Zeichen).', 'de', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Nombre de usuario incorrecto (debe tener longitud entre 3 y 20 caracteres)', 'es', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Nom d utilisateur incorrect (Longueur comprise entre 3 et 20 charactères).', 'fr', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Username errato (lunghezza tra i 3 e i 20 caratteri).', 'it', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Falscher Benutzername (LÃ¤nge zwischen 3 und 20 Zeichen).', 'pl', 'yum');
INSERT INTO `translation` VALUES('Incorrect username (length between 3 and 20 characters).', 'Ð”Ð»Ð¸Ð½Ð° Ð¸Ð¼ÐµÐ½Ð¸ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ Ð¾Ñ‚ 3 Ð´Ð¾ 20 ÑÐ¸Ð¼Ð²Ð¾Ð»Ð¾Ð².', 'ru', 'yum');
INSERT INTO `translation` VALUES('Instructions have been sent to you. Please check your email.', 'Weitere Anweisungen wurden an ihr E-Mail Postfach geschickt. Bitte prüfen Sie ihre E-Mails', 'de', 'yum');
INSERT INTO `translation` VALUES('Instructions have been sent to you. Please check your email.', 'Se enviarion instrucciones a tu correo. Por favor, ve tu cuenta de correo.', 'es', 'yum');
INSERT INTO `translation` VALUES('Instructions have been sent to you. Please check your email.', 'Merci pour votre inscription. Controlez votre boite e-mail, le code d activation de votre compte vous a été envoyé par e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Instructions have been sent to you. Please check your email.', 'Istruzioni inviate per email. Controlla la tua casella di posta elettronica.', 'it', 'yum');
INSERT INTO `translation` VALUES('Invalid recovery key', 'Fehlerhafter Wiederherstellungsschlüssel', 'de', 'yum');
INSERT INTO `translation` VALUES('Invitation', 'Einladung', 'de', 'yum');
INSERT INTO `translation` VALUES('Invitation', 'Invitaciones', 'es', 'yum');
INSERT INTO `translation` VALUES('Invitation', 'Invitation', 'fr', 'yum');
INSERT INTO `translation` VALUES('Invitation', 'Invito', 'it', 'yum');
INSERT INTO `translation` VALUES('Is membership possible', 'Mitgliedschaft möglich?', 'de', 'yum');
INSERT INTO `translation` VALUES('Is membership possible', 'Inscription possible?', 'fr', 'yum');
INSERT INTO `translation` VALUES('Is membership possible', 'Iscrizione possibile?', 'it', 'yum');
INSERT INTO `translation` VALUES('Join group', 'Beitreten', 'de', 'yum');
INSERT INTO `translation` VALUES('Join group', 'Collega al gruppo', 'it', 'yum');
INSERT INTO `translation` VALUES('Jump to profile', 'Zum Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('Jump to profile', 'Consulter le profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Jump to profile', 'Vai al profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Language', 'Sprache', 'de', 'yum');
INSERT INTO `translation` VALUES('Language', 'Idioma', 'es', 'yum');
INSERT INTO `translation` VALUES('Language', '	Langue', 'fr', 'yum');
INSERT INTO `translation` VALUES('Language', 'Lingua', 'it', 'yum');
INSERT INTO `translation` VALUES('Last Name', 'Cognome', 'it', 'yum');
INSERT INTO `translation` VALUES('Last Name', 'Ð¤Ð°Ð¼Ð¸Ð»Ð¸Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Last name', 'Nachname', 'de', 'yum');
INSERT INTO `translation` VALUES('Last name', 'Apellido', 'es', 'yum');
INSERT INTO `translation` VALUES('Last name', 'Nom de famille', 'fr', 'yum');
INSERT INTO `translation` VALUES('Last name', 'Nome', 'it', 'yum');
INSERT INTO `translation` VALUES('Last name', 'Nachname', 'pl', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'Letzter Besuch', 'de', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'òltima visita', 'es', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'Dernère visite', 'fr', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'Ultima visita', 'it', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'Letzter Besuch', 'pl', 'yum');
INSERT INTO `translation` VALUES('Last visit', 'ÐŸÐ¾ÑÐ»ÐµÐ´Ð½Ð¸Ð¹ Ð²Ð¸Ð·Ð¸Ñ‚', 'ru', 'yum');
INSERT INTO `translation` VALUES('Let me appear in the search', 'Ich möchte in der Suche erscheinen', 'de', 'yum');
INSERT INTO `translation` VALUES('Let me appear in the search', 'Je ne souhaite pas apparaitre dans les résultats des moteurs de recherche', 'fr', 'yum');
INSERT INTO `translation` VALUES('Let me appear in the search', 'Mostrami nei risultati', 'it', 'yum');
INSERT INTO `translation` VALUES('Let the user choose in privacy settings', 'Den Benutzer entscheiden lassen', 'de', 'yum');
INSERT INTO `translation` VALUES('Let the user choose in privacy settings', 'Laisser l utilisateur choisir lui-même', 'fr', 'yum');
INSERT INTO `translation` VALUES('Let the user choose in privacy settings', 'Consentire all''utente di scegliere le impostazioni della privacy', 'it', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'Zwischen Groß-und Kleinschreibung wird nicht unterschieden.', 'de', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'Las letras nos son sensibles a mayúsculas y minúsculas.', 'es', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'Aucune importance ne sera apportée aux minuscules ou majuscules.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'La ricerca non Ã¨ case sensitive.', 'it', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'Zwischen GroÃŸ-und Kleinschreibung wird nicht unterschieden.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Letters are not case-sensitive.', 'Ð ÐµÐ³Ð¸ÑÑ‚Ñ€ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð½Ðµ Ð¸Ð¼ÐµÐµÑ‚.', 'ru', 'yum');
INSERT INTO `translation` VALUES('List Profile Field', 'Lista campi Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('List Profile Field', 'Ð¡Ð¿Ð¸ÑÐ¾Ðº', 'ru', 'yum');
INSERT INTO `translation` VALUES('List User', 'Lista utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('List User', 'Ð¡Ð¿Ð¸ÑÐ¾Ðº Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÐµÐ¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('List roles', 'Rollen anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('List roles', 'Listar roles', 'es', 'yum');
INSERT INTO `translation` VALUES('List roles', 'liste des rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('List roles', 'Lista ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('List roles', 'Lista rÃ³l', 'pl', 'yum');
INSERT INTO `translation` VALUES('List user', 'Benutzer auflisten', 'de', 'yum');
INSERT INTO `translation` VALUES('List user', 'Listar usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('List user', 'Liste complètes des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('List user', 'Lista utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('List user', 'Benutzer auflisten', 'pl', 'yum');
INSERT INTO `translation` VALUES('List users', 'Benutzer anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('List users', 'Listar usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('List users', 'Liste des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('List users', 'Lista utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('List users', 'Lista uÅ¼ytkownikÃ³w', 'pl', 'yum');
INSERT INTO `translation` VALUES('Log profile visits', 'Meine Profilbesuche anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Log profile visits', 'Voir les statistiques des visiteurs de mon profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Log profile visits', 'Log visite profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Logged in as', 'Angemeldet als', 'de', 'yum');
INSERT INTO `translation` VALUES('Logged in as', 'Connecté en tant que', 'fr', 'yum');
INSERT INTO `translation` VALUES('Logged in as', 'Loggato come', 'it', 'yum');
INSERT INTO `translation` VALUES('Login', 'Anmeldung', 'de', 'yum');
INSERT INTO `translation` VALUES('Login', 'Iniciar sesión', 'es', 'yum');
INSERT INTO `translation` VALUES('Login', 'Inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('Login', 'Entra', 'it', 'yum');
INSERT INTO `translation` VALUES('Login', 'Logowanie', 'pl', 'yum');
INSERT INTO `translation` VALUES('Login', 'Ð’Ñ…Ð¾Ð´', 'ru', 'yum');
INSERT INTO `translation` VALUES('Login Type', 'Anmeldungsart', 'de', 'yum');
INSERT INTO `translation` VALUES('Login Type', 'Tipo de inicio de sesión', 'es', 'yum');
INSERT INTO `translation` VALUES('Login Type', 'Mode de connection', 'fr', 'yum');
INSERT INTO `translation` VALUES('Login Type', 'Tipo login', 'it', 'yum');
INSERT INTO `translation` VALUES('Login Type', 'Rodzaj logowania', 'pl', 'yum');
INSERT INTO `translation` VALUES('Login allowed by Email and Username', 'Anmeldung per Benutzername oder E-Mail adresse', 'de', 'yum');
INSERT INTO `translation` VALUES('Login allowed by Email and Username', 'Inicio de sesión por Email y Nombre de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Login allowed by Email and Username', 'Connection avec le nom d utilisateur ou adresse e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Login allowed by Email and Username', 'Login con il nome utente o l''indirizzo e-mail', 'it', 'yum');
INSERT INTO `translation` VALUES('Login allowed by Email and Username', 'Logowanie przez nazwÄ™ lub mejl', 'pl', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Email', 'Anmeldung nur per E-Mail adresse', 'de', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Email', 'Inicio de sesión sólo por Email', 'es', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Email', 'Connection avec l''adresse e-mail seulement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Email', 'Login solo tramite email', 'it', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Email', 'Logowanie poprzez mejl', 'pl', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Username', 'Anmeldung nur per Benutzername', 'de', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Username', 'Inicio de sesión sólo por Nombre de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Username', 'Connection avec le nom d utilisateur seulement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Username', 'Login solo tramite username', 'it', 'yum');
INSERT INTO `translation` VALUES('Login allowed only by Username', 'Logowanie poprzez nazwÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Login is not possible with the given credentials', 'Anmeldung mit den angegebenen Werten nicht möglich', 'de', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Abmelden', 'de', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Cerrar sesión', 'es', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Déconnection', 'fr', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Esci', 'it', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Wyloguj', 'pl', 'yum');
INSERT INTO `translation` VALUES('Logout', 'Ð’Ñ‹Ð¹Ñ‚Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Lost Password?', 'Password dimenticata?', 'it', 'yum');
INSERT INTO `translation` VALUES('Lost Password?', 'Ð—Ð°Ð±Ñ‹Ð»Ð¸ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ?', 'ru', 'yum');
INSERT INTO `translation` VALUES('Lost password?', 'Passwort vergessen?', 'de', 'yum');
INSERT INTO `translation` VALUES('Lost password?', '¿Olvidó la contraseña?', 'es', 'yum');
INSERT INTO `translation` VALUES('Lost password?', 'Mot de passe oublié?', 'fr', 'yum');
INSERT INTO `translation` VALUES('Lost password?', 'Password dimenticata?', 'it', 'yum');
INSERT INTO `translation` VALUES('Lost password?', 'Passwort vergessen?', 'pl', 'yum');
INSERT INTO `translation` VALUES('Mail send method', 'Nachrichtenversandmethode', 'de', 'yum');
INSERT INTO `translation` VALUES('Mail send method', 'Método de envío de correo', 'es', 'yum');
INSERT INTO `translation` VALUES('Mail send method', 'Mode d envoie des messages', 'fr', 'yum');
INSERT INTO `translation` VALUES('Mail send method', 'Metodo invio mail', 'it', 'yum');
INSERT INTO `translation` VALUES('Mail send method', 'Metoda wysyÅ‚ania mejli', 'pl', 'yum');
INSERT INTO `translation` VALUES('Make {field} public available', 'Das Feld {field} öffentlich machen', 'de', 'yum');
INSERT INTO `translation` VALUES('Make {field} public available', 'Rendre publique le champ {field}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Make {field} public available', 'Rendi pubblico il campo {field}', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage', 'Verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage', 'Administrar', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage', 'Gestion', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage', 'Gestione', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Manage Actions', 'Gestione azioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'Profilfeld verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'Administrar Campos de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'Gérer le champ de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'Gestione campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'ZarzÄ…dzaj polem profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Field', 'ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° Ð¿Ð¾Ð»ÐµÐ¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'Profilfelder verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'Administrar Campos de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'Gérer les champs de profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'Gestione campi Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'ZarzÄ…dzaj polami profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage Profile Fields', 'ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ° Ð¿Ð¾Ð»ÐµÐ¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Manage Profiles', 'Profile verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage Profiles', 'Administrar Perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage Profiles', 'Gérer les profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage Profiles', 'Gestione profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage Roles', 'Rollenverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage Roles', 'Administrar Roles', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage Roles', 'Gestion des rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage Roles', 'Gestione Ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage Roles', 'ZarzÄ…dzaj rolami', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Benutzerverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Administrar Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Gestion utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Gestione utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Benutzerverwaltung', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage User', 'Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑÐ¼Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Manage Users', 'Benutzerverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage Users', 'Administrar Usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage Users', 'Gestion des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage Users', 'Gestione utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage field groups', 'Feldgruppen verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage field groups', 'Administrar grupos de campos', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage field groups', 'Gérer les champs des groupes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage field groups', 'Gestione campo gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage field groups', 'ZarzÄ…dzaj grupami pÃ³l', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage friends', 'Freundschaftsverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage friends', 'Administrar amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage friends', 'Gestion des contacts', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage friends', 'Gestione contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage my users', 'Meine Benutzer verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage my users', 'Administrar mis usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage my users', 'Gérer mes membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage my users', 'Gestione utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage my users', 'ZarzÄ…dzaj moimi uÅ¼ytkownikami', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage payments', 'Zahlungsarten verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage payments', 'Gestione pagamenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage permissions', 'Berechtigungen verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage permissions', 'Gestione permessi', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profile Fields', 'Profilfelder verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage profile Fields', 'Administrar Campos de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage profile Fields', 'Gérer les champs du profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage profile Fields', 'Gestione campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profile Fields', 'Profilfelder verwalten', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage profile field groups', 'Administrar grupos de campos de perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage profile field groups', 'Gérer les champs des profils de grouppes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage profile field groups', 'Gestione campo profilo gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profile field groups', 'ZarzÄ…dzaj grupami pÃ³l w profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields', 'Profilfelder verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields', 'Gérer les champs de profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields', 'Gestione campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields', 'ZarzÄ…dzaj polami profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields groups', 'Gestione campi profilo gruppi ', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profile fields groups', 'ZarzÄ…dzaj grupami pÃ³l w profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage profiles', 'Profile verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage profiles', 'Administrar perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage profiles', 'Gérer les profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage profiles', 'Gestione profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage profiles', 'ZarzÄ…dzaj profilem', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage roles', 'Rollen verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage roles', 'Adminsitrar roles', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage roles', 'Gérer les rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage roles', 'Gestione Ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage roles', 'ZarzÄ…dzaj rolami', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage text settings', 'Texteinstellungen', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage text settings', 'Administrar configuración de texto', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage text settings', 'Option de texte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage text settings', 'Impostazioni di testo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage this profile', 'dieses Profil bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage this profile', 'Administrar este perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage this profile', 'Modifier ce profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage this profile', 'Modifica profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage this profile', 'ZarzÄ…dzaj tym profilem', 'pl', 'yum');
INSERT INTO `translation` VALUES('Manage user Groups', 'Benutzergruppen verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage user Groups', 'Administrar Grupos de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage user Groups', 'Gerer les utilisateurs des grouppes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage user Groups', 'Gestine gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage users', 'Benutzer verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('Manage users', 'Administrar usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Manage users', 'Gérer les membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Manage users', 'Gestione utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Manage users', 'ZarzÄ…dzaj uÅ¼ytkownikaki', 'pl', 'yum');
INSERT INTO `translation` VALUES('Mange Profile Field', 'Mange Profil Field', 'de', 'yum');
INSERT INTO `translation` VALUES('Mange Profile Field', 'Administrar Campo del Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Mange Profile Field', 'Gestione campo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Mark as read', 'Als gelesen markieren', 'de', 'yum');
INSERT INTO `translation` VALUES('Mark as read', 'Marquer comme lu', 'fr', 'yum');
INSERT INTO `translation` VALUES('Mark as read', 'Segna come letto', 'it', 'yum');
INSERT INTO `translation` VALUES('Match', 'Treffer', 'de', 'yum');
INSERT INTO `translation` VALUES('Match', 'Combinar', 'es', 'yum');
INSERT INTO `translation` VALUES('Match', 'Résultat', 'fr', 'yum');
INSERT INTO `translation` VALUES('Match', 'Corrispondenza (RegExp)', 'it', 'yum');
INSERT INTO `translation` VALUES('Match', 'Ð¡Ð¾Ð²Ð¿Ð°Ð´ÐµÐ½Ð¸Ðµ (RegExp)', 'ru', 'yum');
INSERT INTO `translation` VALUES('Membership', 'Mitgliedschaft', 'de', 'yum');
INSERT INTO `translation` VALUES('Membership', 'Devenir membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Membership', 'Iscrizione', 'it', 'yum');
INSERT INTO `translation` VALUES('Membership ends at: {date}', 'Mitgliedschaft endet am: {date}', 'de', 'yum');
INSERT INTO `translation` VALUES('Membership ends at: {date}', 'Iscrizione termina il: {date}', 'it', 'yum');
INSERT INTO `translation` VALUES('Membership has not been payed yet', 'Zahlungseingang noch nicht erfolgt', 'de', 'yum');
INSERT INTO `translation` VALUES('Membership has not been payed yet', 'Iscrizione non pagata', 'it', 'yum');
INSERT INTO `translation` VALUES('Membership payed at: {date}', 'Zahlungseingang erfolgt am: {date}', 'de', 'yum');
INSERT INTO `translation` VALUES('Membership payed at: {date}', 'Iscrizione pagata il: {date}', 'it', 'yum');
INSERT INTO `translation` VALUES('Memberships', 'Mitgliedschaften', 'de', 'yum');
INSERT INTO `translation` VALUES('Memberships', 'Iscrizioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Message', 'Nachricht', 'de', 'yum');
INSERT INTO `translation` VALUES('Message', 'Mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Message', 'Message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Message', 'Messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" has been sent to {to}', 'Nachricht "{message}" wurde an {to} gesendet', 'de', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" has been sent to {to}', 'Message "{message}" a été envoyé à {to} ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" has been sent to {to}', 'Messaggio "{message}" Ã¨ stato inviato a {to}', 'it', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" was marked as read', 'Nachricht "{message}" wurde als gelesen markiert.', 'de', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" was marked as read', 'Message "{message}" marquer comme lu.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Message "{message}" was marked as read', 'Messaggio "{message}" Ã¨ stato contrassegnato come letto.', 'it', 'yum');
INSERT INTO `translation` VALUES('Message count', 'Anzahl Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('Message from', 'Nachricht von', 'de', 'yum');
INSERT INTO `translation` VALUES('Message from', 'Message de', 'fr', 'yum');
INSERT INTO `translation` VALUES('Message from', 'Messaggio da', 'it', 'yum');
INSERT INTO `translation` VALUES('Message from ', 'Nachricht von ', 'de', 'yum');
INSERT INTO `translation` VALUES('Message from ', 'Mensaje de', 'es', 'yum');
INSERT INTO `translation` VALUES('Message from ', 'Message de ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Message from ', 'Messaggio da ', 'it', 'yum');
INSERT INTO `translation` VALUES('Message from ', 'Nachricht von ', 'pl', 'yum');
INSERT INTO `translation` VALUES('Messages', 'Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('Messages', 'Mensajes', 'es', 'yum');
INSERT INTO `translation` VALUES('Messages', 'Message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Messages', 'Messagi', 'it', 'yum');
INSERT INTO `translation` VALUES('Messages', 'WiadomoÅ›ci', 'pl', 'yum');
INSERT INTO `translation` VALUES('Messaging system', 'Nachrichtensystem', 'de', 'yum');
INSERT INTO `translation` VALUES('Messaging system', 'Sistema de mensajes', 'es', 'yum');
INSERT INTO `translation` VALUES('Messaging system', 'Système de Messagerie', 'fr', 'yum');
INSERT INTO `translation` VALUES('Messaging system', 'Sistema messaggistica', 'it', 'yum');
INSERT INTO `translation` VALUES('Messaging system', 'System wiadomoÅ›ci', 'pl', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'Minimale Länge des Passworts 4 Zeichen.', 'de', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'Mínimo 4 caracteres para la contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'Votre mot de passe doit comporter au moins quatre caractères.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'Lunghezza minima password di 4 caratteri.', 'it', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'Minimale LÃ¤nge des Passworts 4 Zeichen.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Minimal password length 4 symbols.', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð°Ñ Ð´Ð»Ð¸Ð½Ð° Ð¿Ð°Ñ€Ð¾Ð»Ñ 4 ÑÐ¸Ð¼Ð²Ð¾Ð»Ð°.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Module settings', 'Moduleinstellungen', 'de', 'yum');
INSERT INTO `translation` VALUES('Module settings', 'Ajustes del módulo', 'es', 'yum');
INSERT INTO `translation` VALUES('Module settings', 'Réglage des modules', 'fr', 'yum');
INSERT INTO `translation` VALUES('Module settings', 'Opzioni modulo', 'it', 'yum');
INSERT INTO `translation` VALUES('Module settings', 'Ustawienia moduÅ‚u', 'pl', 'yum');
INSERT INTO `translation` VALUES('Module text settings', 'Ajustes de texto del módulo', 'es', 'yum');
INSERT INTO `translation` VALUES('Module text settings', 'Opzioni testo modulo', 'it', 'yum');
INSERT INTO `translation` VALUES('Module text settings', 'Ustawienia tekstÃ³w moduÅ‚u', 'pl', 'yum');
INSERT INTO `translation` VALUES('My Inbox', 'Posteingang', 'de', 'yum');
INSERT INTO `translation` VALUES('My Inbox', 'Mi bandeja de entrada', 'es', 'yum');
INSERT INTO `translation` VALUES('My Inbox', 'Boite e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('My Inbox', 'Moja skrzynka odbiorcza', 'pl', 'yum');
INSERT INTO `translation` VALUES('My friends', 'Meine Kontakte', 'de', 'yum');
INSERT INTO `translation` VALUES('My friends', 'Mis amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('My friends', 'Mes contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('My friends', 'Contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('My groups', 'Meine Gruppen', 'de', 'yum');
INSERT INTO `translation` VALUES('My groups', 'Mis grupos', 'es', 'yum');
INSERT INTO `translation` VALUES('My groups', 'Mes groupes', 'fr', 'yum');
INSERT INTO `translation` VALUES('My groups', 'Gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('My inbox', 'Mein Posteingang', 'de', 'yum');
INSERT INTO `translation` VALUES('My inbox', 'Mi bandeja de entrada', 'es', 'yum');
INSERT INTO `translation` VALUES('My inbox', 'Ma boite e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('My inbox', 'Posta in arrivo', 'it', 'yum');
INSERT INTO `translation` VALUES('My memberships', 'Meine Mitgliedschaften', 'de', 'yum');
INSERT INTO `translation` VALUES('My memberships', 'Options de mon compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('My memberships', 'Iscrizioni', 'it', 'yum');
INSERT INTO `translation` VALUES('My profile', 'Mein Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('My profile', 'Mi perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('My profile', 'Mon profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('My profile', 'Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('New friendship request', 'nueva solicitud de amistad', 'es', 'yum');
INSERT INTO `translation` VALUES('New friendship request from {username}', 'neue Kontaktanfrage von {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('New friendship request from {username}', 'Nouvelle demande de contact de {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('New friendship request from {username}', 'Nuova richiesta di contatto da {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('New friendship requests', 'Neue Freundschaftsanfragen', 'de', 'yum');
INSERT INTO `translation` VALUES('New friendship requests', 'Nueva solicitud de amistad', 'es', 'yum');
INSERT INTO `translation` VALUES('New friendship requests', 'Nouvelle demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('New friendship requests', 'Nuova richiesta contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('New messages', 'Neue Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('New messages', 'Nouveaux méssages', 'fr', 'yum');
INSERT INTO `translation` VALUES('New messages', 'Nuovo messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('New password', 'Neues Passwort', 'de', 'yum');
INSERT INTO `translation` VALUES('New password', 'Nouveau mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('New password', 'Nuovo Password', 'it', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'Neues Passwort wird gespeichert.', 'de', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'La contraseña nueva ha sido guardada', 'es', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'Votre nouveau mot de passe a bien été mémorisé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'Nuova passowrd salvata', 'it', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'Neues Passwort wird gespeichert.', 'pl', 'yum');
INSERT INTO `translation` VALUES('New password is saved.', 'ÐÐ¾Ð²Ñ‹Ð¹ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½.', 'ru', 'yum');
INSERT INTO `translation` VALUES('New profile comment', 'Nuevo comentario de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('New profile comment from {username}', 'Neuer Profilkommentar von {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('New profile comment from {username}', 'Nouveau commentaire pour le profil de {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('New profile comment from {username}', 'Nuovo commento per il profilo {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('New settings profile', 'Neues Einstellungsprofil', 'de', 'yum');
INSERT INTO `translation` VALUES('New settings profile', 'Nuevos ajustes de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('New settings profile', 'Nouvelle configuration de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('New settings profile', 'Nuova preferenze profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('New settings profile', 'Nowe ustawienia profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('New translation', 'Neue Übersetzung', 'de', 'yum');
INSERT INTO `translation` VALUES('New value', 'Neuer Wert', 'de', 'yum');
INSERT INTO `translation` VALUES('New value', 'Valor nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('New value', 'Nouvelle valeur', 'fr', 'yum');
INSERT INTO `translation` VALUES('New value', 'Nuovo valore', 'it', 'yum');
INSERT INTO `translation` VALUES('New value', 'Nowa wartoÅ›Ä‡', 'pl', 'yum');
INSERT INTO `translation` VALUES('No', 'Nein', 'de', 'yum');
INSERT INTO `translation` VALUES('No', 'No', 'es', 'yum');
INSERT INTO `translation` VALUES('No', 'Non', 'fr', 'yum');
INSERT INTO `translation` VALUES('No', 'No', 'it', 'yum');
INSERT INTO `translation` VALUES('No', 'Nein', 'pl', 'yum');
INSERT INTO `translation` VALUES('No', 'ÐÐµÑ‚', 'ru', 'yum');
INSERT INTO `translation` VALUES('No friendship requested', 'Keine Freundschaft angefragt', 'de', 'yum');
INSERT INTO `translation` VALUES('No friendship requested', 'No hay solicitud de amistad', 'es', 'yum');
INSERT INTO `translation` VALUES('No friendship requested', 'Pas de demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('No friendship requested', 'Contatto non richiesto', 'it', 'yum');
INSERT INTO `translation` VALUES('No new messages', 'Keine neuen Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('No new messages', 'Pas de nouveaux méssages', 'fr', 'yum');
INSERT INTO `translation` VALUES('No new messages', 'Nessun nuovo messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('No profile changes were made', 'Keine Profiländerungen stattgefunden', 'de', 'yum');
INSERT INTO `translation` VALUES('No profile changes were made', 'No se hicieron cambios en el perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('No profile changes were made', 'pas de résultat pour les profils modifiés', 'fr', 'yum');
INSERT INTO `translation` VALUES('No profile changes were made', 'Nessun cambiamento al profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('No profile changes were made', 'Nie dokonano zmian w profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'Ja, und auf Registrierungsseite anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'No, pero mostrar en formulario de registro', 'es', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'non et charger le formulaire d inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'No, ma mostra nel form di registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'Nie, ale pokaÅ¼ w formularzu rejestracji', 'pl', 'yum');
INSERT INTO `translation` VALUES('No, but show on registration form', 'ÐÐµÑ‚, Ð½Ð¾ Ð¿Ð¾ÐºÐ°Ð·Ð°Ñ‚ÑŒ Ð¿Ñ€Ð¸ Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Nobody has commented your profile yet', 'Bisher hat niemand mein Profil kommentiert', 'de', 'yum');
INSERT INTO `translation` VALUES('Nobody has commented your profile yet', 'Aucun commentaire pour votre profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Nobody has commented your profile yet', 'Nessuno ha commentato il tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Nobody has visited your profile yet', 'Bisher hat noch niemand ihr Profil angesehen', 'de', 'yum');
INSERT INTO `translation` VALUES('Nobody has visited your profile yet', 'Nadie ha visitado tu perfil todavía', 'es', 'yum');
INSERT INTO `translation` VALUES('Nobody has visited your profile yet', 'Aucune visite récente de votre profil.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Nobody has visited your profile yet', 'Fino ad ora nessuno ha visto il tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('None', 'Keine', 'de', 'yum');
INSERT INTO `translation` VALUES('None', 'Ninguno', 'es', 'yum');
INSERT INTO `translation` VALUES('None', 'Aucun', 'fr', 'yum');
INSERT INTO `translation` VALUES('None', 'Nessuno', 'it', 'yum');
INSERT INTO `translation` VALUES('None', 'Å»aden', 'pl', 'yum');
INSERT INTO `translation` VALUES('Not active', 'Nicht aktiv', 'de', 'yum');
INSERT INTO `translation` VALUES('Not active', 'Innactivo', 'es', 'yum');
INSERT INTO `translation` VALUES('Not active', 'Non actif', 'fr', 'yum');
INSERT INTO `translation` VALUES('Not active', 'Non attivo', 'it', 'yum');
INSERT INTO `translation` VALUES('Not active', 'Nicht aktiv', 'pl', 'yum');
INSERT INTO `translation` VALUES('Not active', 'ÐÐµ Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½', 'ru', 'yum');
INSERT INTO `translation` VALUES('Not assigned', 'Nicht zugewiesen', 'de', 'yum');
INSERT INTO `translation` VALUES('Not assigned', 'No asignado', 'es', 'yum');
INSERT INTO `translation` VALUES('Not assigned', 'Non assigné', 'fr', 'yum');
INSERT INTO `translation` VALUES('Not assigned', 'Non assegnato', 'it', 'yum');
INSERT INTO `translation` VALUES('Not assigned', 'Nie przypisano', 'pl', 'yum');
INSERT INTO `translation` VALUES('Not visited', 'Non visitato', 'it', 'yum');
INSERT INTO `translation` VALUES('Not yet payed', 'Noch nicht bezahlt', 'de', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Ok', 'de', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Aceptar', 'es', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Ok', 'fr', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Ok', 'it', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Ok', 'pl', 'yum');
INSERT INTO `translation` VALUES('Ok', 'Ok', 'ru', 'yum');
INSERT INTO `translation` VALUES('Old value', 'Alter Wert', 'de', 'yum');
INSERT INTO `translation` VALUES('Old value', 'Valor antiguo', 'es', 'yum');
INSERT INTO `translation` VALUES('Old value', 'Ancienne valeur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Old value', 'Vecchio valore', 'it', 'yum');
INSERT INTO `translation` VALUES('Old value', 'Stara wartoÅ›Ä‡', 'pl', 'yum');
INSERT INTO `translation` VALUES('One of the recipients ({username}) has ignored you. Message will not be sent!', 'Einer der gewählten Benutzer ({username}) hat Sie auf seiner Ignorier-Liste. Die Nachricht wird nicht gesendet!', 'de', 'yum');
INSERT INTO `translation` VALUES('One of the recipients ({username}) has ignored you. Message will not be sent!', 'Uno de los destinatarios ({username}) te ha ignorado. ¡No se enviará el mensaje!', 'es', 'yum');
INSERT INTO `translation` VALUES('One of the recipients ({username}) has ignored you. Message will not be sent!', 'Un des membres sélectionné vous a mis sur sa liste noire ({username}). Ce message ne sera pas envoyé!', 'fr', 'yum');
INSERT INTO `translation` VALUES('One of the recipients ({username}) has ignored you. Message will not be sent!', 'Un destinatario ({username}) ti ha inserito nella lista degli ignorati. Messaggio non inviato!', 'it', 'yum');
INSERT INTO `translation` VALUES('Only owner', 'Nur Besitzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Only owner', 'Sólo el dueño', 'es', 'yum');
INSERT INTO `translation` VALUES('Only owner', 'Propriétaire seulement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Only owner', 'Solo proprietario', 'it', 'yum');
INSERT INTO `translation` VALUES('Only owner', 'Ð¢Ð¾Ð»ÑŒÐºÐ¾ Ð²Ð»Ð°Ð´ÐµÐ»ÐµÑ†', 'ru', 'yum');
INSERT INTO `translation` VALUES('Only your friends are shown here', 'Nur ihre Kontakte werden hier angezeigt', 'de', 'yum');
INSERT INTO `translation` VALUES('Only your friends are shown here', 'Seuls vos contacts seront visibles ici', 'fr', 'yum');
INSERT INTO `translation` VALUES('Only your friends are shown here', 'Solo i tuoi contatti verranno visualizzati', 'it', 'yum');
INSERT INTO `translation` VALUES('Order confirmed', 'Bestellbestätigung', 'de', 'yum');
INSERT INTO `translation` VALUES('Order confirmed', 'Ordini confermati', 'it', 'yum');
INSERT INTO `translation` VALUES('Order date', 'Bestelldatum', 'de', 'yum');
INSERT INTO `translation` VALUES('Order date', 'Data ordine', 'it', 'yum');
INSERT INTO `translation` VALUES('Order membership', 'Mitgliedschaft bestellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Order membership', 'Ordine iscrizione', 'it', 'yum');
INSERT INTO `translation` VALUES('Order number', 'Bestellnummer', 'de', 'yum');
INSERT INTO `translation` VALUES('Order number', 'Numero ordine', 'it', 'yum');
INSERT INTO `translation` VALUES('Ordered at', 'Bestellt am', 'de', 'yum');
INSERT INTO `translation` VALUES('Ordered at', 'Ordinato il', 'it', 'yum');
INSERT INTO `translation` VALUES('Ordered memberships', 'Bestellte Mitgliedschaften', 'de', 'yum');
INSERT INTO `translation` VALUES('Ordered memberships', 'Options complémentaires', 'fr', 'yum');
INSERT INTO `translation` VALUES('Ordered memberships', 'Iscrizioni ordinate', 'it', 'yum');
INSERT INTO `translation` VALUES('Other', 'Verschiedenes', 'de', 'yum');
INSERT INTO `translation` VALUES('Other', 'Otro', 'es', 'yum');
INSERT INTO `translation` VALUES('Other', 'Divers', 'fr', 'yum');
INSERT INTO `translation` VALUES('Other', 'Altro', 'it', 'yum');
INSERT INTO `translation` VALUES('Other', 'PozostaÅ‚e', 'pl', 'yum');
INSERT INTO `translation` VALUES('Other Validator', 'Otro validador', 'es', 'yum');
INSERT INTO `translation` VALUES('Other Validator', 'Autre validation', 'fr', 'yum');
INSERT INTO `translation` VALUES('Other Validator', 'Altro validatore', 'it', 'yum');
INSERT INTO `translation` VALUES('Other Validator', 'Ð”Ñ€ÑƒÐ³Ð¾Ð¹ Ð²Ð°Ð»Ð¸Ð´Ð°Ñ‚Ð¾Ñ€', 'ru', 'yum');
INSERT INTO `translation` VALUES('Participant count', 'Anzahl Teilnehmer', 'de', 'yum');
INSERT INTO `translation` VALUES('Participants', 'Teilnehmer', 'de', 'yum');
INSERT INTO `translation` VALUES('Participants', 'Partecipanti', 'it', 'yum');
INSERT INTO `translation` VALUES('Password', 'Passwort', 'de', 'yum');
INSERT INTO `translation` VALUES('Password', 'Contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Password', 'Passwort', 'fr', 'yum');
INSERT INTO `translation` VALUES('Password', 'Password', 'it', 'yum');
INSERT INTO `translation` VALUES('Password', 'HasÅ‚o', 'pl', 'yum');
INSERT INTO `translation` VALUES('Password Expiration Time', 'Ablaufzeit von Passwörtern', 'de', 'yum');
INSERT INTO `translation` VALUES('Password Expiration Time', 'Tiempo de expiración de la contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Password Expiration Time', 'Durée de vie des mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Password Expiration Time', 'Scadenza password', 'it', 'yum');
INSERT INTO `translation` VALUES('Password Expiration Time', 'Czas waÅ¼noÅ›ci hasÅ‚a', 'pl', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'Passwort ist falsch.', 'de', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'Contraseña incorrecta', 'es', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'Le mot de passe est incorrect.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'Password incorretta', 'it', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'Niepoprawne hasÅ‚o.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Password is incorrect.', 'ÐÐµÐ²ÐµÑ€Ð½Ñ‹Ð¹ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Password recovery', 'Passwort wiederherstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Password recovery', 'Recuperación de contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Passwords do not match', 'Las contraseñas no coinciden', 'es', 'yum');
INSERT INTO `translation` VALUES('Payment', 'Zahlungsmethode', 'de', 'yum');
INSERT INTO `translation` VALUES('Payment', 'Pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Payment arrived', 'Zahlungseingang bestätigt', 'de', 'yum');
INSERT INTO `translation` VALUES('Payment arrived', 'Pagamento arrivato', 'it', 'yum');
INSERT INTO `translation` VALUES('Payment date', 'Bezahlt am', 'de', 'yum');
INSERT INTO `translation` VALUES('Payment date', 'Data pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Payment types', 'Zahlungsarten', 'de', 'yum');
INSERT INTO `translation` VALUES('Payment types', 'Options de paiement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Payment types', 'Tipi pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Payments', 'Zahlungsarten', 'de', 'yum');
INSERT INTO `translation` VALUES('Payments', 'Pagamenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Permissions', 'Berechtigungen', 'de', 'yum');
INSERT INTO `translation` VALUES('Permissions', 'Permisos', 'es', 'yum');
INSERT INTO `translation` VALUES('Permissions', 'Permissions', 'fr', 'yum');
INSERT INTO `translation` VALUES('Permissions', 'Autorizzazioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Please activate you account go to {activation_url}', 'Perfavore attiva il tuo accounto all''indirizzo {activation_url}', 'it', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'Bitte überprüfen Sie Ihre E-Mails. Eine Anleitung wurde an Ihre E-Mail-Adresse geschickt.', 'de', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'Por favor verifica tu e-mail a donde se han enviado más instrucciones.', 'es', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'Controlez votre boite e-mail, d autres instructions vous ont été envoyées par e-mail. *IMPORTANT:pour le cas ou notre e-mail ne vous serais pas parvenu, il est possible que notre e-mail ai été filtré par votre fournisseur  d accès internet et placà', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'Perfavore controlla la tua email con le istruzioni che ti abbiamo inviato', 'it', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'Bitte Ã¼berprÃ¼fen Sie Ihre E-Mails. Eine Anleitung wurde an Ihre E-Mail-Adresse geschickt.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please check your email. An instructions was sent to your email address.', 'ÐÐ° Ð’Ð°Ñˆ Ð°Ð´Ñ€ÐµÑ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ð¾Ð¹ Ð¿Ð¾Ñ‡Ñ‚Ñ‹ Ð±Ñ‹Ð»Ð¾ Ð¾Ñ‚Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¾ Ð¿Ð¸ÑÑŒÐ¼Ð¾ Ñ Ð¸Ð½ÑÑ‚Ñ€ÑƒÐºÑ†Ð¸ÑÐ¼Ð¸.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Please check your email. Instructions have been sent to your email address.', 'Bitte schauen Sie in Ihr Postfach. Weitere Anweisungen wurden per E-Mail geschickt.', 'de', 'yum');
INSERT INTO `translation` VALUES('Please check your email. Instructions have been sent to your email address.', 'Por favor revisa tu e-mail. Hemos enviado intrusiones a tu dirección de e-mail.', 'es', 'yum');
INSERT INTO `translation` VALUES('Please check your email. Instructions have been sent to your email address.', 'Controlez votre boite e-mail. D''autres instructions vous ont été envoyées par e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please check your email. Instructions have been sent to your email address.', 'Si prega di controllare la casella di posta. Ulteriori istruzioni sono state inviate via e-mail.', 'it', 'yum');
INSERT INTO `translation` VALUES('Please check your email. Instructions have been sent to your email address.', 'ProszÄ™ sprawdÅº TwÃ³j mejl. Instrukcje zostaÅ‚y wysÅ‚ane na TwÃ³j adres mejlowy.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please enter a request Message up to 255 characters', 'Bitte geben Sie eine Nachricht bis zu 255 Zeichen an, die dem Benutzer bei der Kontaktanfrage mitgegeben wird', 'de', 'yum');
INSERT INTO `translation` VALUES('Please enter a request Message up to 255 characters', 'Por favor escribe un mensaje no mayor a 255 caracteres', 'es', 'yum');
INSERT INTO `translation` VALUES('Please enter a request Message up to 255 characters', 'Vous pouvez ajouter un message personalisé de 255 charactères à  votre demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please enter a request Message up to 255 characters', 'Perfavore inserisci un messaggio di richiesta di massimo 255 caratteri', 'it', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'Bitte geben Sie die, oben im Bild angezeigten, Buchstaben ein.', 'de', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'Por favor escribe las letras que se muestran en la imagen.', 'es', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'Recopiez les charactères apparaissant dans l image au dessus.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'Perfavore inserire le lettere mostrate nella seguente immagine.', 'it', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'Bitte geben Sie die, oben im Bild angezeigten, Buchstaben ein.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please enter the letters as they are shown in the image above.', 'ÐŸÐ¾Ð¶Ð°Ð»ÑƒÐ¹ÑÑ‚Ð°, Ð²Ð²ÐµÐ´Ð¸Ñ‚Ðµ Ð±ÑƒÐºÐ²Ñ‹, Ð¿Ð¾ÐºÐ°Ð·Ð°Ð½Ð½Ñ‹Ðµ Ð½Ð° ÐºÐ°Ñ€Ñ‚Ð¸Ð½ÐºÐµ Ð²Ñ‹ÑˆÐµ.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email addres.', 'Perfavore inserisci il tuo username o l''indirizzo mail.', 'it', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email addres.', 'ÐŸÐ¾Ð¶Ð°Ð»ÑƒÐ¹ÑÑ‚Ð°, Ð²Ð²ÐµÐ´Ð¸Ñ‚Ðµ Ð’Ð°Ñˆ Ð»Ð¾Ð³Ð¸Ð½ Ð¸Ð»Ð¸ Ð°Ð´Ñ€ÐµÑ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ð¾Ð¹ Ð¿Ð¾Ñ‡Ñ‚Ñ‹.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email address.', 'Bitte geben Sie Ihren Benutzernamen oder E-Mail-Adresse ein.', 'de', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email address.', 'Por favor escribe tu nombre de usuario o dirección de e-mail.', 'es', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email address.', 'Indiquez dans ce champ, votre nom d utilisateur ou votre adresse e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email address.', 'Inserisci il tuo nome utente o indirizzo e-mail.', 'it', 'yum');
INSERT INTO `translation` VALUES('Please enter your login or email address.', 'Bitte geben Sie Ihren Benutzernamen oder E-Mail-Adresse ein.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please enter your password to confirm deletion:', 'Bitte geben Sie Ihr Passwort ein, um den Löschvorgang zu bestätigen:', 'de', 'yum');
INSERT INTO `translation` VALUES('Please enter your password to confirm deletion:', 'Por favor escribe tu contraseña para confirmar la eliminación:', 'es', 'yum');
INSERT INTO `translation` VALUES('Please enter your password to confirm deletion:', 'Renseignez votre mot de passe, pour confirmer la suppression:', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please enter your password to confirm deletion:', 'Si prega di inserire la password per confermare l''eliminazione:', 'it', 'yum');
INSERT INTO `translation` VALUES('Please enter your password to confirm deletion:', 'ProszÄ™ wprowadÅº swoje hasÅ‚o w celu potwierdzenia usuwania:', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please enter your user name or email address.', 'Bitte geben Sie Ihren Benutzernamen oder E-mail Adresse ein', 'de', 'yum');
INSERT INTO `translation` VALUES('Please enter your user name or email address.', 'Renseignez votre nom d utilisateur ou votre adresse e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please enter your user name or email address.', 'Inserisci il tuo nome utente o indirizzo e-mail', 'it', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'Bitte geben Sie ihre Login-Daten ein:', 'de', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'Por favor llena el formulario con tu información de inicio de sesión:', 'es', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'Entrez dans le champ vos données de connection:', 'fr', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'Perfavore inserisci le tue credenziali d''accesso:', 'it', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'Bitte geben Sie ihre Login-Daten ein:', 'pl', 'yum');
INSERT INTO `translation` VALUES('Please fill out the following form with your login credentials:', 'ÐŸÐ¾Ð¶Ð°Ð»ÑƒÐ¹ÑÑ‚Ð°, Ð·Ð°Ð¿Ð¾Ð»Ð½Ð¸Ñ‚Ðµ ÑÐ»ÐµÐ´ÑƒÑŽÑ‰ÑƒÑŽ Ñ„Ð¾Ñ€Ð¼Ñƒ Ñ Ð²Ð°ÑˆÐ¸Ð¼Ð¸ Ð›Ð¾Ð³Ð¸Ð½ Ð¸ Ð¿Ð°Ñ€Ð¾Ð»ÐµÐ¼:', 'ru', 'yum');
INSERT INTO `translation` VALUES('Please log in into the application.', 'Por favor, entra a la aplicación', 'es', 'yum');
INSERT INTO `translation` VALUES('Please verify your E-Mail address', 'Por favor verifica tu dirección de correo', 'es', 'yum');
INSERT INTO `translation` VALUES('Position', 'Position', 'de', 'yum');
INSERT INTO `translation` VALUES('Position', 'Posición', 'es', 'yum');
INSERT INTO `translation` VALUES('Position', 'Position', 'fr', 'yum');
INSERT INTO `translation` VALUES('Position', 'Posizioe', 'it', 'yum');
INSERT INTO `translation` VALUES('Position', 'ÐŸÐ¾Ð·Ð¸Ñ†Ð¸Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Predefined values (example: 1, 2, 3, 4, 5;).', 'Vordefinierter Bereich (z.B. 1, 2, 3, 4, 5),', 'de', 'yum');
INSERT INTO `translation` VALUES('Predefined values (example: 1, 2, 3, 4, 5;).', 'Valores predefinidos (ejemplo: 1,2,3,4,5;).', 'es', 'yum');
INSERT INTO `translation` VALUES('Predefined values (example: 1, 2, 3, 4, 5;).', 'Valeur prédéfinie (z.B. 1, 2, 3, 4, 5),', 'fr', 'yum');
INSERT INTO `translation` VALUES('Predefined values (example: 1, 2, 3, 4, 5;).', 'Valori predefiniti (es. 1, 2, 3, 4, 5),', 'it', 'yum');
INSERT INTO `translation` VALUES('Predefined values (example: 1, 2, 3, 4, 5;).', 'ÐŸÑ€ÐµÐ´Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ñ (Ð¿Ñ€Ð¸Ð¼ÐµÑ€: 1;2;3;4;5;).', 'ru', 'yum');
INSERT INTO `translation` VALUES('Preseve Profiles', 'Profile aufbewahren', 'de', 'yum');
INSERT INTO `translation` VALUES('Preseve Profiles', 'Preservar Perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Preseve Profiles', 'Sauvegarder les Profiles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Preseve Profiles', 'Mantieni profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Preseve Profiles', 'Zachowaj profil', 'pl', 'yum');
INSERT INTO `translation` VALUES('Price', 'Preis', 'de', 'yum');
INSERT INTO `translation` VALUES('Price', 'Prix', 'fr', 'yum');
INSERT INTO `translation` VALUES('Price', 'Prezzo', 'it', 'yum');
INSERT INTO `translation` VALUES('Privacy', 'Privatsphäre', 'de', 'yum');
INSERT INTO `translation` VALUES('Privacy', 'Privacidad', 'es', 'yum');
INSERT INTO `translation` VALUES('Privacy', 'Données privées', 'fr', 'yum');
INSERT INTO `translation` VALUES('Privacy', 'Privacy', 'it', 'yum');
INSERT INTO `translation` VALUES('Privacy', 'PrivatsphÃ¤re', 'pl', 'yum');
INSERT INTO `translation` VALUES('Privacy settings', 'Privatsphäre', 'de', 'yum');
INSERT INTO `translation` VALUES('Privacy settings', 'Configuración de Privacidad', 'es', 'yum');
INSERT INTO `translation` VALUES('Privacy settings', 'Vos données personnelles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Privacy settings', 'Privacy', 'it', 'yum');
INSERT INTO `translation` VALUES('Privacy settings for {username}', 'Privatsphäreneinstellungen für {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('Privacy settings for {username}', 'Configuración de Privacidad para {username}', 'es', 'yum');
INSERT INTO `translation` VALUES('Privacy settings for {username}', 'Configuration des données privées pour {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Privacy settings for {username}', 'Opzioni Privacy per {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('Privacysettings', 'Privatsphäre', 'de', 'yum');
INSERT INTO `translation` VALUES('Privacysettings', 'Configuración de Privacidad', 'es', 'yum');
INSERT INTO `translation` VALUES('Privacysettings', 'Données privées', 'fr', 'yum');
INSERT INTO `translation` VALUES('Privacysettings', 'Opzioni privacy', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile', 'Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile', 'Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile', 'Profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile', 'Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile', 'Profil', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile', 'ÐŸÑ€Ð¾Ñ„Ð¸Ð»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Profile Comments', 'Pinnwand', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile Comments', 'COmentarios de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile Comments', 'Commentaires du profile', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile Comments', 'Commenti profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'Profilfelder', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'Campos de Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'Champs des profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'Campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'Pola profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile Fields', 'ÐŸÐ¾Ð»Ñ Ð¿Ñ€Ð¾Ñ„Ð¸Ð»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Profile field groups', 'Profilfeldgruppen', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile field groups', 'Grupos de campos de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile field groups', 'Champs des profils de groupes.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile field groups', 'Campo profilo gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile field public options', 'Einstellungen der Profilfelder', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile field public options', 'Configuration des champs publique du profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile field public options', 'Opzioni pubbliche campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile field {fieldname}', 'Profilfeld {fieldname}', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile field {fieldname}', 'Campo de perfil {fieldname}', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile field {fieldname}', 'Camp de profil {fieldname}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile field {fieldname}', '{fieldname} campo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile field {fieldname}', 'Pole profilu {fieldname}', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile fields', 'Profilfeldverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile fields', 'Campos de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile fields', 'Gestion des champs de profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile fields', 'Campi profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile fields', 'Pole profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile fields groups', 'Profilfeldgruppen', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile fields groups', 'Grupos de campos de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile fields groups', 'Champ des profils de groupes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile fields groups', 'Campi profilo gruppi', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile fields groups', 'Grupy pÃ³l w profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile history', 'Profilverlauf', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile history', 'Historial del perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile history', 'Chronique du profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile history', 'Storico profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile history', 'Historia profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile number', 'Profilnummer: ', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile number', 'Número de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile number', 'Numéro du profil: ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile number', 'Numero profilo: ', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile number', 'Numer profilu: ', 'pl', 'yum');
INSERT INTO `translation` VALUES('Profile of ', 'Profil von ', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile of ', 'Perfil de', 'es', 'yum');
INSERT INTO `translation` VALUES('Profile of ', 'Profil de ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile of ', 'Profilo di ', 'it', 'yum');
INSERT INTO `translation` VALUES('Profile visits', 'Profilbesuche', 'de', 'yum');
INSERT INTO `translation` VALUES('Profile visits', 'Visiteurs de mon profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profile visits', 'Visite profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Profiles', 'Profile', 'de', 'yum');
INSERT INTO `translation` VALUES('Profiles', 'Perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Profiles', 'Profiles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Profiles', 'Profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Profiles', 'Profile', 'pl', 'yum');
INSERT INTO `translation` VALUES('Range', 'Bereich', 'de', 'yum');
INSERT INTO `translation` VALUES('Range', 'Rango', 'es', 'yum');
INSERT INTO `translation` VALUES('Range', 'Intervallo', 'it', 'yum');
INSERT INTO `translation` VALUES('Range', 'Ð ÑÐ´ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ð¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Read Only Profiles', 'Nur-Lese Profile', 'de', 'yum');
INSERT INTO `translation` VALUES('Read Only Profiles', 'Perfiles de Sólo Lectura', 'es', 'yum');
INSERT INTO `translation` VALUES('Read Only Profiles', 'Lecture seule des profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Read Only Profiles', 'Profilo sola lettura', 'it', 'yum');
INSERT INTO `translation` VALUES('Read Only Profiles', 'Profile tylko do odczytu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Receive a Email for new Friendship request', 'E-Mail Benachrichtigung bei neuer Kontaktanfrage', 'de', 'yum');
INSERT INTO `translation` VALUES('Receive a Email for new Friendship request', 'Recibir un correo cuando recibas una nueva solicitud de amistad', 'es', 'yum');
INSERT INTO `translation` VALUES('Receive a Email for new Friendship request', 'Informez moi par e-mail pour les nouvelles demandes de contact.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Receive a Email for new Friendship request', 'Email di notifica per nuovo contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when a new profile comment was made', 'E-Mail Benachrichtigung bei Profilkommentar', 'de', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when a new profile comment was made', 'Recibir un correo cuando comenten en tu perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when a new profile comment was made', 'Informez moi par e-mail e-mail pour les nouveaux commentaire de mon profil ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when a new profile comment was made', 'Email di notifica per nuovo commento al profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when new Message arrives', 'E-Mail Benachrichtigung bei neuer interner Nachricht', 'de', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when new Message arrives', 'Recibir un correo cuanto te llegue un nuevo mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when new Message arrives', 'Informez moi par e-mail pour les nouveaux messages. ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Receive a Email when new Message arrives', 'Email di notifica per i nuovi messaggi', 'it', 'yum');
INSERT INTO `translation` VALUES('Registered users', 'Registrierte Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Registered users', 'Usuarios registrados', 'es', 'yum');
INSERT INTO `translation` VALUES('Registered users', 'Membre enregistré', 'fr', 'yum');
INSERT INTO `translation` VALUES('Registered users', 'Utenti registrati', 'it', 'yum');
INSERT INTO `translation` VALUES('Registered users', 'Ð—Ð°Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ñ‹Ðµ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Registrierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Registro', 'es', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Reistrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Rejestracja', 'pl', 'yum');
INSERT INTO `translation` VALUES('Registration', 'Ð ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Anmeldedatum', 'de', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Fecha de registro', 'es', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Date d''inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Data registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Anmeldedatum', 'pl', 'yum');
INSERT INTO `translation` VALUES('Registration date', 'Ð”Ð°Ñ‚Ð° Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Regular expression (example: ''/^[A-Za-z0-9s,]+$/u'').', 'Regulärer Ausdruck (z. B.: ''/^[A-Za-z0-9s,]+$/u'')', 'de', 'yum');
INSERT INTO `translation` VALUES('Regular expression (example: ''/^[A-Za-z0-9s,]+$/u'').', 'Expresión regular (ejemplo: ''/^[A-Za-z0-9s,]+$/u'')', 'es', 'yum');
INSERT INTO `translation` VALUES('Regular expression (example: ''/^[A-Za-z0-9s,]+$/u'').', 'Expression regulière (exemple.: ''/^[A-Za-z0-9s,]+$/u'')', 'fr', 'yum');
INSERT INTO `translation` VALUES('Regular expression (example: ''/^[A-Za-z0-9s,]+$/u'').', 'Espressione regolare (esempio: ''/^[A-Za-z0-9s,]+$/u'')', 'it', 'yum');
INSERT INTO `translation` VALUES('Regular expression (example: ''/^[A-Za-z0-9s,]+$/u'').', 'Ð ÐµÐ³ÑƒÐ»ÑÑ€Ð½Ñ‹Ðµ Ð²Ñ‹Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ (Ð¿Ñ€Ð¸Ð¼ÐµÑ€: ''/^[A-Za-z0-9s,]+$/u'')', 'ru', 'yum');
INSERT INTO `translation` VALUES('Remember me net time', 'ZapamiÄ™taj mnie nastÄ™pnym razem', 'pl', 'yum');
INSERT INTO `translation` VALUES('Remember me next time', 'Angemeldet bleiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Remember me next time', 'Recordarme la próxima vez', 'es', 'yum');
INSERT INTO `translation` VALUES('Remember me next time', 'Rester connecté', 'fr', 'yum');
INSERT INTO `translation` VALUES('Remember me next time', 'Ricordami', 'it', 'yum');
INSERT INTO `translation` VALUES('Remember me next time', 'Ð—Ð°Ð¿Ð¾Ð¼Ð½Ð¸Ñ‚ÑŒ Ð¼ÐµÐ½Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Remove', 'Entfernen', 'de', 'yum');
INSERT INTO `translation` VALUES('Remove', 'Supprimer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Remove', 'Rimuovi', 'it', 'yum');
INSERT INTO `translation` VALUES('Remove Avatar', 'Profilbild entfernen', 'de', 'yum');
INSERT INTO `translation` VALUES('Remove Avatar', 'Borrar este Avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('Remove Avatar', 'Supprimer l image de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Remove Avatar', 'Rimuovi avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Remove comment', 'Kommentar entfernen', 'de', 'yum');
INSERT INTO `translation` VALUES('Remove comment', 'Borrar comentario', 'es', 'yum');
INSERT INTO `translation` VALUES('Remove comment', 'Supprimer ce commentaire', 'fr', 'yum');
INSERT INTO `translation` VALUES('Remove comment', 'Rimuovi commento', 'it', 'yum');
INSERT INTO `translation` VALUES('Remove friend', 'Freundschaft kündigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Remove friend', 'Borrar amigo', 'es', 'yum');
INSERT INTO `translation` VALUES('Remove friend', 'Supprimer ce contact de ma liste', 'fr', 'yum');
INSERT INTO `translation` VALUES('Remove friend', 'Rimuovi contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('Reply', 'Antwort', 'de', 'yum');
INSERT INTO `translation` VALUES('Reply', 'Responder', 'es', 'yum');
INSERT INTO `translation` VALUES('Reply', 'Répondre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Reply', 'Rispondi', 'it', 'yum');
INSERT INTO `translation` VALUES('Reply', 'Odpowiedz', 'pl', 'yum');
INSERT INTO `translation` VALUES('Reply to Message', 'auf diese Nachricht antworten', 'de', 'yum');
INSERT INTO `translation` VALUES('Reply to Message', 'Responder al Mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Reply to Message', 'Répondre à  ce message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Reply to Message', 'Rispondi al messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Reply to Message', 'Odpowiedz', 'pl', 'yum');
INSERT INTO `translation` VALUES('Reply to message', 'Responder al mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Reply to message', 'Rispondi al messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Request friendship for user {username}', 'Kontaktanfrage für {username}', 'de', 'yum');
INSERT INTO `translation` VALUES('Request friendship for user {username}', 'Solicitar amistar al usuario {username}', 'es', 'yum');
INSERT INTO `translation` VALUES('Request friendship for user {username}', 'Demande de contact pour {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('Request friendship for user {username}', 'Richiesta contatto per {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('Required', 'Benötigt', 'de', 'yum');
INSERT INTO `translation` VALUES('Required', 'Requerido', 'es', 'yum');
INSERT INTO `translation` VALUES('Required', 'Recquis', 'fr', 'yum');
INSERT INTO `translation` VALUES('Required', 'Obbligatorio', 'it', 'yum');
INSERT INTO `translation` VALUES('Required', 'ÐžÐ±ÑÐ·Ð°Ñ‚ÐµÐ»ÑŒÐ½Ð¾ÑÑ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Required field (form validator).', 'Campo obbligatorio (validazione form).', 'it', 'yum');
INSERT INTO `translation` VALUES('Required field (form validator).', 'ÐžÐ±ÑÐ·Ð°Ñ‚ÐµÐ»ÑŒÐ½Ð¾Ðµ Ð¿Ð¾Ð»Ðµ (Ð¿Ñ€Ð¾Ð²ÐµÑ€ÐºÐ° Ñ„Ð¾Ñ€Ð¼Ñ‹).', 'ru', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Wiederherstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Recuperar', 'es', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Restaurer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Ripristino', 'it', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Wiederherstellen', 'pl', 'yum');
INSERT INTO `translation` VALUES('Restore', 'Ð’Ð¾ÑÑÑ‚Ð°Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Retype Password', 'ÐŸÐ¾Ð²Ñ‚Ð¾Ñ€Ð¸Ñ‚Ðµ Ð¿Ð°Ñ€Ð¾Ð»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Retype Password is incorrect.', 'ÐŸÐ°Ñ€Ð¾Ð»Ð¸ Ð½Ðµ ÑÐ¾Ð²Ð¿Ð°Ð´Ð°ÑŽÑ‚.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Retype password', 'Passwort wiederholen', 'de', 'yum');
INSERT INTO `translation` VALUES('Retype password', 'Repite la contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('Retype password', 'Redonnez votre mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Retype password', 'Conferma password', 'it', 'yum');
INSERT INTO `translation` VALUES('Retype password', 'Passwort wiederholen', 'pl', 'yum');
INSERT INTO `translation` VALUES('Retype password is incorrect.', 'Wiederholtes Passwort ist falsch.', 'de', 'yum');
INSERT INTO `translation` VALUES('Retype password is incorrect.', 'Contraseña repetida incorrecta', 'es', 'yum');
INSERT INTO `translation` VALUES('Retype password is incorrect.', 'Le mot de passe est a nouveau incorrect.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Retype password is incorrect.', 'Conferma password Ã¨ errata.', 'it', 'yum');
INSERT INTO `translation` VALUES('Retype password is incorrect.', 'Wiederholtes Passwort ist falsch.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Retype your new password', 'Wiederholen Sie Ihr neues Passwort', 'de', 'yum');
INSERT INTO `translation` VALUES('Retype your new password', 'Confirmez votre nouveau mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Retype your new password', 'Confermare la nuova password', 'it', 'yum');
INSERT INTO `translation` VALUES('Retyped password is incorrect', 'Wiederholtes Passwort ist nicht identisch', 'de', 'yum');
INSERT INTO `translation` VALUES('Retyped password is incorrect', 'Le mot de passe renseigné n est pas identique au précédent', 'fr', 'yum');
INSERT INTO `translation` VALUES('Retyped password is incorrect', 'Password di conferma non identica', 'it', 'yum');
INSERT INTO `translation` VALUES('Role Administration', 'Rollenverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('Role Administration', 'Administración de rol', 'es', 'yum');
INSERT INTO `translation` VALUES('Role Administration', 'Gestion des rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Role Administration', 'Gestione dei ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('Role Administration', 'ZarzÄ…dzanie rolami', 'pl', 'yum');
INSERT INTO `translation` VALUES('Roles', 'Rollen', 'de', 'yum');
INSERT INTO `translation` VALUES('Roles', 'Roles', 'es', 'yum');
INSERT INTO `translation` VALUES('Roles', 'Rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Roles', 'Ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('Roles', 'Role', 'pl', 'yum');
INSERT INTO `translation` VALUES('Roles / Access control', 'Rollen / Zugangskontrolle', 'de', 'yum');
INSERT INTO `translation` VALUES('Save', 'Sichern', 'de', 'yum');
INSERT INTO `translation` VALUES('Save', 'Guardar', 'es', 'yum');
INSERT INTO `translation` VALUES('Save', 'Mémoriser', 'fr', 'yum');
INSERT INTO `translation` VALUES('Save', 'Salva', 'it', 'yum');
INSERT INTO `translation` VALUES('Save', 'Sichern', 'pl', 'yum');
INSERT INTO `translation` VALUES('Save', 'Ð¡Ð¾Ñ…Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Save payment type', 'Zahlungsart speichern', 'de', 'yum');
INSERT INTO `translation` VALUES('Save payment type', 'Salva tipo pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Save profile changes', 'Profiländerungen speichern', 'de', 'yum');
INSERT INTO `translation` VALUES('Save profile changes', 'Salva modifiche profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Save role', 'Rolle speichern', 'de', 'yum');
INSERT INTO `translation` VALUES('Save role', 'Mémoriser ce rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('Save role', 'Salva ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Search for username', 'Suche nach Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('Search for username', 'Recherche par nom d''utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Search for username', 'Cerca per username', 'it', 'yum');
INSERT INTO `translation` VALUES('Searchable', 'Suchbar', 'de', 'yum');
INSERT INTO `translation` VALUES('Searchable', 'visible', 'fr', 'yum');
INSERT INTO `translation` VALUES('Searchable', 'Ricercabile', 'it', 'yum');
INSERT INTO `translation` VALUES('Select a month', 'Monatsauswahl', 'de', 'yum');
INSERT INTO `translation` VALUES('Select a month', 'Seleziona un mese', 'it', 'yum');
INSERT INTO `translation` VALUES('Select multiple recipients by holding the CTRL key', 'Wählen Sie mehrere Empfänger mit der STRG-Taste aus', 'de', 'yum');
INSERT INTO `translation` VALUES('Select multiple recipients by holding the CTRL key', 'Selecciona varios destinatarios manteniendo presionada la tecla CTRL', 'es', 'yum');
INSERT INTO `translation` VALUES('Select multiple recipients by holding the CTRL key', 'Choix multiple en laissant la touche STRG de votre clavier enfoncée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Select multiple recipients by holding the CTRL key', 'Seleziona destinatari multipli con il tasto CTRL', 'it', 'yum');
INSERT INTO `translation` VALUES('Select the fields that should be public', 'Diese Felder sind öffentlich einsehbar', 'de', 'yum');
INSERT INTO `translation` VALUES('Select the fields that should be public', 'Ces champs sont publiques et seront visibles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Select the fields that should be public', 'Scegli i campi da rendere publici', 'it', 'yum');
INSERT INTO `translation` VALUES('Selectable on registration', 'Während der Registrierung wählbar', 'de', 'yum');
INSERT INTO `translation` VALUES('Selectable on registration', 'Option à  selectionner au cours de l inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('Selectable on registration', 'Selezionabile durante la registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Send', 'Senden', 'de', 'yum');
INSERT INTO `translation` VALUES('Send', 'Enviar', 'es', 'yum');
INSERT INTO `translation` VALUES('Send', 'Envoyer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Send', 'Invia', 'it', 'yum');
INSERT INTO `translation` VALUES('Send', 'Senden', 'pl', 'yum');
INSERT INTO `translation` VALUES('Send a message to this User', 'Diesem Benutzer eine Nachricht senden', 'de', 'yum');
INSERT INTO `translation` VALUES('Send a message to this User', 'Enviar un mensaje a este Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Send a message to this User', 'Faire parvenir un message à  ce membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Send a message to this User', 'Invia messaggio all''utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Send invitation', 'Kontaktanfrage senden', 'de', 'yum');
INSERT INTO `translation` VALUES('Send invitation', 'Enviar invitación', 'es', 'yum');
INSERT INTO `translation` VALUES('Send invitation', 'Envoyer la demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Send invitation', 'Kontaktanfrage senden', 'it', 'yum');
INSERT INTO `translation` VALUES('Send message notifier emails', 'Benachrichtigungen schicken', 'de', 'yum');
INSERT INTO `translation` VALUES('Send message notifier emails', 'Enviar mensaje de e-mail de notificación', 'es', 'yum');
INSERT INTO `translation` VALUES('Send message notifier emails', 'Envoie d une notification', 'fr', 'yum');
INSERT INTO `translation` VALUES('Send message notifier emails', 'Notifiche e-mail', 'it', 'yum');
INSERT INTO `translation` VALUES('Sent at', 'Gesendet am', 'de', 'yum');
INSERT INTO `translation` VALUES('Sent at', 'Enviado al', 'es', 'yum');
INSERT INTO `translation` VALUES('Sent at', 'Envoyé le', 'fr', 'yum');
INSERT INTO `translation` VALUES('Sent at', 'Pubblicato il', 'it', 'yum');
INSERT INTO `translation` VALUES('Sent at', 'WysÅ‚ano', 'pl', 'yum');
INSERT INTO `translation` VALUES('Sent messages', 'Gesendete Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('Sent messages', 'Mensajes enviados', 'es', 'yum');
INSERT INTO `translation` VALUES('Sent messages', 'Message envoyé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Sent messages', 'Messaggi inviati', 'it', 'yum');
INSERT INTO `translation` VALUES('Sent messages', 'WysÅ‚ane wiadomoÅ›ci', 'pl', 'yum');
INSERT INTO `translation` VALUES('Separate usernames with comma to ignore specified users', 'Benutzernamen mit Komma trennen, um sie zu ignorieren', 'de', 'yum');
INSERT INTO `translation` VALUES('Separate usernames with comma to ignore specified users', 'Separa con coma los nombres de los usuarios que deseas ignorar', 'es', 'yum');
INSERT INTO `translation` VALUES('Separate usernames with comma to ignore specified users', 'Ma liste noire, pour introduire plusieurs membres en une seule fois, séparer les noms d''utilisateur avec une virgule', 'fr', 'yum');
INSERT INTO `translation` VALUES('Separate usernames with comma to ignore specified users', 'Separa gli username con una virgola, per ignorare gli utenti specificati', 'it', 'yum');
INSERT INTO `translation` VALUES('Set payment date to today', 'Zahlungseingang bestätigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Set payment date to today', 'Imposta data pagamento ad oggi', 'it', 'yum');
INSERT INTO `translation` VALUES('Settings', 'Einstellungen', 'de', 'yum');
INSERT INTO `translation` VALUES('Settings', 'Ajustes', 'es', 'yum');
INSERT INTO `translation` VALUES('Settings', 'Réglage', 'fr', 'yum');
INSERT INTO `translation` VALUES('Settings', 'Impostazioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Settings', 'Ustawienia', 'pl', 'yum');
INSERT INTO `translation` VALUES('Settings profiles', 'Einstellungsprofile', 'de', 'yum');
INSERT INTO `translation` VALUES('Settings profiles', 'Ajustes de perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('Settings profiles', 'Réglages des profiles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Settings profiles', 'Impostazioni profili', 'it', 'yum');
INSERT INTO `translation` VALUES('Settings profiles', 'Ustawienia profili', 'pl', 'yum');
INSERT INTO `translation` VALUES('Show activities', 'Zeige Aktivitäten', 'de', 'yum');
INSERT INTO `translation` VALUES('Show activities', 'Voir la chronique des activités', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show activities', 'Mostra attivitÃ ', 'it', 'yum');
INSERT INTO `translation` VALUES('Show administration Hierarchy', 'Hierarchie', 'de', 'yum');
INSERT INTO `translation` VALUES('Show administration Hierarchy', 'Mostrar jerarquía de administración', 'es', 'yum');
INSERT INTO `translation` VALUES('Show administration Hierarchy', 'Hierarchie', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show administration Hierarchy', 'Gerarchia', 'it', 'yum');
INSERT INTO `translation` VALUES('Show administration Hierarchy', 'PokaÅ¼ hierarchiÄ™ administrowania', 'pl', 'yum');
INSERT INTO `translation` VALUES('Show all', 'Mostra tutti', 'it', 'yum');
INSERT INTO `translation` VALUES('Show friends', 'Kontaktliste veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show friends', 'Mostrar amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('Show friends', 'Rendre ma liste de contacts visible', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show friends', 'Mostra contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('Show my online status to everyone', 'Meinen Online-Status veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show my online status to everyone', 'Montrer lorsque je suis en ligne', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show my online status to everyone', 'Mostra il mio stato a tutti', 'it', 'yum');
INSERT INTO `translation` VALUES('Show online status', 'Online-Status anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show online status', 'Status en ligne visible', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show online status', 'Mostra lo stato online', 'it', 'yum');
INSERT INTO `translation` VALUES('Show permissions', 'Berechtigungen anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show permissions', 'Mostrar permisos', 'es', 'yum');
INSERT INTO `translation` VALUES('Show permissions', 'Montrer les permissions', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show permissions', 'Mostra autorizzazioni', 'it', 'yum');
INSERT INTO `translation` VALUES('Show profile visits', 'Profilbesuche anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show profile visits', 'Mostrar perfil de visitas', 'es', 'yum');
INSERT INTO `translation` VALUES('Show profile visits', 'Montrer les visites de profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show profile visits', 'Visualizza visite profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Show roles', 'Rollen anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show roles', 'Mostrar roles', 'es', 'yum');
INSERT INTO `translation` VALUES('Show roles', 'Voir les rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show roles', 'Mostra ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('Show roles', 'PokaÅ¼ role', 'pl', 'yum');
INSERT INTO `translation` VALUES('Show the owner when i visit his profile', 'Dem Profileigentümer erkenntlich machen, wenn ich sein Profil besuche', 'de', 'yum');
INSERT INTO `translation` VALUES('Show the owner when i visit his profile', 'Montrer aux propriétaires des profils lorsque je consulte leur profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show the owner when i visit his profile', 'Mostra al proprietario quando visito il suo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Show users', 'Benutzer anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Show users', 'Mostrar usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Show users', 'Voir les membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Show users', 'Mostra utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Show users', 'PokaÅ¼ uÅ¼ytkownikow', 'pl', 'yum');
INSERT INTO `translation` VALUES('Statistics', 'Benutzerstatistik', 'de', 'yum');
INSERT INTO `translation` VALUES('Statistics', 'Estadísticas', 'es', 'yum');
INSERT INTO `translation` VALUES('Statistics', 'Statistiques des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Statistics', 'Statistiche', 'it', 'yum');
INSERT INTO `translation` VALUES('Statistics', 'Statystyki', 'pl', 'yum');
INSERT INTO `translation` VALUES('Status', 'Status', 'de', 'yum');
INSERT INTO `translation` VALUES('Status', 'Estado', 'es', 'yum');
INSERT INTO `translation` VALUES('Status', 'Status', 'fr', 'yum');
INSERT INTO `translation` VALUES('Status', 'Stato', 'it', 'yum');
INSERT INTO `translation` VALUES('Status', 'Status', 'pl', 'yum');
INSERT INTO `translation` VALUES('Status', 'Ð¡Ñ‚Ð°Ñ‚ÑƒÑ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Street', 'Straße', 'de', 'yum');
INSERT INTO `translation` VALUES('Street', 'Calle', 'es', 'yum');
INSERT INTO `translation` VALUES('Street', 'Rue', 'fr', 'yum');
INSERT INTO `translation` VALUES('Street', 'Indirizzo', 'it', 'yum');
INSERT INTO `translation` VALUES('Street', 'Ulica', 'pl', 'yum');
INSERT INTO `translation` VALUES('Subject', 'Titel', 'de', 'yum');
INSERT INTO `translation` VALUES('Subject', 'Sujet', 'fr', 'yum');
INSERT INTO `translation` VALUES('Subject', 'Oggetto', 'it', 'yum');
INSERT INTO `translation` VALUES('Success', 'Erfolgreich', 'de', 'yum');
INSERT INTO `translation` VALUES('Success', 'Exitoso', 'es', 'yum');
INSERT INTO `translation` VALUES('Success', 'Réussi', 'fr', 'yum');
INSERT INTO `translation` VALUES('Success', 'Successo', 'it', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Superuser', 'de', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Superusuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Superuser', 'fr', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Superuser', 'it', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Superuser', 'pl', 'yum');
INSERT INTO `translation` VALUES('Superuser', 'Ð¡ÑƒÐ¿ÐµÑ€ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Text Email Activation', 'Text Email Konto-Aktivierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Email Activation', 'Texto de activación por correo', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Email Activation', 'Texte contenu dans l e-mail d activation de compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Email Activation', 'Testo email d''attivazione account', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Email Recovery', 'Text E-Mail Passwort wiederherstellen', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Email Recovery', 'Texto de recuperación de contraseña por correo', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Email Recovery', 'Texte contenu dans l e-Mail de renouvellement de mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Email Recovery', 'Testo email recupero password', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Email Registration', 'Text E-Mail Registrierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Email Registration', 'Texto de registro por correo', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Email Registration', 'Texte contenu dans l e-Mail d enregistrement', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Email Registration', 'Testo email di registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Login Footer', 'Text im Login-footer', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Login Footer', 'Text im Login-footer', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Login Footer', 'Texte affiché dans le pied de page du login', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Login Footer', 'Testo nel piepagina del login', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Login Header', 'Text im Login-header', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Login Header', 'Text im Login-header', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Login Header', 'Texte de connection-header', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Login Header', 'Testo nell''intestazione del login', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Registration Footer', 'Text im Registrierung-footer', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Registration Footer', 'Text im Registrierung-footer', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Registration Footer', 'Texte d enregistrement-footer', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Registration Footer', 'Testo nel piepagina della registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Text Registration Header', 'Text im Registrierung-header', 'de', 'yum');
INSERT INTO `translation` VALUES('Text Registration Header', 'Text im Registrierung-header', 'es', 'yum');
INSERT INTO `translation` VALUES('Text Registration Header', 'Texte d enregistrement-header', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text Registration Header', 'Testo nell''intestazione della registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Text for new friendship request', 'Text für eine neue Kontaktanfrage', 'de', 'yum');
INSERT INTO `translation` VALUES('Text for new friendship request', 'Text für eine neue Kontaktanfrage', 'es', 'yum');
INSERT INTO `translation` VALUES('Text for new friendship request', 'Texte pour une nouvelle demande de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text for new friendship request', 'Testo per una nuova richiesta di contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('Text for new profile comment', 'Text für neuen Profilkommentar', 'de', 'yum');
INSERT INTO `translation` VALUES('Text for new profile comment', 'Text für neuen Profilkommentar', 'es', 'yum');
INSERT INTO `translation` VALUES('Text for new profile comment', 'Texte pour un nouveau commentaire dans un profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Text for new profile comment', 'Testo per un nuovo commento al profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Text translations', 'Übersetzungstexte', 'de', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Contact Admin to activate your account.', 'Grazie per la tua registrazione. Contatta l''ammnistratore per attivare l''account', 'it', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email or login.', 'Vielen Dank für Ihre Anmeldung. Bitte überprüfen Sie Ihre E-Mails oder loggen Sie sich ein.', 'de', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email or login.', 'Merci pour votre inscription. Controlez votre boite e-mail, le code d''activation de votre compte vous a été envoyé par e-mail. Attention! Par mesure de sécurité, le lien contenu dans ce mail, n est valable que 48h', 'fr', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email or login.', 'Grazie per la tua registrazione, controlla la tua email o effettua il login,', 'it', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email or login.', 'Vielen Dank fÃ¼r Ihre Anmeldung. Bitte Ã¼berprÃ¼fen Sie Ihre E-Mails oder loggen Sie sich ein.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email or login.', 'Ð ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ñ Ð·Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð°. ÐŸÐ¾Ð¶Ð°Ð»ÑƒÐ¹ÑÑ‚Ð° Ð¿Ñ€Ð¾Ð²ÐµÑ€ÑŒÑ‚Ðµ ÑÐ²Ð¾Ð¹ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ñ‹Ð¹ ÑÑ‰Ð¸Ðº Ð¸Ð»Ð¸ Ð²Ñ‹Ð¿Ð¾Ð»Ð½Ð¸Ñ‚Ðµ Ð²Ñ…Ð¾Ð´.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Vielen Dank für Ihre Anmeldung. Bitte überprüfen Sie Ihre E-Mails.', 'de', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Gracias por su registro. Por favor revise su email.', 'es', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Merci pour votre inscription. Controlez votre boite e-mail, le code d activation de votre compte vous a été envoyé par e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Grazie per la tua registrazione, controlla la tua email,', 'it', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Vielen Dank fÃ¼r Ihre Anmeldung. Bitte Ã¼berprÃ¼fen Sie Ihre E-Mails.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please check your email.', 'Ð ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ñ Ð·Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð°. ÐŸÐ¾Ð¶Ð°Ð»ÑƒÐ¹ÑÑ‚Ð° Ð¿Ñ€Ð¾Ð²ÐµÑ€ÑŒÑ‚Ðµ ÑÐ²Ð¾Ð¹ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ñ‹Ð¹ ÑÑ‰Ð¸Ðº.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Thank you for your registration. Please login.', 'Grazie per la tua registrazone. Effettua il login.', 'it', 'yum');
INSERT INTO `translation` VALUES('The comment has been saved', 'Der Kommentar wurde gespeichert', 'de', 'yum');
INSERT INTO `translation` VALUES('The comment has been saved', 'Der Kommentar wurde gespeichert', 'es', 'yum');
INSERT INTO `translation` VALUES('The comment has been saved', 'Le commentaire a bien été mémorisé', 'fr', 'yum');
INSERT INTO `translation` VALUES('The comment has been saved', 'Il commento Ã¨ stato salvato', 'it', 'yum');
INSERT INTO `translation` VALUES('The file "{file}" is not an image.', 'Die Datei {file} ist kein Bild.', 'de', 'yum');
INSERT INTO `translation` VALUES('The file "{file}" is not an image.', 'Este archivo {file} no es una imagen.', 'es', 'yum');
INSERT INTO `translation` VALUES('The file "{file}" is not an image.', 'DLe fichier {file} n est pas un fichier image.', 'fr', 'yum');
INSERT INTO `translation` VALUES('The file "{file}" is not an image.', 'Il file {file} non Ã¨ un''immagine.', 'it', 'yum');
INSERT INTO `translation` VALUES('The friendship request has been sent', 'Die Kontaktanfrage wurde gesendet', 'de', 'yum');
INSERT INTO `translation` VALUES('The friendship request has been sent', 'Votre demande de contact à  bien été envoyée', 'fr', 'yum');
INSERT INTO `translation` VALUES('The friendship request has been sent', 'La richiesta di contatto Ã¨ stata inviata', 'it', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" height should be "{height}px".', 'Die Datei {file} muss genau {height}px hoch sein.', 'de', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" height should be "{height}px".', 'La imagen {file} debe tener {height}px de largo.', 'es', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" height should be "{height}px".', 'La photo {file} doit avoir une hauteur maximum de {height}px .', 'fr', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" height should be "{height}px".', 'L''immagine {file} deve essere {height}px.', 'it', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" width should be "{width}px".', 'Die Datei {file} muss genau {width}px breit sein.', 'de', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" width should be "{width}px".', 'La imagen {file} debe tener {width}px de ancho.', 'es', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" width should be "{width}px".', 'La photo {file} doit avoir une largeur maximum de {width}px .', 'fr', 'yum');
INSERT INTO `translation` VALUES('The image "{file}" width should be "{width}px".', 'L''immagine {file} deve essere larga {width}px.', 'it', 'yum');
INSERT INTO `translation` VALUES('The image has been resized to {max_pixel}px width successfully', 'Das Bild wurde beim hochladen automatisch auf eine Breite von {max_pixel} skaliert', 'de', 'yum');
INSERT INTO `translation` VALUES('The image has been resized to {max_pixel}px width successfully', 'Votre photo de profil a été retaillée automatiquement à  une taille de{max_pixel}', 'fr', 'yum');
INSERT INTO `translation` VALUES('The image has been resized to {max_pixel}px width successfully', 'Immagine ridimensionata a {max_pixel}px con successo.', 'it', 'yum');
INSERT INTO `translation` VALUES('The image should have at least 50px and a maximum of 200px in width and height. Supported filetypes are .jpg, .gif and .png', 'das Bild sollte mindestens 50px und maximal 200px in der Höhe und Breite betragen. Mögliche Dateitypen sind .jpg, .gif und .png', 'de', 'yum');
INSERT INTO `translation` VALUES('The image should have at least 50px and a maximum of 200px in width and height. Supported filetypes are .jpg, .gif and .png', 'La imagen debe tener un mínimo de 50px y un máximo de 200px de ancho y largo. Los tipos de archivo soportados son .jpg, .gif y .png', 'es', 'yum');
INSERT INTO `translation` VALUES('The image should have at least 50px and a maximum of 200px in width and height. Supported filetypes are .jpg, .gif and .png', 'La foto chargée doit avoir une largeur maximum de 50px  et une hauteur maximale de 200px. Les fichiers acceptés sont; .jpg, .gif und .png', 'fr', 'yum');
INSERT INTO `translation` VALUES('The image should have at least 50px and a maximum of 200px in width and height. Supported filetypes are .jpg, .gif and .png', 'L''immagine deve essere almeno 50px e massimo 200px in larghezza e altezza. Tipi di file supportati .jpg, .gif e .png', 'it', 'yum');
INSERT INTO `translation` VALUES('The image was uploaded successfully', 'Das Bild wurde erfolgreich hochgeladen', 'de', 'yum');
INSERT INTO `translation` VALUES('The image was uploaded successfully', 'L''image a été chargée avec succès', 'fr', 'yum');
INSERT INTO `translation` VALUES('The image was uploaded successfully', 'Immagine caricata con successo', 'it', 'yum');
INSERT INTO `translation` VALUES('The messages for your application language are not defined.', 'Los mensajes para el idioma de tu aplicación no están definidos', 'es', 'yum');
INSERT INTO `translation` VALUES('The minimum value of the field (form validator).', 'Minimalwert des Feldes (Form-Validierung', 'de', 'yum');
INSERT INTO `translation` VALUES('The minimum value of the field (form validator).', 'El valor mínimo del campo (validador de formulario)', 'es', 'yum');
INSERT INTO `translation` VALUES('The minimum value of the field (form validator).', 'Valeur minimum du champ (Validation du formulaire)', 'fr', 'yum');
INSERT INTO `translation` VALUES('The minimum value of the field (form validator).', 'Valore minimo del campo (validazione form).', 'it', 'yum');
INSERT INTO `translation` VALUES('The minimum value of the field (form validator).', 'ÐœÐ¸Ð½Ð¸Ð¼Ð°Ð»ÑŒÐ½Ð¾Ðµ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð»Ñ (Ð¿Ñ€Ð¾Ð²ÐµÑ€ÐºÐ° Ñ„Ð¾Ñ€Ð¼Ñ‹).', 'ru', 'yum');
INSERT INTO `translation` VALUES('The new password has been saved', 'Das neue Passwort wurde gespeichert.', 'de', 'yum');
INSERT INTO `translation` VALUES('The new password has been saved', 'Votre nouveau mot de passe a bien été mémorisé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('The new password has been saved', 'La nuova password Ã¨ stata salvata.', 'it', 'yum');
INSERT INTO `translation` VALUES('The new password has been saved.', 'La nueva contraseña ha sido guardada', 'es', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'Standard-Wert für die Datenbank', 'de', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'El valor predeterminado del campo (base de datos).', 'es', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'Valeur standard pour la banque de donnée', 'fr', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'Valore del campo predefnito (database).', 'it', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'DomyÅ›lna wartoÅ›Ä‡ pola (bazodanowego).', 'pl', 'yum');
INSERT INTO `translation` VALUES('The value of the default field (database).', 'Ð—Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ Ð¿Ð¾Ð»Ñ Ð¿Ð¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ (Ð±Ð°Ð·Ð° Ð´Ð°Ð½Ð½Ñ‹Ñ…).', 'ru', 'yum');
INSERT INTO `translation` VALUES('There are a total of {messages} messages in your System.', 'Es gibt in ihrem System insgesamt {messages} Nachrichten.', 'de', 'yum');
INSERT INTO `translation` VALUES('There are a total of {messages} messages in your System.', 'Hay un total de {messages} mensajes en su sistema.', 'es', 'yum');
INSERT INTO `translation` VALUES('There are a total of {messages} messages in your System.', 'Il existe dans votre système {messages} messages.', 'fr', 'yum');
INSERT INTO `translation` VALUES('There are a total of {messages} messages in your System.', 'Ci sno un totale di {messages} messaggi nel Sistema.', 'it', 'yum');
INSERT INTO `translation` VALUES('There are a total of {messages} messages in your System.', 'Istnieje {messages} wiadomoÅ›ci w Twoim systemie.', 'pl', 'yum');
INSERT INTO `translation` VALUES('There are {active_users} active and {inactive_users} inactive users in your System, from which {admin_users} are Administrators.', ' Es gibt {active_users} aktive und {inactive_users} inaktive Benutzer in ihrem System, von denen {admin_users} Benutzer Administratoren sind.', 'de', 'yum');
INSERT INTO `translation` VALUES('There are {active_users} active and {inactive_users} inactive users in your System, from which {admin_users} are Administrators.', 'Hay {active_users} usuarios activos y {inactive_users} usuarios inactivos en su sistema, de los cuales {admin_users} son Administradores.', 'es', 'yum');
INSERT INTO `translation` VALUES('There are {active_users} active and {inactive_users} inactive users in your System, from which {admin_users} are Administrators.', ' Il existe {active_users}  membres actifs et {inactive_users} membres inactifs dans votre système, pour lesquels {admin_users} membres sont désignés en tant qu''administrateurs.', 'fr', 'yum');
INSERT INTO `translation` VALUES('There are {active_users} active and {inactive_users} inactive users in your System, from which {admin_users} are Administrators.', ' Ci sono {active_users} utenti attivi e {inactive_users} utenti inattivi nel Sistema, di cui {admin_users} sono amministratori.', 'it', 'yum');
INSERT INTO `translation` VALUES('There are {active_users} active and {inactive_users} inactive users in your System, from which {admin_users} are Administrators.', 'IstniejÄ… {active_users} aktywni i {inactive_users} nieaktywni uÅ¼ytkownicy w Twoim systemie, w tym {admin_users} administratorzy.', 'pl', 'yum');
INSERT INTO `translation` VALUES('There are {profiles} profiles in your System. These consist of {profile_fields} profile fields in {profile_field_groups} profile field groups', 'Es gibt {profiles} Profile in ihren System. Diese bestehen aus {profile_fields} Profilfeldern, die sich in {profile_field_groups} Profilfeldgruppen aufteilen.', 'de', 'yum');
INSERT INTO `translation` VALUES('There are {profiles} profiles in your System. These consist of {profile_fields} profile fields in {profile_field_groups} profile field groups', 'Hay {profiles} perfiles en su sistema. Estos consisten de {profile_fields} campos de perfiles en {profile_field_groups} grupos de campos de perfiles', 'es', 'yum');
INSERT INTO `translation` VALUES('There are {profiles} profiles in your System. These consist of {profile_fields} profile fields in {profile_field_groups} profile field groups', 'Il existe {profiles} profils dans votre système. Ils se composent de {profile_fields} champs de profils, qui se décomposent {profile_field_groups} en grouppe de champs de profils.', 'fr', 'yum');
INSERT INTO `translation` VALUES('There are {profiles} profiles in your System. These consist of {profile_fields} profile fields in {profile_field_groups} profile field groups', 'Ci sono {profiles} profili nel Sistema. sono costituiti da {profile_fields} campi profili, in {profile_field_groups} campo profili gruppi.', 'it', 'yum');
INSERT INTO `translation` VALUES('There are {profiles} profiles in your System. These consist of {profile_fields} profile fields in {profile_field_groups} profile field groups', 'IstniejÄ… {profiles} profile w Twoim systemie, ktÃ³re zawierajÄ… pola {profile_fields} w grupach {profile_field_groups}', 'pl', 'yum');
INSERT INTO `translation` VALUES('There are {roles} roles in your System.', 'Es gibt {roles} Rollen in ihrem System', 'de', 'yum');
INSERT INTO `translation` VALUES('There are {roles} roles in your System.', 'Hay {roles} roles en su sistema.', 'es', 'yum');
INSERT INTO `translation` VALUES('There are {roles} roles in your System.', 'Il existe les {roles} rôles suivant dans votre système', 'fr', 'yum');
INSERT INTO `translation` VALUES('There are {roles} roles in your System.', 'Ci sono {roles} ruoli nel Sistema', 'it', 'yum');
INSERT INTO `translation` VALUES('There are {roles} roles in your System.', 'Istnieje {roles} rÃ³l w Twoim systemie', 'pl', 'yum');
INSERT INTO `translation` VALUES('There was an error saving the password', 'Fehler beim speichern des Passwortes', 'de', 'yum');
INSERT INTO `translation` VALUES('There was an error saving the password', 'Erreur produite lors de la mémorisation de votre mot de passe.', 'fr', 'yum');
INSERT INTO `translation` VALUES('There was an error saving the password', 'Impossibile salvare la password', 'it', 'yum');
INSERT INTO `translation` VALUES('This account is blocked.', 'Ihr Konto wurde blockiert.', 'de', 'yum');
INSERT INTO `translation` VALUES('This account is blocked.', 'Esta cuenta está bloqueada.', 'es', 'yum');
INSERT INTO `translation` VALUES('This account is blocked.', 'Votre compte a été bloqué. Contactez nous.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This account is blocked.', 'Il tuo account Ã¨ stato bloccato.', 'it', 'yum');
INSERT INTO `translation` VALUES('This account is blocked.', 'To konto jest zablokowane.', 'pl', 'yum');
INSERT INTO `translation` VALUES('This account is not activated.', 'Ihr Konto wurde nicht aktiviert.', 'de', 'yum');
INSERT INTO `translation` VALUES('This account is not activated.', 'Esta cuenta no está activada.', 'es', 'yum');
INSERT INTO `translation` VALUES('This account is not activated.', 'Votre compte n a pas été activé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This account is not activated.', 'Il tuo account non Ã¨ attivato.', 'it', 'yum');
INSERT INTO `translation` VALUES('This account is not activated.', 'To konto nie zostaÅ‚o jeszcze aktywowane.', 'pl', 'yum');
INSERT INTO `translation` VALUES('This membership is still {days} days active', 'Die Mitgliedschaft ist noch {days} Tage aktiv', 'de', 'yum');
INSERT INTO `translation` VALUES('This membership is still {days} days active', 'L''iscrizione Ã¨ ancora attiva per {days} giorni', 'it', 'yum');
INSERT INTO `translation` VALUES('This message will be sent to {username}', 'Diese Nachricht wird an {username} versandt', 'de', 'yum');
INSERT INTO `translation` VALUES('This message will be sent to {username}', 'Este mensaje será enviado a {username}', 'es', 'yum');
INSERT INTO `translation` VALUES('This message will be sent to {username}', 'Ce message sera envoyé à  {username}', 'fr', 'yum');
INSERT INTO `translation` VALUES('This message will be sent to {username}', 'Questo messaggio verrÃ  inviato a {username}', 'it', 'yum');
INSERT INTO `translation` VALUES('This role can administer users of this roles', 'Este rol puede administrar usuarios de estos roles', 'es', 'yum');
INSERT INTO `translation` VALUES('This role can administer users of this roles', 'Membres ayant ce rôle peuvent administrer ces utilisateurs', 'fr', 'yum');
INSERT INTO `translation` VALUES('This role can administer users of this roles', 'Questo ruolo puÃ² amministrare utenti di questo ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('This user belongs to these roles:', 'Benutzer gehört diesen Rollen an:', 'de', 'yum');
INSERT INTO `translation` VALUES('This user belongs to these roles:', 'Este usuario pertenece a estos roles:', 'es', 'yum');
INSERT INTO `translation` VALUES('This user belongs to these roles:', 'A ce membre a été attribué ces rôles:', 'fr', 'yum');
INSERT INTO `translation` VALUES('This user belongs to these roles:', 'L''Utente appartiene a questi ruoli:', 'it', 'yum');
INSERT INTO `translation` VALUES('This user belongs to these roles:', 'UÅ¼ytkownik posiada role:', 'pl', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users', 'Dieser Benutzer kann diese Nutzer administrieren', 'de', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users', 'Este usuario puede administrar estos usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users', 'Ce membre peut gérer ces utilisateurs.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users', 'Gli utenti possono gestire questi utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users:', 'Benutzer kann diese Benutzer verwalten:', 'de', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users:', 'Este usuario puede administrar estos usuarios:', 'es', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users:', 'Ce membre peut administrer ces membres:', 'fr', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users:', 'Gli utenti possono gestire questi utenti:', 'it', 'yum');
INSERT INTO `translation` VALUES('This user can administer this users:', 'UÅ¼ytkownik moÅ¼e zarzÄ…dzaj nastÄ™pujÄ…cymi uÅ¼ytkownikami:', 'pl', 'yum');
INSERT INTO `translation` VALUES('This user can administrate this users', 'UÅ¼ytkownik moÅ¼e administrowaÄ‡ podanymi uÅ¼ytkownikami', 'pl', 'yum');
INSERT INTO `translation` VALUES('This user''s email address already exists.', 'Indirizzo email esistente.', 'it', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'Der Benutzer E-Mail-Adresse existiert bereits.', 'de', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'La dirección de e-mail de este usuario ya existe.', 'es', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'Cette adresse e-mail existe déjà  dans notre banque de donnée.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'Indirizzo e-mail giÃ  esistente.', 'it', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'Podany adres melopwy jest w uÅ¼yciu', 'pl', 'yum');
INSERT INTO `translation` VALUES('This user''s email adress already exists.', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ñ Ñ‚Ð°ÐºÐ¸Ð¼ ÑÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½Ð½Ñ‹Ð¼ Ð°Ð´Ñ€ÐµÑÐ¾Ð¼ ÑƒÐ¶Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚.', 'ru', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'Der Benutzer Name existiert bereits.', 'de', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'Este nombre de usuario ya existe.', 'es', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'Ce nom d utilisateur existe déjà  dans notre banque de donnée.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'Nome esistenze', 'it', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'Podana nazwa uÅ¼ytkownika jest w uÅ¼yciu.', 'pl', 'yum');
INSERT INTO `translation` VALUES('This user''s name already exists.', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ñ Ñ‚Ð°ÐºÐ¸Ð¼ Ð¸Ð¼ÐµÐ½ÐµÐ¼ ÑƒÐ¶Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚.', 'ru', 'yum');
INSERT INTO `translation` VALUES('This users have a ordered memberships of this role', 'Diese Benutzer haben eine Mitgliedschaft in dieser Rolle', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have a ordered memberships of this role', 'Ces membres sont assignés à  ce rôle', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have a ordered memberships of this role', 'Questi utenti hanno ordinato l''iscrizione a questo ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this Role', 'Diese Nutzer gehören dieser Rolle an: ', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this Role', 'Este usuario ha sido asignado a este Rol', 'es', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this Role', 'A ces membres ont été attribués ce rôle: ', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this Role', 'Questi utenti sono assegnati al ruolo: ', 'it', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this Role', 'UÅ¼ytkownik zostaÅ‚ przypisany do rÃ³l: ', 'pl', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this role', 'Dieser Rolle gehören diese Benutzer an', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this role', 'Este usuario ha sido asignado a este rol', 'es', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this role', 'Ce rôle a bien été attribué à  ces membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this role', 'Questo ruolo Ã¨ assegnato  a questo utente', 'it', 'yum');
INSERT INTO `translation` VALUES('This users have been assigned to this role', 'Uzytkownik zostaÅ‚ przypisany do rÃ³l', 'pl', 'yum');
INSERT INTO `translation` VALUES('This users have commented your profile recently', 'Diese Benutzer haben mein Profil kürzlich kommentiert', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have commented your profile recently', 'Cet utilisateur à  commenté récemment votre profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have commented your profile recently', 'Questo utente ha recentemente commentato sul tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('This users have visited my profile', 'Diese Benutzer haben mein Profil besucht', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have visited my profile', 'Estos usuarios han visitado mi perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('This users have visited my profile', 'Les membres ayant visité mon profil.', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have visited my profile', 'Questi utenti hanno visitato il tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('This users have visited your profile recently', 'Diese Benutzer haben kürzlich mein Profil besucht', 'de', 'yum');
INSERT INTO `translation` VALUES('This users have visited your profile recently', 'Cet utilisateur a visité votre profil récemment', 'fr', 'yum');
INSERT INTO `translation` VALUES('This users have visited your profile recently', 'Questi utenti hanno recentemente visitato il tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Time left', 'Zeit übrig', 'de', 'yum');
INSERT INTO `translation` VALUES('Time sent', 'Gesendet am', 'de', 'yum');
INSERT INTO `translation` VALUES('Time sent', 'Hora de envío', 'es', 'yum');
INSERT INTO `translation` VALUES('Time sent', 'Envoyé le', 'fr', 'yum');
INSERT INTO `translation` VALUES('Time sent', 'Pubblicato su', 'it', 'yum');
INSERT INTO `translation` VALUES('Time sent', 'WysÅ‚ano', 'pl', 'yum');
INSERT INTO `translation` VALUES('Title', 'Titel', 'de', 'yum');
INSERT INTO `translation` VALUES('Title', 'Título', 'es', 'yum');
INSERT INTO `translation` VALUES('Title', 'Titre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Title', 'Titolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Title', 'ÐÐ°Ð·Ð²Ð°Ð½Ð¸Ðµ', 'ru', 'yum');
INSERT INTO `translation` VALUES('To', 'An', 'de', 'yum');
INSERT INTO `translation` VALUES('To', 'Para', 'es', 'yum');
INSERT INTO `translation` VALUES('To', 'A', 'fr', 'yum');
INSERT INTO `translation` VALUES('To', 'A', 'it', 'yum');
INSERT INTO `translation` VALUES('Translation', 'Übersetzung', 'de', 'yum');
INSERT INTO `translation` VALUES('Translations have been saved', 'Die Übersetzungen wurden gespeichert', 'de', 'yum');
INSERT INTO `translation` VALUES('Try again', 'Erneut versuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Try again', 'Intenta de nuevo', 'es', 'yum');
INSERT INTO `translation` VALUES('Try again', 'Essayer à  nouveau', 'fr', 'yum');
INSERT INTO `translation` VALUES('Try again', 'Prova di nuovo', 'it', 'yum');
INSERT INTO `translation` VALUES('Try again', 'SprÃ³buj jeszcze raz', 'pl', 'yum');
INSERT INTO `translation` VALUES('Update', 'Bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update', 'Actualizar', 'es', 'yum');
INSERT INTO `translation` VALUES('Update', 'Modifier', 'fr', 'yum');
INSERT INTO `translation` VALUES('Update', 'Aggiorna', 'it', 'yum');
INSERT INTO `translation` VALUES('Update', 'ZmieÅ„', 'pl', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'Profilfeld bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'Actualizar Campo del Perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'Modifier le champ du profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'Aggiorna campo Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'ZmieÅ„ pole w profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('Update Profile Field', 'ÐŸÑ€Ð°Ð²Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Update User', 'Benutzer bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update User', 'Actualizar Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Update User', 'Gérer les membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('Update User', 'Aggiorna utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Update User', 'ÐŸÑ€Ð°Ð²Ð¸Ñ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Update my profile', 'Mein Profil bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update my profile', 'Aggiorna profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Update payment', 'Zahlungsart bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update payment', 'Aggiorna pagamento', 'it', 'yum');
INSERT INTO `translation` VALUES('Update role', 'Rolle bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update role', 'Actualizar rol', 'es', 'yum');
INSERT INTO `translation` VALUES('Update role', 'Modifier les rôles', 'fr', 'yum');
INSERT INTO `translation` VALUES('Update role', 'Aggiorna ruolo', 'it', 'yum');
INSERT INTO `translation` VALUES('Update role', 'Edytuj rolÄ™', 'pl', 'yum');
INSERT INTO `translation` VALUES('Update user', 'Benutzer bearbeiten', 'de', 'yum');
INSERT INTO `translation` VALUES('Update user', 'Actualizar usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Update user', 'Modifier un membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Update user', 'Aggiorna utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Update user', 'ZmieÅ„ uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('Upload Avatar', 'Subir un Avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('Upload Avatar', 'Charger une image de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Upload Avatar', 'Carica avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Upload avatar', 'Profilbild hochladen', 'de', 'yum');
INSERT INTO `translation` VALUES('Upload avatar', 'Subir un avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('Upload avatar', 'Charger une image de profil maintenant', 'fr', 'yum');
INSERT INTO `translation` VALUES('Upload avatar', 'Carica avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Upload avatar Image', 'Carica avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Upload avatar image', 'Profilbild hochladen', 'de', 'yum');
INSERT INTO `translation` VALUES('Upload avatar image', 'Cargar imagen de perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Upload avatar image', 'Charger une image pour votre profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Upload avatar image', 'Carica immagine avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Use my Gravatar', 'Meinen Gravatar benutzen', 'de', 'yum');
INSERT INTO `translation` VALUES('User', 'Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('User', 'Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User', 'Utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('User', 'Utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User Administration', 'Benutzerverwaltung', 'de', 'yum');
INSERT INTO `translation` VALUES('User Administration', 'Administración de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User Administration', 'Gestion des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('User Administration', 'Gestione utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User Administration', 'ZarzÄ…dzanie uÅ¼ytkownikami', 'pl', 'yum');
INSERT INTO `translation` VALUES('User Management Home', 'Benutzerverwaltung Startseite', 'de', 'yum');
INSERT INTO `translation` VALUES('User Management Home', 'Administración de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User Management Home', 'Page de gestion des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('User Management Home', 'Home gestione utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User Management Home', 'Strona startowa profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('User Management settings configuration', 'Einstellungen', 'de', 'yum');
INSERT INTO `translation` VALUES('User Management settings configuration', 'Ajustes de configuración de la Administración de usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('User Management settings configuration', 'Options de configuration des profils', 'fr', 'yum');
INSERT INTO `translation` VALUES('User Management settings configuration', 'Configurazione impostazioni gestione utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User Operations', 'Benutzeraktionen', 'de', 'yum');
INSERT INTO `translation` VALUES('User Operations', 'Operaciones de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User Operations', 'Action de l''utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('User Operations', 'Azioni utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User Operations', 'CzynnoÅ›ci uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('User activation', 'User-Aktivierung', 'de', 'yum');
INSERT INTO `translation` VALUES('User activation', 'Activación de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User activation', 'Activation du compte utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('User activation', 'Attivazione utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User activation', 'User-Aktivierung', 'pl', 'yum');
INSERT INTO `translation` VALUES('User activation', 'ÐÐºÑ‚Ð¸Ð²Ð°Ñ†Ð¸Ñ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('User administration Panel', 'Benutzerkontrollzentrum', 'de', 'yum');
INSERT INTO `translation` VALUES('User administration Panel', 'Panel de administración de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User administration Panel', 'Centre de controle des membres', 'fr', 'yum');
INSERT INTO `translation` VALUES('User administration Panel', 'Pannello di controllo', 'it', 'yum');
INSERT INTO `translation` VALUES('User administration Panel', 'Panel zarzÄ…dzania uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('User administration panel', 'Kontrollzentrum', 'de', 'yum');
INSERT INTO `translation` VALUES('User administration panel', 'Panel de administración de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User administration panel', 'Centre de controle user', 'fr', 'yum');
INSERT INTO `translation` VALUES('User administration panel', 'Pannello di controllo', 'it', 'yum');
INSERT INTO `translation` VALUES('User administration panel', 'Panel zarzÄ…dzania uÅ¼ytkownikiem', 'pl', 'yum');
INSERT INTO `translation` VALUES('User belongs to Roles', 'Benutzer gehört diesen Rollen an', 'de', 'yum');
INSERT INTO `translation` VALUES('User belongs to Roles', 'El usuario pertenece al los Roles', 'es', 'yum');
INSERT INTO `translation` VALUES('User belongs to Roles', 'Attribuer des rôles à  un membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('User belongs to Roles', 'Utente appartiene a questi ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('User belongs to Roles', 'UÅ¼ytkownik posiada role', 'pl', 'yum');
INSERT INTO `translation` VALUES('User belongs to these roles', 'Benutzer gehört diesen Rollen an', 'de', 'yum');
INSERT INTO `translation` VALUES('User belongs to these roles', 'El usuario pertenece a estos roles', 'es', 'yum');
INSERT INTO `translation` VALUES('User belongs to these roles', 'Attribuer ce rôle à  un membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('User belongs to these roles', 'Utente appartiene a questi ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('User belongs to these roles', 'UÅ¼ytkownik posiada role', 'pl', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users', 'Kann keine Benutzer verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users', 'El usuario no puede administrar ningún usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users', 'Ne peut pas gérer les utilisateurs', 'fr', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users', 'Impossibile gestire gli utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users', 'UÅ¼ytkownik nie moÅ¼e zarzÄ…dzaÄ‡ Å¼adnymi uÅ¼ytkownikami', 'pl', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users of any role', 'Kann keine Rollen verwalten', 'de', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users of any role', 'El usuario no puede administrar ningún usuario o ningún rol', 'es', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users of any role', 'Ne peut pas gérer les rolles', 'fr', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users of any role', 'Impossibile gestire i ruoli', 'it', 'yum');
INSERT INTO `translation` VALUES('User can not administer any users of any role', 'UÅ¼ytkownik nie moÅ¼e zarzÄ…dzaÄ‡ Å¼adnymi rolami uÅ¼ytkownikÃ³w', 'pl', 'yum');
INSERT INTO `translation` VALUES('User is Online!', 'Benutzer ist Online!', 'de', 'yum');
INSERT INTO `translation` VALUES('User is Online!', 'Utilisateur en ligne!', 'fr', 'yum');
INSERT INTO `translation` VALUES('User is Online!', 'Utente online!', 'it', 'yum');
INSERT INTO `translation` VALUES('User module settings', 'Moduleinstellungen', 'de', 'yum');
INSERT INTO `translation` VALUES('User module settings', 'Ajustes del módulo de usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('User module settings', 'Réglages du module user', 'fr', 'yum');
INSERT INTO `translation` VALUES('User module settings', 'Modulo impostazioni utente', 'it', 'yum');
INSERT INTO `translation` VALUES('User module settings', 'Ustawienia moduÅ‚u uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('Usergroups', 'Benutzergruppen', 'de', 'yum');
INSERT INTO `translation` VALUES('Usergroups', 'Grupos del usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Usergroups', 'Utilisateur des grouppes', 'fr', 'yum');
INSERT INTO `translation` VALUES('Usergroups', 'Gruppi utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Username', 'Benutzername', 'de', 'yum');
INSERT INTO `translation` VALUES('Username', 'Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Username', 'Pseudo', 'fr', 'yum');
INSERT INTO `translation` VALUES('Username', 'Username', 'it', 'yum');
INSERT INTO `translation` VALUES('Username', 'UÅ¼ytkownik', 'pl', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'Benutzername ist falsch.', 'de', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'Nombre de usuario incorrecto', 'es', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'Le nom d''utilisateur est incorrect.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'Username non corretto.', 'it', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'Nazwa uÅ¼ytkownika jest niepoprawna.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Username is incorrect.', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ Ñ Ñ‚Ð°ÐºÐ¸Ð¼ Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ð½Ðµ Ð·Ð°Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð¸Ñ€Ð¾Ð²Ð°Ð½.', 'ru', 'yum');
INSERT INTO `translation` VALUES('Username or Email', 'Benutzername oder E-mail', 'de', 'yum');
INSERT INTO `translation` VALUES('Username or Email', 'Nombre de usuario o Email', 'es', 'yum');
INSERT INTO `translation` VALUES('Username or Email', 'Nom d utilisateur ou adresse e-mail.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Username or Email', 'Username o email', 'it', 'yum');
INSERT INTO `translation` VALUES('Username or Password is incorrect', 'Benutzername oder Passwort ist falsch', 'de', 'yum');
INSERT INTO `translation` VALUES('Username or Password is incorrect', 'Usuario o contraseña incorrectos', 'es', 'yum');
INSERT INTO `translation` VALUES('Username or Password is incorrect', 'Nom d utilisateur ou mot passe incorrect', 'fr', 'yum');
INSERT INTO `translation` VALUES('Username or Password is incorrect', 'Username o password errato/a', 'it', 'yum');
INSERT INTO `translation` VALUES('Username or email', 'Benutzername oder E-Mail', 'de', 'yum');
INSERT INTO `translation` VALUES('Username or email', 'Nom d utilisateur ou adresse e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('Username or email', 'Username o email', 'it', 'yum');
INSERT INTO `translation` VALUES('Users', 'Usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('Users', 'Utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('Users', 'Utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('Users', 'ÐŸÐ¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('Users: ', 'Benutzer: ', 'de', 'yum');
INSERT INTO `translation` VALUES('Users: ', 'Usuarios:', 'es', 'yum');
INSERT INTO `translation` VALUES('Users: ', 'Membres: ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Users: ', 'Utenti: ', 'it', 'yum');
INSERT INTO `translation` VALUES('Users: ', 'UÅ¼ytkownicy: ', 'pl', 'yum');
INSERT INTO `translation` VALUES('Variable name', 'Variablen name', 'de', 'yum');
INSERT INTO `translation` VALUES('Variable name', 'Nombre de variable', 'es', 'yum');
INSERT INTO `translation` VALUES('Variable name', 'Nom de la variable', 'fr', 'yum');
INSERT INTO `translation` VALUES('Variable name', 'Nome variabile', 'it', 'yum');
INSERT INTO `translation` VALUES('Variable name', 'Ð˜Ð¼Ñ Ð¿ÐµÑ€ÐµÐ¼ÐµÐ½Ð½Ð¾Ð¹', 'ru', 'yum');
INSERT INTO `translation` VALUES('Verification Code', 'Codice verifica', 'it', 'yum');
INSERT INTO `translation` VALUES('Verification Code', 'Kod weryfikujÄ…cy', 'pl', 'yum');
INSERT INTO `translation` VALUES('Verification Code', 'ÐŸÑ€Ð¾Ð²ÐµÑ€Ð¾Ñ‡Ð½Ñ‹Ð¹ ÐºÐ¾Ð´', 'ru', 'yum');
INSERT INTO `translation` VALUES('Verification code', 'Verifizierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Verification code', 'Código de verificación', 'es', 'yum');
INSERT INTO `translation` VALUES('Verification code', 'Code de verification', 'fr', 'yum');
INSERT INTO `translation` VALUES('Verification code', 'Codice verifica', 'it', 'yum');
INSERT INTO `translation` VALUES('View', 'Anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('View', 'Ver', 'es', 'yum');
INSERT INTO `translation` VALUES('View', 'Editer', 'fr', 'yum');
INSERT INTO `translation` VALUES('View', 'Visualizza', 'it', 'yum');
INSERT INTO `translation` VALUES('View', 'PolaÅ¼', 'pl', 'yum');
INSERT INTO `translation` VALUES('View Details', 'Zur Gruppe', 'de', 'yum');
INSERT INTO `translation` VALUES('View Details', 'Mostra dettagli', 'it', 'yum');
INSERT INTO `translation` VALUES('View Profile Field', 'Mostra campo Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('View Profile Field', 'ÐŸÑ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€', 'ru', 'yum');
INSERT INTO `translation` VALUES('View Profile Field #', 'Mostra # campo Profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('View Profile Field #', 'ÐŸÐ¾Ð»Ðµ Ð¿Ñ€Ð¾Ñ„Ð¸Ð»Ñ #', 'ru', 'yum');
INSERT INTO `translation` VALUES('View User', 'Benutzer anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('View User', 'Ver Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('View User', 'Consulter le profil du membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('View User', 'Mostra utente', 'it', 'yum');
INSERT INTO `translation` VALUES('View User', 'ÐŸÑ€Ð¾ÑÐ¼Ð¾Ñ‚Ñ€ Ð¿Ñ€Ð¾Ñ„Ð¸Ð»Ñ', 'ru', 'yum');
INSERT INTO `translation` VALUES('View admin messages', 'Administratornachrichten anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('View admin messages', 'Ver mensajes de admin', 'es', 'yum');
INSERT INTO `translation` VALUES('View admin messages', 'Voir les messages de l administateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('View admin messages', 'Visualizza messaggi amministratore', 'it', 'yum');
INSERT INTO `translation` VALUES('View admin messages', 'PokaÅ¼ wiadomoÅ›ci administratora', 'pl', 'yum');
INSERT INTO `translation` VALUES('View my messages', 'Meine Nachrichten ansehen', 'de', 'yum');
INSERT INTO `translation` VALUES('View my messages', 'Ver mis mensajes', 'es', 'yum');
INSERT INTO `translation` VALUES('View my messages', 'Voir mes messages', 'fr', 'yum');
INSERT INTO `translation` VALUES('View my messages', 'Visualizza messaggi', 'it', 'yum');
INSERT INTO `translation` VALUES('View my messages', 'WyÅ›wietl moje wiadomoÅ›ci', 'pl', 'yum');
INSERT INTO `translation` VALUES('View user "{username}"', 'Benutzer "{username}"', 'de', 'yum');
INSERT INTO `translation` VALUES('View user "{username}"', 'Ver usuario "{username}"', 'es', 'yum');
INSERT INTO `translation` VALUES('View user "{username}"', 'Membre "{username}"', 'fr', 'yum');
INSERT INTO `translation` VALUES('View user "{username}"', 'Visualizza utente "{username}"', 'it', 'yum');
INSERT INTO `translation` VALUES('View user "{username}"', 'UÅ¼ytkownik "{username}"', 'pl', 'yum');
INSERT INTO `translation` VALUES('View users', 'Benutzer anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('View users', 'Ver usuarios', 'es', 'yum');
INSERT INTO `translation` VALUES('View users', 'Montrer les utilisateurs', 'fr', 'yum');
INSERT INTO `translation` VALUES('View users', 'Visualizza utenti', 'it', 'yum');
INSERT INTO `translation` VALUES('View users', 'PokaÅ¼ uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('Visible', 'Sichtbar', 'de', 'yum');
INSERT INTO `translation` VALUES('Visible', 'Visible', 'es', 'yum');
INSERT INTO `translation` VALUES('Visible', 'Visible', 'fr', 'yum');
INSERT INTO `translation` VALUES('Visible', 'Visibile', 'it', 'yum');
INSERT INTO `translation` VALUES('Visible', 'Ð’Ð¸Ð´Ð¸Ð¼Ð¾ÑÑ‚ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Visit profile', 'Profil besuchen', 'de', 'yum');
INSERT INTO `translation` VALUES('Visit profile', 'Visiter le profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Visit profile', 'Visita profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('When selecting searchable, users of this role can be searched in the "user Browse" function', 'Wenn "suchbar" ausgewählt wird, kann man Nutzer dieser Rolle in der "Benutzer durchsuchen"-Funktion suchen', 'de', 'yum');
INSERT INTO `translation` VALUES('When selecting searchable, users of this role can be searched in the "user Browse" function', 'Si le status de "visible" est choisi, un membre de ce rôle pourra apparaitre dans les résultats d une recherche', 'fr', 'yum');
INSERT INTO `translation` VALUES('When selecting searchable, users of this role can be searched in the "user Browse" function', 'Quando selezioni "Ricercabile", gli utenti di questo ruolo sono ricercabili nella funzione "Browser utenti" ', 'it', 'yum');
INSERT INTO `translation` VALUES('Write a comment', 'Kommentar hinterlassen', 'de', 'yum');
INSERT INTO `translation` VALUES('Write a comment', 'Escribir un comentario', 'es', 'yum');
INSERT INTO `translation` VALUES('Write a comment', 'Laisser un commentaire', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write a comment', 'Scrivi commento', 'it', 'yum');
INSERT INTO `translation` VALUES('Write a message', 'Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Write a message', 'Escribir un mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Write a message', 'Ecrire un message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write a message', 'Scrivi messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Write a message', 'Napisz wiadomoÅ›Ä‡', 'pl', 'yum');
INSERT INTO `translation` VALUES('Write a message to this User', 'Diesem Benutzer eine Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Write a message to this User', 'Escribir un mensaje a este Usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('Write a message to this User', 'Ecrire un message à  ce membre', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write a message to this User', 'Scrivi messaggio a questo utente', 'it', 'yum');
INSERT INTO `translation` VALUES('Write a message to {username}', 'Nachricht an {username} schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Write a message to {username}', 'Message écrire à  {username} ', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write a message to {username}', 'Scrivi messaggio a {username} ', 'it', 'yum');
INSERT INTO `translation` VALUES('Write another message', 'Eine weitere Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Write another message', 'Escribir otro mensaje', 'es', 'yum');
INSERT INTO `translation` VALUES('Write another message', 'Ecrire un autre message', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write another message', 'Scrivi un''altro messaggio', 'it', 'yum');
INSERT INTO `translation` VALUES('Write another message', 'Eine weitere Nachricht schreiben', 'pl', 'yum');
INSERT INTO `translation` VALUES('Write comment', 'Kommentar schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Write comment', 'Escribir comentario', 'es', 'yum');
INSERT INTO `translation` VALUES('Write comment', 'Ecrire un commentaire', 'fr', 'yum');
INSERT INTO `translation` VALUES('Write comment', 'Scrivi commento', 'it', 'yum');
INSERT INTO `translation` VALUES('Write message', 'Nachricht schreiben', 'de', 'yum');
INSERT INTO `translation` VALUES('Written at', 'Geschrieben am', 'de', 'yum');
INSERT INTO `translation` VALUES('Written at', 'Escrito el', 'es', 'yum');
INSERT INTO `translation` VALUES('Written at', 'Ecrit le', 'fr', 'yum');
INSERT INTO `translation` VALUES('Written at', 'Scritto a ', 'it', 'yum');
INSERT INTO `translation` VALUES('Written from', 'Geschrieben von', 'de', 'yum');
INSERT INTO `translation` VALUES('Written from', 'Escrito por', 'es', 'yum');
INSERT INTO `translation` VALUES('Written from', 'Ecrit par', 'fr', 'yum');
INSERT INTO `translation` VALUES('Written from', 'Scritto da ', 'it', 'yum');
INSERT INTO `translation` VALUES('Wrong password confirmation! Account was not deleted', 'Falsches Bestätigugspasswort! Zugang wurde nicht gelöscht', 'de', 'yum');
INSERT INTO `translation` VALUES('Wrong password confirmation! Account was not deleted', '¡Contraseña para confirmación incorrecta! Lacuenta no ha sido eliminada', 'es', 'yum');
INSERT INTO `translation` VALUES('Wrong password confirmation! Account was not deleted', 'Confirmation incorrecte! Le compte n a pas été supprimé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Wrong password confirmation! Account was not deleted', 'Password id oconferma errata! Account non cancellato', 'it', 'yum');
INSERT INTO `translation` VALUES('Wrong password confirmation! Account was not deleted', 'Niepoprawne hasÅ‚o! Konto nie zostaÅ‚o usuniÄ™te', 'pl', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Ja', 'de', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Sí', 'es', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Oui', 'fr', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Si', 'it', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Ja', 'pl', 'yum');
INSERT INTO `translation` VALUES('Yes', 'Ð”Ð°', 'ru', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'Ja, und auf Registrierungsseite anzeigen', 'de', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'Si y mostrar en formulario de registro', 'es', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'oui et charger le formulaire d inscription', 'fr', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'Si e mostra nel form di registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'Tak i pokaÅ¼ w formularzu rejestracji', 'pl', 'yum');
INSERT INTO `translation` VALUES('Yes and show on registration form', 'Ð”Ð° Ð¸ Ð¿Ð¾ÐºÐ°Ð·Ð°Ñ‚ÑŒ Ð¿Ñ€Ð¸ Ñ€ÐµÐ³Ð¸ÑÑ‚Ñ€Ð°Ñ†Ð¸Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Ihr Konto wurde aktiviert.', 'de', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Su cuenta está activada.', 'es', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Votre compte a bien été activé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Account attivato', 'it', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Ihr Konto wurde aktiviert.', 'pl', 'yum');
INSERT INTO `translation` VALUES('You account is activated.', 'Ð’Ð°ÑˆÐ° ÑƒÑ‡ÐµÑ‚Ð½Ð°Ñ Ð·Ð°Ð¿Ð¸ÑÑŒ Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð°.', 'ru', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Ihr Konto ist aktiv.', 'de', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Su cuenta está activa.', 'es', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Votre compte est actif.', 'fr', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Account attivo', 'it', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Ihr Konto ist aktiv.', 'pl', 'yum');
INSERT INTO `translation` VALUES('You account is active.', 'Ð’Ð°ÑˆÐ° ÑƒÑ‡ÐµÑ‚Ð½Ð°Ñ Ð·Ð°Ð¿Ð¸ÑÑŒ ÑƒÐ¶Ðµ Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð°.', 'ru', 'yum');
INSERT INTO `translation` VALUES('You account is blocked.', 'Account bloccato', 'it', 'yum');
INSERT INTO `translation` VALUES('You account is blocked.', 'Ð’Ð°Ñˆ Ð°ÐºÐºÐ°ÑƒÐ½Ñ‚ Ð·Ð°Ð±Ð»Ð¾ÐºÐ¸Ñ€Ð¾Ð²Ð°Ð½.', 'ru', 'yum');
INSERT INTO `translation` VALUES('You account is not activated.', 'Account non attivo', 'it', 'yum');
INSERT INTO `translation` VALUES('You account is not activated.', 'Ð’Ð°Ñˆ Ð°ÐºÐºÐ°ÑƒÐ½Ñ‚ Ð½Ðµ Ð°ÐºÑ‚Ð¸Ð²Ð¸Ñ€Ð¾Ð²Ð°Ð½.', 'ru', 'yum');
INSERT INTO `translation` VALUES('You already are friends', 'Ihr seid bereits Freunde', 'de', 'yum');
INSERT INTO `translation` VALUES('You already are friends', 'Ya son amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('You already are friends', 'Ce membre figure déjà  dans votre liste de contact', 'fr', 'yum');
INSERT INTO `translation` VALUES('You already are friends', 'Siete giÃ  in contatto', 'it', 'yum');
INSERT INTO `translation` VALUES('You are not allowed to view this profile.', 'Sie dürfen dieses Profil nicht ansehen.', 'de', 'yum');
INSERT INTO `translation` VALUES('You are not allowed to view this profile.', 'No tiene permiso para ver este perfil.', 'es', 'yum');
INSERT INTO `translation` VALUES('You are not allowed to view this profile.', 'VOus ne pouvez pas consulter ce profil.', 'fr', 'yum');
INSERT INTO `translation` VALUES('You are not allowed to view this profile.', 'Non puoi vedere questo profilo.', 'it', 'yum');
INSERT INTO `translation` VALUES('You are not allowed to view this profile.', 'Nie masz uprawnie do przeglÄ…dania tego profilu', 'pl', 'yum');
INSERT INTO `translation` VALUES('You are running the Yii User Management Module {version} in Debug Mode!', 'Dies ist das Yii-User-Management Modul in Version {version} im Debug Modus!', 'de', 'yum');
INSERT INTO `translation` VALUES('You are running the Yii User Management Module {version} in Debug Mode!', '¡Está ejecutando el Módulo de Administración de Usuarios Yii {version} en modo de depuración!', 'es', 'yum');
INSERT INTO `translation` VALUES('You are running the Yii User Management Module {version} in Debug Mode!', 'Le module Yii-User-Management, version {version} est en mode Debug!', 'fr', 'yum');
INSERT INTO `translation` VALUES('You are running the Yii User Management Module {version} in Debug Mode!', 'Questo Ã¨ il modulo di YUM versione {version} in modalitÃ  debug!', 'it', 'yum');
INSERT INTO `translation` VALUES('You are running the Yii User Management Module {version} in Debug Mode!', 'Uruchamiasz moduÅ‚ Yii User Management Modul, wersja {version}, w trybie DEBUG!', 'pl', 'yum');
INSERT INTO `translation` VALUES('You do not have any friends yet', 'Ihre Kontaktliste ist leer', 'de', 'yum');
INSERT INTO `translation` VALUES('You do not have any friends yet', 'No tienes ningún amigo todavía', 'es', 'yum');
INSERT INTO `translation` VALUES('You do not have any friends yet', 'Votre liste de contact est vide', 'fr', 'yum');
INSERT INTO `translation` VALUES('You do not have any friends yet', 'Lista contatti vuota', 'it', 'yum');
INSERT INTO `translation` VALUES('You do not have set an avatar image yet', 'Es wurde noch kein Profilbild hochgeladen', 'de', 'yum');
INSERT INTO `translation` VALUES('You do not have set an avatar image yet', 'Aún no has subido tu imágen de Avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('You do not have set an avatar image yet', 'Aucune photo de votre profil disponible', 'fr', 'yum');
INSERT INTO `translation` VALUES('You do not have set an avatar image yet', 'Non hai settato un''avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('You have joined this group', 'Sie sind dieser Gruppe beigetreten', 'de', 'yum');
INSERT INTO `translation` VALUES('You have new Messages !', 'Sie haben neue Nachrichten !', 'de', 'yum');
INSERT INTO `translation` VALUES('You have new Messages !', '¡Tienes Mensajes nuevos!', 'es', 'yum');
INSERT INTO `translation` VALUES('You have new Messages !', 'Vous avez de nouveaux messages !', 'fr', 'yum');
INSERT INTO `translation` VALUES('You have new Messages !', 'Hai un nuovo messaggio!', 'it', 'yum');
INSERT INTO `translation` VALUES('You have new messages!', 'Sie haben neue Nachrichten!', 'de', 'yum');
INSERT INTO `translation` VALUES('You have new messages!', '¡Tienes mensajes nuevos!', 'es', 'yum');
INSERT INTO `translation` VALUES('You have new messages!', 'Vous n avez pas de messages!', 'fr', 'yum');
INSERT INTO `translation` VALUES('You have new messages!', 'Hai un nuovo messaggio!', 'it', 'yum');
INSERT INTO `translation` VALUES('You have new messages!', 'Masz nowÄ… wiadomoÅ›Ä‡!', 'pl', 'yum');
INSERT INTO `translation` VALUES('You have no messages yet', 'Sie haben bisher noch keine Nachrichten', 'de', 'yum');
INSERT INTO `translation` VALUES('You have no messages yet', 'Aucun message récent', 'fr', 'yum');
INSERT INTO `translation` VALUES('You have no messages yet', 'Non hai messaggi', 'it', 'yum');
INSERT INTO `translation` VALUES('You have {count} new Messages !', 'Sie haben {count} neue Nachricht(en)!', 'de', 'yum');
INSERT INTO `translation` VALUES('You have {count} new Messages !', '¡Tienes {count} mensajes nuevos!', 'es', 'yum');
INSERT INTO `translation` VALUES('You have {count} new Messages !', 'Vous avez {count} nouveau(x) message(s)!', 'fr', 'yum');
INSERT INTO `translation` VALUES('You have {count} new Messages !', 'Hai {count} nuovi messaggi!', 'it', 'yum');
INSERT INTO `translation` VALUES('You have {count} new Messages !', 'Masz {count} nowych wiadomoÅ›ci !', 'pl', 'yum');
INSERT INTO `translation` VALUES('You registered from {site_name}', 'Sei registrato su {site_name}', 'it', 'yum');
INSERT INTO `translation` VALUES('Your Account has been activated. Thank you for your registration', 'Ihr Zugang wurde aktiviert. Danke für die Registierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Your Account has been activated. Thank you for your registration.', 'Votre compte a bien été activé. Merci pour votre inscription.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your Account has been activated. Thank you for your registration.', 'Il tuo account Ã¨ stato attivato. Grazie per la tua registrazione', 'it', 'yum');
INSERT INTO `translation` VALUES('Your Avatar image', 'Ihr Avatar-Bild', 'de', 'yum');
INSERT INTO `translation` VALUES('Your Avatar image', 'Tu imagen de Avatar', 'es', 'yum');
INSERT INTO `translation` VALUES('Your Avatar image', 'Votre image de profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your Avatar image', 'Il tuo avatar', 'it', 'yum');
INSERT INTO `translation` VALUES('Your Message has been sent.', 'El Mensaje ha sido enviado.', 'es', 'yum');
INSERT INTO `translation` VALUES('Your Message has been sent.', 'Votre méssage a été envoyé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your Message has been sent.', 'Messaggio inviato.', 'it', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated.', 'Tu cuenta ha sido activada.', 'es', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated. Thank you for your registration', 'Ihr Zugang wurde aktiviert. Danke für ihre Registrierung', 'de', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated. Thank you for your registration', 'VOtre compte est maintenant actif. Merci de vous être enregistré', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated. Thank you for your registration', 'Il tuo account Ã¨ stato attivato. Grazie per esserti registrato', 'it', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated. Thank you for your registration.', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'es', 'yum');
INSERT INTO `translation` VALUES('Your account has been activated. Thank you for your registration.', 'Twoje konto zostaÅ‚o aktywowane. DziÄ™kujemy za rejestracjÄ™.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Your account has been deleted.', 'Ihr Zugang wurde gelöscht', 'de', 'yum');
INSERT INTO `translation` VALUES('Your account has been deleted.', 'Votre compte a bien été supprimé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your account has been deleted.', 'Il tuo account Ã¨ stato cancellato.', 'it', 'yum');
INSERT INTO `translation` VALUES('Your activation succeeded', 'Ihre Aktivierung war erfolgreich', 'de', 'yum');
INSERT INTO `translation` VALUES('Your activation succeeded', 'Votre compte a été activé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your activation succeeded', 'Attivazione riuscita', 'it', 'yum');
INSERT INTO `translation` VALUES('Your changes have been saved', 'Ihre Änderungen wurden gespeichert', 'de', 'yum');
INSERT INTO `translation` VALUES('Your changes have been saved', 'Los cambios han sido guardados', 'es', 'yum');
INSERT INTO `translation` VALUES('Your changes have been saved', 'Vos modification ont été mémorisées', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your changes have been saved', 'Le modifiche sono state salvate', 'it', 'yum');
INSERT INTO `translation` VALUES('Your changes have been saved', 'Twoje zmiany zostaÅ‚y zapisane', 'pl', 'yum');
INSERT INTO `translation` VALUES('Your current password', 'Ihr aktuelles Passwort', 'de', 'yum');
INSERT INTO `translation` VALUES('Your current password', 'Votre mot de passe actuel', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your current password', 'La tua password corrente', 'it', 'yum');
INSERT INTO `translation` VALUES('Your current password is not correct', 'Ihr aktuelles Passwort ist nicht korrekt', 'de', 'yum');
INSERT INTO `translation` VALUES('Your current password is not correct', 'Votre mot de passe actuel n est pas correct', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your current password is not correct', 'La tua password corrente non Ã¨ corretta', 'it', 'yum');
INSERT INTO `translation` VALUES('Your friendship request has been accepted', 'Ihre Freundschaftsanfrage wurde akzeptiert', 'de', 'yum');
INSERT INTO `translation` VALUES('Your friendship request has been accepted', 'Votre demande de contact a bien été acceptée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your friendship request has been accepted', 'La richiesta di contatto Ã¨ stata accettata', 'it', 'yum');
INSERT INTO `translation` VALUES('Your message has been sent', 'Ihre Nachricht wurde gesendet', 'de', 'yum');
INSERT INTO `translation` VALUES('Your message has been sent', 'El mensaje ha sido enviado', 'es', 'yum');
INSERT INTO `translation` VALUES('Your message has been sent', 'Votre méssage a bien été envoyé', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your message has been sent', 'Il tuo messaggio Ã¨ stato inviato.', 'it', 'yum');
INSERT INTO `translation` VALUES('Your message has been sent', 'Twoja wiadomoÅ›Ä‡ zostaÅ‚a wysÅ‚ana', 'pl', 'yum');
INSERT INTO `translation` VALUES('Your new password has been saved.', 'Ihr Passwort wurde gespeichert.', 'de', 'yum');
INSERT INTO `translation` VALUES('Your new password has been saved.', 'La nueva contraseña ha sido guardada.', 'es', 'yum');
INSERT INTO `translation` VALUES('Your new password has been saved.', 'La modification de votre mot de passe a bien été mémorisé.', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your new password has been saved.', 'La nuova password Ã¨ stata salvata.', 'it', 'yum');
INSERT INTO `translation` VALUES('Your new password has been saved.', 'Twoje nowe hasÅ‚o zostaÅ‚o zapisane.', 'pl', 'yum');
INSERT INTO `translation` VALUES('Your password has expired. Please enter your new Password below:', 'Ihr Passwort ist abgelaufen. Bitte geben Sie ein neues Passwort an:', 'de', 'yum');
INSERT INTO `translation` VALUES('Your password has expired. Please enter your new Password below:', 'La contraseña ha expirado. Por favor escribe una contraseña nueva abajo:', 'es', 'yum');
INSERT INTO `translation` VALUES('Your password has expired. Please enter your new Password below:', 'La durée de vie de votre mot de passe est arrivée à  échéance. Veuillez en definir un nouveau:', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your password has expired. Please enter your new Password below:', 'La password Ã¨ scaduta. Si prega di inserire una nuova password:', 'it', 'yum');
INSERT INTO `translation` VALUES('Your privacy settings have been saved', 'Ihre Privatsphären-einstellungen wurden gespeichert', 'de', 'yum');
INSERT INTO `translation` VALUES('Your privacy settings have been saved', 'La configuration de vos données privées a bien été enregistrée', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your privacy settings have been saved', 'Le tue opzioni Privacy sono state salvate', 'it', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Ihr Profil', 'de', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Tu perfil', 'es', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Votre profil', 'fr', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Il tuo profilo', 'it', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Ihr Profil', 'pl', 'yum');
INSERT INTO `translation` VALUES('Your profile', 'Ð’Ð°Ñˆ Ð¿Ñ€Ð¾Ñ„Ð¸Ð»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('Your registration didn''t work. Please try another E-Mail address. If this problem persists, please contact our System Administrator. ', 'Tu proceso de registro falló. Por favor intenta con otra cuenta de correo. Si el problema persiste por favor contáctanos.', 'es', 'yum');
INSERT INTO `translation` VALUES('Your request succeeded. Please enter below your new password:', 'Tu solicitud fué exitosa. Por favor, escribe a continuación tu nueva contraseña:', 'es', 'yum');
INSERT INTO `translation` VALUES('about', 'information me concernant', 'fr', 'yum');
INSERT INTO `translation` VALUES('about', 'Informazioni su', 'it', 'yum');
INSERT INTO `translation` VALUES('activation key', 'Aktivierungsschlüssel', 'de', 'yum');
INSERT INTO `translation` VALUES('activation key', 'clave de activación', 'es', 'yum');
INSERT INTO `translation` VALUES('activation key', 'Clé d''activation de votre compte', 'fr', 'yum');
INSERT INTO `translation` VALUES('activation key', 'chiave di attivazione', 'it', 'yum');
INSERT INTO `translation` VALUES('activation key', 'AktivierungsschlÃ¼ssel', 'pl', 'yum');
INSERT INTO `translation` VALUES('activation key', 'ÐšÐ»ÑŽÑ‡ Ð°ÐºÑ‚Ð¸Ð²Ð°Ñ†Ð¸Ð¸', 'ru', 'yum');
INSERT INTO `translation` VALUES('birthdate', 'Geburtstag', 'de', 'yum');
INSERT INTO `translation` VALUES('birthdate', 'anniversaire', 'fr', 'yum');
INSERT INTO `translation` VALUES('birthdate', 'Compleanno', 'it', 'yum');
INSERT INTO `translation` VALUES('birthday', 'Geburtstag', 'de', 'yum');
INSERT INTO `translation` VALUES('birthday', 'date de naissance', 'fr', 'yum');
INSERT INTO `translation` VALUES('birthday', 'Compleanno', 'it', 'yum');
INSERT INTO `translation` VALUES('change Password', 'Passwort ändern', 'de', 'yum');
INSERT INTO `translation` VALUES('change Password', 'cambiar Contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('change Password', 'Changer le mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('change Password', 'ZmieÅ„ hasÅ‚o', 'pl', 'yum');
INSERT INTO `translation` VALUES('change password', 'Passwort ändern', 'de', 'yum');
INSERT INTO `translation` VALUES('change password', 'cambiar contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('change password', 'Modifier le mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('change password', 'Cambia password', 'it', 'yum');
INSERT INTO `translation` VALUES('do not make my friends public', 'Meine Kontakte nicht veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('do not make my friends public', 'Ne pas rendre publique la liste de mes contacts', 'fr', 'yum');
INSERT INTO `translation` VALUES('do not make my friends public', 'Non mostrare i miei contatti pubblicamente', 'it', 'yum');
INSERT INTO `translation` VALUES('email', 'E-Mail', 'de', 'yum');
INSERT INTO `translation` VALUES('email', 'correo', 'es', 'yum');
INSERT INTO `translation` VALUES('email', 'e-Mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('email', 'email', 'it', 'yum');
INSERT INTO `translation` VALUES('email', 'mejl', 'pl', 'yum');
INSERT INTO `translation` VALUES('email address', 'correo electrónico', 'es', 'yum');
INSERT INTO `translation` VALUES('email address', 'Adres mejlowy', 'pl', 'yum');
INSERT INTO `translation` VALUES('firstname', 'Vorname', 'de', 'yum');
INSERT INTO `translation` VALUES('firstname', 'prénom', 'fr', 'yum');
INSERT INTO `translation` VALUES('firstname', 'Cognome', 'it', 'yum');
INSERT INTO `translation` VALUES('friends only', 'Nur Freunde', 'de', 'yum');
INSERT INTO `translation` VALUES('friends only', 'sólo amigos', 'es', 'yum');
INSERT INTO `translation` VALUES('friends only', 'A mes contacts seulement', 'fr', 'yum');
INSERT INTO `translation` VALUES('friends only', 'Solo contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('lastname', 'Nachname', 'de', 'yum');
INSERT INTO `translation` VALUES('lastname', 'nom de famille', 'fr', 'yum');
INSERT INTO `translation` VALUES('lastname', 'Nome', 'it', 'yum');
INSERT INTO `translation` VALUES('make my friends public', 'Meine Kontakte veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('make my friends public', 'Rendre visibles mes contacts', 'fr', 'yum');
INSERT INTO `translation` VALUES('make my friends public', 'Rendi pubblici i miei contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('no', 'Nein', 'de', 'yum');
INSERT INTO `translation` VALUES('no', 'Non', 'fr', 'yum');
INSERT INTO `translation` VALUES('no', 'No', 'it', 'yum');
INSERT INTO `translation` VALUES('of user', 'von Benutzer', 'de', 'yum');
INSERT INTO `translation` VALUES('of user', 'de l utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('of user', 'dell''utente', 'it', 'yum');
INSERT INTO `translation` VALUES('only to my friends', 'Nur an meine Freunde veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('only to my friends', 'Visible seulement pour mes contacts', 'fr', 'yum');
INSERT INTO `translation` VALUES('only to my friends', 'solamente ai miei contatti', 'it', 'yum');
INSERT INTO `translation` VALUES('password', 'Passwort', 'de', 'yum');
INSERT INTO `translation` VALUES('password', 'contraseña', 'es', 'yum');
INSERT INTO `translation` VALUES('password', 'mot de passe', 'fr', 'yum');
INSERT INTO `translation` VALUES('password', 'password', 'it', 'yum');
INSERT INTO `translation` VALUES('password', 'hadÅ‚o', 'pl', 'yum');
INSERT INTO `translation` VALUES('password', 'ÐŸÐ°Ñ€Ð¾Ð»ÑŒ', 'ru', 'yum');
INSERT INTO `translation` VALUES('private', 'Privat', 'de', 'yum');
INSERT INTO `translation` VALUES('private', 'privado', 'es', 'yum');
INSERT INTO `translation` VALUES('private', 'Privé', 'fr', 'yum');
INSERT INTO `translation` VALUES('private', 'Privato', 'it', 'yum');
INSERT INTO `translation` VALUES('private', 'prywatny', 'pl', 'yum');
INSERT INTO `translation` VALUES('protected', 'Geschützt', 'de', 'yum');
INSERT INTO `translation` VALUES('protected', 'protegido', 'es', 'yum');
INSERT INTO `translation` VALUES('protected', 'Protégé', 'fr', 'yum');
INSERT INTO `translation` VALUES('protected', 'Protetto', 'it', 'yum');
INSERT INTO `translation` VALUES('protected', 'chroniony', 'pl', 'yum');
INSERT INTO `translation` VALUES('public', 'Öffentlich', 'de', 'yum');
INSERT INTO `translation` VALUES('public', 'público', 'es', 'yum');
INSERT INTO `translation` VALUES('public', 'Publique', 'fr', 'yum');
INSERT INTO `translation` VALUES('public', 'Pubblico', 'it', 'yum');
INSERT INTO `translation` VALUES('public', 'publiczny', 'pl', 'yum');
INSERT INTO `translation` VALUES('street', 'rue', 'fr', 'yum');
INSERT INTO `translation` VALUES('street', 'Indirizzo', 'it', 'yum');
INSERT INTO `translation` VALUES('timestamp', 'Zeitstempel', 'de', 'yum');
INSERT INTO `translation` VALUES('timestamp', 'marca de tiempo', 'es', 'yum');
INSERT INTO `translation` VALUES('timestamp', 'Tampon de date et heure', 'fr', 'yum');
INSERT INTO `translation` VALUES('timestamp', 'timestamp', 'it', 'yum');
INSERT INTO `translation` VALUES('username', 'Benutzername', 'de', 'yum');
INSERT INTO `translation` VALUES('username', 'usuario', 'es', 'yum');
INSERT INTO `translation` VALUES('username', 'nom d utilisateur', 'fr', 'yum');
INSERT INTO `translation` VALUES('username', 'username', 'it', 'yum');
INSERT INTO `translation` VALUES('username', 'nazwa uÅ¼ytkownika', 'pl', 'yum');
INSERT INTO `translation` VALUES('username', 'Ð›Ð¾Ð³Ð¸Ð½', 'ru', 'yum');
INSERT INTO `translation` VALUES('username or email', 'Benutzername oder E-Mail Adresse', 'de', 'yum');
INSERT INTO `translation` VALUES('username or email', 'nombre de usuario o email', 'es', 'yum');
INSERT INTO `translation` VALUES('username or email', 'nom d''utilisateur ou adresse e-mail', 'fr', 'yum');
INSERT INTO `translation` VALUES('username or email', 'username or email', 'it', 'yum');
INSERT INTO `translation` VALUES('username or email', 'nazwa uÅ¼ytkowniak lub mejl', 'pl', 'yum');
INSERT INTO `translation` VALUES('username or email', 'Ð›Ð¾Ð³Ð¸Ð½ Ð¸Ð»Ð¸ email', 'ru', 'yum');
INSERT INTO `translation` VALUES('verifyPassword', 'Passwort wiederholen', 'de', 'yum');
INSERT INTO `translation` VALUES('yes', 'Ja, diese Daten veröffentlichen', 'de', 'yum');
INSERT INTO `translation` VALUES('yes', 'Oui, rendre publique ces données', 'fr', 'yum');
INSERT INTO `translation` VALUES('yes', 'Si', 'it', 'yum');
INSERT INTO `translation` VALUES('zipcode', 'Postleitzahl', 'de', 'yum');
INSERT INTO `translation` VALUES('zipcode', 'code postal', 'fr', 'yum');
INSERT INTO `translation` VALUES('zipcode', 'CAP', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too long (max. {num} characters).', '{attribute} es muy larga (max. {num} caracteres).', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too long (max. {num} characters).', '{attribute} troppo lungo (max. {num} caratteri).', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too long (max. {num} characters).', '{attribute} jest zbyt dÅ‚ugi (max. {num} znakÃ³w).', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too short (min. {num} characters).', '{attribute} es muy corta (min. {num} caracteres).', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too short (min. {num} characters).', '{attribute} troppo corto (min. {num} caratteri).', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} is too short (min. {num} characters).', '{attribute} jest zbyt krÃ³tki (min. {num} znakÃ³w).', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} digits.', '{attribute} debe tener al menos {num} dígitos.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} digits.', '{attribute}deve includere almeno {num} numeri.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} digits.', '{attribute} musi zawieraÄ‡ co najmniej {num} cyfr.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} lower case letters.', '{attribute} debe tener al menos {num} caracteres en minúscula.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} lower case letters.', '{attribute} deve includere almeno {num} lettere minuscole.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} lower case letters.', '{attribute} musi zawieraÄ‡ co najmniej {num} maÅ‚ych liter.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} symbols.', '{attribute} debe tener al menos {num} símbolos.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} symbols.', '{attribute} deve includere almeno {num} simboli.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} symbols.', '{attribute} musi zawieraÄ‡ co najmniej {num} symboli.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} upper case letters.', '{attribute} debe tener al menos {num} caracteres en mayúscula.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} upper case letters.', '{attribute} deve includere almeno {num} lettere maiuscole.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must include at least {num} upper case letters.', '{attribute} musi zawieraÄ‡ co najmniej {num} duÅ¼ych liter.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain more than {num} sequentially repeated characters.', '{attribute} no debe tener más de {num} caracteres repetidos secuencialmente.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain more than {num} sequentially repeated characters.', '{attribute} non deve contenere {num} caratteri ripetuti sequenzialmente.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain more than {num} sequentially repeated characters.', '{attribute} nie moÅ¼e zawieraÄ‡ wiÄ™cej niÅ¼ {num} sekwencji znakÃ³w.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain whitespace.', '{attribute} no debe contener espacios.', 'es', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain whitespace.', '{attribute} non deve contenere spazi.', 'it', 'yum');
INSERT INTO `translation` VALUES('{attribute} must not contain whitespace.', '{attribute} nie moÅ¼e zawieraÄ‡ biaÅ‚ych znakÃ³w.', 'pl', 'yum');
INSERT INTO `translation` VALUES('{days} D, {hours} H, {minutes} M', '{days} T, {hours} S, {minutes} M', 'de', 'yum');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `activationKey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `lastaction` int(10) NOT NULL DEFAULT '0',
  `lastpasswordchange` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `notifyType` enum('None','Digest','Instant','Threshold') DEFAULT 'Instant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` VALUES(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 1350927065, 1351661256, 1351625143, 0, 1, 1, 'images/1_Quatre du 41100498-11- à 11.25.jpg', 'Instant');
INSERT INTO `user` VALUES(2, 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', '', 1350927065, 1350927102, 1350927111, 0, 0, 1, NULL, 'Instant');
INSERT INTO `user` VALUES(3, '', '', '', 0, 0, 1350927183, 0, 0, -2, NULL, 'Instant');
INSERT INTO `user` VALUES(6, 'test001', '81dc9bdb52d04dc20036dbd8313ed055', '6c5ab4dbe269812cf6ffcca0a911a0fa', 1351020535, 0, 0, 1351020535, 0, 1, NULL, 'Instant');

-- --------------------------------------------------------

--
-- Structure de la table `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `user_group`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_group_message`
--

CREATE TABLE IF NOT EXISTS `user_group_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `user_group_message`
--


-- --------------------------------------------------------

--
-- Structure de la table `user_role`
--

CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user_role`
--

INSERT INTO `user_role` VALUES(2, 3);
INSERT INTO `user_role` VALUES(6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `yumtextsettings`
--

CREATE TABLE IF NOT EXISTS `yumtextsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('en_us','de','fr','pl','ru','es','ro') NOT NULL DEFAULT 'en_us',
  `text_email_registration` text,
  `subject_email_registration` text,
  `text_email_recovery` text,
  `text_email_activation` text,
  `text_friendship_new` text,
  `text_friendship_confirmed` text,
  `text_profilecomment_new` text,
  `text_message_new` text,
  `text_membership_ordered` text,
  `text_payment_arrived` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `yumtextsettings`
--

INSERT INTO `yumtextsettings` VALUES(1, 'en_us', 'You have registered for this Application. To confirm your E-Mail address, please visit {activation_url}', 'You have registered for an application', 'You have requested a new Password. To set your new Password,\n                                                                               please go to {activation_url}', 'Your account has been activated. Thank you for your registration.', 'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}', 'The User {username} has accepted your friendship request', 'You have a new profile comment from {username}: {message} visit your profile: {link_profile}', 'You have received a new message from {username}: {message}', 'Your order of membership {membership} on {order_date} has been taken. Your order Number is {id}. You have choosen the payment style {payment}.', 'Your payment has been received on {payment_date} and your Membership {id} is now active');
INSERT INTO `yumtextsettings` VALUES(2, 'de', 'Sie haben sich für unsere Applikation registriert. Bitte bestätigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}', 'Sie haben sich für eine Applikation registriert.', 'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}', 'Ihr Konto wurde freigeschaltet.', 'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n                                                       Nachricht: {message}\n\n                                                        Klicken sie <a href="{link_friends}">hier</a>, um diese Anfrage zu bestätigen oder zu ignorieren. Alternativ können sie <a href="{link_profile}">hier</a> auf ihre Profilseite zugreifen.', 'Der Benutzer {username} hat ihre Freundschaftsanfrage bestätigt.', '\n                                                     Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n                                                      {message}\n\n                                                   <a href="{link}">hier</a> geht es direkt zu Ihrer Pinnwand!', 'Sie haben eine neue Nachricht von {username} bekommen: {message}', 'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewählte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.', 'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.');
INSERT INTO `yumtextsettings` VALUES(3, 'es', 'Te has registrado en esta aplicación. Para confirmar tu dirección de correo electrónico, por favor, visita {activation_url}.', 'Te has registrado en esta aplicación.', 'Has solicitado una nueva contraseña. Para establecer una nueva contraseña, por favor ve a {activation_url}', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}', 'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}', 'Please translatore thisse hiere toh tha espagnola langsch {username}', 'Has recibido un mensaje de {username}: {message}', 'Tu orden de membresía {membership} de fecha {order_date} fué tomada. Tu número de orden es {id}. Escogiste como modo de pago {payment}.', 'Tu pago fué recibido en fecha {payment_date}. Ahora tu Membresía {id} ya está activa');
INSERT INTO `yumtextsettings` VALUES(4, 'fr', '', '', '', '', '', '', '', '', '', '');
INSERT INTO `yumtextsettings` VALUES(5, 'ro', '', '', '', '', '', '', '', '', '', '');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `episode`
--
ALTER TABLE `episode`
  ADD CONSTRAINT `FK_episode_program` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `FK_program_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `FK_schedule_episode` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`id`) ON DELETE CASCADE;
