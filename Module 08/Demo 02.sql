Use AdventureWorksLT2012


create view SalesLT.vw_SalesOrder
as select S.SalesOrderDetailID, S.OrderQty, S.UnitPrice, S.ModifiedDate, P.Name, P.StandardCost
from SalesLT.SalesOrderDetail As S
Inner Join SalesLT.Product as P
On S.SalesOrderDetailID = P.ProductID



Select * from SalesLT.vw_SalesOrder

Select * from SalesLT.vw_SalesOrder
order by OrderQty


Select OBJECT_DEFINITION(OBJECT_ID(N'SalesLT.vw_SalesOrder', N'V'))


Alter View SalesLT.vw_SalesOrder
With Encryption 
as 
select S.SalesOrderDetailID, S.OrderQty, S.UnitPrice, S.ModifiedDate, P.Name, P.StandardCost
from SalesLT.SalesOrderDetail As S
Inner Join SalesLT.Product as P
On S.SalesOrderDetailID = P.ProductID


Select OBJECT_DEFINITION(OBJECT_ID(N'SalesLT.vw_SalesOrder', N'V'))


Drop View SalesLT.vw_SalesOrder
