CREATE VIEW [RAW].[Product_Categories]
AS
SELECT * FROM 
OPENROWSET 
(
    BULK 'https://storage_account_name.dfs.core.windows.net/data-lake/RAW/AdventureWorks/AdventureWorks_Product_Categories.csv',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE,
    FIELDTERMINATOR =','
) AS [result]



