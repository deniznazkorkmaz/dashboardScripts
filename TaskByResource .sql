USE [TaskManagementDB]
GO

CREATE PROCEDURE [dbo].[TasksByResource]
    @BeginDate DATETIME,
    @EndDate DATETIME
AS 
BEGIN

SELECT [User].Name, [User].Surname, COUNT([Task].UserId) AS TaskByResource FROM [dbo].[User]INNER JOIN [dbo].[Task] 
 ON [User].Id = [Task].UserId 
WHERE [Task].BeginDate >= @BeginDate AND [Task].EndDate <= @EndDate AND 

        [Task].UserId IN (1, 2, 3, 4, 5) AND
        [Task].BeginDate >= @BeginDate AND
        [Task].EndDate <= @EndDate

GROUP BY [User].Name, [User].Surname
END



