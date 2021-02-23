USE [SQL_Projekat_DexyCO]
GO

/****** Object:  Table [dbo].[Uzrast]    Script Date: 16-Feb-21 1:58:51 AM ******/
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

