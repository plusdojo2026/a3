CREATE database classcare_db;

-- classcare_dbを使用
USE classcare_db;

-- testsテーブル
CREATE TABLE `classcare_db`.`tests` (
  `test_id` INT NOT NULL AUTO_INCREMENT,
  `scores_id` INT NULL,
  `test_date` DATE NULL,
  `subject_id` INT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`test_id`),
  CONSTRAINT `fk_tests_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `classcare_db`.`users` (`user_id`),
  CONSTRAINT `fk_tests_score`
    FOREIGN KEY (`scores_id`)
    REFERENCES `classcare_db`.`scores` (`scores_id`),
  CONSTRAINT `fk_tests_subject`
    FOREIGN KEY (`subject_id`)
    REFERENCES `classcare_db`.`subjects` (`subject_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


