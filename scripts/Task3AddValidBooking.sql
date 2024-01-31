USE LittleLemonDB;
DROP PROCEDURE IF EXISTS AddValidBooking;
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN NewBookingDate DATE, IN TableNumberInput INT)
BEGIN
	DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction rolled back: Overlapping Booking';
    DECLARE commit_message VARCHAR(255) DEFAULT 'Transaction committed successfully';
    
	START TRANSACTION;

	IF (SELECT COUNT(*) FROM Bookings WHERE BookingDate = NewBookingDate AND TableNumber = TableNumberInput) > 0 THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = rollback_message;
    ELSE
		INSERT INTO Bookings (BookingID, BookingDate, BookingTime, TableNumber, CustomerID, EmployeeID) VALUES (5, NewBookingDate, NULL, TableNumberInput, 1, 1);
		COMMIT;
        SELECT commit_message AS 'Result';
	END IF;
END //

DELIMITER ;
CALL AddValidBooking("2022:11:11", 2);