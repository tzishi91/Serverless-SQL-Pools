CREATE EXTERNAL TABLE BASE.ProductSubcategories
WITH 
(
  LOCATION = 'BASE/AdventureWorks/BASE_ProductSubcategories',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
) AS
SELECT
    [ProductSubcategoryKey]
    ,[SubcategoryName]
    ,[ProductCategoryKey]
FROM [RAW].[Product_Subcategories]