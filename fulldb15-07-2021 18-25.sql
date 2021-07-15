#
# TABLE STRUCTURE FOR: communities
#

DROP TABLE IF EXISTS `communities`;

CREATE TABLE `communities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users_admin_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: communities_users
#

DROP TABLE IF EXISTS `communities_users`;

CREATE TABLE `communities_users` (
  `community_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`community_id`,`user_id`),
  KEY `communities_users_comm_idx` (`community_id`),
  KEY `communities_users_users_idx` (`user_id`),
  CONSTRAINT `fk_communities_users_comm` FOREIGN KEY (`community_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_communities_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: friend_requests
#

DROP TABLE IF EXISTS `friend_requests`;

CREATE TABLE `friend_requests` (
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `accepted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`from_user_id`,`to_user_id`),
  KEY `fk_friend_requests_from_user_idx` (`from_user_id`),
  KEY `fk_friend_requests_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_friend_requests_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('1', '87', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('3', '32', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('3', '89', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('5', '49', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('6', '28', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('6', '98', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('7', '36', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('7', '87', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('11', '20', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('12', '51', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('13', '27', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('14', '43', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('15', '73', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('15', '99', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('16', '74', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('17', '25', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('17', '77', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('17', '84', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('18', '2', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('19', '6', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('19', '23', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('19', '37', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('19', '63', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('20', '18', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('21', '53', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('24', '64', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('25', '62', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('25', '88', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('26', '34', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('29', '81', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('30', '91', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('33', '2', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('33', '44', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('38', '31', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('38', '56', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('38', '86', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('39', '30', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('39', '36', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('39', '78', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('40', '22', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('40', '32', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('42', '21', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('42', '31', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('43', '96', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('44', '10', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('44', '32', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('44', '51', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('47', '41', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('50', '77', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('51', '28', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('51', '96', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('53', '94', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('54', '68', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('56', '44', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('57', '86', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('58', '5', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('58', '62', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('58', '90', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('60', '70', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('61', '48', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('63', '20', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('63', '96', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('64', '22', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('64', '71', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('66', '81', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('67', '76', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('72', '2', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('72', '36', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('73', '1', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('74', '1', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('74', '62', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('75', '65', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('77', '21', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('78', '63', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('79', '4', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('79', '78', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('79', '81', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('83', '70', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('84', '26', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('84', '69', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('84', '83', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('84', '92', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('85', '47', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('85', '55', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('86', '25', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('86', '67', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('87', '4', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('87', '57', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('89', '84', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('91', '63', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('92', '63', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('92', '77', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('92', '92', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('93', '19', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('93', '69', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('99', '31', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('99', '87', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('100', '9', 0);
INSERT INTO `friend_requests` (`from_user_id`, `to_user_id`, `accepted`) VALUES ('100', '13', 0);


#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `media_types_id` int(10) unsigned NOT NULL,
  `file_name` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '/files/folder/img.png',
  `file_size` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_media_users_idx` (`user_id`),
  KEY `fk_media_media_types` (`media_types_id`),
  CONSTRAINT `fk_media_media_types` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('1', '67', 1, 'delectus', '0', '1973-08-14 22:26:02');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('2', '47', 2, 'voluptas', '60497222', '2020-01-14 19:01:36');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('3', '28', 3, 'voluptas', '30280', '1984-11-17 03:04:28');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('4', '61', 4, 'tenetur', '635', '2012-01-01 11:44:50');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('5', '89', 1, 'porro', '4', '1975-09-23 17:25:13');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('6', '87', 2, 'illo', '1', '2016-05-24 11:05:34');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('7', '96', 3, 'ipsum', '71', '1982-08-12 06:42:53');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('8', '24', 4, 'rerum', '1', '1994-12-10 15:21:04');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('9', '10', 1, 'aut', '3', '2003-01-25 23:26:11');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('10', '30', 2, 'error', '63952894', '2016-12-04 11:51:06');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('11', '85', 3, 'dolor', '39274033', '1986-08-30 14:51:34');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('12', '85', 4, 'eos', '860', '2016-12-07 17:41:47');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('13', '23', 1, 'est', '3385', '2002-05-29 02:41:30');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('14', '7', 2, 'velit', '7640528', '1993-07-22 10:27:36');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('15', '55', 3, 'nostrum', '429', '1985-11-16 11:15:22');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('16', '86', 4, 'deleniti', '795926375', '2008-01-23 02:21:21');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('17', '71', 1, 'architecto', '548817', '1992-03-17 22:58:12');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('18', '88', 2, 'vel', '7836840', '1977-03-03 21:46:26');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('19', '3', 3, 'impedit', '2131', '2001-01-07 13:55:13');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('20', '4', 4, 'mollitia', '929', '1984-01-13 14:46:39');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('21', '79', 1, 'optio', '3', '1980-04-06 05:52:20');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('22', '91', 2, 'ut', '0', '1988-08-29 21:14:19');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('23', '79', 3, 'quos', '26', '1996-11-28 11:21:55');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('24', '76', 4, 'repellat', '3', '1974-12-25 18:02:59');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('25', '34', 1, 'sequi', '1', '1996-08-02 22:24:24');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('26', '38', 2, 'amet', '112', '1970-07-31 15:21:50');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('27', '32', 3, 'distinctio', '0', '2016-06-18 07:36:17');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('28', '44', 4, 'est', '43', '2014-11-26 05:27:37');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('29', '14', 1, 'mollitia', '4500', '1976-11-06 17:47:32');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('30', '45', 2, 'incidunt', '3476', '2013-07-24 22:03:12');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('31', '6', 3, 'et', '4223', '1989-11-30 14:14:18');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('32', '81', 4, 'est', '88', '1989-11-11 04:23:44');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('33', '92', 1, 'quo', '387450718', '2021-05-31 14:51:59');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('34', '33', 2, 'nisi', '608116647', '1988-09-05 14:30:19');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('35', '42', 3, 'dolorum', '744737650', '1976-07-20 10:02:39');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('36', '80', 4, 'minus', '740687', '2007-09-13 22:20:42');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('37', '19', 1, 'laboriosam', '11912886', '1984-02-16 23:10:38');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('38', '37', 2, 'illo', '89880', '1999-12-22 07:18:37');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('39', '4', 3, 'fuga', '8673474', '1979-05-21 23:54:11');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('40', '29', 4, 'et', '0', '1993-09-19 07:34:56');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('41', '66', 1, 'consequuntur', '324', '1974-01-10 08:19:25');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('42', '88', 2, 'quaerat', '2519', '2016-12-23 18:05:12');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('43', '13', 3, 'tempore', '161148276', '1984-05-24 15:04:00');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('44', '89', 4, 'illum', '1', '2013-01-28 01:59:30');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('45', '95', 1, 'corporis', '4767', '2019-01-11 07:51:34');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('46', '68', 2, 'velit', '22', '1983-01-10 08:45:10');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('47', '74', 3, 'vitae', '0', '1999-06-30 09:30:24');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('48', '65', 4, 'eum', '0', '2019-09-19 23:52:28');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('49', '55', 1, 'deserunt', '541', '2003-04-19 11:46:34');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('50', '76', 2, 'iure', '580058152', '2011-02-28 18:40:32');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('51', '69', 3, 'quisquam', '5044138', '1981-07-06 15:28:12');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('52', '34', 4, 'nisi', '39676326', '1996-07-08 10:09:48');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('53', '67', 1, 'in', '61', '2019-05-15 18:33:00');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('54', '48', 2, 'consequatur', '64', '1978-05-02 23:19:31');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('55', '9', 3, 'unde', '5902', '2007-06-04 14:48:35');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('56', '1', 4, 'eos', '89171', '1973-06-09 01:48:50');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('57', '85', 1, 'animi', '21549211', '1971-02-14 01:23:56');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('58', '40', 2, 'doloremque', '2', '1971-11-25 18:27:44');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('59', '44', 3, 'veritatis', '64516', '1989-01-28 03:27:04');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('60', '99', 4, 'praesentium', '508', '1996-09-21 20:38:29');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('61', '85', 1, 'recusandae', '186318', '1973-12-23 00:02:55');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('62', '49', 2, 'quia', '467442', '1973-12-21 10:15:11');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('63', '79', 3, 'ut', '5782', '2021-06-07 07:42:14');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('64', '76', 4, 'accusantium', '88518', '1970-01-08 03:38:23');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('65', '81', 1, 'labore', '443365101', '2016-11-18 16:48:30');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('66', '21', 2, 'qui', '95', '1975-03-13 02:06:24');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('67', '56', 3, 'tempora', '18', '2001-12-09 14:47:48');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('68', '100', 4, 'aut', '9424561', '2004-01-01 12:31:43');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('69', '57', 1, 'eum', '0', '1977-03-05 17:40:58');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('70', '59', 2, 'ut', '469450', '2007-04-28 01:02:19');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('71', '29', 3, 'inventore', '49982176', '2019-11-11 20:45:10');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('72', '23', 4, 'est', '6681', '1981-03-10 07:41:39');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('73', '46', 1, 'et', '1196681', '1995-07-18 17:56:46');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('74', '41', 2, 'in', '0', '1984-09-24 04:22:18');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('75', '11', 3, 'qui', '45305916', '2020-07-25 13:39:28');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('76', '41', 4, 'doloribus', '35804', '1981-08-19 21:03:33');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('77', '9', 1, 'at', '3214652', '2011-08-01 18:27:56');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('78', '85', 2, 'quisquam', '564346452', '2003-12-09 14:19:27');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('79', '6', 3, 'voluptatibus', '42', '2016-09-24 18:01:43');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('80', '64', 4, 'debitis', '3', '1976-06-06 13:34:49');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('81', '61', 1, 'est', '50', '2002-07-29 02:22:20');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('82', '74', 2, 'consequatur', '64', '2014-06-24 17:34:45');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('83', '97', 3, 'molestiae', '30028', '2012-08-26 09:42:10');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('84', '28', 4, 'aut', '87374', '1999-10-23 13:53:37');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('85', '21', 1, 'sit', '608141812', '2016-04-11 08:54:21');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('86', '5', 2, 'occaecati', '0', '1982-12-19 18:26:41');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('87', '28', 3, 'dolorum', '666', '1985-09-15 12:26:13');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('88', '6', 4, 'qui', '7213122', '2020-06-14 17:59:56');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('89', '45', 1, 'quo', '0', '1998-11-30 06:24:02');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('90', '71', 2, 'et', '9289297', '1977-04-27 03:16:47');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('91', '5', 3, 'ut', '7005999', '2016-10-01 16:01:59');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('92', '30', 4, 'iure', '486', '1988-11-09 04:43:40');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('93', '20', 1, 'ut', '0', '1997-09-30 22:51:34');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('94', '84', 2, 'reprehenderit', '5', '1988-07-22 02:37:48');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('95', '5', 3, 'cum', '2', '2008-10-23 09:58:02');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('96', '1', 4, 'voluptatem', '319', '1989-11-01 20:54:32');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('97', '4', 1, 'odit', '5929738', '1971-05-23 10:36:22');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('98', '61', 2, 'temporibus', '79577', '1998-04-24 18:36:40');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('99', '1', 3, 'explicabo', '98', '1994-01-30 22:20:19');
