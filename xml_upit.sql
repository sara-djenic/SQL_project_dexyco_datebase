USE SQL_Projekat_DexyCO;
GO

SELECT dbo.Zaposleni.zaposleniID, dbo.Zaposleni.ime, dbo.Zaposleni.prezime, dbo.Zaposleni.brTelefona
FROM dbo.Zaposleni
FOR XML PATH('Zaposlen'), 
ROOT ('Zaposleni');