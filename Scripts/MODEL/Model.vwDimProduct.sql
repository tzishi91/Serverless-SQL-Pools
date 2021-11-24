CREATE VIEW [MODEL].[vwDimProduct]
AS
SELECT
    [ProductId]
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
    ,[SubcategoryName]
    ,[CategoryName]
FROM OPENROWSET 
(
    BULK 'DWH/AdventureWorks/DIM_Product',
    DATA_SOURCE = 'ExternalDataSourceDataLake',
    FORMAT = 'Parquet'
) AS dim


