create database classcare_db;

use classcare_db

 create table users(
    -> user_id int auto_increment primary key,
    -> state int not null,
    -> name varchar(20) not null,
    -> birthday date not null,
    -> age int,
    -> gender varchar(10) not null,
    -> tel varchar(20) not null,
    -> mail varchar(50) not null,
    -> parents_mail varchar(50) not null,
    -> post_code varchar(10) not null,
    -> address varchar(100) not null,
    -> password varchar(30) not null,
    -> preparation varchar(200),
    -> image_url varchar(100) not null,
    -> class_id varchar(30) not null );