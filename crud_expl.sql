use `vk`;

drop table if exists `example`;
create table `example` (
	`id` serial,
	`firstname` VARCHAR(30),
	`lastname` VARCHAR(30),
	`birthdate` date,
	`mail` VARCHAR (50) 
);

-- create 

insert into `example` (`firstname`, `lastname`, `birthdate`, `mail`)
values 
	('Иван', 'Карпик', '2021-05-23', 'test12@mail.list'),
	('Сергей', 'Сергеев', '2021-04-02', 'test45@mail.list'),
	('Денис', 'Вюрц', '2021-11-11', 'test11@mail.list'),
	('Мария', 'Вюрц', '2021-10-14', 'test54@mail.list'),
	('Анна', 'Картошкина', '2021-02-28', 'test41@mail.list'),
	('Валерия', 'Меладзе', '2021-01-12', 'test6@mail.list'),
	('Мария', 'Карпик', '2021-08-29', 'test23@mail.list'),
	('Иван', 'Сергеев', '2021-06-24', 'test20@mail.bk')
;

insert into `example`
set	
	`firstname` = 'Андрей',
	`lastname` = 'Андреев',
	`mail` = 'mail9@mail.ru',
	`birthdate` = '2021-01-18'
;

INSERT INTO `example`
	(`firstname`, `lastname`, `mail`) 
select 
 	`firstname`, `lastname`, `email`
from vk.users
where `id` = 501
;


-- select 

select `firstname` from `example`;

select distinct firstname from `example`;

select * from `example` where id > 2 OR firstname = 'Иван';

select * from `example` where `lastname` in ('Вюрц', 'Карпик');

-- update 

update profiles set gender = 'm'
where floor(user_id % 2) = 0;

/*
update `friend_requests` 
set `target_user_id` = floor(min(target_user_id) + rand()*(max(target_user_id)-min(target_user_id)));
*/

SET FOREIGN_KEY_CHECKS = 0;

update `friend_requests` 
set `target_user_id` = floor(rand()*(842-501) + 501)
where `initiator_user_id` = `target_user_id` or not exists(select `id` from `users` where `id` = `target_user_id`);

SET FOREIGN_KEY_CHECKS = 1;

-- delete 
delete from `example` where firstname = 'Андрей';