CREATE PROCEDURE Pprint() 
BEGIN 
DECLARE count INTEGER DEFAULT 0; 
DECLARE id INT DEFAULT 0; 
DECLARE is_d DATE ; 
DECLARE b_id INT DEFAULT 0; 
DECLARE m_id INT DEFAULT 0; 
DECLARE re_d DATE; 
DECLARE cur_print CURSOR FOR SELECT * FROM Book_Issue;  
DECLARE CONTINUE HANDLER FOR NOT FOUND SET count=1; 
OPEN cur_print; 
label: LOOP 
FETCH cur_print INTO id,b_id,m_id,re_d,is_d; 
IF count = 1 THEN LEAVE label; 
END IF; 
SELECT CONCAT(id,'||',is_d,'||',b_id,'||',m_id,'||',re_d) AS BookIssueReg; 
END LOOP label; 
CLOSE cur_print; 
END$

DELIMITER ;

CALL Pprint;
/*
+----------------------------------+
| BookIssueReg                     |
+----------------------------------+
| 1||2022-08-21||1||10||2022-08-27 |
+----------------------------------+
1 row in set (0.12 sec)

+----------------------------------+
| BookIssueReg                     |
+----------------------------------+
| 2||2022-02-02||3||20||2022-02-16 |
+----------------------------------+
1 row in set (0.14 sec)

+----------------------------------+
| BookIssueReg                     |
+----------------------------------+
| 3||2022-10-24||2||17||2022-10-31 |
+----------------------------------+
1 row in set (0.14 sec)

+----------------------------------+
| BookIssueReg                     |
+----------------------------------+
| 4||2022-09-21||7||10||2022-09-27 |
+----------------------------------+
1 row in set (0.14 sec)
*/
