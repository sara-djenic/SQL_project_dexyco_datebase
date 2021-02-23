--KORAK 1 
USE SQL_Projekat_DexyCO;
GO

--KORAK 2
BEGIN TRAN
UPDATE dbo.Zaposleni
SET dbo.Zaposleni.brTelefona = '555555'
WHERE dbo.Zaposleni.magacinID = 4;

--KORAK 5
SELECT dbo.Magacin.magacinID, dbo.Magacin.kapacitet, dbo.Magacin.adresa
FROM dbo.Magacin
WHERE dbo.Magacin.magacinID = 4;
COMMIT TRAN
GO