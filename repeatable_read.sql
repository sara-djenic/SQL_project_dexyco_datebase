--KORAK 1
USE SQL_Projekat_DexyCO;
GO

--KORAK 2
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRAN 
SELECT dbo.Magacin.adresa, dbo.Magacin.kapacitet FROM dbo.Magacin
WHERE dbo.Magacin.magacinID = 5;

--KORAK 5
SELECT dbo.Magacin.adresa, dbo.Magacin.kapacitet FROM dbo.Magacin
WHERE dbo.Magacin.magacinID = 5;
COMMIT TRAN