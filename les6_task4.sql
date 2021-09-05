
select if (
  (select count(*) from likes where user_id in (select user_id 
from profiles p 
where gender = 'f')) > 
  (select count(*) from likes where user_id in (select user_id 
from profiles p 
where gender = 'm')) 
, 'female'
, 'male'
) as who_biggest
 ;
 