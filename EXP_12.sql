CREATE TABLE HISTORY(Member_id INT,Name VARCHAR(20),Branch_code INT,Roll_no INT,Email VARCHAR(20),Date_of_join DATE,Status VARCHAR(20));
DELIMITER $
CREATE TRIGGER t_up BEFORE UPDATE ON Member FOR EACH ROW BEGIN INSERT INTO HISTORY VALUES(OLD.Member_id,OLD.Name,OLD.Branch_code,OLD.Roll_no,OLD.Email,OLD.Date_of_join,OLD.Status);END $
DELIMITER ;
INSERT INTO Member VALUES(27,'ARJUN',657,22,'arj@gmail.com','2020-10-19','Regular');
UPDATE Member SET Roll_no=26 WHERE Member_id=27;
SELECT * FROM HISTORY;
/*
+-----------+-------+-------------+---------+---------------+--------------+---------+
| Member_id | Name  | Branch_code | Roll_no | Email         | Date_of_join | Status  |
+-----------+-------+-------------+---------+---------------+--------------+---------+
|        27 | ARJUN |         657 |      22 | arj@gmail.com | 2020-10-19   | Regular |
+-----------+-------+-------------+---------+---------------+--------------+---------+
1 row in set (0.05 sec)
*/
