/*
====================================================
Create Database and Schemas
====================================================
Script Purpose:
  This Script Create a new database named 'DataWarehouse' after checking If it already exiists.
  if it exists it will be dropped and recreated.
  Additionally the script create three schemas within the database 'bronze', 'silver',and 'gold'.
====================================================
WARNING;
  running this script will permanently drop the entire 'DataWarehouse' database if it exists.
  All data in the database will be deleted permanently. So proceed with caution
  and ensure you have proper backups before running this script
*/


-- Create DataWarehouse DB 
use master;
go

-- Drop and Reacreate DataWarehouse Database If Found
If EXISTS( select 1 from sys.databases where name = 'DataWarehouse')
Begin
	Alter database DataWarehouse set single_user WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWarehouse;
END;
GO

Create Database DataWarehouse;
use DataWarehouse;
go

-- Create Medallion Layers Schemas
Create Schema bronze;
go
Create Schema silver;
go
Create Schema gold;
go
