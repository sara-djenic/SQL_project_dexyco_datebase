USE SQL_Projekat_DexyCO;
GO

CREATE OR ALTER PROCEDURE dbo.dodajZaposlenog(@ime nvarchar(50), 
@prezime nvarchar(50), @brTelefona nvarchar(50), @magacinID int)
AS 
BEGIN TRY
INSERT INTO dbo.Zaposleni(ime, prezime, brTelefona, magacinID)
VALUES
(@ime, @prezime, @brTelefona, @magacinID)
END TRY
BEGIN CATCH
EXEC ErrorHandler
END CATCH
GO

CREATE OR ALTER PROCEDURE dbo.updateZaposlenog(@zaposleniID int, @ime nvarchar(50), 
@prezime nvarchar(50), @brTelefona nvarchar(50), @magacinID int)
AS 
BEGIN TRY
UPDATE dbo.Zaposleni
SET 
ime = @ime,
prezime = @prezime,
brTelefona = @brTelefona,
magacinID = @magacinID
WHERE zaposleniID = @zaposleniID
END TRY
BEGIN CATCH
EXEC ErrorHandler
END CATCH
GO

CREATE OR ALTER PROCEDURE dbo.ObrisiZaposlenog(@zaposleniID int)
AS 
BEGIN TRY
DELETE FROM dbo.Zaposleni 
WHERE zaposleniID = @zaposleniID
END TRY
BEGIN CATCH
EXEC ErrorHandler
END CATCH
GO

EXEC dbo.ObrisiZaposlenog 10;
EXEC dbo.dodajZaposlenog 'Marko', 'Markic', '511111', 3;
EXEC dbo.updateZaposlenog 52, 'Nikola', 'Nikolic', '500111', 4;
SELECT * FROM dbo.Zaposleni;