DROP DATABASE IF EXISTS STI;

CREATE DATABASE STI;

USE STI;

CREATE TABLE Teacher(id VARCHAR(10) PRIMARY KEY, name VARCHAR(50) NOT NULL, password VARCHAR(20) NOT NULL, email VARCHAR(50) NOT NULL, department VARCHAR(20) NOT NULL,designation varchar(30) NOT NULL);

CREATE TABLE Student(id VARCHAR(10) PRIMARY KEY, name VARCHAR(50) NOT NULL, password VARCHAR(20) NOT NULL, email VARCHAR(50) NOT NULL, department VARCHAR(20) NOT NULL, semester INT NOT NULL, parentemail VARCHAR(50) NOT NULL);

CREATE TABLE Groups(id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30) NOT NULL, ownerid VARCHAR(10) NOT NULL);

CREATE TABLE Membership(groupid INT NOT NULL, groupname VARCHAR(50) NOT NULL, memberid VARCHAR(10) NOT NULL, membername VARCHAR(50) NOT NULL);

CREATE TABLE Message(id INT PRIMARY KEY AUTO_INCREMENT, groupid INT NOT NULL, senderid VARCHAR(10) NOT NULL, sendername VARCHAR(50) NOT NULL, content VARCHAR(100) NOT NULL);

CREATE TABLE Files(id INT PRIMARY KEY AUTO_INCREMENT, filename VARCHAR(100) NOT NULL, groupid INT NOT NULL, senderid VARCHAR(10) NOT NULL, sendername VARCHAR(50) NOT NULL);

INSERT INTO Teacher VALUES('T12023', 'Naba Kumar Maity', 'maity123', 'maity123@gmail.com', 'Mathematics', 'HOD');

INSERT INTO Teacher VALUES('T21053', 'Amrita Banerjee', 'amrita8456', 'amritab@gmail.com', 'English', 'Asst. Professor');

INSERT INTO Teacher VALUES('T15058', 'Indrani Mukherjee', 'indrani0000', 'indrani0000@gmail.com', 'Chemistry', 'Asst. Professor');

INSERT INTO Student VALUES('S14523', 'Navin Kumar Singh', '1234', 'navinkrsingh8981@gmail.com', 'Maths', '4', 'abc@gmail.com');

INSERT INTO Student VALUES('S14552', 'Arunanghshu Banerjee', 'aru9876', 'arunanghshu@gmail.com', 'CSE', '6', 'xyz@gmail.com');

INSERT INTO Student VALUES('S14599', 'Shreyanta Kar', 'kar@1234', 'shreyantakar@gmail.com', 'English', '5', 'uvw@gmail.com');

INSERT INTO Student VALUES('S15899', 'Sarupya Bhatacharjee', 'sarupya2000', 'sarupya@gmail.com', 'CSE', '6', 'pqr@gmail.com');

INSERT INTO Student VALUES('S15689', 'Madeti Goutham', 'designer9999', 'madetigoutham@gmail.com', 'CSE', '8', 'mno@gmail.com');



