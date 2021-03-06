USE [master]
GO

/****** Object:  Database [SQL_Projekat_DexyCO]    Script Date: 21-Feb-21 6:21:59 PM ******/
CREATE DATABASE [SQL_Projekat_DexyCO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL_Projekat_DexyCO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL_Projekat_DexyCO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQL_Projekat_DexyCO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQL_Projekat_DexyCO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL_Projekat_DexyCO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ARITHABORT OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET  DISABLE_BROKER 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET RECOVERY FULL 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET  MULTI_USER 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET QUERY_STORE = OFF
GO

ALTER DATABASE [SQL_Projekat_DexyCO] SET  READ_WRITE 
GO

USE [SQL_Projekat_DexyCO]
GO
/****** Object:  Table [dbo].[ddlEventLog]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ddlEventLog](
	[serverName] [varchar](200) NULL,
	[postTime] [datetime] NULL,
	[loginName] [varchar](200) NULL,
	[databaseName] [varchar](200) NULL,
	[tsqlCommand] [varchar](2000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dobavljac]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dobavljac](
	[dobavljacID] [int] IDENTITY(1,1) NOT NULL,
	[imeDobavljaca] [nvarchar](50) NOT NULL,
	[maticniBroj] [int] NOT NULL,
 CONSTRAINT [PK_Dobavljac] PRIMARY KEY CLUSTERED 
(
	[dobavljacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DobavljacLog]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DobavljacLog](
	[dobavljacID] [int] NULL,
	[imeDobavljaca] [nvarchar](50) NULL,
	[maticniBroj] [int] NULL,
	[logAction] [nvarchar](100) NULL,
	[logTime] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[errorLog]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[errorLog](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NOT NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](126) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessage] [nvarchar](1000) NULL,
	[UserName] [nvarchar](50) NULL,
	[Resolved] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Magacin]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Magacin](
	[magacinID] [int] IDENTITY(1,1) NOT NULL,
	[adresa] [nvarchar](50) NULL,
	[kapacitet] [bit] NOT NULL,
 CONSTRAINT [PK_Magacin] PRIMARY KEY CLUSTERED 
(
	[magacinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Pol]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pol](
	[polID] [int] IDENTITY(1,1) NOT NULL,
	[nazivPola] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pol] PRIMARY KEY CLUSTERED 
(
	[polID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[testID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tip]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tip](
	[tipID] [int] IDENTITY(1,1) NOT NULL,
	[nazivTipa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tip] PRIMARY KEY CLUSTERED 
(
	[tipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIpIgracke]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIpIgracke](
	[tipID] [int] IDENTITY(1,1) NOT NULL,
	[nazivTipa] [nvarchar](50) NOT NULL,
	[zaDveiliVise] [bit] NOT NULL,
 CONSTRAINT [PK_TIpIgracke] PRIMARY KEY CLUSTERED 
(
	[tipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipOdece]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipOdece](
	[tipOdeceID] [int] IDENTITY(1,1) NOT NULL,
	[nazivTipa] [nvarchar](50) NOT NULL,
	[sezona] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipOdece] PRIMARY KEY CLUSTERED 
(
	[tipOdeceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uzrast]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzrast](
	[uzrastID] [int] IDENTITY(1,1) NOT NULL,
	[uzrast] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Uzrast] PRIMARY KEY CLUSTERED 
(
	[uzrastID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artikal]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artikal](
	[artikalID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[cena] [float] NOT NULL,
	[imeBrenda] [nvarchar](50) NOT NULL,
	[sifra] [nvarchar](50) NOT NULL,
	[magacinID] [int] NOT NULL,
	[polID] [int] NOT NULL,
	[uzrastID] [int] NOT NULL,
	[dobavljacID] [int] NOT NULL,
 CONSTRAINT [PK_Artikal] PRIMARY KEY CLUSTERED
(
	[artikalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Igracke]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Igracke](
	[igrackaID] [int] IDENTITY(1,1) NOT NULL,
	[materijal] [nvarchar](50) NOT NULL,
	[kutija] [bit] NOT NULL,
	[artikalID] [int] NOT NULL,
	[tipID] [int] NOT NULL,
 CONSTRAINT [PK_Igracke] PRIMARY KEY CLUSTERED
(
	[igrackaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odeca]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odeca](
	[odecaID] [int] IDENTITY(1,1) NOT NULL,
	[velicina] [nvarchar](50) NOT NULL,
	[boja] [nvarchar](50) NOT NULL,
	[artikalID] [int] NOT NULL,
	[tipOdeceID] [int] NOT NULL,
 CONSTRAINT [PK_Odeca] PRIMARY KEY CLUSTERED
(
	[odecaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zaposleni]    Script Date: 21-Feb-21 6:20:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zaposleni](
	[zaposleniID] [int] IDENTITY(1,1) NOT NULL,
	[ime] [nvarchar](50) NOT NULL,
	[prezime] [nvarchar](50) NOT NULL,
	[brTelefona] [nvarchar](50) NOT NULL,
	[magacinID] [int] NOT NULL,
 CONSTRAINT [PK_Zaposleni] PRIMARY KEY CLUSTERED 
(
	[zaposleniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[errorLog] ADD  DEFAULT (getdate()) FOR [ErrorTime]
GO
ALTER TABLE [dbo].[errorLog] ADD  DEFAULT (suser_name()) FOR [UserName]
GO
ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Dobavljac] FOREIGN KEY([dobavljacID])
REFERENCES [dbo].[Dobavljac] ([dobavljacID])
GO
ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Dobavljac]
GO
ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Magacin] FOREIGN KEY([magacinID])
REFERENCES [dbo].[Magacin] ([magacinID])
GO
ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Magacin]
GO
ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Pol] FOREIGN KEY([polID])
REFERENCES [dbo].[Pol] ([polID])
GO
ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Pol]
GO
ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Uzrast] FOREIGN KEY([uzrastID])
REFERENCES [dbo].[Uzrast] ([uzrastID])
GO
ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Uzrast]
GO
ALTER TABLE [dbo].[Igracke]  WITH CHECK ADD  CONSTRAINT [FK_Igracke_Artikal] FOREIGN KEY([artikalID])
REFERENCES [dbo].[Artikal] ([artikalID])
GO
ALTER TABLE [dbo].[Igracke] CHECK CONSTRAINT [FK_Igracke_Artikal]
GO
ALTER TABLE [dbo].[Igracke]  WITH CHECK ADD  CONSTRAINT [FK_Igracke_TIpIgracke] FOREIGN KEY([tipID])
REFERENCES [dbo].[TIpIgracke] ([tipID])
GO
ALTER TABLE [dbo].[Igracke] CHECK CONSTRAINT [FK_Igracke_TIpIgracke]
GO
ALTER TABLE [dbo].[Odeca]  WITH CHECK ADD  CONSTRAINT [FK_Odeca_Artikal] FOREIGN KEY([artikalID])
REFERENCES [dbo].[Artikal] ([artikalID])
GO
ALTER TABLE [dbo].[Odeca] CHECK CONSTRAINT [FK_Odeca_Artikal]
GO
ALTER TABLE [dbo].[Odeca]  WITH CHECK ADD  CONSTRAINT [FK_Odeca_TipOdece] FOREIGN KEY([tipOdeceID])
REFERENCES [dbo].[TipOdece] ([tipOdeceID])
GO
ALTER TABLE [dbo].[Odeca] CHECK CONSTRAINT [FK_Odeca_TipOdece]
GO
ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [FK_Zaposleni_Magacin] FOREIGN KEY([magacinID])
REFERENCES [dbo].[Magacin] ([magacinID])
GO
ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [FK_Zaposleni_Magacin]
GO

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
('Perce komers', 512382),
('Mystery toys', 900023),
('Mandale', 700001),
('Enderove igracke', 700012),
('Pokloncic', 700013),
('Caprice toys', 800014),
('Bukvar', 900015),
('Zvezdica', 900016);


INSERT dbo.Magacin
VALUES
('Veljka Dugosevica 16', 1),
('Jovana Ducica 1', 1),
('Nikole Tesle 110', 1),
('Desanke Maksimovic 27', 1),
('Trudbenicka bb', 1),
('Partizanska 57', 0);

INSERT dbo.Pol
VALUES
('devojcice'),
('decaci'),
('univerzalno');


INSERT dbo.TipOdece
VALUES
('majice', 'leto'),
('kupaci kostimi', 'leto'),
('duksevi', 'zima'),
('kosulje', 'leto'),
('dzemperi', 'zima'),
('trenerke', 'kombinovano'),
('pantalone', 'kombinovano'),
('prsluci', 'kombinovano'),
('kompleti', 'kombinovano'),
('jakne', 'zima'),
('ves', 'kombinovano'),
('accessories', 'kombinovano'),
('odeca za bebe', 'kombinovano'),
('blukids obuca', 'kombinovano'),
('helanke', 'zima'),
('suknje', 'leto'),
('haljine', 'leto'),
('bolero', 'zima'),
('ski odela', 'zima'),
('ninia obuca', 'kombinovano'),
('hulakopke', 'zima'),
('kombinezon', 'leto');

INSERT dbo.Uzrast
VALUES
('0-12 meseci'),
('1-3 godine'),
('4-8 godina'),
('8+ godina');

INSERT dbo.TIpIgracke
VALUES
('figure i setovi', 1),
('kocke', 1),
('vozila, garaze i setovi', 1),
('drustvene igre i puzle', 1),
('makete i dodaci', 1),
('edukativne igracke', 1),
('kreativne setovi', 1),
('kostimi i maske', 0),
('posudje, bela tehnika i kuhinja', 1),
('sport', 1),
('zivotinje i setovi', 1),
('igracke za bebe', 0),
('lutke, setovi, dodaci i oprema', 1),
('bicikli, trotineti, tricikli i guralice', 0),
('setovi za igru', 1),
('igracke za dvoriste', 1),
('muzicki instrumenti', 0),
('drvene igracke', 1),
('plisane igracke', 0),
('igracke za plazu', 1),
('lego kocke', 1),
('elektronske igracke i dodaci', 1);

INSERT dbo.Artikal
VALUES

('lanard-jurassic', 1499, 'lanard', 'PR22896', 2, 2, 3, 6),
('beyblade cross collision', 8499, 'beyblade', 'E5565', 4, 2, 4, 7),
('fortnite squad set', 2699, 'fortnite', 'ME63521', 3, 3, 4, 8),
('fisher price kocke', 2399, 'fisher price','ORFFC84', 3, 3, 1, 9),
('clementoni auto', 2399, 'clemmy kocke', 'CL17315', 4, 3, 2, 10),
('clementoni kocke ben ten', 989, 'clementoni', 'TPCL41188', 6, 2, 3, 11),
('revell quadcopter go video', 8299, 'revell', 'RV23858', 5, 2, 4, 12),
('best luck cross auto', 2399, 'best luck', 'BE808237', 5, 2, 3, 13),
('revell quadcopter x-fly', 10999, 'revell', 'RV23845', 1, 2, 4, 14),
('baby shark podne puzle', 849, 'baby shark', 'SN6054915', 1, 3, 3, 15),
('drustvena igra game of life', 4499, 'mb igre', 'E4304', 3, 3, 4, 16),
('frozen 2 3d puzzle set', 2299, 'frozen', 'SN6053088', 3, 1, 3, 17),
('best luck avion', 1449, 'best luck', 'BE609751', 4, 2, 3, 18),
('best luck avion 1:160', 1499, 'best luck', 'BE609250', 5, 2, 3, 19),
('best luck avion airbus', 679, 'best luck', 'BE132902', 5, 2, 3, 20),
('milla toys bebi telefon', 949, 'milla toys', 'MILEN12', 1, 3, 1, 21),
('milla toys deciji tablet', 1829, 'milla toys', 'MILEN11', 1, 3, 3, 22),
('owleez interaktivna sovica', 3899, 'spin master', 'SN6046148', 1, 1, 3, 23),
('2 u 1 tabla za crtanje', 3149, 'best luck', 'BE338183', 4, 3, 3, 6),
('as company art set mini', 289, 'ostalo', 'VAS62073', 4, 1, 3, 7),
('as company giga block', 1139, 'cars', 'VAS27041', 3, 3, 3, 8),
('monkart transformers robot', 2829, 'monkart', 'VMK0031', 3, 2, 3, 9),
('monkart transformers moncha', 2829, 'monkart', 'VMK00048', 5, 2, 3, 10),
('monkart transformers vasper', 2829, 'monkart', 'VMK00093', 5, 2, 3, 11),
('ariel kostim', 2099, 'disney princess', 'RU8887875', 4, 1, 4, 12),
('bumblebee', 3599, 'transformer', 'RU36427', 4, 2, 3, 13),
('doc mcstuffins kostim', 3499, 'ostalo', 'RU610288', 1, 1, 3, 14),
('stor frozen set', 899, 'frozen', 'SR86871', 2, 1, 3, 15),
('stor easy super wings', 139, 'super wings', 'SR24607', 2, 3, 3, 16),
('stor easy star wars', 149, 'star wars', 'SR82406', 1, 2, 3, 17),
('avengers lopta', 359, 'avengers', 'UN25410', 3, 2, 3, 18),
('basketball set', 3349, 'best luck', 'BE77409', 3, 2, 3, 19),
('basso luigi konopac', 239, 'basso luigi', 'VBL12202', 1, 3, 3, 20),
('best luck dinosaurus', 4999, 'best luck', 'BE259037', 2, 3, 3, 21),
('lumiluvs ljubimci', 1729, 'lumiluvs', 'IZLB020A1', 2, 3, 2, 22),
('best luck dino kofercic', 2999, 'best luck', 'BE66630', 5, 3, 3, 23),
('clementoni muzicko slonce', 2999, 'clementoni baby', 'CL50536', 3, 3, 2, 6),
('avent igracka seal', 2549, 'avent', 'AVSCF348', 6, 3, 1, 7),
('baby mix gimnastika', 4999, 'ostalo', 'KP6450035', 3, 3, 2, 8),
('luna jednorog', 5599, 'luna jednorog', 'DI2003', 4, 1, 2, 9),
('ba shimmer sirena', 3899, 'baby alive', 'E3692', 4, 1, 3, 10),
('baby alive beba', 3999, 'baby alive', 'E2617', 6, 1, 3, 11),
('auto herby na pedale', 6299, 'ostalo', 'BK1917105', 5, 3, 3, 12),
('basso luigi guralica', 519, 'basso luigi', 'VBL15807', 2, 3, 2, 13),
('bicikl hello girl', 10999, 'bicikli go kiddy', 'OZ16302', 2, 1, 3, 14),
('4 in 1 rostilj set', 1899, 'best luck', 'BE677884', 6, 3, 3, 15),
('akcija reakcija efekat haosa', 3699, 'clementoni', 'CL61730', 2, 2, 3, 16),
('alat set kofer', 1290, 'ostalo', 'BK204103', 3, 2, 3, 17),
('little tikes 3 u 1 sp centar', 9999, 'little tikes', 'LT643224', 5, 3, 2, 18),
('little tikes kucica za igru', 54999, 'little tikes', 'LT444', 2, 3, 3, 19),
('ljuljaska', 5339, 'ostalo', 'PR2881R', 1, 3, 3, 20),
('best luck gitara', 1469, 'best luck', 'BE924002', 1, 3, 3, 21),
('comic online klavir', 7999, 'comic games', 'PC980572', 2, 3, 3, 22),
('moye electronic bubnjevi', 6999, 'moye', 'PC602533', 4, 3, 3, 23),
('ecolino dinosaurus', 3339, 'pika pau', 'ECO002', 3, 3, 3, 6),
('ecolino igra iks oks', 659, 'pika pau', 'ECO022', 5, 3, 3, 7),
('drv rolerkos', 1299, 'ostalo', 'BK159231', 5, 3, 3, 8),
('adora plisana kravica', 2399, 'adora', 'VAD00162', 5, 3, 2, 9),
('cozy dozy meda', 3999, 'little live pets', 'ME28847', 1, 1, 3, 10),
('adora plisana kuca zvecka', 1459, 'adora', 'VAD88234', 2, 3, 1, 11),
('dema stil kofica', 279, 'dema stil', 'VDS01820', 5, 3, 3, 12),
('aqua gear stit', 2199, 'eolo', 'EL709103', 6, 3, 3, 13),
('avengers surf daska', 1699, 'avengers', 'MN16306',3, 3, 3, 14),
('lego architecture shanghai', 6719, 'lego', 'LE21039', 4, 3, 4, 15),
('lego art star wars', 16999, 'lego', 'LE31200', 4, 3, 4, 16),
('lego city mountain arrest', 7399, 'lego', 'LE41438', 1, 2, 3, 17),
--ODECA
('blukids majica', 589, 'blukids', '005536392', 2, 2, 4, 18),
('cool club majica', 599, 'cool club', 'CCG2019436', 2, 1, 2, 19),
('blukids majica', 729, 'blukids', '005533736', 1, 1, 1, 20 ),
('blukids kupaci', 1169, 'blukids', '005529519', 3, 1, 4, 21),
('cool club kupaci', 699, 'cool club', 'CCG2019216', 3, 1, 3, 22),
('cool club kupaci dvodelni', 899, 'cool club', 'CCG2019215', 1, 1, 3, 23),
('blukids duks', 1489, 'blukids', '005614436', 4, 2, 3, 6),
('nike duks air', 3059, 'nike', '36G715A54', 4, 1, 2, 7),
('cool club duks', 959, 'cool club', 'CCG2110071', 5, 1, 3, 8),
('cool club kosulja', 1609, 'cool club', 'CjB2017770', 5, 2, 2, 9),
('blukids kosulja', 1639, 'blukids', '005491836', 4, 2, 1, 10),
('idexe kosulja', 919, 'idexe', '500200096', 3, 2, 1, 11),
('blukids dzemper', 2009, 'blukids', '005596861', 5, 1, 4, 12),
('idexe dzemper', 1359, 'idexe', '367480095', 5, 1, 1, 13),
('original marines dzemper', 1169, 'original marines', 'AVAV3534', 5, 1, 4, 14),
('bi baby trenerka', 1179, 'bi baby', 'BB59617', 6, 2, 1, 15),
('blukids donji deo trenerke', 399, 'blukids', '005491', 6, 1, 2, 16),
('blukids komplet trenerka', 1589, 'blukids', '0055976', 4, 1, 2, 17),
('blukids farmerke', 1139, 'blukids', '00563127', 5, 2, 1, 18),
('blukids donji deo', 1589, 'blukids', '00540244', 6, 2, 3, 19),
('blukids pantalone', 709, 'blukids', '005433934', 6, 1, 2, 20),
('blukids kombinezon sareni', 1449, 'blukids', '0032414', 2, 1, 4, 21),
('blukids kombinezon beli', 1589, 'blukids', '006327841', 3, 2, 2, 22),
('blukids kombinezon crni', 2639, 'blukids', '00732821', 2, 1, 4, 23),
('cool club prsluk', 739, 'cool club', 'CCB17037', 4, 2, 2, 6),
('idexe prsluk', 679, 'idexe', '58003009Z', 5, 2, 1, 7),
('original marines prsluk', 2209, 'original marines', 'AZA14256643', 6, 1, 2, 8),
('bi baby komplet', 799, 'bi baby', 'BB57482', 4, 3, 2, 9),
('bi baby set 2 komada', 2629, 'bi baby', 'BB43812', 3, 1, 2, 10),
('bi baby set 3 komada', 969, 'bi baby', 'BB291722', 3, 3, 1, 11),
('blukids jakna', 2199, 'blukids', '002347271', 6, 1, 2, 12),
('idexe sako', 1159, 'idexe', '9816263523', 3, 2, 2, 13),
('idexe jakna', 1899, 'idexe', '981672361', 5, 2, 2, 14),
('cool club aktivni ves', 839, 'cool club', 'CUB19278', 4, 2, 4, 15),
('icepeak termo ves', 2519, 'icepeak', '3629142', 6, 3, 4, 16),
('blukids bademantil', 1979, 'blukids', '0052842361', 2, 2, 4, 17),
('apollo kabanica', 1139, 'eurasia', 'AL99255', 1, 1, 3, 18),
('bi baby cebence', 1259, 'bi baby', 'BB64491', 2, 3, 2, 19),
('blukids aksesoar', 869, 'blukids', '00278361', 3, 2, 4, 20),
('bi baby zeka', 509, 'bi baby', 'BB24712601', 4, 1, 1, 21),
('bi baby bodi', 349, 'bi baby', 'BB1826748', 5, 3, 1, 22),
('idexe zeka', 1159, 'idexe', '345729912', 6, 2, 1, 23),
('blukids obuca', 1329, 'blukids', '005490520', 6, 1, 1, 6),
('cool club bebi obuca', 499, 'cool club', 'CAG1906210', 5, 1, 1, 7),
('blukids cipele', 1139, 'blukids', '005565704', 4, 2, 1, 8),
('blukids helanke', 1019, 'blukids', '005490311', 2, 1, 2, 9),
('cool club helanke', 699, 'cool club', 'CCG2017893', 3, 1, 3, 10),
('nike helanke', 1979, 'nike', 'CU8337654', 3, 1, 4, 11),
('blukids suknja', 1169, 'blukids', '005559797', 2, 1, 3, 12),
('cool club suknja', 1319, 'cool club', 'CCG21112526', 2, 1, 3, 13),
('idexe suknja', 989, 'idexe', '352900094', 6, 1, 3, 14),
('blukids haljina', 1589, 'blukids', '005569001', 4, 1, 2, 15),
('cool club haljina', 1259, 'cool club', 'CCG2008274', 3, 1, 2, 16),
('original marines haljina', 2279, 'original marines', 'AZA3671119', 5, 1, 4, 17),
('cool club bolero', 1779, 'cool club', 'CCG2019475', 4, 1, 3, 18),
('blukids bolero', 1409, 'blukids', '005401205', 5, 1, 3, 19),
('idexe bolero', 1119, 'idexe', '36758001', 6, 1, 1, 20),
('bi baby skafander', 2929, 'bi baby', 'BB60413', 6, 1, 1, 21),
('icepeak jakna', 8999, 'icepeak', '65006821', 3, 1, 4, 22),
('icepeak potkapa', 1799, 'icepeak', '65283181', 4, 3, 4, 23),
('ninia cipele', 1499, 'ninia', 'NN314431', 5, 1, 1, 6),
('ninia patike', 799, 'ninia', 'NN7263133', 2, 2, 1, 7),
('ninia cizme', 2199, 'ninia', 'NN2377192', 3, 1, 2, 8),
('blukids hulahopke', 439, 'blukids', '005465164', 1, 3, 2, 9),
('cool club hulahopke', 489, 'cool club', 'CHG2017441', 2, 1, 3, 10),
('cool club hulahopke 2 pak', 839, 'cool club', 'CHG2101423', 4, 1, 2, 11);

INSERT dbo.Igracke
VALUES
--materijal, kutija, artikalID 1-66, tipID
('plastika', 1, 1, 1),
('plastika', 1, 2, 1),
('plastika', 1, 3, 1),
('guma', 1, 4, 2),
('plastika', 1, 5, 2),
('plastika', 1, 6, 2),
('plastika', 1, 7, 3),
('plastika', 1, 8, 3),
('plastika', 1, 9, 3),
('stiropor', 1, 10, 4),
('karton', 1, 11, 4),
('karton', 1, 12, 4),
('plastika', 1, 13, 5),
('plastika', 1, 14, 5),
('plastika', 1, 15, 5),
('plastika', 0, 16, 6),
('plastika', 0, 17, 6),
('plastika', 1, 18, 6),
('plastika', 1, 19, 7),
('plastika', 1, 20, 7),
('plastika', 1, 21, 7),
('metal', 1, 22, 22),
('metal', 1, 23, 22),
('metal', 1, 24, 22),
('platno', 1, 25, 8),
('platno', 1, 26, 8),
('platno', 1, 27, 8),
('plastika', 1, 28, 9),
('plastika', 0, 29, 9),
('plastika', 0, 30, 9),
('guma', 0, 31, 10),
('plastika', 1, 32, 10),
('plastika', 1, 33, 10),
('plastika', 1, 34, 11),
('guma', 1, 35, 11),
('plastika', 1, 36, 11),
('plastika', 1, 37, 12),
('plis', 0, 38, 12),
('plis', 0, 39, 12),
('plis', 1, 40, 13),
('plastika', 1, 41, 13),
('plastika', 1, 42, 13),
('plastika', 0, 43, 14),
('plastika', 0, 44, 14),
('metal', 0, 45, 14),
('plastika', 1, 46, 15),
('plastika', 1, 47, 15),
('plastika', 1, 48, 15),
('plastika', 0, 49, 16),
('plastika', 0, 50, 16),
('plastika', 1, 51, 16),
('drvo', 1, 52, 17),
('plastika', 0, 53, 17),
('guma', 1, 54, 17),
('drvo', 1, 55, 18),
('drvo', 1, 56, 18),
('drvo', 1, 57, 18),
('plis', 0, 58, 19),
('plis', 0, 59, 19),
('plis', 0, 60, 19),
('plastika', 0, 61, 20),
('plastika', 1, 62, 20),
('guma', 1, 63, 20),
('plastika', 1, 64, 21),
('plastika', 1, 65, 21),
('plastika', 1, 66, 21);



INSERT dbo.Odeca
VALUES
--velicina,  boja, artikalID(67- ), odecaID
('m', 'plava', 67, 1),
('s', 'roze', 68, 1),
('s', 'bela', 69, 1),
('m', 'roze', 70, 2),
('m', 'roze', 71, 2),
('s', 'bela', 72, 2),
('m', 'teget', 73, 3),
('s', 'crvena', 74, 3),
('m', 'roze', 75, 3),
('m', 'zuta', 76, 4),
('s', 'plava', 77, 4),
('s', 'plava', 78, 4),
('m', 'crvena', 79, 5),
('s', 'zelena', 80, 5),
('s', 'plava', 81, 5),
('s', 'bela', 82, 6),
('s', 'crna', 83, 6),
('s', 'roze', 84, 6),
('s', 'teget', 85, 7),
('m', 'crna', 86, 7),
('s', 'teget', 87, 7),
('s', 'sarena', 88, 22),
('m', 'bela', 89, 22),
('m', 'crna', 90, 22),
('s', 'crna', 91, 8),
('s', 'crna', 92, 8),
('s', 'crna', 93, 8),
('s', 'plava', 94, 9),
('s', 'bela', 95, 9),
('s', 'sarena', 96, 9),
('s', 'crvena', 97, 10),
('s', 'teget', 98, 10),
('s', 'crna', 99, 10),
('m', 'siva', 100, 11),
('m', 'crna', 101, 11),
('m', 'bela', 102, 11),
('s', 'crvena', 103, 12),
('s', 'siva', 104, 12),
('m', 'crna', 105, 12),
('s', 'bela', 106, 13),
('s', 'bela', 107, 13),
('s', 'siva', 108, 13),
('s', 'plava', 109, 14),
('s', 'siva', 110, 14),
('s', 'teget', 111, 14),
('s', 'roze', 112, 15),
('s', 'crna', 113, 15),
('m', 'roze', 114, 15),
('m', 'bela', 115, 16),
('m', 'siva', 116, 16),
('m', 'sarena', 117, 16),
('s', 'roze', 118, 17),
('s', 'plava', 119, 17),
('m', 'bela', 120, 17),
('m', 'sarena', 121, 18),
('m', 'crvena', 122, 18),
('s', 'zuta', 123, 18),
('s', 'bela', 124, 19),
('m', 'plava', 125, 19),
('m', 'crna', 126, 19),
('s', 'plava', 127, 20),
('s', 'siva', 128, 20),
('s', 'roze', 129, 20),
('s', 'sarena', 130, 21),
('m', 'roze', 131, 21),
('s', 'zuta', 132, 21);




INSERT dbo.Zaposleni
VALUES
('Danilo', 'Misic', '523546', 3),
('Ivan', 'Ivanovic', '534278', 6),
('Marko', 'Markovic', '578912', 2),
('Ilija', 'Ilic', '512367', 3),
('Mina', 'Minic', '598761', 2),
('Milodrag', 'Pesic', '560123', 1),
('Marija', 'Markovic', '501222', 4),
('Edvin', 'Lukovic', '511234', 5),
('Ognjen', 'Simonovic', '573333', 5),
('Darko', 'Marjanovic', '590123', 6),
('Milutin', 'Vinulovic', '544109', 3),
('Milena', 'Zivanovic', '576666', 2),
('Anja', 'Nikolic', '521006', 3),
('Nenad', 'Stevic', '588912', 6),
('Mihajlo', 'Cekic', '517809', 4),
('Nenad', 'Kojic', '500123', 1),
('Milan', 'Vujicic', '551001', 3),
('Stefan', 'Cvejic', '523523', 2),
('Nemanja', 'Marinkovic', '588811', 1),
('Nikola', 'Milic', '577123', 5),
('Milan', 'Zeljkovic', '577121', 6),
('Irena', 'Simonovic', '577120', 4),
('Ana', 'Arandjelovic', '566123', 3),
('Kristijan', 'Jevtic', '555123', 1),
('Marko', 'Djokic', '511789', 5),
('Kosta', 'Popovic', '511780', 1),
('Djordje', 'Djordjevic', '511339', 2),
('Nikola', 'Grasilovic', '511009', 3),
('Lidija', 'Vasovic', '527890', 6),
('Bane', 'Nenadic', '527111', 1),
('Mihailo', 'Kljajic', '527000', 4),
('Vukasin', 'Djokic', '527666', 4),
('Dusan', 'Radulovic', '531234', 5),
('Srdjan', 'Markovic', '531999', 3),
('Tamara', 'Basurovic', '531777', 6),
('Dragan', 'Bozinovic', '531878', 1),
('Petar', 'Lalic', '531909', 3),
('Nebojsa', 'Josic', '581234', 5),
('Nikola', 'Tosic', '587000', 2),
('Vanja', 'Petronijevic', '583471', 4),
('Natasa', 'Ristic', '507891', 1),
('Vera', 'Smiljic', '507110', 6),
('Teodor', 'Krsmanovic', '507111', 5),
('Todor', 'Milanovic', '507338', 2),
('Aleksandar', 'Vesovic', '507125', 3),
('Dejan', 'Ristanovic', '541007', 2),
('Dusan', 'Cvetkovic', '541155', 1),
('Matija', 'Vasic', '548441', 6),
('Uros', 'Majstorovic', '547711', 5),
('Predrag','Jelisavcic','557021', 3),
('Milisav','Kovacevic','557321', 2),
('Dusan','Tijanic','557999', 4),
('Ivan','Zekic','557920', 4);



