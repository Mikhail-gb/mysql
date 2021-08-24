-- Удаление таблиц, процедур и триггеров.
DROP TABLE IF EXISTS `diagnosis`;
DROP TABLE IF EXISTS `elements_products`;
DROP TABLE IF EXISTS `reason`;
DROP TABLE IF EXISTS `profiles`;
DROP TABLE IF EXISTS `recommendations`;
DROP TABLE IF EXISTS `symptoms`;
DROP TABLE IF EXISTS `type_action`;
DROP TABLE IF EXISTS `type_state_element`;
DROP TABLE IF EXISTS `users`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `elements`;
DROP TABLE IF EXISTS `types_products`;
DROP TABLE IF EXISTS `types_elements`;
DROP PROCEDURE IF EXISTS create_elements;
DROP PROCEDURE IF EXISTS create_products;
DROP PROCEDURE IF EXISTS create_users;
DROP PROCEDURE IF EXISTS create_elements_products;
DROP PROCEDURE IF EXISTS create_profiles;
DROP PROCEDURE IF EXISTS create_symptoms;
DROP PROCEDURE IF EXISTS create_diagnosis;
DROP PROCEDURE IF EXISTS create_reason;
DROP TRIGGER IF EXISTS add_recommendations_after_insert;

-- Создание таблиц, процедур и триггеров
CREATE TABLE `type_action` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL
) COMMENT='Коллекция действий';

CREATE TABLE `type_state_element` (
 `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL
) COMMENT='Состояние элемента';

CREATE TABLE `types_elements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL,
  `description` varchar(10000) NOT NULL
) COMMENT='Типы элементов';

CREATE TABLE `types_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) COMMENT='Типы элементов';

CREATE TABLE `elements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL,
  `content_rate` int NOT NULL,
  `consumption_rate` int NOT NULL,
  `type_element_id` bigint unsigned NOT NULL,
  `description` varchar(10000) NOT NULL,
  KEY `elements_FK` (`type_element_id`),
  CONSTRAINT `elements_FK` FOREIGN KEY (`type_element_id`) REFERENCES `types_elements` (`id`)
) COMMENT='Коллекция элементов (витаминов, микро и макро элементы)';

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `type_product_id` bigint unsigned NOT NULL,
  KEY `products_FK` (`type_product_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`type_product_id`) REFERENCES `types_products` (`id`)
) COMMENT='Коллекция продуктов';

CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `login` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `register_at` datetime NOT NULL
) COMMENT='Коллекция пользователей';

CREATE TABLE `elements_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `element_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `content_element_product` int NOT NULL,
  KEY `elements_products_FK` (`element_id`),
  KEY `elements_products_FK_1` (`product_id`),
  CONSTRAINT `elements_products_FK` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`),
  CONSTRAINT `elements_products_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) COMMENT='Содержание элементов в продуктах';

CREATE TABLE `profiles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` bigint unsigned NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `patronymic` varchar(100) NOT NULL,
  `birthday_at` datetime NOT NULL,
  `city` varchar(100) NOT NULL,
  KEY `profiles_FK` (`user_id`),
  CONSTRAINT `profiles_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

CREATE TABLE `recommendations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `product_id` bigint unsigned NOT NULL,
  `types_actions` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  KEY `recommendations_FK` (`product_id`),
  KEY `recommendations_FK_1` (`user_id`),
  KEY `recommendations_FK_2` (`types_actions`),
  CONSTRAINT `recommendations_FK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `recommendations_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `recommendations_FK_2` FOREIGN KEY (`types_actions`) REFERENCES `type_action` (`id`)
) COMMENT='Рекомендации пользователя';

CREATE TABLE `symptoms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` varchar(1000) DEFAULT NULL
) COMMENT='Коллекция симптомов';

CREATE TABLE `diagnosis` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `user_id` bigint unsigned NOT NULL,
  `symptom_id` bigint unsigned NOT NULL,
  KEY `diagnosis_FK` (`user_id`),
  KEY `diagnosis_FK_1` (`symptom_id`),
  CONSTRAINT `diagnosis_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `diagnosis_FK_1` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`id`)
) COMMENT='Коллекция диагнозов';

