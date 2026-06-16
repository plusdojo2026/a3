use 'classcare_db';

CREATE TABLE 'mental_scores' (
    'mt_scores_id' INT AUTO_INCREMENT PRIMARY KEY,   
    'score' VARCHAR(50),                             
    'status' VARCHAR(50),                            
    'mt_scores_memo' VARCHAR(50),                    
    'mt_id' INT,                                     
    'user_id' INT,                                   
);
