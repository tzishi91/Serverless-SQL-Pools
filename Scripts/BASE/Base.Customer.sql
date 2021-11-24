CREATE EXTERNAL TABLE BASE.Customer
WITH 
(
  LOCATION = 'BASE/AdventureWorks/BASE_Customer',
  DATA_SOURCE = ExternalDataSourceDataLake,
  FILE_FORMAT = SynapseParquetFormat
) 
AS
SELECT
	[CustomerKey]
	,[Prefix]
	,[FirstName]
	,[LastName]
	,CONCAT([FirstName],' ',[LastName]) AS [FullName]
	,[BirthDate]
	,[MaritalStatus]
	,[HomeOwner]
	,[Gender]
	,[EmailAddress]
	,REPLACE([AnnualIncome], '$', '') AS [AnnualIncome]
	,[TotalChildren]
	,[EducationLevel]
	,[Occupation]
 FROM [RAW].[CUSTOMER]