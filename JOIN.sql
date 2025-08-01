-- Kategoriler ve ürünlerin tüm bilgileri
SELECT * FROM Categories;
SELECT * FROM Products;

-- Ürün bilgileri ile birlikte kategori adlarını listele
SELECT 
    P.ProductID, 
    P.ProductName, 
    P.CategoryID, 
    C.CategoryName
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID;

-- Ürün adı, kategori adı, stok ve fiyat bilgisi
SELECT 
    P.ProductID, 
    P.ProductName,
    C.CategoryName, 
    P.UnitsInStock, 
    P.UnitPrice
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID;

-- Ürünler ve kategoriler: tüm kolonlar
SELECT 
    P.*, 
    C.*
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID;

-- Detaylı ürün bilgileri: kategori ve stok durumlarıyla birlikte
SELECT 
    P.ProductID, 
    P.ProductName, 
    C.CategoryName, 
    P.UnitsInStock, 
    P.ReorderLevel, 
    P.UnitPrice, 
    P.Discontinued
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID;

-- Ürünlerin ID, isim, kategori adı, tedarikçi firma adı, yetkili kişi, stok ve fiyat bilgisi
SELECT 
    P.ProductID, 
    P.ProductName, 
    C.CategoryName, 
    S.CompanyName, 
    S.ContactName, 
    P.UnitsInStock, 
    P.UnitPrice
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID;

-- Sipariş verilmesi gereken ürünler (satışta olan ve stok seviyesi düşük ürünler)
-- Ürün ID, isim, kategori adı, tedarikçi bilgileri, stok ve güvenlik stoğu farkı
SELECT 
    P.ProductID, 
    P.ProductName, 
    C.CategoryName, 
    S.CompanyName, 
    S.ContactName, 
    S.Phone, 
    P.UnitsInStock, 
    P.ReorderLevel, 
    (P.ReorderLevel - P.UnitsInStock) AS StockDeficit
FROM Products AS P
JOIN Categories AS C ON P.CategoryID = C.CategoryID
JOIN Suppliers AS S ON P.SupplierID = S.SupplierID
WHERE P.UnitsInStock <= P.ReorderLevel AND P.Discontinued = 0;

-- Sipariş detayları tablosu
SELECT * FROM [Order Details];

-- Sipariş detaylarını ürün isimleri ile listele
SELECT 
    P.ProductName, 
    P.UnitPrice AS ListPrice, 
    OD.UnitPrice AS SalePrice, 
    OD.Quantity, 
    OD.Discount, 
    (OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) AS Total
FROM [Order Details] AS OD
JOIN Products AS P ON OD.ProductID = P.ProductID;
