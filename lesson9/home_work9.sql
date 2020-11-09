use shop;
-- Транзакции, переменные, представления
-- task 1) В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных. 
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.



-- task 2) Создайте представление, которое выводит название name товарной позиции из таблицы products и 
-- соответствующее название каталога name из таблицы catalogs.

create or replace view name_products_catalogs as
select 
	name products,
	(select name catalogs from catalogs c where c.id = p.catalog_id)
from
	products p;
select * from name_products_catalogs;


-- task 3) (по желанию) Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные 
-- записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте запрос, который выводит полный 
-- список дат за август, выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице и 0, если она отсутствует.

drop table if exists task_1_3;
create table task_1_3 (
	id serial primary key,
	created_at datetime default current_timestamp 
);
insert into task_1_3 (created_at) values
	('2018-08-01'),
	('2018-08-04'),
	('2018-08-15'),
	('2018-08-24'),
	('2018-08-31'),
	('2018-08-02'),
	('2018-08-10'),
	('2018-08-06'),
	('2018-08-28'),
	('2018-08-13'),
	('2018-08-07'),
	('2018-08-15'),
	('2018-08-08'),
	('2018-08-11'),
	('2018-08-21'),
	('2018-08-27'),
	('2018-08-05'),
	('2018-08-14'),
	('2018-08-20');

/*
create temporary table august(
	id serial primary key,
	date_august datetime,
	flag int
);

DROP PROCEDURE IF EXISTS days_august;
create procedure days_august()
begin
	set @i='2018-08-01';
	set @fl=0;
	if (i = task_1_3.created_at) then fl = 0 else fl = 1;
	while i != '2018-08-31' do
		insert into august (date_august, flag) values (date_add(i, interval 1 day), fl)
		i = date_add(i, interval 1 day)
	end while;
end;
*/
		
-- task 4) (по желанию) Пусть имеется любая таблица с календарным полем created_at. Создайте запрос, который удаляет 
-- устаревшие записи из таблицы, оставляя только 5 самых свежих записей.


-- Хранимые процедуры и функции, триггеры
-- task 1) Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от 
-- текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".
delimiter //
drop function if exists hello //
create function hello(date_now datetime)
returns text deterministic
begin
	declare hours int default hour(date_now);
	if (hours >= 6 and hours < 12) then
		return "Доброе утро!";
	end if;
	if (hours >= 12 and hours < 18) then
		return "Доброе день!";
	end if;
	if (hours >= 18 and hours < 0) then
		return "Доброе вечер!";
	end if;
	if (hours >= 0 and hours < 6) then
		return "Доброе ночи!";
	end if;
end //

delimiter ;
select hello(CURRENT_DATE);

-- task 2) В таблице products есть два текстовых поля: name с названием товара и description с его описанием. 
-- Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. При попытке присвоить полям 
-- NULL-значение необходимо отменить операцию.
delimiter //
create trigger check_name_desription before insert on products
for each row
begin
	if new.name is null and new.desription is null then
		signal sqlstate '45000' set message_text = 'ERROR: values "null"';
	else
		set new.name = coalesce(new.name, NULL);
		set new.desription = coalesce(new.desription, NULL);
	end if;
end//

delimiter ;
insert into products
	(name, desription, price, catalog_id)
values
	(null, null, 7890.00, 1);

-- task 3) (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. 
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- Вызов функции FIBONACCI(10) должен возвращать число 55.
