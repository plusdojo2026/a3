-- CREATE database `a3`;

USE `a3`;

CREATE TABLE `mental_scores` (
  `mt_scores_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- 得点ID
  `score` VARCHAR(50),
  -- スコア                          
  `status` VARCHAR(50),
  -- 状態                        
  `mt_scores_memo` VARCHAR(500),
  -- メモ                  
  `mt_id` INT,
  -- 心理テストID                               
  `user_id` INT,
  -- ID     
  FOREIGN KEY (`mt_id`) REFERENCES `mental_tests`(`mt_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

INSERT INTO mental_scores
(score, status, mt_scores_memo, mt_id, user_id)
VALUES

-- NORMAL
('88', 'NORMAL',
'【分析】: 社交性・安定性ともに高い優良な傾向が見られます。

【最終スコア】: 88.00
【分散】: 3.20
【時間分散】: 900.00
【平均時間】: 1800.00
【距離】: 10.20
[正常] 安定した回答パターンです。',
1, 1),

--  OBSERVE
('65', 'OBSERVE',
'【分析】: 全体的にバランスは良いが、やや変動が見られます。

【最終スコア】: 65.00
【分散】: 6.50
【時間分散】: 1500.00
【平均時間】: 2000.00
【距離】: 18.40
[観察] 軽度な変動が見られます。',
2, 2),

--  WARNING
('48', 'WARNING',
'【分析】: 回答にばらつきがあり、注意が必要です。

【最終スコア】: 48.00
【分散】: 14.20
【時間分散】: 3200.00
【平均時間】: 2500.00
【距離】: 28.70
[注意] 回答のばらつきが大きく、注意が必要です。',
3, 1),

--  ALERT
('32', 'ALERT',
'【分析】: 精神状態に大きな不安定要素が検出されました。

【最終スコア】: 32.00
【分散】: 21.50
【時間分散】: 4500.00
【平均時間】: 3000.00
【距離】: 40.10
[警告] 異常な回答傾向が検出されました。',
4, 2);