INSERT INTO `media` (`id`, `user_id`, `media_types_id`, `file_name`, `file_size`, `created_at`) VALUES ('100', '60', 4, 'magni', '5864656', '2004-08-23 00:37:40');


#
# TABLE STRUCTURE FOR: media_types
#

DROP TABLE IF EXISTS `media_types`;

CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `media_types` (`id`, `name`) VALUES (4, 'autem');
INSERT INTO `media_types` (`id`, `name`) VALUES (1, 'distinctio');
INSERT INTO `media_types` (`id`, `name`) VALUES (3, 'et');
INSERT INTO `media_types` (`id`, `name`) VALUES (2, 'quaerat');


#
# TABLE STRUCTURE FOR: messages
#

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint(20) unsigned NOT NULL,
  `to_user_id` bigint(20) unsigned NOT NULL,
  `txt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_delivered` tinyint(1) DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_messages_from_user_idx` (`from_user_id`),
  KEY `fk_messages_to_user_idx` (`to_user_id`),
  CONSTRAINT `fk_messages_users_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: posts
#

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `txt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `user_posts_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: posts_likes
#

DROP TABLE IF EXISTS `posts_likes`;

CREATE TABLE `posts_likes` (
  `post_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `like_type` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`post_id`,`user_id`),
  KEY `post_idx` (`post_id`),
  KEY `user_idx` (`user_id`),
  CONSTRAINT `posts_likes_fk` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `users_likes_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: profiles
#

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` enum('f','m','x') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `photo_id` bigint(20) unsigned DEFAULT NULL,
  `user_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(130) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `photo_id` (`photo_id`),
  CONSTRAINT `fk_profiles_media` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` char(65) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_idx` (`email`),
  UNIQUE KEY `phone_idx` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('1', 'Camden', 'Ondricka', 'ewaelchi@example.com', '1-988-390-1', '539ca0eaa3709e523eb9764c31643a5eb0435f1e', '2011-06-05 12:16:41');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('2', 'Bette', 'Spinka', 'therese42@example.net', '306.544.004', 'c6d24e77a65c65e7db8c0de34e4b20984dabd028', '1981-12-11 21:24:10');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('3', 'Barbara', 'Becker', 'ines86@example.com', '340-796-114', '2f8a2a6447e88f5056c2205c70f93e1021e58814', '1971-08-10 02:12:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('4', 'Nickolas', 'Stiedemann', 'sanford.maureen@example.com', '423-770-996', 'f7f43a1d6a7ac80297fa3493848b63ec5143c20c', '2015-07-05 06:34:31');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('5', 'Ethel', 'Halvorson', 'qdurgan@example.com', '(663)371-41', 'c94f9efa3e586e30c2f82c6394e27f7328bcfb91', '2016-09-29 18:32:01');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('6', 'Donnie', 'DuBuque', 'serena94@example.com', '1-106-519-5', '722ef5fefb5bee0b7369e21e68f21ba9260ebc95', '1983-07-06 16:16:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('7', 'Sierra', 'Bartoletti', 'krista.greenfelder@example.net', '+62(7)43212', '0bd57d589de0552e292414497d1810594a410a89', '1974-05-25 18:43:23');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('8', 'Lilliana', 'Sawayn', 'maximilian.klocko@example.net', '+44(7)58628', '37705842c49c048bd37fff02e6ed4f0468a34c60', '2004-01-05 05:52:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('9', 'Dante', 'Thompson', 'lenore27@example.net', '(041)262-59', 'c5d3d95f9a8caac5d695456ae085500d14416920', '1972-05-04 00:19:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('10', 'Madisyn', 'Ward', 'veum.lila@example.org', '242-904-448', 'ad9baaf6e0b2549cd0d94a8650026d83b7a9f978', '1981-04-23 23:29:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('11', 'Silas', 'Kuphal', 'andreanne.von@example.com', '317-664-518', '1dfe22daaa41803dd043afcbe11372b55b2969f8', '1994-01-04 22:56:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('12', 'Sid', 'O\'Connell', 'audra.hermiston@example.net', '861-604-147', '9009322459336120dc19e638407e9211496ffac3', '1970-04-06 00:52:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('13', 'Elinore', 'Gutmann', 'hagenes.angelina@example.com', '(367)568-66', '4d20c7c6e9c6a8fea807cd63ca3288fa80be287f', '1978-05-25 19:00:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('14', 'Eveline', 'Jacobson', 'bednar.porter@example.net', '1-755-429-2', 'c5bf4283533d86a10dbb9f5a8b9336e9a40f804c', '2007-02-23 04:18:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('15', 'Ashleigh', 'Schimmel', 'petra06@example.com', '(204)411-40', 'acda432c7d43d0e8a0ecf4aae5e85c375be84453', '1976-10-13 05:41:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('16', 'Lilian', 'Herman', 'yasmin.o\'conner@example.org', '07473533094', 'f19150b753ee009320e4c075b19819bab13714f8', '2013-07-12 10:21:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('17', 'Laverne', 'Walter', 'erdman.kaylin@example.net', '1-548-619-3', '6bbaa2e7220b2afe9f95a1ddcfe4f9ce91ca77ce', '1994-05-01 06:53:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('18', 'Johanna', 'Kris', 'gbernhard@example.net', '486.680.454', '48583cac83a3f45aa3cddcfbf0d7f7752144b1e6', '2015-05-29 15:14:19');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('19', 'Wilbert', 'Effertz', 'kenna.lynch@example.net', '1-019-166-4', '8f54084955e6325a70fbfa55dd3aedd4fe797c3d', '1999-04-13 10:15:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('20', 'Estella', 'Pagac', 'afeil@example.com', '(890)771-29', '9fd5bba92e29360cb57b900f2ef19cb36bff9229', '1977-04-06 11:05:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('21', 'Keon', 'Beahan', 'yryan@example.org', '1-031-946-3', 'f9ffa21430ca2bd9db157b5f411feabcee74f7d3', '1981-01-05 14:55:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('22', 'Rodolfo', 'Johnston', 'ddicki@example.org', '+26(9)84561', 'abbf7217f8b119dce6ea917467e85bb5480d1524', '1984-02-26 16:18:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('23', 'Nelda', 'Hoeger', 'gwyman@example.net', '640-465-585', '6bce618fe9ac4a4c162d0a90449244eebb9c443d', '1996-01-07 16:22:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('24', 'Meagan', 'Kuhlman', 'lambert.bahringer@example.net', '(433)436-12', '5ede944d1c98b07aa3d5ef3362f0d5ca9828535a', '2020-05-19 16:06:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('25', 'Orlando', 'Mitchell', 'hwilliamson@example.net', '261.215.052', 'aa7b7ec33fbc444f90af868b30d6ab43402d9a78', '1991-06-05 10:52:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('26', 'Camren', 'Thiel', 'may.beier@example.net', '1-004-646-2', '38bbd1db76e002d7eaa2c2a3333263f76744a898', '2007-01-21 14:54:44');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('27', 'Nasir', 'Zieme', 'amya.gislason@example.net', '344-799-861', 'b9a470fcf2a92535c382b14325ae0176abb83f26', '1977-04-20 22:24:46');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('28', 'Angel', 'Hessel', 'kertzmann.pearl@example.com', '981-010-657', '1077b964d5ffa90db6627f0768e1139f88a80e94', '2009-10-08 23:14:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('29', 'Raina', 'Abshire', 'ytorphy@example.com', '+08(4)68988', '126db640f2e1f5b7d70ad5f4b076c6703dc6f0a6', '1986-06-04 19:12:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('30', 'Carmella', 'Powlowski', 'conroy.reese@example.com', '1-343-569-6', 'a87ae3594a8ef523e5ba1aa7cfe15e76b8604813', '2007-06-13 16:33:00');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('31', 'Willie', 'Hickle', 'van76@example.net', '1-635-317-0', 'cd564bc50e3bb15f092bda4e2ea6357562d16cc8', '1975-04-03 01:48:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('32', 'Chanelle', 'Hansen', 'weissnat.scot@example.org', '+17(0)09520', '4cffdcb08fc60b0235355ed02791d57b96e47463', '1974-10-23 18:47:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('33', 'Walton', 'Leuschke', 'wkozey@example.org', '766-871-217', '55d3fe3b7a00fac5cfc127eebfea386dab62fcb7', '2015-02-24 16:13:36');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('34', 'Colt', 'Bogan', 'judd93@example.org', '1-898-955-0', 'fad36b8f5a42fa65cd509a612751ad9527e3d233', '1991-09-23 14:45:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('35', 'Jerrell', 'Leuschke', 'mayert.hazle@example.com', '1-990-669-7', 'ca32780b60c8cba6964532f5ee96e576a15287f9', '1996-05-04 18:32:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('36', 'Juston', 'Halvorson', 'janiya.dibbert@example.org', '+73(9)99946', '212fed02bc4e42b4d8e5622ee5aac86a80ee7e45', '2000-10-20 20:30:22');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('37', 'Dallin', 'Boyer', 'tmante@example.net', '985.151.611', 'b7e09cea05c1bf0e5ae57e7fceeed5e7d62361d6', '2001-12-16 03:34:18');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('38', 'Vern', 'Stokes', 'rrunolfsson@example.com', '(980)427-11', '2815653f18908da3741ca398a413b30a1e013a30', '2010-10-28 09:00:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('39', 'Christian', 'McDermott', 'iwalsh@example.org', '370.586.521', '7c642cf4c45a9ee5714749c7ff3520a9408e5682', '1976-01-18 02:14:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('40', 'Uriah', 'Daniel', 'cierra50@example.org', '449.076.509', 'dfba534abd902e54e954ed4b9be6a94412b842b8', '1971-08-12 09:33:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('41', 'Precious', 'Schinner', 'shakira.kozey@example.net', '+32(1)19305', '29805f4fb8f0e35d5efbe551eba6c69eeda11656', '2015-04-11 21:17:55');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('42', 'Jarod', 'Hudson', 'hettinger.daisy@example.org', '466.704.523', 'c99a61ff1f35e8b41ac783a930f995e9bb9641dd', '2021-04-05 11:57:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('43', 'Jana', 'Gibson', 'aosinski@example.com', '(992)128-59', 'ed9be677085f14d856aa5218af8cabea4018119d', '1991-12-30 18:29:39');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('44', 'Mya', 'Bauch', 'doyle83@example.org', '311.405.956', '014536530e8ccf760601a98a1b2b83274b9c4b4f', '1998-04-14 14:21:27');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('45', 'Don', 'Will', 'sheridan88@example.net', '041-024-134', '5f6b69d3141d3111d2c7b9dd292c8db229d01567', '1983-07-09 07:32:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('46', 'Robin', 'Koepp', 'zora.stroman@example.org', '+54(4)56995', 'b4c4d92744731256b2978552c09abdec3ce57484', '1992-07-05 07:19:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('47', 'Jamey', 'Daugherty', 'cwiegand@example.com', '1-660-552-6', '0df875ce81ccb6b2311e8c38dbe72fde0b32073f', '1975-11-22 11:48:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('48', 'Rodrigo', 'Hilpert', 'ftorp@example.net', '506-858-546', 'f6e323d71a15eedda46a09c447760cbaef3e8bcf', '2008-04-23 01:34:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('49', 'Kale', 'Anderson', 'jbogan@example.com', '(753)049-37', '85d35f94da29e93d1ffd53a195d2d985fdd34be5', '1993-08-25 02:29:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('50', 'Delta', 'Robel', 'jones.bernadine@example.net', '+16(1)16469', '65ae044ec6dd9ee69f9c9ac0119915d2a3191c54', '2012-12-26 17:26:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('51', 'Makenna', 'Schoen', 'joe.morissette@example.org', '007.454.777', '8200f033910b9103bd8518300cb4c2d515b80e40', '1989-07-03 09:58:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('52', 'Cayla', 'Funk', 'roob.santina@example.net', '947-884-554', '4cac0df8918ac449900816b706487d18c0c476b5', '1974-06-21 18:27:33');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('53', 'Hosea', 'Stroman', 'terry.idell@example.net', '07590423452', 'f3d0f2cbf549bfbb9fec0d10bfc8654e64397399', '2007-10-25 21:27:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('54', 'Floy', 'Botsford', 'kaleigh.zulauf@example.com', '1-127-777-8', 'c9a1a1bd94dba0413ffd2f494ba63164073338dc', '2004-05-27 13:35:56');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('55', 'Marlin', 'Pfannerstill', 'prohaska.virgil@example.net', '066.277.984', '26e786dffdb1fd5ff8ba8222b274ddf7added23a', '1974-11-26 18:20:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('56', 'Genoveva', 'Gleason', 'duane.bayer@example.com', '354.828.907', '7d33de65a90ccaddc6cd07f34e83cf0617059e24', '1971-10-15 20:23:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('57', 'Kyler', 'Frami', 'freeman15@example.com', '05632022573', '99282fb9d359ff78c1dc7195e14836d66b19e0a5', '1971-06-29 06:12:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('58', 'Ewell', 'Hackett', 'ccruickshank@example.com', '(718)491-14', '83a9619503544fe872d9c5b4cf57bac3ee31900c', '2003-03-18 14:36:04');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('59', 'Friedrich', 'Paucek', 'casper.dillon@example.net', '247-444-225', '7db13bb079f2f0123382800c8f602d2556043710', '1985-07-12 14:10:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('60', 'Brenden', 'Rolfson', 'olson.queenie@example.org', '1-040-473-2', '66d1acb9e7861c20983a6475ff9233cc46cc8795', '1983-03-10 00:32:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('61', 'Kamron', 'Wehner', 'devon.will@example.com', '02828351902', 'b64af213e1ee494a21005e4d70af34693e032323', '1987-02-23 07:57:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('62', 'Elyse', 'Casper', 'zelda.mclaughlin@example.com', '1-112-952-3', '9a1505370af857e1f2d19e7435fa45dd60675b49', '1977-04-05 10:17:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('63', 'Herminia', 'O\'Hara', 'ferry.grayson@example.org', '1-325-292-2', '9d2db5fc6abc0d306fa05026bbeacb9243427832', '1984-11-07 15:16:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('64', 'Salvador', 'Schmitt', 'dock65@example.com', '(227)890-60', '6a3637c39c73974ae289d3c02bea72e66c5adc82', '1987-10-08 03:07:42');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('65', 'Sean', 'Jaskolski', 'jschumm@example.com', '(868)139-59', '3f0da15f8380e7df9bfb597d6c9037132d437692', '1999-12-18 12:32:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('66', 'Carolyne', 'Halvorson', 'larry46@example.net', '959.748.942', 'b1afbf2ab9758b012beb10e49687153a9f1a7f9d', '2019-12-02 19:24:37');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('67', 'Martina', 'Mosciski', 'norene80@example.org', '959.471.659', '55314f1c7e96408f217c0d485302666f61410bfe', '1991-05-18 02:14:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('68', 'Jacey', 'Oberbrunner', 'darron.schmitt@example.org', '814.415.023', '7d421499065c62dc3c7064926c1a027fea062df3', '1983-02-06 20:54:07');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('69', 'Jesus', 'Jacobs', 'brath@example.net', '(164)015-68', '9ef4921af3addfbe89c8f289fadf08a90aa8b1b0', '1973-08-07 09:34:38');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('70', 'Blair', 'Ernser', 'smith.helena@example.com', '(298)496-94', '32f3cd94f1531f115ba913e51f6116fc9f17796b', '2000-08-26 06:00:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('71', 'Franz', 'Blick', 'karelle67@example.org', '1-249-175-8', 'b23e1ae7d7433168fb0450424c6122130c2d3148', '2001-01-24 06:52:47');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('72', 'Camila', 'Halvorson', 'cwaelchi@example.com', '966-591-485', '86f65f5eec6a0f631b212d8927af6ab21a5c7990', '2018-07-10 04:35:43');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('73', 'Rebecca', 'Will', 'neal38@example.org', '1-286-641-2', '865328d49cd7172d8d2e3b6cda6a571a4a080d89', '2000-04-29 13:03:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('74', 'Marcellus', 'Armstrong', 'rita95@example.net', '424.221.406', '77577f68b69b3a31af72f7e49ee10f15def65977', '2018-01-25 16:20:09');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('75', 'Cecilia', 'Denesik', 'hbartell@example.com', '(703)290-77', 'c54358285688251ed09780737eb6c6a9aa9cac3e', '1983-09-17 23:25:35');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('76', 'Jettie', 'Lowe', 'uweimann@example.com', '+36(5)01629', 'e52d3fa50d04621f628429593d438f3a6ad6e91c', '1996-06-26 08:22:45');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('77', 'Vincenzo', 'Stamm', 'justus58@example.com', '902.122.475', '66f8ecc14225919b33a60bb4594fd5247d1ffbbd', '1977-11-15 10:32:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('78', 'Macy', 'Morissette', 'bartholome99@example.org', '700.707.186', '445373bf5673f7a33f0162290a4e666320353a63', '2018-04-03 21:11:30');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('79', 'Donald', 'Deckow', 'fkuphal@example.com', '07141746441', '47e0ecb5007b7ab5cf48c935df53e5025aee0830', '2015-05-22 10:34:12');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('80', 'Ezekiel', 'Hyatt', 'aniya.larson@example.org', '488-716-162', '433299bbc3f8e3f3c339520ee28324db6afc9ffd', '2008-03-22 21:49:08');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('81', 'Kelsi', 'Kovacek', 'oswald.ziemann@example.net', '712.869.399', '0cae1a6114a10ecc88b13cb7135d2fc2eb3c4f97', '1971-09-26 16:41:26');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('82', 'Thalia', 'Welch', 'fjaskolski@example.net', '669.203.682', '70905c2075a0ed8bbadf3a7da36442cc5797f587', '2010-10-23 00:01:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('83', 'Quentin', 'Terry', 'lesch.montana@example.net', '1-865-750-8', '2605b692b9a3c75d15e8f7efdb4c5014652099f3', '1982-10-05 17:51:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('84', 'Stone', 'Hirthe', 'schulist.quinten@example.net', '(003)717-45', '805e1e08ce098594f1dfe621ce7a0344e0adbf4a', '1985-12-28 00:43:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('85', 'Alexandrine', 'Renner', 'fhowell@example.net', '(710)123-54', 'ca40cb21c8ee1398a69f22309df2c9e0fb93e08c', '2019-09-30 08:57:57');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('86', 'Chadrick', 'Waelchi', 'berniece.kerluke@example.org', '999.965.525', 'dc9450bccb7b737111ce82f853569742a623cbfe', '1980-09-09 08:10:03');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('87', 'Russell', 'Schulist', 'harvey.leslie@example.net', '+32(3)82942', 'b19594e106388df96c501bf0c4a6d53cda9ae781', '1991-06-13 20:10:25');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('88', 'Pearline', 'Beer', 'ozella12@example.com', '544.028.495', 'b5c05d7c18e18eb970b3afdf4fd38c22ee04e1e7', '2011-02-11 17:09:59');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('89', 'Adolphus', 'Gorczany', 'dane96@example.net', '272.644.403', '47aea7a657b3c6e035c7daa702702080a82561a1', '1987-07-13 06:37:50');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('90', 'Narciso', 'Willms', 'dolly87@example.net', '(021)941-79', 'e81eb9702927753265f8602d5c7b569c5522caa3', '1978-06-26 02:33:02');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('91', 'Rolando', 'Wilkinson', 'king.arnold@example.com', '+91(7)01083', '1fcf433bf66d439af62606fc91ae60d26a95d857', '1995-03-28 22:01:16');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('92', 'Hugh', 'Heidenreich', 'hettinger.alisha@example.org', '(103)213-20', '76dfc02a167f99b12a166eda3e1c6f3e4b216a68', '1988-11-18 20:01:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('93', 'Devon', 'Denesik', 'jacobson.maxine@example.com', '945.198.731', '10865bcc54a5e8a392d3d7fbe2e7aa64b9b194d4', '2006-11-18 07:54:40');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('94', 'Milo', 'Cole', 'aimee84@example.com', '(216)759-72', '8ead627e1d23568431f0b4cb0fe045257e5653c3', '1980-04-29 17:10:15');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('95', 'Wilton', 'Cormier', 'hyatt.daniella@example.com', '514.345.498', 'ae8ee7d48b2872e7f246f1eff20eec4983c2d30b', '1972-02-12 17:24:29');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('96', 'Flavio', 'Ebert', 'gaylord.jacinto@example.org', '1-264-913-9', 'b107e663de9efaec258500e0c5cd5f1b2637c42c', '1990-04-19 10:40:06');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('97', 'Keely', 'Lesch', 'emely67@example.net', '06666311255', '205e4d70056a07c3cc443ab8f3e909c2cdafa49e', '1992-12-25 04:22:24');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('98', 'Eriberto', 'Daniel', 'eden.johnson@example.com', '352-265-051', '417bf377badf68a125c2238f07c11dee266911ac', '1993-07-22 15:06:13');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('99', 'Milford', 'Pagac', 'waylon96@example.com', '(288)075-46', '00426864b19256f2e6960b1686cffd8064711ba2', '2013-03-25 03:06:28');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password_hash`, `created_at`) VALUES ('100', 'Era', 'Watsica', 'johanna.jaskolski@example.com', '(873)069-26', '78bcf0397f8548380c3a80a73d3a3f49db913d44', '2006-04-29 18:22:35');

UPDATE media_types SET name = 'image' WHERE id = 1;
UPDATE media_types SET name = 'audio' WHERE id = 2;
UPDATE media_types SET name = 'video' WHERE id = 3;
UPDATE media_types SET name = 'document' WHERE id = 4;

delete from friend_requests
where from_user_id = to_user_id;
