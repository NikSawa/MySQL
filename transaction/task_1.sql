start transaction;
insert into sample.users select * from shop.users where id = 1;
commit;