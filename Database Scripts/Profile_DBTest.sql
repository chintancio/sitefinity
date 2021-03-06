USE [master]
GO
/****** Object:  Database [Profile_DBTest]    Script Date: 12/30/2020 8:42:17 PM ******/
CREATE DATABASE [Profile_DBTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Profile_DBTest', FILENAME = N'D:\MSSQL2016\DATA\Profile_DBTest.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 102400KB )
 LOG ON 
( NAME = N'Profile_DBTest_log', FILENAME = N'F:\MSSQL2016\DATA\Profile_DBTest_log.ldf' , SIZE = 25600KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO
ALTER DATABASE [Profile_DBTest] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Profile_DBTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Profile_DBTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Profile_DBTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Profile_DBTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Profile_DBTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Profile_DBTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [Profile_DBTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Profile_DBTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Profile_DBTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Profile_DBTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Profile_DBTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Profile_DBTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Profile_DBTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Profile_DBTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Profile_DBTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Profile_DBTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Profile_DBTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Profile_DBTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Profile_DBTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Profile_DBTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Profile_DBTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Profile_DBTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Profile_DBTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Profile_DBTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Profile_DBTest] SET  MULTI_USER 
GO
ALTER DATABASE [Profile_DBTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Profile_DBTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Profile_DBTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Profile_DBTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Profile_DBTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Profile_DBTest] SET QUERY_STORE = OFF
GO
USE [Profile_DBTest]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Profile_DBTest]
GO
/****** Object:  User [PMI\s-scm_mssql]    Script Date: 12/30/2020 8:42:17 PM ******/
CREATE USER [PMI\s-scm_mssql] FOR LOGIN [PMI\s-scm_mssql] WITH DEFAULT_SCHEMA=[PMI\s-scm_mssql]
GO
/****** Object:  User [PMI\s-OpsMgr-RunAs]    Script Date: 12/30/2020 8:42:17 PM ******/
CREATE USER [PMI\s-OpsMgr-RunAs] FOR LOGIN [PMI\s-OpsMgr-RunAs] WITH DEFAULT_SCHEMA=[PMI\s-OpsMgr-RunAs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [PMI\s-OpsMgr-RunAs]
GO
/****** Object:  Schema [PMI\s-OpsMgr-RunAs]    Script Date: 12/30/2020 8:42:17 PM ******/
CREATE SCHEMA [PMI\s-OpsMgr-RunAs]
GO
/****** Object:  Schema [PMI\s-scm_mssql]    Script Date: 12/30/2020 8:42:17 PM ******/
CREATE SCHEMA [PMI\s-scm_mssql]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 12/30/2020 8:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Country] [nvarchar](50) NULL,
	[Birthdate] [date] NULL,
	[Hobby] [nvarchar](max) NULL,
	[Language] [nvarchar](max) NULL,
	[FavoriteMovie] [nvarchar](max) NULL,
	[FavoriteSeries] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[UserInfo] ([UserId], [Name], [Address], [Country], [Birthdate], [Hobby], [Language], [FavoriteMovie], [FavoriteSeries]) VALUES (N'6ef9076e-59ba-413a-aafb-71bcdd18801a', N'Jennifer Tancio', N'San Jose Del Monte, Bulacan', N'Philippines', CAST(N'1995-09-09' AS Date), N'Baking, Cooking, Painting', N'English, Filipino', N'Harry Potter, The Notebook', N'Friends, The Big Bang Theory')
/****** Object:  StoredProcedure [dbo].[SP_GetUserInfo]    Script Date: 12/30/2020 8:42:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUserInfo]
	-- Add the parameters for the stored procedure here
	@userid NVARCHAR(MAX)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Get user info
	SELECT * FROM dbo.UserInfo where UserId = @userid
END
GO
USE [master]
GO
ALTER DATABASE [Profile_DBTest] SET  READ_WRITE 
GO
