USE LittleLemonDB;
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(IN NewBookingID INT, IN NewBookingDate DATE, IN CustomerIdInput INT, IN TableNumberInput INT)
BEGIN
INSERT INTO Bookings (BookingID, BookingDate, BookingTime, TableNumber, CustomerID, EmployeeID) VALUES (NewBookingID, NewBookingDate, NULL, TableNumberInput, CustomerIdInput, 1);
SELECT "New booking added" AS Confirmation;
END //

DELIMITER ;
CALL AddBooking(6, "2022:09:11", 1, 2);