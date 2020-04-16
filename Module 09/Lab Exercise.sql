USE MarketDev;

Create Procedure Reports.GetProductColors
as
Set Nocount On;
Begin
	Select Distinct p.Color
	From Marketing.Product as p
	Where p.Color is not null
	Order By p.Color;
End

EXEC Reports.GetProductColors;

Create Procedure Reports.GetProductsAndModels
as
Set Nocount on;
Begin
	Select p.ProductID, p.ProductName, p.ProductNumber, p.SellStartDate, p.SellEndDate, p.Color, pm.ProductModelID,
	COALESCE(ed.Description,id.Description,p.ProductName) as EnglishDescription,
	COALESCE(fd.Description,id.Description,p.ProductName) as FrenchDescription,
	COALESCE(cd.Description,id.Description,p.ProductName) as ChineseDescription
	From Marketing.Product as p
	left outer join Marketing.ProductModel as pm
	ON p.ProductModelID = pm.ProductModelID
	left outer join Marketing.ProductDescription as ed
	ON pm.ProductModelID = ed.ProductModelID 
	And ed.LanguageID = 'en'
	left outer join Marketing.ProductDescription as fd
	ON pm.ProductModelID = fd.ProductModelID 
	And fd.LanguageID = 'fr'
	left outer join Marketing.ProductDescription as cd
	ON pm.ProductModelID = cd.ProductModelID 
	And cd.LanguageID = 'zh-cht'
	left outer join Marketing.ProductDescription as id
	ON pm.ProductModelID = id.ProductModelID 
	And id.LanguageID = ''
	Order By p.ProductID,pm.ProductModelID;
END

EXEC Reports.GetProductsAndModels;

Create Procedure Marketing.GetProductsByColor
@Color nvarchar(16)
as
Set Nocount On;
Begin
	Select p.ProductID,	p.ProductName, p.ListPrice as Price, p.Color, p.Size, p.SizeUnitMeasureCode as UnitOfMeasure
	From Marketing.Product as p
	Where (p.Color = @Color) or (p.Color in null and @Color is null)
	Order By ProductName;
End


EXEC Marketing.GetProductsByColor 'Blue';


EXEC Marketing.GetProductsByColor NULL;


Alter Procedure Reports.GetProductColors
With Execute as Owner
as
Set Nocount on;
Begin
	Select Distinct p.Color
	From Marketing.Product as p
	Where p.Color is not null
	Order by p.Color;
End




Alter Procedure Reports.GetProductsAndModels
With Execute as Owner
as
Set Nocount on;
Begin
	Select p.ProductID, p.ProductName, p.ProductNumber, p.SellStartDate, p.SellEndDate, p.Color, pm.ProductModelID,
	COALESCE(ed.Description,id.Description,p.ProductName) as EnglishDescription,
	COALESCE(fd.Description,id.Description,p.ProductName) as FrenchDescription,
	COALESCE(cd.Description,id.Description,p.ProductName) as ChineseDescription
	From Marketing.Product as p
	left outer join Marketing.ProductModel as pm
	ON p.ProductModelID = pm.ProductModelID
	left outer join Marketing.ProductDescription as ed
	ON pm.ProductModelID = ed.ProductModelID 
	And ed.LanguageID = 'en'
	Left outer join Marketing.ProductDescription as fd
	ON pm.ProductModelID = fd.ProductModelID 
	And fd.LanguageID = 'fr'
	Left outer join Marketing.ProductDescription as cd
	ON pm.ProductModelID = cd.ProductModelID 
	And cd.LanguageID = 'zh-cht'
	Left outer join Marketing.ProductDescription as id
	ON pm.ProductModelID = id.ProductModelID 
	And id.LanguageID = ''
	Order By p.ProductID,pm.ProductModelID;
End




ALTER PROCEDURE Marketing.GetProductsByColor
@Color nvarchar(16)
WITH EXECUTE AS OWNER
AS
SET NOCOUNT ON;
BEGIN
	SELECT p.ProductID, p.ProductName, p.ListPrice as Price, p.Color, p.Size, p.SizeUnitMeasureCode AS UnitOfMeasure
	FROM Marketing.Product AS p
	WHERE (p.Color = @Color) OR (p.Color IS NULL AND @Color IS NULL)
	ORDER BY ProductName;
END
