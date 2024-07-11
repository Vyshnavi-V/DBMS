CREATE DATABASE TRANSACTION;
USE TRANSACTION;
CREATE TABLE Book_Issue(Issue_id int,Date_of_issue date,Book_id int,Status varchar(20),Expected_date_of_return date,PRIMARY KEY(Issue_id));
CREATE TABLE Book_Return(Issue_id int,Actual_date_of_return date,late_days int,late_fee int,FOREIGN KEY(Issue_id) REFERENCES Book_Issue(Issue_id));
INSERT INTO Book_Issue VALUES (1,'2022-08-21',1,'Issued','2022-08-27'),(2,'2022-02-02',3,'Issued','2022-02-16'),(3,'2022-10-24',2,'Issued','2022-10-31'),(4,'2022-09-21',7,'Issued','2022-09-27');
DELIMITER $
CREATE PROCEDURE BOOKRETURN(IN Issue_id int,IN Actual_date_of_return date,IN late_days int,IN late_fee int) BEGIN INSERT INTO Book_Return VALUES(Issue_id,Actual_date_of_return,late_days,late_fee); UPDATE Book_Issue SET Status='Returned' WHERE Book_Issue.Issue_id=Issue_id; END$
CALL BOOKRETURN(1,'2022-08-27',0,0);$
CALL BOOKRETURN(2,'2022-02-16',7,10);$
select * from Book_Issue;$
/*+----------+---------------+---------+----------+-------------------------+
| Issue_id | Date_of_issue | Book_id | Status   | Expected_date_of_return |
+----------+---------------+---------+----------+-------------------------+
|        1 | 2022-08-21    |       1 | Returned | 2022-08-27              |
|        2 | 2022-02-02    |       3 | Returned | 2022-02-16              |
|        3 | 2022-10-24    |       2 | Issued   | 2022-10-31              |
|        4 | 2022-09-21    |       7 | Issued   | 2022-09-27              |
+----------+---------------+---------+----------+-------------------------+
*/
select * from Book_Return;$
/*
+----------+-----------------------+-----------+----------+
| Issue_id | Actual_date_of_return | late_days | late_fee |
+----------+-----------------------+-----------+----------+
|        1 | 2022-08-27            |         0 |        0 |
|        2 | 2022-02-16            |         7 |       10 |
+----------+-----------------------+-----------+----------+
*/
