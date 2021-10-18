SELECT * FROM departments;
SELECT * FROM positions;
SELECT * FROM accounts;
SELECT * FROM `groups`;
SELECT * FROM groupquestionsexamsexam_questions_accounts;
SELECT * FROM type_questions;
SELECT * FROM category_questions;
SELECT * FROM questions;
SELECT * FROM answers;
SELECT * FROM exams;
SELECT * FROM exam_questions;



-- Question 1: Thêm ít nhất 10 record vào mỗi table
-- Đã thêm vào phần INSERT

-- Question 2: lấy ra tất cả các phòng ban

SELECT * 
FROM departments;

-- Question 3: lấy ra id của phòng ban "Sale"

SELECT department_id 
FROM  departments
WHERE department_name = "Sale";
 
-- Question 4: lấy ra thông tin account có full name dài nhất
-- CACH 1:
SELECT *,length(fullname)
 FROM  `accounts`
 ORDER BY length(fullname) DESC
 LIMIT 1;
 
-- CACH 2.1: 
SELECT length(fullname)
FROM `accounts`
WHERE length(fullname) = (
						 SELECT MAX(length(fullname))
                         FROM `accounts`
                         );


                        
-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id=3
SELECT *, length(fullname)
FROM  `accounts`
WHERE  length(fullname) = (
							SELECT MAX(length(fullname))
							FROM  `accounts`
							)
AND department_id=1;

-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019

SELECT * 
FROM `groups`
WHERE create_date < "2019-12-20";

-- Question 7: Lấy ra ID của question có >= 4 câu trả lời

SELECT question_id 
FROM answers
GROUP BY question_id
HAVING count(question_id)>=4;

-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019

SELECT `code`	 
FROM exams
WHERE duration >="60"
AND createdate <"2019-12-20";

-- Question 9: Lấy ra 5 group được tạo gần đây nhất

SELECT group_name
FROM `groups`
ORDER BY create_date desc
LIMIT 5;

-- Question 10: Đếm số nhân viên thuộc department có id = 2

SELECT count(department_id) so_nhan_vien
FROM `accounts`
WHERE department_id = 2;

-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"

SELECT fullname
FROM `accounts`
WHERE fullname LIKE "D%o";


-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019

 DELETE FROM exams
WHERE createdate < '20191220';

-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"

DELETE FROM questions q
WHERE q.content LIKE "câu hỏi%";


-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn

UPDATE accounts 
SET fullname = "Nguyen Ba Loc", email=  "loc.nguyenba@vti.com.vn"
WHERE  account_id=5;

SELECT * FROM accounts
WHERE  account_id=5;

-- Question 15: update account có id = 5 sẽ thuộc group có id = 4

UPDATE group_accounts 
SET group_id= 4
WHERE account_id= 5;

SELECT * FROM group_accounts
WHERE  account_id=5;


