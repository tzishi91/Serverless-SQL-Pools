/*DimProduct*/
CREATE PROCEDURE [DWH].[PopulateDimProduct]
    @LoadId int
AS
BEGIN
IF OBJECT_ID('[DWH].[DimProduct]') IS NOT NULL
	DROP EXTERNAL TABLE [DWH].[DimProduct]
	
CREATE EXTERNAL TABLE [DWH].[DimProduct]
WITH
(
  LOCATION = 'MODEL/AdventureWorks/DIM_Product',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
)
AS
SELECT
    CAST(ROW_NUMBER() OVER (ORDER BY [ProductKey]) AS INT) AS [ProductId]
    ,[ProductKey]
    ,[ProductSKU]
    ,[ProductName]
    ,[ModelName]
    ,[ProductDescription]
    ,[ProductColor]
    ,[ProductSize]
    ,[ProductStyle]
    ,[ProductCost]
    ,[ProductPrice]
    ,PS.[SubcategoryName]
    ,PC.[CategoryName]
    ,GETDATE() AS [LoadDate]
    ,@LoadId AS [LoadId]
FROM [BASE].[Products] P
JOIN [BASE].[ProductSubcategories] PS ON
    P.[ProductSubcategoryKey] = PS.[ProductSubcategoryKey]
JOIN [BASE].[ProductCategories] PC ON
    PC.[ProductCategoryKey] = PS.[ProductCategoryKey]
SELECT 0 'Output'
END