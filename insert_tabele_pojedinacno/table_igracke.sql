USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Igracke]    Script Date: 16-Feb-21 1:57:15 AM ******/
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

