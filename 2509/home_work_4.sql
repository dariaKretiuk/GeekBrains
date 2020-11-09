drop database if exists snet1509; -- удаление БД (если сущ. БД мы ее удаляем: чтобы не возникало ошибки при повторном перезапуске кода или слишком намудрили с таблицей и лучше ее пересоздать, чтобы ничего не потерять)
create database snet1509; -- создание БД социальной сети
use snet1509;

drop table if exists users;
create table users(
	id serial primary key, -- serial (псевдотип) = беззнаковый (unsigned) целочисленный тип данных (bigint), NULL не может быть (not null), при каждом занесении в таблицу идентификатор будет увеличиваться на один (auto_increment), повторений не может (unique)
	name varchar(50),
	surname varchar(50),
	email varchar(120) unique,
	phone bigint,
	gender char(1),
	birthday date,
	hometown varchar(50),
	photo_id bigint unsigned,
	pass char(50),
	created_at datetime default current_timestamp, -- current_timestamp - текущее время по дефолту
	-- soft delete (мягкое удаление)
	-- is_deleted bool
	-- deleted_at datetime
	index(phone), -- индексы - помогает делать поиск по определенным столбцам
	index(name, surname),
	index(email)
);

insert into users (id, name, surname, email, phone, gender, birthday, hometown, photo_id, pass, created_at) values 
(1, 'Hannah', 'Schultz', 'hertha.carter@hotmail.com', '1', 'M', '1989-10-29', 'ut', '9', '48d0eee716ea410fd3ca9ea20cc78e5659da8c009d2db73eb2', '1992-11-18 15:34:38'),
(2, 'Clark', 'Barton', 'trantow.abby@pouros.com', '1', 'M', '1989-09-18', 'error', '420801', '14f82bba512644dcf707918d9a794f746b0762c7a8b5ca99a3', '1994-12-13 01:46:10'),
(3, 'Manuel', 'Schimmel', 'ywalter@yahoo.com', '237503', 'F', '2009-11-14', 'ut', '1342', '1ae33e9dc44cc08ac151ebc8a543c99770132c6cb0707babf3', '1979-04-13 18:16:12');

insert into users values
(4, 'Mohamed', 'Schmitt', 'iva33@runolfsdottir.com', '0', 'M', '1980-12-26', 'beatae', '29', 'ef203e5da7d6be8f29edc8ec9972f956715022ff6f7312a666', '2004-02-01 02:02:20'),
(5, 'Marshall', 'Bartell', 'hilbert.schneider@fahey.com', '9349966271', 'M', '2000-01-30', 'itaque', '364', '876f462b341bae3fe8c4a8f8eee421e53ee61bb071dd109328', '2012-05-16 12:46:17'),
(6, 'Tiana', 'Lind', 'hlittel@kessler.com', '24', 'M', '1977-04-18', 'voluptas', '52607727', '7bd00566dad3c5c8adf213a514d08035ba678ef183969418a9', '1973-02-21 03:29:40'),
(7, 'Daphney', 'Cummings', 'graham.koss@gmail.com', '1', 'M', '2017-11-10', 'quisquam', '8158', 'cc156c9341770684616fcacce4fae94875531e6946fb913ffe', '1985-04-01 05:30:00'),
(8, 'Grady', 'Fritsch', 'spencer.katelynn@kihnrosenbaum.biz', '1', 'M', '1990-06-15', 'fugit', '11959915', 'edc929aca17290418c235bcb735fac89cf94ec82682cd0d0a5', '2014-12-18 03:09:17'),
(9, 'Jan', 'Stamm', 'carolyn.rosenbaum@marquardt.com', '1', 'M', '2010-07-11', 'omnis', '95918648', '5e378a1b73a1686d1f79f8679b526bbc5e8490f13e8999ae05', '1974-12-15 15:13:19'),
(10, 'Rhiannon', 'Vandervort', 'rebecca02@keebler.com', '886', 'M', '1991-12-15', 'voluptates', '121', 'f002bfff5b2ae5861243444ccee743e1ecacbdd1bd59d5c559', '2009-11-21 17:40:07');


drop table if exists messages;
create table messages(
	id serial primary key,
	from_user_id bigint unsigned not null, -- ссылаться на столбец id в таблице users => должен совпадать тип данных 
	to_user_id bigint unsigned not null, -- ссылаться на столбец id в таблице users => должен совпадать тип данных
	body text, -- text - нет ограничений в количестве символов
	is_read bool default 0, -- прочитано смс или нет
	created_at datetime default current_timestamp, -- когда сообщение записано в БД
	foreign key (from_user_id) references users (id), -- внешний ключ для ссылки в другую таблицу
	foreign key (to_user_id) references users (id)
);

insert into messages (from_user_id, to_user_id, body, is_read, created_at) values 
(1, 7, 'Molestias sint fugiat vel repellat. Laboriosam possimus debitis blanditiis corrupti inventore error. Inventore iure natus magnam necessitatibus.', 0, '2010-09-21 06:59:17'),
(5, 2, 'Perspiciatis occaecati animi earum accusamus eos quo. Beatae illum sed et mollitia et ea voluptatem. Placeat eos neque ipsa illo voluptate alias sed.', 1, '2004-09-29 08:39:58'),
(2, 8, 'Dolore odio dolor repellat quaerat neque. Ut a voluptatem quaerat mollitia architecto. Aut ipsa soluta esse veniam libero ut. Totam reprehenderit distinctio deserunt placeat deserunt dolores.', 1, '1995-08-15 10:17:15'),
(4, 5, 'Inventore et vero nulla molestias quisquam sapiente. Aut corporis voluptas reprehenderit dolorem aut. Qui molestiae quo cupiditate optio est distinctio sit.', 0, '1999-07-15 16:50:44'),
(7, 3, 'Sit delectus adipisci corporis officiis. Voluptatem sequi necessitatibus quibusdam asperiores perferendis. Totam repudiandae ea enim. Dolorum ut omnis ut ducimus.', 1, '1985-02-11 17:03:21'),
(4, 6, 'Qui dignissimos ut et voluptatem molestias modi. Ipsum eum minima quis placeat officiis illum beatae qui. Voluptatem animi eos omnis ipsa reiciendis. Nobis laboriosam autem laboriosam.', 0, '1997-03-17 15:56:27'),
(3, 9, 'Facilis et qui rerum est quae. Odio facilis quos laboriosam aut voluptate sit. Doloremque unde aliquam nemo doloremque quibusdam voluptas.', 1, '2000-02-09 00:49:14'),
(8, 1, 'Expedita enim quia error. Aut rerum repellat eligendi earum. Quam illo animi tempora recusandae impedit quia.', 0, '1991-12-19 21:57:06'),
(7, 4, 'Culpa quidem natus autem hic. Quaerat tempora consequatur et fuga dolorem qui. Et ad quasi porro. Non voluptatem nemo qui animi eveniet sed itaque.', 0, '1994-06-19 14:50:59'),
(1, 2, 'Sit quis occaecati reiciendis placeat nisi. Et omnis eos dolorem est et laudantium saepe. Nisi unde omnis aperiam rerum rerum.', 1, '1989-12-03 10:45:28'),
(6, 4, 'Sit aut blanditiis iusto amet quis officiis at quia. Aut aut quo in quia. Earum maiores laborum numquam ratione.\nAut molestiae minus nihil. Doloremque dolore aut id ipsa labore autem.', 1, '1972-07-03 15:39:07'),
(3, 1, 'Dolores voluptatum asperiores tenetur qui. Rerum quo perspiciatis harum ratione magni qui officiis. Atque unde suscipit totam voluptatem iure soluta vel. Mollitia ea dolor necessitatibus.', 0, '2011-10-02 22:55:13'),
(2, 8, 'Minima officia dolor rerum neque exercitationem. Quibusdam molestiae commodi ullam iste tempora tenetur nulla. Unde sint similique et esse. Quis illum est repudiandae ducimus.', 1, '1995-03-20 14:56:32'),
(4, 7, 'Omnis at blanditiis magnam at. Labore animi veniam fugit enim est vitae laboriosam. Aliquid maxime inventore perspiciatis qui.', 0, '2009-11-13 10:34:27'),
(10, 8, 'Ipsam minus quia autem blanditiis blanditiis nemo error. Modi perspiciatis perspiciatis ipsam et. Voluptatem sequi ex nihil. Nisi molestias nisi doloremque sed cum qui.', 1, '2013-07-29 02:28:42'),
(2, 6, 'Nemo est dolores quidem. Occaecati itaque qui amet voluptates eligendi.\nMolestiae cumque consectetur ea aliquam. Dignissimos est amet omnis in ea qui est.', 0, '1992-07-12 10:57:03'),
(7, 6, 'Quam consequuntur quos dolores natus. Illum dignissimos quod sunt reprehenderit voluptate ab. Id repellat omnis iusto animi vitae placeat.', 1, '2006-11-28 16:13:18'),
(10, 4, 'Velit sed et suscipit illum non consequatur enim. Repudiandae impedit enim blanditiis quis qui quia tempora. Veniam alias dolor perspiciatis sint. Est sequi omnis ut odit omnis dicta.', 0, '2010-09-21 02:55:05'),
(10, 7, 'Id explicabo impedit cupiditate animi odit et occaecati. Quam magnam aut repudiandae saepe quas quasi. Assumenda earum quisquam consequatur et occaecati. Ullam non voluptate natus omnis.', 1, '2016-08-20 20:58:25'),
(8, 3, 'Aspernatur corporis officia facere quod aut iusto. Quasi laborum sapiente accusantium. Quo officiis ea adipisci necessitatibus ut dignissimos quod.', 0, '1972-10-13 03:12:50'),
(4, 10, 'Ipsa saepe neque aspernatur consequatur dolorum quae. Id voluptatem consectetur quae provident possimus qui. Ratione possimus labore reprehenderit. Sint voluptate qui eveniet in.', 0, '1998-06-25 15:22:43'),
(1, 5, 'Necessitatibus sed consequatur odio blanditiis temporibus aut dolores. Incidunt ut vitae occaecati. Vel illum quis architecto tempora.', 1, '1998-02-14 09:06:46');

select * from messages where from_user_id >= 9;
select * from messages group by to_user_id;

