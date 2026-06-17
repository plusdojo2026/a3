CREATE TABLE `subjects` (
  `subject_id` INT AUTO_INCREMENT PRIMARY KEY,
  -- データ番号
  `subject_name` VARCHAR(20) NOT NULL
);


INSERT INTO subjects (subject_name) VALUES ('国語'), ('数学'), ('英語'), ('理科'), ('社会');
