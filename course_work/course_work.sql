-- магазин отп/розница плитки "Нефрит-Керамика"
-- таблицы:
-- 1. коллекции
-- 2. производители
-- 3. коллекции - производители
-- 4. стиль
-- 5. похожие коллекции (похожие коллекции - похожий стиль/узор/цвет)
-- 6. покупатели (опт/розница)
-- 7. отзывы/оценки
-- 8. розничные точки (магазины)
-- 9. розничные точки - коллекции (какой объем определенной коллекции нужно в тот или иной магазин)
-- 10. упаковочный лист (полное описание плитки с размерами, с объемами в коробках (для розницы) и поддонах (для оптовиков))
-- 11. артикулы (у каждой коллекции есть разные вариации плитки: облицовочная, напольная, бордюры и т.д.)
-- 12. остатки (какие остатки есть в магазинах и на складе; подсчитывается сколько нужно довезти 
-- по объему с основного склада или заказать у производителей)

drop database if exists course_work;
create database course_work;
use course_work;

-- 1. collection
drop table if exists collection;
create table collection(
	id serial primary key,
	name varchar(40) comment 'название коллекции',
	manufacture varchar(40) comment 'название производителя',
	series enum('1', '2') default '1' comment 'название серии - 1 или 2',
	facing_tiles bool default 0 comment 'облицовочная плитка: 0 - нет, 1 - есть',
	mosaic bool default 0 comment 'мозаика',
	decorative_inserts bool default 0 comment 'вставки декоративные',
	curbs bool default 0 comment 'бордюры',
	floor_tiles bool default 0 comment 'напольная плитка',
	height_facing_tiles int unsigned  comment 'высота облицовочной плитки (так как размеры эти стандартные)',
	width_facing_tiles int unsigned comment 'ширина облицовочной плитки',
	index(name),
	index(manufacture, series)
) comment 'коллекции';

-- 10. packing_list
drop table if exists packing_list;
create table packing_list(
	id serial primary key,
	type_tiles enum('decorative', 'curbs', 'floor', 'mosaic', 'facing', 'volumetric_insert', 'volumetric_border') default 'facing' comment 'тип плитки: вставки декоративные, бордюры, напольная, мозаика, облицовочная',
	height int unsigned comment 'высота плитки',
	width int unsigned comment 'ширина плитки',
	count_pcs_box int unsigned default null comment 'количество штук в коробке',
	count_meter_box float default null comment 'количество кв.метров в коробке',
	kg_box float default null comment 'количество кг. в коробке',
	count_box_pallet int unsigned default null comment 'количество коробок на поддоне',
	count_meter_pallet float default null comment 'количество кв.метров на поддоне - высчитывается автоматически',
	kg_pallet float default null comment 'количество кг. на поддоне - высчитывается автоматически',
	index(width)
) comment 'упаковочный лист';

-- 10. tile_type
drop table if exists tile_type;
create table tile_type(
	id serial primary key,
	type_tiles varchar(30) comment 'тип плитки: вставки декоративные, бордюры, напольная, мозаика, облицовочная'
) comment 'тип плитки';

-- 11. vendor_code
drop table if exists vendor_code;
create table vendor_code(
	code varchar(100) not null unique primary key comment 'артикул',
	id_collection bigint unsigned not null comment 'идентификатор коллекции',
	id_packing_list bigint unsigned not null comment 'идентификатор из упаковочного листа (описание плитки)',
	id_type_tiles bigint unsigned not null comment 'идентификатор из типа плитки',
	price float comment 'цена',
	foreign key (id_collection) references collection (id),
	foreign key (id_packing_list) references packing_list (id),
	foreign key (id_type_tiles) references tile_type (id)
) comment 'актикул';

-- 2. manufacture
drop table if exists manufacture;
create table manufacture(
	id serial primary key,
	name varchar(40) comment 'название производителя',
	description text comment 'описание',
	country varchar(100) comment 'страна'
) comment 'производители';

