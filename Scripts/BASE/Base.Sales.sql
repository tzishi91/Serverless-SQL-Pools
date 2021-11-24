CREATE EXTERNAL TABLE BASE.Sales
WITH 
(
  LOCATION = 'BASE/AdventureWorks/BASE_Sales',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
) AS
SELECT
    [OrderDate]
    ,[StockDate]
    ,[OrderNumber]
    ,[ProductKey]
    ,[CustomerKey]
    ,[TerritoryKey]
    ,[OrderLineItem]
    ,[OrderQuantity]
 FROM [RAW].[Sales_2015]
 UNION
SELECT
    [OrderDate]
    ,[StockDate]
    ,[OrderNumber]
    ,[ProductKey]
    ,[CustomerKey]
    ,[TerritoryKey]
    ,[OrderLineItem]
    ,[OrderQuantity]
 FROM [RAW].[Sales_2016]
 UNION
 SELECT
    [OrderDate]
    ,[StockDate]
    ,[OrderNumber]
    ,[ProductKey]
    ,[CustomerKey]
    ,[TerritoryKey]
    ,[OrderLineItem]
    ,[OrderQuantity]
 FROM [RAW].[Sales_2017]