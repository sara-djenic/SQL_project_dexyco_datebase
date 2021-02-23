USE SQL_Projekat_DexyCO;
GO 

CREATE FUNCTION dbo.CenaBezPDV(@cena float)
returns float
AS
BEGIN 
RETURN @cena * 0.8;
END
GO

SELECT dbo.Artikal.ime, dbo.Artikal.sifra, dbo.CenaBezPDV(Artikal.cena) FROM Artikal;