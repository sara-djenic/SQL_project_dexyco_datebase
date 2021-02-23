USE SQL_Projekat_DexyCO;
GO

DECLARE @idoc int, @doc varchar(1000);
SET @doc = '
<Zaposleni>
  <Zaposlen>
    <zaposleniID>1</zaposleniID>
    <ime>Danilo</ime>
    <prezime>Misic</prezime>
    <brTelefona>523546</brTelefona>
  </Zaposlen>
  <Zaposlen>
    <zaposleniID>2</zaposleniID>
    <ime>Ivan</ime>
    <prezime>Ivanovic</prezime>
    <brTelefona>534278</brTelefona>
  </Zaposlen>
  <Zaposlen>
    <zaposleniID>3</zaposleniID>
    <ime>Marko</ime>
    <prezime>Markovic</prezime>
    <brTelefona>578912</brTelefona>
  </Zaposlen>
  <Zaposlen>
    <zaposleniID>4</zaposleniID>
    <ime>Ilija</ime>
    <prezime>Ilic</prezime>
    <brTelefona>512367</brTelefona>
  </Zaposlen>
  <Zaposlen>
    <zaposleniID>5</zaposleniID>
    <ime>Mina</ime>
    <prezime>Minic</prezime>
    <brTelefona>598761</brTelefona>
  </Zaposlen>
</Zaposleni>
';

EXEC sp_xml_preparedocument @idoc output, @doc;

SELECT * FROM openxml(@idoc, '/Zaposleni/Zaposlen' , 1)
WITH
(zaposleniID int 'zaposleniID', ime nvarchar(50) 'ime', prezime nvarchar(50) 'prezime', brTelefona nvarchar(50) 'brTelefona');