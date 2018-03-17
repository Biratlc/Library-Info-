USE [FreshLibrary]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[line_1_number_building] [int] NOT NULL,
	[line_2_number_building] [nvarchar](200) NOT NULL,
	[line_3_number_building] [nvarchar](200) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[zip_postcode] [int] NOT NULL,
	[country] [varchar](max) NOT NULL,
	[members_id] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Authors](
	[author_id] [int] IDENTITY(1,1) NOT NULL,
	[author_first_name] [varchar](150) NOT NULL,
	[author_last_name] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[isbn] [int] IDENTITY(1,1) NOT NULL,
	[book_title] [varchar](max) NOT NULL,
	[date_of_publication] [date] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[isbn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books_at_Libraries]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_at_Libraries](
	[library_id] [int] NOT NULL,
	[isbn] [int] NOT NULL,
	[quantity_in_strock] [int] NOT NULL,
 CONSTRAINT [PK_Books_at_Libraries] PRIMARY KEY CLUSTERED 
(
	[library_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books_by_Author]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_by_Author](
	[author_id] [int] NOT NULL,
	[isbn] [int] NOT NULL,
 CONSTRAINT [PK_Books_by_Author] PRIMARY KEY CLUSTERED 
(
	[author_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Books_by_category]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_by_category](
	[category_id] [int] NOT NULL,
	[isbn] [int] NOT NULL,
 CONSTRAINT [PK_Books_by_category] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Libraries]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Libraries](
	[library_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
	[library_name] [varchar](200) NOT NULL,
	[library_details] [nchar](10) NULL,
 CONSTRAINT [PK_Libraries] PRIMARY KEY CLUSTERED 
(
	[library_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Member_Requests]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member_Requests](
	[request_id] [int] NOT NULL,
	[member_id] [int] NOT NULL,
	[isbn] [int] NOT NULL,
	[date_requested] [date] NOT NULL,
	[date_located] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Member_Requests] PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Members]    Script Date: 3/16/2018 8:45:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Members](
	[members_id] [int] IDENTITY(1,1) NOT NULL,
	[member_address_id] [int] NOT NULL,
	[gender] [varchar](50) NOT NULL,
	[member_first_name] [varchar](50) NOT NULL,
	[phone_number] [nvarchar](50) NOT NULL,
	[email_address] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[members_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Members] FOREIGN KEY([members_id])
REFERENCES [dbo].[Members] ([members_id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Members]
GO
ALTER TABLE [dbo].[Books_at_Libraries]  WITH CHECK ADD  CONSTRAINT [FK_Books_at_Libraries_Books] FOREIGN KEY([isbn])
REFERENCES [dbo].[Books] ([isbn])
GO
ALTER TABLE [dbo].[Books_at_Libraries] CHECK CONSTRAINT [FK_Books_at_Libraries_Books]
GO
ALTER TABLE [dbo].[Books_at_Libraries]  WITH CHECK ADD  CONSTRAINT [FK_Books_at_Libraries_Libraries] FOREIGN KEY([library_id])
REFERENCES [dbo].[Libraries] ([library_id])
GO
ALTER TABLE [dbo].[Books_at_Libraries] CHECK CONSTRAINT [FK_Books_at_Libraries_Libraries]
GO
ALTER TABLE [dbo].[Books_by_Author]  WITH CHECK ADD  CONSTRAINT [FK_Books_by_Author_Authors] FOREIGN KEY([author_id])
REFERENCES [dbo].[Authors] ([author_id])
GO
ALTER TABLE [dbo].[Books_by_Author] CHECK CONSTRAINT [FK_Books_by_Author_Authors]
GO
ALTER TABLE [dbo].[Books_by_Author]  WITH CHECK ADD  CONSTRAINT [FK_Books_by_Author_Books] FOREIGN KEY([isbn])
REFERENCES [dbo].[Books] ([isbn])
GO
ALTER TABLE [dbo].[Books_by_Author] CHECK CONSTRAINT [FK_Books_by_Author_Books]
GO
ALTER TABLE [dbo].[Books_by_category]  WITH CHECK ADD  CONSTRAINT [FK_Books_by_category_Books] FOREIGN KEY([isbn])
REFERENCES [dbo].[Books] ([isbn])
GO
ALTER TABLE [dbo].[Books_by_category] CHECK CONSTRAINT [FK_Books_by_category_Books]
GO
ALTER TABLE [dbo].[Books_by_category]  WITH CHECK ADD  CONSTRAINT [FK_Books_by_category_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[Books_by_category] CHECK CONSTRAINT [FK_Books_by_category_Categories]
GO
ALTER TABLE [dbo].[Libraries]  WITH CHECK ADD  CONSTRAINT [FK_Libraries_Addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([address_id])
GO
ALTER TABLE [dbo].[Libraries] CHECK CONSTRAINT [FK_Libraries_Addresses]
GO
ALTER TABLE [dbo].[Member_Requests]  WITH CHECK ADD  CONSTRAINT [FK_Member_Requests_Books] FOREIGN KEY([isbn])
REFERENCES [dbo].[Books] ([isbn])
GO
ALTER TABLE [dbo].[Member_Requests] CHECK CONSTRAINT [FK_Member_Requests_Books]
GO
