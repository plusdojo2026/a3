CREATE database if not exists a3;

-- a3を使用
USE a3;

-- testsテーブル
CREATE TABLE `a3`.`tests` (
  `test_id` INT AUTO_INCREMENT,
  `scores_id` INT,
  `test_date` DATE,
  `subject_id` INT,
  `user_id` INT,
  PRIMARY KEY (`test_id`),
  CONSTRAINT `fk_tests_user` FOREIGN KEY (`user_id`) REFERENCES `a3`.`users` (`user_id`),
  CONSTRAINT `fk_tests_score` FOREIGN KEY (`scores_id`) REFERENCES `a3`.`scores` (`scores_id`),
  CONSTRAINT `fk_tests_subject` FOREIGN KEY (`subject_id`) REFERENCES `a3`.`subjects` (`subject_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

-- サンプルデータ
INSERT INTO `tests` (`scores_id`, `test_date`,  `subject_id`, `user_id`)
VALUES(1, '2026-06-17', 1, 1),(2, '2026-06-17', 2, 1),(3, '2026-06-17', 3, 1);