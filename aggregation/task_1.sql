select avg((year (now()) - year(birthday_at))) from users u;

-- select avg(TIMESTAMPDIFF(year, birthday_at, current_date())) from users;