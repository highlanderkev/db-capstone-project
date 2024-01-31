USE LittleLemonDB;
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN BookingDateToCheck DATE, IN TableNumberToCheck INT)

BEGIN
SELECT
CASE 
	WHEN BookingDate != BookingDateToCheck AND TableNumber != TableNumberToCheck  THEN "Table is not booked on this date." 
	ELSE CONCAT("Table ", TableNumberToCheck, " is already booked")
END AS BookingStatus
FROM Bookings
WHERE BookingDate = BookingDateToCheck AND TableNumber = TableNumberToCheck;
END //

DELIMITER ;
CALL CheckBooking("2022:11:12", 3);