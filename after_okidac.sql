USE SQL_Projekat_DexyCO;
GO

CREATE TRIGGER dbo.insertArtikal
ON dbo.Artikal
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
IF EXISTS( SELECT * FROM inserted AS i
WHERE 
i.polID NOT BETWEEN 1 and 3 or 
i.uzrastID  NOT BETWEEN 1 and 4 or 
i.magacinID NOT BETWEEN 1 and 6 or 
i.dobavljacID NOT BETWEEN 1 and 25 or
i.cena < 0 )
BEGIN 
PRINT 'Niste uneli validne podatke';
IF @@TRANCOUNT > 0 
ROLLBACK TRANSACTION;
END; 
END;
GO

INSERT dbo.Artikal(ime, cena, imeBrenda, sifra, magacinID, polID, uzrastID, dobavljacID)
VALUES
('abc', -299, 'barbi', 'BSA1314', 1, 2, 3, 6)