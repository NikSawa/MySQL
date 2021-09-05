(select from_user_id as user_id
from messages m
group by user_id 
order by user_id desc
limit 10)
union
(select user_id 
from likes 
group by user_id 
order by user_id desc
limit 10)
;