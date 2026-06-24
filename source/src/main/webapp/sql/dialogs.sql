
USE `a3`;


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

INSERT INTO `dialogs` (`date`, `contain`, `user_id`) VALUES
('2026-06-15', '面談を実施しました。', 1),
('2026-06-16', '宿題の提出状況について話し合いました。', 2),
('2026-06-17', '次の小テストの相談を受けました。', 3),
('2026-06-17', '人間関係についての相談を受けました。', 4),
('2026-06-17', '窓ガラスを割った件について指導しました。', 5);