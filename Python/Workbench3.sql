DROP DATABASE IF EXISTS Home_work_2;
CREATE DATABASE Home_work_2;
USE Home_work_2;
Create TABLE IF NOT EXISTS HW_2
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);
INSERT INTO HW_2(order_date, count_product)
VALUES
	(STR_TO_DATE('2022-01-01', '%Y-%m-%d'), 156),
    (STR_TO_DATE('2022-01-02', '%Y-%m-%d'), 180),
    (STR_TO_DATE('2022-01-03', '%Y-%m-%d'), 21),
    (STR_TO_DATE('2022-01-04', '%Y-%m-%d'), 124),
    (STR_TO_DATE('2022-01-05', '%Y-%m-%d'), 341);
SELECT * FROM HW_2;

SELECT
	id AS "id заказа",
    IF (count_product < 100, "Маленький заказ",
		IF (count_product BETWEEN 100 AND 300, "Средний заказ", "Большой заказ"))
	AS "Тип заказа"
FROM HW_2;
        
USE Home_work_2;
Create TABLE IF NOT EXISTS HW_2_2
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(5),
    amount VARCHAR(10),
    order_status VARCHAR(10)
);
INSERT INTO HW_2_2(employee_id, amount, order_status)
VALUE
	('e03', '15.00', 'OPEN'),
    ('e01', '25.50', 'OPEN'),
    ('e05', '100.70', 'CLOSED'),
    ('e02', '22.18', 'OPEN'),
    ('e04', '09.50', 'CANCELLED');

SELECT
	id, employee_id, amount,
    IF (order_status = 'OPEN', 'Order is in open state',
		IF (order_status = 'CLOSED', 'Order is closed', 'Order is cancelled'))
	AS 'full_order_status'
    FROM HW_2_2;