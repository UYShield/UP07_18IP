USE [18ip16]
GO
/****** Object:  Table [dbo].[Availability]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availability](
	[A_ID] [int] NOT NULL,
	[PH_ID] [int] NOT NULL,
	[PR_ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
 CONSTRAINT [PK_Availability] PRIMARY KEY CLUSTERED 
(
	[A_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[BS_ID] [int] NOT NULL,
	[C_ID] [int] NOT NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[BS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buying]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buying](
	[B_ID] [int] NOT NULL,
	[PH_ID] [int] NOT NULL,
	[PR_ID] [int] NOT NULL,
	[BS_ID] [int] NOT NULL,
	[Price] [nvarchar](100) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Buying] PRIMARY KEY CLUSTERED 
(
	[B_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[C_ID] [int] NOT NULL,
	[Login] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deficit]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deficit](
	[D_ID] [int] NOT NULL,
	[PH_ID] [int] NOT NULL,
	[PR_ID] [int] NOT NULL,
	[Solution] [nvarchar](100) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
 CONSTRAINT [PK_Deficit] PRIMARY KEY CLUSTERED 
(
	[D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GP_ID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[PH_ID] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[PH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preparation]    Script Date: 10.11.2021 17:37:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preparation](
	[PR_ID] [int] NOT NULL,
	[GP_ID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Picture] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Preparation] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Availability]  WITH CHECK ADD  CONSTRAINT [FK_Availability_Pharmacy] FOREIGN KEY([PH_ID])
REFERENCES [dbo].[Pharmacy] ([PH_ID])
GO
ALTER TABLE [dbo].[Availability] CHECK CONSTRAINT [FK_Availability_Pharmacy]
GO
ALTER TABLE [dbo].[Availability]  WITH CHECK ADD  CONSTRAINT [FK_Availability_Preparation] FOREIGN KEY([PR_ID])
REFERENCES [dbo].[Preparation] ([PR_ID])
GO
ALTER TABLE [dbo].[Availability] CHECK CONSTRAINT [FK_Availability_Preparation]
GO
ALTER TABLE [dbo].[Availability]  WITH CHECK ADD  CONSTRAINT [FK_Availability_Preparation1] FOREIGN KEY([Quantity])
REFERENCES [dbo].[Preparation] ([PR_ID])
GO
ALTER TABLE [dbo].[Availability] CHECK CONSTRAINT [FK_Availability_Preparation1]
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Client] FOREIGN KEY([C_ID])
REFERENCES [dbo].[Client] ([C_ID])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_Client]
GO
ALTER TABLE [dbo].[Buying]  WITH CHECK ADD  CONSTRAINT [FK_Buying_Basket] FOREIGN KEY([BS_ID])
REFERENCES [dbo].[Basket] ([BS_ID])
GO
ALTER TABLE [dbo].[Buying] CHECK CONSTRAINT [FK_Buying_Basket]
GO
ALTER TABLE [dbo].[Buying]  WITH CHECK ADD  CONSTRAINT [FK_Buying_Pharmacy] FOREIGN KEY([PH_ID])
REFERENCES [dbo].[Pharmacy] ([PH_ID])
GO
ALTER TABLE [dbo].[Buying] CHECK CONSTRAINT [FK_Buying_Pharmacy]
GO
ALTER TABLE [dbo].[Buying]  WITH CHECK ADD  CONSTRAINT [FK_Buying_Preparation] FOREIGN KEY([PR_ID])
REFERENCES [dbo].[Preparation] ([PR_ID])
GO
ALTER TABLE [dbo].[Buying] CHECK CONSTRAINT [FK_Buying_Preparation]
GO
ALTER TABLE [dbo].[Buying]  WITH CHECK ADD  CONSTRAINT [FK_Buying_Preparation1] FOREIGN KEY([PR_ID])
REFERENCES [dbo].[Preparation] ([PR_ID])
GO
ALTER TABLE [dbo].[Buying] CHECK CONSTRAINT [FK_Buying_Preparation1]
GO
ALTER TABLE [dbo].[Deficit]  WITH CHECK ADD  CONSTRAINT [FK_Deficit_Pharmacy] FOREIGN KEY([PH_ID])
REFERENCES [dbo].[Pharmacy] ([PH_ID])
GO
ALTER TABLE [dbo].[Deficit] CHECK CONSTRAINT [FK_Deficit_Pharmacy]
GO
ALTER TABLE [dbo].[Deficit]  WITH CHECK ADD  CONSTRAINT [FK_Deficit_Preparation] FOREIGN KEY([PR_ID])
REFERENCES [dbo].[Preparation] ([PR_ID])
GO
ALTER TABLE [dbo].[Deficit] CHECK CONSTRAINT [FK_Deficit_Preparation]
GO
ALTER TABLE [dbo].[Preparation]  WITH CHECK ADD  CONSTRAINT [FK_Preparation_Group] FOREIGN KEY([GP_ID])
REFERENCES [dbo].[Group] ([GP_ID])
GO
ALTER TABLE [dbo].[Preparation] CHECK CONSTRAINT [FK_Preparation_Group]
GO
