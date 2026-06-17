-- ======================================
-- classcare_db を作成する
-- ======================================
-- CREATE DATABASE `classcare_db`;

-- classcare_db を使用する
USE `classcare_db`;

-- ======================================
-- classesテーブル構造
-- classes
-- ├─ class_id        : クラスID(主キー)
-- ├─ user_id         : ユーザーID(外部キー,users)
-- └─ class_name              : クラス名
-- ======================================
CREATE TABLE `classcare_db`.`classes` (
  `class_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `class_name` VARCHAR(200) NOT NULL,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
  PRIMARY KEY (`class_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


INSERT INTO `classes`(`user_id`,`class_name`) VALUES(1,'一年一組');
INSERT INTO `classes`(`user_id`,`class_name`) VALUES(2,'一年二組');