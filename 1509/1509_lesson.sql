create database test1509; #создание базы данных
use test1509; # с какой базой данных мы будем работать
create table test_tbl( #создание таблицы: в круглых скобках перечисляем все столбцы ( int - целочисленный тип, varchar - строковый тип)
	id int,
    name varchar(100)
);