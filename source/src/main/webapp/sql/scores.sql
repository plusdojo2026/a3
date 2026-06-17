-- ======================================
-- scoresテーブル構造
-- scores
-- ├─ scores_id        : クラスID(主キー)
-- └─ score              : 点数
-- ======================================
CREATE TABLE `classcare_db`.`scores` (
  `scores_id` INT NOT NULL AUTO_INCREMENT,
  `score` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`scores_id`)
);

INSERT INTO `scores`(`score`) VALUES (100);
INSERT INTO `scores`(`score`) VALUES (100);
INSERT INTO `scores`(`score`) VALUES (99);