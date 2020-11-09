use course_work;
-- правила заполнения таблицы:
-- 1) id_collection, id_packing_list - обязательно

/*
id serial primary key
id_collection bigint unsigned not null comment 'идентификатор коллекции'
id_manufacture bigint unsigned not null comment 'идентификатор производителя'
*/

delimiter //
drop trigger if exists check_collection_manufacture//
create trigger check_collection_manufacture before insert on collection_manufacture
for each row
begin
	if new.id_collection is null or new.id_collection is null then
		signal sqlstate '45000' set message_text = 'ERROR: values is "null"';
	end if;
end//
delimiter ;

insert into collection_manufacture (id_collection, id_manufacture) values
	(1, 4),
	(2, 4),
	(3, 4),
	(4, 4),
	(5, 4),
	(6, 4),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 4),
	(14, 4),
	(15, 4),
	(16, 4),
	(17, 4),
	(18, 4),
	(19, 4);
insert into collection_manufacture (id_collection, id_manufacture) values
	(20, 2),
	(21, 2),
	(22, 2),
	(23, 2),
	(24, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(28, 2),
	(29, 2);
insert into collection_manufacture (id_collection, id_manufacture) values
	(30, 3),
	(31, 3),
	(32, 3),
	(33, 3),
	(34, 3),
	(35, 3),
	(36, 3),
	(37, 3),
	(38, 3),
	(39, 3);
	





