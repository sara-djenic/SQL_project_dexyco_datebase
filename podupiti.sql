USE SQL_Projekat_DexyCO;
GO

--Ovim upitom pretrazujemo koji je artikal najjeftniji u prodavnici 
SELECT dbo.Artikal.ime as [Ime],dbo.Artikal.sifra as [Sifra artikla] ,dbo.Artikal.cena as [Cena]
from dbo.Artikal where dbo.Artikal.cena = (SELECT MIN(dbo.Artikal.cena) from dbo.Artikal);

--Ovim upitom pretrazujemo koji artikli imaju cenu vecu od 5000
SELECT dbo.Artikal.ime as [Ime],dbo.Artikal.sifra as [Sifra artikla] ,dbo.Artikal.cena as [Cena]
from dbo.Artikal where dbo.Artikal.artikalID in (SELECT dbo.Artikal.artikalID where dbo.Artikal.cena > 5000)

--Ovim upitom pretrazujemo sve artikle koji se nalaze u magacinu kome je popunjen kapacitet
SELECT dbo.Artikal.ime as [Ime], dbo.Artikal.sifra as [Sifra artikla] FROM dbo.Artikal
WHERE EXISTS (SELECT dbo.Magacin.adresa FROM dbo.Magacin WHERE dbo.Magacin.magacinID = dbo.Artikal.magacinID
and dbo.Magacin.kapacitet = 0);

--Ovim upitom sam sortirala sve artikle po ceni i preskocila prvih 50 kako bih videla 15 artikala koji se nalaze u sredini
--da bih istrazila koji je raspon prosecnih cena 
SELECT dbo.Artikal.Ime as [Ime], dbo.Artikal.cena as [Cena] from dbo.Artikal 
ORDER BY dbo.Artikal.cena DESC OFFSET 50 rows FETCH next 15 rows only;

--Ovaj upit koristimo kako bismo dobili informacije o dobavljacima. Ovde konkretno dobijamo sve artikle 
--gde su cene vece od prosecne cene po pojedinacnom dobavljacu
SELECT dobavljacID as [Dobavljac], ime as [Naziv artikla], cena as
[Cena artikla], sifra as [Sifra artikla] FROM dbo.Artikal as spoljasnjaTabela 
WHERE cena > (SELECT AVG(cena) FROM dbo.Artikal as unutrasnjaTabela WHERE unutrasnjaTabela.dobavljacID = spoljasnjaTabela.dobavljacID)
ORDER BY dobavljacID, cena DESC; 

