
USE `classcare_db`;

CREATE TABLE subject (
    `id` INT AUTO_INCREMENT PRIMARY KEY, -- データ番号
    `user_id` VARCHAR(10) NOT NULL,   -- 生徒番号
    `test_year_month` VARCHAR(7) NOT NULL, -- いつのテストか
    `math_score` INT NULL,                    -- 数学の点数
    `japanese_score` INT NULL,                -- 国語の点数
    `english_score` INT NULL,                  -- 英語の点数
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
