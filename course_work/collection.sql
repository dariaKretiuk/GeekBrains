use course_work;
-- правила заполнения таблицы:

/*
	id serial primary key,
	name varchar(40) comment 'название коллекции',
	manufacture varchar(40) comment 'название производителя',
	series enum('1', '2') default '1' comment 'название серии - 1 или 2',
	facing_tiles bool default 1 comment 'облицовочная плитка: 0 - есть, 1 - нет',
	mosaic bool default 0 comment 'мозаика',
	decorative_inserts bool default 0 comment 'вставки декоративные',
	curbs bool default 0 comment 'бордюры',
	floor_tiles bool default 0 comment 'напольная плитка',
	height_facing_tiles int unsigned  comment 'высота облицовочной плитки (так как размеры эти стандартные)',
	width_facing_tiles int unsigned comment 'ширина облицовочной плитки',
	index(name),
	index(manufacture, series)
*/

delimiter //
drop trigger if exists check_collection//
create trigger check_collection before insert on collection
for each row
begin
	if new.name is null then
		signal sqlstate '45000' set message_text = 'ERROR: name is "null"';
	end if;
end//
delimiter ;

insert into collection (name, manufacture, series, facing_tiles, height_facing_tiles, width_facing_tiles) 
values 
	('ABEL', 'ТМ «MODERN CERAMICS»', '2', true, 200, 200),
	('MADLEN', 'ТМ «MODERN CERAMICS»', '2', true, 150, 75);
insert into collection (name, manufacture, series, facing_tiles, decorative_inserts, curbs, height_facing_tiles, width_facing_tiles) 
values 
	('ANET', 'ТМ «MODERN CERAMICS»', '2', false, true, false, 150, 75),
	('BRIGETTE', 'ТМ «MODERN CERAMICS»', '2', true, true, false, 150, 75),
	('MARGARET', 'ТМ «MODERN CERAMICS»', '2', true, true, false, 200, 200),
	('MARMIS', 'ТМ «MODERN CERAMICS»', '2', true, true, true, 150, 75),
	('VALERY', 'ТМ «MODERN CERAMICS»', '2', true, true, true, 150, 75);
insert into collection (name, manufacture, series, facing_tiles, curbs, height_facing_tiles, width_facing_tiles) 
values 
	('BEATRICE', 'ТМ «MODERN CERAMICS»', '2', true, false, 150, 75),
	('CONSTANCE', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('CONSTANCE', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('DORIS', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('FRIDA', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('GABRIEL', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('ISABEL', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('JULIA', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('KLER', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('KRAKLE', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('MARTA', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75),
	('ROZABELLA', 'ТМ «MODERN CERAMICS»', '2', true, true, 150, 75);

insert into collection (name, manufacture, series, facing_tiles, decorative_inserts, floor_tiles, height_facing_tiles, width_facing_tiles) 
values 
	('АРМАН', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, 600, 200), 
	('УГОЛ ОТРАЖЕНИЯ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, 600, 200);
insert into collection (name, manufacture, series, facing_tiles, mosaic, curbs, floor_tiles, height_facing_tiles, width_facing_tiles) 
values  
	('ЧЕСТЕР', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200);
insert into collection (name, manufacture, series, facing_tiles, decorative_inserts, curbs, floor_tiles, height_facing_tiles, width_facing_tiles) 
values 
	('ИРИСЫ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('КОВЧЕГ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('КОРАЛЛ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('НАТАЛИ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('ВОСПОМИНАНИЕ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('ЗОЛОТОЙ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200),
	('СЕТКА КОБАЛЬТОВАЯ', 'ТМ «1721 Ceramique Imperiale»', '2', true, true, true, true, 600, 200);

insert into collection (name, manufacture, series, facing_tiles, decorative_inserts, height_facing_tiles, width_facing_tiles) 
values 
	('ARCHI', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250),
	('GRAPHICA', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250),
	('MUSE', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250),
	('OSLO', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250),
	('PORTOBELLO', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250),
	('ARCHI', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, 500, 250);
insert into collection (name, manufacture, series, facing_tiles, mosaic, decorative_inserts, height_facing_tiles, width_facing_tiles) 
values 
	('RIVOLI', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, true, 500, 250),
	('TROCADERO', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, true, 500, 250);
insert into collection (name, manufacture, series, facing_tiles, decorative_inserts, curbs, height_facing_tiles, width_facing_tiles) 
values 
	('TOKYO', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, true, true, 500, 250);
insert into collection (name, manufacture, series, facing_tiles, height_facing_tiles, width_facing_tiles) 
values 
	('MARAIS', 'ДИЗАЙН ДИМЫ ЛОГИНОВА', '2', true, 500, 250);
