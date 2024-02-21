/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS carts;
CREATE TABLE `carts` (
  `user_id` bigint NOT NULL,
  `product_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS categories;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_rows;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS data_types;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menu_items;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS menus;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS order_product;
CREATE TABLE `order_product` (
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS orders;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `status` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cart',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_reset_tokens;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permission_role;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permissions;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS personal_access_tokens;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS products;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint NOT NULL,
  `price` float NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS settings;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS translations;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS user_roles;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO carts(user_id,product_id) VALUES('1','6'),('1','7');

INSERT INTO categories(id,name,created_at,updated_at) VALUES('1','\'Hu Cooper\'','\'2024-02-20 00:20:14\'','\'2024-02-20 00:20:14\''),('2','\'Thane Elliott\'','\'2024-02-20 00:20:23\'','\'2024-02-20 00:20:23\'');

INSERT INTO data_rows(id,data_type_id,field,type,display_name,required,browse,read,edit,add,delete,details,order) VALUES('1','1','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','X\'7b7d\'','1'),('2','1','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('3','1','\'email\'','\'text\'','\'Email\'','1','1','1','1','1','1','X\'7b7d\'','3'),('4','1','\'password\'','\'password\'','\'Password\'','1','0','0','1','1','0','X\'7b7d\'','4'),('5','1','\'remember_token\'','\'text\'','\'Remember Token\'','0','0','0','0','0','0','X\'7b7d\'','5'),('6','1','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','0','0','0','X\'7b7d\'','6'),('7','1','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','7'),('8','1','\'avatar\'','\'image\'','\'Avatar\'','0','1','1','1','1','1','X\'7b7d\'','8'),('9','1','\'user_belongsto_role_relationship\'','\'relationship\'','\'Role\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22726f6c655f6964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22726f6c6573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','10'),('10','1','\'user_belongstomany_role_relationship\'','\'relationship\'','\'Roles\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22757365725f726f6c6573222c227069766f74223a2231222c227461676761626c65223a2230227d\'','11'),('11','1','\'settings\'','\'hidden\'','\'Settings\'','0','0','0','0','0','0','X\'7b7d\'','12'),('12','2','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('13','2','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('14','2','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('15','2','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('16','3','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('17','3','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('18','3','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('19','3','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('20','3','\'display_name\'','\'text\'','\'Display Name\'','1','1','1','1','1','1','NULL','5'),('21','1','\'role_id\'','\'text\'','\'Role\'','0','1','1','1','1','1','X\'7b7d\'','9'),('22','5','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('23','5','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('24','5','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','3'),('25','5','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','4'),('26','6','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('27','6','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('28','6','\'description\'','\'text_area\'','\'Description\'','1','1','1','1','1','1','X\'7b7d\'','3'),('29','6','\'image\'','\'image\'','\'Image\'','1','1','1','1','1','1','X\'7b7d\'','4'),('30','6','\'category_id\'','\'text\'','\'Category Id\'','1','1','1','1','1','1','X\'7b7d\'','5'),('31','6','\'price\'','\'number\'','\'Price\'','1','1','1','1','1','1','X\'7b7d\'','6'),('32','6','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','7'),('33','6','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','8'),('34','6','\'product_belongsto_category_relationship\'','\'relationship\'','\'category\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c43617465676f7279222c227461626c65223a2263617465676f72696573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2263617465676f72795f6964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','9'),('35','5','\'category_hasmany_product_relationship\'','\'relationship\'','\'products\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a226861734d616e79222c22636f6c756d6e223a2263617465676f72795f6964222c226b6579223a226964222c226c6162656c223a226964222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','5'),('37','6','\'product_belongstomany_user_relationship\'','\'relationship\'','\'users\'','0','0','0','0','0','0','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226f7264657273222c227069766f74223a2231222c227461676761626c65223a2230227d\'','10'),('38','8','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('41','8','\'status\'','\'text\'','\'Status\'','1','1','1','1','1','1','X\'7b7d\'','4'),('42','8','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','5'),('43','8','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','6'),('44','8','\'order_belongsto_user_relationship\'','\'relationship\'','\'user\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22757365725f6964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','7'),('46','8','\'order_hasmany_product_relationship\'','\'relationship\'','\'products\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226f726465725f70726f64756374222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','8'),('47','6','\'product_belongstomany_order_relationship\'','\'relationship\'','\'orders\'','0','0','0','0','0','0','X\'7b226d6f64656c223a224170705c5c4f72646572222c227461626c65223a226f7264657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226964222c227069766f745f7461626c65223a226f726465725f70726f64756374222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','11'),('48','8','\'user_id\'','\'text\'','\'User Id\'','1','1','1','1','1','1','X\'7b7d\'','5'),('49','1','\'email_verified_at\'','\'timestamp\'','\'Email Verified At\'','0','1','1','1','1','1','X\'7b7d\'','6'),('50','1','\'user_belongstomany_product_relationship\'','\'relationship\'','\'products\'','0','0','0','0','0','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226361727473222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','13'),('51','6','\'product_belongstomany_user_relationship_1\'','\'relationship\'','\'users\'','0','0','0','0','0','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226361727473222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','12'),('52','9','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','0'),('53','9','\'payment_id\'','\'text\'','\'Payment Id\'','1','1','1','1','1','1','X\'7b7d\'','2'),('54','9','\'description\'','\'text\'','\'Description\'','1','1','1','1','1','1','X\'7b7d\'','3'),('55','9','\'amount\'','\'text\'','\'Amount\'','1','1','1','1','1','1','X\'7b7d\'','4'),('56','9','\'currency\'','\'text\'','\'Currency\'','1','1','1','1','1','1','X\'7b7d\'','5'),('57','9','\'payment_status\'','\'text\'','\'Payment Status\'','1','1','1','1','1','1','X\'7b7d\'','6'),('58','9','\'payment_method\'','\'text\'','\'Payment Method\'','1','1','1','1','1','1','X\'7b7d\'','7'),('59','9','\'order_id\'','\'text\'','\'Order Id\'','1','1','1','1','1','1','X\'7b7d\'','8'),('60','9','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','9'),('61','9','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','10');

INSERT INTO data_types(id,name,slug,display_name_singular,display_name_plural,icon,model_name,policy_name,controller,description,generate_permissions,server_side,details,created_at,updated_at) VALUES('1','\'users\'','\'users\'','\'User\'','\'Users\'','\'voyager-person\'','\'TCG\\\\Voyager\\\\Models\\\\User\'','\'TCG\\\\Voyager\\\\Policies\\\\UserPolicy\'','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerUserController\'','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a2264657363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:12:38\'','\'2024-02-20 18:35:34\''),('2','\'menus\'','\'menus\'','\'Menu\'','\'Menus\'','\'voyager-list\'','\'TCG\\\\Voyager\\\\Models\\\\Menu\'','NULL','\'\'','\'\'','1','0','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('3','\'roles\'','\'roles\'','\'Role\'','\'Roles\'','\'voyager-lock\'','\'TCG\\\\Voyager\\\\Models\\\\Role\'','NULL','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerRoleController\'','\'\'','1','0','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('5','\'categories\'','\'categories\'','\'Category\'','\'Categories\'','NULL','\'App\\\\Category\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:28:27\''),('6','\'products\'','\'products\'','\'Product\'','\'Products\'','NULL','\'App\\\\Product\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:24:08\'','\'2024-02-20 18:36:00\''),('8','\'orders\'','\'orders\'','\'Order\'','\'Orders\'','NULL','\'App\\\\Order\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:59:00\''),('9','\'payments\'','\'payments\'','\'Payment\'','\'Payments\'','NULL','\'App\\\\Models\\\\Payment\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c7d\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'');


INSERT INTO menu_items(id,menu_id,title,url,target,icon_class,color,parent_id,order,created_at,updated_at,route,parameters) VALUES('1','1','\'Dashboard\'','\'\'','\'_self\'','\'voyager-boat\'','NULL','NULL','1','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.dashboard\'','NULL'),('2','1','\'Media\'','\'\'','\'_self\'','\'voyager-images\'','NULL','NULL','5','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.media.index\'','NULL'),('3','1','\'Users\'','\'\'','\'_self\'','\'voyager-person\'','NULL','NULL','3','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.users.index\'','NULL'),('4','1','\'Roles\'','\'\'','\'_self\'','\'voyager-lock\'','NULL','NULL','2','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.roles.index\'','NULL'),('5','1','\'Tools\'','\'\'','\'_self\'','\'voyager-tools\'','NULL','NULL','9','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','NULL','NULL'),('6','1','\'Menu Builder\'','\'\'','\'_self\'','\'voyager-list\'','NULL','5','10','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.menus.index\'','NULL'),('7','1','\'Database\'','\'\'','\'_self\'','\'voyager-data\'','NULL','5','11','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.database.index\'','NULL'),('8','1','\'Compass\'','\'\'','\'_self\'','\'voyager-compass\'','NULL','5','12','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.compass.index\'','NULL'),('9','1','\'BREAD\'','\'\'','\'_self\'','\'voyager-bread\'','NULL','5','13','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.bread.index\'','NULL'),('10','1','\'Settings\'','\'\'','\'_self\'','\'voyager-settings\'','NULL','NULL','14','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.settings.index\'','NULL'),('11','1','\'Categories\'','\'\'','\'_self\'','NULL','NULL','NULL','15','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\'','\'voyager.categories.index\'','NULL'),('12','1','\'Products\'','\'\'','\'_self\'','NULL','NULL','NULL','16','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\'','\'voyager.products.index\'','NULL'),('13','1','\'Orders\'','\'\'','\'_self\'','NULL','NULL','NULL','17','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\'','\'voyager.orders.index\'','NULL'),('14','1','\'Payments\'','\'\'','\'_self\'','NULL','NULL','NULL','18','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'','\'voyager.payments.index\'','NULL');

INSERT INTO menus(id,name,created_at,updated_at) VALUES('1','\'admin\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'');

INSERT INTO migrations(id,migration,batch) VALUES('1','\'2014_10_12_000000_create_users_table\'','1'),('2','\'2014_10_12_100000_create_password_reset_tokens_table\'','1'),('3','\'2016_01_01_000000_add_voyager_user_fields\'','1'),('4','\'2016_01_01_000000_create_data_types_table\'','1'),('5','\'2016_05_19_173453_create_menu_table\'','1'),('6','\'2016_10_21_190000_create_roles_table\'','1'),('7','\'2016_10_21_190000_create_settings_table\'','1'),('8','\'2016_11_30_135954_create_permission_table\'','1'),('9','\'2016_11_30_141208_create_permission_role_table\'','1'),('10','\'2016_12_26_201236_data_types__add__server_side\'','1'),('11','\'2017_01_13_000000_add_route_to_menu_items_table\'','1'),('12','\'2017_01_14_005015_create_translations_table\'','1'),('13','\'2017_01_15_000000_make_table_name_nullable_in_permissions_table\'','1'),('14','\'2017_03_06_000000_add_controller_to_data_types_table\'','1'),('15','\'2017_04_21_000000_add_order_to_data_rows_table\'','1'),('16','\'2017_07_05_210000_add_policyname_to_data_types_table\'','1'),('17','\'2017_08_05_000000_add_group_to_settings_table\'','1'),('18','\'2017_11_26_013050_add_user_role_relationship\'','1'),('19','\'2017_11_26_015000_create_user_roles_table\'','1'),('20','\'2018_03_11_000000_add_user_settings\'','1'),('21','\'2018_03_14_000000_add_details_to_data_types_table\'','1'),('22','\'2018_03_16_000000_make_settings_value_nullable\'','1'),('23','\'2019_08_19_000000_create_failed_jobs_table\'','1'),('26','\'2019_12_14_000001_create_personal_access_tokens_table\'','2'),('27','\'2024_02_20_134058_create_payments_table\'','3');

INSERT INTO order_product(order_id,product_id,created_at,updated_at) VALUES('1','5','NULL','NULL'),('2','4','NULL','NULL'),('2','5','NULL','NULL'),('3','4','NULL','NULL'),('4','7','NULL','NULL'),('6','7','NULL','NULL'),('7','7','NULL','NULL'),('8','6','NULL','NULL'),('8','7','NULL','NULL');

INSERT INTO orders(id,status,created_at,updated_at,user_id) VALUES('4','\'paid\'','\'2024-02-21 10:57:50\'','\'2024-02-21 10:58:20\'','12'),('5','\'unpaid\'','\'2024-02-21 11:00:47\'','\'2024-02-21 11:00:47\'','12'),('6','\'unpaid\'','\'2024-02-21 11:01:21\'','\'2024-02-21 11:01:21\'','12'),('7','\'paid\'','\'2024-02-21 11:09:37\'','\'2024-02-21 11:09:49\'','12'),('8','\'paid\'','\'2024-02-21 11:34:17\'','\'2024-02-21 11:35:06\'','12');


INSERT INTO permission_role(permission_id,role_id) VALUES('1','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('10','1'),('11','1'),('12','1'),('13','1'),('14','1'),('15','1'),('16','1'),('17','1'),('18','1'),('19','1'),('20','1'),('21','1'),('22','1'),('23','1'),('24','1'),('25','1'),('26','1'),('27','1'),('28','1'),('29','1'),('30','1'),('31','1'),('32','1'),('33','1'),('34','1'),('35','1'),('36','1'),('37','1'),('38','1'),('39','1'),('40','1'),('41','1'),('42','1'),('43','1'),('44','1'),('45','1');

INSERT INTO permissions(id,key,table_name,created_at,updated_at) VALUES('1','\'browse_admin\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('2','\'browse_bread\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('3','\'browse_database\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('4','\'browse_media\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('5','\'browse_compass\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('6','\'browse_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('7','\'read_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('8','\'edit_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('9','\'add_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('10','\'delete_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('11','\'browse_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('12','\'read_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('13','\'edit_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('14','\'add_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('15','\'delete_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('16','\'browse_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('17','\'read_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('18','\'edit_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('19','\'add_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('20','\'delete_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('21','\'browse_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('22','\'read_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('23','\'edit_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('24','\'add_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('25','\'delete_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('26','\'browse_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('27','\'read_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('28','\'edit_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('29','\'add_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('30','\'delete_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('31','\'browse_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('32','\'read_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('33','\'edit_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('34','\'add_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('35','\'delete_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('36','\'browse_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('37','\'read_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('38','\'edit_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('39','\'add_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('40','\'delete_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('41','\'browse_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('42','\'read_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('43','\'edit_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('44','\'add_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('45','\'delete_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'');


INSERT INTO products(id,name,description,image,category_id,price,created_at,updated_at) VALUES('6','\'Samson Glover\'','X\'436f6e73657175756e747572206f6d6e69732073\'','\'products\\\\February2024\\\\fKtcfGUnUmnTBnabdbHO.webp\'','2','27.7','\'2024-02-20 18:42:15\'','\'2024-02-20 18:42:15\''),('7','\'Grady Kerr\'','X\'4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742e205365640d0a2020202020202020202020202020202020202020202020202020202073656420616e7465206a7573746f2e20496e746567657220657569736d6f64206c696265726f206964206d6175726973206d616c6573756164612074696e636964756e742e20566976616d757320636f6d6d6f646f206e756c6c612075740d0a202020202020202020202020202020202020202020202020202020206c6f72656d2072686f6e63757320616c69717565742e204475697320646170696275732061756775652076656c20697073756d207072657469756d2c2065742076656e656e617469732073656d20626c616e6469742e20517569737175650d0a2020202020202020202020202020202020202020202020202020202075742065726174207669746165206e69736920756c74726963657320706c616365726174206e6f6e20656765742076656c69742e20496e7465676572206f726e617265206d692073656420697073756d206c6163696e69612c206e6f6e0d0a202020202020202020202020202020202020202020202020202020207361676974746973206d617572697320626c616e6469742e204d6f726269206665726d656e74756d206c696265726f2076656c206e69736c2073757363697069742c206e65632074696e636964756e74206d6920636f6e73656374657475722e\'','\'products\\\\February2024\\\\WNNAey9df5NqFRdxpG3W.webp\'','1','72','\'2024-02-20 19:27:00\'','\'2024-02-20 19:52:38\'');

INSERT INTO roles(id,name,display_name,created_at,updated_at) VALUES('1','\'admin\'','\'Administrator\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('2','\'user\'','\'Normal User\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'');

INSERT INTO settings(id,key,display_name,value,details,type,order,group) VALUES('1','\'site.title\'','\'Site Title\'','X\'53697465205469746c65\'','X\'\'','\'text\'','1','\'Site\''),('2','\'site.description\'','\'Site Description\'','X\'53697465204465736372697074696f6e\'','X\'\'','\'text\'','2','\'Site\''),('3','\'site.logo\'','\'Site Logo\'','X\'\'','X\'\'','\'image\'','3','\'Site\''),('4','\'site.google_analytics_tracking_id\'','\'Google Analytics Tracking ID\'','X\'\'','X\'\'','\'text\'','4','\'Site\''),('5','\'admin.bg_image\'','\'Admin Background Image\'','X\'\'','X\'\'','\'image\'','5','\'Admin\''),('6','\'admin.title\'','\'Admin Title\'','X\'566f7961676572\'','X\'\'','\'text\'','1','\'Admin\''),('7','\'admin.description\'','\'Admin Description\'','X\'57656c636f6d6520746f20566f79616765722e20546865204d697373696e672041646d696e20666f72204c61726176656c\'','X\'\'','\'text\'','2','\'Admin\''),('8','\'admin.loader\'','\'Admin Loader\'','X\'\'','X\'\'','\'image\'','3','\'Admin\''),('9','\'admin.icon_image\'','\'Admin Icon Image\'','X\'\'','X\'\'','\'image\'','4','\'Admin\''),('10','\'admin.google_analytics_client_id\'','\'Google Analytics Client ID (used for admin dashboard)\'','X\'\'','X\'\'','\'text\'','1','\'Admin\'');


INSERT INTO user_roles(user_id,role_id) VALUES('8','1'),('9','2'),('12','2');
INSERT INTO users(id,role_id,name,email,avatar,email_verified_at,password,remember_token,settings,created_at,updated_at) VALUES('1','1','\'mohamed\'','\'admin@admin.com\'','\'users/default.png\'','NULL','\'$2y$12$UfM889uKfUa7QMfLmaVjN.JeVdHVoPmD9Yl0gghvo/HxLZvWUR50i\'','NULL','NULL','\'2024-02-20 00:13:29\'','\'2024-02-20 00:13:29\''),('2','2','\'Desirae Humphrey\'','\'fomuwog@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$12xaBUiL863XD8.upAPrVuRoE/U3mP8VNT1W7cyNidkU8VkdIy5qa\'','NULL','NULL','\'2024-02-20 08:58:18\'','\'2024-02-20 08:58:18\''),('3','2','\'Phelan Fisher\'','\'boqi@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$rur/0LlerzWW4uvkLxVRm.KGO9hUvURfoJRSXLY7biLXK8Dbba/o6\'','NULL','NULL','\'2024-02-20 09:00:20\'','\'2024-02-20 09:00:20\''),('4','2','\'Lilah Tyler\'','\'bybyq@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$4wX3qzALpOmTblKrnk9NkeTbiEjZdYZ.6rGxZVmkLvnv/n685yh66\'','NULL','NULL','\'2024-02-20 09:02:15\'','\'2024-02-20 09:02:15\''),('5','NULL','\'Sacha Barnett\'','\'hijicam@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$ezzdG5PgAcCiwNCdWuymYulcama3xRe.R1ccn2OtZ6.G227EqPe8W\'','NULL','NULL','\'2024-02-20 09:14:16\'','\'2024-02-20 09:14:16\''),('6','2','\'Naomi Knight\'','\'xakyny@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$bllFNA5Kft4wvCfY5aiy7e001uiDBLcT3eBz76YluCSMTYpIcSPSu\'','NULL','NULL','\'2024-02-20 09:16:02\'','\'2024-02-20 09:16:02\''),('7','2','\'Amir Santos\'','\'pudituxe@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$RyTsu.StbzE1rXyWR.QDPuSCGcyYK7Q.jCzTl41GDuiJj41U.S18m\'','NULL','NULL','\'2024-02-20 09:16:23\'','\'2024-02-20 09:16:23\''),('8','2','\'Cathleen Burris\'','\'lusybuli@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$a8s5.ZM0g9brdPj9OYhit.6hcmXJz1gAYXtp/41sZ4If0n5A6qycG\'','NULL','NULL','\'2024-02-20 09:17:16\'','\'2024-02-20 09:17:16\''),('9','2','\'Daquan Mcintosh\'','\'sysexig@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$/CC9OqpGF6yv6Wm4fkY1m.8qDu2fYaMKWK7HI.Cj7K9bM0fpGRxvq\'','NULL','NULL','\'2024-02-20 09:25:55\'','\'2024-02-20 09:25:55\''),('12','2','\'Kirby Landry\'','\'socugupy@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$MxfUCz63RhcIy9owDeoNCuwGRVrHUmgHsbOJDkm6QghpVSBq7Upx6\'','NULL','NULL','\'2024-02-21 10:57:43\'','\'2024-02-21 10:57:43\'');