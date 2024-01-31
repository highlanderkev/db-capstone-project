USE LittleLemonDB;
DROP PROCEDURE IF EXISTS GetMaxQuantity;
DELIMITER //
CREATE PROCEDURE GetMaxQuantity()

BEGIN
SELECT MAX(Orders.Quantity) AS MaxOrderQuantity FROM Orders;
END //

DELIMITER ;
CALL GetMaxQuantity();