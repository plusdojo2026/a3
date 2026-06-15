
sampleデータベースを作って、その中にchatテーブルを作成しています。
create文は以下のようなものになっています。
CREATE TABLE chat (
    chat_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id_speaker VARCHAR(255) NOT NULL,
    user_id_listener VARCHAR(255) NOT NULL,
    talk VARCHAR(500),
    image VARCHAR(100),
    `check` INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);