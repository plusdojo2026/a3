CREATE TABLE mental_scores (
    mt_scores_id INT AUTO_INCREMENT PRIMARY KEY,   
    score VARCHAR(50),                             
    status VARCHAR(50),                            
    mt_scores_memo VARCHAR(50),                    
    mt_id INT,                                     
    user_id INT,                                   

    CONSTRAINT fk_mental_scores_mt
        FOREIGN KEY (mt_id) REFERENCES mental_test(mt_id),

    CONSTRAINT fk_mental_scores_user
        FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO mental_scores (score, status, mt_scores_memo, mt_id, user_id)
VALUES
('100', 'valid', NULL, 1, 1),
('0', 'valid', NULL, 1, 2),
('100', 'valid', NULL, 1, 1), 
('----', 'invalid', NULL, 1, 3);