select c.name, p.name 
from products p
	 join catalogs c on p.catalog_id = c.id 
;