
 
CREATE PROCEDURE Operation(IN Bookid INT,IN Title VARCHAR(20),IN Language_id INT,IN MRP INT,IN Publisher_id INT,IN Published_date DATE,IN Volume INT,IN Status VARCHAR(20),IN op INT) 
 begin
 if op=1 then
  insert into BOOK values(Bookid,Title,Language_id,MRP,Publisher_id,Published_date,Volume,Status);
elseif op=2 then
update BOOK set MRP=MRP,Volume=Volume,Status=Status where Book_id=Bookid;
elseif op=3 then
delete from BOOK where Book_id=Bookid;
end if;
end $


call Operation(10,'abc',3,376,2,'2005-8-24',2,'Issued',1)$


mysql> select * from BOOK$
/*
+---------+----------------------+-------------+------+--------------+----------------+--------+--------------+
| Book_id | Title                | Language_id | MRP  | Publisher_id | Published_date | Volume | Status       |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------------+
|       1 | C PROGRAM            |           5 |  300 |            2 | 2000-10-21     |      3 | Returned     |
|       2 | CHERUKADHA           |           3 |  150 |            4 | 2010-07-30     |      1 | Not Returned |
|       3 | JAVA                 |           5 |  200 |            1 | 2010-02-10     |      2 | Not Returned |
|       4 | DATA BASE            |           6 |  250 |            3 | 2005-10-03     |      1 | Returned     |
|       5 | Fundamentals of Wave |           5 |  228 |            5 | 2000-10-21     |      1 | Wiley        |
|       7 | God Created the Inte |           3 |  197 |            4 | 2002-08-10     |      3 | Penguin      |
|      10 | abc                  |           3 |  376 |            2 | 2005-08-24     |      2 | Issued       |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------------+
*/
call Operation(10,'abc',3,376,2,'2005-8-24',4,'Issued',2)$

mysql> select * from BOOK$
/*
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
| Book_id | Title                | Language_id | MRP  | Publisher_id | Published_date | Volume | Status |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
|       1 | C PROGRAM            |           5 |  376 |            2 | 2000-10-21     |      3 | Issued |
|       2 | CHERUKADHA           |           3 |  376 |            4 | 2010-07-30     |      3 | Issued |
|       3 | JAVA                 |           5 |  376 |            1 | 2010-02-10     |      3 | Issued |
|       4 | DATA BASE            |           6 |  376 |            3 | 2005-10-03     |      3 | Issued |
|       5 | Fundamentals of Wave |           5 |  376 |            5 | 2000-10-21     |      3 | Issued |
|       7 | God Created the Inte |           3 |  376 |            4 | 2002-08-10     |      3 | Issued |
|      10 | abc                  |           3 |  376 |            2 | 2005-08-24     |      4 | Issued |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
*/

call Operation(10,'abc',3,376,2,'2005-8-24',4,'Issued',3)$
mysql> select * from BOOK$
/*
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
| Book_id | Title                | Language_id | MRP  | Publisher_id | Published_date | Volume | Status |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
|       1 | C PROGRAM            |           5 |  376 |            2 | 2000-10-21     |      3 | Issued |
|       2 | CHERUKADHA           |           3 |  376 |            4 | 2010-07-30     |      3 | Issued |
|       3 | JAVA                 |           5 |  376 |            1 | 2010-02-10     |      3 | Issued |
|       4 | DATA BASE            |           6 |  376 |            3 | 2005-10-03     |      3 | Issued |
|       5 | Fundamentals of Wave |           5 |  376 |            5 | 2000-10-21     |      3 | Issued |
|       7 | God Created the Inte |           3 |  376 |            4 | 2002-08-10     |      3 | Issued |
+---------+----------------------+-------------+------+--------------+----------------+--------+--------+
*/