CREATE TABLE `reason` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `element_id` bigint unsigned NOT NULL,
  `type_state_element_id` bigint unsigned NOT NULL,
  `symptom_id` bigint unsigned NOT NULL,
  KEY `reason_FK` (`type_state_element_id`),
  KEY `reason_FK_1` (`element_id`),
  KEY `reason_FK_2` (`symptom_id`),
  CONSTRAINT `reason_FK` FOREIGN KEY (`type_state_element_id`) REFERENCES `type_state_element` (`id`),
  CONSTRAINT `reason_FK_1` FOREIGN KEY (`element_id`) REFERENCES `elements` (`id`),
  CONSTRAINT `reason_FK_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`id`)
) COMMENT='Коллеекция причин возникновения симптомов.';

DELIMITER //

create procedure create_elements() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO elements (title, content_rate, consumption_rate, type_element_id, description)
			VALUES (CONCAT('element', @count_rows), FLOOR(RAND()*(4-1)+1), FLOOR(RAND()*(4-1)+1), FLOOR(RAND()*(4-1)+1), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_products() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO products (title, description, type_product_id)
			VALUES (CONCAT('product', @count_rows), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1), FLOOR(RAND()*(4-1)+1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_users() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO users (login, email, register_at)
			VALUES (CONCAT('user', @count_rows), substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1), current_timestamp());
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_elements_products() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO elements_products (element_id, product_id, content_element_product)
			VALUES (FLOOR(RAND()*(1000-1)+1), FLOOR(RAND()*(1000-1)+1), FLOOR(RAND()*(500-1)+1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_profiles() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO profiles (user_id, first_name, last_name, patronymic, birthday_at, city)
			VALUES (
				@count_rows,
				substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1),
				substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1),
				substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1),
				current_timestamp(),
				substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1)
				);
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_symptoms() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO symptoms (description)
			VALUES (substring('ABCDEFGHIJKLMNOPQRSTUVWXYZ',CEILING(RAND() * 26),1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

CREATE TRIGGER add_recommendations_after_insert AFTER INSERT ON diagnosis
FOR EACH ROW
BEGIN
	INSERT INTO recommendations (product_id, types_actions, user_id)
		SELECT ep.product_id, r2.type_state_element_id, d2.user_id FROM reason r2
			JOIN elements_products ep ON (r2.element_id = ep.element_id)
			JOIN diagnosis d2 ON (r2.symptom_id = d2.symptom_id AND d2.user_id = NEW.user_id)
		WHERE r2.element_id in (
									SELECT e.id FROM users u
									JOIN diagnosis d ON (d.user_id = u.id)
									JOIN reason r ON (d.symptom_id = r.symptom_id)
									JOIN elements e ON (e.id = r.element_id)
									WHERE u.id = NEW.user_id
								);
END //
	
create procedure create_diagnosis() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO diagnosis (user_id, symptom_id)
			VALUES (FLOOR(RAND()*(1000-1)+1), FLOOR(RAND()*(1000-1)+1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

create procedure create_reason() 
BEGIN
	set @count_rows := 1;
	WHILE @count_rows <= 1000 DO
		INSERT INTO reason (element_id, type_state_element_id, symptom_id)
			VALUES (FLOOR(RAND()*(1000-1)+1), FLOOR(RAND()*(4-1)+1), FLOOR(RAND()*(1000-1)+1));
		set @count_rows := @count_rows + 1;
	END WHILE;
END //

DELIMITER ;

-- Наполнение таблиц
INSERT INTO `type_action` (title) VALUES ('action_1');
INSERT INTO `type_action` (title) VALUES ('action_2');
INSERT INTO `type_action` (title) VALUES ('action_3');
INSERT INTO `type_action` (title) VALUES ('action_4');

INSERT INTO `type_state_element` (title) VALUES ('state_1');
INSERT INTO `type_state_element` (title) VALUES ('state_2');
INSERT INTO `type_state_element` (title) VALUES ('state_3');
INSERT INTO `type_state_element` (title) VALUES ('state_4');

INSERT INTO `types_elements` (title, description) VALUES ('type_1', 'description_1');
INSERT INTO `types_elements` (title, description) VALUES ('type_2', 'description_2');
INSERT INTO `types_elements` (title, description) VALUES ('type_3', 'description_3');
INSERT INTO `types_elements` (title, description) VALUES ('type_4', 'description_4');

INSERT INTO `types_products` (title, description) VALUES ('product _1', 'description_1');
INSERT INTO `types_products` (title, description) VALUES ('product_2', 'description_2');
INSERT INTO `types_products` (title, description) VALUES ('product_3', 'description_3');
INSERT INTO `types_products` (title, description) VALUES ('product_4', 'description_4');

CALL create_elements();
CALL create_products();
CALL create_users();
CALL create_elements_products();
CALL create_profiles();
CALL create_symptoms();
CALL create_reason();
CALL create_diagnosis();

-- Создание представления выводящее выборку пользователей и элементов которые имеют состояние state_1
CREATE or replace VIEW view_diagnosis_state_1
AS
SELECT u.id, p.first_name, p.last_name, e.title AS element, tse.title AS state
	FROM users u 
	JOIN diagnosis d ON (u.id = d.user_id)
	JOIN profiles p ON (u.id = p.user_id)
	JOIN reason r ON (d.symptom_id = r.symptom_id)
	JOIN elements e ON (e.id = r.element_id)
	JOIN type_state_element tse ON (r.type_state_element_id = tse.id)
WHERE r.type_state_element_id = 1
ORDER BY u.id;

SELECT * FROM view_diagnosis_state_1;

-- Создание представления выводящего выборку пользователей и продукты к которым нужно применить действие action_1
CREATE or replace VIEW view_recommendations_action_1
AS
SELECT u.id, p.first_name, p.last_name, pr.title AS product, ta.title AS action
	FROM users u 
	JOIN recommendations r ON (u.id = r.user_id)
	JOIN profiles p ON (u.id = p.user_id)
	JOIN products pr ON (pr.id = r.product_id)
	JOIN type_action ta ON (r.types_actions = ta.id)
WHERE r.types_actions = 1
ORDER BY u.id;

SELECT * FROM view_recommendations_action_1;
