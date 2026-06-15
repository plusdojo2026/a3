CREATE TABLE chat (
    chat_id INT AUTO_INCREMENT PRIMARY KEY,

    user_id_speaker INT NOT NULL,
    user_id_listener INT NOT NULL,

    talk TEXT, 
    chat_image VARCHAR(200), 
    `check` INT DEFAULT 0, --（0=未読,1=既読）

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 

    user_id INT NOT NULL,

    CONSTRAINT fk_chat_speaker
        FOREIGN KEY (user_id_speaker) REFERENCES users(user_id),

    CONSTRAINT fk_chat_listener
        FOREIGN KEY (user_id_listener) REFERENCES users(user_id),

    CONSTRAINT fk_chat_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);