-- 3. collection-manufacture
drop table if exists collection_manufacture;
create table collection_manufacture(
	id serial primary key,
	id_collection bigint unsigned not null comment 'идентификатор коллекции',
	id_manufacture bigint unsigned not null comment 'идентификатор производителя',
	foreign key (id_collection) references collection (id),
	foreign key (id_manufacture) references manufacture (id)
) comment 'связь производителей и коллекций (много ко многим)';

-- 4. style_collection
drop table if exists style_collection;
create table style_collection(
	id serial primary key,
	id_manufacture bigint unsigned not null comment 'идентификатор производителя',
	style_collection varchar(30) comment 'стиль коллекции',
	foreign key (id_manufacture) references manufacture (id)
) comment 'стиль определенной коллекции';

-- 5. similar_collection
drop table if exists similar_collection;
create table similar_collection(
	id_collection bigint unsigned not null comment 'идентификатор коллекции - что хотим сравнить',
	id_collection_similar bigint unsigned not null comment 'идентификатор коллекции - похожие коллекции',
	foreign key (id_collection) references collection (id),
	foreign key (id_collection_similar) references collection (id)
) comment 'похожие коллекции';

-- 6. buyers_wholesale
drop table if exists wholesale;
create table wholesale(
	id serial primary key,
	name varchar(40) comment 'название/имя покупателя',
	retail bool default 0 comment 'розница: 0 - да, 1 - опт',
	phone bigint comment 'номер телефона',
	delivery_status enum('no', 'collected', 'going to', 'on my way', 'delivered') default 'no' comment 'статус доставки: no - самовывоз',
	delivery_address text comment 'адрес доставки: если розница и самовывоз - адрес розничного магазина',
	volume float comment 'объем (количество метров)',
	vendor_code_collection varchar(100) not null comment 'артикул',
	price double default 0 comment 'цена',
	foreign key (vendor_code_collection) references vendor_code (code)
) comment 'покупатели';

/*
-- 7. buyers_retail
drop table if exists buyers_retail;
create table buyers_retail(
	id serial primary key,
	name varchar(40) comment '',
	phone bigint comment '',
	delivery_status enum('no', 'collected', 'going to', 'on my way', 'delivered') default 'no' comment '',
	delivery_address text comment '',
	volume float comment '',
	vendor_code varchar(255) comment '',
	price bigint default 0
) comment '';
*/

-- 7. rating
drop table if exists rating;
create table rating(
	id serial primary key,
	id_collection bigint unsigned not null comment 'идентификатор коллекции',
	review text comment 'отзыв',
	appraisal int unsigned default 0 comment 'оценка',
	foreign key (id_collection) references collection (id)
) comment 'рейтинг';

-- 8. shops
drop table if exists shops;
create table shops(
	id serial primary key,
	main_warehouse bool default 0 comment 'основной склад: 0 - нет, 1 - да',
	manufacture bool default 0 comment 'производитель: 0 - нет, 1 - да',
	city varchar(20) comment 'город',
	address varchar(255) comment 'адрес',
	phone varchar(255) comment 'номер телефона',
	opening_hours varchar(255) comment 'описание режима работы'
) comment 'магазины (в том числе основной склад, производители)';

-- 9. shops_vendor_code
drop table if exists shops_vendor_code;
create table shops_vendor_code(
	id serial primary key,
	id_shops bigint unsigned not null comment 'идентификатор магазина',
	vendor_code varchar(21) comment 'артикул',
	volume float comment 'объем (количество метров)',
	foreign key (id_shops) references shops (id)
) comment 'связь магазинов и артикул (остатки на складе)';

-- 12. transportation
drop table if exists transportation;
create table transportation(
	id serial primary key,
	id_shops_from bigint unsigned not null comment 'идентификатор магазина - откуда',
	id_shops_to bigint unsigned not null comment 'идентификатор магазина - куда',
	vendor_code varchar(21) comment 'артикул',
	volume float comment 'объем (количество метров)',
	foreign key (id_shops_from) references shops (id),
	foreign key (id_shops_to) references shops (id)
) comment 'перевозки из складов/производителей в розничные магазины/основной склад';