drop table if exists friend_requests;
create table friend_requests(
	-- id serial primary key,
	initiator_user_id bigint unsigned not null, -- кто отправил приглашения в друзья
	target_user_id bigint unsigned not null, -- кто получил приглашения в друзья
	status enum('requested', 'approved', 'unfriended', 'declined') default 'requested', -- enum() -  дает возможность выбрать одно значение из определенного списка (аргументов)
	requested_at datetime default now(),
	confirmed_at datetime default current_timestamp on update current_timestamp,
	primary key(initiator_user_id, target_user_id),
	foreign key (initiator_user_id) references users (id),
	foreign key (target_user_id) references users (id)
);
-- alter позволяет модифицировать объекты бд (менять имена столбцов, менять тип данных столбцов, переименовывать таблицы и т.д.)
alter table friend_requests add index(initiator_user_id);
insert into friend_requests values
('5', '8', 'requested', '1998-09-22 15:38:25', '1982-10-01 08:28:47'),
('6', '1', 'unfriended', '2006-10-29 08:24:41', '1981-01-24 19:24:59'),
('7', '3', 'unfriended', '1990-02-22 16:28:07', '1997-10-24 03:25:39'),
('7', '2', 'declined', '1972-03-07 13:52:19', '1983-11-17 04:21:59'),
('8', '4', 'declined', '1975-09-28 23:32:45', '1983-08-03 17:46:17'),
('1', '10', 'requested', '2020-05-21 10:54:16', '1982-05-03 18:32:19'),
('10', '3', 'unfriended', '2004-08-01 18:32:32', '2013-07-29 08:59:05'),
('4', '5', 'declined', '2013-05-17 03:01:17', '2009-04-20 19:32:50');

select initiator_user_id, status from friend_requests where requested_at between '1970-01-01' and '1990-01-01';
select concat(surname, ' ', name) persons, status, requested_at from users, friend_requests where (requested_at between '1970-01-01' and '1990-01-01') and id=initiator_user_id;
/*INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('18', '24', 'approved', '1997-10-25 03:14:21', '1973-07-16 00:56:23');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('21', '81', 'requested', '2000-05-08 15:16:08', '1994-12-25 10:53:53');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('30', '51', 'approved', '2008-05-27 07:28:44', '2005-01-24 14:32:06');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('35', '26', 'approved', '1987-10-04 00:30:33', '1970-10-20 02:26:19');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('36', '23', 'approved', '1976-11-12 19:15:43', '2016-10-29 04:00:31');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('41', '51', 'unfriended', '1980-12-19 07:38:05', '1999-07-25 23:56:33');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('45', '44', 'declined', '2004-05-23 00:01:51', '2020-06-28 02:26:57');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('45', '84', 'unfriended', '2018-09-06 23:04:25', '2002-02-20 20:46:49');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('50', '40', 'requested', '2015-02-23 08:11:35', '2020-08-25 19:34:24');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('57', '24', 'approved', '1988-01-13 16:13:50', '2017-04-11 16:28:55');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('59', '82', 'unfriended', '2011-03-08 19:46:35', '1988-08-11 16:40:56');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('61', '41', 'declined', '1981-03-21 05:32:43', '2019-03-20 05:46:13');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('64', '43', 'declined', '2007-06-18 10:54:04', '2006-10-29 20:49:50');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('67', '16', 'requested', '1992-01-31 13:45:44', '1997-05-11 05:56:03');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('74', '63', 'declined', '1990-10-01 00:09:25', '2007-06-02 07:44:31');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('75', '90', 'unfriended', '1974-06-20 23:10:47', '1997-08-08 21:55:15');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('76', '8', 'approved', '1982-03-05 06:03:32', '1999-03-16 02:09:25');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('77', '69', 'approved', '2014-05-24 14:05:13', '2011-12-13 12:28:29');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('77', '91', 'approved', '1999-08-12 09:46:45', '1997-03-30 12:26:55');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('78', '33', 'requested', '1996-09-11 03:16:33', '2019-10-07 03:59:26');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('78', '74', 'requested', '1988-04-15 17:25:06', '1977-04-13 00:46:55');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('80', '24', 'requested', '2010-02-23 09:39:12', '1981-05-07 03:00:21');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('80', '86', 'requested', '1995-08-05 11:14:24', '2002-09-17 23:40:15');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('83', '38', 'declined', '2014-09-18 15:37:09', '1983-06-17 21:40:16');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('83', '96', 'requested', '2010-07-29 03:37:29', '1970-04-18 03:49:24');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('87', '70', 'approved', '2016-12-03 18:38:19', '2016-05-13 07:24:51');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('88', '27', 'unfriended', '1973-06-20 15:34:32', '1997-03-20 19:11:50');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('88', '87', 'requested', '1984-04-05 07:06:50', '2001-12-05 07:01:20');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('90', '31', 'requested', '1974-07-02 14:43:59', '2009-07-03 12:31:09');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('94', '56', 'unfriended', '1972-10-28 21:22:34', '1976-11-26 19:07:40');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('94', '73', 'declined', '1995-01-24 06:03:58', '1971-08-15 07:01:36');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('95', '85', 'approved', '2014-04-20 22:29:21', '2020-08-31 03:51:19');
*/

drop table if exists communities;
create table communities(
	id serial primary key,
	name varchar(150),
	index communities_name_idx (name)
);
insert into communities values
('6', 'ab'),
('15', 'ab'),
('2', 'animi'),
('20', 'aut'),
('1', 'beatae');
/*INSERT INTO `communities` (`id`, `name`) VALUES ('26', 'consectetur');
INSERT INTO `communities` (`id`, `name`) VALUES ('8', 'cumque');
INSERT INTO `communities` (`id`, `name`) VALUES ('21', 'cupiditate');
INSERT INTO `communities` (`id`, `name`) VALUES ('16', 'distinctio');
INSERT INTO `communities` (`id`, `name`) VALUES ('13', 'dolores');
INSERT INTO `communities` (`id`, `name`) VALUES ('11', 'et');
INSERT INTO `communities` (`id`, `name`) VALUES ('24', 'impedit');
INSERT INTO `communities` (`id`, `name`) VALUES ('12', 'minus');
INSERT INTO `communities` (`id`, `name`) VALUES ('17', 'molestiae');
INSERT INTO `communities` (`id`, `name`) VALUES ('22', 'reiciendis');
INSERT INTO `communities` (`id`, `name`) VALUES ('4', 'repellendus');
INSERT INTO `communities` (`id`, `name`) VALUES ('25', 'reprehenderit');
INSERT INTO `communities` (`id`, `name`) VALUES ('19', 'sed');
INSERT INTO `communities` (`id`, `name`) VALUES ('27', 'similique');
INSERT INTO `communities` (`id`, `name`) VALUES ('10', 'sint');
INSERT INTO `communities` (`id`, `name`) VALUES ('14', 'sit');
INSERT INTO `communities` (`id`, `name`) VALUES ('18', 'sunt');
INSERT INTO `communities` (`id`, `name`) VALUES ('5', 'ullam');
INSERT INTO `communities` (`id`, `name`) VALUES ('7', 'ut');
INSERT INTO `communities` (`id`, `name`) VALUES ('9', 'ut');
INSERT INTO `communities` (`id`, `name`) VALUES ('23', 'velit');
INSERT INTO `communities` (`id`, `name`) VALUES ('3', 'voluptatem');
*/
-- группа | пользователи
-- 1      | м
-- м      | 1
-- поэтому создается промежуточная таблица связывающая группы и пользователей

drop table if exists  users_communities;
create table users_communities(
	user_id bigint unsigned not null,
	community_id bigint unsigned not null,
	is_admin bool default 0,
	primary key(user_id, community_id),
	foreign key (user_id) references users (id),
	foreign key (community_id) references communities (id)
);
/*
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('1', '20', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('1', '21', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('3', '25', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('4', '10', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('12', '12', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('14', '12', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('18', '21', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('18', '26', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('20', '8', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('22', '11', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('22', '25', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('27', '19', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('28', '26', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('31', '24', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('32', '23', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('33', '24', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('34', '4', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('35', '15', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('36', '3', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('37', '19', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('39', '3', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('39', '5', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('41', '6', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('43', '19', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('44', '11', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('44', '17', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('46', '15', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('47', '16', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('49', '17', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('50', '23', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('50', '24', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('51', '8', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('52', '7', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('53', '11', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('55', '12', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('55', '17', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('57', '4', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('58', '6', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('58', '16', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('59', '4', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('61', '2', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('62', '18', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('67', '5', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('74', '2', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('74', '17', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('75', '4', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('76', '25', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('77', '15', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('78', '2', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('83', '7', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('85', '1', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('85', '3', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('85', '4', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('86', '18', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('93', '9', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('95', '12', 0);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('95', '19', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('97', '3', 1);
INSERT INTO `users_communities` (`user_id`, `community_id`, `is_admin`) VALUES ('100', '3', 1);
*/

