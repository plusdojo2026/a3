CREATE TABLE dialogs (
    id INT AUTO_INCREMENT PRIMARY KEY, -- 日記の番号
    student_id VARCHAR(10) NOT NULL,    -- 学籍番号など
    content TEXT NOT NULL,              -- 日記の本文
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 日時
);



