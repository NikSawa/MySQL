select id, name 
from users u 
where id in (
select user_id 
from orders o
where user_id >= 1);