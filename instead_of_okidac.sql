USE SQL_Projekat_DexyCO;
GO

CREATE TABLE dbo.DobavljacLog(dobavljacID int, imeDobavljaca nvarchar(50), maticniBroj int,
logAction nvarchar(100), logTime datetime);
GO

CREATE OR ALTER TRIGGER dbo.insteadOfUpdate 
ON dbo.Dobavljac
INSTEAD OF UPDATE 
AS 
DECLARE 
@dobavljacID int, @imeDobavljaca nvarchar(50), @maticniBroj int, @logAction nvarchar(100);
SELECT @dobavljacID = i.dobavljacID FROM inserted i;
SELECT @imeDobavljaca = i.imeDobavljaca FROM inserted i;
SELECT @maticniBroj = i.maticniBroj FROM inserted i;
SET @logAction = 'Insertovana stavka';
BEGIN 
BEGIN TRAN 
IF(@maticniBroj <= 100000)
BEGIN 
RAISERROR('Maticni broj mora biti veci od 100000', 16, 1);
ROLLBACK; 
END
ELSE BEGIN 
INSERT INTO dbo.DobavljacLog(dobavljacID, imeDobavljaca, maticniBroj, logAction, logTime)
VALUES 
(@dobavljacID, @imeDobavljaca, @maticniBroj, @logAction, GETDATE());
COMMIT;
PRINT 'Stavka je update-ovana';
END
END

UPDATE dbo.Dobavljac SET maticniBroj = '119000' where dobavljacID = 10;

SELECT * FROM dbo.DobavljacLog;

