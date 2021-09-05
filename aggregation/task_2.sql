select count(*), 
dayname(concat(year (now()), substring(birthday_at, 5, 10))) as day_name
from users u 
group by day_name; 
