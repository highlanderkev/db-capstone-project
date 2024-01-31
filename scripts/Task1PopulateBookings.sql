USE LittleLemonDB;
INSERT INTO Address (AddressID, Street, City, State, Postal, Country)
VALUES
(1, '1234 AnyStreet', 'Anytown', 'WA', 83567, 'USA');

INSERT INTO Customer (CustomerID, FullName, ContactNumber, Email, AddressID)
VALUES 
(1, 'John Smith', NULL, 'john.smith@email.com', 1),
(2, 'Jim John', NULL, 'jim.john@email.com', 1),
(3, 'Timmy Tom', NULL, 'timmy.tom@email.com', 1);

INSERT INTO Employee (EmployeeID, FullName, ContactNumber, Email, Role, Salary, AddressID)
VALUES
(1, 'Jane Doe', NULL, 'jane.doe@email.com', 'Manager', '100,000', 1);

INSERT INTO Bookings (BookingID, BookingDate, BookingTime, TableNumber, CustomerID, EmployeeID)
VALUES
(1, '2022:10:10', NULL, 5, 1, 1),
(2, '2022:11:12', NULL, 3, 3, 1),
(3, '2022:10:11', NULL, 2, 2, 1),
(4, '2022:10:13', NULL, 2, 1, 1);

SELECT * FROM Bookings;