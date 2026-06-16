CREATE database `classcare_db`;

USE `classcare_db`;

CREATE TABLE `trouble` (
  `trouble_id` INT PRIMARY KEY AUTO_INCREMENT,
  `title` VARCHAR(600) NOT NULL,
  `contents` VARCHAR(600) NOT NULL,
  `members` VARCHAR(100) NOT NULL,
  `user_id` INT,
  `situation` VARCHAR(100) NOT NULL,
  FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`)
);