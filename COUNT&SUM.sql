-- COUNT: Ürün ve kategori sayısı
SELECT COUNT(*) AS ProductCount FROM Products;
SELECT COUNT(*) AS CategoryCount FROM Categories;

-- Tüm ürünleri listele
SELECT * FROM Products;

-- SUM: Toplam stok adedi
SELECT SUM(UnitsInStock) AS TotalUnitsInStock FROM Products;

-- Stoğumda toplam ne kadarlık ürün var
SELECT SUM(UnitsInStock * UnitPrice) AS TotalStockValue FROM Products;

-- Toplam kaç adet satış yapılmış
SELECT COUNT(*) AS TotalOrderCount FROM Orders;

-- Toplam ne kadarlık satış yapılmış
SELECT SUM(UnitPrice * Quantity) AS TotalSalesValue FROM [Order Details];
