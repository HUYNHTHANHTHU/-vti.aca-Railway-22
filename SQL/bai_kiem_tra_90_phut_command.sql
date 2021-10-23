-- Questions
-- 1. Tạo table với các ràng buộc và kiểu dữ liệu Thêm ít nhất 5 bản ghi vào table.
-- 2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua.

SELECT cu.`name`, o.`status`, o.amount 
FROM customer cu
RIGHT JOIN `order` o
ON cu.customer_id = o.customer_id
WHERE o.`status` =  "1"
GROUP BY  o.customer_id
ORDER BY o.amount ASC; 

-- 3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.
DROP PROCEDURE IF EXISTS ten_hang_sx_nhieu_oto_nhat;
DELIMITER $$
CREATE PROCEDURE ten_hang_sx_nhieu_oto_nhat ()
BEGIN 
SELECT c.maker, o.amount, COUNT(c.car_id) so_luong
FROM car c
INNER JOIN `order` o
ON c.car_id = o.car_id
WHERE YEAR ((orderdate) = YEAR (NOW))
GROUP BY  c.car_id
HAVING COUNT(c.car_id) =( SELECT SUM(c.car_id)
						  FROM car c
						  INNER JOIN `order` o
							ON c.car_id = o.car_id AND YEAR ((orderdate) = YEAR (NOW))
							GROUP BY  c.car_id);
END$$
DELIMITER ;

CALL ten_hang_sx_nhieu_oto_nhat;




-- 4. Viết 1 thủ tục (không có parameter) để xóa các đơn hàng đã bị hủy của những năm trước. In ra số lượng bản ghi đã bị xóa.




-- 5. Viết 1 thủ tục (có CustomerID parameter) để in ra thông tin của các đơn hàng đã đặt hàng bao gồm: tên của khách hàng, mã đơn hàng, số lượng oto và tên hãng sản xuất







-- 6. Viết trigger để tránh trường hợp người dụng nhập thông tin không hợp lệ 
-- vào database (DeliveryDate < OrderDate + 15).