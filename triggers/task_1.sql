
drop function if exists hello;
delimiter //
create function hello()
returns varchar(255) deterministic
begin
	case
		when hour(now()) between '0' and '6' then 
			return '''доброй ночи';
		when hour(now()) between '6' and '12' then 
			return'доброе утро';
		when hour(now()) between '12' and '18' then 
			return 'добрый день';
		else
			return 'добрый вечер';
	end case;
end //


delimiter ;
select hello();
