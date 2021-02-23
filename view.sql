USE SQL_Projekat_DexyCO;
GO

--Ovaj view nam sluzi kako bismo videli odecu i njihovog dobavljaca
CREATE VIEW odeca_po_dobavljacu
AS 
SELECT dbo.Artikal.ime, dbo.Artikal.sifra, dbo.Dobavljac.imeDobavljaca, dbo.Odeca.boja, dbo.Odeca.velicina
FROM dbo.Artikal INNER JOIN dbo.Dobavljac ON dbo.Dobavljac.dobavljacID = dbo.Artikal.dobavljacID 
INNER JOIN dbo.Odeca ON dbo.Odeca.artikalID = dbo.Artikal.artikalID
GROUP BY dbo.Artikal.ime, dbo.Artikal.sifra, dbo.Dobavljac.imeDobavljaca, dbo.Odeca.boja, dbo.Odeca.velicina
GO

SELECT * FROM odeca_po_dobavljacu;