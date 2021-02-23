USE SQL_Projekat_DexyCO;
GO

CREATE OR ALTER PROCEDURE ArtikalPading
(
 @brojstrane int = 1,
 @brojlinija int = 9
)
AS
BEGIN DECLARE @preskociti int = (@brojstrane - 1) * @brojlinija
SELECT * FROM Artikal
ORDER BY artikalID
OFFSET @preskociti ROW FETCH FIRST @brojlinija ROWS ONLY
END;
GO
EXEC ArtikalPading 2, 10