use AdventureWorks2016

create view Production.OnlineProducts
as
Select p.ProductID, p.Name, p.ProductNumber AS [Product Number], COALESCE(p.Color, 'N/A') AS Color,
Case p.DaysToManufacture
When 0 Then 'In stock' 
When 1 Then 'Overnight'
When 2 Then '2 to 3 days delivery'
Else 'Call us for a quote'
End as Availability,
p.Size, p.SizeUnitMeasureCode AS [Unit of Measure], p.ListPrice AS Price, p.Weight
From Production.Product AS p
Where p.SellEndDate is null and p.SellStartDate is not null



create view Production.AvailableModels
as
Select p.ProductID as [Product ID], p.Name, pm.ProductModelID as [Product Model ID], pm.Name as [Product Model]
From Production.Product As p
inner join Production.ProductModel as pm
on p.ProductModelID = pm.ProductModelID
Where p.SellEndDate is null
AND p.SellStartDate is not null



Select * From Production.OnlineProducts;

Select * From Production.AvailableModels;


Create View Sales.NewCustomers
as
Select CustomerID, FirstName, LastName 
From Sales.CustomerPII;



Select * From Sales.NewCustomers 
Order by CustomerID



INSERT INTO Sales.NewCustomer
VALUES
(10001,'Maneesh', 'Sharma'),
(10002, 'Ajay', 'Sharma')