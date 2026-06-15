 create table schedules(
    -> schedule_id int primary key,
    -> date date,
    -> subject varchar(10),
    -> start_time time,
    -> finish_time time,
    -> type varchar(10),
    -> memo varchar(50),
    -> user_id int);