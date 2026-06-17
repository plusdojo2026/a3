-- CREATE DATABASE classcare_db;

-- classcare_dbを使用
USE classcare_db;

-- メンタルテストテーブル
CREATE TABLE mental_tests(
    `mt_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `mt_img_url` VARCHAR(100) NOT NULL,
    `question` VARCHAR(200) NOT NULL,

    -- メンタルテスト選択肢
    `choiceA` VARCHAR(200) NOT NULL,
    `choiceB` VARCHAR(200) NOT NULL,
    `choiceC` VARCHAR(200) NOT NULL,
    `choiceD` VARCHAR(200) NOT NULL,

    -- メンタルテスト説明
    `choiceA_descript` VARCHAR(200) NOT NULL,
    `choiceB_descript` VARCHAR(200) NOT NULL,
    `choiceC_descript` VARCHAR(200) NOT NULL,
    `choiceD_descript` VARCHAR(200) NOT NULL,

    -- メンタルテスト点数
    `choiceA_score` INT NOT NULL,
    `choiceB_score` INT NOT NULL,
    `choiceC_score` INT NOT NULL,
    `choiceD_score` INT NOT NULL,

    -- メンタルテスト日付
    `mt_test_date` DATE NOT NULL,
    `user_id` INT,
   FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);

-- サンプルデータ
	INSERT INTO `mental_tests` (`mt_img_url`, `question`, `choiceA`, `choiceB`, `choiceC`, `choiceD`, 
		`choiceA_descript`, `choiceB_descript`, `choiceC_descript`, `choiceD_descript`, 
		`choiceA_score`, `choiceB_score`, `choiceC_score`, `choiceD_score`, 
		`mt_test_date`, `user_id`)
		VALUES ('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 3),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 4),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1),('sample.url', '質問', 
			'A', 'B', 'C', 'D', 
			'Ades', 'Bdes', 'Cdes', 'Ddes', 
			100, 80, 60, 40, 
			'2026-06-17', 1);