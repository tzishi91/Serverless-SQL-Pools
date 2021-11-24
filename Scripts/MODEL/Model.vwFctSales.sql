CREATE VIEW [MODEL].[vwFctSales]
AS
SELECT
	[SalesId]
    ,[ProductId]
    ,[CustomerId]
    ,[OrderLineItem]
    ,[OrderQuantity]
FROM OPENROWSET 
(
    BULK 'DWH/AdventureWorks/FCT_Sales',
    DATA_SOURCE = 'ExternalDataSourceDataLake',
    FORMAT = 'Parquet'
) AS fct
GO


