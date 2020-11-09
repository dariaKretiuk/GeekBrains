drop database if exists snet1509; -- удаление БД (если сущ. БД мы ее удаляем: чтобы не возникало ошибки при повторном перезапуске кода или слишком намудрили с таблицей и лучше ее пересоздать, чтобы ничего не потерять)
create database snet1509; -- создание БД социальной сети
use snet1509;


-- Task 1
drop table if exists users;
create table users (
  id serial primary key,
  name varchar(255) comment 'Имя покупателя',
  birthday_at date comment 'Дата рождения',
  created_at datetime DEFAULT current_timestamp,
  updated_at datetime DEFAULT current_timestamp on update current_timestamp
) comment = 'Покупатели';
insert into users (id, name, birthday_at) values 
(1, 'Schultz', '1989-10-29'),
(2, 'Barton', '1989-09-18'),
(3, 'Schimmel', '2009-11-14');
insert into users (id, name, birthday_at) values 
(4, 'Dasha', '1989-10-2'),
(5, 'Serega', '1989-09-6'),
(6, 'Elena', '2009-11-28');

update users 
	set created_at = current_timestamp; 
update users 
	set updated_at = current_timestamp; 
	
-- Task 2
drop table if exists users;
create table users (
  id serial primary key,
  name varchar(255) comment 'Имя покупателя',
  birthday_at date comment 'Дата рождения',
  created_at varchar(100),
  updated_at varchar(100)
) comment = 'Покупатели';
insert into users (id, name, birthday_at, created_at, updated_at) values 
(1, 'Schultz', '1989-10-29', '20.10.2017 8:10', '20.10.2017 8:10'),
(2, 'Barton', '1989-09-18', '20.10.2017 8:10', '20.10.2017 8:10'),
(3, 'Schimmel', '2009-11-14', '20.10.2017 8:10', '20.10.2017 8:10');

update users set created_at=str_to_date(created_at, '%d.%m.%Y %h:%i');
alter table users modify column created_at datetime default current_timestamp;

update users set updated_at=str_to_date(updated_at, '%d.%m.%Y %h:%i');
alter table users modify column updated_at datetime default current_timestamp;

-- Task 3
drop table if exists storehouses_products;
create table storehouses_products (
  id serial primary key,
  storehouse_id int unsigned,
  product_id int unsigned,
  value int unsigned comment 'Запас товарной позиции на складе',
  created_at datetime default current_timestamp,
  updated_at datetime default current_timestamp on update current_timestamp
) comment = 'Запасы на складе';
insert into storehouses_products (storehouse_id, product_id, value) values
(34, 12, 0),
(785, 5, 5),
(982, 80, 10),
(12, 23, 0),
(12, 7, 34),
(2, 90, 78);

select * from storehouses_products order by value=0 asc, value asc;

-- =====================

-- Task 1
select name, floor((to_days(now()) - to_days(birthday_at)) / 365.25) as age from users;

-- Task 2
drop table if exists day_birthday_at;
create table day_birthday_at (
	monday int unsigned default 0,
	tuesday int unsigned default 0,
	wednesday int unsigned default 0,
	thursday int unsigned default 0,
	friday int unsigned default 0,
	saturday int unsigned default 0,
	sunday int unsigned default 0
);
select DAYNAME(birthday_at) day_name, count(*) count from users group by DAYNAME(birthday_at);


	
