-- топ 3 пользователей у которых больше всех активных датчиков
select user_id
from go_course_db.users
         left join go_course_db.sensors_users su on users.id = su.user_id
         left join go_course_db.sensors on su.sensor_id = sensors.id
where is_active = true
group by user_id
order by count(sensor_id) desc
limit 3;
