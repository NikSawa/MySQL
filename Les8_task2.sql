select count(*) 
from likes l
	join profiles p on l.user_id = p.user_id 
where (year(now())-year(p.birthday)) < 10
;