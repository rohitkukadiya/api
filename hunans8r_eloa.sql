-- Adminer 4.3.0 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `loan_request_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_url` text COLLATE utf8mb4_unicode_ci,
  `medium_url` text COLLATE utf8mb4_unicode_ci,
  `thumb_url` text COLLATE utf8mb4_unicode_ci,
  `doc_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Image,2:Other',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `device_tokens`;
CREATE TABLE `device_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci,
  `device_token` text COLLATE utf8mb4_unicode_ci,
  `device_id` text COLLATE utf8mb4_unicode_ci,
  `app_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser_version` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:Android, 2: IOS, 3:Web',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:Logout, 1: Login',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_tokens_user_id_foreign` (`user_id`),
  CONSTRAINT `device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `device_tokens` (`id`, `user_id`, `auth_token`, `device_token`, `device_id`, `app_version`, `os_version`, `browser_name`, `browser_version`, `os`, `device_name`, `type`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1,	3,	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMsImlzcyI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbnQvbG9naW4iLCJpYXQiOjE1MjA4NDYzNjgsImV4cCI6MjEyMDg0NjM2OCwibmJmIjoxNTIwODQ2MzY4LCJqdGkiOiJaaklpRnpud1lmVHZIMmdoIn0.bhnrF1Yw7PPbD-7WPTz9sVMEcIlRWzHtwT6Vja4fvgY',	'poo',	'36',	'1',	'2',	NULL,	NULL,	NULL,	'Zuk Z1',	1,	1,	'2018-03-12 09:02:41',	'2018-03-12 09:19:28',	NULL),
(2,	1,	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbnQvbG9naW4iLCJpYXQiOjE1MjA4NDY0NTAsImV4cCI6MjEyMDg0NjQ1MCwibmJmIjoxNTIwODQ2NDUwLCJqdGkiOiJkQUw2UzkzNFI4cGt1TGZxIn0.z3PIV-vPaYnsaqtzveeVDXU9vIDedqK21KzzYShavsw',	'poo',	'363333',	'1',	'2',	NULL,	NULL,	NULL,	'Zuk Z1',	1,	1,	'2018-03-12 09:20:50',	'2018-03-12 09:20:50',	NULL),
(3,	1,	'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjEsImlzcyI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYWdlbnQvbG9naW4iLCJpYXQiOjE1MjA4NDY0NzQsImV4cCI6MjEyMDg0NjQ3NCwibmJmIjoxNTIwODQ2NDc0LCJqdGkiOiJsb0NJWUxVVW84aGRxYmxNIn0.7Ndo77ejFOyCMRrosTvkMDIJFQzV6Gi5nzNY_5uCJAE',	'poo',	'363333A',	'1',	'2',	NULL,	NULL,	NULL,	'Zuk Z1',	1,	1,	'2018-03-12 09:21:09',	'2018-03-12 09:21:14',	NULL);

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_resets_table',	1),
(3,	'2017_08_18_095441_entrust_setup_tables',	1),
(4,	'2017_11_12_161447_create_attachments_table',	1),
(6,	'2018_03_12_141754_create_device_tokens_table',	2);

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `law_firm_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_of_low_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_login_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_api` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0:In-Active, 1:Active',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `address`, `law_firm_name`, `phone`, `area_of_low_id`, `password`, `social_login_type`, `social_api`, `status`, `created_at`) VALUES
(1,	'check',	'kakde@gmail.com',	'test',	'hello',	'98980',	NULL,	'$2y$10$DoL9QOIy0QSvN/BYtesnr.Ne8uwYrBGFQkSeJP6TOWGKpWp7zK9DK',	NULL,	NULL,	1,	'2018-03-12 08:42:49'),
(3,	'check',	'kakde1@gmail.com',	'test',	'hello',	'989808',	NULL,	'$2y$10$pIno2Y./NVlM5mg.OiG0p.whKx.UhhSrxW2EB/XiNI6GaLXwoxV6i',	NULL,	NULL,	1,	'2018-03-12 09:02:41'),
(4,	'check',	'kakde1656@gmail.com',	'test',	'hello',	'989808546465',	NULL,	'$2y$10$JREBoB2fi3ASRodaL6ogfOb5xk8LVQSXfD8Lj5luyeqpfrwa7V.Ti',	NULL,	NULL,	1,	'2018-03-14 14:06:52'),
(5,	'check',	'vish@gmail.com',	'test',	'hello',	'225',	NULL,	'$2y$10$xXTnFc2wwWnQ3yKFUwbq2elVzIXmp.x0nHc5a5bZ/p5.xyaNYq1Pi',	NULL,	NULL,	1,	'2018-03-14 18:08:30'),
(6,	'check',	'vish11@gmail.com',	'test',	'hello',	'22523',	NULL,	'$2y$10$UV22JdlJZD7F9rMaMZ3Iq.Q9F.TuOxS7m.3keYSVCys9Yl838lzkO',	NULL,	NULL,	1,	'2018-03-14 18:13:38'),
(7,	'testing',	'vishkakde@gmail.com',	'test',	'hello',	'9983231',	NULL,	'$2y$10$x..y9CwRNksI.cK7CI5LWOQRf0Otr4c8EEW6/5zXRbdoSCzahMTbi',	NULL,	NULL,	1,	'2018-03-14 18:16:19'),
(8,	'Test',	'test@gmail.com',	'123, main street',	'law',	'987654310',	NULL,	'$2y$10$7ydloAFgDBLiNL8g/nk1deOnKmMs0siryeA4dJbt4Bch6ufoBeclW',	NULL,	NULL,	1,	'2018-03-14 21:43:12'),
(9,	'Test',	'test1@gmail.com',	'123,main street',	'law',	'9876543210',	NULL,	'$2y$10$ZQ8qlwtS2Jo.NvFqMl3w0.3Ne9Rd3u/AssowQOORVfSTIdm2sM16C',	NULL,	NULL,	1,	'2018-03-14 21:52:07'),
(10,	'Harshal',	'harsha@gmail.com',	'123, main street',	'firm',	'978462105',	NULL,	'$2y$10$tPNLyWccGxPerOKzcDDy7urUvurLas1m50PQ46bCkOD1UcecFNaCO',	NULL,	NULL,	1,	'2018-03-14 22:14:59'),
(11,	'Test2',	'test2@gmail.com',	'test address',	'firm',	'9786453120',	NULL,	'$2y$10$Wip4qC0pCy36NUhLQQV8juXJg6eQrO5ny6Tv/mmVJKKVxGaC/AAL6',	NULL,	NULL,	1,	'2018-03-14 22:27:02'),
(12,	'H',	'h@gmail.com',	'h',	'aja',	'485151848',	NULL,	'$2y$10$QgA1JUEW.d26.MHgeC2OSO08sXCPGfljJIBibYYTvT/5fAZFulTv.',	NULL,	NULL,	1,	'2018-03-14 22:29:34'),
(13,	'Test3',	'test3@gmail.com',	'test',	'jaj',	'9467318456',	NULL,	'$2y$10$l5eA9GLOfAkUG6g3zFqwC.qkw0rQXeGDIxr00tNdu7XUQKOUGlrWm',	NULL,	NULL,	1,	'2018-03-14 22:34:09'),
(14,	'Harshal',	'valanda.harshal15@gmail.con',	'123, main street gujarat',	'firm',	'9876541230',	NULL,	'$2y$10$7xk0D1gX8s7SWLmHCEiUO.Mwjbl1WcbvKMmq4r/44ezWL9FZaWr8W',	NULL,	NULL,	1,	'2018-03-14 23:04:58'),
(15,	'Harshal',	'harshal@yahoo.com',	'123, main street',	'firm',	'9786453210',	NULL,	'$2y$10$71nGxfJFnvqmXO.Q0A9pB.up9rTQhY6IgUtpn5NrNkT0ICpspOjSW',	NULL,	NULL,	1,	'2018-03-14 23:25:46'),
(16,	'Harshal',	'harshal15@gmail.com',	'123, main street',	'firm',	'9876451840',	NULL,	'$2y$10$KsL/bz9buXVRutE04VYDueru2Du2yW2I1ir2rE3QhwOMMuHAsemNm',	NULL,	NULL,	1,	'2018-03-14 23:57:21'),
(17,	'test',	'test@gmail.com',	'surat',	'apex',	'7895452631',	'law',	'cc03e747a6afbbcbf8be7668acfebee5',	NULL,	NULL,	0,	'2018-03-17 05:12:55'),
(18,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:16:03'),
(19,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:16:05'),
(20,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:28:34'),
(21,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:38:18'),
(22,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:43:21'),
(23,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:43:28'),
(24,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:44:30'),
(25,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:49:50'),
(26,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 05:50:18'),
(27,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 06:21:06'),
(28,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 06:21:29'),
(29,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'd41d8cd98f00b204e9800998ecf8427e',	NULL,	NULL,	0,	'2018-03-17 06:23:59'),
(36,	'Harshal',	'harshal@gmail.com',	'address',	'ajnan',	'9876543210',	'1',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'11',	0,	'2018-03-17 14:56:46'),
(37,	'mehul',	'mehul123@gmail.com',	'surat',	'test',	'9879879877',	'trettt',	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	0,	'2018-03-19 05:25:42'),
(38,	'mehul',	'mehul1231@gmail.com',	'surat',	'test',	'9879879877',	'trettt',	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	0,	'2018-03-19 05:30:42'),
(40,	NULL,	'rahul@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'11',	1,	'2018-03-19 07:27:56'),
(41,	NULL,	'rahul@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'112',	1,	'2018-03-19 08:04:37'),
(42,	NULL,	'rahul@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'1123',	1,	'2018-03-19 08:06:05'),
(43,	'Harshal',	'harshal@gmail.com',	'123,main steet ',	'firm',	'9876543210',	'1',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'11',	1,	'2018-03-19 14:38:48'),
(44,	'test',	'h@gmail.com',	NULL,	NULL,	NULL,	NULL,	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	1,	'2018-03-19 14:50:17'),
(45,	'test',	'h@gmail.com',	NULL,	NULL,	NULL,	NULL,	'202cb962ac59075b964b07152d234b70',	'fb',	'1',	1,	'2018-03-19 14:51:30'),
(46,	'test',	'h@gmail.com',	NULL,	NULL,	NULL,	NULL,	'202cb962ac59075b964b07152d234b70',	'fb',	'1',	1,	'2018-03-19 14:51:35'),
(47,	'test',	'h@gmail.com',	NULL,	NULL,	NULL,	NULL,	'202cb962ac59075b964b07152d234b70',	'fb',	'1',	1,	'2018-03-19 14:51:36'),
(48,	'Harshal',	'harshal@gmail.com',	'adress',	'ansn',	'948407648',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-19 15:01:18'),
(49,	'Test user',	'test@gmail.con',	'123, main street',	'firm',	'9876580428',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-19 15:34:48'),
(50,	'Harshal',	'harshal1@gmail.con',	'123 main street ',	'firm',	'9876543210',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-19 15:38:26'),
(51,	'mehul',	'ani@gmail.com',	'',	'',	'',	'',	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	1,	'2018-03-20 05:26:32'),
(52,	'mehul',	'ani@gmail.comw',	'',	'',	'',	'',	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	1,	'2018-03-20 05:52:28'),
(53,	'Harshal',	'harshal1@gmail.com',	'address',	'firm',	'9876543210',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-20 06:58:45'),
(54,	'Harshal Valanda',	'valanda.harshal15@gmail.com',	'',	'',	'',	'',	'202cb962ac59075b964b07152d234b70',	'fb',	'1',	1,	'2018-03-20 06:59:06'),
(55,	NULL,	'mehul123@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'asfasf',	1,	'2018-03-20 08:23:26'),
(56,	NULL,	'mehul123@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'sss',	1,	'2018-03-20 08:24:13'),
(57,	NULL,	'valanda.harshal15@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'facebook',	'1',	1,	'2018-03-20 14:29:58'),
(58,	'Test',	'test12@gmail.com',	'123, main street',	'firm',	'98764513',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-20 14:33:10'),
(59,	'Test',	'test123@gmail.com',	'test adress',	'aMma ',	'9784621380',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-20 14:37:10'),
(60,	'Test user',	'testuser@gmail.com',	'123, main street',	'firm name',	'9876546210',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-20 14:58:34'),
(61,	'Test',	'test1245@gmail.com',	'test',	'test',	'9876543210',	'',	'e10adc3949ba59abbe56e057f20f883e',	'normal',	'1',	1,	'2018-03-27 17:55:53'),
(62,	'mehul1',	'ani1@gmail.com',	'',	'',	'',	'',	'202cb962ac59075b964b07152d234b70',	'fb',	'11',	1,	'2018-03-28 09:33:26'),
(63,	NULL,	'mehul123@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	'fb',	'1123',	1,	'2018-03-28 11:47:30'),
(64,	'shalu',	'shalu@gmail.com',	'Pune',	'eloa Developer',	'7788778877',	'',	'202cb962ac59075b964b07152d234b70',	NULL,	NULL,	1,	'2018-03-30 07:09:51'),
(65,	'shalini',	'shalini@gmail.com',	'pune',	'Shalini developer',	'7788778878',	NULL,	'202cb962ac59075b964b07152d234b70',	NULL,	NULL,	1,	'2018-03-30 08:45:07'),
(66,	'shalu',	'shalu1@gmail.com',	'Pune',	'eloa Developer',	'7788778877',	'',	'202cb962ac59075b964b07152d234b70',	NULL,	NULL,	1,	'2018-03-30 08:46:39'),
(67,	'shalu',	'shalu2@gmail.com',	'Pune',	'eloa Developer',	'7788778877',	NULL,	'202cb962ac59075b964b07152d234b70',	NULL,	NULL,	1,	'2018-03-30 08:46:53'),
(68,	'shalini1',	'shalini1@gmail.com',	'pune',	'Shalini developers',	'7788778878',	'',	'202cb962ac59075b964b07152d234b70',	'',	'',	1,	'2018-03-30 09:17:58'),
(69,	'dev',	'dev@gmail.com',	'pune',	'test',	'7620815619',	'',	'827ccb0eea8a706c4c34a16891f84e7b',	'',	'',	1,	'2018-03-31 03:05:29'),
(70,	'salman',	'salman.hunaniinfotech@gmail.com',	'gshhsb',	'hunani',	'6451234876',	'',	'827ccb0eea8a706c4c34a16891f84e7b',	'',	'',	1,	'2018-04-02 13:00:05');

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `video` varchar(200) NOT NULL,
  `keyword` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `video` (`id`, `user_id`, `video`, `keyword`, `title`, `description`, `location`, `date`) VALUES
(18,	48,	'20180319152818.mp4',	'nansnz',	'jajsj',	'Nznsnsnz',	'bsnsnsjsjsjs',	'2018-03-19 15:28:18'),
(17,	48,	'20180319151534.mp4',	'test, test1',	'desc',	'desc',	'test',	'2018-03-19 15:15:35'),
(16,	48,	'20180319150529.mp4',	'test,test1',	'testing title',	'Testing desc',	'123 test',	'2018-03-19 15:05:30'),
(15,	37,	'20180319055845.mp4',	'test',	'etet',	'etet',	'suuu',	'2018-03-19 05:58:45'),
(19,	49,	'20180319153616.mp4',	'test, test1',	'injury law firm',	'Call at 555 555 5555',	'Gandhinagar ',	'2018-03-19 15:36:16'),
(20,	50,	'20180319153927.mp4',	'injury ',	'car accident ',	'Call at 555 555 5555',	'Gandhinagar ',	'2018-03-19 15:39:27'),
(21,	50,	'20180319160123.mp4',	'bsns',	'bznznz',	'Bsbsnsnx',	'desc',	'2018-03-19 16:01:24'),
(22,	50,	'20180319160429.mp4',	'jdjsj',	'nsjsn',	'Bsnsndn\nNsnsnsn\nMsmms',	'djjdjd',	'2018-03-19 16:04:29'),
(23,	59,	'20180320144218.mp4',	'injury',	'personal injury',	'Call on 555 555 5555',	'Detroit ',	'2018-03-20 14:42:19'),
(24,	60,	'20180320150002.mp4',	'injury ',	'personal injury ',	'Call on 555 555 5555',	'Detroit ',	'2018-03-20 15:00:04'),
(25,	36,	'20180326164101.mp4',	'bxnz',	'bznz',	'Hajs',	'hdjdh',	'2018-03-26 16:41:01'),
(26,	36,	'20180327175153.mp4',	'ghah',	'gayat',	'Gagahahah',	'jsjjs',	'2018-03-27 17:51:53'),
(27,	36,	'20180327175159.mp4',	'ghah',	'gayat',	'Gagahahah',	'jsjjs',	'2018-03-27 17:51:59'),
(28,	36,	'20180327175419.mp4',	'hajsj',	'haja',	'Hajaja',	'hshsh',	'2018-03-27 17:54:19'),
(29,	57,	'20180328165133.mp4',	'jsusj',	'hahz',	'Hzjzjz',	'ghhh',	'2018-03-28 16:51:33'),
(30,	57,	'20180328165135.mp4',	'jsusj',	'hahz',	'Hzjzjz',	'ghhh',	'2018-03-28 16:51:35'),
(31,	57,	'20180328165143.mp4',	'jsusj',	'hahz',	'Hzjzjz',	'ghhh',	'2018-03-28 16:51:43'),
(32,	36,	'20180328165337.mp4',	'sjjs',	'sjsj',	' Memems',	'ndjsj',	'2018-03-28 16:53:37');

-- 2018-04-03 11:06:27
