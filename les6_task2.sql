select from_user_id 
from messages m 
where from_user_id =  (
select target_user_id 
from friend_requests fr 
where initiator_user_id  = 512 
and status = 'approved'
) and to_user_id = 512
;