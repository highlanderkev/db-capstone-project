USE LittleLemonDB;
DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(IN CancelOrderID INT)

BEGIN
DELETE
FROM Orders
WHERE OrderID = CancelOrderID;
SELECT CONCAT("Order ", CancelOrderID, " is cancelled") AS Confirmation;
END //

DELIMITER ;
CALL CancelOrder(5);