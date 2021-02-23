USE SQL_Projekat_DexyCO;
GO

CREATE TABLE dbo.ddlEventLog(serverName varchar(200), postTime datetime, loginName varchar(200),
databaseName varchar(200), tsqlCommand varchar(2000));
GO

CREATE or ALTER TRIGGER triggerCreateTable
on DATABASE
FOR create_table
AS
DECLARE @data xml = eventdata();
INSERT INTO dbo.ddlEventLog([serverName], [postTime], [loginName], [databaseName], [tsqlCommand])
VALUES
(
  @data.value ('(/EVENT_INSTANCE/ServerName)[1]', 'nvarchar(200)'),
  GETDATE(),
  @data.value ('(/EVENT_INSTANCE/LoginName)[1]', 'nvarchar(200)'),
  @data.value ('(/EVENT_INSTANCE/DatabaseName)[1]', 'nvarchar(200)'),
  @data.value ('(/EVENT_INSTANCE/TSQLCommand)[1]', 'nvarchar(2000)')
);
GO

CREATE TABLE dbo.test(testID int);
GO

SELECT * FROM dbo.ddlEventLog;