drop table if exists  posts;
create table posts(
	id serial primary key,
	user_id bigint unsigned not null,
	body text,
	metadata json,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp,
	num_likes bigint default 0,
	foreign key (user_id) references users (id)
);
/*
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('1', '55', 'Facere et ut quis minus ducimus consequuntur ut. Quo dolor natus facere rerum laudantium. Nulla cumque doloribus maxime ipsum cumque voluptas.', NULL, '2003-11-06 17:25:55', '1985-05-23 02:53:49', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('2', '93', 'Dolorum deleniti dolor error vero eveniet. Exercitationem aliquid sapiente molestias quam velit assumenda. Exercitationem ex eaque accusamus qui asperiores eum quo. Quo qui enim beatae quos optio.', NULL, '2017-01-06 09:18:18', '1977-02-25 09:16:54', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('3', '9', 'Blanditiis nihil totam et laboriosam blanditiis. Aut unde magnam dolores enim nihil saepe voluptatem qui. Enim voluptatem voluptas qui tempora. Ea laudantium est non dolor.', NULL, '1979-11-01 04:46:28', '1994-08-04 09:44:12', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('4', '80', 'Exercitationem dolorem molestias sunt velit. Sunt qui dolorem eos odit nihil. Aspernatur amet consequuntur magni hic.\nQuae perspiciatis quo facilis libero rerum ipsum. Quasi ut minus quo officia.', NULL, '2004-01-03 23:52:02', '1974-09-04 13:04:03', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('5', '24', 'Eius eligendi autem odio quaerat cum suscipit. Provident rerum et fugit nostrum deserunt aspernatur asperiores. Rerum quia quis nihil provident odio labore ab quam.', NULL, '1980-09-11 22:54:24', '2012-10-23 10:55:04', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('6', '58', 'Magnam vel tenetur dolore molestias facilis a. Est et ad sit tenetur voluptatum neque. Porro et eum temporibus quo quae laboriosam autem. Qui voluptatem dolores commodi illo.', NULL, '2013-06-23 10:20:08', '1973-12-03 11:42:15', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('7', '38', 'Sed dolor eveniet et sunt nihil. Nesciunt et est quisquam qui voluptates. Nobis eos quia earum error.', NULL, '1975-10-30 03:17:58', '1984-03-06 01:23:52', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('8', '98', 'Et perferendis recusandae id. Sunt corporis optio molestiae error reprehenderit quia. Molestias iste fugiat sapiente sint enim et.', NULL, '1996-09-14 19:05:33', '2015-12-24 02:29:17', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('9', '54', 'Eveniet et molestiae harum maxime voluptas praesentium architecto. Tempora et fugiat sunt eos non. Perferendis eligendi quia porro animi et sed.', NULL, '1982-07-24 12:35:49', '1984-05-22 09:42:50', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('10', '29', 'Suscipit qui aut et iste placeat et temporibus. Ipsam numquam quia alias molestiae. Modi incidunt quas modi architecto mollitia asperiores.', NULL, '2001-02-04 16:17:46', '2002-07-07 12:57:30', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('11', '83', 'Et excepturi exercitationem voluptatem sed consequatur corporis amet. Excepturi aut autem libero nobis dolor accusamus. Nam est reprehenderit corporis quas voluptatem ad. Provident et ipsam quia quo.', NULL, '2008-07-23 16:39:53', '2013-05-27 14:01:11', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('12', '55', 'Unde cum odit officiis non nam dolorem. Dolorem voluptatem blanditiis qui maiores ut est. Quia velit et ipsum est quo ea omnis.', NULL, '1993-07-08 07:36:27', '1981-03-08 22:19:41', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('13', '32', 'Omnis sit voluptatum aspernatur omnis. Incidunt sapiente aliquam illo et. Vel deleniti id animi blanditiis.\nExercitationem alias ut ut aliquam doloribus itaque. Vel vel ea fugit corporis soluta qui.', NULL, '2007-12-10 17:33:11', '1994-12-31 10:09:09', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('14', '69', 'Nobis praesentium ratione iure excepturi sapiente amet deleniti. Aut et laudantium tempora. Hic impedit et ipsum ut quae. Et ex aut aut sunt aut nostrum.', NULL, '2006-09-14 17:31:48', '1985-11-19 00:30:57', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('15', '31', 'Dignissimos dolor in provident dolor quis earum suscipit error. Rerum aspernatur ab eum voluptatem. Deserunt ut amet ex unde. Soluta iure rerum hic voluptatem commodi id officia.', NULL, '2019-09-24 15:39:12', '2003-04-24 17:59:52', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('16', '55', 'Impedit quia aut iusto odio modi autem error. Alias omnis fugit culpa quas. Accusantium mollitia atque neque. Aspernatur reprehenderit similique est.', NULL, '2012-07-02 20:07:18', '1990-01-30 13:43:56', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('17', '50', 'Esse ut illum dolorum ut ut consequuntur est. Repellendus quos provident eos. Vero recusandae tenetur quia doloribus possimus quia temporibus. Nostrum ad occaecati ea quia ratione.', NULL, '1973-03-05 10:53:17', '1998-02-17 10:26:00', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('18', '84', 'Voluptate tenetur sint deserunt molestias est. Odio ut assumenda in incidunt excepturi eos quam occaecati. Quae similique aut at sunt incidunt repudiandae. Omnis dolor maiores quod rerum mollitia.', NULL, '1988-08-24 20:55:28', '2001-06-29 07:22:24', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('19', '34', 'Labore rem accusamus aut veritatis ad. Sit quibusdam id quis. Voluptatibus corrupti sequi aut perferendis vitae accusantium.', NULL, '1999-05-19 19:59:15', '2017-03-26 01:06:54', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('20', '23', 'At et dolorum aut totam quaerat occaecati aliquam. Numquam et repudiandae in est quas quidem. Sunt ut dolorum sunt dolorem et magni molestiae assumenda.', NULL, '1997-04-27 07:09:30', '2002-11-16 20:39:23', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('21', '41', 'Et consequatur nemo sequi natus veniam velit mollitia. Minima nisi labore excepturi. Sapiente velit ut corporis. Ab provident sunt rem nihil.', NULL, '2014-03-06 06:59:41', '1970-03-30 07:07:39', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('22', '46', 'Odit eum voluptatum sit qui in dolores et. Sunt quam earum repellendus consectetur aut animi dignissimos. Consectetur quia atque nihil et quia ea. Consequatur est modi voluptates illum.', NULL, '1986-04-27 01:16:42', '1999-02-22 07:13:45', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('23', '6', 'Vitae in voluptatibus libero saepe. Nobis id quas praesentium quae rem quis quaerat. Ut aliquam impedit sed et laboriosam molestias dolorem nobis. Rerum et ipsa ut et.', NULL, '1986-06-11 21:32:29', '2007-01-28 11:04:46', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('24', '79', 'Dicta dolore temporibus facere voluptate delectus sunt. Quod quidem ut esse aut. Est qui tenetur enim quidem in officiis laboriosam.', NULL, '2018-04-24 02:11:18', '1996-02-28 20:30:31', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('25', '90', 'Vitae voluptates quod voluptas qui nesciunt ut cumque. Qui quod impedit reprehenderit. Cum odio assumenda corporis suscipit ut.', NULL, '1971-05-26 02:31:50', '1999-07-12 02:43:40', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('26', '64', 'Libero dolorem eligendi aperiam et. Nulla id et eaque eligendi distinctio corrupti. Quod ipsa aut molestiae aut quis.', NULL, '2005-12-27 23:34:56', '2001-01-05 16:31:04', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('27', '77', 'Et quia quisquam recusandae minus et aperiam blanditiis. Consectetur adipisci amet accusantium et impedit est magni.', NULL, '1982-03-29 14:38:29', '1989-01-20 00:59:42', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('28', '94', 'Ex aliquid facere autem nobis porro ut. In veniam vero modi rerum aut corporis et. Maiores laborum similique enim nemo est qui. Et omnis distinctio reiciendis soluta nihil voluptas aut.', NULL, '1991-09-13 15:51:22', '1983-06-27 12:00:51', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('29', '63', 'Neque laborum ipsa id animi ipsa. Officia ducimus beatae in nihil et nostrum nobis. Voluptatem molestiae et voluptatibus qui esse. Sunt iusto quae accusamus ut qui illo.', NULL, '1973-07-02 04:27:52', '2007-10-26 04:27:36', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('30', '57', 'Nemo assumenda quia voluptatem quae inventore at eligendi iste. Est architecto sit excepturi aut explicabo vero. Incidunt aut officiis eos laboriosam et vel.', NULL, '2018-10-11 04:12:08', '1988-10-27 14:52:03', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('31', '67', 'Ut nobis occaecati officiis quisquam nulla laborum omnis. Autem incidunt iure modi voluptatem accusamus officiis. Earum voluptates aut odit facilis.', NULL, '2000-06-13 02:25:59', '1975-01-28 18:31:42', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('32', '18', 'Voluptatibus iusto omnis qui qui. Laudantium voluptas sunt et ea. Qui vitae qui distinctio quo tempore placeat.', NULL, '2002-03-06 09:18:54', '1993-09-11 07:06:39', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('33', '50', 'Qui fugiat consequatur qui quibusdam. Rerum ut similique voluptatem unde consectetur rerum sapiente. In consequatur quae id in ea eum libero et. Fugiat ab aut fuga laborum est veritatis.', NULL, '1997-08-24 20:57:25', '1972-10-16 19:06:21', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('34', '76', 'Maiores quod eos voluptas et saepe in qui. Qui qui unde sit. Autem quam vitae amet dolor est ex earum.', NULL, '2012-10-07 20:25:27', '1995-03-23 12:21:18', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('35', '97', 'Quia et libero voluptas. Accusamus numquam ut cum autem temporibus deleniti. Delectus recusandae distinctio tempore qui ut iure molestiae.', NULL, '2018-09-26 14:24:36', '2002-03-28 13:53:24', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('36', '74', 'Amet sed voluptatem suscipit quis aut. Et velit qui accusantium maxime non. Consequuntur ut hic sequi ad non eos placeat.', NULL, '1978-06-04 20:52:11', '1981-08-26 22:36:01', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('37', '33', 'Autem voluptatem et et consequatur consequatur qui. Nihil voluptates illo nesciunt esse. Excepturi voluptas ut quia harum.', NULL, '2004-06-17 23:17:47', '2004-02-26 13:36:55', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('38', '34', 'Sit voluptas dolorum facere et et dolore ab. Deleniti aperiam tempora ut placeat et occaecati. Non corporis ipsa atque eum.', NULL, '2009-11-13 11:30:31', '1992-04-22 07:28:24', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('39', '71', 'Eum ea nulla commodi molestiae. Aut reiciendis harum eos tempore dicta eius. Et quia placeat nesciunt explicabo possimus suscipit harum veniam.', NULL, '1997-11-17 09:06:49', '2008-12-30 08:28:42', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('40', '87', 'Iste officia architecto eos voluptatem. Voluptate porro dolor id sit quidem. Veniam alias mollitia itaque nobis error cum est.', NULL, '1990-09-19 02:10:45', '1981-11-03 18:50:31', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('41', '63', 'Laboriosam ut qui tempora libero delectus. Nihil et voluptas quaerat nostrum nostrum recusandae magnam. Expedita atque eos neque ab et architecto vitae. Quia consequatur aut quidem adipisci.', NULL, '2017-02-27 14:41:43', '1999-02-02 22:04:53', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('42', '54', 'Autem sit qui quis qui est quaerat. Ut neque sunt maxime sed aut doloribus eos. Incidunt nobis voluptas repellat nemo neque sed porro. Eius ex qui ullam eos.', NULL, '1982-01-22 01:50:59', '1977-04-10 21:38:00', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('43', '41', 'Quibusdam ut maiores placeat molestias iure. Adipisci id et eveniet. Quo quis iusto est alias voluptatibus labore.', NULL, '1978-05-07 04:34:37', '1998-04-09 21:31:51', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('44', '94', 'Atque et ducimus vitae dolores sed in ut ullam. Nobis voluptate qui ea vitae minus. Officiis et placeat hic necessitatibus et.', NULL, '1990-02-20 03:36:54', '1992-11-05 04:28:57', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('45', '22', 'Harum voluptatum enim culpa et vero. Repellendus nostrum dignissimos necessitatibus vel est ut. Aut non voluptas temporibus consequatur dolores est. Error sunt rerum aut et aut.', NULL, '2012-11-27 15:35:33', '1994-11-28 10:58:25', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('46', '71', 'Dolor quas rerum odit. Voluptatem quia quis et sunt. Vel voluptatem voluptatem doloremque nobis. Molestias omnis aperiam saepe eum. Consequuntur id sint natus odit velit ea incidunt.', NULL, '1978-02-03 18:17:32', '1973-11-13 21:31:35', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('47', '48', 'Optio corrupti sit suscipit porro facilis. Molestias tempore laborum et ea. Culpa officiis sed hic modi assumenda.', NULL, '2014-01-10 10:02:46', '2017-04-16 23:20:42', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('48', '72', 'Dicta omnis omnis expedita dolorem provident dolore fuga ex. Temporibus saepe minus similique culpa dicta nihil. Perspiciatis nisi ut ut non. Quam voluptatem doloribus deserunt voluptatem quibusdam.', NULL, '2010-05-13 16:26:20', '1987-09-13 16:34:01', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('49', '54', 'Veniam similique quas omnis dolor veritatis. At sit eveniet sit veniam. Aut officia qui veniam. Quaerat sed incidunt natus similique non debitis.', NULL, '1997-05-29 08:21:34', '1990-01-08 17:55:54', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('50', '82', 'Rerum ipsam eum possimus et. Odio quis illo vero nostrum quisquam fugiat. Autem consectetur veniam ullam quibusdam inventore.', NULL, '1987-09-16 17:13:02', '1980-01-06 03:10:24', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('51', '95', 'Fugit et optio voluptate iste. Id ratione vel enim reiciendis. Quis nihil et voluptatem consequatur culpa.', NULL, '1973-03-12 14:46:08', '2007-12-12 18:16:59', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('52', '95', 'Dicta aut consectetur ipsam id voluptas itaque. Qui dolorum provident quia quas. Ipsum quia qui expedita sit accusamus nemo. Quae vel aspernatur omnis quidem molestiae dolores.', NULL, '1972-10-25 08:53:36', '1980-09-15 08:24:28', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('53', '27', 'Aliquam exercitationem impedit molestiae dolorem. Tenetur quis sunt id aut consequatur ex dolore vel. Cum est est vel architecto.', NULL, '2009-02-28 01:39:15', '1976-10-10 14:10:25', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('54', '1', 'Asperiores maiores aliquid aut debitis quam pariatur omnis. Quo aut architecto doloribus quis nostrum sed. Quaerat qui libero quia odio non.', NULL, '2009-10-24 03:11:19', '1972-12-11 11:27:18', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('55', '73', 'Rem veniam et cumque consequatur ea ipsum placeat. Provident et beatae et sit doloremque. Qui ratione adipisci eum explicabo est sunt omnis.', NULL, '2016-06-13 17:37:46', '2009-06-28 01:53:23', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('56', '16', 'Rerum modi ab vel id sit. Commodi sit quas autem esse occaecati. Qui exercitationem ut est totam veritatis.', NULL, '1974-10-04 10:05:26', '2014-12-30 01:13:56', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('57', '64', 'Quia repellendus et earum pariatur aliquid ullam molestiae. Quos aspernatur et ut. Magni laboriosam et ex laudantium rerum sint. Consequuntur esse animi libero consequatur molestias deleniti.', NULL, '2013-10-19 16:55:01', '2014-05-06 21:52:00', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('58', '50', 'Dolores ipsam et eum voluptates. Nisi omnis repellat eius nihil voluptatem.', NULL, '2017-05-11 17:07:23', '1970-03-22 16:00:45', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('59', '10', 'Temporibus quis illo et repellendus voluptas similique sed labore. Qui nam porro ipsa sit sapiente omnis et. Omnis totam nisi nihil aut est eligendi ea voluptate. Quos error delectus ipsa rerum.', NULL, '1986-04-05 15:14:12', '2007-03-17 17:01:55', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('60', '27', 'Quis fugit laudantium quo laudantium et. Nostrum neque vel dolor accusamus quo. Consequatur aliquid tempore et sint animi dolor.', NULL, '1999-02-09 12:51:12', '1977-03-24 00:35:45', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('61', '7', 'Sequi consequatur aut fugiat consequatur. Quia odit perspiciatis neque voluptatem voluptas aliquid. Est assumenda unde labore deleniti.', NULL, '2009-08-08 22:53:38', '1987-04-26 08:49:57', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('62', '76', 'Perspiciatis ut quia non quo. Totam eveniet minima quo sit maxime dolores. Quos voluptatem debitis eum voluptates.', NULL, '2015-01-27 06:22:21', '2008-12-14 17:50:34', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('63', '44', 'Optio dolorem ipsam et voluptate sequi et dolores. Vel ipsum facilis placeat sit ea harum maiores. Dolorum sed possimus tempore molestiae. Tempora est in quia error est culpa.', NULL, '2004-01-15 12:46:40', '1985-10-04 12:39:31', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('64', '56', 'A non voluptas fugit blanditiis libero. Qui animi dolore enim itaque at sit. Quaerat sint sed reiciendis.', NULL, '1975-07-31 18:03:08', '1993-07-08 09:50:43', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('65', '52', 'Eveniet autem totam totam commodi sunt autem debitis. Ut qui nobis ut. Quibusdam quia in vitae ea modi rerum est.', NULL, '1977-10-12 00:40:54', '1994-05-31 10:25:35', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('66', '40', 'Aut atque rem omnis harum. Voluptas quisquam eligendi omnis quas alias accusantium. Est voluptas sit odio impedit sit autem quisquam. Qui hic et doloribus quia autem. Impedit omnis fuga vero qui.', NULL, '2001-02-08 23:38:56', '1985-10-27 11:11:12', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('67', '30', 'Sit vel harum explicabo. Dolor debitis quam dicta incidunt et ut omnis. Voluptas voluptatem nam iste eligendi. Autem delectus similique accusamus ea quia. Quas dolores similique est iste.', NULL, '2019-06-08 09:45:52', '1970-02-07 01:32:43', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('68', '85', 'Est unde qui perferendis magni nisi omnis earum. Et magnam tenetur vel sunt. Quis omnis voluptatibus sed saepe voluptatem voluptatem vel in.', NULL, '2009-09-26 23:27:37', '1993-10-14 22:51:36', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('69', '74', 'Odit iure ut iste dolor error saepe. Modi nostrum error omnis vero. A vero optio incidunt harum.', NULL, '1972-01-21 18:17:11', '2009-09-16 01:20:54', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('70', '100', 'Velit atque quidem voluptas ut id hic est quos. Laborum accusantium maxime saepe adipisci corporis eos.', NULL, '1974-03-24 17:20:38', '2012-02-06 13:25:39', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('71', '71', 'Sit id et omnis quasi. Inventore ipsam et quam tempore. Est eos labore aut.', NULL, '1983-08-13 01:19:26', '1996-12-13 08:47:45', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('72', '37', 'Ratione impedit aut ipsam. Eveniet neque expedita ea illum quod eum minima ducimus. Voluptate ut temporibus quasi et qui. Ut praesentium consequatur aut culpa.', NULL, '1971-01-26 13:33:54', '2013-08-26 13:18:01', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('73', '54', 'Voluptatem laudantium possimus labore amet. Magni a suscipit et. Optio doloremque facere dolor velit quibusdam facere et.', NULL, '1994-11-03 06:30:32', '1980-12-25 07:11:37', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('74', '11', 'Sed ratione maiores officia eum vitae. Placeat ducimus facere et qui voluptatem eos ad. Eveniet minima consectetur quia consequatur. At fugiat doloribus rerum rerum libero.', NULL, '2003-03-27 16:07:42', '1998-10-14 17:38:05', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('75', '30', 'Cupiditate amet totam est nemo. Beatae hic expedita sed assumenda neque accusamus vel. Consequatur et consequatur nam iste dolor animi consequatur.', NULL, '2017-05-04 04:29:27', '1984-06-19 21:43:20', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('76', '76', 'Incidunt eius iusto cumque id inventore. Sed ut voluptas consequatur. Quia nobis est quia non aut.', NULL, '2014-03-06 22:12:36', '1992-01-07 13:37:05', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('77', '82', 'Quae occaecati eaque tenetur ab sint consequatur. Omnis vitae est suscipit qui dolores molestias ut. Quia ipsum nulla non mollitia quam.', NULL, '2017-10-17 15:24:10', '2006-10-10 16:35:33', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('78', '78', 'Quidem nisi omnis voluptatem qui minima. Illum officiis qui voluptatem rerum eveniet minima dolorum. Blanditiis iste fugit et impedit. Dolores iusto rem iste veritatis et architecto maiores.', NULL, '1989-01-20 13:15:36', '1992-03-11 07:27:18', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('79', '47', 'Necessitatibus dolores molestias nemo pariatur est. Recusandae dicta esse deleniti magni. Rem autem est dolorem ratione. Temporibus et quibusdam quia.', NULL, '1984-10-29 02:18:38', '2008-06-03 20:58:42', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('80', '36', 'Aliquam nihil architecto distinctio quisquam. Aliquam ea consequatur deserunt sapiente est. Et est iure deleniti quo quos nihil voluptatem delectus.', NULL, '1999-09-01 00:43:16', '1994-12-04 11:46:44', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('81', '59', 'Perferendis mollitia rerum quas aspernatur sint ut recusandae. Reprehenderit est dolore dicta. Odit dignissimos est dicta qui vel a quod.', NULL, '1980-03-11 19:23:42', '1990-01-22 10:25:31', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('82', '42', 'Et et vel ut et aut eaque corrupti possimus. Eos ea voluptatibus at minima. Dicta est deleniti non sed alias pariatur quae ut.', NULL, '2018-09-09 10:08:38', '1981-08-21 19:09:47', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('83', '30', 'Officia aut sequi delectus. Magni quis voluptas repellat vel est nisi. Est consequatur consequatur enim rem aliquam voluptatem qui. Magni similique natus quia error ut voluptate.', NULL, '1971-07-19 06:35:49', '2003-06-11 14:19:45', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('84', '86', 'Magnam nam ea et rem nesciunt molestiae mollitia. Et voluptatem laboriosam reprehenderit dolorem.', NULL, '2013-01-01 12:59:04', '1970-03-07 05:44:17', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('85', '42', 'Quia mollitia quia recusandae quis nisi. Quo quia dolorum nam aliquid quasi itaque. Quam odit minima pariatur omnis qui fuga animi. Id deleniti qui omnis repudiandae corrupti.', NULL, '1993-11-30 12:58:38', '1995-01-08 22:29:40', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('86', '3', 'Sapiente sunt consectetur earum numquam ut quasi iure. Nihil aspernatur vero corrupti culpa enim deleniti vel in. Ducimus pariatur delectus similique vel impedit quaerat.', NULL, '1980-12-09 19:45:21', '2012-10-25 19:29:43', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('87', '2', 'Fugit nam adipisci quod quidem libero quam. Nisi itaque voluptatem debitis iure voluptas officiis eaque. Et non voluptatem delectus iure aliquid.', NULL, '2003-06-10 07:31:07', '2006-02-03 13:49:09', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('88', '6', 'Quam est ut aut ut rerum. Neque fuga voluptatum quibusdam excepturi.', NULL, '2001-07-13 22:03:31', '1993-12-06 14:17:17', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('89', '52', 'Tempora cum error fuga commodi cupiditate pariatur rerum. Animi reprehenderit saepe et fuga non illo. Placeat sunt distinctio non consectetur veritatis ut provident vel.', NULL, '1971-01-09 17:28:05', '1971-05-14 18:24:39', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('90', '11', 'Recusandae quia eum laboriosam sint ipsa eum soluta minus. Omnis voluptatem ut rerum quis nostrum dolorum. Magnam provident autem amet tenetur error qui officiis. Illum et et et impedit sint minima.', NULL, '1998-04-01 09:05:41', '1972-06-19 22:38:18', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('91', '32', 'Non quia eveniet dicta vel voluptatem repudiandae consectetur. Consequatur asperiores sit voluptatem dicta occaecati dolores quis. Asperiores totam perferendis quisquam fugit consequatur modi.', NULL, '2008-11-22 03:03:05', '2009-10-11 04:01:16', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('92', '58', 'Non illum officia blanditiis facilis eos est et. Deserunt ratione autem incidunt deserunt ut. Optio quam sit explicabo delectus eos nihil fugiat. Excepturi alias autem dolor et ab corrupti.', NULL, '1975-01-07 21:02:44', '1995-09-18 11:04:41', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('93', '86', 'Natus occaecati pariatur temporibus amet et distinctio minus explicabo. Rerum impedit illo blanditiis quis tempora voluptatibus. Ratione animi rem sapiente nihil laudantium consequatur officia.', NULL, '1979-02-07 03:13:20', '1988-10-10 11:05:02', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('94', '76', 'Asperiores dolore quibusdam ad quia accusantium id ut. Expedita sint eos assumenda dolores. Saepe totam ea sed.', NULL, '2016-07-04 12:28:00', '2005-05-24 14:24:55', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('95', '14', 'Quod excepturi est sequi aliquid. Est quisquam exercitationem et est ut fuga. Aut neque culpa sed illum. Id rem eaque nobis unde.', NULL, '1981-01-26 20:42:08', '2018-11-01 17:03:21', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('96', '38', 'Eligendi sint sapiente aliquid quam debitis. Et tempore vero perspiciatis omnis vero nam. Dicta labore voluptatum officiis iste et quis sint dolores.', NULL, '1985-12-14 14:43:15', '2014-06-11 12:51:30', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('97', '16', 'Nemo nesciunt sit molestiae minus exercitationem et voluptas. Delectus consectetur qui porro. Assumenda et libero est adipisci excepturi. Quis modi natus fugit qui perferendis labore molestiae.', NULL, '2004-04-13 21:00:44', '1994-08-23 06:01:33', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('98', '43', 'Dolor dicta perferendis aspernatur dolore rerum minus sunt qui. Rerum numquam est tempora doloribus ad et. Praesentium eligendi maxime minima voluptatibus omnis aperiam provident.', NULL, '2002-06-11 21:28:30', '2013-01-28 17:24:02', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('99', '22', 'Aperiam ullam eum rerum. Aut suscipit dolores occaecati earum. Modi dolorum qui eligendi enim nesciunt qui vel. Et nihil quo qui.', NULL, '1995-09-14 03:28:44', '1993-08-24 04:03:51', '0');
INSERT INTO `posts` (`id`, `user_id`, `body`, `metadata`, `created_at`, `updated_at`, `num_likes`) VALUES ('100', '90', 'Quas accusamus et velit quia sit eius. Atque non veritatis alias. Eos dolorem suscipit ut accusantium dolor. Eum pariatur expedita et. Quasi vel accusantium nesciunt molestias.', NULL, '2004-08-18 07:01:24', '2000-11-16 08:14:42', '0');
*/

