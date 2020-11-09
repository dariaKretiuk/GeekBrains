use course_work;
-- правила заполнения таблицы: 
-- 1) высота, ширина, количество штук в коробке, количество кг. в коробке, количество коробок на поддоне - обязательно для заполнения
-- 2) если (количество кв.метров в коробке=null, то количество кв.метров на поддоне=null и количество кг. на поддоне=null) 
-- иначе (количество кв.метров на поддоне=количество коробок на поддоне * количество кв.метров в коробке)

delimiter //
drop trigger if exists check_packing_list//
create trigger check_packing_list before insert on packing_list
for each row
begin
	if new.height is null then
		signal sqlstate '45000' set message_text = 'ERROR: height is "null"';
	end if;
	if new.width is null then
		signal sqlstate '45000' set message_text = 'ERROR: width is "null"';
	end if;
	if new.count_pcs_box is null then
		signal sqlstate '45000' set message_text = 'ERROR: count_pcs_box is "null"';
	end if;
	if new.kg_box is null then
		signal sqlstate '45000' set message_text = 'ERROR: kg_box is "null"';
	end if;
	if new.count_box_pallet is null then
		signal sqlstate '45000' set message_text = 'ERROR: count_box_pallet is "null"';
	end if;

	if new.count_meter_box is null then
		set new.count_meter_pallet = null;
		set new.kg_pallet = null;
	else
		set new.count_meter_pallet = new.count_meter_box * new.count_box_pallet;
		set new.kg_pallet = new.kg_box * new.count_box_pallet;
	end if;
end//
delimiter ;

insert into packing_list (type_tiles, height, width, count_pcs_box, count_meter_box, kg_box, count_box_pallet)  values
	('facing', 600, 300, 7, 1.26, 20.0, 40),
	('facing', 600, 200, 10, 1.2, 18.5, 48),
	('facing', 500, 250, 13, 1.625, 25.675, 39),
	('facing', 500, 250, 8, 1.0, 15.8, 66),
	('facing', 400, 250, 15, 1.5, 20.49, 54),
	('facing', 400, 200, 15, 1.2, 16.5, 54),
	('facing', 300, 200, 20, 1.2, 14.8, 60),
	('facing', 200, 200, 25, 1.0, 12.5, 72),
	('facing', 150, 75, 54, 0.61, 10.3, 88),
	('facing', 99, 99, 45, 0.44, 5.4, 175),
	('floor', 385, 385, 6, 0.888, 15.6, 72),
	('floor', 300, 300, 11, 0.99, 16.2, 56);
insert into packing_list (type_tiles, height, width, count_pcs_box, kg_box, count_box_pallet)  values
	('mosaic', 600, 300, 7, 20.0, 40),
	('mosaic', 600, 200, 10, 18.5, 48),
	('mosaic', 500, 250, 13, 25.675, 39),
	('mosaic', 500, 250, 8, 15.8, 66),
	('mosaic', 400, 250, 15, 20.49, 54),
	('mosaic', 400, 200, 15, 16.5, 54);
insert into packing_list (type_tiles, height, width, count_pcs_box, kg_box, count_box_pallet)  values
	('decorative', 600, 300, 5, 13.95, 44),
	('decorative', 600, 200, 5, 9.3, 44),
	('decorative', 500, 250, 5, 10.6, 48),
	('decorative', 500, 250, 5, 10.0, 48),
	('decorative', 500, 250, 5, 9.3, 44),
	('decorative', 400, 200, 10, 16.2, 54),
	('decorative', 400, 200, 10, 11.2, 54);
insert into packing_list (type_tiles, height, width, count_pcs_box, kg_box, count_box_pallet)  values
	('curbs', 600, 90, 9, 7.65, 55),
	('curbs', 600, 73, 16, 10.4, 40),
	('curbs', 600, 60, 14, 8.7, 40),
	('curbs', 600, 50, 28, 14.0, 32),
	('curbs', 600, 50, 16, 8.0, 40),
	('curbs', 600, 50, 16, 8.0, 32),
	('curbs', 600, 40, 42, 16.7, 32),
	('curbs', 600, 40, 24, 9.55, 40),
	('curbs', 600, 40, 24, 9.55, 32),
	('curbs', 600, 30, 42, 16.6, 55),
	('curbs', 600, 30, 24, 9.49, 40),
	('curbs', 500, 70, 24, 13.2, 55),
	('curbs', 500, 70, 16, 8.8, 48),
	('curbs', 500, 60, 16, 6.69, 48),
	('curbs', 500, 59, 16, 6.63, 48),
	('curbs', 500, 50, 16, 6.19, 48),
	('curbs', 500, 47, 16, 5.72, 48),
	('curbs', 500, 40, 42, 12.0, 55),
	('curbs', 500, 40, 24, 6.86, 48),
	('curbs', 500, 30, 42, 10.8, 55),
	('curbs', 500, 30, 24, 6.18, 48),
	('curbs', 400, 75, 30, 15.1, 81),
	('curbs', 400, 60, 48, 15.84, 54),
	('curbs', 400, 50, 55, 15.6, 54),
	('curbs', 400, 50, 50, 15.6, 54),
	('curbs', 400, 40, 65, 12.5, 54),
	('curbs', 400, 30, 70, 12.5, 54),
	('curbs', 300, 60, 45, 13.5, 51),
	('curbs', 250, 200, 22, 14.76, 54),
	('curbs', 250, 115, 40, 16.5, 54),
	('curbs', 250, 90, 50, 16.7, 54),
	('curbs', 250, 90, 47, 15.7, 54),
	('curbs', 250, 90, 40, 13.0, 54),
	('curbs', 250, 80, 55, 15.6, 54),
	('curbs', 250, 70, 60, 17.1, 54),
	('curbs', 250, 50, 68, 12.5, 63),
	('curbs', 200, 100, 45, 13.5, 51),
	('curbs', 200, 90, 54, 13.8, 51),
	('curbs', 200, 60, 85, 13.89, 51),
	('curbs', 200, 50, 100, 12.7, 51),
	('volumetric_insert', 175, 75, 54, 10.3, 88),
	('volumetric_border', 150, 16, 150, 7.05, 88);



