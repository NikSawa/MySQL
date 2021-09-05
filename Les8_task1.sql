select count(*) , u.firstname to_user, u2.firstname from_user 
from messages m  
	join users u on u.id = m.to_user_id 
	join users u2 on u2.id = m.from_user_id 
where u.id = 512
group by from_user
order by from_user desc
limit 1;
