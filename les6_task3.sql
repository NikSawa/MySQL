select user_id from profiles p order by (year(now()) - year(birthday)) limit 10;

select count(*)
from (
select user_id 
from profiles p 
order by (year(now()) - year(birthday))) as myalias
;