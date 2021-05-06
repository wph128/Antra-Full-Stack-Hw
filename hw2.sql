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

/*15*/