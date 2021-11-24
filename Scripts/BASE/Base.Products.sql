CREATE EXTERNAL TABLE BASE.Products
WITH 
(
  LOCATION = 'BASE/AdventureWorks/BASE_Products',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
) AS
SELECT
     [ProductKey]
    ,[ProductSubcategoryKey]
    ,[ProductSKU]
    ,[ProductName]
    ,[ModelName]
    ,[ProductDescription]
    ,[ProductColor]
    ,[ProductSize]
    ,[ProductStyle]
    ,CAST([ProductCost] AS DECIMAL(12,2)) AS [ProductCost]
    ,CAST([ProductPrice] AS DECIMAL(12,2)) AS [ProductPrice]
 FROM [RAW].[Products]