CREATE database classcare_db;

USE classcare_db;

CREATE TABLE tests(
    test_id INT PRIMARY KEY,
    test_date DATE,
    score INT FOREIGN KEY(scores),
    subject_id INT FOREIGN KEY(subjects),
    user_id INT FOREIGN KEY(users)
);