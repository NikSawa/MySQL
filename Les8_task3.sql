select count(l.user_id) c_like, p.gender 
from profiles p 
	join likes l on p.user_id = l.user_id
group by p.gender 
order by c_like desc
limit 1;