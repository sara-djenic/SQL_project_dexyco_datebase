USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Odeca]    Script Date: 16-Feb-21 1:57:43 AM ******/
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

