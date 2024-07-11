CREATE DATABASE LIBRARY;
USE LIBRARY;

--b
CREATE TABLE Publisher(Publisher_id int,Name varchar(20),Address varchar(20),PRIMARY KEY(Publisher_id));
CREATE TABLE Author(Author_id int,Name varchar(20),Email varchar(20),Ph_no bigint,Status varchar(20),PRIMARY KEY(Author_id));
CREATE TABLE Member(Member_id int,Name varchar(20),Branch_code int,Roll_no int,Email varchar(20),Date_of_join date,Status varchar(20),PRIMARY KEY(Member_id));
CREATE TABLE Language(lang_id int,Name varchar(20),PRIMARY KEY(lang_id));
 CREATE TABLE Late_Fee_Rule(From_days int,To_days int,Amount int,PRIMARY KEY(From_days,To_days,Amount));
CREATE TABLE BOOK(Book_id int,Title varchar(20),Language_id int,MRP bigint,Publisher_id int,Published_date date,Volume int,Status varchar(20),PRIMARY KEY(Book_id),FOREIGN KEY(Language_id) REFERENCES Language(lang_id),FOREIGN KEY(Publisher_id) REFERENCES Publisher(Publisher_id));
CREATE TABLE Book_Author(Book_id int,Author_id int,PRIMARY KEY(Book_id,Author_id),FOREIGN KEY(Book_id) REFERENCES BOOK(Book_id),FOREIGN KEY(Author_id) REFERENCES Author(Author_id));
CREATE TABLE Book_Issue(Issue_id int,Date_of_issue date,Book_id int,Member_id int,Expected_date_of_return date,PRIMARY KEY(Issue_id),FOREIGN KEY(Book_id) REFERENCES BOOK(Book_id),FOREIGN KEY(Member_id) REFERENCES Member(Member_id));
CREATE TABLE Book_Return(Issue_id int,Actual_date_of_return date,late_days int,late_fee int,FOREIGN KEY(Issue_id) REFERENCES Book_Issue(Issue_id));

--g
INSERT INTO Publisher VALUES(1,'Amal','Qwerty'),(2,'Sathyan','Asdff'),(3,'Vinny','Zxcvt'),(4,'Manu','Tyuoio'),(5,'Ram','Sdgfh');
 INSERT INTO Author VALUES(1,'Ashwin','ashwin@gmail.com',8547354992,'Story Writer'),(2,'Fahma','fahma@gmail.com',9495669621,'Novelist'(3,'Durga','dga@gmail.com',9847082962,'Story Wrier'),(4,'Melvin','melv@gmail.com',8547353423,'Novelist');
INSERT INTO Member VALUES(10,'Jino',345,1,'jino@gmail.com','2020-08-10','Regular'),(15,'Emil',426,2,'emil@gmail.com','2021-04-12','Regular'),(17,'Sharon',345,3,'sh@gmail.com','2020-10-24','Not Regular'),(20,'Shamna',440,4,'ammu@gmail.com','2022-11-22','Not Regular'),(25,'Nayana',426,5,'nayana@gmail.com','2020-06-06','Not Regular');
INSERT INTO Language VALUES(3,'Malayalam'),(5,'English'),(6,'Hindi');
INSERT INTO Late_Fee_Rule VALUES(0,7,10),(7,30,100);
INSERT INTO BOOK VALUES(1,'C PROGRAM',5,300,2,'2000-10-21',3,'Returned'),(2,'CHERUKADHA',3,150,4,'2010-07-30',1,'Not Returned'),(3,'JAVA',5,200,1,'2010-02-10',2,'Not Returned'),(4,'DATA BASE',6,250,3,'2005-10-03',1,'Returned');
INSERT INTO Book_Author VALUES(1,3),(2,4),(3,2),(4,1);




--c
DROP TABLE Book_Author;/*with foreign key*/
DROP TABLE Publisher;/* without foreign key*/
--ERROR 1217 (23000): Cannot delete or update a parent row: a foreign key constraint fails


--d
ALTER TABLE Publisher ADD Ph_no bigint;
ALTER TABLE Book_Issue DROP COLUMN Date_Of_Issue;--without data

--e                                                                                    
CREATE INDEX INDEXB ON Book_Issue(Member_id,Book_id);
                                                                                     
--f
 GRANT INSERT ON BOOK TO s5dii;
 REVOKE INSERT ON BOOK FROM s5dii;
--h
LOAD DATA LOCAL INFILE '/home/s5di/book.csv' INTO TABLE BOOK FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1
ROWS;
 
 --i
DELETE FROM BOOK WHERE Book_id=0;

--Queries
INSERT INTO Book_Issue VALUES (1,'2022-08-21',1,10,'2022-08-27'),(2,'2022-02-02',3,20,'2022-02-16'),(3,'2022-10-24',2,17,'2022-10-31'),(4,'2022-09-21',7,10,'2022-09-27');
INSERT INTO BOOK VALUES(5,'Fundamentals of Wave',5,228,5,'2000-10-21',1,'Wiley '),(7,'God Created the Inte',3,197,4,'2002-08-10 ',3,'Penguin');
INSERT INTO Book_Author VALUES(7,1),(7,2),(5,2),(5,1),(2,3),(1,4);
INSERT INTO Book_Return VALUES(1,'2022-08-27',0,0),(2,'2022-02-16',7,10),(3,'2022-10-31',10,100);                                                                                     
