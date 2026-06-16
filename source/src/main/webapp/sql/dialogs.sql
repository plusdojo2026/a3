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