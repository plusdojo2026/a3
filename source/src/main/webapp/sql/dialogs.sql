
USE `classcare_db`;

CREATE TABLE dialogs (
    id INT AUTO_INCREMENT PRIMARY KEY, -- 日記の番号
    `student_id` VARCHAR(10) NOT NULL,    -- 学籍番号など
    `content` TEXT NOT NULL,              -- 日記の本文
    `dialogs_year_month` VARCHAR(7) NOT NULL, -- いつの日記か
);



CREATE TABLE `dialogs` (
  `dialog_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- 日記の番号
  `date` DATE,
  -- 日時
  `contain` VARCHAR(200) NOT NULL,
  -- 日記の本文
  `user_id` INT,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);
