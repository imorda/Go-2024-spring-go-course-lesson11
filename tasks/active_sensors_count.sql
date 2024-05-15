-- число активныx датчиков
select count(*)
from go_course_db.sensors
where is_active = true;
