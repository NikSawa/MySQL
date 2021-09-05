drop trigger if exists not_null;
delimiter //
create trigger not_null before insert  on products
for each row begin
	if (isnull(new.name) and isnull(new.description))
	then signal sqlstate '45000' set message_text = 'Denied';
	end if;
end//

delimiter ;

INSERT INTO products (name, description)
VALUES (NULL, NULL); 
