/*
1. A result set is a set of rows from a database and metadata about the query such as the column names.
2. Union all keeps all of the records from each of the orginal datasets, while Union removes any duplicate records.
3. SQL also has operator like intersect and except.
4. Both Joins and Unions can be used to combine data from two or more tables.Joins combine data into new columns, while unions combine data into new rows.
5. Inner joins returns only the matching rows between two tables. Full join returns all rows from both the tables. 
6. Left joins return all records from the left table, and the matched records from the right table. Outer join return all records when there is a match in either left or right table.
7. Cross join produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table. 
8. Where Clause is ued to filter the records from the table based on the specified condition. Having clause is used to filter record from the groups based on the specificed contion.
9. There can be multiple group by columns.
*/

/*1*/ 
SELECT COUNT(*)
FROM [Production].[Product];

/*2*/
SELECT count(*) from (
SELECT ProductID, ProductSubcategoryID
FROM [Production].[Product]
Where  ProductSubcategoryID  is not null) n;

/*3*/
SELECT ProductSubcategoryID, COUNT(ProductID) AS CountedProducts
FROM [Production].[Product]
Where  ProductSubcategoryID  is not null
GROUP BY ProductSubcategoryID;

/*4*/
SELECT count(*) from (
SELECT ProductID, ProductSubcategoryID
FROM [Production].[Product]
Where  ProductSubcategoryID  is null ) n;

/*5*/
SELECT ProductID, SUM(Quantity) AS TheSum
FROM [Production].[ProductInventory]
GROUP BY ProductID;

/*6*/
SELECT ProductID, SUM(Quantity) AS TheSum
FROM [Production].[ProductInventory]
WHERE LocationID = 40
GROUP BY ProductID HAVING SUM(Quantity) < 100;

/*7*/
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM [Production].[ProductInventory]
WHERE LocationID = 40
GROUP BY ProductID, Shelf HAVING SUM(Quantity) < 100;

/*8*/
SELECT ProductID, AVG(Quantity) AS TheAvg
FROM [Production].[ProductInventory]
WHERE LocationID = 10
GROUP BY ProductID;

/*9*/
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM [Production].[ProductInventory]
GROUP BY ProductID, Shelf;

/*10*/
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM [Production].[ProductInventory]
Where Shelf is not null
GROUP BY ProductID, Shelf;

/*11*/
SELECT Color, Class, COUNT(ProductID) AS TheCount, AVG(ListPrice) AS AvgPrice
FROM [Production].[Product]
Where Color is not null AND Class is not null
GROUP BY Color, Class;

/*12*/
SELECT c.[CountryRegionCode] AS Country, [StateProvinceCode] AS Province
FROM [Person].[CountryRegion] AS c
INNER JOIN [Person].[StateProvince] AS s
ON c.Name = s.Name;

/*13*/
SELECT c.[CountryRegionCode] AS Country, [StateProvinceCode] AS Province
FROM [Person].[CountryRegion] AS c
INNER JOIN [Person].[StateProvince] AS s
ON c.Name = s.Name
WHERE c.CountryRegionCode = 'GE' or c.CountryRegionCode = 'CA';

/*14*/
SELECT ProductID, [OrderDate]
FROM [dbo].[Order Details] AS d
INNER JOIN [dbo].[Orders] AS o
ON d.[OrderID] = o.[OrderID]
WHERE YEAR(OrderDate) > 1996;

/*15*/SELECT TOP 5 [ShipPostalCode], COUNT([OrderID]) AS countFROM [dbo].[Orders]WHERE [ShipPostalCode] is not nullGROUP BY [ShipPostalCode]ORDER BY count DESC;/*16*/SELECT TOP 5 [ShipPostalCode], COUNT([OrderID]) AS countFROM [dbo].[Orders] WHERE [ShipPostalCode] is not null AND YEAR(OrderDate) > 1996GROUP BY [ShipPostalCode]ORDER BY count DESC;/*17*/SELECT [ShipCity], count([CustomerID]) AS countFROM [dbo].[Orders] GROUP BY [ShipCity];/*18*/SELECT [ShipCity], count([CustomerID]) AS countFROM [dbo].[Orders] GROUP BY [ShipCity] HAVING count([CustomerID]) > 10;/*19*/SELECT ContactName, [OrderDate]FROM [dbo].[Customers] cINNER JOIN [dbo].[Orders] oON c.CustomerID = o.CustomerIDWHERE OrderDate > '1/1/98';/*20*/SELECT ContactName, [OrderDate]FROM [dbo].[Customers] cINNER JOIN [dbo].[Orders] oON c.CustomerID = o.CustomerIDORDER BY OrderDate DESC;/*21*/SELECT ContactName, count(Quantity)FROM [dbo].[Customers] cINNER JOIN [dbo].[Orders] oON c.CustomerID = o.CustomerIDINNER JOIN [dbo].[Order Details] dON o.OrderID = d.OrderIDGROUP BY ContactName;/*22*/SELECT CustomerID, count(Quantity)FROM [dbo].[Orders] oINNER JOIN [dbo].[Order Details] dON o.OrderID = d.OrderIDGROUP BY CustomerID HAVING count(Quantity)>100;/*23*/SELECT s.[CompanyName] AS [Supplier Company Name], p.CompanyName AS [Shipping Company Name]FROM [dbo].[Shippers] sINNER JOIN [dbo].[Suppliers] pON s.Phone = p.Phone;/*24*/SELECT OrderDate, ProductNameFROM [dbo].[Orders] oINNER JOIN [dbo].[Order Details] dON o.OrderID = d.OrderIDINNER JOIN [dbo].[Products] pON d.ProductID = p.ProductID;/*25*/SELECT EmployeeID, TitleFROM [dbo].[Employees]/*26*/SELECT EmployeeID, Title, [ReportsTo]FROM [dbo].[Employees]WHERE [ReportsTo] > 2;/*27*/SELECT [City], c.[ContactName], [ContactName] FROM [dbo].[Customers] c