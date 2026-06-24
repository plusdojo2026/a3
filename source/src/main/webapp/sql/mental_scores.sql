-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `mental_scores` (
  `mt_scores_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- 得点ID
  `score` VARCHAR(50),
  -- スコア                          
  `status` VARCHAR(50),
  -- 状態                        
  `mt_scores_memo` VARCHAR(50),
  -- メモ                  
  `mt_id` INT,
  -- 心理テストID                               
  `user_id` INT,
  -- ID     
  FOREIGN KEY (`mt_id`) REFERENCES `mental_tests`(`mt_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

INSERT INTO `mental_scores` (`score`, `status`, `mt_scores_memo`, `mt_id`, `user_id`)
VALUES
('85', 'valid', '良好', 1, 1),
('40', 'valid', '注意', 2, 1),
('100', 'valid', '非常に良い', 3, 1),
('55', 'valid', '注意', 4, 1),
('----', 'invalid', '未受験', 5, 1);
