USE SQL_Projekat_DexyCO;
GO

INSERT dbo.Dobavljac
VALUES
('Sombotoy', 123321),
('Kids are us', 124433),
('Misko komerc', 126787),
('Piripiri', 127000),
('Robot toys', 234123),
('Medvedic komerc', 277188),
('Cipelici trade', 200700),
('Kockica', 244876),
('Zrno trade', 259082),
('Edi komerc', 392782),
('Stil', 328190),
('Fashion kids', 332178),
('Young days', 352719),
('Mini mi', 428329),
('Groovy trade', 490321),
('Kids fashion', 471235),
('Happy days', 561829),
('Kisobrancic', 512093),
('Perce komers', 5123829);

SELECT * FROM dbo.Dobavljac;

UPDATE dbo.Dobavljac SET maticniBroj = 512382 WHERE dobavljacID = 24;