CREATE database classcare_db;

USE classcare_db;

CREATE TABLE trouble (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(600) NOT NULL,
contents VARCHAR(1000) NOT NULL,
members VARCHAR(100) NOT NULL,
userid INT,
FOREIGN KEY(users) REFERENCES users(id)
);
