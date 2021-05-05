SELECT ProductID, Name, Color, ListPrice from Production.Product;
/* */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where ListPrice = 0;
/* */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where Color is NULL;
/* */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where Color is not NULL;
/* */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where Color is not NULL AND ListPrice > 0;
/* */
SELECT NAME, Color from Production.Product
Where Color is not NULL;
/* */
SELECT TOP 6 NAME, Color from Production.Product
Where Color is not NULL;
/* */
SELECT ProductID, Name from Production.Product
Where 400 <= ProductID AND ProductID < 500;
/* */
SELECT ProductID, Name, Color from Production.Product
Where Color = 'Black' or Color = 'Blue';
/* */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where Name LIKE 'S%';
/* */
SELECT Name, ListPrice from Production.Product
ORDER BY ListPrice ASC, Name;
/* */
SELECT Name, ListPrice from Production.Product
Where Name LIKE '[A,S]%'
Order by Name;
/*13 */
SELECT ProductID, Name, Color, ListPrice from Production.Product
Where Name LIKE 'SPO%' AND Name NOT LIKE 'SPOk%'
Order by Name;

/*14 */
SELECT DISTINCT Color from Production.Product
Where Color is not NULL
Order by Color DESC;

/*15 */
SELECT DISTINCT ProductSubcategoryID, Color from Production.Product
Where Color is not NULL AND ProductSubcategoryID is not NULL;

/*16 */
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE Color IN ('Red','Black') 
      AND ListPrice BETWEEN 1000 AND 2000 
      OR ProductSubCategoryID = 1
ORDER BY ProductID
 
 /*17 */
 SELECT ProductSubCategoryID, Name, Color, ListPrice from Production.Product
 ORDER BY ProductSubCategoryID DESC, Name, Color 



