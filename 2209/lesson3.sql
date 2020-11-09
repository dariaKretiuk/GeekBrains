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
/*
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('1', 'Hannah', 'Schultz', 'hertha.carter@hotmail.com', '1', 'M', '1989-10-29', 'ut', '9', '48d0eee716ea410fd3ca9ea20cc78e5659da8c009d2db73eb2', '1992-11-18 15:34:38');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('2', 'Clark', 'Barton', 'trantow.abby@pouros.com', '1', 'M', '1989-09-18', 'error', '420801', '14f82bba512644dcf707918d9a794f746b0762c7a8b5ca99a3', '1994-12-13 01:46:10');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('3', 'Manuel', 'Schimmel', 'ywalter@yahoo.com', '237503', 'F', '2009-11-14', 'ut', '1342', '1ae33e9dc44cc08ac151ebc8a543c99770132c6cb0707babf3', '1979-04-13 18:16:12');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('4', 'Mohamed', 'Schmitt', 'iva33@runolfsdottir.com', '0', 'M', '1980-12-26', 'beatae', '29', 'ef203e5da7d6be8f29edc8ec9972f956715022ff6f7312a666', '2004-02-01 02:02:20');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('5', 'Marshall', 'Bartell', 'hilbert.schneider@fahey.com', '9349966271', 'M', '2000-01-30', 'itaque', '364', '876f462b341bae3fe8c4a8f8eee421e53ee61bb071dd109328', '2012-05-16 12:46:17');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('6', 'Tiana', 'Lind', 'hlittel@kessler.com', '24', 'M', '1977-04-18', 'voluptas', '52607727', '7bd00566dad3c5c8adf213a514d08035ba678ef183969418a9', '1973-02-21 03:29:40');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('7', 'Daphney', 'Cummings', 'graham.koss@gmail.com', '1', 'M', '2017-11-10', 'quisquam', '8158', 'cc156c9341770684616fcacce4fae94875531e6946fb913ffe', '1985-04-01 05:30:00');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('8', 'Grady', 'Fritsch', 'spencer.katelynn@kihnrosenbaum.biz', '1', 'M', '1990-06-15', 'fugit', '11959915', 'edc929aca17290418c235bcb735fac89cf94ec82682cd0d0a5', '2014-12-18 03:09:17');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('9', 'Jan', 'Stamm', 'carolyn.rosenbaum@marquardt.com', '1', 'M', '2010-07-11', 'omnis', '95918648', '5e378a1b73a1686d1f79f8679b526bbc5e8490f13e8999ae05', '1974-12-15 15:13:19');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('10', 'Rhiannon', 'Vandervort', 'rebecca02@keebler.com', '886', 'M', '1991-12-15', 'voluptates', '121', 'f002bfff5b2ae5861243444ccee743e1ecacbdd1bd59d5c559', '2009-11-21 17:40:07');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('11', 'Serena', 'Hintz', 'victor.stamm@hauck.com', '755', 'F', '1972-07-29', 'nobis', '83163539', '7363446ed2ffe1ffdf324da53dff5248befef5b26812d453f2', '1993-05-28 14:01:51');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('12', 'Brandon', 'Hirthe', 'antonio.gibson@trantow.net', '664', 'F', '2019-10-27', 'quis', '7570', '426af53f9c9cc36d69a003ef708e85260bf8b1a3ba92fd8c65', '1997-11-01 15:24:15');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('13', 'Esperanza', 'Runolfsson', 'angeline82@yahoo.com', '1', 'M', '1971-07-27', 'et', '905', 'ddbbec4aeb2ced4dc4fe9568558b5ebb546404fc97de0c7dcd', '1995-09-07 01:00:30');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('14', 'Lonie', 'Herzog', 'idicki@yahoo.com', '444340', 'M', '1993-12-10', 'beatae', '732', '903ee9574d3eb6414a9f9cbb1cbb3fcff49b3792ae1039db01', '1971-09-17 05:37:49');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('15', 'Carmine', 'Cummings', 'jledner@gmail.com', '688107', 'M', '1972-09-01', 'at', '0', 'f5047df9d0ea2de54af91333e49ec83cc707470d9d2d4b239e', '2002-06-27 21:15:12');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('16', 'Carmen', 'Von', 'srosenbaum@rutherford.com', '523085', 'M', '1988-04-24', 'sed', '198982441', '654fcae611def3c17da7536e34258a2be6b054c74a6a65527e', '1972-11-23 17:21:35');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('17', 'Manuel', 'Lowe', 'fae98@yahoo.com', '490', 'F', '1984-09-14', 'est', '85773632', '7e5ddc7fe79b72887a8e88455565c4f4b1bd0c2594bcebc25d', '1992-03-17 23:55:20');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('18', 'Roscoe', 'Hahn', 'block.hannah@yahoo.com', '112034', 'M', '2016-08-10', 'nobis', '402', 'fa8237ac0627618d245289a5ac99dd8db0b9f021347031714e', '1985-05-24 12:29:03');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('19', 'Eldridge', 'Watsica', 'cristina24@lehner.biz', '446452', 'M', '1996-05-15', 'impedit', '1267', '6625682525138e544b9ece5fe654426aca1c0f99150ac90948', '1981-09-20 09:56:34');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('20', 'Brent', 'Turcotte', 'eroob@schroederjacobson.com', '858699', 'M', '1989-03-15', 'tempore', '71698798', '457663ac8ec86b80c41719fa6514f767b2852c8a20601782b6', '1989-04-21 13:55:46');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('21', 'Kiara', 'Kreiger', 'lhyatt@hotmail.com', '25', 'M', '1970-02-09', 'nulla', '722082456', '5b8d0858474f4245a3c8c5488c486f0f6937bcbf69d38b97f8', '1996-12-18 14:53:27');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('22', 'Kiara', 'Lueilwitz', 'tyler02@yahoo.com', '1', 'M', '1986-01-23', 'pariatur', '6919186', 'aaa61653b414c0bed0ec4b7ca3f743a4a999ffc73ab4be748d', '1979-04-15 07:18:08');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('23', 'Irving', 'Grady', 'qcorkery@osinski.com', '943', 'M', '2000-05-29', 'suscipit', '8619', 'be68b8714e879856c953ee831827ffdafe1d468190a30c2db7', '2010-08-30 00:27:15');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('24', 'Jeff', 'Bins', 'agnes.nienow@konopelskiyundt.com', '1', 'M', '1990-09-20', 'optio', '113', 'ba38ad987e04451c3fd229079d49cf200567d53876a2d8c350', '1988-10-30 17:19:11');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('25', 'Lulu', 'Spencer', 'hilpert.nigel@hotmail.com', '710717', 'M', '1971-02-06', 'corporis', '22', '23c2cef7330ba4994fd39de184e2b90cf9fad7bb0b87763282', '1981-06-02 15:56:02');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('26', 'David', 'Aufderhar', 'claudia25@ortiz.com', '691005', 'M', '1979-12-04', 'ratione', '1483841', 'acecec9821361aaf1f5ec34c0c90ae5d584f2bb3f02997cb60', '1982-12-06 04:41:47');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('27', 'Bianka', 'Hegmann', 'zulauf.estella@gmail.com', '0', 'F', '1984-01-06', 'vitae', '5220', '9c82c4339ab78971753080fc15c063f16d7154de2896a9ae94', '2017-01-05 21:51:23');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('28', 'Raina', 'Trantow', 'fmedhurst@ritchieschimmel.info', '0', 'M', '2008-04-07', 'consequatur', '79490822', 'c988409e4246e3fad9643ee7418fe1fbfbeb7f47e998f29659', '2017-10-18 06:17:28');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('29', 'Connor', 'Donnelly', 'zvandervort@gmail.com', '32', 'M', '1998-08-31', 'neque', '5663412', '4c48c6f3fc956a0fcbe57e25a72c34ab89cba8f33b3b384c63', '1979-04-14 07:30:52');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('30', 'Marcelle', 'Jaskolski', 'cpowlowski@hotmail.com', '49', 'F', '1997-05-02', 'eaque', '3359', 'e4d860f3948bf0a847149fe1c30b00903d6e16263888a8db0f', '1974-07-28 17:59:32');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('31', 'Jayne', 'Crooks', 'zschinner@ferrykutch.com', '1', 'F', '1975-10-22', 'nulla', '22665651', 'd88f4dac772251d336deb0eabf7c328a04ded9985360d71a80', '2011-02-15 23:01:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('32', 'Casandra', 'Larson', 'oparker@gmail.com', '68', 'F', '2011-01-15', 'qui', '3832992', '0e771b88f27a5f7ec5be4782e2eacacac228fe5246f897251c', '2012-06-20 14:16:36');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('33', 'Garrison', 'VonRueden', 'alberto.morissette@yahoo.com', '1359551148', 'F', '2015-10-27', 'exercitationem', '612650', 'a8307c1ad12da3206a2941563482c336970f830b222958910a', '1977-07-03 09:32:24');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('34', 'Monserrate', 'Howe', 'kziemann@konopelski.com', '132', 'F', '1998-03-20', 'magni', '18125348', '99987a2ceb402739a8588c5271b5cf94c669f24f889bedc560', '2016-01-31 22:15:17');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('35', 'Orrin', 'Frami', 'purdy.keyon@marvin.com', '1', 'F', '2014-08-10', 'molestias', '2704911', '3263f241f120ab0a48b668451fc287b68878dc697aee8298df', '1972-04-24 13:21:37');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('36', 'Samanta', 'Lowe', 'christiansen.isabell@leannon.com', '799518', 'M', '2019-10-17', 'dolore', '4', '575c9c23c59f41f3ac1a37882b32f43b5f843d592f051b5ca3', '1999-01-31 19:10:19');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('37', 'Delta', 'Wintheiser', 'kweimann@huel.com', '1', 'F', '2017-07-31', 'et', '34584', '6c6aa44e7798c861e0122933e698f67945233f9b110670763c', '1990-06-01 12:35:50');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('38', 'Shanny', 'Schowalter', 'sophia.blanda@runte.com', '284372', 'F', '1988-09-13', 'fuga', '8782150', '97af5116b08d6f07a2ea356f0979c382767be117279c273182', '1995-10-08 06:43:52');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('39', 'Lenore', 'Casper', 'margie.abernathy@heidenreich.net', '320', 'F', '1990-11-05', 'provident', '81169', 'ffc9a51ee169c41652d6961d045898637685baea8f66b46c75', '1990-03-15 01:16:12');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('40', 'Arnaldo', 'Cummings', 'feeney.annabel@grant.com', '11085', 'M', '1981-10-28', 'placeat', '904', 'b0f6c17daca30bf444888f9730d68b251cda40bb07e8de18a2', '2007-11-22 05:09:55');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('41', 'Izabella', 'Botsford', 'dmcglynn@ledner.com', '680511', 'F', '1974-04-25', 'eos', '6505298', '55926db4b47b0811364b329a3d78abac642eb5594915df5572', '2012-12-08 08:07:28');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('42', 'Esta', 'Schroeder', 'wilhelmine.hudson@harber.com', '0', 'M', '1983-11-03', 'ut', '99440189', '46f97f99400d2a66ad72132ef1621fc6c5c90d0607dd9b188d', '2002-07-11 01:27:12');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('43', 'Blanca', 'Bechtelar', 'orn.richard@yahoo.com', '1', 'M', '1995-05-30', 'quidem', '3798715', 'e7553af0abbb1d37953c79c0ec756f2e57310814d68e7d499d', '1977-12-30 20:20:15');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('44', 'Miller', 'Gulgowski', 'elesch@leschbahringer.com', '0', 'F', '2018-08-20', 'animi', '4295', '93f87ef9d58e929dbcb2260ac049322b87f5980ca91bcd8f52', '2005-02-25 08:26:00');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('45', 'Khalid', 'Lemke', 'zcrona@morar.org', '0', 'F', '1984-04-04', 'molestiae', '33', 'd70683efb71231bb652ae16468c97c7a7cf87c3fc1078507cc', '1994-05-28 13:36:09');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('46', 'Harvey', 'Torp', 'ewalsh@hintz.com', '633354', 'F', '1996-07-08', 'dolorem', '73980440', '711ef9f34609d4591f1422c4b100db033b2015016bd7d2037e', '2014-03-09 04:58:12');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('47', 'Abe', 'Skiles', 'pacocha.faye@yahoo.com', '9081302912', 'M', '1985-10-27', 'dolores', '5', 'c1b09ceef4e927e3ba0710afff885b52da168eb94c48148eda', '1975-11-21 09:43:28');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('48', 'Nelle', 'Brakus', 'dibbert.casey@yahoo.com', '1', 'M', '1999-02-17', 'est', '719437777', '5a0ece99b3bcdf29eb086b2e269039419d2056cc1c31c4dfa4', '2014-09-27 20:27:25');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('49', 'Maia', 'Stiedemann', 'bogan.katharina@yahoo.com', '146', 'M', '2005-09-18', 'reiciendis', '842760', '80c70a62205659297a2832a249085ea742ab9509997fa66a42', '1979-11-12 09:05:11');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('50', 'Gina', 'Barton', 'evert43@hotmail.com', '0', 'M', '2017-05-06', 'fugit', '7', '436636b3d853f77e145baeed124c27378e23b9c7cc94a9fa12', '1990-06-27 07:07:02');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('51', 'Audreanne', 'Hilll', 'macejkovic.maverick@mcclure.com', '0', 'F', '1989-05-11', 'provident', '387463', '7835496a9ec543701211f40c60b5e89331fc53c389cc0a63b5', '1993-07-25 01:14:23');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('52', 'Myriam', 'Quitzon', 'msmitham@yahoo.com', '286120', 'M', '2018-08-28', 'nemo', '9668', 'af6dcd0cc9707f72fd952eaa5ac4b173842291bc71755805fe', '1970-05-11 15:56:31');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('53', 'Mekhi', 'Muller', 'simonis.llewellyn@price.com', '0', 'F', '2012-01-27', 'dolor', '169525454', 'dad03c31e596574d6fabbc0af95fca7babad8ceb11d90ec5e7', '1995-05-09 11:42:42');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('54', 'Alycia', 'Okuneva', 'leannon.leila@tremblay.net', '595', 'M', '1975-11-25', 'velit', '12044416', '3829477a48a6170391d808fbf3a201a2d1513c303b43f1dc45', '1980-05-28 23:03:47');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('55', 'Angelita', 'Wuckert', 'jada.hackett@gmail.com', '0', 'M', '2014-11-01', 'voluptate', '381978', 'b61c44ca1bf45c01fb70bbadb398474b119d93f43547f6a15e', '1973-08-26 03:00:59');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('56', 'Hallie', 'McGlynn', 'kyost@yahoo.com', '21530', 'F', '2002-12-24', 'culpa', '4725346', '36aa7e3d02c265f464551823b7abea22c505f2a29d36a8aa57', '1976-02-22 15:43:16');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('57', 'Franco', 'Funk', 'erika95@ryan.com', '1', 'M', '1989-05-26', 'exercitationem', '41909433', '0545f9c56b01d5ffd21abdcdf6b60e9bd84389e9ebf0268a40', '2012-08-04 13:35:55');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('58', 'Grayce', 'Waelchi', 'russel.gerlach@yahoo.com', '1', 'M', '1973-03-24', 'qui', '63113', '87ade3b49fcfc6bf930b571bdd2a5939cd736decc90c951fd0', '1995-04-05 11:24:36');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('59', 'Amanda', 'Streich', 'montana.gleichner@hotmail.com', '928654', 'M', '1992-10-16', 'accusamus', '933184', 'd16ccb613079aa4de08868baf1dcc71e4066e3b515abe20f6b', '2008-05-21 01:02:37');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('60', 'Ariane', 'Sanford', 'boyle.kevon@hilpert.com', '51', 'F', '2010-02-17', 'exercitationem', '3163893', 'a5ba717b62b8b2678d33bcb5f9589c3122d56b6dd5db18c9f1', '2007-04-18 00:39:51');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('61', 'Tommie', 'Watsica', 'baumbach.silas@gmail.com', '7366298218', 'F', '1980-05-27', 'enim', '327680988', '450668faf543fe1d573505d5af7e93747f560852b627a72af0', '2004-08-02 19:29:28');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('62', 'Mike', 'Murray', 'lmayer@schmeler.com', '0', 'F', '1995-04-15', 'error', '37512928', 'b825108b778b7e7796772cf382e608475f0985d087d97d7dbc', '1992-01-27 17:19:38');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('63', 'Faye', 'Rippin', 'lance29@boscoharris.org', '592615', 'M', '1999-03-01', 'eligendi', '55346630', 'bfb7a2e87ebd0b26955af19909873bfacabfc054ae3d5fb857', '2007-07-24 18:58:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('64', 'Rita', 'Glover', 'hdietrich@gmail.com', '789', 'F', '1997-01-29', 'quo', '188', 'f28711ed8ea48e535bf94d1246a8d041aa3bf6c99896739662', '2018-09-12 09:04:15');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('65', 'Maymie', 'Durgan', 'cummerata.bryce@gmail.com', '135', 'F', '2017-04-12', 'mollitia', '204177', '9d217c92dc41aaf79047ccc233217b4b00ca81275fe27c41f1', '2019-10-24 12:27:06');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('66', 'Madelynn', 'Homenick', 'margarett.hagenes@hotmail.com', '832', 'M', '2002-08-09', 'iste', '2225955', '3f807f274aa08fe2dbbb12a3ccf1e2357c89b3d432e2241e23', '1987-10-06 14:29:52');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('67', 'Maeve', 'Hoppe', 'jayson.goodwin@gmail.com', '1', 'M', '1993-05-10', 'commodi', '1', 'd8d72b95e93a9db1757e7deb98e4fab49840880a80e0a07548', '2014-03-16 03:20:48');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('68', 'Berniece', 'Bins', 'tzulauf@franeckimarquardt.com', '1', 'F', '2012-07-15', 'rerum', '34', '720f33db5a80f6510e90135a47130226be9b8b54a399a4d6dc', '1988-10-19 18:40:10');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('69', 'Asia', 'Lesch', 'johnston.gail@gmail.com', '1', 'F', '2011-08-15', 'eum', '26744993', '06b58ac7c7c229d3d73c01f48c3398ee03f26b2f799e680f65', '1996-02-11 14:33:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('70', 'Emmett', 'Metz', 'marlen.collier@ryan.com', '0', 'M', '2019-08-09', 'aut', '3', '854d5d1e60706bfce28725f64dc45f9b0a8e6a44cadd854934', '2000-03-29 13:50:19');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('71', 'Telly', 'Cronin', 'shanahan.matilda@beierwhite.com', '80', 'M', '2000-02-25', 'mollitia', '110547', '7615b394796085564215d1e2939ec222da8a42dbab02f45cc3', '1983-02-09 17:40:31');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('72', 'Darwin', 'Prohaska', 'gracie.torphy@mills.net', '0', 'M', '1983-06-17', 'aut', '9784', '00631192f939baebc953a4cb609bb9fc64203a6a28519d3bee', '2007-10-16 06:47:18');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('73', 'Gaston', 'Gleason', 'morar.herminia@stehr.info', '962', 'F', '2020-04-29', 'dicta', '8723478', '9458450c54aa1e44b03637dcfeea604acb8eccc9959c9c2a22', '2002-05-20 06:48:21');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('74', 'Joannie', 'Green', 'cremin.sage@breitenberg.com', '5918025078', 'F', '1991-12-30', 'perferendis', '685', '43c4cbc4009365d66cd4ca2d356b6594a5f10eb91443f106c8', '1995-02-15 02:49:52');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('75', 'Chance', 'Raynor', 'katheryn.gottlieb@yahoo.com', '801', 'M', '1995-04-01', 'ipsa', '30427', '334b95462dc1f025c3c621a9dd5c34127acca10f0cec98e4a3', '1977-04-10 02:11:17');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('76', 'Newton', 'Morar', 'meta.becker@purdy.biz', '5', 'M', '1987-07-22', 'similique', '174020142', '5c2b25045220912e55eff52e6f7ccff0faa96d822ed0293233', '1996-03-23 15:39:41');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('77', 'Frances', 'Jones', 'renner.retta@manngulgowski.net', '845923', 'M', '2011-11-30', 'iste', '37', '6d8c364a0fe64ae20be796ddf78ca967c43e455f093c84ba39', '1973-06-09 03:23:45');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('78', 'Cassie', 'Jones', 'jjones@fisher.com', '645711', 'M', '2012-06-22', 'numquam', '85035888', '92c3b843d41d20ce34e9f01d9fb6e2e9e33c1a6e0358c2b12c', '1985-07-30 17:24:16');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('79', 'Peter', 'Bogan', 'bernhard75@deckow.com', '73', 'M', '2003-09-28', 'nam', '4647559', 'a2b05a79989e20a81c8cf9bdafc7ef53d22c2167530f98d0e5', '2017-09-09 05:12:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('80', 'Hilario', 'Gerlach', 'darien.mclaughlin@hotmail.com', '1', 'F', '1992-02-04', 'fugiat', '991154', '1f641ebffdea27acfa7c06c6ca740dae7f6f8f4c9ab491e979', '1994-06-05 06:46:20');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('81', 'Alexandria', 'Swift', 'bernardo98@yahoo.com', '837', 'F', '2012-12-02', 'est', '561', 'a8973e6c0d2056209df57e8732de0b41ecd389657f51b22c3d', '1987-04-30 23:00:29');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('82', 'Mariela', 'Koch', 'glenda38@trantoweffertz.com', '1', 'M', '1990-01-06', 'molestiae', '98660', '9690fcf202153d22edf7b739b4045f2820273b03df2f732e84', '2019-08-22 04:05:46');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('83', 'Bernadine', 'Russel', 'ycorwin@millerzieme.com', '44', 'M', '2019-09-04', 'accusamus', '6', '12fe2e1d5d2912c08fdfe28a4a6729db2a185da01d302ec4a4', '1984-10-07 02:01:03');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('84', 'Irwin', 'Doyle', 'alysa88@yahoo.com', '0', 'M', '1985-04-28', 'similique', '775237', '1792b22e62d637d67e53c15e62eb250e293da901380f6c64df', '2007-10-02 02:11:35');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('85', 'Adeline', 'Langosh', 'schiller.germaine@gmail.com', '1', 'F', '1994-04-04', 'laborum', '216241239', '2fceaea1fa47a0b1b9fb80b01c92d8d19c811e7d9deb05531f', '1988-10-28 16:02:13');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('86', 'Cruz', 'Wiegand', 'jnienow@hansen.info', '391', 'M', '2015-09-29', 'iure', '1806', 'bbf3a68a0fd3a1097234606156b00a678dac4304eeba040b84', '1993-12-29 08:22:25');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('87', 'Tomas', 'Cormier', 'maximilian59@oberbrunner.info', '1', 'F', '1974-08-17', 'temporibus', '110335625', 'e19d3d4344716c2ff6c9c8b7810bea0ec90be2674d9a004243', '1971-02-22 21:38:35');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('88', 'Gabrielle', 'Nolan', 'heaney.americo@yahoo.com', '408', 'F', '2004-10-17', 'excepturi', '4635311', 'd2732ce16ad132e8fab3a83c904300cf2e2a8fb9a6fc15d3a0', '1990-05-12 04:33:59');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('89', 'Caleigh', 'Sanford', 'd\'angelo85@yahoo.com', '1', 'M', '1989-08-26', 'deserunt', '64918', '2ae5f36ce7e73135a15cd515a2d6cfab9ff9009061649096d4', '2000-12-31 05:56:50');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('90', 'Kim', 'Bode', 'jarvis.bailey@hotmail.com', '821', 'F', '2016-02-29', 'quas', '31062', 'f512fa929f786a268b581c9fe5a33c3f3c043e60e773182abc', '1976-08-27 17:48:36');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('91', 'Einar', 'Hudson', 'welch.roselyn@tillman.com', '1', 'M', '1980-06-05', 'asperiores', '54285', 'f58d9a327abc2c6dcb9c787c4f77a83b05143e00a472283077', '1987-03-01 12:45:42');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('92', 'Juliana', 'Vandervort', 'dhowe@hermann.com', '0', 'F', '2014-12-03', 'aliquid', '129910905', '2483499bb6f0c1def4933f52b73f006181f8bff7841d95b863', '1980-05-13 04:48:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('93', 'Kory', 'Gottlieb', 'justice.boehm@leuschke.com', '0', 'M', '2016-02-05', 'fugit', '5080059', '1cb98270fa5fcb2ec26ffb17b075ae1a27323b34888acc632c', '2008-03-18 08:27:56');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('94', 'Kenya', 'Mante', 'donna.yost@franecki.com', '195039750', 'M', '2014-06-17', 'soluta', '153', '317d62cf58220ab00878eeed16af9217ee2bde221394d96a0b', '1970-06-21 23:55:43');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('95', 'Emilia', 'Senger', 'hhoppe@dach.org', '0', 'M', '2011-10-09', 'labore', '382', '19e99fa596354c8f3734cba3e20768535e2ba56abb58fce6ac', '2016-10-10 16:27:53');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('96', 'Ezra', 'Klocko', 'davonte.wisoky@hagenes.com', '207629', 'F', '2012-10-01', 'recusandae', '442070295', '06deefba83575f32cc0edac6b73fbf1d951692d3cccdfe0608', '1988-03-26 12:54:56');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('97', 'Danial', 'Boyer', 'rau.lyda@reichert.com', '491', 'F', '1991-09-21', 'et', '64', '9c2c3a3cbf50250ceda8305d6bf24b30f829dd8b9dc2f3eba1', '1974-11-27 11:14:01');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('98', 'Marshall', 'Doyle', 'lon67@hotmail.com', '485893', 'M', '1996-12-29', 'voluptatem', '157799', '926780779f9a79e851fc71c64c7e24835d630e2af8abd06e28', '1979-10-13 19:58:54');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('99', 'Agnes', 'Jacobson', 'ctrantow@goodwinmohr.com', '0', 'F', '1998-12-14', 'ducimus', '2', '29aca874601b738bc4ad05a58a52778a46ab10726b0be9633e', '2020-09-05 12:49:52');
INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `gender`, `birthday`, `hometown`, `photo_id`, `pass`, `created_at`) VALUES ('100', 'Kaylee', 'Veum', 'ohodkiewicz@reingerschowalter.com', '431310', 'M', '1994-08-24', 'voluptatem', '21945', 'fb600936dd60b664ce0174ee7640429e30eaa71b2c6df8d673', '2018-11-22 20:27:40');
*/

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
/*
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('1', '47', '79', 'Molestias sint fugiat vel repellat. Laboriosam possimus debitis blanditiis corrupti inventore error. Inventore iure natus magnam necessitatibus.', 0, '2010-09-21 06:59:17');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('2', '5', '96', 'Perspiciatis occaecati animi earum accusamus eos quo. Beatae illum sed et mollitia et ea voluptatem. Placeat eos neque ipsa illo voluptate alias sed.', 1, '2004-09-29 08:39:58');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('3', '69', '8', 'Dolore odio dolor repellat quaerat neque. Ut a voluptatem quaerat mollitia architecto. Aut ipsa soluta esse veniam libero ut. Totam reprehenderit distinctio deserunt placeat deserunt dolores.', 1, '1995-08-15 10:17:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('4', '68', '16', 'Inventore et vero nulla molestias quisquam sapiente. Aut corporis voluptas reprehenderit dolorem aut. Qui molestiae quo cupiditate optio est distinctio sit.', 0, '1999-07-15 16:50:44');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('5', '13', '71', 'Sit delectus adipisci corporis officiis. Voluptatem sequi necessitatibus quibusdam asperiores perferendis. Totam repudiandae ea enim. Dolorum ut omnis ut ducimus.', 1, '1985-02-11 17:03:21');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('6', '46', '27', 'Qui dignissimos ut et voluptatem molestias modi. Ipsum eum minima quis placeat officiis illum beatae qui. Voluptatem animi eos omnis ipsa reiciendis. Nobis laboriosam autem laboriosam.', 0, '1997-03-17 15:56:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('7', '11', '81', 'Facilis et qui rerum est quae. Odio facilis quos laboriosam aut voluptate sit. Doloremque unde aliquam nemo doloremque quibusdam voluptas.', 1, '2000-02-09 00:49:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('8', '36', '63', 'Expedita enim quia error. Aut rerum repellat eligendi earum. Quam illo animi tempora recusandae impedit quia.', 0, '1991-12-19 21:57:06');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('9', '67', '66', 'Culpa quidem natus autem hic. Quaerat tempora consequatur et fuga dolorem qui. Et ad quasi porro. Non voluptatem nemo qui animi eveniet sed itaque.', 0, '1994-06-19 14:50:59');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('10', '31', '39', 'Sit quis occaecati reiciendis placeat nisi. Et omnis eos dolorem est et laudantium saepe. Nisi unde omnis aperiam rerum rerum.', 1, '1989-12-03 10:45:28');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('11', '66', '14', 'Sit aut blanditiis iusto amet quis officiis at quia. Aut aut quo in quia. Earum maiores laborum numquam ratione.\nAut molestiae minus nihil. Doloremque dolore aut id ipsa labore autem.', 1, '1972-07-03 15:39:07');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('12', '96', '67', 'Dolores voluptatum asperiores tenetur qui. Rerum quo perspiciatis harum ratione magni qui officiis. Atque unde suscipit totam voluptatem iure soluta vel. Mollitia ea dolor necessitatibus.', 0, '2011-10-02 22:55:13');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('13', '2', '10', 'Minima officia dolor rerum neque exercitationem. Quibusdam molestiae commodi ullam iste tempora tenetur nulla. Unde sint similique et esse. Quis illum est repudiandae ducimus.', 1, '1995-03-20 14:56:32');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('14', '4', '67', 'Omnis at blanditiis magnam at. Labore animi veniam fugit enim est vitae laboriosam. Aliquid maxime inventore perspiciatis qui.', 0, '2009-11-13 10:34:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('15', '24', '96', 'Ipsam minus quia autem blanditiis blanditiis nemo error. Modi perspiciatis perspiciatis ipsam et. Voluptatem sequi ex nihil. Nisi molestias nisi doloremque sed cum qui.', 1, '2013-07-29 02:28:42');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('16', '2', '71', 'Nemo est dolores quidem. Occaecati itaque qui amet voluptates eligendi.\nMolestiae cumque consectetur ea aliquam. Dignissimos est amet omnis in ea qui est.', 0, '1992-07-12 10:57:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('17', '75', '6', 'Quam consequuntur quos dolores natus. Illum dignissimos quod sunt reprehenderit voluptate ab. Id repellat omnis iusto animi vitae placeat.', 1, '2006-11-28 16:13:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('18', '66', '43', 'Velit sed et suscipit illum non consequatur enim. Repudiandae impedit enim blanditiis quis qui quia tempora. Veniam alias dolor perspiciatis sint. Est sequi omnis ut odit omnis dicta.', 0, '2010-09-21 02:55:05');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('19', '14', '34', 'Id explicabo impedit cupiditate animi odit et occaecati. Quam magnam aut repudiandae saepe quas quasi. Assumenda earum quisquam consequatur et occaecati. Ullam non voluptate natus omnis.', 1, '2016-08-20 20:58:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('20', '58', '27', 'Aspernatur corporis officia facere quod aut iusto. Quasi laborum sapiente accusantium. Quo officiis ea adipisci necessitatibus ut dignissimos quod.', 0, '1972-10-13 03:12:50');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('21', '4', '3', 'Ipsa saepe neque aspernatur consequatur dolorum quae. Id voluptatem consectetur quae provident possimus qui. Ratione possimus labore reprehenderit. Sint voluptate qui eveniet in.', 0, '1998-06-25 15:22:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('22', '54', '14', 'Necessitatibus sed consequatur odio blanditiis temporibus aut dolores. Incidunt ut vitae occaecati. Vel illum quis architecto tempora.', 1, '1998-02-14 09:06:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('23', '83', '89', 'Eum sapiente rerum deserunt quod quia laborum laudantium. Iusto voluptas dolorem omnis voluptas quibusdam omnis quasi.', 1, '2008-06-14 22:21:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('24', '77', '49', 'Et voluptatum nihil qui perspiciatis omnis qui vel ea. Quisquam est et eligendi et quia sed. Fugit corporis rerum sint ratione placeat.', 0, '1972-05-16 05:35:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('25', '55', '7', 'Eligendi eos itaque magnam placeat voluptas. Doloribus repellendus ut cum soluta. Doloribus enim ut aut beatae officiis.', 1, '2006-10-14 14:59:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('26', '88', '20', 'Sed id provident voluptas rem tempora animi maxime. Provident qui et officia suscipit. Mollitia quisquam voluptas asperiores alias.', 1, '2011-01-01 16:18:52');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('27', '21', '84', 'Incidunt et dignissimos et consequatur atque suscipit. Dicta ut nesciunt aut sit nesciunt. Nam aliquid aut cum qui dolorem.', 0, '2005-04-03 16:04:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('28', '87', '22', 'Inventore totam qui repudiandae molestiae qui impedit et. Id eos voluptas qui sed. Aspernatur nulla dolorum eligendi blanditiis. Porro est facilis aut qui velit laudantium.', 1, '1981-07-03 14:08:03');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('29', '93', '91', 'Molestiae ut enim assumenda aspernatur eos quibusdam qui. Quis vel itaque numquam. Non cumque expedita eos odio est quas occaecati. Qui aut nam enim aut nisi explicabo.', 0, '1976-04-10 15:48:53');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('30', '88', '17', 'Esse quas repellat sed non unde quia. Autem suscipit dolores in ut. Suscipit ut dolorem dolorem dolore debitis eum.', 1, '2006-03-28 21:09:43');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('31', '86', '89', 'Et sed illo repellat sint et. Repudiandae et soluta ab facere. Nisi qui qui est deserunt autem omnis ut.', 1, '1973-11-03 01:09:29');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('32', '87', '60', 'Eius cupiditate magnam totam sint possimus. Officiis enim deserunt sequi et veniam. Ut aut id aut autem soluta nostrum hic.', 0, '2010-02-20 17:35:15');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('33', '95', '52', 'Voluptatem voluptatem vel repellendus ex quas in. Officia accusamus amet totam deserunt minus aperiam incidunt. Veritatis soluta nobis culpa ex vitae possimus ut.', 0, '1973-12-15 13:11:00');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('34', '3', '9', 'Doloremque et fugiat tenetur quam quis. Quae veritatis saepe aut sed maxime repellendus. Consequatur possimus quia laborum sed.', 1, '2001-06-23 10:27:20');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('35', '85', '60', 'Et esse dolorem vero earum dolorem quo assumenda laborum. Aspernatur quae nam harum dolorem commodi molestias. Est nisi est doloremque possimus. Ut voluptatem quibusdam iste aperiam odio perferendis.', 0, '1978-04-12 18:28:01');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('36', '35', '89', 'Debitis repudiandae aut aut non laudantium. Fuga animi sint itaque non temporibus. Blanditiis sequi voluptas temporibus eos. Eum non repellat delectus quos nemo. Esse cupiditate et quaerat.', 0, '2003-09-27 12:47:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('37', '63', '88', 'Veniam tempora quisquam molestiae consequatur. Modi laudantium inventore quo consequatur. Harum ullam quod cum cum rerum natus.', 1, '2017-12-18 19:45:08');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('38', '3', '45', 'Consectetur enim blanditiis nobis. Similique libero sequi amet repellendus voluptatem harum. Debitis velit et autem minus ipsum.', 0, '1974-08-04 00:24:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('39', '77', '79', 'Atque ad illo autem id atque et. Qui placeat est sit ut. Laboriosam iusto similique sint natus.\nUt laborum in sunt quidem amet. Atque mollitia praesentium doloremque id vel.', 0, '1996-09-28 15:10:46');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('40', '94', '31', 'Ad iste et optio nihil. Quos nihil repellendus laborum quo animi ut nam. Possimus praesentium dolorum saepe odio repellendus. Voluptates aut illo corporis.', 0, '1973-03-01 12:53:35');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('41', '85', '82', 'Soluta et animi asperiores ut repudiandae. Sapiente at id dicta quo qui omnis nihil. Vitae quia quos aut est enim. Commodi tempora vel architecto corporis.', 1, '1978-12-28 20:44:27');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('42', '51', '5', 'Corporis necessitatibus enim iure aut quaerat. Ea minima aspernatur culpa illum. Ullam iste nesciunt repellat fuga id. Placeat ut blanditiis perspiciatis inventore ea autem.', 0, '1996-05-03 04:53:09');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('43', '65', '37', 'Et ipsam ab tenetur voluptas cumque sed natus. Eaque quam magnam cum iste aperiam est ducimus. Sed cumque qui occaecati. Culpa architecto aut molestiae aut non. Minima fugit facere eum.', 0, '1984-05-30 23:02:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('44', '27', '58', 'Id enim magnam quisquam modi. Quia nulla quo distinctio eius aperiam dolorem et. Est esse aliquam dolores hic veritatis eum soluta.', 0, '1980-04-12 08:51:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('45', '28', '15', 'Nobis eius tempore odit eius perferendis est. Eos hic ex rerum omnis nobis animi libero aperiam.', 1, '2015-10-30 06:11:25');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('46', '74', '13', 'Nobis cumque ab consequatur totam repellendus animi. Sit ut sunt exercitationem numquam quidem veniam ex. Sit ullam blanditiis tenetur earum placeat et facilis.', 1, '1992-05-21 18:04:14');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('47', '3', '61', 'Autem voluptatem laborum doloremque labore repudiandae labore esse. Natus explicabo vel dolor. Quia soluta saepe odio laboriosam molestias eos ipsam.', 0, '1995-02-08 20:04:02');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('48', '73', '98', 'Hic dolor neque adipisci nobis. Delectus itaque alias illum omnis. Eum perspiciatis mollitia officia asperiores commodi quas. Commodi harum est facere maiores blanditiis.', 1, '1996-01-28 05:18:48');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('49', '12', '76', 'Quia sapiente harum autem fuga vel aut dolores. Quo rerum est officia nemo vitae. Aut soluta quidem laudantium sit autem enim sapiente.', 1, '1994-09-21 12:07:18');
INSERT INTO `messages` (`id`, `from_user_id`, `to_user_id`, `body`, `is_read`, `created_at`) VALUES ('50', '6', '97', 'Beatae cupiditate hic voluptas velit illo sed. Perspiciatis laboriosam id facilis rerum dicta. Nisi consequatur enim consequatur officia autem architecto est. Ex sunt similique et et et qui.', 1, '2015-06-18 09:11:22');
*/

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
/*
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('5', '32', 'requested', '1998-09-22 15:38:25', '1982-10-01 08:28:47');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('6', '32', 'unfriended', '2006-10-29 08:24:41', '1981-01-24 19:24:59');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('7', '3', 'unfriended', '1990-02-22 16:28:07', '1997-10-24 03:25:39');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('7', '65', 'declined', '1972-03-07 13:52:19', '1983-11-17 04:21:59');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('8', '34', 'declined', '1975-09-28 23:32:45', '1983-08-03 17:46:17');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('13', '6', 'requested', '2020-05-21 10:54:16', '1982-05-03 18:32:19');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('13', '13', 'unfriended', '2004-08-01 18:32:32', '2013-07-29 08:59:05');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('13', '72', 'declined', '2013-05-17 03:01:17', '2009-04-20 19:32:50');
INSERT INTO `friend_requests` (`initiator_user_id`, `target_user_id`, `status`, `requested_at`, `confirmed_at`) VALUES ('18', '24', 'approved', '1997-10-25 03:14:21', '1973-07-16 00:56:23');
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
/*
INSERT INTO `communities` (`id`, `name`) VALUES ('6', 'ab');
INSERT INTO `communities` (`id`, `name`) VALUES ('15', 'ab');
INSERT INTO `communities` (`id`, `name`) VALUES ('2', 'animi');
INSERT INTO `communities` (`id`, `name`) VALUES ('20', 'aut');
INSERT INTO `communities` (`id`, `name`) VALUES ('1', 'beatae');
INSERT INTO `communities` (`id`, `name`) VALUES ('26', 'consectetur');
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
