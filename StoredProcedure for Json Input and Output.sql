use NaukriApplicationDB;

create procedure spJsonAsInput
(
@json varchar(max)
)
as
begin

insert into Users (UserName,UserType,UserTypeName,EmailId,Password)
select UserName,UserType,UserTypeName,EmailId,Password  from openjson(@json) 
with (UserName varchar(30) '$.uName', UserType bit '$.uType', UserTypeName varchar(20) '$.uTypeName', EmailId varchar(50) '$.eId', Password varchar(16))as jsonValues 
end



Create PROCEDURE spJsonAsOutput 
@jsonOutput VARCHAR(MAX) OUTPUT 
AS 
BEGIN
 
SET @jsonOutput = (SELECT TOP (1) UserName,UserType,UserTypeName,EmailId,Password FROM Users FOR JSON PATH, WITHOUT_ARRAY_WRAPPER)
END

DECLARE @json AS NVARCHAR(MAX)

EXEC dbo.spJsonAsOutput @jsonOutput = @json OUTPUT
  
SELECT @json



