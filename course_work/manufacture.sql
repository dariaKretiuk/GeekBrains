use course_work;
-- правила заполнения таблицы:
-- 1) name - обязательно

/*
id serial primary key,
name varchar(40) comment 'название производителя',
description text comment 'описание',
country varchar(100) comment 'страна'
*/
delimiter //
drop trigger if exists check_manufacture//
create trigger check_manufacture before insert on manufacture
for each row
begin
	if new.name is null then
		signal sqlstate '45000' set message_text = 'ERROR: name is "null"';
	end if;
end//
delimiter ;
insert into manufacture (name, description, country)  values
	('ТМ «НЕФРИТ-КЕРАМИКА»', 
	'ТМ «НЕФРИТ-КЕРАМИКА»​ - это стильные и качественные коллекции современного дизайна. Продукция ТМ «Нефрит-Керамика» 
обеспечивает самый широкий спрос и самые широкие потребности наших покупателей.',
	null),
	('ТМ «1721 Ceramique Imperiale»', 
	'ТМ «1721 Ceramique Imperiale» - это продукция премиум -класса. Коллекционный ряд воплощает лучшие художественные 
	традиции имперской России. В них легко узнаются знаменитые сервизы Императорского фарфорового завода: «Кобальтовая сетка», 
	«Банкетный», «Воспоминание», «Нефритовый фон» и другие.', 
	null),
	('ДИЗАЙН ДИМЫ ЛОГИНОВА',
	'Дизайны «Dima Loginoff»​ - это ультрамодные, минималистичные коллекции, которые созданы совместно с Димой Логиновым, 
	российским дизайнером с мировым именем. Его авторские коллекции позволили предприятию заявить о себе с новой силой 
	на международной выставке «Batimat Russia 2018» и привлечь для сотрудничества архитекторов и дизайнеров.',
	null),
	('ТМ «MODERN CERAMICS»',
	null,
	null);




