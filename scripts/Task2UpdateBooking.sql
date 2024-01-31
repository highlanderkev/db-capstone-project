USE LittleLemonDB;
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BookingIdInput INT, IN NewBookingDate DATE)
BEGIN
UPDATE Bookings 
SET BookingDate = NewBookingDate
WHERE BookingID = BookingIdInput;
SELECT CONCAT("Booking ", BookingIdInput," updated") AS Confirmation;
END //

DELIMITER ;
CALL UpdateBooking(6, "2022:08:11");