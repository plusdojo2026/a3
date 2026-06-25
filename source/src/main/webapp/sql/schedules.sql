CREATE TABLE `schedules`(
  `schedule_id` INT PRIMARY KEY AUTO_INCREMENT,
  `date` DATE,
  `subject` VARCHAR(10),
  `start_time` TIME,
  `finish_time` TIME,
  `type` VARCHAR(10),
  `memo` VARCHAR(50),
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);


insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-01', '数学', '09:00:00', '09:45:00', '', '','1');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-02', '英語', '13:00:00', '013:45:00', '', '','1');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-03', '国語', '11:50:00', '012:35:00', '', '','1');
insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-01', '数学', '09:00:00', '09:45:00', '', '','2');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-02', '英語', '13:00:00', '013:45:00', '', '','2');

insert into schedules ( date, subject, start_time, finish_time, type, memo, user_id)
values ( '2026-04-03', '国語', '11:50:00', '012:35:00', '', '','2');