-- Выведите максимальную температуру по дням для датчика c sensor_id=12 отсортированного по убыванию температуры

-- Добавление индекса
create index if not exists sens_id_events on go_course_db.events(sensor_id);


-- Температура по дням для датчика с sensor_id=12, отсортированная по убыванию температуры
select date(timestamp) as Date, max(payload) as Temperature from go_course_db.events
where sensor_id = 12
group by Date
order by Temperature desc;

-- Оценка сложности запроса
--   explain select date(timestamp) as Date, max(payload) as Temperature from go_course_db.events
--   where sensor_id = 12
--   group by Date
--   order by Temperature desc;
--
-- Sort  (cost=255.56..261.54 rows=2392 width=12)
--   Sort Key: (max(payload)) DESC
--   ->  HashAggregate  (cost=91.42..121.32 rows=2392 width=12)
-- "        Group Key: date(""timestamp"")"
--         ->  Index Scan using sens_id_events on events  (cost=0.57..79.45 rows=2394 width=12)
--               Index Cond: (sensor_id = 12)

