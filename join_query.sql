USE SQL_Projekat_DexyCO;
GO

--Ovaj upit se koristi kako bismo nasli broj radnika koji rade u magacinu sa punim kapacitetom
--kako bismo potencijalno povecali broj radnika
SELECT dbo.Zaposleni.ime, dbo.Zaposleni.prezime, dbo.Magacin.adresa, dbo.Magacin.kapacitet
FROM dbo.Zaposleni INNER JOIN dbo.Magacin ON dbo.Magacin.magacinID = dbo.Zaposleni.magacinID
WHERE dbo.Magacin.kapacitet = 0;

--Ovaj upit se koristi kako bismo pretrazili svu odecu koja je za letnju sezonu
SELECT dbo.Artikal.ime, dbo.Artikal.sifra, dbo.TipOdece.sezona, dbo.Odeca.boja
FROM dbo.Odeca INNER JOIN dbo.Artikal ON dbo.Odeca.artikalID = dbo.Artikal.artikalID 
INNER JOIN dbo.TipOdece ON dbo.TipOdece.tipOdeceID = dbo.Odeca.tipOdeceID
WHERE dbo.TipOdece.sezona = 'leto';

--Ovaj upit se koristi kako bismo pretrazili sve igracke za decake
SELECT dbo.Artikal.ime, dbo.Artikal.cena, dbo.Pol.nazivPola
FROM dbo.Artikal INNER JOIN dbo.Pol ON dbo.Artikal.polID = dbo.Pol.polID
INNER JOIN dbo.Igracke ON dbo.Artikal.artikalID = dbo.Igracke.artikalID
WHERE dbo.Pol.polID = 2;

--Ovaj upit se koristi kako bismo pretrazili artikle sa njihovim dobavljacima, gde je cena artikla
--manja od 1500 dinara
SELECT dbo.Artikal.sifra, dbo.Artikal.ime, dbo.Artikal.imeBrenda, dbo.Dobavljac.imeDobavljaca, dbo.Artikal.cena
FROM dbo.Dobavljac INNER JOIN dbo.Artikal ON dbo.Dobavljac.dobavljacID = dbo.Artikal.dobavljacID
GROUP BY dbo.Artikal.sifra, dbo.Artikal.ime, dbo.Artikal.imeBrenda, dbo.Dobavljac.imeDobavljaca , dbo.Artikal.cena
HAVING dbo.Artikal.cena < 1500;

--Ovaj upit se koristi kako bismo pretrazili artikle koji su odeca i roze su boje
SELECT dbo.Artikal.ime, dbo.Odeca.boja
FROM dbo.Artikal INNER JOIN dbo.Odeca ON dbo.Artikal.artikalID = dbo.Odeca.artikalID
WHERE dbo.Odeca.boja = 'roze';

--OVaj upit se koristi kako bismo pretrazili artikle za decu stariju od 8 godina
SELECT dbo.Artikal.sifra, dbo.Artikal.ime, dbo.Uzrast.uzrast
FROM dbo.Artikal INNER JOIN dbo.Uzrast ON dbo.Artikal.uzrastID = dbo.Uzrast.uzrastID
WHERE dbo.Uzrast.uzrastID = 4;

--Ovaj upit se koristi kako bismo pretrazili artikle koji su odeca sa njihovom velicinom i magacin u kome se nalaze
SELECT dbo.Artikal.ime, dbo.Magacin.adresa, dbo.Odeca.velicina
FROM dbo.Artikal INNER JOIN dbo.Magacin ON dbo.Magacin.magacinID = dbo.Artikal.magacinID
INNER JOIN dbo.Odeca ON dbo.Odeca.artikalID = dbo.Artikal.artikalID;

--Ovaj upit se koristi kako bismo pretrazili artikle koji su igracka i njihov materijal kao i njihovog dobavljaca
SELECT dbo.Artikal.ime, dbo.Dobavljac.imeDobavljaca, dbo.Igracke.materijal
FROM dbo.Artikal INNER JOIN dbo.Dobavljac ON dbo.Dobavljac.dobavljacID = dbo.Artikal.dobavljacID 
INNER JOIN dbo.Igracke ON dbo.Igracke.artikalID = dbo.Artikal.artikalID;

--Ovaj upit se koristi kako bismo pretrazili artikle koji su i za decake i za devojcice, ali i uzrast za koji su
SELECT dbo.Artikal.sifra, dbo.Artikal.ime, dbo.Pol.nazivPola, dbo.Uzrast.uzrast
FROM dbo.Artikal INNER JOIN dbo.Pol ON dbo.Pol.polID = dbo.Artikal.polID 
INNER JOIN dbo.Uzrast ON dbo.Uzrast.uzrastID = dbo.Artikal.uzrastID
WHERE dbo.Pol.nazivPola = 'univerzalno';

--Ovaj upit se koristi kako bismo pretrazili artikle koji su za bebe
SELECT dbo.Artikal.ime, dbo.Odeca.velicina, dbo.Uzrast.uzrast
FROM dbo.Artikal INNER JOIN dbo.Odeca ON dbo.Odeca.artikalID = dbo.Artikal.artikalID
INNER JOIN dbo.Uzrast ON dbo.Uzrast.uzrastID = dbo.Artikal.uzrastID
WHERE dbo.Uzrast.uzrastID = 1;

--Ovaj upit se koristi kako bismo videli da li postoji dobavljac bez robe
SELECT dbo.Artikal.Ime, dbo.Artikal.Cena, dbo.Artikal.Sifra, dbo.Dobavljac.imeDobavljaca FROM dbo.Artikal
RIGHT JOIN dbo.Dobavljac ON dbo.Artikal.DobavljacID = dbo.Dobavljac.DobavljacID;