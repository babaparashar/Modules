USE AdventureWorks2012;



EXEC sp_configure;

EXEC xp_dirtree "D:\New folder\AllFiles\Demofiles\Mod09",0,1;

Create Procedure Production.GetBlueProducts
as
Set Nocount on;
Begin
  Select p.ProductID, p.Name, p.Size, p.ListPrice 
  From Production.Product as p
  Where p.Color = N'Blue'
  Order By p.ProductID;
End



EXEC Production.GetBlueProducts;



Create Procedure Production.GetBlueProductsAndModels
as
Set nocount on;
Begin
  Select p.ProductID, p.Name, p.Size, p.ListPrice 
  From Production.Product as p
  Where p.Color = N'Blue'
  Order By p.ProductID;
  
  SELECT p.ProductID, pm.ProductModelID, pm.Name AS ModelName
  From Production.Product as p
  inner Join Production.ProductModel as pm
  on p.ProductModelID = pm.ProductModelID 
  Order by p.ProductID, pm.ProductModelID;
End



EXEC Production.GetBlueProductsAndModels;




Alter Procedure Production.GetBlueProductsAndModels
as
Set nocount on;
Begin
  Select p.ProductID, p.Name, p.Size, p.ListPrice 
  From Production.Product as p
  Where p.Color = N'Blue'
  Order by p.ProductID;
  
  Select p.ProductID, pm.ProductModelID, pm.Name AS ModelName
  From Production.Product as p
  Inner Join Production.ProductModel as pm
  on p.ProductModelID = pm.ProductModelID 
  Where p.Color = N'Blue'
  Order by p.ProductID, pm.ProductModelID;
End



EXEC Production.GetBlueProductsAndModels;



Select SCHEMA_NAME(schema_id) as SchemaName, name as ProcedureName
From sys.procedures;



Use tempdb;


Create Procedure dbo.DisplayExecutionContext
as
Set nocount on;
Begin
  Select * From sys.login_token;
  Select * From sys.user_token;
End




EXEC dbo.DisplayExecutionContext;



Execute as User = 'SecureUser';



EXEC dbo.DisplayExecutionContext;



Revert;




GRANT EXECUTE ON dbo.DisplayExecutionContext TO SecureUser;


EXECUTE AS User = 'SecureUser';



ALTER PROC dbo.DisplayExecutionContext
WITH EXECUTE AS OWNER
AS
SET NOCOUNT ON;
BEGIN
  SELECT * FROM sys.login_token;
  SELECT * FROM sys.user_token;
END



EXECUTE AS User = 'SecureUser';

EXEC dbo.DisplayExecutionContext;

REVERT;



DROP PROC dbo.DisplayExecutionContext;




