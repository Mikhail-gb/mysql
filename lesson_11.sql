DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  id SERIAL PRIMARY KEY,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  table_name VARCHAR(255),
  object_id INT UNSIGNED,
  object_name VARCHAR(255)
);

DROP TRIGGER IF EXISTS write_log_after_insert_users;
DROP TRIGGER IF EXISTS write_log_after_insert_products;
DROP TRIGGER IF EXISTS write_log_after_insert_catalogs;

DELIMITER //

CREATE TRIGGER write_log_after_insert_users AFTER INSERT ON users
FOR EACH ROW
	BEGIN
		INSERT INTO logs (created_at, table_name, object_id, object_name) VALUES 
			(current_timestamp(), 'users', NEW.id, NEW.name);
	END //
	
CREATE TRIGGER write_log_after_insert_products AFTER INSERT ON products
FOR EACH ROW
	BEGIN
		INSERT INTO logs (created_at, table_name, object_id, object_name) VALUES 
			(current_timestamp(), 'products', NEW.id, NEW.name);
	END //
	
CREATE TRIGGER write_log_after_insert_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
	BEGIN
		INSERT INTO logs (created_at, table_name, object_id, object_name) VALUES 
			(current_timestamp(), 'catalogs', NEW.id, NEW.name);
	END //
	
DELIMITER ;

INSERT INTO products (name, price, catalog_id, created_at, updated_at) VALUES 
	('test', '1', '1', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO products (name, price, catalog_id, created_at, updated_at) VALUES 
	('test', '1', '1', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO products (name, price, catalog_id, created_at, updated_at) VALUES 
	('test', '1', '1', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO users (name, created_at, updated_at) VALUES 
	('test', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO users (name, created_at, updated_at) VALUES 
	('test', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO users (name, created_at, updated_at) VALUES 
	('test', '2021-08-08 19:46:11', '2021-08-08 19:46:11');
INSERT INTO catalogs (name) VALUES 
	('test1');
INSERT INTO catalogs (name) VALUES 
	('test2');
INSERT INTO catalogs (name) VALUES 
	('test3');


DROP PROCEDURE IF EXISTS create_users;
create procedure create_users() 
begin
	set @count_rows := 0;
	while @count_rows <= 1000000 do
		INSERT INTO users (name, created_at, updated_at) VALUES 
			(CONCAT('test', @count_rows), current_timestamp(), current_timestamp());
		set @count_rows := @count_rows + 1;
	end while;
end;
CALL create_users();