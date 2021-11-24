--Customer
CREATE VIEW [MODEL].[vwDimCustomer]
AS
SELECT
     [CustomerId]
    ,[CustomerKey]
    ,[Prefix]
    ,[FirstName]
    ,[LastName]
    ,[FullName]
    ,[MaritalStatus]
    ,[HomeOwner]
    ,[Gender]
    ,[EmailAddress]
    ,[AnnualIncome]
    ,[TotalChildren]
    ,[EducationLevel]
    ,[Occupation]
FROM OPENROWSET 
(
    BULK 'DWH/AdventureWorks/DIM_Customer',
    DATA_SOURCE = 'ExternalDataSourceDataLake',
    FORMAT = 'Parquet'
) AS dim


