USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Artikal]    Script Date: 15-Feb-21 3:42:48 PM ******/
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

