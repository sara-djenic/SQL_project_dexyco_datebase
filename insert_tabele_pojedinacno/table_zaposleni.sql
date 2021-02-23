USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Zaposleni]    Script Date: 16-Feb-21 1:59:05 AM ******/
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

ALTER TABLE [dbo].[Zaposleni]  WITH CHECK ADD  CONSTRAINT [FK_Zaposleni_Magacin] FOREIGN KEY([magacinID])
REFERENCES [dbo].[Magacin] ([magacinID])
GO

ALTER TABLE [dbo].[Zaposleni] CHECK CONSTRAINT [FK_Zaposleni_Magacin]
GO

