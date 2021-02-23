USE SQL_Projekat_DexyCO;
GO

CREATE FUNCTION dbo.ArtikliPoDobavljacu(@dobavljacID int)
RETURNS TABLE
AS
RETURN 
(SELECT dbo.Artikal.ime, dbo.Artikal.sifra, dbo.Artikal.dobavljacID FROM dbo.Artikal 
WHERE dbo.Artikal.dobavljacID = @dobavljacID);
GO

SELECT * FROM dbo.ArtikliPoDobavljacu(7);