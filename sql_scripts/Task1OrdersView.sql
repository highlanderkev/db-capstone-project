USE LittleLemonDB;
DROP VIEW IF EXISTS OrdersView;
CREATE VIEW OrdersView AS 
SELECT OrderId, Quantity, TotalCost 
FROM Orders 
WHERE Quantity > 2;
SELECT * FROM OrdersView;