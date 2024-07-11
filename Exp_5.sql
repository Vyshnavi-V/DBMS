--a
SELECT COUNT(*) FROM Book_Author,Author WHERE Name='Ashwin' AND Author.Author_id=Book_Author.Author_id;
/*
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
*/
--b
SELECT Publisher.Name,COUNT(*)  FROM Publisher,BOOK WHERE Publisher.Publisher_id=BOOK.Publisher_id GROUP BY(Publisher.Publisher_id);
/*
+---------+----------+
| Name    | COUNT(*) |
+---------+----------+
| Amal    |        1 |
| Sathyan |        1 |
| Vinny   |        1 |
| Manu    |        2 |
| Ram     |        1 |
+---------+----------+
*/
--C
SELECT Author.Name FROM (SELECT Author_id FROM (SELECT Author_id,COUNT(Book_Author.Book_id) as COUNT FROM Book_Author GROUP BY Author_id) AS t1 WHERE COUNT>1) AS t2,Author WHERE Author.Author_id=t2.Author_id;
/*
+--------+
| Name   |
+--------+
| Ashwin |
| Fahma  | 
+--------+
*/
--D
SELECT BOOK.Title FROM BOOK,Book_Issue,Book_Return WHERE BOOK.Book_id=Book_Issue.Book_id AND Book_Issue.Issue_id NOT IN (SELECT Issue_id FROM Book_Return) GROUP BY BOOK.Title;
/*
+----------------------+
| Title                |
+----------------------+
| God Created the Inte |
+----------------------+
*/
--E
SELECT Member.Name FROM Member,Language,BOOK,Book_Issue WHERE Member.Member_id=Book_Issue.Member_id AND BOOK.Book_id=Book_Issue.Book_id AND BOOK.Language_id=Language.Lang_id AND Language.Name='Malayalam' AND  Member.Member_id NOT IN (SELECT Member.Member_id FROM Member,Language,BOOK,Book_Issue WHERE Member.Member_id=Book_Issue.Member_id AND BOOK.Book_id=Book_Issue.Book_id AND BOOK.Language_id=Language.lang_id 
AND Language.Name != 'Malayalam');
/*
+--------+
| Name   |
+--------+
| Sharon |
+--------+
*/
--F
SELECT SUM(late_fee) AS Fine FROM Book_Return WHERE MONTH(Actual_date_of_return)=MONTH(CURDATE());
/*
+------+
| Fine |
+------+
| NULL |
+------+
*/
 SELECT SUM(late_fee) AS Fine FROM Book_Return WHERE QUARTER(Actual_date_of_return)=QUARTER(CURDATE());
/*
+------+
| Fine |
+------+
|  100 |
+------+
*/
--G
SELECT Name FROM Member,Book_Issue,Book_Return WHERE Member.Member_id=Book_Issue.Member_id AND Book_Issue.Issue_id = Book_Return.Issue_id AND Book_Return.late_days!=0;
/*
+--------+
| Name   |
+--------+
| Shamna |
| Sharon |
+--------+
*/
--H
SELECT Title,SUM(late_fee) FROM BOOK,Book_Issue,Book_Return WHERE BOOK.Book_id=Book_Issue.Book_id AND Book_Issue.Issue_id=Book_Return.Issue_id AND Expected_date_of_return<(CURDATE()) GROUP BY Title;
/*
+--------------+--------------+
| Title        |SUM(late_fee) |
+--------------+--------------+
| C PROGRAM    |        0     |
| JAVA         |       10     |
| CHERUKADHA   |      100     |
+---------+-------------------+
*/
--I
SELECT Name FROM Member,Book_Issue WHERE Date_of_join > '2021-01-01' AND Member.Member_id NOT IN(SELECT Member_id  FROM Book_Issue) GROUP BY Name;
/*
+------+
| Name |
+------+
| Emil |
+------+ 
*/
