USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Dobavljac]    Script Date: 16-Feb-21 1:56:57 AM ******/
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

