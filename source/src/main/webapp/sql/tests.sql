CREATE database classcare_db;

-- classcare_dbを使用
USE classcare_db;

-- testsテーブル
CREATE TABLE `classcare_db`.`tests` (
  `test_id` INT AUTO_INCREMENT,
  `scores_id` INT,
  `test_date` DATE,
  `subject_id` INT,
  `user_id` INT,
  PRIMARY KEY (`test_id`),
  CONSTRAINT `fk_tests_user` FOREIGN KEY (`user_id`) REFERENCES `classcare_db`.`users` (`user_id`),
  CONSTRAINT `fk_tests_score` FOREIGN KEY (`scores_id`) REFERENCES `classcare_db`.`scores` (`scores_id`),
  CONSTRAINT `fk_tests_subject` FOREIGN KEY (`subject_id`) REFERENCES `classcare_db`.`subjects` (`subject_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- サンプルデータ
INSERT INTO `tests` (`scores_id`, `test_date`,  `subject_id`, `user_id`)
VALUES(1, '2026-06-17', 1, 1);