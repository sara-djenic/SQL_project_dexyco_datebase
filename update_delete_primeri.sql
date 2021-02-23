USE SQL_Projekat_DexyCO;
GO

UPDATE dbo.Zaposleni 
SET ime = 'Sara', prezime = 'Djenic'
WHERE zaposleniID = 1;

DELETE dbo.Zaposleni
WHERE zaposleniID = 25;

SELECT * FROM dbo.Zaposleni;