drop table if exists  comments;
create table comments(
	id serial primary key,
	user_id bigint unsigned not null,
	post_id bigint unsigned not null,
	body text,
	created_at datetime default current_timestamp,
	updated_at datetime default current_timestamp on update current_timestamp,
	num_likes bigint default 0,
	foreign key (user_id) references users (id),
	foreign key (post_id) references posts (id)
);
/*
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('1', '42', '43', 'Beatae dicta laudantium occaecati assumenda nulla ratione. Deserunt facilis qui et. Dolores eum voluptas commodi. Consequatur ipsum consectetur minima deserunt et. Et quia quia dolores.', '2011-08-26 16:31:21', '2008-02-22 21:28:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('2', '34', '91', 'Voluptas sunt omnis corrupti omnis sed quos maiores. Mollitia ea odit omnis dolor et. Fugiat error fugiat eum ut.', '2007-11-20 03:23:18', '2004-07-15 12:19:18', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('3', '49', '96', 'Vel adipisci et magni quia velit. Corrupti ut aut animi est deserunt.', '2005-10-11 07:57:26', '1989-11-22 14:39:34', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('4', '52', '47', 'Ad est sit ratione inventore necessitatibus qui. Doloribus est quia fugiat quis.', '2002-11-10 06:36:09', '2000-02-28 22:04:25', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('5', '1', '2', 'Non in quia omnis aperiam. Velit corporis et fugit dolor illo numquam. Atque odio velit et labore voluptatibus. Consequatur cupiditate eveniet dolorem dignissimos sunt debitis.', '1987-07-11 13:37:01', '2014-10-11 17:10:08', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('6', '32', '82', 'Adipisci modi omnis exercitationem delectus fugiat. Impedit harum tempora nam est reiciendis sed.', '1994-09-21 14:53:21', '2008-05-31 08:47:42', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('7', '94', '68', 'Aliquam corrupti et assumenda qui eveniet molestiae. Fuga et qui consequatur dolores sit consequatur non. Deserunt tenetur earum ut repellat.', '2013-08-09 11:55:21', '1988-04-28 12:43:15', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('8', '24', '55', 'Quidem qui est est quam dolore soluta. Eum temporibus molestiae ut ullam facere totam adipisci. Non quisquam optio voluptas doloremque et.', '1991-08-05 08:42:01', '2010-12-21 20:36:44', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('9', '16', '11', 'Error voluptates quod et ipsum et quod voluptatibus. Culpa quia odio magni quia ut in et asperiores. Deleniti laborum dolorum voluptatem suscipit dolores quas fugit ducimus.', '2018-04-05 07:33:20', '2014-09-16 15:40:26', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('10', '93', '16', 'Qui earum corporis quaerat exercitationem. Eveniet quia rerum aspernatur. Quia alias aut et molestiae eum.', '1982-04-12 08:01:35', '1996-09-21 11:14:41', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('11', '13', '51', 'Qui dignissimos et unde et sunt quis voluptatibus. Consequatur maxime deserunt aliquid architecto. Dolor ut aperiam dolorem reiciendis eum asperiores qui. Sint quam ipsa asperiores.', '2019-03-03 05:22:22', '1973-06-30 11:25:51', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('12', '23', '75', 'Corrupti fugiat ut at quia. Ipsum quibusdam eos quis illo similique minima. Est dolor autem modi sed illo consequatur quibusdam. Laudantium sint officiis blanditiis laborum.', '1998-09-08 04:53:16', '2002-11-03 02:52:12', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('13', '94', '33', 'Aut tempora nulla qui quaerat. Harum veniam vel ea sint. Dolore voluptatem quae et natus. In rerum voluptates fugit ad dolore porro distinctio.', '1993-02-25 18:15:24', '2009-03-01 16:13:34', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('14', '38', '1', 'Est culpa est est excepturi aliquam perferendis. Possimus molestiae tempore ea natus. Ipsa saepe fugiat error molestiae modi aut delectus nesciunt.', '1997-01-13 02:22:53', '2017-03-16 12:43:53', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('15', '77', '51', 'Minima amet doloremque ut tempora dignissimos corporis. Voluptas quae et ab aut deserunt voluptatum. Sunt tenetur esse aut earum quod repellat nemo.', '1991-11-19 14:21:09', '1987-09-27 02:08:13', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('16', '56', '19', 'Architecto quae quos consequatur repellendus eius voluptatem ex. Eos vero quo vel qui et magnam. Dolore rerum debitis nihil quisquam dignissimos quod.', '1996-08-17 17:06:37', '2016-03-28 10:04:51', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('17', '93', '90', 'Dolor odit quod dignissimos nostrum suscipit commodi. Illo quia consequuntur in ea voluptas. Ex distinctio rerum aut aperiam excepturi vel nihil enim. Et molestias doloremque pariatur.', '2019-09-07 20:29:32', '1970-05-17 09:19:43', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('18', '10', '42', 'Magni dolor voluptatem quam corporis. Impedit repellat voluptas voluptas et aut. Omnis quas provident et odit commodi non consequatur.', '1985-11-18 23:51:51', '1998-08-05 16:12:46', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('19', '85', '62', 'Soluta atque ex rerum quibusdam doloremque. Et vitae beatae ut itaque. Quibusdam occaecati expedita dolor non.', '2014-06-17 13:53:42', '2018-06-08 22:11:58', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('20', '88', '85', 'Facere harum molestias impedit molestiae. Dolore cum nostrum consequuntur voluptate voluptatem dolorum. Et commodi nihil quo eaque.', '2016-11-03 00:19:50', '2018-04-17 04:41:29', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('21', '63', '20', 'Molestias error nihil ut excepturi. Ut ipsum odio id eaque. Molestiae veniam et rerum omnis deleniti voluptate. Deserunt molestiae amet vel aut quam molestiae.', '2004-09-29 20:27:21', '1997-11-12 05:37:55', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('22', '67', '56', 'Doloremque et quasi voluptatum. Placeat numquam sunt ut aut.', '1987-05-27 17:03:38', '1975-03-07 03:58:43', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('23', '88', '90', 'Maxime atque velit aut quia vel iure iure. Maiores iste suscipit magnam nesciunt. Cum blanditiis voluptatem odit voluptas omnis earum.', '2009-12-16 06:37:03', '1973-10-03 07:38:49', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('24', '11', '4', 'Numquam nam est aut illum numquam dolorum. Qui ut neque nihil ab voluptas error voluptas.', '1978-04-25 12:19:03', '1983-11-17 21:43:56', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('25', '100', '3', 'Beatae unde voluptatem molestias alias quis. Id delectus id voluptatem quia. Sit officiis et nesciunt dolor cupiditate et doloribus sed.', '1978-10-20 15:45:35', '1977-11-09 12:28:14', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('26', '20', '13', 'Ea consectetur accusantium nisi eum. Beatae magnam dolores alias velit.', '2016-07-26 01:02:58', '2020-04-30 08:20:50', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('27', '54', '42', 'Ab sequi et dolor nesciunt. Deserunt id sint nostrum at est expedita dolor. Quia consequatur labore repudiandae temporibus dolor ut.', '1998-10-03 12:38:13', '1981-08-12 11:29:32', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('28', '87', '47', 'Officiis sunt sit quis aut. Unde qui ipsam doloremque nesciunt hic qui. Aut consequuntur libero sunt rerum. Et mollitia ipsa sunt nisi.', '1976-09-21 23:50:49', '1983-06-04 00:51:18', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('29', '75', '24', 'Aut soluta aliquid optio eius necessitatibus quia. Quisquam voluptatem non quia omnis.\nSunt voluptas rerum perspiciatis placeat. Dignissimos fugit minus autem velit. Incidunt fugit ipsum rerum.', '1993-11-16 02:57:41', '1979-02-01 03:55:09', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('30', '48', '52', 'Est quasi mollitia a amet ducimus a. Illum vitae incidunt qui corporis repellendus natus. Aspernatur quo omnis voluptas a. Velit aliquam fugiat ut. Possimus voluptas id quasi est.', '1982-11-03 03:00:48', '1983-09-03 00:34:44', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('31', '74', '3', 'Tempora ut quibusdam quia veniam. Qui dolorum provident quis rem non est voluptatem. Ea id suscipit repudiandae enim temporibus.', '1973-05-22 04:56:29', '1981-12-13 13:52:31', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('32', '70', '67', 'Eum et ea minus. Beatae eum asperiores et nihil. Odit cum quibusdam repellendus qui voluptatum officia earum eum. Nihil ut recusandae ea qui et at ut.', '1977-09-08 03:42:28', '2011-01-21 22:06:32', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('33', '92', '80', 'Ut a ducimus nesciunt aut. Mollitia omnis voluptatibus ut ad totam tempore vitae maxime. Ut sit aut deleniti sint. Quis natus minima eveniet quia et.', '2000-11-12 07:50:32', '1973-03-11 04:37:27', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('34', '8', '77', 'Deserunt rerum debitis nam voluptas. Dignissimos fugiat est sunt optio animi et harum.', '1983-07-11 05:26:56', '1983-05-19 02:26:16', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('35', '41', '96', 'Ut eos delectus quia numquam pariatur iste consequatur. Asperiores laborum sit ea magnam vitae. Incidunt ipsam qui dolorem enim quam excepturi aut.', '2016-04-17 03:02:50', '2001-06-29 15:38:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('36', '62', '4', 'Consequatur cumque sit sed qui in. Voluptatem temporibus numquam velit eveniet maiores omnis odit. Est voluptate et sint officia velit. Aspernatur sed optio ea.', '1980-02-12 14:08:54', '1982-04-08 06:31:17', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('37', '16', '28', 'Enim aut est dolorem incidunt voluptatem. Impedit officia laudantium ipsum qui saepe delectus. Exercitationem esse soluta rerum sapiente. Id similique impedit fugit optio dolorum.', '2013-08-29 04:04:39', '1988-11-13 18:17:41', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('38', '59', '3', 'Vitae aut eius ipsa quia. Quam quia error placeat illum esse est. Qui sequi facere dignissimos qui sit asperiores sed. Accusantium ut impedit voluptatibus reprehenderit sint.', '1990-04-09 01:14:11', '2012-05-21 06:01:29', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('39', '17', '70', 'Placeat autem debitis ipsam aliquam. Iure dolorum sed ducimus nisi provident. Totam impedit quae porro autem quia sint. Qui mollitia natus illo deleniti aliquam illo est.', '1991-08-15 20:30:50', '1985-07-18 16:09:44', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('40', '6', '17', 'Labore et quibusdam nihil. Assumenda velit ut nam aut eligendi autem. Libero quidem distinctio quasi ullam dolor asperiores iusto. Alias et facere ipsam pariatur non dolorum suscipit.', '2010-10-01 15:30:05', '1993-09-24 01:40:12', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('41', '72', '25', 'Alias eos sunt rem voluptatem et harum et. Corrupti sunt libero perspiciatis itaque sint temporibus aut. Omnis dolores eius quis tenetur a. Quis veniam sequi eveniet ratione doloremque ea.', '1984-11-17 02:24:44', '1981-06-29 16:51:11', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('42', '29', '25', 'Ut facilis est qui voluptatum. Error architecto tempora quod non aut illum. Ad dicta qui est quaerat hic.', '1992-06-23 22:15:07', '1986-12-31 19:36:33', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('43', '66', '15', 'Ipsam sapiente nihil ut accusantium. Est culpa quam saepe dicta eaque. Sit aspernatur non consequuntur et unde.', '1997-05-08 02:50:15', '1980-05-19 01:16:19', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('44', '72', '41', 'Repudiandae rerum cum est consequuntur. Eveniet ea rerum velit id. Minus nemo eum quae minus quaerat.', '1999-05-20 19:51:14', '1973-05-11 06:50:56', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('45', '39', '19', 'Et nulla esse error incidunt ipsum provident. Dignissimos cupiditate suscipit rerum alias. Est provident sed quidem. Dolores labore nihil quia consequatur in.', '2013-10-27 18:55:30', '1994-07-30 13:47:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('46', '92', '13', 'Minus error et atque ab iusto. Repellat sunt sunt omnis praesentium alias. Ut dicta deleniti reprehenderit. Fugiat inventore eum saepe repudiandae.', '1995-09-20 00:07:09', '2017-12-14 19:19:01', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('47', '22', '61', 'Repudiandae optio suscipit veritatis voluptatem optio aliquam iure dolore. Nostrum mollitia nesciunt amet rerum et excepturi. Doloribus illum ea esse a sit explicabo labore.', '2007-02-14 11:47:09', '1974-12-10 04:09:47', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('48', '79', '14', 'Illum qui fugit quia et tempora. Atque ab sed qui esse labore. Voluptatem dolor eos illo doloremque ratione ducimus totam.', '2020-02-10 03:57:35', '2015-09-25 13:23:11', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('49', '41', '87', 'Consectetur pariatur exercitationem modi numquam. Laborum perferendis nihil veritatis quam alias eum omnis. Corrupti voluptas a eum esse.', '1994-02-15 23:05:20', '2003-07-13 07:13:13', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('50', '90', '81', 'Dolores ut asperiores pariatur. Inventore blanditiis blanditiis corporis eligendi. Culpa quaerat iure nihil nihil modi quod sit.', '2001-09-29 01:03:32', '2017-01-01 01:02:59', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('51', '82', '51', 'Optio consectetur omnis nostrum voluptatem quisquam provident. Reiciendis delectus molestiae ipsam modi aut quis natus. Pariatur qui eum a molestias. Porro neque nisi et earum aut enim.', '1975-12-09 00:16:43', '2010-11-01 22:39:31', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('52', '84', '97', 'Accusantium quis aperiam at a ut. Quibusdam voluptas voluptatum totam officiis numquam. Ut pariatur repellendus magnam quia tenetur perferendis.', '1998-08-27 03:01:46', '2001-05-22 04:14:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('53', '79', '43', 'Quasi commodi itaque ut cum qui iure quaerat odio. Cumque repellat expedita autem nemo nulla quos. Dolor libero atque earum non incidunt quia sunt. Atque molestiae ipsum qui.', '1977-04-23 21:06:34', '1988-02-10 22:03:48', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('54', '99', '96', 'Fuga illo labore quis dolores. Eveniet eligendi voluptatibus sit consectetur sit delectus a porro. Dolores recusandae et consequatur cumque similique fuga. Eos neque impedit illo minus.', '2012-06-11 00:34:13', '1988-10-24 09:28:27', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('55', '12', '5', 'Autem fugiat saepe numquam excepturi expedita. Ea dolore distinctio quod est. Fugit non sed deleniti sit officia et laudantium sapiente. Ullam voluptatum aut officia.', '1991-09-14 14:14:37', '1986-12-15 23:17:27', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('56', '12', '84', 'Occaecati deleniti ducimus eum ut autem consectetur veniam. Autem dolores et ut corporis ut tempora. Illum nihil rem voluptatem possimus sunt sunt architecto et.', '1976-02-07 20:00:51', '2002-11-29 03:53:34', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('57', '30', '40', 'Est nam qui voluptas possimus libero molestias. Fugit labore vel aspernatur blanditiis sunt nam vel. Corrupti consequuntur exercitationem vel ut quis quia. Nihil quia saepe quos rerum.', '2015-05-17 09:29:02', '2010-11-04 06:37:50', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('58', '9', '96', 'Rerum et delectus commodi. Delectus et voluptatem aut atque harum aut. Illo eum vel ut cum veritatis alias.', '1987-09-22 09:48:38', '1992-09-28 21:49:27', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('59', '55', '80', 'In quidem enim repellat nihil hic consequuntur. Aliquam aut eligendi vel excepturi exercitationem. Asperiores et ullam nisi quibusdam velit et.', '2003-01-27 09:46:28', '2012-10-20 04:30:42', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('60', '36', '94', 'Amet vel qui id impedit. Id expedita qui eos reiciendis. Et alias assumenda velit voluptas ea corporis repudiandae. Aliquam esse temporibus provident voluptas at nam doloremque.', '1995-07-17 07:02:45', '1979-07-21 18:40:01', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('61', '99', '27', 'Quae dolor molestiae nisi modi voluptatem. Optio hic quidem excepturi numquam est. Adipisci illum dolor et.', '1974-05-30 06:47:14', '1971-02-17 07:21:25', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('62', '6', '20', 'Aliquid dolorem nulla inventore ad similique suscipit. Aut aut vel ea a ullam debitis quis. Accusantium recusandae at ut sint veritatis. Perspiciatis consequatur consequatur facilis.', '2013-08-01 10:06:16', '1990-08-06 08:44:21', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('63', '88', '84', 'Officia quaerat inventore nostrum sint pariatur voluptatem dolorum quos. Tempore nobis animi natus earum repellat eum tempore. Consequatur hic omnis nam magnam.', '1991-04-06 09:54:36', '1985-08-12 23:28:56', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('64', '33', '28', 'Quas voluptatem quos quam voluptas. Illum et sit nisi ratione exercitationem. Voluptas dolores dicta temporibus eos. Maiores tenetur sed provident sit.', '1988-05-25 08:55:07', '2016-05-20 13:05:16', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('65', '71', '23', 'Ratione sit est occaecati harum ut voluptatem atque. Est sequi veniam velit expedita eos aliquid ut. Doloremque corporis laboriosam consequatur aut non.', '2003-10-04 09:18:32', '2009-05-06 09:46:09', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('66', '9', '52', 'Cumque natus quia modi voluptas veritatis. Rem molestiae earum aut quos. Quia est aspernatur tempore corporis occaecati nesciunt.\nSit aut laborum nobis ut. Quia esse sunt est accusamus recusandae.', '2005-07-26 15:26:08', '2016-02-23 01:15:21', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('67', '74', '93', 'Cupiditate quas laborum nulla. Voluptates odio consectetur qui consequatur. Et voluptas sequi perspiciatis voluptas.', '2006-02-09 06:13:13', '1976-12-24 14:02:51', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('68', '49', '52', 'Nihil sequi quo nihil inventore sit. Est odit veniam earum voluptates. Est impedit et eligendi sint et iste ut.', '2008-06-26 20:54:59', '1991-11-15 15:06:46', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('69', '35', '48', 'Facere tenetur dolor aut laborum et. Recusandae sit natus repellendus et repellat voluptatem eligendi animi. Veritatis quo asperiores qui quisquam non fugiat libero.', '1976-07-08 20:16:31', '2014-12-18 11:59:06', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('70', '47', '47', 'Minima hic exercitationem autem dolorum aut temporibus. Architecto est dignissimos nihil error at. Occaecati vel dolore fugit.', '1977-12-15 00:51:06', '1975-07-29 08:05:04', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('71', '52', '59', 'Sapiente est et aut mollitia vel. Voluptas sint dicta qui suscipit voluptas. Repudiandae voluptate consectetur sit unde adipisci. Deserunt sed autem labore.', '2009-12-20 13:43:57', '2019-06-01 23:15:40', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('72', '31', '82', 'Dolore sint laudantium soluta amet explicabo. Dolor recusandae et adipisci a dolor eum odit. Aut dolor sed rerum quo porro.', '1989-05-31 06:02:15', '1971-10-06 10:28:15', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('73', '98', '39', 'Sit laborum ipsam sunt fuga. Neque incidunt optio et aut molestiae. Sint vel sunt hic quod.\nIllo laboriosam quod expedita assumenda. Itaque et asperiores vitae rerum repudiandae sit aut.', '1983-10-25 08:58:19', '2020-03-02 03:11:35', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('74', '77', '53', 'Quaerat assumenda libero vero fugit. Cupiditate aut alias vel enim. Doloribus nulla mollitia magnam quia consequatur omnis qui. Et est deserunt occaecati.', '1971-04-28 03:26:47', '2013-02-13 16:52:33', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('75', '18', '13', 'Quia qui ipsa nobis libero aut ea. Hic occaecati laboriosam rerum ipsa cupiditate possimus. Sint recusandae soluta in sit. Blanditiis autem omnis vel possimus quia.', '2011-05-07 00:47:21', '1983-04-25 01:37:11', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('76', '46', '17', 'Ipsum consequuntur vitae ut eos. Mollitia veniam labore voluptatem. Sequi maxime magni et officia possimus autem et. Alias qui ex pariatur odio provident aliquid aperiam.', '2019-12-15 22:48:52', '2017-05-08 11:43:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('77', '39', '51', 'Est voluptate dolor sit. Hic error quis cumque laborum ut. Voluptate omnis iusto culpa repellat accusantium.', '1998-05-03 18:12:39', '2005-04-25 02:47:06', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('78', '36', '26', 'Provident voluptates alias et at eveniet. Ex est quia eaque quisquam laboriosam perspiciatis. Repudiandae at voluptatem est praesentium beatae.', '1980-12-08 10:35:32', '1990-06-12 22:07:53', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('79', '35', '69', 'Facilis necessitatibus praesentium sed ut. Optio dolor est et est nostrum aliquid rerum repudiandae. Ullam suscipit recusandae ab. Eum delectus excepturi commodi ab vitae.', '1970-06-08 23:26:04', '2002-10-18 04:47:13', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('80', '54', '6', 'Est quidem beatae optio. Velit blanditiis voluptatem consequatur corporis recusandae dolores. Et sint totam est omnis ipsa. Est aliquam fuga adipisci quia quo aspernatur.', '2019-08-12 04:44:44', '1993-10-27 05:32:38', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('81', '91', '62', 'Provident fugit natus facere. Dolore praesentium deserunt occaecati. Quia quod et neque rem. Voluptatem dolor eos ex repellendus eius in. Iusto enim aperiam aut minima omnis doloremque.', '2000-07-12 09:34:14', '1982-11-09 20:19:59', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('82', '57', '64', 'Ut possimus veniam repellat aut. Ullam eligendi necessitatibus tempora nobis.', '2016-06-29 14:08:32', '2019-11-22 13:11:52', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('83', '55', '5', 'Qui rerum fuga et molestias reiciendis quis corrupti velit. In unde ullam sed aut voluptatem. Eum accusantium aut nobis laudantium voluptatem. Iure autem et qui odit.', '1979-11-06 01:59:18', '1971-10-10 06:34:18', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('84', '15', '89', 'Aut cumque dolores suscipit sed. Non libero minima enim. Est rerum consequuntur quisquam voluptatem quisquam.', '1977-01-11 22:06:56', '1970-11-09 02:52:14', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('85', '53', '62', 'Sit nihil magnam necessitatibus delectus molestiae. Assumenda tempore quae qui ea quisquam.\nRerum laboriosam ratione provident. Dignissimos ut eum cumque explicabo vel.', '1970-10-10 02:19:50', '1988-10-20 02:59:47', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('86', '36', '5', 'Omnis dolores non iure aut. Est nam tempora ut maiores dolor. Dolor numquam quia molestias in ullam. Enim molestiae non molestiae aut.\nQuaerat omnis rem consequuntur debitis. Veniam ut non magni.', '1983-07-12 18:53:46', '2012-01-25 09:33:14', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('87', '20', '66', 'Sunt quis est totam sed laborum molestiae illum. Velit reprehenderit beatae aut aut quaerat alias molestiae quis. Non non voluptatem quidem necessitatibus. Quis aut incidunt et quia quaerat.', '1981-06-30 16:32:23', '2005-06-29 09:50:36', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('88', '86', '18', 'Nulla impedit blanditiis minima ratione. Totam enim rem aut officia delectus. Nam at maiores dolores.', '2018-11-29 07:43:52', '1976-12-09 20:26:59', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('89', '5', '63', 'Non sed voluptatum sint quisquam. Libero doloremque voluptatum deleniti porro consequatur velit sed. Aliquam in et quis labore officia non quae nesciunt. Sit quia suscipit qui ipsam excepturi sed.', '1994-10-28 12:33:07', '1999-03-04 03:45:14', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('90', '71', '23', 'Voluptatem eaque consectetur ut ipsum nihil impedit eveniet harum. Doloribus mollitia et vel culpa est nihil.', '1974-08-08 05:06:08', '1999-08-17 19:26:50', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('91', '75', '16', 'Minima voluptas consequatur repudiandae consectetur. Sit odio harum sit. Deleniti velit quod ipsa modi autem quos consequuntur.', '2006-09-15 12:20:07', '1986-12-23 15:10:51', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('92', '39', '13', 'Aliquid illo rerum molestiae omnis. Quod sunt corrupti libero enim vero molestiae. Amet vitae eligendi ut perferendis facere. Incidunt sed vero expedita doloribus.', '1973-12-27 13:10:57', '1982-09-06 19:08:03', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('93', '67', '75', 'Voluptatem atque voluptatem aut nihil est maxime harum est. Qui non odio sint necessitatibus ex. Magnam eum velit qui laudantium eum corrupti. Non et doloremque dolor ut qui autem iusto.', '1981-10-24 15:17:18', '1997-03-27 03:09:37', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('94', '39', '2', 'Nobis eum quod quo magnam temporibus adipisci. Molestias nemo labore consequatur et ut quidem. Ullam et sit quae ut optio qui. Facilis et explicabo ducimus voluptates asperiores.', '2009-08-18 05:41:59', '1997-09-15 08:00:42', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('95', '43', '93', 'Voluptatum aspernatur nobis sed sint sapiente. Commodi sunt voluptas aut nemo aut ipsam. Est maxime occaecati eum consequatur iure et repellendus doloremque. Voluptatibus sequi in voluptates.', '1992-08-14 20:11:02', '2008-09-13 20:35:33', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('96', '7', '33', 'Adipisci in est ipsam ipsum assumenda ipsam pariatur vel. Impedit aut nulla voluptatem perspiciatis libero et hic. Et unde qui rerum dolorem consectetur.', '2017-04-29 06:16:27', '1989-05-04 00:13:40', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('97', '55', '64', 'Dolore ducimus molestiae amet porro. Ab voluptate autem autem necessitatibus. Ex minima est non ab. Harum voluptatem quaerat eaque est reprehenderit.', '1988-11-06 01:38:28', '1970-11-16 00:26:50', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('98', '96', '9', 'Hic voluptatum quaerat laudantium vitae quam. Rerum suscipit commodi ea id sunt autem.', '2013-07-18 13:18:20', '1970-09-24 03:22:17', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('99', '69', '11', 'Voluptatibus velit facilis reprehenderit quis quisquam sit voluptatem voluptas. Vel quia dicta mollitia et provident consequatur.', '2004-04-26 06:17:28', '2004-01-30 12:22:19', '0');
INSERT INTO `comments` (`id`, `user_id`, `post_id`, `body`, `created_at`, `updated_at`, `num_likes`) VALUES ('100', '98', '21', 'Omnis itaque est aliquid tempora beatae et soluta consequatur. Labore vero est ut illum nobis. Voluptatem ut et mollitia blanditiis excepturi.', '2014-10-25 18:02:00', '2007-03-03 03:55:44', '0');
*/

