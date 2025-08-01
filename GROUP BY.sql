-- Hangi kategoride kaç adet ürün var
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products
GROUP BY CategoryID;

-- Kategori adına göre hangi kategoride kaç adet ürün var
SELECT C.CategoryName, COUNT(*) AS ProductCount
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName;

-- Sadece satışta olan ürünler: Hangi kategoride kaç adet var
SELECT C.CategoryName, COUNT(*) AS ProductCount
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
WHERE P.Discontinued = 0
GROUP BY C.CategoryName;

-- Hangi personelim kaç adet satış yapmış
SELECT E.FirstName, E.LastName, COUNT(*) AS TotalOrders
FROM Orders AS O
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
GROUP BY E.FirstName, E.LastName
ORDER BY TotalOrders DESC;

-- Ünvanlı isimle hangi personelim kaç satış yapmış
SELECT 
    E.TitleOfCourtesy + ' ' + E.FirstName + ' ' + E.LastName AS EmployeeName,
    COUNT(*) AS TotalOrders
FROM Orders AS O
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
GROUP BY E.TitleOfCourtesy + ' ' + E.FirstName + ' ' + E.LastName
ORDER BY TotalOrders DESC;

-- Hangi üründen ne kadarlık satış yapılmış
SELECT 
    P.ProductName, 
    SUM(OD.Quantity * OD.UnitPrice) AS TotalSalesAmount
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSalesAmount DESC;

-- Hangi personelim ne kadarlık satış yapmış (Brezilya gönderileri için)
SELECT 
    E.FirstName + ' ' + E.LastName AS EmployeeName,
    SUM(OD.Quantity * OD.UnitPrice) AS TotalSalesToBrazil
FROM [Order Details] AS OD
JOIN Orders AS O ON OD.OrderID = O.OrderID
JOIN Employees AS E ON O.EmployeeID = E.EmployeeID
WHERE O.ShipCountry = 'Brazil'
GROUP BY E.FirstName + ' ' + E.LastName
ORDER BY TotalSalesToBrazil DESC;
