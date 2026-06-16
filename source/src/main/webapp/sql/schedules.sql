CREATE TABLE `schedules`(
   `schedule_id` INT PRIMARY KEY,
   `date` DATE,
   `subject` VARCHAR(10),
   `start_time` TIME,
   `finish_time` TIME,
   `type` VARCHAR(10),
   `memo` VARCHAR(50),
   `user_id` INT
);