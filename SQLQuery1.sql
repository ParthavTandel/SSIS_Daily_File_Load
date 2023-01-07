use Daily_load;

create table load_data(
Id int,
Name varchar(50),
Payment varchar(50))

CREATE TABLE log_running_time(
Number int not null identity(1,1), 
PackageName varchar(100), 
TaskName varchar(200), 
Step varchar(50), 
Date_time datetime)


select * from load_data

select * from log_date_time

select * from error_log

select * from log_running_time



INSERT INTO log_running_time(PackageName, TaskName, Step, Date_time) VALUES ('Package1', 'Copy', 'Pre', '2022-12-17 00:43:38.000')

INSERT INTO log_date_time(filename, date_processed, filedate, company) VALUES('Amazon','2022-12-17 00:43:38.000','20221114','BestBuy')

--truncate table load_data

--truncate table log_date_time

--truncate table error_log

--truncate table log_running_time



create table log_date_time(Number int not null identity(1,1) primary key, filename varchar(50), date_processed datetime, filedate varchar(50))



ALTER TABLE log_date_time add company varchar(50)

SELECT count(1) FROM log_date_time
where log_date_time.filename = 'Amazon_2022_11_14.txt'




select top(1) filedate from log_date_time
where filename like '%Amazon%'
order by filedate desc






select TOP(1) filedate from log_date_time
order by log_date_time.filedate desc


select SUBSTRING(REPLACE(REPLACE(REPLACE('Amazon_2022-12-13.csv','-',''),'.',''),'_',''), 6,8)

select SUBSTRING(REPLACE(REPLACE(REPLACE('Amazon_2022-12-13.csv','-',''),'.',''),'_',''), 1,6)

insert into log_date_time (company) values ( SUBSTRING(REPLACE(REPLACE(REPLACE('Amazon_2022-12-13.csv','-',''),'.',''),'_',''), 1,6))

Amazon_2022.12.13.csv

SUBSTRING(REPLACE(REPLACE(REPLACE( @[User::filename] ,"-",""),".",""),"_",""), 1,6)

SELECT SUBSTRING('Amazon_2022-12-13.csv',CHARINDEX('_','Amazon_2022-12-13.csv',1)+1,
CHARINDEX('.','Amazon_2022-12-13.csv',1)-1-CHARINDEX('_','Amazon_2022-12-13.csv',1))

SELECT REVERSE ('Amazon_2022.12.13.csv')

SELECT REVERSE(LEFT(REVERSE ('Amazon_2022.12.13.csv'),CHARINDEX('.',REVERSE ('Amazon_2022.12.13.csv'),1)-1))

SELECT SUBSTRING("Amazon_2022-12-13.csv",FINDSTRING("Amazon_2022-12-13.csv","_",1)+1,
FINDSTRING("Amazon_2022-12-13.csv","-",1)-1-FINDSTRING("Amazon_2022-12-13.csv","_",1))

DECLARE @Month int=12
SELECT RIGHT('0' + CAST(@Month AS VARCHAR(2)),2)


SELECT REVERSE(REPLACE(SUBSTRING(REVERSE('Flipkart_2022-12-13.csv'), CHARINDEX('.',REVERSE ('Flipkart_2022-12-13.csv'),1)+1, 
CHARINDEX('_',REVERSE ('Flipkart_2022-12-13.csv'),1)-1 -CHARINDEX('.',REVERSE ('Flipkart_2022-12-13.csv'),1)),'.','-'))

SELECT LEFT('Flipkart_2022-12-13.csv',CHARINDEX('_','Flipkart_2022-12-13.csv',1)-1)

'C:\Parthav\SQL Server Learning\SSIS Practice\Daily load\Amazon\Amazon_2022_12_13.csv'

SELECT RIGHT('C:\Parthav\SQL Server Learning\SSIS Practice\Daily load\Amazon\Amazon_2022_12_13.csv',
CHARINDEX('\', REVERSE('C:\Parthav\SQL Server Learning\SSIS Practice\Daily load\Amazon\Amazon_2022_12_13.csv'),1)-1)


SELECT REVERSE(LEFT(REVERSE('Amazon_2022-12-16.xlsx'), CHARINDEX('.', REVERSE('Amazon_2022-12-16.xlsx'),1)-1))