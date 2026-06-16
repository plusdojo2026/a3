CREATE database 'classcare_db';

USE 'classcare_db';

CREATE TABLE 'chat' (
    'chat_id' INT AUTO_INCREMENT PRIMARY KEY,--チャットID

    'user_id_speaker' INT NOT NULL,--送信者
    'user_id_listener' INT NOT NULL,--受信者

    'talk' TEXT, --チャット内容
    'chat_image' VARCHAR(200), --画像パス
    `check` INT DEFAULT 0, --（0=未読,1=既読）

    'created_at' DATETIME DEFAULT CURRENT_TIMESTAMP, --送信日時

    'user_id' INT NOT NULL,--ID
);
