use shop;

drop table if exists logs;
create table logs(
	name_table varchar(255),
	created_at datetime,
	id_table int unsigned,
	name varchar(255)
) ENGINE=Archive;

delimiter //
drop trigger if exists check_logs_users//
create trigger check_logs_users before insert on users
for each row
begin
	insert into logs values ('users', current_timestamp, new.id, new.name);
end//

drop trigger if exists check_logs_products//
create trigger check_logs_products before insert on products
for each row
begin
	insert into logs values ('products', current_timestamp, new.id, new.name);
end//

drop trigger if exists check_logs_catalogs//
create trigger check_logs_catalogs before insert on catalogs
for each row
begin
	insert into logs values ('catalogs', current_timestamp, new.id, new.name);
end//
delimiter ;

insert into users (id, name, birthday_at) values
  (1, 'Геннадий', '1990-10-05'),
  (2, 'Наталья', '1984-11-12'),
  (3, 'Александр', '1985-05-20'),
  (4, 'Сергей', '1988-02-14'),
  (5, 'Иван', '1998-01-12'),
  (6, 'Мария', '1992-08-29');
  
insert into products (id, name, desription, price, catalog_id) values
  (1, 'Intel Core i3-8100', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 7890.00, 1),
  (2, 'Intel Core i5-7400', 'Процессор для настольных персональных компьютеров, основанных на платформе Intel.', 12700.00, 1),
  (3, 'AMD FX-8320E', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 4780.00, 1),
  (4, 'AMD FX-8320', 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', 7120.00, 1),
  (5, 'ASUS ROG MAXIMUS X HERO', 'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX', 19310.00, 2),
  (6, 'Gigabyte H310M S2H', 'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX', 4790.00, 2),
  (7, 'MSI B250M GAMING PRO', 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', 5060.00, 2);
  
insert into catalogs (id, name) values
  (1, 'Процессоры'),
  (2, 'Материнские платы'),
  (3, 'Видеокарты'),
  (4, 'Жесткие диски'),
  (5, 'Оперативная память');
 
 