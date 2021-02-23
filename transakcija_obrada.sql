USE SQL_Projekat_DexyCO;
GO

CREATE PROCEDURE updateCena
@artikalID int, @cena float
AS 
BEGIN TRY 
BEGIN TRANSACTION 
UPDATE dbo.Artikal 
SET cena = @cena
WHERE artikalID = @artikalID
IF @@TRANCOUNT > 0
COMMIT 
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0 
ROLLBACK
END CATCH
GO

EXEC updateCena 10, 899;
GO

SELECT * FROM dbo.Artikal;
