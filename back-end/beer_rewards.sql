/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.31-0ubuntu0.18.04.1-log : Database - beerrewardsadmin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`beerrewardsadmin` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `beerrewardsadmin`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2020_08_31_071827_changes_in_users_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values (3,'App\\User',7,'authToken','e78f19eae2f287a488d631b0201aa1bb0240cf63a523aea5b8176c23ebc7d580','[\"*\"]',NULL,'2020-09-01 09:01:25','2020-09-01 09:01:25'),(4,'App\\User',9,'authToken','1c03debf7ec3043a4ed4529e904aace1aa3ea252c920b338e13eb16b18f057a3','[\"*\"]',NULL,'2020-09-01 11:28:13','2020-09-01 11:28:13'),(7,'App\\User',4,'authToken','9ebe434d8b0c4f532406bf7a3e46875390523b8322c34182d9067a8ab654de26','[\"*\"]','2020-09-03 11:29:06','2020-09-03 11:26:54','2020-09-03 11:29:06'),(8,'App\\User',10,'authToken','aba9af2c11128e5c8137c58dac19821703736f2565d05d6cea7e7186cb768ac9','[\"*\"]',NULL,'2020-09-03 11:29:56','2020-09-03 11:29:56'),(9,'App\\User',4,'authToken','e4f3dbc41787e15f0aa8bc726e6731ff55b265c37963722a0e506a4c0aac2997','[\"*\"]',NULL,'2020-09-04 07:25:42','2020-09-04 07:25:42'),(10,'App\\User',4,'authToken','bea8b550b9ccc1dfa99bc56fc64acc7676ca24fccb2f8130ec773a5a731182ba','[\"*\"]',NULL,'2020-09-04 08:07:48','2020-09-04 08:07:48'),(11,'App\\User',4,'authToken','454892053e85c6bf3a4704d1aefce10243d6156215eb633a182abf2bde896769','[\"*\"]',NULL,'2020-09-04 08:14:55','2020-09-04 08:14:55'),(12,'App\\User',4,'authToken','8d182ee6640402119e1a7fed7dbe51a335c3c23bbced6034f812ccec4e340e92','[\"*\"]',NULL,'2020-09-04 09:20:18','2020-09-04 09:20:18'),(13,'App\\User',11,'authToken','062c2522793cc187b5e92c711289e3f44279ea4b835133a0bb135224e5dcfc59','[\"*\"]',NULL,'2020-09-04 09:53:50','2020-09-04 09:53:50'),(14,'App\\User',11,'authToken','bf4e9c92f5fb69ee0cbda892163263399858347d1006b0ec255874da23ebc0e1','[\"*\"]',NULL,'2020-09-04 09:56:36','2020-09-04 09:56:36'),(15,'App\\User',11,'authToken','5954e8a0a055f0f29d80fb809ddf0f633f4bcfe4fdde22fd6924ffa5a3b1e661','[\"*\"]',NULL,'2020-09-04 10:10:53','2020-09-04 10:10:53'),(16,'App\\User',11,'authToken','33233590d2489790a812c32f20944b49d11077205bbf6510565507ddaeee5011','[\"*\"]',NULL,'2020-09-04 10:48:56','2020-09-04 10:48:56'),(17,'App\\User',11,'authToken','4de1c6419566feabb236c81a9c60665d104bf95318163bf27fc8d395ca903bd2','[\"*\"]',NULL,'2020-09-04 11:51:35','2020-09-04 11:51:35'),(18,'App\\User',12,'authToken','b789ffb6151e8af781b8c62550371978ea50202099ca88cdbdb4423260f7402b','[\"*\"]',NULL,'2020-09-04 11:52:59','2020-09-04 11:52:59'),(19,'App\\User',11,'authToken','5136bca30e3137e566526e135dd55c0dfdcb1466355974e8ccafd0ae76105e69','[\"*\"]',NULL,'2020-09-04 12:53:08','2020-09-04 12:53:08'),(20,'App\\User',13,'authToken','6b6a56bb52c7e32881f448d606876c5c69a32127f0dec3d9d438f2dd119c6d0e','[\"*\"]',NULL,'2020-09-04 12:55:29','2020-09-04 12:55:29'),(21,'App\\User',4,'authToken','e5a27d9b189d95b3ca3d73362d55481353cb141b2fc3418d58129adda7608ce3','[\"*\"]',NULL,'2020-09-04 12:59:05','2020-09-04 12:59:05'),(22,'App\\User',4,'authToken','5fbd4ee8ad5e35b1200c1691407b988f1b676c12636617c11a2468021886ad16','[\"*\"]',NULL,'2020-09-04 13:19:59','2020-09-04 13:19:59'),(23,'App\\User',11,'authToken','e14a8b37789f6f378575a7e10398c2c1f571433010d36dd750b14999b4c74479','[\"*\"]',NULL,'2020-09-04 13:44:14','2020-09-04 13:44:14'),(24,'App\\User',4,'authToken','e9a8f163959494e612764f853148e7649a5a0295f61f02fff1dd6249aaa58f66','[\"*\"]',NULL,'2020-09-04 13:47:10','2020-09-04 13:47:10'),(25,'App\\User',14,'authToken','5b34fcb2f274b6b9b205f28a445287ad99b5174767896d33e14beb9aeaadb757','[\"*\"]',NULL,'2020-09-04 13:48:02','2020-09-04 13:48:02'),(26,'App\\User',4,'authToken','8a4f0fcca9a2c2ef5af8803ba99d489deb6b6c8fb3bde5e38e4926d59c3e503d','[\"*\"]',NULL,'2020-09-06 23:19:37','2020-09-06 23:19:37'),(27,'App\\User',4,'authToken','6d7dee2850e87d178571df8f425d55d8d59d19fe95f9dd897c44c99e5afb61b3','[\"*\"]',NULL,'2020-09-06 23:20:33','2020-09-06 23:20:33'),(28,'App\\User',4,'authToken','6225910d45a514877baec05793480b0d08cb57e32c7ba3f1b871425e6b909417','[\"*\"]',NULL,'2020-09-06 23:21:05','2020-09-06 23:21:05'),(29,'App\\User',15,'authToken','b6c1bc5e4288fcacf751e39edde812cef88227ff0844979f3df10c24db583c7f','[\"*\"]',NULL,'2020-09-07 03:40:10','2020-09-07 03:40:10'),(30,'App\\User',15,'authToken','997afe51737212cdcb0d3fd081f1d7fdb71afa7743c9028902c970193f9990c0','[\"*\"]',NULL,'2020-09-07 03:40:37','2020-09-07 03:40:37');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` int(11) NOT NULL DEFAULT '0',
  `title` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`user_type`,`title`,`first_name`,`last_name`,`dob`,`mobile`,`postcode`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values (3,NULL,0,NULL,'guest','guest','1991-10-26',NULL,NULL,'guest2020_08_31_11_19_38@guest.com',NULL,'$2y$10$yN.cI/0YO7OXLzKwSOmeNewI6ruZSUJZYiQEtj9D9gWGWCOa1P9x6',NULL,NULL,NULL),(4,NULL,1,'Mr.','Manu','Garg','1990-10-26',NULL,NULL,'manu.garg@classicinformatics.com',NULL,'$2y$10$vYAQlQqN3hmBsFXe399/4uL0JvC//j6MaV9MsgYrS0n.RdEfYZy5.',NULL,NULL,NULL),(5,NULL,0,NULL,'Guest','Guest','2002-09-01',NULL,NULL,'guest_2020_09_01_07_38_46@guest.com',NULL,'$2y$10$yVB6fM3rJloOuQQh4ShRuuHD23yMqiCH2Z7XfhkX0YCL.TOqovXW.',NULL,'2020-09-01 07:38:46','2020-09-01 07:38:46'),(6,NULL,0,NULL,'Guest','Guest','2002-09-01',NULL,NULL,'guest_2020_09_01_08_58_44@guest.com',NULL,'$2y$10$yigjaCbMixWNW.9SoTKQSeMSbn5lzw6i4XQxTqM55H7TuVq0m/wTW',NULL,'2020-09-01 08:58:44','2020-09-01 08:58:44'),(7,NULL,0,NULL,'Guest','Guest','2000-09-01',NULL,NULL,'guest_2020_09_01_09_01_24@guest.com',NULL,'$2y$10$lsCt2vfKvlGoDLlkHz.JouHpZVTiQ5SwPqck7t8hKBWbZDxRTq0xa',NULL,'2020-09-01 09:01:25','2020-09-01 09:01:25'),(9,NULL,1,'Mr.','Manu','Garg','2002-09-01',NULL,NULL,'manu.garg12@classicinformatics.com',NULL,'$2y$10$lO3w5uxCC4f3MBBx7yznceAEO6cp7JqjT/Pa5vqYj1Hmj9WcXZMeG',NULL,'2020-09-01 11:28:12','2020-09-01 11:28:12'),(10,NULL,1,'Mr.','Manu','Garg','2002-09-01',NULL,NULL,'manu.garg34@classicinformatics.com',NULL,'$2y$10$oeedAwk6VcWHVQnXoP9VP.pIaRetSAD8fay.DloSG1g6jxBW1DsD2',NULL,'2020-09-03 11:29:56','2020-09-03 11:29:56'),(11,NULL,1,'Mr.','Sarthak','Bisht','1997-02-19',NULL,NULL,'admin@test.com',NULL,'$2y$10$MAApJUUYwbWuUxnUKiym4.raka8ZQPaV8vOZvzCau4T7igKCrpt/u',NULL,'2020-09-04 09:53:49','2020-09-04 09:53:49'),(12,NULL,1,'Mrs.','gffdgdgfdg','qwe','2000-07-05',NULL,NULL,'test@gmail.com',NULL,'$2y$10$g4tdZV4gOqyQbjlEiactd.fCzS9zb088gvmm7OINjPOhfQy0Vv5e6',NULL,'2020-09-04 11:52:59','2020-09-04 11:52:59'),(13,NULL,1,'Mr.','sarthak','sar','1999-03-03',NULL,NULL,'sarthak@gmail.com',NULL,'$2y$10$8fWdgtrNeL01kIPURHU.P.Kmg/wfqSXlwn732Q8.xs/imF1eGZ/c6',NULL,'2020-09-04 12:55:29','2020-09-04 12:55:29'),(14,NULL,1,'Mr.','gffdgdgfdg','asdsaa','2000-03-15',NULL,NULL,'qwer@gmail.com',NULL,'$2y$10$Ot5glS4kdqwCJ74XDNttsOQLZAcTY4bKpyA4DN3ndIiNi833KCNCy',NULL,'2020-09-04 13:48:02','2020-09-04 13:48:02'),(15,NULL,1,'Mr.','Gaurav','Rana','1991-02-18',NULL,NULL,'gaurav@classicinformatics.com',NULL,'$2y$10$a/c2DWiI8psBg5i7dC2SJ.ikB0e0jJgnz3WwkkOkI52Hj11whQ7IS',NULL,'2020-09-07 03:40:10','2020-09-07 03:40:10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
