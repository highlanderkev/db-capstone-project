USE LittleLemonDB;
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(IN BookingIdInput INT)
BEGIN
DELETE FROM Bookings 
WHERE BookingID = BookingIdInput;
SELECT CONCAT("Booking ", BookingIdInput," cancelled") AS Confirmation;
END //

DELIMITER ;
CALL CancelBooking(6);