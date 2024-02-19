USE [TaskManagementDB]
GO
CREATE PROCEDURE [dbo].[rpt_Tasks]
    @BeginDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SELECT 
        [Task].StatusId, [TaskStatus].Status, [Task].Task FROM [dbo].[Task] INNER JOIN [dbo].[TaskStatus] ON 
		[Task].StatusId = [TaskStatus].StatusId
    WHERE
        [Task].BeginDate >= @BeginDate AND [Task].EndDate <= @EndDate AND [TaskStatus].[Status] 
		IN ('Tamamlandý','Üzerinde Çalisiliyor','Yeni')
    SELECT
        COUNT(*) AS CompletedTask FROM [Task]
    WHERE
        StatusId = 2 AND
        BeginDate >= @BeginDate AND
        EndDate <= @EndDate
    SELECT
    COUNT(*) AS Inprogress FROM[Task]
	WHERE 
	    StatusId= 1 AND 
		BeginDate >= @BeginDate AND
        EndDate <= @EndDate
	SELECT
    COUNT(*) AS NotStarted FROM[Task]
	WHERE 
	    StatusId= 0 AND 
		BeginDate >= @BeginDate AND
        EndDate <= @EndDate;
END		
GO
