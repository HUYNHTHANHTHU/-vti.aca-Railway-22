-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW sale_acc AS
SELECT *
FROM accounts
WHERE department_id = ( SELECT department_id
						FROM departments
						WHERE department_name = 'Sale');


SELECT *
FROM sale_acc;

DROP VIEW IF EXISTS sale_acc;
CREATE VIEW sale_acc AS
SELECT *
FROM accounts acc
INNER JOIN departments de
	ON acc.department_id = de.department_id
WHERE de.department_name = 'Sale';


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
DROP VIEW IF EXISTS Q2;
CREATE VIEW Q2 AS
SELECT a.account_id, count(g.group_id) so_group
from accounts a
right join group_accounts g
ON g.account_id = a.account_id
group by g.account_id
HAVING count(g.group_id) = (
								SELECT count(g.group_id) so_group
								from accounts a
								right join group_accounts g
								ON g.account_id = a.account_id
								group by g.account_id
								ORDER BY count(g.group_id) desc
								LIMIT 1);
select * from Q2;


SELECT a.account_id, count(g.group_id) so_group
from accounts a
right join group_accounts g
ON g.account_id = a.account_id
group by g.account_id
ORDER BY count(g.group_id)
LIMIT 1;


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 30 kí tự) được coi là quá dài) và xóa nó đi

DROP VIEW IF EXISTS Q3;
CREATE VIEW Q3 AS
SELECT  content, length(content) content_dai_qua_30
FROM questions  
WHERE length(content) >=30;

DELETE FROM Q3;


-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất

DROP VIEW IF EXISTS Q4;
CREATE VIEW Q4 AS
SELECT *, count(ac.department_id) departmant_co_nhieu_nhan_vien_nhat
FROM departments de
INNER JOIN `accounts` ac
ON de.department_id = ac.department_id
GROUP BY de.department_id
ORDER BY count(ac.department_id) desc
LIMIT 1;
 


-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyen tạo

DROP VIEW IF EXISTS Q5;
CREATE VIEW Q5 AS
SELECT  q.content, acc.fullname
FROM `accounts` acc
INNER JOIN questions q
ON acc.account_id = q.creator_id
WHERE acc.fullname LIKE 'Nguyen%'	


