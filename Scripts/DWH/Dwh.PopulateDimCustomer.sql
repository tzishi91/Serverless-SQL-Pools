/*DimCustomer*/
CREATE PROCEDURE [DWH].[PopulateDimCustomer]
    @LoadId int
AS
BEGIN
IF OBJECT_ID('[DWH].[DimCustomer]') IS NOT NULL
	DROP EXTERNAL TABLE [DWH].[DimCustomer]
	
CREATE EXTERNAL TABLE [DWH].[DimCustomer]
WITH
(
  LOCATION = 'MODEL/AdventureWorks/DIM_Customer',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
)
AS
	SELECT
		CAST(ROW_NUMBER() OVER (ORDER BY [CustomerKey]) AS INT) AS [CustomerId],
		ISNULL(CAST([CustomerKey]  AS INT), -1) AS [CustomerKey],
		ISNULL(CAST([Prefix]  AS VARCHAR(5)), 'Unknown') AS [Prefix],
		ISNULL(CAST([FirstName]  AS VARCHAR(50)), 'Unknown') AS [FirstName],
		ISNULL(CAST([LastName]	AS VARCHAR(50)), 'Unknown') AS [LastName],
		ISNULL(CAST([FullName]	AS VARCHAR(100)), 'Unknown') AS [FullName],
		ISNULL(CAST([MaritalStatus]	AS VARCHAR(50)), 'Unknown') AS [MaritalStatus],
		ISNULL(CAST([HomeOwner]	AS VARCHAR(50)), 'Unknown') AS [HomeOwner],
		ISNULL(CAST([Gender]	AS VARCHAR(50)), 'Unknown') AS [Gender],
		ISNULL(CAST([EmailAddress]	AS VARCHAR(50)), 'Unknown') AS [EmailAddress],
        ISNULL(CAST([AnnualIncome]	AS VARCHAR(50)), 'Unknown') AS [AnnualIncome],
		ISNULL(CAST([TotalChildren]  AS INT), -1) AS [TotalChildren],
		ISNULL(CAST([EducationLevel] AS VARCHAR(50)), 'Unknown') AS [EducationLevel],
		ISNULL(CAST([Occupation] AS VARCHAR(50)), 'Unknown') AS [Occupation],
		GETDATE() AS [LoadDate],
		@LoadId AS [LoadId]
	FROM [BASE].[Customer]
SELECT 0 'Output'
END