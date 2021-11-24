/*FctSales*/
CREATE PROCEDURE [DWH].[PopulateFctSales]
    @LoadId int
AS
BEGIN
IF OBJECT_ID('[DWH].[FctSales]') IS NOT NULL
	DROP EXTERNAL TABLE [DWH].[FctSales]
	
CREATE EXTERNAL TABLE [DWH].[FctSales]
WITH
(
  LOCATION = 'MODEL/AdventureWorks/FCT_Sales',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
)
AS
SELECT
    CAST(ROW_NUMBER() OVER (ORDER BY [OrderNumber]) AS INT) AS [SalesId]
    ,[ProductId]
    ,[CustomerId]
    ,[OrderLineItem]
    ,[OrderQuantity]
    ,GETDATE() AS [LoadDate]
    ,@LoadId AS [LoadId]
FROM [BASE].[Sales] S
JOIN [MODEL].[vwDimCustomer] C ON S.[CustomerKey] = C.[CustomerKey]
JOIN [MODEL].[vwDimProduct] P ON S.[ProductKey] = P.[ProductKey]
SELECT 0 'Output'
END