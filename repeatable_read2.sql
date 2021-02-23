--KORAK 3
USE SQL_Projekat_DexyCO;
GO

--KORAK 4
UPDATE dbo.Magacin 
SET dbo.Magacin.kapacitet = 0
WHERE dbo.Magacin.magacinID = 5;
