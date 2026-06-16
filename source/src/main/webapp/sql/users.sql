create database `classcare_db`;

use `classcare_db`;

CREATE TABLE `classcare_db`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `state` INT NOT NULL DEFAULT 1,
  `name` VARCHAR(20) NOT NULL,
  `birthday` DATE NOT NULL,
  `age` INT NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  `tel` VARCHAR(20) NOT NULL,
  `mail` VARCHAR(50) NOT NULL,
  `parents_mail` VARCHAR(50) NOT NULL,
  `post_code` VARCHAR(20) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `preparation` VARCHAR(200) NULL,
  `image_url` VARCHAR(50) NULL,
  PRIMARY KEY (`user_id`)
);
