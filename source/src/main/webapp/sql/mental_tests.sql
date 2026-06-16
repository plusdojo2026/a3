CREATE DATABASE classcare_db;

-- classcare_dbを使用
USE classcare_db;

-- メンタルテストテーブル
CREATE TABLE mental_tests(
    `mt_id` INT NOT NULL AUTO_INCREMENT,
    `mt_img_url` VARCHAR(100) NOT NULL,
    `question` VARCHAR(200) NOT NULL,

    -- メンタルテスト選択肢
    `choiceA` VARCHAR(200) NOT NULL,
    `choiceB` VARCHAR(200) NOT NULL,
    `choiceC` VARCHAR(200)NOT NULL,
    `choiceD` VARCHAR(200)NOT NULL,

    -- メンタルテスト説明
    `choiceA_descript` VARCHAR(200) NOT NULL,
    `choiceB_descript` VARCHAR(200) NOT NULL,
    `choiceC_descript` VARCHAR(200)NOT NULL,
    `choiceD_descript` VARCHAR(200)NOT NULL,

    --　メンタルテスト点数
    `choiceA_score` VARCHAR(200) NOT NULL,
    `choiceB_score` VARCHAR(200) NOT NULL,
    `choiceC_score` VARCHAR(200)NOT NULL,
    `choiceD_score` VARCHAR(200)NOT NULL,

    -- メンタルテスト日付
    `mt_test_date` DATE NOT NULL,
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);