drop table if exists logs;
create table logs(
	created_at datetime default now(),
	table_name varchar(30),
	id_log bigint unsigned,
	name_log varchar(30)
) engine = archive;

drop trigger if exists trig_log_users;
delimiter //
create trigger trig_log_users 
after insert on users
for each row
begin
	insert into logs (created_at, table_name, id_log, name_log)
	values (now(), 'users', new.id, new.name);
end //
delimiter ;

drop trigger if exists trig_log_catalogs;
delimiter //
create trigger trig_log_catalogs 
after insert on catalogs
for each row
begin
	insert into logs (created_at, table_name, id_log, name_log)
	values (now(), 'catalogs', new.id, new.name);
end //
delimiter ;

drop trigger if exists trig_log_products;
delimiter //
create trigger trig_log_products
after insert on products
for each row
begin
	insert into logs (created_at, table_name, id_log, name_log)
	values (now(), 'products', new.id, new.name);
end //

delimiter ;
