USE [master]
GO
/****** Object:  Database [SRD_SimonBunya]    Script Date: 06/09/2024 13:01:44 ******/
CREATE DATABASE [SRD_SimonBunya]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SRD_SimonBunya', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SRD_SimonBunya.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SRD_SimonBunya_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SRD_SimonBunya_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SRD_SimonBunya].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SRD_SimonBunya] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET ARITHABORT OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SRD_SimonBunya] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SRD_SimonBunya] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SRD_SimonBunya] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SRD_SimonBunya] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET RECOVERY FULL 
GO
ALTER DATABASE [SRD_SimonBunya] SET  MULTI_USER 
GO
ALTER DATABASE [SRD_SimonBunya] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SRD_SimonBunya] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SRD_SimonBunya] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SRD_SimonBunya] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SRD_SimonBunya] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SRD_SimonBunya', N'ON'
GO
USE [SRD_SimonBunya]
GO
/****** Object:  Table [dbo].[Forms]    Script Date: 06/09/2024 13:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forms](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Key] [nvarchar](50) NULL,
	[Tags] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[LastUpdateDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Forms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 06/09/2024 13:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[ID] [int] NOT NULL,
	[FormID] [int] NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Key] [nvarchar](50) NULL,
	[QuestionType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionTypes]    Script Date: 06/09/2024 13:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionTypes](
	[ID] [int] NOT NULL,
	[QuestionTypes] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_QuestionTypes] PRIMARY KEY CLUSTERED 
(
	[QuestionTypes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusValues]    Script Date: 06/09/2024 13:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusValues](
	[ID] [int] NOT NULL,
	[StatusValues] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusValues] PRIMARY KEY CLUSTERED 
(
	[StatusValues] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Forms] ([ID], [Title], [Key], [Tags], [CreatedDate], [LastUpdateDate], [Status]) VALUES (1, N'New Emergency Form Title', N'New Emergency Form Keys', N'New Emergency Form Tags', CAST(N'2024-09-06' AS Date), CAST(N'2024-09-06' AS Date), N'Disabled')
INSERT [dbo].[Forms] ([ID], [Title], [Key], [Tags], [CreatedDate], [LastUpdateDate], [Status]) VALUES (12, N'Emergency Form', N'emergency_form_1', N'Emergency , flood', CAST(N'2024-08-15' AS Date), CAST(N'2024-08-16' AS Date), N'Active')
GO
INSERT [dbo].[Questions] ([ID], [FormID], [Text], [Key], [QuestionType], [Status]) VALUES (20, 12, N'Number of individuals in the affected area', N'number_individuals_20', N'integer', N'Active')
GO
INSERT [dbo].[QuestionTypes] ([ID], [QuestionTypes]) VALUES (1, N'integer   ')
INSERT [dbo].[QuestionTypes] ([ID], [QuestionTypes]) VALUES (4, N'select_multiple')
INSERT [dbo].[QuestionTypes] ([ID], [QuestionTypes]) VALUES (2, N'select_one')
INSERT [dbo].[QuestionTypes] ([ID], [QuestionTypes]) VALUES (3, N'text      ')
INSERT [dbo].[QuestionTypes] ([ID], [QuestionTypes]) VALUES (5, N'textarea')
GO
INSERT [dbo].[StatusValues] ([ID], [StatusValues]) VALUES (1, N'Active')
INSERT [dbo].[StatusValues] ([ID], [StatusValues]) VALUES (2, N'Disabled')
GO
ALTER TABLE [dbo].[Forms]  WITH CHECK ADD  CONSTRAINT [FK_Forms_StatusValues] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusValues] ([StatusValues])
GO
ALTER TABLE [dbo].[Forms] CHECK CONSTRAINT [FK_Forms_StatusValues]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Forms] FOREIGN KEY([FormID])
REFERENCES [dbo].[Forms] ([ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Forms]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_QuestionTypes] FOREIGN KEY([QuestionType])
REFERENCES [dbo].[QuestionTypes] ([QuestionTypes])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_QuestionTypes]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_StatusValues] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusValues] ([StatusValues])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_StatusValues]
GO
USE [master]
GO
ALTER DATABASE [SRD_SimonBunya] SET  READ_WRITE 
GO
