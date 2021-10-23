-- Exercise 1: Tiếp tục với Database Testing System
-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS accounts_of_department;
DELIMITER $$
CREATE PROCEDURE accounts_of_department ( IN deparment_name VARCHAR(100))
BEGIN 
SELECT * 
FROM `accounts`a
INNER JOIN deparments d
ON a.deparment_id = d.deparment_id
WHERE LOWER(d.department_name) = LOWER(d.department_name);
END$$
DELIMITER ;

-- SELECT * 
-- FROM `accounts`a
-- INNER JOIN deparments d
-- ON a.deparment_id = d.deparment_id
-- WHERE d.department_name = ('Sale');


-- Question 2: Tạo store để in ra số lượng account trong mỗi group

DROP PROCEDURE IF EXISTS count_account_group;
DELIMITER $$
CREATE PROCEDURE count_account_group ()
BEGIN 
SELECT g.*, COUNT(ga.account_id) NUMBER_ACCOUNT
FROM `groups` g
LEFT JOIN group_accounts ga
ON g.group_id = ga.group_id
GROUP BY g.group_id;
END$$
DELIMITER ;

CALL count_account_group;





-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại


WHERE MONTH(create_date) = MONTH(NOW()) AND YEAR(create_date) = YEAR(NOW()) ;
-- SELECT MONTH(NOW());


-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên 
--  chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa 
--  chuỗi của người dùng nhập vào
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và 
--  trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
--  Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
--  để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử 
--  dụng store ở câu 9 để xóa)
--  Sau đó in số lượng record đã remove từ các table liên quan trong khi 
--  removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng 
--  nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được 
--  chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm 
--  nay
