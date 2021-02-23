USE SQL_Projekat_DexyCO;
GO

CREATE TABLE dbo.errorLog(
	ErrorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ErrorTime datetime NOT NULL DEFAULT (GETDATE()),
    ErrorNumber int NOT NULL,
    ErrorSeverity int NOT NULL,
    ErrorState int NULL,
    ErrorProcedure nvarchar(126) NULL,
    ErrorLine int NULL,
    ErrorMessage nvarchar(1000) NULL,
    UserName nvarchar(50) NULL DEFAULT (SUSER_NAME()),
    Resolved bit NULL)
GO

CREATE OR ALTER PROCEDURE dbo.ErrorHandler
AS
BEGIN
BEGIN TRY
INSERT INTO dbo.ErrorLog
(ErrorNumber, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, ErrorMessage)
VALUES
(
    ERROR_NUMBER(),
    ERROR_SEVERITY(),
    ERROR_STATE(),
    ERROR_PROCEDURE(),
    ERROR_LINE(),
    ERROR_MESSAGE()

)
END TRY
BEGIN CATCH
PRINT 'Greska pri unosu u dbo.ErrorLog';
END CATCH
END;

