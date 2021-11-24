--Create External Datasource
CREATE EXTERNAL DATA SOURCE ExternalDataSourceDataLake
	WITH (
		LOCATION   = 'Insert ADLS Connection'
	    );

--Create Parquet file format
CREATE EXTERNAL FILE FORMAT SynapseParquetFormat
WITH ( 
        FORMAT_TYPE = PARQUET
     );