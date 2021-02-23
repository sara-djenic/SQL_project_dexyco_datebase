--KORAK 3
USE SQL_Projekat_DexyCO;
GO

--KORAK 4
BEGIN TRAN
UPDATE dbo.Magacin
SET dbo.Magacin.kapacitet = 0
WHERE dbo.Magacin.magacinID = 4;

--KORAK 6
SELECT dbo.Zaposleni.ime, dbo.Zaposleni.prezime, dbo.Zaposleni.brTelefona
FROM dbo.Zaposleni
WHERE dbo.Zaposleni.magacinID = 4;
COMMIT TRAN
GO