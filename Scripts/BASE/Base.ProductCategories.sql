CREATE EXTERNAL TABLE BASE.ProductCategories
WITH 
(
  LOCATION = 'BASE/AdventureWorks/BASE_ProductCategories',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
) AS
SELECT 
    [ProductCategoryKey]
    ,[CategoryName]
FROM [RAW].[Product_Categories]