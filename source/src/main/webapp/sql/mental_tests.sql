CREATE DATABASE classcare_db;

USE classcare_db;

CREATE TABLE mental_tests(
    mt_id INT NOT NULL AUTO_INCREMENT,
    mt_img_url VARCHAR(100) NOT NULL,
    question VARCHAR(200) NOT NULL,

    choiceA VARCHAR(200) NOT NULL,
    choiceB VARCHAR(200) NOT NULL,
    choiceC VARCHAR(200)NOT NULL,
    choiceD VARCHAR(200)NOT NULL,

    choiceA_descript VARCHAR(200) NOT NULL,
    choiceB_descript VARCHAR(200) NOT NULL,
    choiceC_descript VARCHAR(200)NOT NULL,
    choiceD_descript VARCHAR(200)NOT NULL,

    choiceA_score VARCHAR(200) NOT NULL,
    choiceB_score VARCHAR(200) NOT NULL,
    choiceC_score VARCHAR(200)NOT NULL,
    choiceD_score VARCHAR(200)NOT NULL,

    mt_test_date DATE NOT NULL,
   FOREIGN KEY (user_id) REFERENCES users(user_id)
);