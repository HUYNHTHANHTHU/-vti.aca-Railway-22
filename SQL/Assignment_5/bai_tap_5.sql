-- Exercise 1: Tiếp tục với Database Testing System
-- (Sử dụng subquery hoặc CTE)
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW sale_acc AS
SELECT *
from accounts
WHERE department_id = ( Select department_id
						from departments
						WHERE department_name = 'Sale');

SELECT *
from sale_acc;


SELECT *
from accounts acc
INNER JOIN departments de
ON acc.department_id = de.department_id
WHERE department_name = 'Sale';


-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW Q2 AS
SELECT a.account_id, count(g.group_id) so_group
from accounts
right join group_accounts g
ON g.account_id = a.account_id
group by g.account_id
HAVING count(g.group_id) = (
								SELECT count(g.group_id) so_group
								from accounts a
								right join group_accounts g
								ON g.account_id = a.account_id
								group by g.account_id
								ORDER BY count(g.group_id)
								LIMIT 1);
select * from Q2;


-- SELECT count(g.group_id) so_group
-- from accounts a
-- right join group_accounts g
-- ON g.account_id = a.account_id
-- group by g.account_id
-- ORDER BY count(g.group_id)
-- LIMIT 1;


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 30 kí tự)
--  được coi là quá dài) và xóa nó đi
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo