
USE testing_system;

-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT fullname, department_name 
FROM `accounts` ac
LEFT JOIN departments de
ON ac.department_id = de.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010 

SELECT * 
FROM `accounts`
WHERE create_date > "2010-12-20";

-- Question 3: Viết lệnh để lấy ra tất cả các developer 
SELECT position_name, fullname
FROM `accounts` ac
INNER JOIN positions po
	ON ac.position_id = po.position_id
WHERE position_name = 'Dev';

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >2 nhân viên

SELECT *
-- count(ac.department_id)
FROM `accounts` ac
INNER JOIN departments de
	ON ac.department_id = de.department_id
GROUP BY ac.department_id
	HAVING count(ac.department_id) > 2;


-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT *
FROM questions qu
INNER JOIN exam_questions eq
	ON qu.question_id = eq.question_id
GROUP BY qu.question_id
	HAVING COUNT(eq.question_id) = ( 
									SELECT COUNT(question_id)
									FROM exam_questions
									GROUP BY question_id
									ORDER BY COUNT(question_id) DESC
									LIMIT 1
                                    );

SELECT question_id, COUNT(question_id)
FROM exam_questions
GROUP BY question_id
ORDER BY COUNT(question_id) DESC
LIMIT 1;

SELECT question_id, COUNT(question_id)
FROM exam_questions
GROUP BY question_id;



-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
 
SELECT cq.category_name, q.content, count(q.question_id) so_luong_question
FROM category_questions cq
LEFT JOIN questions q
ON cq.category_id = q.category_id
GROUP BY cq.category_id;


-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT q.question_id, q.content, count(eq.exam_id) so_luong_exam
FROM questions q
LEFT JOIN exam_questions eq
	ON q.question_id = eq.question_id
GROUP BY q.question_id;


-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT *, count(an.question_id) nhieu_cau_tra_loi_nhat
FROM questions q
INNER JOIN answers an
	ON q.question_id = an.question_id
 GROUP BY an.question_id  
 HAVING count(an.question_id) = (
									SELECT COUNT(question_id)
									FROM answers
									GROUP BY question_id
                                    ORDER BY COUNT(question_id) DESC
                                    LIMIT 1);


-- Question 9: Thống kê số lượng account trong mỗi group 

SELECT g.group_id, g.group_name, COUNT(acc.account_id) number_of_ac
FROM `group_accounts` ga
INNER JOIN accounts acc
ON acc.account_id = ga.account_id
RIGHT JOIN `groups` g
ON ga.group_id = g.group_id 
GROUP BY g.group_id
ORDER BY COUNT(ga.group_id);


-- Question 10: Tìm chức vụ có ít người nhất

SELECT pos.position_name, count(ac.position_id) chuc_vu_it_nguoi_nhat
FROM positions pos
LEFT JOIN `accounts` ac
	ON pos.position_id = ac.position_id
GROUP BY ac.position_id
ORDER BY count(ac.position_id) asc
LIMIT 1; 

-- subquery lay toi uu

SELECT *-- count(position_id) chuc_vu_it_nguoi_nhat
FROM  `accounts`
GROUP BY position_id
ORDER BY count(position_id) asc;

  
-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- thong ke moi phong ban co nao nhieu position_id 

-- SELECT d.department_name,
-- COUNT(a.department_id)SL_PHONG_BAN,
-- GROUP_CONCAT(p.position_name)
-- FROM accounts a
-- INNER JOIN departments d
-- 	ON a.department_id=d.department_id
-- INNER JOIN positions p
-- 	ON a.position_id=p.position_id
-- GROUP BY a.department_id;
 
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của  question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì

SELECT q.content, tq.type_name, a.fullname, an.content
FROM questions q
LEFT JOIN answers an
ON q.question_id = an.question_id
LEFT JOIN type_questions tq
ON tq.type_id = q.type_id
INNER JOIN accounts a
ON q.creator_id = a.account_id;


-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm

SELECT tq.type_name, COUNT(q.type_id) number_of_question
FROM questions q
LEFT JOIN type_questions tq
ON q.type_id = tq.type_id
GROUP BY tq.type_id;

-- Question 14: Lấy ra group không có account nào

SELECT g.*
FROM `groups` g
LEFT JOIN `group_accounts` ga
ON g.group_id = ga.group_id
 WHERE ga.account_id  IS NULL;


-- Question 15: Lấy ra question không có answer nào

SELECT q.*
FROM questions q
LEFT JOIN answers an 
ON q.question_id = an.question_id
 WHERE an.question_id  IS NULL;




-- Exercise 2: Union

-- Question 17: 

-- a) Lấy các account thuộc nhóm thứ 1

SELECT a.fullname, g.group_id
FROM `accounts`  a
INNER JOIN `group_accounts` g
on a.`accounts`  = g.`group_accounts`
where g.group_id =  1;

-- b) Lấy các account thuộc nhóm thứ 3

SELECT a.fullname, g.group_id
FROM `accounts`  a
INNER JOIN `group_accounts` g
on a.`accounts`  = g.`group_accounts`
where g.group_id =  3;

-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau

SELECT a.fullname, g.group_id
FROM `accounts`  a
INNER JOIN `group_accounts` g
on a.`accounts`  = g.`group_accounts`
where g.group_id =  1

UNION -- UNION ALL lấy ra tất cả 

SELECT a.fullname, g.group_id
FROM `accounts`  a
INNER JOIN `group_accounts` g
on a.`accounts`  = g.`group_accounts`
where g.group_id =  3;


-- Question 18: 

-- a) Lấy các group có lớn hơn 5 thành viên

SELECT g.group_name, COUNT(ga.group_id) number_of_members
FROM `groups` g
LEFT JOIN `group_accounts` ga
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) >= 5;

-- b) Lấy các group có nhỏ hơn 7 thành viên

SELECT g.group_name, COUNT(ga.group_id) number_of_members
FROM `groups` g
LEFT JOIN `group_accounts` ga
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) < 7;


-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT g.group_name, COUNT(ga.group_id) number_of_members
FROM `groups` g
LEFT JOIN `group_accounts` ga
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) >= 5

UNION ALL -- UNION ALL lấy ra tất cả 

SELECT g.group_name, COUNT(ga.group_id) number_of_members
FROM `groups` g
LEFT JOIN `group_accounts` ga
ON g.group_id = ga.group_id
GROUP BY g.group_id
HAVING COUNT(ga.group_id) < 7;

