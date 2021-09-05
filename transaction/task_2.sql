create view prod_in_catalog(id, prod_name, cata_name) as 
select prod.id, prod.name, cata.name
from products as prod
left join catalogs as cata 
	on prod.catalog_id = cata.id;