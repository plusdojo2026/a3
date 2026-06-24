-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `chat` (
  `chat_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- チャットID
  `user_id_speaker` INT NOT NULL,
  -- 送信者
  `user_id_listener` INT NOT NULL,
  -- 受信者
  `talk` VARCHAR(1638),
  -- チャット内容
  `chat_image` VARCHAR(200),
  -- 画像パス
  `check` INT DEFAULT 0,
  -- （0=未読,1=既読）
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  -- 送信日時
  `user_id` INT NOT NULL,
  -- ID
  FOREIGN KEY (`user_id_speaker`) REFERENCES `users`(`user_id`),
  FOREIGN KEY (`user_id_listener`) REFERENCES `users`(`user_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);