drop table if exists  photos;
create table photos(
	id serial primary key,
	user_id bigint unsigned not null,
	description text,
	filename varchar(250),
	num_likes bigint default 0,
	foreign key (user_id) references users (id)
);
/*
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('1', '83', 'http://www.manteschiller.biz/', 'eveniet', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('2', '93', 'http://bernier.com/', 'error', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('3', '83', 'http://www.botsford.biz/', 'qui', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('4', '30', 'http://www.lindgren.com/', 'enim', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('5', '86', 'http://www.johnstonvonrueden.com/', 'corporis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('6', '43', 'http://www.welch.com/', 'reiciendis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('7', '26', 'http://www.larsontorp.net/', 'laboriosam', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('8', '51', 'http://raynorrodriguez.info/', 'minus', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('9', '35', 'http://schneiderritchie.org/', 'minus', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('10', '6', 'http://kovacekstrosin.com/', 'minima', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('11', '41', 'http://larkin.org/', 'ut', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('12', '96', 'http://zulauf.com/', 'ut', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('13', '76', 'http://trantow.org/', 'iure', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('14', '13', 'http://www.oberbrunner.com/', 'placeat', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('15', '23', 'http://murphy.biz/', 'voluptas', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('16', '95', 'http://www.doyle.com/', 'exercitationem', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('17', '4', 'http://www.runolfsson.biz/', 'nihil', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('18', '5', 'http://hand.com/', 'saepe', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('19', '77', 'http://kemmer.net/', 'labore', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('20', '76', 'http://heathcoteoconner.com/', 'omnis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('21', '22', 'http://www.little.net/', 'sit', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('22', '21', 'http://www.marks.info/', 'laudantium', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('23', '82', 'http://wunsch.com/', 'est', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('24', '58', 'http://www.weberparker.com/', 'qui', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('25', '2', 'http://www.aufderhar.com/', 'repellendus', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('26', '13', 'http://ondrickazboncak.com/', 'aut', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('27', '94', 'http://willdouglas.org/', 'harum', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('28', '4', 'http://leannonharber.com/', 'nulla', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('29', '69', 'http://www.christiansen.com/', 'temporibus', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('30', '80', 'http://fadeloreilly.com/', 'itaque', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('31', '36', 'http://www.swaniawski.biz/', 'quos', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('32', '51', 'http://padberg.org/', 'explicabo', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('33', '73', 'http://www.torphy.biz/', 'dignissimos', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('34', '19', 'http://www.lehner.com/', 'voluptatem', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('35', '81', 'http://buckridge.net/', 'impedit', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('36', '58', 'http://gleason.org/', 'ex', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('37', '62', 'http://gulgowski.com/', 'molestiae', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('38', '6', 'http://www.doyle.biz/', 'et', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('39', '9', 'http://emard.com/', 'accusantium', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('40', '96', 'http://barrowslindgren.info/', 'ad', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('41', '12', 'http://www.shanahan.net/', 'qui', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('42', '50', 'http://hodkiewiczbeer.info/', 'vel', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('43', '91', 'http://volkman.org/', 'nihil', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('44', '87', 'http://www.windler.com/', 'rerum', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('45', '62', 'http://bruen.org/', 'minima', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('46', '14', 'http://crookshermann.com/', 'sed', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('47', '82', 'http://millercormier.com/', 'perspiciatis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('48', '65', 'http://www.murphywatsica.biz/', 'asperiores', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('49', '18', 'http://www.dicki.net/', 'nemo', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('50', '59', 'http://www.kublynch.org/', 'totam', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('51', '41', 'http://littleturcotte.net/', 'ut', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('52', '39', 'http://lindgren.com/', 'optio', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('53', '80', 'http://www.jaskolski.com/', 'consequatur', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('54', '22', 'http://www.armstrong.info/', 'ea', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('55', '97', 'http://schmeler.com/', 'quasi', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('56', '82', 'http://jastkuhn.com/', 'beatae', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('57', '35', 'http://www.swift.com/', 'velit', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('58', '91', 'http://www.schimmeldach.com/', 'voluptate', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('59', '85', 'http://casperrogahn.com/', 'veritatis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('60', '3', 'http://franeckikuhlman.org/', 'est', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('61', '70', 'http://www.borerkuhn.com/', 'ex', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('62', '21', 'http://price.com/', 'atque', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('63', '54', 'http://harvey.com/', 'corrupti', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('64', '42', 'http://kulas.biz/', 'excepturi', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('65', '40', 'http://quitzon.com/', 'quod', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('66', '34', 'http://www.mccluregerlach.net/', 'perspiciatis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('67', '100', 'http://www.koelpin.biz/', 'dolorem', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('68', '1', 'http://www.bernier.com/', 'id', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('69', '40', 'http://rippin.com/', 'incidunt', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('70', '8', 'http://boganmosciski.com/', 'eum', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('71', '96', 'http://www.bogisich.com/', 'ducimus', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('72', '51', 'http://hermistonreichert.com/', 'vero', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('73', '57', 'http://shields.biz/', 'non', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('74', '87', 'http://dibbertbartoletti.org/', 'voluptas', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('75', '38', 'http://abshiresatterfield.com/', 'qui', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('76', '19', 'http://www.huel.biz/', 'animi', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('77', '100', 'http://sanford.com/', 'dignissimos', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('78', '20', 'http://harvey.org/', 'voluptas', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('79', '83', 'http://www.west.com/', 'voluptas', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('80', '18', 'http://www.kuhic.com/', 'et', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('81', '79', 'http://www.balistreri.info/', 'est', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('82', '24', 'http://www.morissette.biz/', 'sed', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('83', '56', 'http://www.schroedergreenfelder.com/', 'animi', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('84', '59', 'http://www.douglas.com/', 'veritatis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('85', '45', 'http://www.nolankuhlman.com/', 'omnis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('86', '53', 'http://bartellsporer.com/', 'in', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('87', '40', 'http://harris.com/', 'quo', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('88', '79', 'http://www.volkmankonopelski.net/', 'est', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('89', '43', 'http://beattymcglynn.org/', 'impedit', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('90', '24', 'http://batz.biz/', 'vero', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('91', '81', 'http://www.rolfson.org/', 'dolorem', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('92', '13', 'http://carter.com/', 'beatae', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('93', '44', 'http://lynchschowalter.com/', 'excepturi', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('94', '35', 'http://erdman.biz/', 'ipsam', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('95', '54', 'http://www.beatty.com/', 'quia', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('96', '83', 'http://stanton.com/', 'illo', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('97', '68', 'http://hagenes.net/', 'reiciendis', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('98', '54', 'http://boehmromaguera.biz/', 'rerum', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('99', '83', 'http://www.crona.info/', 'hic', '0');
INSERT INTO `photos` (`id`, `user_id`, `description`, `filename`, `num_likes`) VALUES ('100', '8', 'http://dickinson.com/', 'commodi', '0');
*/

