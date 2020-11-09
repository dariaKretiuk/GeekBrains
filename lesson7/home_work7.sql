use shop;

-- 1-2) cоставьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине и 
-- выведите список товаров products и разделов catalogs, который соответствует товару.

select
	total_info.user_id,
	total_info.name name_users,
	(select p.name 
	from (select product_id from orders_products where order_id = total_info.order_id) as prod_id
	join products p
	where p.id = prod_id.product_id) as name_products,
	(select c.name
	from (select p.catalog_id 
		from (select product_id from orders_products where order_id = total_info.order_id) as prod_id
		join products p
		where p.id = prod_id.product_id) as catalogs_id
	join catalogs c
	where c.id = catalogs_id.catalog_id) as name_catalogs
from
	(select u.id user_id, o.id order_id, u.name
	from users u, orders o
	where u.id = o.user_id) as total_info;
	

-- 3)
drop database if exists hw3;
create database hw3;
use hw3;

drop table if exists flights;
create table flights (
	id serial primary key,
	from_cities varchar(100),
	to_cities varchar(100)
 );
insert into flights
	(from_cities, to_cities)
values
	('moscow', 'omsk'),
	('novgorod', 'kazan'),
	('irkutsk', 'moscow'),
	('omsk', 'irkutsk'),
	('moscow', 'kazan');
	
drop table if exists cities;
create table cities (
	label varchar(100) primary key,
	name varchar(100)
 );
insert into cities
	(label, name)
values
	('moscow', 'Москва'),
	('irkutsk', 'Иркутск'),
	('novgorod', 'Новгород'),
	('omsk', 'Омск'),
	('kazan', 'Казань');
	
select
	(select c.name from cities c where f.from_cities = c.label) as from_name,
	(select c.name from cities c where f.to_cities = c.label) as to_name
from 
	flights f;





