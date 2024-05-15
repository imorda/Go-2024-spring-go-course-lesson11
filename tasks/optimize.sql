-- Выведите максимальную температуру по дням для датчика c sensor_id=12 отсортированного по убыванию температуры

-- Оценка сложности запроса до добавления индекса
explain select date(timestamp) as Date, max(payload) as Temperature from go_course_db.events
where sensor_id = 12
group by Date
order by Temperature desc;

-- Добавление индекса
create index if not exists sens_id_events on go_course_db.events(sensor_id);

-- Оценка сложности запроса после добавления индекса
explain select date(timestamp) as Date, max(payload) as Temperature from go_course_db.events
where sensor_id = 12
group by Date
order by Temperature desc;

-- Температура по дням для датчика с sensor_id=12, отсортированная по убыванию температуры
select date(timestamp) as Date, max(payload) as Temperature from go_course_db.events
where sensor_id = 12
group by Date
order by Temperature desc;
