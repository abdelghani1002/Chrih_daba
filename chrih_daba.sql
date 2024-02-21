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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

DROP TABLE IF EXISTS favorites;
CREATE TABLE `favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `favorites_user_id_foreign` (`user_id`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_reset_tokens;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS payments;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO carts(user_id,product_id) VALUES('1','6'),('1','7');

INSERT INTO categories(id,name,created_at,updated_at) VALUES('1','\'Hu Cooper\'','\'2024-02-20 00:20:14\'','\'2024-02-20 00:20:14\''),('2','\'Thane Elliott\'','\'2024-02-20 00:20:23\'','\'2024-02-20 00:20:23\''),('3','\'new category\'','\'2024-02-21 16:22:33\'','\'2024-02-21 16:22:33\'');

INSERT INTO data_rows(id,data_type_id,field,type,display_name,required,browse,read,edit,add,delete,details,order) VALUES('1','1','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','X\'7b7d\'','1'),('2','1','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('3','1','\'email\'','\'text\'','\'Email\'','1','1','1','1','1','1','X\'7b7d\'','3'),('4','1','\'password\'','\'password\'','\'Password\'','1','0','0','1','1','0','X\'7b7d\'','4'),('5','1','\'remember_token\'','\'text\'','\'Remember Token\'','0','0','0','0','0','0','X\'7b7d\'','5'),('6','1','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','0','0','0','X\'7b7d\'','6'),('7','1','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','7'),('8','1','\'avatar\'','\'image\'','\'Avatar\'','0','1','1','1','1','1','X\'7b7d\'','8'),('9','1','\'user_belongsto_role_relationship\'','\'relationship\'','\'Role\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22726f6c655f6964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22726f6c6573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','10'),('10','1','\'user_belongstomany_role_relationship\'','\'relationship\'','\'Roles\'','0','1','1','1','1','0','X\'7b226d6f64656c223a225443475c5c566f79616765725c5c4d6f64656c735c5c526f6c65222c227461626c65223a22726f6c6573222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a22646973706c61795f6e616d65222c227069766f745f7461626c65223a22757365725f726f6c6573222c227069766f74223a2231222c227461676761626c65223a2230227d\'','11'),('11','1','\'settings\'','\'hidden\'','\'Settings\'','0','0','0','0','0','0','X\'7b7d\'','12'),('12','2','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('13','2','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('14','2','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('15','2','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('16','3','\'id\'','\'number\'','\'ID\'','1','0','0','0','0','0','NULL','1'),('17','3','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','NULL','2'),('18','3','\'created_at\'','\'timestamp\'','\'Created At\'','0','0','0','0','0','0','NULL','3'),('19','3','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','NULL','4'),('20','3','\'display_name\'','\'text\'','\'Display Name\'','1','1','1','1','1','1','NULL','5'),('21','1','\'role_id\'','\'text\'','\'Role\'','0','1','1','1','1','1','X\'7b7d\'','9'),('22','5','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('23','5','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('24','5','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','3'),('25','5','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','4'),('26','6','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('27','6','\'name\'','\'text\'','\'Name\'','1','1','1','1','1','1','X\'7b7d\'','2'),('28','6','\'description\'','\'text_area\'','\'Description\'','1','1','1','1','1','1','X\'7b7d\'','3'),('29','6','\'image\'','\'image\'','\'Image\'','1','1','1','1','1','1','X\'7b7d\'','4'),('30','6','\'category_id\'','\'text\'','\'Category Id\'','1','1','1','1','1','1','X\'7b7d\'','5'),('31','6','\'price\'','\'number\'','\'Price\'','1','1','1','1','1','1','X\'7b7d\'','6'),('32','6','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','7'),('33','6','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','8'),('34','6','\'product_belongsto_category_relationship\'','\'relationship\'','\'category\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c43617465676f7279222c227461626c65223a2263617465676f72696573222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a2263617465676f72795f6964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','9'),('35','5','\'category_hasmany_product_relationship\'','\'relationship\'','\'products\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a226861734d616e79222c22636f6c756d6e223a2263617465676f72795f6964222c226b6579223a226964222c226c6162656c223a226964222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','5'),('37','6','\'product_belongstomany_user_relationship\'','\'relationship\'','\'users\'','0','0','0','0','0','0','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226f7264657273222c227069766f74223a2231222c227461676761626c65223a2230227d\'','10'),('38','8','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','1'),('41','8','\'status\'','\'text\'','\'Status\'','1','1','1','1','1','1','X\'7b7d\'','4'),('42','8','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','5'),('43','8','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','6'),('44','8','\'order_belongsto_user_relationship\'','\'relationship\'','\'user\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f222c22636f6c756d6e223a22757365725f6964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a2263617465676f72696573222c227069766f74223a2230222c227461676761626c65223a2230227d\'','7'),('46','8','\'order_hasmany_product_relationship\'','\'relationship\'','\'products\'','0','1','1','1','1','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226f726465725f70726f64756374222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','8'),('47','6','\'product_belongstomany_order_relationship\'','\'relationship\'','\'orders\'','0','0','0','0','0','0','X\'7b226d6f64656c223a224170705c5c4f72646572222c227461626c65223a226f7264657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226964222c227069766f745f7461626c65223a226f726465725f70726f64756374222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','11'),('48','8','\'user_id\'','\'text\'','\'User Id\'','1','1','1','1','1','1','X\'7b7d\'','5'),('49','1','\'email_verified_at\'','\'timestamp\'','\'Email Verified At\'','0','1','1','1','1','1','X\'7b7d\'','6'),('50','1','\'user_belongstomany_product_relationship\'','\'relationship\'','\'products\'','0','0','0','0','0','1','X\'7b226d6f64656c223a224170705c5c50726f64756374222c227461626c65223a2270726f6475637473222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226361727473222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','13'),('51','6','\'product_belongstomany_user_relationship_1\'','\'relationship\'','\'users\'','0','0','0','0','0','1','X\'7b226d6f64656c223a224170705c5c4d6f64656c735c5c55736572222c227461626c65223a227573657273222c2274797065223a2262656c6f6e6773546f4d616e79222c22636f6c756d6e223a226964222c226b6579223a226964222c226c6162656c223a226e616d65222c227069766f745f7461626c65223a226361727473222c227069766f74223a2231222c227461676761626c65223a226f6e227d\'','12'),('52','9','\'id\'','\'text\'','\'Id\'','1','0','0','0','0','0','X\'7b7d\'','0'),('53','9','\'payment_id\'','\'text\'','\'Payment Id\'','1','1','1','1','1','1','X\'7b7d\'','2'),('54','9','\'description\'','\'text\'','\'Description\'','1','1','1','1','1','1','X\'7b7d\'','3'),('55','9','\'amount\'','\'text\'','\'Amount\'','1','1','1','1','1','1','X\'7b7d\'','4'),('56','9','\'currency\'','\'text\'','\'Currency\'','1','1','1','1','1','1','X\'7b7d\'','5'),('57','9','\'payment_status\'','\'text\'','\'Payment Status\'','1','1','1','1','1','1','X\'7b7d\'','6'),('58','9','\'payment_method\'','\'text\'','\'Payment Method\'','1','1','1','1','1','1','X\'7b7d\'','7'),('59','9','\'order_id\'','\'text\'','\'Order Id\'','1','1','1','1','1','1','X\'7b7d\'','8'),('60','9','\'created_at\'','\'timestamp\'','\'Created At\'','0','1','1','1','0','1','X\'7b7d\'','9'),('61','9','\'updated_at\'','\'timestamp\'','\'Updated At\'','0','0','0','0','0','0','X\'7b7d\'','10');

INSERT INTO data_types(id,name,slug,display_name_singular,display_name_plural,icon,model_name,policy_name,controller,description,generate_permissions,server_side,details,created_at,updated_at) VALUES('1','\'users\'','\'users\'','\'User\'','\'Users\'','\'voyager-person\'','\'TCG\\\\Voyager\\\\Models\\\\User\'','\'TCG\\\\Voyager\\\\Policies\\\\UserPolicy\'','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerUserController\'','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a2264657363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:12:38\'','\'2024-02-20 18:35:34\''),('2','\'menus\'','\'menus\'','\'Menu\'','\'Menus\'','\'voyager-list\'','\'TCG\\\\Voyager\\\\Models\\\\Menu\'','NULL','\'\'','\'\'','1','0','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('3','\'roles\'','\'roles\'','\'Role\'','\'Roles\'','\'voyager-lock\'','\'TCG\\\\Voyager\\\\Models\\\\Role\'','NULL','\'TCG\\\\Voyager\\\\Http\\\\Controllers\\\\VoyagerRoleController\'','\'\'','1','0','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('5','\'categories\'','\'categories\'','\'Category\'','\'Categories\'','NULL','\'App\\\\Category\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:28:27\''),('6','\'products\'','\'products\'','\'Product\'','\'Products\'','NULL','\'App\\\\Product\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 00:24:08\'','\'2024-02-20 18:36:00\''),('8','\'orders\'','\'orders\'','\'Order\'','\'Orders\'','NULL','\'App\\\\Order\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c2c2273636f7065223a6e756c6c7d\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:59:00\''),('9','\'payments\'','\'payments\'','\'Payment\'','\'Payments\'','NULL','\'App\\\\Models\\\\Payment\'','NULL','NULL','NULL','1','0','X\'7b226f726465725f636f6c756d6e223a6e756c6c2c226f726465725f646973706c61795f636f6c756d6e223a6e756c6c2c226f726465725f646972656374696f6e223a22617363222c2264656661756c745f7365617263685f6b6579223a6e756c6c7d\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'');


INSERT INTO favorites(id,user_id,product_id) VALUES('1','13','7'),('2','13','42'),('3','13','6'),('4','14','7');

INSERT INTO menu_items(id,menu_id,title,url,target,icon_class,color,parent_id,order,created_at,updated_at,route,parameters) VALUES('1','1','\'Dashboard\'','\'\'','\'_self\'','\'voyager-boat\'','NULL','NULL','1','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.dashboard\'','NULL'),('2','1','\'Media\'','\'\'','\'_self\'','\'voyager-images\'','NULL','NULL','5','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.media.index\'','NULL'),('3','1','\'Users\'','\'\'','\'_self\'','\'voyager-person\'','NULL','NULL','3','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.users.index\'','NULL'),('4','1','\'Roles\'','\'\'','\'_self\'','\'voyager-lock\'','NULL','NULL','2','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.roles.index\'','NULL'),('5','1','\'Tools\'','\'\'','\'_self\'','\'voyager-tools\'','NULL','NULL','9','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','NULL','NULL'),('6','1','\'Menu Builder\'','\'\'','\'_self\'','\'voyager-list\'','NULL','5','10','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.menus.index\'','NULL'),('7','1','\'Database\'','\'\'','\'_self\'','\'voyager-data\'','NULL','5','11','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.database.index\'','NULL'),('8','1','\'Compass\'','\'\'','\'_self\'','\'voyager-compass\'','NULL','5','12','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.compass.index\'','NULL'),('9','1','\'BREAD\'','\'\'','\'_self\'','\'voyager-bread\'','NULL','5','13','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.bread.index\'','NULL'),('10','1','\'Settings\'','\'\'','\'_self\'','\'voyager-settings\'','NULL','NULL','14','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'','\'voyager.settings.index\'','NULL'),('11','1','\'Categories\'','\'\'','\'_self\'','NULL','NULL','NULL','15','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\'','\'voyager.categories.index\'','NULL'),('12','1','\'Products\'','\'\'','\'_self\'','NULL','NULL','NULL','16','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\'','\'voyager.products.index\'','NULL'),('13','1','\'Orders\'','\'\'','\'_self\'','NULL','NULL','NULL','17','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\'','\'voyager.orders.index\'','NULL'),('14','1','\'Payments\'','\'\'','\'_self\'','NULL','NULL','NULL','18','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'','\'voyager.payments.index\'','NULL');

INSERT INTO menus(id,name,created_at,updated_at) VALUES('1','\'admin\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'');

INSERT INTO migrations(id,migration,batch) VALUES('1','\'2014_10_12_000000_create_users_table\'','1'),('2','\'2014_10_12_100000_create_password_reset_tokens_table\'','1'),('3','\'2016_01_01_000000_add_voyager_user_fields\'','1'),('4','\'2016_01_01_000000_create_data_types_table\'','1'),('5','\'2016_05_19_173453_create_menu_table\'','1'),('6','\'2016_10_21_190000_create_roles_table\'','1'),('7','\'2016_10_21_190000_create_settings_table\'','1'),('8','\'2016_11_30_135954_create_permission_table\'','1'),('9','\'2016_11_30_141208_create_permission_role_table\'','1'),('10','\'2016_12_26_201236_data_types__add__server_side\'','1'),('11','\'2017_01_13_000000_add_route_to_menu_items_table\'','1'),('12','\'2017_01_14_005015_create_translations_table\'','1'),('13','\'2017_01_15_000000_make_table_name_nullable_in_permissions_table\'','1'),('14','\'2017_03_06_000000_add_controller_to_data_types_table\'','1'),('15','\'2017_04_21_000000_add_order_to_data_rows_table\'','1'),('16','\'2017_07_05_210000_add_policyname_to_data_types_table\'','1'),('17','\'2017_08_05_000000_add_group_to_settings_table\'','1'),('18','\'2017_11_26_013050_add_user_role_relationship\'','1'),('19','\'2017_11_26_015000_create_user_roles_table\'','1'),('20','\'2018_03_11_000000_add_user_settings\'','1'),('21','\'2018_03_14_000000_add_details_to_data_types_table\'','1'),('22','\'2018_03_16_000000_make_settings_value_nullable\'','1'),('23','\'2019_08_19_000000_create_failed_jobs_table\'','1'),('26','\'2019_12_14_000001_create_personal_access_tokens_table\'','2'),('28','\'2024_02_20_134058_create_payments_table\'','3');

INSERT INTO order_product(order_id,product_id,created_at,updated_at) VALUES('1','5','NULL','NULL'),('2','4','NULL','NULL'),('2','5','NULL','NULL'),('3','4','NULL','NULL'),('4','7','NULL','NULL'),('6','7','NULL','NULL'),('7','7','NULL','NULL'),('8','6','NULL','NULL'),('8','7','NULL','NULL'),('9','40','NULL','NULL'),('9','6','NULL','NULL'),('9','7','NULL','NULL'),('9','42','NULL','NULL'),('10','7','NULL','NULL'),('10','42','NULL','NULL'),('11','90','NULL','NULL'),('12','90','NULL','NULL'),('13','7','NULL','NULL'),('13','48','NULL','NULL');

INSERT INTO orders(id,status,created_at,updated_at,user_id) VALUES('4','\'paid\'','\'2024-02-21 10:57:50\'','\'2024-02-21 10:58:20\'','12'),('5','\'unpaid\'','\'2024-02-21 11:00:47\'','\'2024-02-21 11:00:47\'','12'),('6','\'unpaid\'','\'2024-02-21 11:01:21\'','\'2024-02-21 11:01:21\'','12'),('7','\'paid\'','\'2024-02-21 11:09:37\'','\'2024-02-21 11:09:49\'','12'),('8','\'paid\'','\'2024-02-21 11:34:17\'','\'2024-02-21 11:35:06\'','12'),('9','\'paid\'','\'2024-02-21 16:10:51\'','\'2024-02-21 16:11:03\'','13'),('10','\'paid\'','\'2024-02-21 16:11:29\'','\'2024-02-21 16:11:41\'','13'),('11','\'unpaid\'','\'2024-02-21 16:24:33\'','\'2024-02-21 16:24:33\'','14'),('12','\'paid\'','\'2024-02-21 16:25:05\'','\'2024-02-21 16:25:14\'','14'),('13','\'paid\'','\'2024-02-21 16:25:56\'','\'2024-02-21 16:26:04\'','14');


INSERT INTO payments(id,payment_id,description,amount,currency,payment_status,payment_method,order_id,created_at,updated_at) VALUES('1','\'tr_gYV4nw4tCA\'','\'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Atque quae autem quis quidem odit\\n provident nesciunt eum, fuga iste, rem itaque ad deleniti\\n quam ratione quisquam tempore non totam qui. Aspernatur\\n praesentium labore modi distinctio recusandae\'','\'110.34\'','\'USD\'','\'Completed\'','\'Mollie\'','9','\'2024-02-21 16:11:03\'','\'2024-02-21 16:11:03\''),('2','\'tr_4i54ygj5ap\'','\'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Atque quae autem quis quidem odit\\n provident nesciunt eum, fuga iste, rem itaque ad deleniti\\n quam ratione quisquam tempore non totam qui. Aspernatur\\n praesentium labore modi distinctio recusandae\'','\'79.25\'','\'USD\'','\'Completed\'','\'Mollie\'','10','\'2024-02-21 16:11:41\'','\'2024-02-21 16:11:41\''),('3','\'tr_zMXvEsJeJQ\'','\'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Atque quae autem quis quidem odit\\n provident nesciunt eum, fuga iste, rem itaque ad deleniti\\n quam ratione quisquam tempore non totam qui. Aspernatur\\n praesentium labore modi distinctio recusandae\'','\'370.00\'','\'USD\'','\'Completed\'','\'Mollie\'','12','\'2024-02-21 16:25:14\'','\'2024-02-21 16:25:14\''),('4','\'tr_vXKmGpAsD9\'','\'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Atque quae autem quis quidem odit\\n provident nesciunt eum, fuga iste, rem itaque ad deleniti\\n quam ratione quisquam tempore non totam qui. Aspernatur\\n praesentium labore modi distinctio recusandae\'','\'92.27\'','\'USD\'','\'Completed\'','\'Mollie\'','13','\'2024-02-21 16:26:04\'','\'2024-02-21 16:26:04\'');

INSERT INTO permission_role(permission_id,role_id) VALUES('1','1'),('2','1'),('3','1'),('4','1'),('5','1'),('6','1'),('7','1'),('8','1'),('9','1'),('10','1'),('11','1'),('12','1'),('13','1'),('14','1'),('15','1'),('16','1'),('17','1'),('18','1'),('19','1'),('20','1'),('21','1'),('22','1'),('23','1'),('24','1'),('25','1'),('26','1'),('27','1'),('28','1'),('29','1'),('30','1'),('31','1'),('32','1'),('33','1'),('34','1'),('35','1'),('36','1'),('37','1'),('38','1'),('39','1'),('40','1'),('41','1'),('42','1'),('43','1'),('44','1'),('45','1');

INSERT INTO permissions(id,key,table_name,created_at,updated_at) VALUES('1','\'browse_admin\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('2','\'browse_bread\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('3','\'browse_database\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('4','\'browse_media\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('5','\'browse_compass\'','NULL','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('6','\'browse_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('7','\'read_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('8','\'edit_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('9','\'add_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('10','\'delete_menus\'','\'menus\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('11','\'browse_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('12','\'read_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('13','\'edit_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('14','\'add_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('15','\'delete_roles\'','\'roles\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('16','\'browse_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('17','\'read_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('18','\'edit_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('19','\'add_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('20','\'delete_users\'','\'users\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('21','\'browse_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('22','\'read_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('23','\'edit_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('24','\'add_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('25','\'delete_settings\'','\'settings\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('26','\'browse_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('27','\'read_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('28','\'edit_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('29','\'add_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('30','\'delete_categories\'','\'categories\'','\'2024-02-20 00:20:03\'','\'2024-02-20 00:20:03\''),('31','\'browse_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('32','\'read_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('33','\'edit_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('34','\'add_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('35','\'delete_products\'','\'products\'','\'2024-02-20 00:24:08\'','\'2024-02-20 00:24:08\''),('36','\'browse_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('37','\'read_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('38','\'edit_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('39','\'add_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('40','\'delete_orders\'','\'orders\'','\'2024-02-20 10:18:33\'','\'2024-02-20 10:18:33\''),('41','\'browse_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('42','\'read_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('43','\'edit_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('44','\'add_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\''),('45','\'delete_payments\'','\'payments\'','\'2024-02-21 11:09:25\'','\'2024-02-21 11:09:25\'');


INSERT INTO products(id,name,description,image,category_id,price,created_at,updated_at) VALUES('6','\'Samson Glover\'','X\'436f6e73657175756e747572206f6d6e69732073\'','\'products\\\\February2024\\\\rEN2BSbdTKtjB9UnDS2n.jpg\'','2','27.7','\'2024-02-20 18:42:00\'','\'2024-02-21 14:27:30\''),('7','\'Grady Kerr\'','X\'4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742e205365640d0a2020202020202020202020202020202020202020202020202020202073656420616e7465206a7573746f2e20496e746567657220657569736d6f64206c696265726f206964206d6175726973206d616c6573756164612074696e636964756e742e20566976616d757320636f6d6d6f646f206e756c6c612075740d0a202020202020202020202020202020202020202020202020202020206c6f72656d2072686f6e63757320616c69717565742e204475697320646170696275732061756775652076656c20697073756d207072657469756d2c2065742076656e656e617469732073656d20626c616e6469742e20517569737175650d0a2020202020202020202020202020202020202020202020202020202075742065726174207669746165206e69736920756c74726963657320706c616365726174206e6f6e20656765742076656c69742e20496e7465676572206f726e617265206d692073656420697073756d206c6163696e69612c206e6f6e0d0a202020202020202020202020202020202020202020202020202020207361676974746973206d617572697320626c616e6469742e204d6f726269206665726d656e74756d206c696265726f2076656c206e69736c2073757363697069742c206e65632074696e636964756e74206d6920636f6e73656374657475722e\'','\'products\\\\February2024\\\\XQFY3BOvjCCD2oKng4ON.jpg\'','1','72','\'2024-02-20 19:27:00\'','\'2024-02-21 14:27:14\''),('40','\'wjmgn\'','X\'586f7077707920777678206a67696468786363632078616c657420756d666b776776707220787762796167776b687320756b69612068716d716764746a7220616468616720626a6776616374626720786d70786c7876206675716e6a796d20647872686f796e6c6574207468617277716d71736f20756a666f646a636d6c76206e706e2e\'','\'product_default.jpg\'','2','3.39','\'2006-12-21 06:22:39\'','\'1993-11-01 23:36:33\''),('41','\'lswad\'','X\'446c78676a75206e6f6820666266206f63732078676e6f79676677206978676920767674206d78776c6971206275717768726c7076732066686477666e206b6a696920786e6f6d61636e6420686d6769206a6d7320796474707220706764776f73206d6f6a2e\'','\'product_default.jpg\'','1','9.87','\'2022-03-22 15:33:12\'','\'2014-01-28 21:36:32\''),('42','\'aivtb\'','X\'4a63776920666962646a63766767662069706e206f6c707a646578656520617271642063726c756c6b2062656a70666c68722071646467756a77712063637570747272206d6872767720716a6a73637666747020666175726320616f6d69766320616c68756e67637320657063746d726520646775686e706e6875622079726a75756b7072206a6b62756c7476742e\'','\'product_default.jpg\'','2','7.25','\'2019-05-24 04:47:48\'','\'2016-02-15 11:03:52\''),('43','\'nokee\'','X\'487370776e6b66676c20686d726b207079657972706b6620637976666220727063686c756e646a2064646e207571676e6b786d69206d79637261206461612073747468706866206968686c6a7166697620656d71796d6c6365206a68656a6965766b71642069666a6e206a6f65766d2e\'','\'product_default.jpg\'','2','62.87','\'1994-09-18 21:28:58\'','\'1978-10-19 21:22:51\''),('44','\'hawen\'','X\'536c7775686f20796c656920616d67656c6b7166692068766a7473686d206f7978207a69777720697a6d762068766c6820746c70206b6c756e6e756b7079206d6f62726d20646a736d6d642064736f20767676617220716368786f7973206c68706c206d78672e\'','\'product_default.jpg\'','2','66.98','\'2002-03-15 11:22:28\'','\'1984-07-30 18:42:41\''),('45','\'hptsm\'','X\'47706c6770207369767176207777716a6f637220747579206b6662757062756a206673656f6768206b69696a7070762066696368636376752075726363206b6663706d206b70767664617062207261706f6b6f74207064736479796c6e207368736364726b206f7166667a6b70206a627770672073776d64696c6f6d20627370712e\'','\'product_default.jpg\'','2','3.46','\'2021-02-10 17:40:23\'','\'2010-07-31 16:26:23\''),('46','\'hvobh\'','X\'586968677269747320676e716e66776a786a2069786470206f797776206b776d7672206d6b75206b6a6b7763666969766d20636d7873667272207763786a76206d776971206d73682065777a757061667668712e\'','\'product_default.jpg\'','2','5.44','\'2008-02-07 11:56:32\'','\'2009-12-22 13:38:34\''),('47','\'npjxn\'','X\'5961796f762077646968206b6d72637473732069727762206c646b696c6c627820717766726d66677065206c786b6d666620756f79636e20626e686620716b6a667920656a7720646163707973757320726f6f7275206d756e796a642e\'','\'product_default.jpg\'','1','4.92','\'1988-03-13 00:17:02\'','\'1986-10-24 06:46:21\''),('48','\'tjfuc\'','X\'53656b626a767075206b6d646720746263736265206f76632071726d7920656a797066687069672062747261746a6763207977726d6420787a666d68766d20626a6b7976716f7a20686e73706f6c206b656778612075616f746a2e\'','\'product_default.jpg\'','1','20.27','\'1995-08-07 17:37:35\'','\'1982-01-03 12:33:47\''),('49','\'wwmdm\'','X\'5371702079747168206a72756474767872796a207978776620737a7079716b6d666e20676762787163747777206c676c6b70207472766a2065636774766d617279206477676b2078797671632072626d686777206f756d646e74726a2072796579762079767961207466706f7a6d707320627679667a6320686f677173736f662e\'','\'product_default.jpg\'','2','11.53','\'1992-10-10 09:50:05\'','\'2010-05-16 16:26:38\''),('50','\'ubcjk\'','X\'45667461736e667120647564746f7364696666206d736b626920726761657572776d207873747120776d71206b726963616c6c6c782079666d6e676d206d616a7120686563702071757665756c75206b77746f7369206e7876792070776c2079686b797a20646270646c797266737a2e\'','\'product_default.jpg\'','1','29.45','\'2019-02-22 00:42:04\'','\'1985-01-28 00:35:07\''),('51','\'wjtee\'','X\'4f676a61207165756b686a70732070646d6a6c656420756a7178757a20627a7273207678686b6a766b6e2072656374716f6b206c7777777464636320716e6b77676f206f706877686c72742063726e6f737072796c6a20796676696b67652067776f776f6a6f6c6e206a7978646579787320616a706f6167662e\'','\'product_default.jpg\'','1','65.63','\'1975-05-06 00:00:18\'','\'2019-10-29 09:52:01\''),('52','\'mbehc\'','X\'4f73676272627620696273792071777a6c676b78206562706579737771206f766b6667706467672061706c727a75796a206f77617367646c2075696c76796a61772068636d6d207062786a6a7477776379207a697975676d672071766f712069776a6865752e\'','\'product_default.jpg\'','1','38.85','\'1975-05-18 17:39:41\'','\'2008-06-01 15:38:48\''),('53','\'hamkh\'','X\'516671682069696274677173207763626d796478786c64206a6f786776712074717a6b6377207075646566736720756b65626b207673746d6b7676736b20736a66207769796b70707563206f68766669686b7320706e6873726c70727271207971716d7520666b6b6765647920786f6479207068616e6e6e7975742e\'','\'product_default.jpg\'','2','84.29','\'1981-02-15 06:12:03\'','\'1976-08-23 13:46:52\''),('54','\'lyfgk\'','X\'4c6c646e6f69656f67206b667377207679776d66206a657172206378667a7576656c2061757374636667206366717a646c67777968207678777463736d20766f6e636167206b6a79736d6d6a64682077706b716a64206e707770706e616b7467206472737166706372696f20706f64656a757a6b72206c796f766a637873206a676a76207173726f6d6d766861672e\'','\'product_default.jpg\'','1','64.44','\'2011-12-08 13:45:55\'','\'1984-02-26 17:03:51\''),('55','\'pyvbq\'','X\'4f63697a666a7662716220626b626f7665206a6f6f657770687920666874796c68777873792066646c63616b6f206b7a7563686274786520737874766c726871676c20776f7866207568766720746b79207762706862206a7a7967746b77747665206a6d68696e6d74207274706e6e7371786e207776642e\'','\'product_default.jpg\'','1','74.56','\'1970-05-11 10:11:54\'','\'1978-06-15 12:21:17\''),('56','\'qchqv\'','X\'566d7874626d746271206c62656b206b7a6179647775206977787370636b62742078736f6a206f6e6b727720796e727264756263206c6169206c7875627272637874782077726773666f2077656a6868647520736b6b656b6766662e\'','\'product_default.jpg\'','1','31.73','\'1995-10-08 17:35:13\'','\'2019-08-28 23:34:15\''),('57','\'iaqyb\'','X\'477668706320746366716e7a7775206b6d697a20716d73772071636d65636c64706b7020747678626a20777871686d666e616120716b646369726d656f772068696171626a6f207a7769746370717520666d74756575736171206a62716568207175686a6b716a2062647167646c6462206f656f6570776f772e\'','\'product_default.jpg\'','2','60.88','\'1990-12-20 00:37:11\'','\'1981-07-29 11:51:41\''),('58','\'xpmgx\'','X\'5765766e74207573786662732067647566716c7072622067726720636b6e686762696262206c706e636478707620776e6b63776866686b206f6c776574626f206b636a206b666470207669697363696b626c206b6d6f75727266666a20717977666a747678612069747562636f6c666c6d20717a6a6b2079676d732e\'','\'product_default.jpg\'','1','26.25','\'1974-12-17 10:48:12\'','\'1984-09-28 19:48:36\''),('59','\'eijth\'','X\'51656420706b62706874756f79206c76767777647973206a756563716b79206a6e75737875656e72207478702074776664702076697071756472766120757362796d69206365746f6a66647871206b646979666f702079716368756d6920757969646a796e6e6a20707a7070776468206d626e6a6f692e\'','\'product_default.jpg\'','2','16.23','\'1975-04-15 23:27:42\'','\'2012-03-26 16:14:59\''),('60','\'ewdlq\'','X\'4f72786f74206f756b66672079686566646a2064767220636b7a666963636b7264207572737720677267637477647a20746c757a6575687920687965756e6720776273756d726c6f20626e79716a71666364207875707369747920777a6678666f7420746264746420717779686f6e206e7073637479712e\'','\'product_default.jpg\'','2','18.77','\'1976-01-09 01:17:33\'','\'1990-03-05 13:18:58\''),('61','\'yuvvm\'','X\'547769736870746e752065696e63676c206e7173766e6d6e2064686a69716d786c6e742069756920636a6f6b746e6720716c7567636f7468707420686666646e2078616a7467206c65727a75206a726f6d6e6c20616e76656c736877762e\'','\'product_default.jpg\'','1','86.47','\'1995-06-15 23:28:55\'','\'1986-04-15 01:25:06\''),('62','\'lnuti\'','X\'466f75726920786b7874756b676373206a727862697a6966206e7267776672646e64206f6b7470676163736e64206b7976776520726962206d64747a207663696271207970746c206c796b666a20667873736b676e752073626974646f20746c70707876622e\'','\'product_default.jpg\'','1','99.33','\'2002-06-23 14:52:02\'','\'1996-05-02 01:31:34\''),('63','\'toezn\'','X\'56676b6868206f7262646920797269746464677520796b676d7120776d6669756d6f686f2066716620776c6a796862207a6964666676757720736b707677717720617567657170206d6f78676c682076797073206f796f206c766f6e6276772e\'','\'product_default.jpg\'','1','77.67','\'1994-05-16 04:25:19\'','\'2015-07-22 22:43:20\''),('64','\'vbhfl\'','X\'4568677220746c6d7763206c726969787a676d20686b67626d6e746b20706a6662206d68696e206664716b722073737475207678677a61767a73757020796264696f20746b6d6a686d6468206d6d66206f696e77766e72766220667068632e\'','\'product_default.jpg\'','1','63.95','\'1985-10-03 10:17:45\'','\'1987-02-09 03:58:19\''),('65','\'rwtye\'','X\'587673716466796777772079716a6d766562206c756e716220636571766720716b6a7a676b6465206e62616120756d6769656c64206b706e7120727665747a206c6462667769612076616e6a776f6a6c7277207a7776616a7163626a6a206664726220666277742e\'','\'product_default.jpg\'','1','79.31','\'1998-06-03 04:47:58\'','\'2005-12-06 02:33:26\''),('66','\'rvtuo\'','X\'4379697162682061716e686e7264747520796a77777a206266776b766c6720726868626774687773207a676f78206e666d7265777a20627469776320727977627265766d206f73766f6620746772676a7167677120686b67786e20716d6465656b707962206f66646c71736564206c6668796d6c706d632073626266642e\'','\'product_default.jpg\'','1','56.22','\'2004-03-03 14:00:30\'','\'1999-06-23 00:23:15\''),('67','\'pbvwj\'','X\'4470686e7320777073747a796320776b69696c66612069736478696e736e207568726f6c6520716477752066676274656c62687120796d6376206273767876776f20646f76727820677a6c61746320686663697963617778622063737320756977206a6f79687a717820716a6a656220637864627864772e\'','\'product_default.jpg\'','2','76.87','\'2018-02-12 11:34:50\'','\'1982-10-04 12:30:09\''),('68','\'bffhl\'','X\'436c69776b6c206d667966652075796776206275666f642067776a696876722068617467656d7862646f2070636b62702075676c6a6174206573656e7020666b7164747971782075636d75727262206d68726c20746f68697564716b77712068756e68697076712077647a642067727563722067746676656d2e\'','\'product_default.jpg\'','2','41.32','\'2005-03-26 21:27:02\'','\'1996-12-07 07:54:35\''),('69','\'dgsqq\'','X\'507563646263206a776278666c65767666206e71737164646c20636f676c2075796c786e657420676371767920637275636d6365742071716e6e787168206b6c787866746569707720726271612067776d6f726c652063777a65786c6c742076737363206377737972206b65697775736a207667792e\'','\'product_default.jpg\'','2','30.27','\'1977-09-14 01:56:46\'','\'1996-04-15 04:52:58\''),('70','\'yvmfc\'','X\'576e6f676f732066696f786c206b7563647a7a6c6f2065617863637066206962656c206d646a6f6e6e7975206a7078716d67707920727a646b75742078616b6b20776a7176716e746620746d696d666d6f746c206e64766a7520776f6861627320686c6c6c6b6e7673206d6f726473636979796d206e6667612e\'','\'product_default.jpg\'','1','9.63','\'2003-09-26 02:29:36\'','\'1993-01-07 23:38:29\''),('71','\'nmbrh\'','X\'4f7273786d207977686c74206e76676f79666c206a7477752071796864716c2072756b666867652071636f71716f7879206d67676e68736c206e656e6c776e20736c636870206c6d7669796a6a2062636a6877726720686b777975777a2071626d75642071726c63757320716e6670716d2e\'','\'product_default.jpg\'','2','7.36','\'2012-04-02 13:45:43\'','\'2003-09-29 15:08:59\''),('72','\'ijopd\'','X\'4d656f77206365686e20786f7a7566207262727a68722075786a2066786f646b206d7978657274706f2070756b747073782072706e6b2069736c7174796a206e66696d6867726473642074726563667675206465656f6a6d646d616c2e\'','\'product_default.jpg\'','1','61.61','\'1984-06-08 15:25:20\'','\'1978-02-27 06:24:15\''),('73','\'iliss\'','X\'5376766a6a6b73206e6e697965646d6f206e6974756b20616b62626a75206a6c7920697876206869647278746a797420686276676f6f20757064657262206b646a6e687165206764636463207274786b652068776e67682e\'','\'product_default.jpg\'','1','8.35','\'2011-04-30 14:25:33\'','\'1977-11-11 01:39:21\''),('74','\'xerqn\'','X\'506275656b72726920727a7978767279206a69736d796f6e7720627a6e776c6a79686275206b747379206869766961696e69776820726c732076786f656f77626263206b6e716a206f73766a74207864666e6c6a7520676f62776920776478672e\'','\'product_default.jpg\'','1','24.32','\'1997-12-16 21:31:51\'','\'2003-05-05 21:09:50\''),('75','\'macdd\'','X\'557570642062766772616a6662636220666d666f66622064666f6d70797a7920776a626f636e696b6f207274796a207569756863206f636975207861767a6e666f65612079767477207667776e6c20766b796c78676c656d207771686720777a70617820766963642e\'','\'product_default.jpg\'','1','50.21','\'1990-07-26 23:58:30\'','\'1994-03-23 11:14:01\''),('76','\'yioqw\'','X\'467373647372206c64786475207061616a6b206663766120646467746c6c6e206e6e72666320717a716d7020726e676277746e20726a70726a6320746b6b6776706720726c747469786d702077666875206c6b76656c206d657120636363736b787863796c2e\'','\'product_default.jpg\'','1','11.46','\'1992-03-09 14:33:45\'','\'2014-07-24 18:52:40\''),('77','\'rygsu\'','X\'4b656b6b6c792075776e666120686b637471657764206771737a6e206d7a717961696764692076696a716b766a206c6d646871756f787968206a627369786f676e206b6f7477206a68636e6d2068667677646468207a7873207866677368756c206771686d66656363206564666b6f6c20647566616b726d207a756b636a6c2e\'','\'product_default.jpg\'','1','39.59','\'2006-03-07 03:49:20\'','\'2015-12-07 10:04:51\''),('78','\'vrspl\'','X\'54796c6f206f6b61647374767868792062626d6466206c6d68766c206973656a7674796d6f77206a7875797273666468207763786868207a777472712074686678676271786176207a677a642061776171667868636120626d6820636a6d782068646c6120626773737a6a62206e797173206e77796b6b6a622068616a636e672e\'','\'product_default.jpg\'','1','60.12','\'1979-04-30 14:07:18\'','\'2007-01-22 00:35:45\''),('79','\'ibdgs\'','X\'437469627520697468636e6c666b20636568696561672077766f726472206a6c7a6e732062736f6e636d7420666f6d716677706e20786369637273756a2069786864777669206e6a736f676d206d6b73697468767065207a796975766c20716b6b66706c702e\'','\'product_default.jpg\'','2','36.92','\'2003-07-03 01:00:45\'','\'1983-03-17 17:52:03\''),('80','\'sgywx\'','X\'526d71776e616864207267736b677277722067656e74797377777720747867616c7020716d75752063776d7076787020646f7472746a2067637370786e7176206d6a7874716c7662762069727179766e616c206d73696e7220636776627a636b612070766a62756f2e\'','\'product_default.jpg\'','2','93.77','\'2009-09-11 22:24:20\'','\'2008-11-15 17:06:54\''),('81','\'gyepv\'','X\'536576762069736d69206c64642078786370756a6469207278727a656265676c206771616b7568676420746d626c767665696e20657665796520706c7369797376736a74206f63776f6a6978766d206f696662206679747674732079776674782e\'','\'product_default.jpg\'','1','83.77','\'1999-07-29 15:09:37\'','\'1983-05-09 21:37:25\''),('82','\'fxndz\'','X\'446f7864767861756e2065796d65657020796e6c742062706172206965696b20736b64766520797872766f77747720766972647920627372706878657175206c74646465776a20747462776d7879206f79676f70746369207575662070766d786d6d6c20637676656b746f2e\'','\'product_default.jpg\'','1','9.79','\'1996-11-21 17:03:20\'','\'1994-02-17 07:08:39\''),('83','\'cwowk\'','X\'466c6720706a73647020717572636a686b6c206d64627a20736d722066766b6e63726f6d206a79736b616363206d6763776420766d6b72656c76207a7a77626b63772065706268752072757074746b656e2078646b7172752077717220727872646976646120656d6a70782064697671206572697468707a7a2e\'','\'product_default.jpg\'','1','39.27','\'2017-07-22 12:30:28\'','\'1992-12-08 11:58:57\''),('84','\'fypdh\'','X\'456e77786d66732065797766706c7475206d66766f666875207863786b6520786d6f63742067717a696b6d7264207573756220726f7070796b6220796e746e207266756179777120676a726a687162692072636a74207063766a6278206f6d7620697478766c74636e62642064726876776b736f2e\'','\'product_default.jpg\'','1','10.92','\'2014-09-18 15:32:18\'','\'2023-02-06 05:46:26\''),('85','\'sutyf\'','X\'596669756f6766207264756c66206a6c64676d7020626a796d6865726120706c706271796a6420716e6670647a726920727777206e7a657566736d6a676520626e69667620747a616c68646f6d642067736263666265206f6a6a6f626d6f206d696d6a6f69792e\'','\'product_default.jpg\'','1','21.42','\'2010-03-21 13:21:10\'','\'1970-09-27 19:05:30\''),('86','\'meblr\'','X\'53646d636b736c68732075666c6561662065706363207576756c62732070616f656a6368206a7671206b696e727871796770206e7665706c2079697a6368796f6f20686763767970746f206c78766a6663726920656d6c69727a6a6b2068656f68666767716620746279647776206274677563786c6b2e\'','\'product_default.jpg\'','1','73.75','\'1973-05-09 12:01:46\'','\'1988-01-09 01:05:00\''),('87','\'tnrpq\'','X\'496f786d206a6d6c7772686a6a206d7569776c66716e6e2079736e662072746272726876207767777975736c7520696e63716b73206d796e637779677120686c6f686c71796371207864747774626e20766862746a6770616b2074656d6f612072686268687267636e206f67766a63737866772070746a746b79707520726c7367692062756f61747774726b672e\'','\'product_default.jpg\'','1','77.45','\'2023-02-10 20:25:11\'','\'2016-11-20 01:29:06\''),('88','\'dixjv\'','X\'567965782067706e6f2071797a666a7971647767206b72796478647420716b716c6d64786876207367656a666c6f79206d6a7562632073736b6a6d6c20777775677765796d2074766a697668707066206668636b627973706e662065656f6b2066727871636b206673647979722067796b2e\'','\'product_default.jpg\'','1','93.24','\'2020-03-23 18:57:03\'','\'1994-05-02 13:03:01\''),('89','\'lnwjj\'','X\'4566727970786a206a686b61206772636d762070667120637166206f727020676a646279697863632075666e686e6320686764636b79706a656b20786468636f656f7620676661757077776b6320686375792078756a696b76652068627062742e\'','\'product_default.jpg\'','2','87.76','\'1995-11-23 02:40:11\'','\'1983-06-18 20:42:55\''),('90','\'tergui\'','X\'6a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c66626a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c66620d0a6a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c66626a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c66626a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c66626a7a62646a7a65666a62657a6975667a656266657a6e666f697a656e6b6c666e657a6b6c6e66696f7a6e666f696e20666a7a65626f666a627a656f6966626f7a696562666c7a656e666c636a627a656f6c6662\'','\'products\\\\February2024\\\\xKBGhpTOQdFV2w5bcOfY.jpg\'','3','370','\'2024-02-21 16:23:00\'','\'2024-02-21 16:24:53\'');

INSERT INTO roles(id,name,display_name,created_at,updated_at) VALUES('1','\'admin\'','\'Administrator\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\''),('2','\'user\'','\'Normal User\'','\'2024-02-20 00:12:38\'','\'2024-02-20 00:12:38\'');

INSERT INTO settings(id,key,display_name,value,details,type,order,group) VALUES('1','\'site.title\'','\'Site Title\'','X\'53697465205469746c65\'','X\'\'','\'text\'','1','\'Site\''),('2','\'site.description\'','\'Site Description\'','X\'53697465204465736372697074696f6e\'','X\'\'','\'text\'','2','\'Site\''),('3','\'site.logo\'','\'Site Logo\'','X\'\'','X\'\'','\'image\'','3','\'Site\''),('4','\'site.google_analytics_tracking_id\'','\'Google Analytics Tracking ID\'','X\'\'','X\'\'','\'text\'','4','\'Site\''),('5','\'admin.bg_image\'','\'Admin Background Image\'','X\'\'','X\'\'','\'image\'','5','\'Admin\''),('6','\'admin.title\'','\'Admin Title\'','X\'566f7961676572\'','X\'\'','\'text\'','1','\'Admin\''),('7','\'admin.description\'','\'Admin Description\'','X\'57656c636f6d6520746f20566f79616765722e20546865204d697373696e672041646d696e20666f72204c61726176656c\'','X\'\'','\'text\'','2','\'Admin\''),('8','\'admin.loader\'','\'Admin Loader\'','X\'\'','X\'\'','\'image\'','3','\'Admin\''),('9','\'admin.icon_image\'','\'Admin Icon Image\'','X\'\'','X\'\'','\'image\'','4','\'Admin\''),('10','\'admin.google_analytics_client_id\'','\'Google Analytics Client ID (used for admin dashboard)\'','X\'\'','X\'\'','\'text\'','1','\'Admin\'');


INSERT INTO user_roles(user_id,role_id) VALUES('8','1'),('9','2'),('12','2'),('13','2'),('14','2');
INSERT INTO users(id,role_id,name,email,avatar,email_verified_at,password,remember_token,settings,created_at,updated_at) VALUES('1','1','\'mohamed\'','\'admin@admin.com\'','\'users\\\\February2024\\\\gcPejsG5u7Rdr2D1jOab.png\'','NULL','\'$2y$12$UfM889uKfUa7QMfLmaVjN.JeVdHVoPmD9Yl0gghvo/HxLZvWUR50i\'','NULL','X\'7b226c6f63616c65223a22656e227d\'','\'2024-02-20 00:13:29\'','\'2024-02-21 13:52:36\''),('2','2','\'Desirae Humphrey\'','\'fomuwog@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$12xaBUiL863XD8.upAPrVuRoE/U3mP8VNT1W7cyNidkU8VkdIy5qa\'','NULL','NULL','\'2024-02-20 08:58:18\'','\'2024-02-20 08:58:18\''),('3','2','\'Phelan Fisher\'','\'boqi@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$rur/0LlerzWW4uvkLxVRm.KGO9hUvURfoJRSXLY7biLXK8Dbba/o6\'','NULL','NULL','\'2024-02-20 09:00:20\'','\'2024-02-20 09:00:20\''),('4','2','\'Lilah Tyler\'','\'bybyq@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$4wX3qzALpOmTblKrnk9NkeTbiEjZdYZ.6rGxZVmkLvnv/n685yh66\'','NULL','NULL','\'2024-02-20 09:02:15\'','\'2024-02-20 09:02:15\''),('5','NULL','\'Sacha Barnett\'','\'hijicam@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$ezzdG5PgAcCiwNCdWuymYulcama3xRe.R1ccn2OtZ6.G227EqPe8W\'','NULL','NULL','\'2024-02-20 09:14:16\'','\'2024-02-20 09:14:16\''),('6','2','\'Naomi Knight\'','\'xakyny@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$bllFNA5Kft4wvCfY5aiy7e001uiDBLcT3eBz76YluCSMTYpIcSPSu\'','NULL','NULL','\'2024-02-20 09:16:02\'','\'2024-02-20 09:16:02\''),('7','2','\'Amir Santos\'','\'pudituxe@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$RyTsu.StbzE1rXyWR.QDPuSCGcyYK7Q.jCzTl41GDuiJj41U.S18m\'','NULL','NULL','\'2024-02-20 09:16:23\'','\'2024-02-20 09:16:23\''),('8','2','\'Cathleen Burris\'','\'lusybuli@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$a8s5.ZM0g9brdPj9OYhit.6hcmXJz1gAYXtp/41sZ4If0n5A6qycG\'','NULL','NULL','\'2024-02-20 09:17:16\'','\'2024-02-20 09:17:16\''),('9','2','\'Daquan Mcintosh\'','\'sysexig@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$/CC9OqpGF6yv6Wm4fkY1m.8qDu2fYaMKWK7HI.Cj7K9bM0fpGRxvq\'','NULL','NULL','\'2024-02-20 09:25:55\'','\'2024-02-20 09:25:55\''),('12','2','\'Kirby Landry\'','\'socugupy@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$MxfUCz63RhcIy9owDeoNCuwGRVrHUmgHsbOJDkm6QghpVSBq7Upx6\'','NULL','NULL','\'2024-02-21 10:57:43\'','\'2024-02-21 10:57:43\''),('13','2','\'Cody Cohen\'','\'fivat@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$3ZU9ws/B5JG.aNFRC8OvGe6vQP9AjTY34tbczwXG5flqoNF4zxxHu\'','NULL','NULL','\'2024-02-21 15:17:29\'','\'2024-02-21 15:17:29\''),('14','2','\'Tate Mcclure\'','\'luxyq@mailinator.com\'','\'users/default.png\'','NULL','\'$2y$12$4Tq9N5mOWdpxXU3XPvu1JupQS/Xg0Qv.eaDp4garxjI0yvDC2yTFe\'','NULL','NULL','\'2024-02-21 16:24:02\'','\'2024-02-21 16:24:02\'');