drop table if exists  likes_photo;
create table likes_photo(
	user_id bigint unsigned not null,
	photo_id bigint unsigned not null,
	primary key(user_id, photo_id),
	foreign key (user_id) references users (id),
	foreign key (photo_id) references photos (id),
	index (user_id),
	index (photo_id)
);
/*
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('2', '74');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('14', '2');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('17', '89');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('25', '16');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('29', '54');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('34', '14');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('34', '87');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('36', '11');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('36', '59');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('37', '76');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('40', '4');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('50', '76');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('51', '24');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('66', '8');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('70', '11');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('74', '50');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('74', '62');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('81', '75');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('86', '75');
INSERT INTO `likes_photo` (`user_id`, `photo_id`) VALUES ('91', '19');
*/

drop table if exists  likes_post;
create table likes_post(
	user_id bigint unsigned not null,
	posts_id bigint unsigned not null,
	primary key(user_id, posts_id),
	foreign key (user_id) references users (id),
	foreign key (posts_id) references posts (id),
	index (user_id),
	index (posts_id)
);
/*
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('5', '15');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('5', '79');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('15', '77');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('36', '26');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('41', '22');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('48', '49');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('53', '53');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('62', '24');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('67', '29');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('80', '98');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('96', '26');
INSERT INTO `likes_post` (`user_id`, `posts_id`) VALUES ('99', '84');
*/

drop table if exists  likes_comment;
create table likes_comment(
	user_id bigint unsigned not null,
	comments_id bigint unsigned not null,
	primary key(user_id, comments_id),
	foreign key (user_id) references users (id),
	foreign key (comments_id) references comments (id),
	index (user_id),
	index (comments_id)
);
/*
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('3', '2');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('12', '3');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('12', '86');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('13', '34');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('19', '2');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('24', '23');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('29', '15');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('41', '57');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('42', '7');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('50', '32');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('57', '87');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('66', '30');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('83', '3');
INSERT INTO `likes_comment` (`user_id`, `comments_id`) VALUES ('85', '87');
*/
-- update photos join likes_photo set num_likes = num_likes + 1 where photos.id = likes_photo.photo_id;
-- update comments, likes_comment set comments.num_likes = replace(comments.num_likes, comments.num_likes, comments.num_likes + 1) where comments.id = likes_comment.comments_id;
-- update posts join likes_post set posts.num_likes = posts.num_likes + 1 where likes_post.posts_id = posts.id;
