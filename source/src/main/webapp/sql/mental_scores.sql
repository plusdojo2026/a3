CREATE database 'classcare_db';

USE 'classcare_db';

CREATE TABLE 'mental_scores' (
    'mt_scores_id' INT AUTO_INCREMENT PRIMARY KEY,--得点ID
    'score' VARCHAR(50),--スコア                          
    'status' VARCHAR(50),--状態                        
    'mt_scores_memo' VARCHAR(50),--メモ                  
    'mt_id' INT,--心理テストID                               
    'user_id' INT,--ID                                 
);
