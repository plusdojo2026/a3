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
INSERT INTO trouble 
(title, contents, members, user_id, situation)
VALUES 
('休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中');