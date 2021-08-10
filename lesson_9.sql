-- Практическое задание по теме “Транзакции, переменные, представления
-- Задание 1
START TRANSACTION;

INSERT INTO simple.users (name, birthday_at, created_at, updated_at)
	SELECT name, birthday_at, created_at, updated_at
	FROM shop.users
	WHERE id = 1;
	
DELETE FROM shop.users
WHERE shop.users.id = 1;

COMMIT;

-- Задание 2
CREATE or replace VIEW view_products_category
AS
SELECT p.id, p.name, c.name AS category
	FROM  products p
	JOIN catalogs c ON (p.catalog_id = c.id);
	
SELECT * FROM view_products_category;

-- Практическое задание по теме “Хранимые процедуры и функции, триггеры
-- Задание 1
drop function if exists hello;
 
DELIMITER //
 
CREATE FUNCTION hello()
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	DECLARE result varchar(30);
	IF hour(curtime()) >= 6 AND hour(curtime()) < 12 THEN SET result = 'Доброе утро';
	ELSEIF hour(curtime()) >= 12 AND hour(curtime()) < 18 THEN SET result = 'Добрый день';
	ELSEIF hour(curtime()) >= 18 AND hour(curtime()) <= 23 THEN SET result = 'Добрый вечер';
	ELSEIF hour(curtime()) >= 0 AND hour(curtime()) < 6 THEN SET result = 'Доброй ночи';
 	END IF;
 	RETURN (result); 
END//
 
DELIMITER ;
 
select hello();

-- Задание 2
DROP TRIGGER IF EXISTS check_name_and_description_before_insert;

DELIMITER //

CREATE TRIGGER check_name_and_description_before_insert BEFORE INSERT ON products
FOR EACH ROW
	BEGIN
		IF NEW.name IS NULL AND NEW.description IS NULL THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Canceled. The name or description must be filled in';
		END IF;
	END //
	
DELIMITER ;

INSERT INTO products (price, catalog_id, created_at, updated_at) VALUES 
	('1', '1', '2021-08-08 19:46:11', '2021-08-08 19:46:11');