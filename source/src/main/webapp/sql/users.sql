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



INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');

INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(0, '樋口先生', '2013-05-15', 13, '男', '070-8888-8888', 'HIGUCHI@gmail', 'HIGUCHI@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');
INSERT INTO users
(state, name, birthday, age, gender, tel, mail, parents_mail, post_code, address, password, preparation, image_url)
VALUES
(1, '山田太郎', '2013-05-15', 13, '男', '070-8888-8888', 'tarou@gmail', 'yamada@gmail', '11-0101', '東京都xxxxxxxxx1-1-1', '123321', '', '');