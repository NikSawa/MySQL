select value from storehouses_products order by 
	case
	when value > 0 then 1
	when value = 0 then 2
	end, value ;
