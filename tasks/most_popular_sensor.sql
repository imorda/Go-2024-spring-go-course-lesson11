-- самый популярный тип датчика
select type
from go_course_db.sensors
group by type
order by count(type) desc
limit 1;
