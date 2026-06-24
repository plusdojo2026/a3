-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `trouble` (
  `trouble_id` INT PRIMARY KEY AUTO_INCREMENT,
  `tr_date` DATE, 
  `title` VARCHAR(600) NOT NULL,
  `contents` VARCHAR(600) NOT NULL,
  `members` VARCHAR(100) NOT NULL,
  `user_id` INT,
  `situation` VARCHAR(100) NOT NULL DEFAULT '対応中',
  FOREIGN KEY(`user_id`) REFERENCES `users`(`user_id`)
);
INSERT INTO trouble 
(tr_date, title, contents, members, user_id, situation)
VALUES 
('2026-06-22', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-23', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-24', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中'),
('2026-06-25', '休み時間の口論', '休み時間に同じ班の生徒との口論があり、授業後に担任が聞き取りを行った。', '山田太郎', 1, '対応中');