USE LittleLemonDB;
SELECT 
Menus.MenuName AS MenuName
FROM Menus
WHERE Menus.MenuName = ANY (
SELECT Menus.MenuName
FROM Orders
JOIN Menus
ON Orders.MenuID = Menus.MenuID
WHERE Orders.Quantity > 2
)