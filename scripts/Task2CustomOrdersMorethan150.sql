USE LittleLemonDB;
SELECT 
Customer.CustomerID AS CustomerID,
Customer.FullName AS FullName,
Orders.OrderID AS OrderID,
Orders.TotalCost AS Cost,
Menus.MenuName AS MenuName,
MenuItems.CourseName AS CourseName,
MenuItems.StarterName AS StarterName
FROM Customer
INNER JOIN Orders
ON Customer.CustomerID = Orders.CustomerID
INNER JOIN Menus
ON Orders.MenuID = Menus.MenuID
INNER JOIN MenuItems
ON Menus.MenuItemsID = MenuItems.MenuItemsID
WHERE Orders.TotalCost > 150.00
ORDER BY Orders.TotalCost DESC;