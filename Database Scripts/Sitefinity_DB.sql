USE [master]
GO
/****** Object:  Database [Sitefinity_DB]    Script Date: 12/30/2020 8:38:26 PM ******/
CREATE DATABASE [Sitefinity_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sitefinity_DB', FILENAME = N'D:\MSSQL2016\DATA\Sitefinity_DB.mdf' , SIZE = 102400KB , MAXSIZE = UNLIMITED, FILEGROWTH = 102400KB )
 LOG ON 
( NAME = N'Sitefinity_DB_log', FILENAME = N'F:\MSSQL2016\DATA\Sitefinity_DB_log.ldf' , SIZE = 25600KB , MAXSIZE = 2048GB , FILEGROWTH = 102400KB )
GO
ALTER DATABASE [Sitefinity_DB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sitefinity_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sitefinity_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sitefinity_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sitefinity_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sitefinity_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sitefinity_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sitefinity_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Sitefinity_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sitefinity_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sitefinity_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sitefinity_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sitefinity_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sitefinity_DB] SET QUERY_STORE = OFF
GO
USE [Sitefinity_DB]
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
USE [Sitefinity_DB]
GO
/****** Object:  User [PMI\s-scm_mssql]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE USER [PMI\s-scm_mssql] FOR LOGIN [PMI\s-scm_mssql] WITH DEFAULT_SCHEMA=[PMI\s-scm_mssql]
GO
/****** Object:  User [PMI\s-OpsMgr-RunAs]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE USER [PMI\s-OpsMgr-RunAs] FOR LOGIN [PMI\s-OpsMgr-RunAs] WITH DEFAULT_SCHEMA=[PMI\s-OpsMgr-RunAs]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [PMI\s-OpsMgr-RunAs]
GO
/****** Object:  Schema [PMI\s-OpsMgr-RunAs]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE SCHEMA [PMI\s-OpsMgr-RunAs]
GO
/****** Object:  Schema [PMI\s-scm_mssql]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE SCHEMA [PMI\s-scm_mssql]
GO
/****** Object:  Table [dbo].[ImportWarnings]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportWarnings](
	[ImportId] [int] NOT NULL,
	[LogId] [int] NOT NULL,
 CONSTRAINT [pk_ImportWarnings] PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC,
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OAConflicts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAConflicts](
	[Id] [int] NOT NULL,
	[BaseName] [varchar](255) NULL,
	[Occured] [datetimeoffset](7) NOT NULL,
	[SourceId] [varchar](255) NULL,
	[DestinationId] [varchar](255) NULL,
	[BaseId] [varchar](255) NULL,
	[CorrelationId] [varchar](255) NULL,
	[ConfigurationName] [nvarchar](64) NOT NULL,
 CONSTRAINT [pk_OAConflicts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OAImportConfigurations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OAImportConfigurations](
	[Name] [nvarchar](64) NOT NULL,
	[DisplayName] [nvarchar](255) NULL,
	[BaseTypeName] [varchar](255) NULL,
	[BaseConnectionString] [nvarchar](2000) NULL,
	[BaseIsUpdateRequired] [tinyint] NOT NULL,
	[SourceTypeName] [varchar](255) NULL,
	[SourceConnectionString] [nvarchar](2000) NULL,
	[SourceIsForwardMapped] [tinyint] NOT NULL,
	[SourceIsUpdateRequired] [tinyint] NOT NULL,
	[DestinationTypeName] [varchar](255) NULL,
	[DestinationConectionString] [nvarchar](2000) NULL,
	[DestinationIsForwardMapped] [tinyint] NOT NULL,
	[DestinationIsUpdateRequired] [tinyint] NOT NULL,
	[BaseConfig] [nvarchar](max) NULL,
	[SourceConfig] [nvarchar](max) NULL,
	[DestinationConfig] [nvarchar](max) NULL,
	[SerializedMapping] [nvarchar](max) NULL,
	[ImportType] [int] NOT NULL,
	[LogLevel] [int] NOT NULL,
	[PageSize] [int] NOT NULL,
	[TransactionSize] [int] NOT NULL,
	[IntermediateCommits] [tinyint] NOT NULL,
	[CopyToBase] [tinyint] NOT NULL,
	[MarkedForDelete] [tinyint] NULL,
 CONSTRAINT [pk_OAImportConfigurations] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[oakeygen]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oakeygen](
	[table_name] [varchar](64) NOT NULL,
	[last_used_id] [int] NOT NULL,
 CONSTRAINT [pk_oakeygen] PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OASyncImportSummary]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OASyncImportSummary](
	[Id] [int] NOT NULL,
	[ImportStatus] [int] NOT NULL,
	[ImportStart] [datetimeoffset](7) NOT NULL,
	[ImportEnd] [datetimeoffset](7) NULL,
	[ConfigurationName] [nvarchar](64) NOT NULL,
	[LastErrorSynchronizationLog] [int] NULL,
 CONSTRAINT [pk_OASyncImportSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OASyncListSummary]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OASyncListSummary](
	[Id] [int] NOT NULL,
	[ListName] [varchar](255) NULL,
	[ImportStatus] [int] NOT NULL,
	[ImportStart] [datetimeoffset](7) NOT NULL,
	[ImportEnd] [datetimeoffset](7) NULL,
	[SourceDeletes] [int] NOT NULL,
	[SourceInserts] [int] NOT NULL,
	[SourceReads] [int] NOT NULL,
	[SourceUpdates] [int] NOT NULL,
	[DestinationDeletes] [int] NOT NULL,
	[DestinationInserts] [int] NOT NULL,
	[DestinationReads] [int] NOT NULL,
	[DestinationUpdates] [int] NOT NULL,
	[BaseDeletes] [int] NOT NULL,
	[BaseInserts] [int] NOT NULL,
	[BaseReads] [int] NOT NULL,
	[BaseUpdates] [int] NOT NULL,
	[ImportSummary] [int] NOT NULL,
 CONSTRAINT [pk_OASyncListSummary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OASyncLog]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OASyncLog](
	[Id] [int] NOT NULL,
	[Executed] [datetimeoffset](7) NOT NULL,
	[Action] [int] NOT NULL,
	[SourceId] [varchar](255) NULL,
	[DestinationId] [varchar](255) NULL,
	[BaseId] [varchar](255) NULL,
	[CorrelationId] [varchar](255) NULL,
	[BaseName] [varchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[ListSummary] [int] NULL,
 CONSTRAINT [pk_OASyncLog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ab_campaign]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ab_campaign](
	[winning_condition] [int] NULL,
	[winner_issue_original_id] [uniqueidentifier] NULL,
	[winner_issue_id] [uniqueidentifier] NULL,
	[testing_sample_percentage] [int] NULL,
	[testing_note] [nvarchar](4000) NULL,
	[testing_ends] [datetime] NULL,
	[root_campaign_id] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_sent] [datetime] NULL,
	[conclusion] [nvarchar](4000) NULL,
	[campaign_b_id] [uniqueidentifier] NULL,
	[campaign_a_id] [uniqueidentifier] NULL,
	[application_name] [varchar](255) NULL,
	[a_b_testing_status] [int] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ab_campaign] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ab_test]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ab_test](
	[winner_variation_id] [uniqueidentifier] NULL,
	[title] [nvarchar](255) NULL,
	[stop_date] [datetime] NULL,
	[status] [int] NOT NULL,
	[start_date] [datetime] NULL,
	[site_id] [uniqueidentifier] NULL,
	[selected_variation_id] [uniqueidentifier] NULL,
	[tested_item_id] [uniqueidentifier] NULL,
	[owner] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[date_created] [datetime] NULL,
	[culture] [varchar](10) NULL,
	[api_key] [varchar](36) NULL,
 CONSTRAINT [pk_sf_ab_test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ab_test_goal]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ab_test_goal](
	[predicate_operator] [varchar](255) NULL,
	[ordinal] [int] NOT NULL,
	[object_name] [nvarchar](255) NULL,
	[object_id] [varchar](255) NULL,
	[object_culture] [varchar](10) NULL,
	[is_primary] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[goal_type] [int] NOT NULL,
	[goal_nme_rsrc_key] [varchar](255) NULL,
	[ab_test_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_ab_test_goal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ab_test_variation]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ab_test_variation](
	[traffic_distribution] [int] NOT NULL,
	[data_item_id] [uniqueidentifier] NULL,
	[ordinal] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[is_original] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[ab_test_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_ab_test_variation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_addresses]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_addresses](
	[zip] [nvarchar](255) NULL,
	[street] [nvarchar](255) NULL,
	[state_code] [nvarchar](255) NULL,
	[map_zoom_level] [int] NULL,
	[longitude] [float] NULL,
	[latitude] [float] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[country_code] [nvarchar](255) NULL,
	[city] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_app_setting]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_app_setting](
	[policy_type] [varchar](255) NULL,
	[policy_name] [varchar](255) NULL,
	[nme] [nvarchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dta] [nvarchar](max) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_app_setting] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_approval_tracking_record]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_approval_tracking_record](
	[workflow_item_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[status] [varchar](255) NULL,
	[note] [nvarchar](max) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[culture] [int] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_approval_tracking_record] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blg_psts_pblshd_trnslations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blg_psts_pblshd_trnslations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_blg_psts_pblshd_FEAE3536] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[was_published] [tinyint] NULL,
	[summary_] [nvarchar](4000) NULL,
	[parent_id] [uniqueidentifier] NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[content_] [nvarchar](max) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_blog_posts] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blog_posts_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blog_posts_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blg_psts_sf_lng_EB232A59] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_blg_psts_sf_prm_11B2B7BD] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blog_posts_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blog_posts_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blog_posts_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blogs]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blogs](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_blogs] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blogs_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blogs_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_blogs_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_blogs_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_blogs_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_blogs_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_bounce_stat]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_bounce_stat](
	[sf_subscriber_id] [uniqueidentifier] NULL,
	[smtp_status] [varchar](255) NULL,
	[retry_count] [int] NOT NULL,
	[message_status] [int] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_processing] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[sf_campaign_id] [uniqueidentifier] NULL,
	[bounce_status] [int] NOT NULL,
	[application_name] [varchar](255) NOT NULL,
	[additional_info] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_bounce_stat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_calendars]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_calendars](
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[description_] [nvarchar](max) NULL,
	[date_created] [datetime] NULL,
	[color] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_calendars] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_campaign]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_campaign](
	[use_google_tracking] [tinyint] NULL,
	[short_id] [varchar](255) NULL,
	[rootCampaign_id] [uniqueidentifier] NULL,
	[reply_to_email] [varchar](255) NULL,
	[related_notification_job] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) NULL,
	[message_subject] [nvarchar](4000) NULL,
	[id3] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_ready_for_sending] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[from_name] [nvarchar](255) NULL,
	[delivery_date] [datetime] NULL,
	[campaign_state] [int] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_campaign] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_campaign_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_campaign_link](
	[url] [nvarchar](4000) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_campaign_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_campaign_sf_campaign_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_campaign_sf_campaign_link](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_cmpgn_sf_cmpgn__345E94F9] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_chunks]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_chunks](
	[sze] [int] NOT NULL,
	[ordinal] [int] NOT NULL,
	[file_id] [uniqueidentifier] NOT NULL,
	[dta] [image] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_chunks] PRIMARY KEY CLUSTERED 
(
	[file_id] ASC,
	[ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cnt_location_filters]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cnt_location_filters](
	[value] [nvarchar](max) NULL,
	[type] [varchar](255) NULL,
	[name] [nvarchar](50) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[cnt_location_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_cnt_location_filters] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cnt_locations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cnt_locations](
	[site_id] [uniqueidentifier] NULL,
	[redirect_page_id] [uniqueidentifier] NULL,
	[priority] [int] NOT NULL,
	[page_id] [uniqueidentifier] NULL,
	[lang] [varchar](20) NULL,
	[item_type] [varchar](255) NOT NULL,
	[item_provider] [nvarchar](100) NULL,
	[item_descendant_type] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[control_id] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_cnt_locations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cntent_items_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cntent_items_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_cntnt_tms_sf_pr_01DD1D9B] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cntnt_tems_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cntnt_tems_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_cntnt_tms_sf_ln_1E6CD43A] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cntnt_tms_pblshd_trnsltions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cntnt_tms_pblshd_trnsltions](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_cntnt_tms_pblsh_1C0E917D] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_commnt](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[website] [varchar](255) NULL,
	[provider_name] [varchar](255) NULL,
	[ip_address] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[content_] [nvarchar](max) NULL,
	[commented_item_type] [varchar](255) NULL,
	[commented_item_i_d] [uniqueidentifier] NOT NULL,
	[comment_status] [int] NOT NULL,
	[author_name_] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_commnt_parent_group_ids]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_commnt_parent_group_ids](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_commnt_parent_group_ids] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_commnt_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_commnt_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_commnt_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_config_variables]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_config_variables](
	[val] [nvarchar](255) NULL,
	[key] [varchar](255) NOT NULL,
	[id] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NOT NULL,
 CONSTRAINT [pk_sf_config_variables] PRIMARY KEY CLUSTERED 
(
	[app_name] ASC,
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_items]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_items](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[nme] [nvarchar](255) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[content_] [nvarchar](max) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[author] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_content_items] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_items_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_items_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_content_items_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_items_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_items_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_content_items_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_items_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_items_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_content_items_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_link](
	[parent_item_type] [varchar](255) NULL,
	[parent_item_provider_name] [varchar](255) NULL,
	[parent_item_id] [uniqueidentifier] NULL,
	[parent_item_additional_info] [varchar](512) NULL,
	[ordinal] [real] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[is_parent_deleted] [tinyint] NOT NULL,
	[is_child_deleted] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[component_property_name] [varchar](255) NULL,
	[child_item_type] [varchar](255) NULL,
	[child_item_provider_name] [varchar](255) NULL,
	[child_item_id] [uniqueidentifier] NULL,
	[child_item_additional_info] [nvarchar](1024) NULL,
	[available_for_temp] [tinyint] NOT NULL,
	[available_for_master] [tinyint] NOT NULL,
	[available_for_live] [tinyint] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_content_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_link_attrbutes]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_link_attrbutes](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](1000) NULL,
 CONSTRAINT [pk_sf_content_link_attrbutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_content_relation]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_content_relation](
	[subject_type] [varchar](255) NULL,
	[subject_provider] [varchar](255) NULL,
	[subject_id] [uniqueidentifier] NULL,
	[relation_type] [varchar](255) NULL,
	[object_type] [varchar](255) NULL,
	[object_provider] [varchar](255) NULL,
	[object_id] [uniqueidentifier] NULL,
	[key] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_content_relation] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_control_properties]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_control_properties](
	[val] [nvarchar](max) NULL,
	[validation] [nvarchar](510) NULL,
	[prnt_prop_id] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[nme] [varchar](50) NULL,
	[last_modified] [datetime] NULL,
	[language] [varchar](10) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[flags] [int] NOT NULL,
	[description_] [nvarchar](255) NULL,
	[control_id] [uniqueidentifier] NULL,
	[caption_] [nvarchar](255) NULL,
	[app_name] [varchar](50) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_control_properties] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_counters]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_counters](
	[nme] [varchar](255) NOT NULL,
	[last_value] [bigint] NOT NULL,
 CONSTRAINT [pk_sf_counters] PRIMARY KEY CLUSTERED 
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cs_comments]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cs_comments](
	[status] [nvarchar](100) NULL,
	[resolve_key] [nvarchar](255) NOT NULL,
	[rating] [numeric](20, 10) NULL,
	[parent_thread_id] [uniqueidentifier] NOT NULL,
	[message] [nvarchar](max) NULL,
	[last_modified_by_name] [varchar](255) NULL,
	[last_modified_by_email] [varchar](255) NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[date_created] [datetime] NULL,
	[custom_data] [nvarchar](1024) NULL,
	[author_name] [nvarchar](255) NULL,
	[author_ip_address] [nvarchar](255) NULL,
	[author_id] [uniqueidentifier] NULL,
	[author_email] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_cs_comments] PRIMARY KEY CLUSTERED 
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cs_groups]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cs_groups](
	[title] [nvarchar](255) NULL,
	[resolve_key] [nvarchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[date_created] [datetime] NULL,
	[author_name] [nvarchar](255) NULL,
	[author_id] [uniqueidentifier] NULL,
	[author_email] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_cs_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_cs_threads]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_cs_threads](
	[type] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[resolve_key] [nvarchar](255) NULL,
	[require_authentication] [tinyint] NOT NULL,
	[require_approval] [tinyint] NOT NULL,
	[parent_group_id] [uniqueidentifier] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[language] [nvarchar](10) NULL,
	[is_closed] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NULL,
	[data_source] [nvarchar](255) NULL,
	[comments_count] [int] NOT NULL,
	[behavior] [nvarchar](100) NULL,
	[average_rating] [numeric](20, 10) NULL,
	[author_name] [nvarchar](255) NULL,
	[author_id] [uniqueidentifier] NULL,
	[author_email] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_cs_threads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dashboard_log]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dashboard_log](
	[user_id] [uniqueidentifier] NULL,
	[item_title] [nvarchar](255) NULL,
	[timestamp] [datetime] NOT NULL,
	[status] [varchar](255) NULL,
	[site_id] [uniqueidentifier] NULL,
	[language] [varchar](255) NULL,
	[item_type] [varchar](255) NULL,
	[item_provider] [varchar](255) NULL,
	[item_id] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_dashboard_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dashboard_watchlist]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dashboard_watchlist](
	[user_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dashboard_log_entry_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_dashboard_watchlist] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_delivery_entry]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_delivery_entry](
	[sf_delivery_entry_id] [int] NOT NULL,
	[subscriber_id] [uniqueidentifier] NULL,
	[delivery_status] [int] NOT NULL,
	[delivery_date] [datetime] NOT NULL,
	[campaign_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_delivery_entry] PRIMARY KEY CLUSTERED 
(
	[sf_delivery_entry_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_draft_pages]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_draft_pages](
	[vrsion] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_temp_draft] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[app_name] [varchar](50) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[theme] [nvarchar](255) NULL,
	[url_evaluation_mode] [int] NULL,
	[template_name] [varchar](255) NULL,
	[template_id] [uniqueidentifier] NULL,
	[renderer] [varchar](255) NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[page_id] [uniqueidentifier] NULL,
	[master_page] [varchar](255) NULL,
	[last_control_id2] [int] NULL,
	[is_personalized] [tinyint] NULL,
	[include_script_manger] [tinyint] NULL,
	[flags] [int] NULL,
	[external_page] [varchar](255) NULL,
	[theme2] [nvarchar](255) NULL,
	[personalization_segment_id2] [uniqueidentifier] NULL,
	[personalization_master_id2] [uniqueidentifier] NULL,
	[master_page2] [varchar](255) NULL,
	[last_control_id] [int] NULL,
	[ky] [varchar](255) NULL,
	[is_personalized2] [tinyint] NULL,
	[include_script_manger2] [tinyint] NULL,
	[submit_restriction] [int] NULL,
	[submit_action] [int] NULL,
	[submit_action_after_update] [int] NULL,
	[form_label_placement] [int] NULL,
	[rules] [nvarchar](max) NULL,
	[nme] [varchar](255) NULL,
	[redirect_page_url] [varchar](255) NULL,
	[redirect_page_url_after_update] [varchar](255) NULL,
	[css_class] [varchar](255) NULL,
	[last_control_id3] [int] NULL,
	[is_temp_form] [tinyint] NULL,
	[send_confirmation_email] [bit] NULL,
	[success_message_] [nvarchar](max) NULL,
	[sccss_mssge_after_form_update_] [nvarchar](255) NULL,
	[content_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_draft_pages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_drft_pages_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_drft_pages_sf_language_data](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_drft_pgs_sf_lng_806EFED9] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynamic_content]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynamic_content](
	[was_published] [tinyint] NULL,
	[visible] [tinyint] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[system_parent_type] [varchar](255) NULL,
	[system_parent_id] [uniqueidentifier] NULL,
	[status] [int] NOT NULL,
	[publication_date] [datetime] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_in_sitemap] [tinyint] NULL,
	[base_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[date_created] [datetime] NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_dynamic_content] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynamic_list]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynamic_list](
	[sf_dynamic_list_id] [int] NOT NULL,
	[list_key] [varchar](255) NOT NULL,
	[last_name_mapped_field] [varchar](255) NOT NULL,
	[first_name_mapped_field] [varchar](255) NOT NULL,
	[email_mapped_field] [varchar](255) NOT NULL,
	[dynamic_list_provider_name] [varchar](255) NOT NULL,
	[connection_name] [varchar](255) NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[dynamic_list_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_dynamic_list] PRIMARY KEY CLUSTERED 
(
	[sf_dynamic_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynamic_type_base]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynamic_type_base](
	[original_parent_id] [uniqueidentifier] NULL,
	[original_item_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_dynamic_type_base] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynmc_cntent_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynmc_cntent_sf_permissions](
	[base_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_dynmc_cntnt_sf__A0DCFB00] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns](
	[base_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_dynmc_cntnt_pbl_23872A5A] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_dynmc_cntnt_sf_lnguage_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_dynmc_cntnt_sf_lnguage_data](
	[base_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_dynmc_cntnt_sf__08B2392E] PRIMARY KEY CLUSTERED 
(
	[base_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ec_customer_profile]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ec_customer_profile](
	[id] [uniqueidentifier] NOT NULL,
	[shipping_state_region] [varchar](255) NULL,
	[shipping_postal_code] [varchar](255) NULL,
	[shipping_phone_number] [varchar](255) NULL,
	[shipping_last_name] [varchar](255) NULL,
	[shipping_first_name] [varchar](255) NULL,
	[shipping_email] [varchar](255) NULL,
	[shipping_country] [varchar](255) NULL,
	[shipping_company] [varchar](255) NULL,
	[shipping_city] [varchar](255) NULL,
	[shipping_address2] [varchar](255) NULL,
	[shipping_address1] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[first_name] [varchar](255) NULL,
	[billing_state_region] [varchar](255) NULL,
	[billing_postal_code] [varchar](255) NULL,
	[billing_phone_number] [varchar](255) NULL,
	[billing_email] [varchar](255) NULL,
	[billing_country] [varchar](255) NULL,
	[billing_company] [varchar](255) NULL,
	[billing_city] [varchar](255) NULL,
	[billing_address2] [varchar](255) NULL,
	[billing_address1] [varchar](255) NULL,
 CONSTRAINT [pk_sf_ec_customer_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[was_published] [tinyint] NULL,
	[timezone_id] [varchar](255) NULL,
	[summary_] [nvarchar](4000) NULL,
	[street_] [nvarchar](255) NULL,
	[state_] [nvarchar](255) NULL,
	[recurrence_expression] [nvarchar](2000) NULL,
	[parent_id] [uniqueidentifier] NOT NULL,
	[lcation] [nvarchar](255) NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[is_recurrent] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[event_start] [datetime] NOT NULL,
	[event_end] [datetime] NULL,
	[country_] [nvarchar](255) NULL,
	[content_] [nvarchar](max) NULL,
	[contact_web] [nvarchar](max) NULL,
	[contact_phone_] [nvarchar](255) NULL,
	[contact_name_] [nvarchar](255) NULL,
	[contact_email] [nvarchar](255) NULL,
	[contact_cell_] [nvarchar](255) NULL,
	[city_] [nvarchar](255) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[all_day_event] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_events] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_events_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_events_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_events_sf_language_data] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_events_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_events_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_events_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_events_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_facet_facets]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_facet_facets](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_facet_facets] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_failed_deliveries]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_failed_deliveries](
	[subscriber_resolve_key] [varchar](255) NULL,
	[subscriber_id] [uniqueidentifier] NULL,
	[job_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[failure_reason] [nvarchar](100) NULL,
	[fail_time] [datetime] NOT NULL,
	[description] [nvarchar](2000) NULL,
	[delivery_address] [varchar](255) NULL,
 CONSTRAINT [pk_sf_failed_deliveries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_files_monitor_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_files_monitor_data](
	[package_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[file_path] [varchar](255) NULL,
	[file_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_files_monitor_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_folders]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_folders](
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[root_id] [uniqueidentifier] NULL,
	[path] [varchar](900) NULL,
	[parent_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_deleted] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](255) NULL,
	[cover_id] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_folders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_description]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_description](
	[status] [int] NOT NULL,
	[post_rights] [int] NOT NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NULL,
	[views_count] [int] NOT NULL,
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[date_created] [datetime] NULL,
	[publication_date] [datetime] NOT NULL,
	[expiration_date] [datetime] NULL,
	[vrsion] [int] NOT NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[approve_comments] [tinyint] NULL,
	[email_author] [tinyint] NULL,
	[content_state] [varchar](255) NULL,
	[draft_culture] [varchar](255) NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[source_key] [varchar](255) NULL,
	[include_in_sitemap] [tinyint] NULL,
	[title_] [nvarchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[url_name_] [nvarchar](255) NULL,
	[submit_restriction] [int] NOT NULL,
	[submit_action] [int] NOT NULL,
	[submit_action_after_update] [int] NOT NULL,
	[form_label_placement] [int] NOT NULL,
	[nme] [varchar](255) NULL,
	[rules] [nvarchar](max) NULL,
	[redirect_page_url] [varchar](255) NULL,
	[redirect_page_url_after_update] [varchar](255) NULL,
	[css_class] [varchar](255) NULL,
	[locked_by] [uniqueidentifier] NULL,
	[form_entries_seed] [bigint] NOT NULL,
	[last_control_id] [int] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[subscr_lst_id_after_update] [uniqueidentifier] NULL,
	[library_id] [uniqueidentifier] NULL,
	[frmwrk] [int] NOT NULL,
	[send_confirmation_email] [bit] NULL,
	[success_message_] [nvarchar](max) NULL,
	[sccss_mssge_after_form_update_] [nvarchar](max) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_form_description] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_description_attrbutes]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_description_attrbutes](
	[content_id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](max) NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_ttr_61694FD8] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_description_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_description_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_ctg_CCEDA950] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_description_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_description_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_sf__DBABC077] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_description_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_description_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_form_description_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_form_entry]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_form_entry](
	[lnguage] [varchar](255) NULL,
	[status] [int] NOT NULL,
	[ip_address] [varchar](255) NULL,
	[started_on] [datetime] NOT NULL,
	[submitted_on] [datetime] NULL,
	[user_id] [uniqueidentifier] NULL,
	[user_provider] [varchar](255) NULL,
	[voa_class] [int] NULL,
	[referral_code] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[expiration_date] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[last_modified] [datetime] NULL,
	[ownr] [uniqueidentifier] NULL,
	[publication_date] [datetime] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[source_key] [varchar](255) NULL,
	[source_site_id] [uniqueidentifier] NULL,
	[source_site_name] [varchar](255) NULL,
	[description_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_form_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forum_groups]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forum_groups](
	[url_name_] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[ordinal] [real] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[item_default_url_] [nvarchar](255) NULL,
	[is_locked] [tinyint] NOT NULL,
	[is_default] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_forum_groups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forum_groups_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forum_groups_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_frm_grps_sf_prm_3A6F3063] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forum_posts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forum_posts](
	[title] [nvarchar](255) NULL,
	[thread_id] [uniqueidentifier] NOT NULL,
	[reply_to_post_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_published] [tinyint] NOT NULL,
	[is_marked_spam] [tinyint] NOT NULL,
	[is_featured] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[content] [nvarchar](max) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_forum_posts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forum_threads]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forum_threads](
	[views_count] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[threadType] [int] NOT NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[posts_count] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_post_user_name] [nvarchar](255) NULL,
	[last_post_user_id] [uniqueidentifier] NULL,
	[last_post_id] [uniqueidentifier] NULL,
	[last_post_date] [datetime] NULL,
	[last_modified] [datetime] NOT NULL,
	[item_default_url_] [nvarchar](255) NULL,
	[is_published] [tinyint] NOT NULL,
	[is_marked_spam] [tinyint] NOT NULL,
	[is_locked] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[forum_id] [uniqueidentifier] NOT NULL,
	[first_post_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NOT NULL,
	[block_crawlers] [tinyint] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_forum_threads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forums]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forums](
	[url_name_] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[threads_count] [int] NOT NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[posts_count] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[last_thread_id] [uniqueidentifier] NULL,
	[last_post_user_name] [nvarchar](255) NULL,
	[last_post_user_id] [uniqueidentifier] NULL,
	[last_post_id] [uniqueidentifier] NULL,
	[last_post_date] [datetime] NULL,
	[last_modified] [datetime] NOT NULL,
	[item_default_url_] [nvarchar](255) NULL,
	[is_locked] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_in_sitemap] [tinyint] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[icon_id] [uniqueidentifier] NULL,
	[group_id] [uniqueidentifier] NULL,
	[description] [nvarchar](255) NULL,
	[defaultPageId] [uniqueidentifier] NULL,
	[date_created] [datetime] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[attachmentsRequiredRole] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[allowed_attachment_extensions] [varchar](max) NULL,
	[allowAttachments] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_forums] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_forums_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_forums_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_forums_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_frm_dscrptn_pblshd_trnsltns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_frm_dscrptn_pblshd_trnsltns](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_pbl_EC8DDC75] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_frm_dscrptn_sf_lnguage_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_sf__C7B8CF01] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_frm_dscrptn_sf_prsnttn_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_frm_dscrptn_sf_prsnttn_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_sf__623C8D91] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_frm_dscrpton_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_frm_dscrpton_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_frm_dscrptn_sf__224E7794] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_idsrv_claims]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_idsrv_claims](
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[ext_provider_name] [nvarchar](255) NOT NULL,
	[ext_id] [nvarchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[data] [nvarchar](max) NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_idsrv_claims] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_idsrv_consents]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_idsrv_consents](
	[scopes] [varchar](255) NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[idsrv_key] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_idsrv_consents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_idsrv_keys]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_idsrv_keys](
	[subject_id] [varchar](255) NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[client_id] [varchar](255) NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_idsrv_keys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_idsrv_tokens]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_idsrv_tokens](
	[token_type] [int] NOT NULL,
	[token_key] [varchar](255) NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[idsrv_key] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expire_date] [datetime] NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_idsrv_tokens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_issue_subscriber_report]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_issue_subscriber_report](
	[sf_subscriber_id] [uniqueidentifier] NULL,
	[message_status] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[sf_campaign_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[has_unsubscribed] [tinyint] NOT NULL,
	[has_clicked] [tinyint] NOT NULL,
	[delivery_status] [int] NOT NULL,
	[date_opened] [datetime] NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_issue_subscriber_report] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_language_data](
	[scheduled_date] [datetime] NULL,
	[publication_date] [datetime] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[language_version] [int] NOT NULL,
	[language] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[content_state] [int] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_language_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lbraries_thumbnail_profiles]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lbraries_thumbnail_profiles](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_lbrrs_thmbnl_pr_AB6293EA] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_libraries]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_libraries](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](255) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[running_task] [uniqueidentifier] NULL,
	[cache_profile] [varchar](255) NULL,
	[tmb_regen] [tinyint] NOT NULL,
	[max_size] [bigint] NOT NULL,
	[max_item_size] [bigint] NOT NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[is_deleted] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[security_provider] [varchar](255) NULL,
	[cover_id] [uniqueidentifier] NULL,
	[client_cache_profile] [varchar](255) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[blob_storage] [varchar](255) NULL,
	[voa_class] [int] NOT NULL,
	[resize_on_upload] [tinyint] NULL,
	[new_size] [int] NULL,
 CONSTRAINT [pk_sf_libraries] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_libraries_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_libraries_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_libraries_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_libraries_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_libraries_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_libraries_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lic_user_activity]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lic_user_activity](
	[user_id] [uniqueidentifier] NOT NULL,
	[token_id] [varchar](255) NULL,
	[provider_name] [varchar](255) NULL,
	[login_ip] [varchar](50) NULL,
	[last_login_date] [datetime] NULL,
	[last_activity_date] [datetime] NOT NULL,
	[is_logged_in] [tinyint] NOT NULL,
	[is_backend_user] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_lic_user_activity] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_link_click_stat]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_link_click_stat](
	[sf_link_click_stat_id] [int] NOT NULL,
	[url] [nvarchar](4000) NULL,
	[subscriber_id] [uniqueidentifier] NULL,
	[date_time_clicked] [datetime] NOT NULL,
	[campaign_id] [uniqueidentifier] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_link_click_stat] PRIMARY KEY CLUSTERED 
(
	[sf_link_click_stat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[parent_id] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[content_] [nvarchar](max) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_list_items] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_list_items_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_list_items_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_lst_tms_sf_lngg_4BD5B8B5] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_lst_tms_sf_prms_D8AE2BE6] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_list_items_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_list_items_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_list_items_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lists]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lists](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[sort_order] [varchar](255) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_lists] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lists_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lists_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_lists_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lists_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lists_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_lists_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_locks]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_locks](
	[lckr] [uniqueidentifier] NULL,
	[last_mod] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_locks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lst]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lst](
	[wlcme_template_id] [uniqueidentifier] NULL,
	[welcome_message_subject] [nvarchar](255) NULL,
	[welcome_message_email_address] [varchar](255) NULL,
	[unsubscribe_page_id] [uniqueidentifier] NULL,
	[total_unsubscriptions] [int] NOT NULL,
	[title_] [nvarchar](255) NULL,
	[subscription_reminder_] [nvarchar](255) NULL,
	[send_welcome_message] [tinyint] NOT NULL,
	[send_good_bye_message] [tinyint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[gd_by_template_id] [uniqueidentifier] NULL,
	[good_bye_message_subject] [nvarchar](255) NULL,
	[good_bye_message_email_address] [varchar](255) NULL,
	[default_subject_] [nvarchar](255) NULL,
	[default_reply_to_email_] [nvarchar](255) NULL,
	[default_from_name_] [nvarchar](255) NULL,
	[application_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_lst] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lst_sf_subscriber]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lst_sf_subscriber](
	[id2] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_lst_sf_subscriber] PRIMARY KEY CLUSTERED 
(
	[id2] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_lst_tms_pblshd_translations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_lst_tms_pblshd_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_lst_tms_pblshd__72DA5D73] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_manager_info]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_manager_info](
	[provider_name] [varchar](255) NULL,
	[manager_type] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_manager_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dnc_cnt_provider]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dnc_cnt_provider](
	[parent_secured_object_type] [varchar](255) NULL,
	[parent_secured_object_title] [varchar](255) NULL,
	[parent_secured_object_id] [uniqueidentifier] NULL,
	[nme] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dnc_cnt_provider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mb_dnc_cnt_prvd_0B25FC74] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynamic_module]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynamic_module](
	[url_name] [varchar](255) NULL,
	[title] [varchar](255) NULL,
	[status] [int] NOT NULL,
	[page_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[origin] [varchar](255) NULL,
	[nme] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](max) NULL,
	[dfault_backend_definition_name] [varchar](255) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynamic_module] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynamic_module_field]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynamic_module_field](
	[widget_type_name] [varchar](255) NULL,
	[video_max_size] [int] NOT NULL,
	[video_extensions] [varchar](255) NULL,
	[type_u_i_name] [varchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[special_type] [int] NOT NULL,
	[show_in_grid] [tinyint] NOT NULL,
	[related_data_type] [varchar](255) NULL,
	[related_data_provider] [varchar](255) NULL,
	[regular_expression] [varchar](255) NULL,
	[recommended_characters_count] [int] NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[parent_section_id] [uniqueidentifier] NULL,
	[origin] [varchar](255) NULL,
	[ordinal] [int] NOT NULL,
	[number_unit] [nvarchar](255) NULL,
	[nme] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[min_number_range] [varchar](255) NULL,
	[min_length] [int] NOT NULL,
	[media_type] [varchar](255) NULL,
	[max_number_range] [varchar](255) NULL,
	[max_length] [int] NOT NULL,
	[length_validation_message] [nvarchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_transient] [tinyint] NOT NULL,
	[is_rquired_to_select_ddl_value] [tinyint] NOT NULL,
	[is_required_to_select_checkbox] [tinyint] NOT NULL,
	[is_required] [tinyint] NOT NULL,
	[is_localizable] [tinyint] NOT NULL,
	[is_hidden_field] [tinyint] NOT NULL,
	[instructional_text] [nvarchar](max) NULL,
	[instructional_choice] [nvarchar](255) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_in_indexes] [tinyint] NOT NULL,
	[image_max_size] [int] NOT NULL,
	[image_extensions] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[grid_column_ordinal] [int] NOT NULL,
	[frontend_widget_type_name] [varchar](255) NULL,
	[frontend_widget_label] [varchar](255) NULL,
	[file_max_size] [int] NOT NULL,
	[file_extensions] [varchar](255) NULL,
	[field_type] [int] NOT NULL,
	[field_namespace] [varchar](255) NULL,
	[disable_link_parser] [tinyint] NOT NULL,
	[default_value] [nvarchar](255) NULL,
	[decimal_places_count] [int] NOT NULL,
	[ddl_choice_default_value_index] [int] NOT NULL,
	[d_b_type] [varchar](255) NULL,
	[d_b_length] [varchar](255) NULL,
	[column_name] [varchar](255) NULL,
	[classification_id] [uniqueidentifier] NULL,
	[choices] [nvarchar](max) NULL,
	[choice_render_type] [varchar](255) NULL,
	[checked_by_default] [tinyint] NOT NULL,
	[can_select_multiple_items] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[cn_crate_items_while_selecting] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[allow_nulls] [tinyint] NOT NULL,
	[allow_multiple_videos] [tinyint] NOT NULL,
	[allow_multiple_images] [tinyint] NOT NULL,
	[allow_multiple_files] [tinyint] NOT NULL,
	[allow_image_library] [tinyint] NOT NULL,
	[address_field_mode] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynamic_module_field] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynamic_module_type]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynamic_module_type](
	[type_namespace] [varchar](255) NULL,
	[type_name] [varchar](255) NULL,
	[parentTypeId] [uniqueidentifier] NULL,
	[parent_module_id] [uniqueidentifier] NULL,
	[pageId] [uniqueidentifier] NULL,
	[origin] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[main_short_text_field_name] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_slf_referencing] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[display_name] [varchar](255) NULL,
	[check_field_permissions] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynamic_module_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynmc_mdl_fl_E46A35E8] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynmc_mdl_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynmc_mdl_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynmc_mdl_sf_9CDD90B2] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mb_dynmc_mdl_ty_C5800E63] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mb_fields_backend_section]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mb_fields_backend_section](
	[title] [varchar](255) NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[ordinal] [int] NOT NULL,
	[nme] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_expanded_by_default] [tinyint] NOT NULL,
	[is_expandable] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[expand_text] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_mb_flds_bcknd_s_B04B67A6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mbl_frmt_cntnt_types]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mbl_frmt_cntnt_types](
	[siteId] [uniqueidentifier] NULL,
	[name] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[fullName] [varchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_mbl_frmt_cntnt_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mbl_frmt_dfntns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mbl_frmt_dfntns](
	[siteId] [uniqueidentifier] NULL,
	[setting_name] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
	[active] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_mbl_frmt_dfntns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_mbl_frmt_sf_mbl_CFE44BB5] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mbl_frmt_templates]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mbl_frmt_templates](
	[use_custom_canonical_url] [tinyint] NOT NULL,
	[template_name] [varchar](255) NULL,
	[mbl_frmt_dfntn_id] [uniqueidentifier] NULL,
	[mbl_frmt_cntnt_type_id] [uniqueidentifier] NULL,
	[layout_template_name] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[custom_canonical_url_format] [nvarchar](510) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_mbl_frmt_templates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_md_cntnt_pblshd_trnslations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_md_cntnt_pblshd_trnslations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_md_cntnt_pblshd_A71A6401] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_md_content_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_md_content_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_md_cntnt_sf_lng_B0245982] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_mdia_content_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_mdia_content_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_md_cntnt_sf_prm_BB882621] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[was_published] [tinyint] NULL,
	[lgcy_tmb_strg] [tinyint] NOT NULL,
	[uploaded] [tinyint] NOT NULL,
	[tmb_vrsn] [int] NOT NULL,
	[parent_id] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[tmb_regen] [tinyint] NOT NULL,
	[media_file_url_name_] [nvarchar](510) NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[folder_id] [uniqueidentifier] NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[blob_storage] [varchar](255) NULL,
	[author_] [nvarchar](255) NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[parts_] [nvarchar](255) NULL,
	[alternative_text_] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_media_content] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_category2]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_category2](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_category2] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_category3]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_category3](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_category3] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_tags2]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_tags2](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_tags2] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_content_tags3]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_content_tags3](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_media_content_tags3] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_file_links]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_file_links](
	[width] [int] NULL,
	[total_size] [bigint] NULL,
	[number_of_chunks] [int] NULL,
	[mime_type] [varchar](255) NULL,
	[content_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[height] [int] NULL,
	[file_path] [nvarchar](510) NULL,
	[file_id] [uniqueidentifier] NULL,
	[extension] [varchar](255) NULL,
	[default_url] [nvarchar](510) NULL,
	[culture] [int] NOT NULL,
	[chunk_size] [int] NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_media_file_links] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_file_urls]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_file_urls](
	[url] [nvarchar](510) NULL,
	[redirect_to_default] [tinyint] NOT NULL,
	[media_file_link_id] [uniqueidentifier] NULL,
	[is_default] [tinyint] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_media_file_urls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_media_thumbnails]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_media_thumbnails](
	[width] [int] NULL,
	[typ] [int] NOT NULL,
	[total_size] [bigint] NOT NULL,
	[content_id] [uniqueidentifier] NULL,
	[nme] [nvarchar](10) NULL,
	[mime_type] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[height] [int] NULL,
	[file_id] [uniqueidentifier] NULL,
	[dta] [image] NULL,
	[culture] [varchar](255) NULL,
	[uploaded] [tinyint] NOT NULL,
	[number_of_chunks] [int] NOT NULL,
	[chunk_size] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_media_thumbnails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_message_body]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_message_body](
	[was_template_copied] [tinyint] NULL,
	[plain_text_version] [nvarchar](max) NULL,
	[nme] [nvarchar](255) NULL,
	[message_body_type] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[is_template] [tinyint] NOT NULL,
	[internal_page_template_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[copied_template_id] [uniqueidentifier] NULL,
	[body_text] [nvarchar](max) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_message_body] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_attribute]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_attribute](
	[val] [nvarchar](max) NULL,
	[nme] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_meta_attribute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_data_mapping]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_data_mapping](
	[type_name] [varchar](255) NOT NULL,
	[table_name] [varchar](255) NULL,
	[module_name] [varchar](255) NOT NULL,
	[field_name] [varchar](255) NOT NULL,
 CONSTRAINT [pk_sf_meta_data_mapping] PRIMARY KEY CLUSTERED 
(
	[field_name] ASC,
	[module_name] ASC,
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_fields]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_fields](
	[validation] [varchar](255) NULL,
	[ui_hint] [varchar](255) NULL,
	[title_] [varchar](255) NULL,
	[taxonomy_provider] [varchar](255) NULL,
	[taxonomy_id] [uniqueidentifier] NULL,
	[storage_type] [int] NOT NULL,
	[sitefinity_type] [varchar](255) NULL,
	[section_name] [varchar](255) NULL,
	[required] [tinyint] NOT NULL,
	[regular_expression] [varchar](255) NULL,
	[recommended_characters_count] [int] NULL,
	[position_in_section] [int] NOT NULL,
	[type_id] [uniqueidentifier] NULL,
	[origin] [varchar](255) NULL,
	[min_value] [varchar](255) NULL,
	[max_value] [varchar](255) NULL,
	[max_length] [int] NOT NULL,
	[linked_content_provider] [varchar](255) NULL,
	[two_way_content_link] [tinyint] NOT NULL,
	[is_single_taxon] [tinyint] NOT NULL,
	[is_protected_relation] [tinyint] NOT NULL,
	[is_localizable] [tinyint] NULL,
	[is_internal] [tinyint] NOT NULL,
	[is_dynamic] [tinyint] NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[hidden] [tinyint] NOT NULL,
	[field_name] [varchar](255) NULL,
	[display_format] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_value_expression] [varchar](255) NULL,
	[default_value] [varchar](255) NULL,
	[default_fetch_group] [tinyint] NOT NULL,
	[db_type] [varchar](255) NULL,
	[db_sql_type] [varchar](255) NULL,
	[db_scale] [varchar](255) NULL,
	[db_length] [varchar](255) NULL,
	[column_name] [varchar](255) NULL,
	[clr_type] [varchar](255) NULL,
	[choice_field_definition] [nvarchar](max) NULL,
	[app_name] [varchar](255) NULL,
	[allow_multiple_relations] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_fields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_index]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_index](
	[unque] [tinyint] NOT NULL,
	[nme] [varchar](255) NULL,
	[id2] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[clstered] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_index] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_index_composite_fields]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_index_composite_fields](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_mt_ndx_cmpst_fl_D7A2AAB2] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_type_descriptions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_type_descriptions](
	[user_friendly_name] [nvarchar](255) NULL,
	[meta_type_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[app_name] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_type_descriptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_types]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_types](
	[section_captions_resource_type] [varchar](255) NULL,
	[parent_type_id] [uniqueidentifier] NULL,
	[origin] [varchar](255) NULL,
	[name_space] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[is_dynamic] [tinyint] NOT NULL,
	[is_deleted] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[database_inheritance] [int] NOT NULL,
	[class_name] [varchar](255) NULL,
	[base_class_name] [varchar](255) NULL,
	[assembly_name] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_meta_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_meta_types_section_names]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_meta_types_section_names](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_meta_types_section_names] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_module_vrsn]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_module_vrsn](
	[version] [varchar](255) NULL,
	[previous_version] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[error_msg] [nvarchar](max) NULL,
 CONSTRAINT [pk_sf_module_vrsn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_network_subtaxa]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_network_subtaxa](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_network_subtaxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_network_supertaxa]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_network_supertaxa](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_network_supertaxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items](
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[post_rights] [int] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_content_id] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[include_in_sitemap] [tinyint] NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[expiration_date] [datetime] NULL,
	[email_author] [tinyint] NULL,
	[draft_culture] [varchar](255) NULL,
	[description_] [nvarchar](max) NULL,
	[default_page_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NULL,
	[content_state] [varchar](255) NULL,
	[approve_comments] [tinyint] NULL,
	[app_name] [varchar](255) NULL,
	[allow_track_backs] [tinyint] NULL,
	[allow_comments] [tinyint] NULL,
	[was_published] [tinyint] NULL,
	[summary_] [nvarchar](4000) NULL,
	[source_site] [nvarchar](255) NULL,
	[source_name] [nvarchar](255) NULL,
	[item_default_url_] [nvarchar](510) NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[content_] [nvarchar](max) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[author_] [nvarchar](255) NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_news_items] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items_category]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items_category](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_news_items_category] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items_sf_commnt]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items_sf_commnt](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[content_id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_news_items_sf_commnt] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_nws_tms_sf_lngg_23D548D9] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items_sf_permissions](
	[content_id] [uniqueidentifier] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_nws_tms_sf_prms_96463089] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_news_items_tags]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_news_items_tags](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_news_items_tags] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_cmplt_msg_job]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_cmplt_msg_job](
	[sf_notif_cmplt_msg_job_id] [int] NOT NULL,
	[total_delivery_subscribers] [int] NULL,
	[timeStarted] [datetime] NOT NULL,
	[timeCompleted] [datetime] NOT NULL,
	[module_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NULL,
	[description] [varchar](255) NULL,
	[account_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_notif_cmplt_msg_job] PRIMARY KEY CLUSTERED 
(
	[sf_notif_cmplt_msg_job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_msg_job]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_msg_job](
	[subsription_list_id] [uniqueidentifier] NULL,
	[sender_profile_name] [nvarchar](100) NULL,
	[sender_name] [nvarchar](255) NULL,
	[sender_address] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[message_template_id] [uniqueidentifier] NULL,
	[last_activity_date] [datetime] NULL,
	[job_status] [int] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[failure_description] [nvarchar](max) NULL,
	[description] [nvarchar](255) NULL,
	[clear_subscription_data] [tinyint] NOT NULL,
	[account_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_notif_msg_job] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_msg_job_log]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_msg_job_log](
	[subscription_id] [uniqueidentifier] NOT NULL,
	[message_job_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_notif_msg_job_log] PRIMARY KEY CLUSTERED 
(
	[message_job_id] ASC,
	[subscription_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_msg_template]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_msg_template](
	[sender_name] [nvarchar](255) NULL,
	[sender_email] [nvarchar](255) NULL,
	[subject] [nvarchar](255) NULL,
	[resolve_key] [nvarchar](255) NULL,
	[plain_text_version] [nvarchar](max) NULL,
	[module_name] [varchar](255) NULL,
	[last_modified_by_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[body_html] [nvarchar](max) NULL,
	[account_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_notif_msg_template] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_subscr_list]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_subscr_list](
	[title] [nvarchar](255) NULL,
	[resolve_key] [nvarchar](100) NULL,
	[module_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](255) NULL,
	[account_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_notif_subscr_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_subscribers]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_subscribers](
	[resolve_key] [nvarchar](100) NULL,
	[module_name] [varchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[disabled] [tinyint] NOT NULL,
	[account_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_notif_subscribers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_notif_subscriptions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_notif_subscriptions](
	[subscriber_id] [uniqueidentifier] NULL,
	[list_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_notif_subscriptions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_ntf_msg_jb_cstm_BA0FDFEC] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_ntf_msg_jb_xcld_6290C7BE] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ntf_sbscrbrs_cstm_prperties]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_ntf_sbscrbrs_cs_1708B61C] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_nws_tms_pblshd_translations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_nws_tms_pblshd_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_nws_tms_pblshd__4B060187] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_object_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_object_data](
	[vrsn] [int] NOT NULL,
	[strategy] [smallint] NOT NULL,
	[parent_prop_id] [uniqueidentifier] NULL,
	[parent_id] [uniqueidentifier] NULL,
	[object_type] [varchar](510) NULL,
	[multilingual_version] [nvarchar](max) NULL,
	[last_modified] [datetime] NULL,
	[is_backend_object] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dictionary_key] [varchar](255) NULL,
	[collection_index] [int] NOT NULL,
	[app_name] [varchar](50) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[sibling_id] [uniqueidentifier] NULL,
	[shred] [tinyint] NULL,
	[place_holder] [varchar](255) NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[original_control_id] [uniqueidentifier] NULL,
	[is_personalized] [tinyint] NULL,
	[is_overrided_control] [tinyint] NULL,
	[is_layout_control] [tinyint] NULL,
	[is_data_source] [tinyint] NULL,
	[inherits_permissions] [tinyint] NULL,
	[editable] [tinyint] NULL,
	[description_] [nvarchar](255) NULL,
	[id2] [uniqueidentifier] NULL,
	[caption_] [nvarchar](255) NULL,
	[can_inherit_permissions] [tinyint] NULL,
	[base_control_id] [uniqueidentifier] NULL,
	[allow_security] [tinyint] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[page_id] [uniqueidentifier] NULL,
	[enable_override_for_control] [tinyint] NULL,
	[enable_override_for_control2] [tinyint] NULL,
	[published] [tinyint] NULL,
	[content_id] [uniqueidentifier] NULL,
	[published2] [tinyint] NULL,
	[id3] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_object_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_object_data_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_object_data_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_bjct_dt_sf_prms_20DDAA71] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ocd_dpndncies]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ocd_dpndncies](
	[type_id] [int] NOT NULL,
	[item_key] [nvarchar](255) NOT NULL,
	[cache_key] [nvarchar](255) NOT NULL,
 CONSTRAINT [pk_sf_ocd_dpndncies] PRIMARY KEY CLUSTERED 
(
	[item_key] ASC,
	[cache_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ocd_itms]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ocd_itms](
	[url] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[site_map_node_key] [varchar](255) NULL,
	[site_id] [uniqueidentifier] NULL,
	[priority] [int] NOT NULL,
	[lang] [varchar](84) NULL,
	[key] [nvarchar](255) NOT NULL,
	[host] [nvarchar](255) NULL,
	[e_tag] [nvarchar](255) NULL,
	[date_modified] [datetime] NULL,
	[cacheVaryKey] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_ocd_itms] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_ocd_typs]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_ocd_typs](
	[type_name] [nvarchar](255) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_sf_ocd_typs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_open_stat]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_open_stat](
	[sf_open_stat_id] [int] NOT NULL,
	[subscriber_id] [uniqueidentifier] NOT NULL,
	[opened_date] [datetime] NOT NULL,
	[campaign_id] [uniqueidentifier] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_open_stat] PRIMARY KEY CLUSTERED 
(
	[sf_open_stat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_data](
	[theme] [nvarchar](255) NULL,
	[votes_sum] [numeric](20, 10) NOT NULL,
	[votes_count] [bigint] NOT NULL,
	[visible] [tinyint] NOT NULL,
	[views_count] [int] NOT NULL,
	[view_state_encryption] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[variation_type_key] [varchar](255) NULL,
	[validate_request] [tinyint] NOT NULL,
	[url_evaluation_mode] [int] NOT NULL,
	[trace_mode] [int] NOT NULL,
	[trace] [tinyint] NOT NULL,
	[template_name] [varchar](255) NULL,
	[template_id] [uniqueidentifier] NULL,
	[status] [int] NOT NULL,
	[source_key] [varchar](255) NULL,
	[response_encoding] [varchar](255) NULL,
	[renderer] [varchar](255) NULL,
	[publication_date] [datetime] NOT NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[cache_profile] [varchar](255) NULL,
	[page_node_id] [uniqueidentifier] NULL,
	[master_page] [varchar](255) NULL,
	[maintain_scroll] [tinyint] NOT NULL,
	[locked_by] [uniqueidentifier] NULL,
	[last_modified_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[last_control_id] [int] NOT NULL,
	[keywords_] [nvarchar](500) NULL,
	[is_personalized] [tinyint] NOT NULL,
	[is_auto_created] [tinyint] NOT NULL,
	[include_script_manger] [tinyint] NOT NULL,
	[content_id] [uniqueidentifier] NOT NULL,
	[html_title_] [nvarchar](500) NULL,
	[head_tag_content] [nvarchar](max) NULL,
	[flags] [int] NOT NULL,
	[external_page] [varchar](255) NULL,
	[expiration_date] [datetime] NULL,
	[error_page] [varchar](255) NULL,
	[enable_view_state_mac] [tinyint] NOT NULL,
	[enable_view_state] [tinyint] NOT NULL,
	[enable_theming] [tinyint] NOT NULL,
	[enable_session_state] [tinyint] NOT NULL,
	[enable_event_validation] [tinyint] NOT NULL,
	[description_] [nvarchar](max) NULL,
	[date_created] [datetime] NULL,
	[culture] [varchar](10) NULL,
	[content_state] [varchar](255) NULL,
	[comments_count] [int] NOT NULL,
	[code_behind_type] [nvarchar](510) NULL,
	[build_stamp] [int] NOT NULL,
	[buffer_output] [tinyint] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_page_data] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_data_attrbutes]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_data_attrbutes](
	[content_id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](1000) NULL,
 CONSTRAINT [pk_sf_page_data_attrbutes] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_data_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_data_sf_language_data](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pg_dt_sf_lngg_d_E6BFA2AD] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_node]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_node](
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](500) NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[root_id] [uniqueidentifier] NULL,
	[require_ssl] [tinyint] NOT NULL,
	[render_as_link] [tinyint] NOT NULL,
	[redirect_url_] [nvarchar](255) NULL,
	[priority] [real] NOT NULL,
	[previous_parent_id] [uniqueidentifier] NULL,
	[parent_id] [uniqueidentifier] NULL,
	[content_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [real] NOT NULL,
	[open_new_window] [tinyint] NOT NULL,
	[node_type] [int] NOT NULL,
	[nme] [varchar](255) NULL,
	[module_name] [varchar](255) NULL,
	[loc_strtgy] [smallint] NOT NULL,
	[linked_node_provider] [varchar](255) NULL,
	[linked_node_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_deleted] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[inc_in_srch_idx] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[extension] [nvarchar](255) NULL,
	[enable_default_canonical_url] [tinyint] NULL,
	[description_] [nvarchar](500) NULL,
	[date_created] [datetime] NULL,
	[crawlable] [tinyint] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[approval_workflow_state_] [nvarchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[allow_parameters_validation] [tinyint] NOT NULL,
	[allow_multiple_urls] [tinyint] NOT NULL,
 CONSTRAINT [pk_sf_page_node] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_node_attrbutes]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_node_attrbutes](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](1000) NULL,
 CONSTRAINT [pk_sf_page_node_attrbutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_node_references]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_node_references](
	[page_node_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](50) NULL,
 CONSTRAINT [pk_sf_page_node_references] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_node_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_node_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_page_node_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_page_templates]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_page_templates](
	[theme] [nvarchar](255) NULL,
	[view_state_encryption] [int] NOT NULL,
	[vrsion] [int] NOT NULL,
	[validate_request] [tinyint] NOT NULL,
	[ui_culture] [varchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[smart_navigation] [tinyint] NOT NULL,
	[sliding_expiration] [tinyint] NOT NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[response_encoding] [varchar](255) NULL,
	[require_ssl] [tinyint] NOT NULL,
	[personalization_segment_id] [uniqueidentifier] NULL,
	[personalization_master_id] [uniqueidentifier] NULL,
	[prent_template_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[ordinal] [smallint] NOT NULL,
	[nme] [varchar](255) NULL,
	[master_page] [varchar](255) NULL,
	[maintain_scroll] [tinyint] NOT NULL,
	[locked_by] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[last_control_id] [int] NOT NULL,
	[keywords_] [nvarchar](255) NULL,
	[ky] [varchar](255) NULL,
	[is_personalized] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[include_script_manger] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[framework] [int] NULL,
	[error_page] [varchar](255) NULL,
	[enable_view_state_mac] [tinyint] NOT NULL,
	[enable_view_state] [tinyint] NOT NULL,
	[enable_theming] [tinyint] NOT NULL,
	[enable_session_state] [tinyint] NOT NULL,
	[enable_event_validation] [tinyint] NOT NULL,
	[description_] [nvarchar](255) NULL,
	[culture] [varchar](255) NULL,
	[category] [uniqueidentifier] NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[cache_output] [tinyint] NOT NULL,
	[cache_duration] [int] NOT NULL,
	[buffer_output] [tinyint] NOT NULL,
	[app_name] [varchar](50) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_page_templates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_mppng_sf_pp_mppng_t]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_mppng_sf_pp_mppng_t](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pblshng_mppng_s_9695ECE0] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_mppng_src_prprty_nm]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_mppng_src_prprty_nm](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pblshng_mppng_s_9C1F42DB] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pblshng_mppng_s_F2A620C4] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pblshng_pp_sttn_D50A08BB] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_pp_sttngs_ddtnl_dta]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_pp_sttngs_ddtnl_dta](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](max) NULL,
 CONSTRAINT [pk_sf_pblshng_pp_sttn_2ED0E784] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pblshng_pp_sttngs_lngge_ids]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pblshng_pp_sttn_C9421CF4] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pckgng_addn_lnks]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pckgng_addn_lnks](
	[itm_type] [varchar](255) NULL,
	[itm_prvdr] [varchar](255) NULL,
	[itm_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[addn_id] [uniqueidentifier] NULL,
	[addtnl_info] [varchar](max) NULL,
 CONSTRAINT [pk_sf_pckgng_addn_lnks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pckgng_addns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pckgng_addns](
	[version] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[addn_id] [uniqueidentifier] NOT NULL,
	[description] [varchar](max) NULL,
	[author] [varchar](255) NULL,
	[addn_key] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pckgng_addns] PRIMARY KEY CLUSTERED 
(
	[addn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pckgng_addns_err_stts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pckgng_addns_err_stts](
	[has_errs_on_strctr_imprt] [tinyint] NOT NULL,
	[has_errs_on_cntnt_imprt] [tinyint] NOT NULL,
	[has_errs_on_actvt] [tinyint] NOT NULL,
	[addn_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_pckgng_addns_err_stts] PRIMARY KEY CLUSTERED 
(
	[addn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pckgng_addns_stts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pckgng_addns_stts](
	[strctr_stts] [int] NULL,
	[site_id] [uniqueidentifier] NOT NULL,
	[dta_stts] [int] NULL,
	[addn_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_pckgng_addns_stts] PRIMARY KEY CLUSTERED 
(
	[addn_id] ASC,
	[site_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pckgng_pckgs]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pckgng_pckgs](
	[version] [uniqueidentifier] NOT NULL,
	[owner] [uniqueidentifier] NULL,
	[name] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[hash] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pckgng_pckgs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_permissions](
	[set_name] [varchar](250) NOT NULL,
	[principal_id] [uniqueidentifier] NOT NULL,
	[object_id] [uniqueidentifier] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[grnt] [int] NOT NULL,
	[deny] [int] NOT NULL,
	[app_name] [varchar](50) NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_permissions_inheritance_map]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_permissions_inheritance_map](
	[sf_prmssons_inheritance_map_id] [int] NOT NULL,
	[object_id] [uniqueidentifier] NULL,
	[child_object_type_name] [varchar](255) NULL,
	[child_object_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_prmssns_nhrtnc__5FB021A6] PRIMARY KEY CLUSTERED 
(
	[sf_prmssons_inheritance_map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pg_dt_pblished_translations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pg_dt_pblished_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pg_dt_pblshd_tr_0AFD0240] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pg_nd_prmssnst_bjct_ttl_rs_]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pg_nd_prmssnst_bjct_ttl_rs_](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pg_nd_prmssnst__6762D058] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pg_templates_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pg_templates_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_pg_tmplts_sf_pr_82317AA0] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pg_tmpltes_sf_language_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pg_tmpltes_sf_language_data](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_pg_tmplts_sf_ln_B0860E72] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pg_tmplts_pblshd_trnsltions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_pg_tmplts_pblsh_269E8002] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_pipe_mapping_translation]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_pipe_mapping_translation](
	[translator_settings] [varchar](255) NULL,
	[translator_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_pipe_mapping_translation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_presentation_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_presentation_data](
	[theme] [varchar](50) NULL,
	[resource_assembly_name] [varchar](255) NULL,
	[ownr] [uniqueidentifier] NULL,
	[nme] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[embedded_template_name] [varchar](255) NULL,
	[date_created] [datetime] NULL,
	[data_type] [varchar](50) NULL,
	[dta] [nvarchar](max) NULL,
	[app_name] [varchar](50) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[resource_class_id] [varchar](255) NULL,
	[name_for_developers] [varchar](255) NULL,
	[is_different_from_embedded] [tinyint] NULL,
	[friendly_control_name] [varchar](255) NULL,
	[control_type] [varchar](255) NULL,
	[item_id] [uniqueidentifier] NULL,
	[condition] [varchar](255) NULL,
	[area_name] [varchar](255) NULL,
	[id3] [uniqueidentifier] NULL,
	[id4] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_presentation_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_prs_criteria_group]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_prs_criteria_group](
	[sf_prs_criteria_group_id] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_prs_criteria_group] PRIMARY KEY CLUSTERED 
(
	[sf_prs_criteria_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_prs_criterion]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_prs_criterion](
	[sf_prs_criterion_id] [int] NOT NULL,
	[is_negated] [tinyint] NOT NULL,
	[criterion_value] [nvarchar](max) NULL,
	[criterion_title] [varchar](255) NULL,
	[criterion_name] [varchar](255) NULL,
	[criterion_display_value] [nvarchar](max) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_prs_criterion] PRIMARY KEY CLUSTERED 
(
	[sf_prs_criterion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_prs_crtr_grp_sf_prs_crtrion]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_prs_crtr_grp_sf_prs_crtrion](
	[sf_prs_criteria_group_id] [int] NOT NULL,
	[seq] [int] NOT NULL,
	[sf_prs_criterion_id] [int] NULL,
 CONSTRAINT [pk_sf_prs_crtr_grp_sf_CF27D9C4] PRIMARY KEY CLUSTERED 
(
	[sf_prs_criteria_group_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_prs_segment]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_prs_segment](
	[type] [varchar](255) NULL,
	[site_id] [uniqueidentifier] NULL,
	[priority] [int] NOT NULL,
	[nme] [nvarchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](max) NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_prs_segment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_prs_sgmnt_sf_prs_crtr_group]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_prs_sgmnt_sf_prs_crtr_group](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[sf_prs_criteria_group_id] [int] NULL,
 CONSTRAINT [pk_sf_prs_sgmnt_sf_pr_5C3F8446] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_mapping]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_mapping](
	[typ] [varchar](255) NULL,
	[is_required] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[destination_property_name] [varchar](255) NOT NULL,
	[defaultvalue] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_publishing_mapping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_mapping_settings]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_mapping_settings](
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_pblshng_mppng_s_8F8AE549] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_pipe_settings]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_pipe_settings](
	[ui_name] [varchar](255) NULL,
	[title] [nvarchar](max) NULL,
	[schedule_type] [int] NOT NULL,
	[schedule_time] [datetime] NULL,
	[schedule_day] [int] NOT NULL,
	[resource_class_id] [varchar](255) NULL,
	[id3] [uniqueidentifier] NULL,
	[pipe_name] [varchar](255) NOT NULL,
	[max_items] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[is_inbound] [tinyint] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[invocation_mode] [int] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[filter_expression] [nvarchar](max) NULL,
	[description] [nvarchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[pop3_user_name] [varchar](255) NULL,
	[pop3_server] [varchar](255) NULL,
	[pop3_port] [int] NULL,
	[pop3_password] [varchar](255) NULL,
	[is_ssl_connection] [tinyint] NULL,
	[user_name_reference] [varchar](255) NULL,
	[search_pattern] [varchar](255) NULL,
	[app_name_reference] [varchar](255) NULL,
	[url_name] [nvarchar](255) NULL,
	[output_settings] [int] NULL,
	[format_settings] [int] NULL,
	[content_size] [int] NULL,
	[search_provider_name] [varchar](255) NULL,
	[catalog_name] [varchar](255) NULL,
	[provider_name] [varchar](255) NULL,
	[imported_item_parent_id] [uniqueidentifier] NULL,
	[import_item_as_published] [tinyint] NULL,
	[content_type_name] [varchar](255) NULL,
	[back_links_page_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_publishing_pipe_settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_point]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_point](
	[storage_type_name] [varchar](255) NULL,
	[storage_item_provider_name] [varchar](255) NULL,
	[id2] [uniqueidentifier] NULL,
	[pblshng_pnt_bsness_object_name] [nvarchar](255) NULL,
	[ownr] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) NULL,
	[last_publication_date] [datetime] NULL,
	[last_modified] [datetime] NULL,
	[is_template] [tinyint] NULL,
	[is_shared_with_all_sites] [tinyint] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[inbound_pipes_template] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](255) NULL,
	[date_created] [datetime] NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_publishing_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_point_settings]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_point_settings](
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[item_filter_strategy] [int] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_pblshng_pnt_stt_9CE0E251] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_publishing_throttle_settings]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_publishing_throttle_settings](
	[time_interval] [int] NOT NULL,
	[limit] [int] NOT NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_pblshng_thrttl__55299912] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rbin_item]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rbin_item](
	[owner] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[del_item_wrkfl_status] [varchar](255) NULL,
	[del_item_type_name] [varchar](255) NULL,
	[del_item_title] [nvarchar](255) NULL,
	[del_item_site_id] [uniqueidentifier] NULL,
	[del_item_prvdr_name] [varchar](255) NULL,
	[del_item_parent_type_name] [varchar](255) NULL,
	[del_item_titles_path] [nvarchar](max) NULL,
	[del_item_lang] [varchar](255) NULL,
	[del_item_id] [uniqueidentifier] NULL,
	[date_created] [datetime] NOT NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_rbin_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_md_qry_ln_BE77E2B3] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rdsgn_media_query]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rdsgn_media_query](
	[nme] [varchar](255) NULL,
	[mini_site_page_id] [uniqueidentifier] NULL,
	[layout_transformations_j_s_o_n] [nvarchar](max) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[behavior] [int] NOT NULL,
	[application_name] [varchar](255) NULL,
	[additional_css_file_path] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_media_query] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rdsgn_media_query_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rdsgn_media_query_link](
	[link_type] [int] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[item_type] [varchar](255) NULL,
	[item_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_media_query_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rdsgn_media_query_rule]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rdsgn_media_query_rule](
	[width_type] [int] NOT NULL,
	[resulting_rule] [varchar](255) NULL,
	[resolution] [varchar](255) NULL,
	[parent_media_query_id] [uniqueidentifier] NULL,
	[orientation] [int] NOT NULL,
	[min_width] [varchar](255) NULL,
	[min_height] [varchar](255) NULL,
	[max_width] [varchar](255) NULL,
	[max_height] [varchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_monochrome] [tinyint] NOT NULL,
	[is_manual_media_query] [tinyint] NOT NULL,
	[is_grid] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[height_type] [int] NOT NULL,
	[exact_width] [varchar](255) NULL,
	[exact_height] [varchar](255) NULL,
	[device_type_name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[aspect_ratio] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_media_query_rule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_rdsgn_nav_trnsfrmtn]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_rdsgn_nav_trnsfrmtn](
	[transformation_name] [varchar](255) NULL,
	[parent_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[css_classes] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_rdsgn_nav_trnsfrmtn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_roles]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_roles](
	[nme] [nvarchar](255) NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_scheduled_tasks]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_scheduled_tasks](
	[type_of_schedule] [nvarchar](255) NULL,
	[title] [nvarchar](255) NULL,
	[task_name] [nvarchar](255) NOT NULL,
	[task_data] [nvarchar](max) NULL,
	[subscr_lst_id] [uniqueidentifier] NULL,
	[status_message] [nvarchar](max) NULL,
	[status] [int] NOT NULL,
	[schedule_data] [nvarchar](max) NULL,
	[progress] [int] NOT NULL,
	[owner] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[last_executed_time] [datetime] NULL,
	[language] [varchar](255) NULL,
	[ky] [nvarchar](255) NULL,
	[is_running] [tinyint] NOT NULL,
	[is_recurring] [tinyint] NOT NULL,
	[instance_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[execute_time] [datetime] NOT NULL,
	[enabled] [tinyint] NOT NULL,
	[description] [nvarchar](255) NULL,
	[concurrent_tasks_key] [varchar](255) NULL,
	[application_name] [varchar](255) NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_scheduled_tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_schema_vrsns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_schema_vrsns](
	[version_number] [int] NOT NULL,
	[previous_version_number] [int] NOT NULL,
	[module_name] [varchar](255) NOT NULL,
	[meta_data_changed] [tinyint] NOT NULL,
	[last_upgrade_date] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[cultures] [varchar](2000) NULL,
	[connection_id] [varchar](255) NOT NULL,
	[connection_hash] [varchar](255) NULL,
	[assembly] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_schema_vrsns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_schema_vrsns_meta_types]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_schema_vrsns_meta_types](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_schema_vrsns_meta_types] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_scrity_roots_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_scrity_roots_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_scrty_rts_sf_pr_062DEA6B] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_scrty_rts_prmssnst_bjct_ttl]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_scrty_rts_prmssnst_bjct_ttl](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_scrty_rts_prmss_0539814E] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_scrty_rts_spprtd_prmssn_sts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_scrty_rts_spprtd_prmssn_sts](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_scrty_rts_spprt_1F509842] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_security_roots]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_security_roots](
	[last_modified] [datetime] NULL,
	[ky] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[app_name] [varchar](50) NULL,
 CONSTRAINT [pk_sf_security_roots] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_site_data_source_links]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_site_data_source_links](
	[site_id] [uniqueidentifier] NULL,
	[provider_name] [varchar](255) NULL,
	[is_default] [bit] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dataSource_name] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_site_data_source_links] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_site_item_links]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_site_item_links](
	[site_id] [uniqueidentifier] NOT NULL,
	[item_type] [varchar](255) NOT NULL,
	[item_id] [uniqueidentifier] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_site_item_links] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[item_type] ASC,
	[site_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sitefinity_profile]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sitefinity_profile](
	[id] [uniqueidentifier] NOT NULL,
	[preferred_language] [nvarchar](255) NULL,
	[preferences] [varchar](max) NULL,
	[nickname] [nvarchar](64) NULL,
	[last_name] [nvarchar](255) NULL,
	[first_name] [nvarchar](255) NULL,
	[about] [nvarchar](max) NULL,
	[posts_count] [int] NULL,
	[is_profile_public] [bit] NULL,
 CONSTRAINT [pk_sf_sitefinity_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sites]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sites](
	[staging_url] [nvarchar](255) NULL,
	[site_map_root_node_id] [uniqueidentifier] NULL,
	[site_configuration_mode] [int] NOT NULL,
	[requires_ssl] [bit] NOT NULL,
	[redirectIfOffline] [bit] NOT NULL,
	[ownr] [uniqueidentifier] NULL,
	[offlineSiteMessage] [nvarchar](255) NULL,
	[offlinePageToRedirect] [uniqueidentifier] NULL,
	[nme] [nvarchar](255) NULL,
	[live_url] [nvarchar](255) NULL,
	[is_offline] [bit] NOT NULL,
	[isLocatedInMainMenu] [bit] NOT NULL,
	[is_default] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[home_page_id] [uniqueidentifier] NULL,
	[front_end_login_page_url] [nvarchar](255) NULL,
	[front_end_login_page_id] [uniqueidentifier] NULL,
	[default_frontend_template_id] [uniqueidentifier] NULL,
	[default_culture_key] [nvarchar](80) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_sites] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sites_culture_keys]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sites_culture_keys](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_sites_culture_keys] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sites_domain_aliases]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sites_domain_aliases](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_sites_domain_aliases] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sites_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sites_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_sites_sf_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_stat_sentence]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_stat_sentence](
	[verb] [varchar](255) NULL,
	[time_stamp] [datetime] NOT NULL,
	[subject_type] [varchar](255) NULL,
	[subject_string_meta_field5] [varchar](255) NULL,
	[subject_string_meta_field4] [varchar](255) NULL,
	[subject_string_meta_field3] [varchar](255) NULL,
	[subject_string_meta_field2] [varchar](255) NULL,
	[subject_string_meta_field1] [varchar](255) NULL,
	[subject_provider] [varchar](255) NULL,
	[subject_key] [varchar](255) NULL,
	[subject_int_meta_field] [int] NOT NULL,
	[subject_id] [uniqueidentifier] NULL,
	[subject_double_meta_field] [float] NOT NULL,
	[subject_decimal_meta_field] [numeric](20, 10) NOT NULL,
	[subject_date_time_meta_field] [datetime] NOT NULL,
	[subject_bool_meta_field] [tinyint] NOT NULL,
	[object_type] [varchar](255) NULL,
	[object_string_meta_field5] [varchar](255) NULL,
	[object_string_meta_field4] [varchar](255) NULL,
	[object_string_meta_field3] [varchar](255) NULL,
	[object_string_meta_field2] [varchar](255) NULL,
	[object_string_meta_field1] [varchar](255) NULL,
	[object_provider] [varchar](255) NULL,
	[object_key] [nvarchar](2084) NULL,
	[object_int_meta_field] [int] NOT NULL,
	[object_id] [uniqueidentifier] NULL,
	[object_double_meta_field] [float] NOT NULL,
	[object_decimal_meta_field] [numeric](20, 10) NOT NULL,
	[object_date_time_meta_field] [datetime] NOT NULL,
	[object_bool_meta_field] [tinyint] NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [pk_sf_stat_sentence] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sts_sf_st_data_source_links]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sts_sf_st_data_source_links](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_sts_sf_st_dt_sr_50593D9B] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_subscriber]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_subscriber](
	[short_id] [varchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[last_modified] [datetime] NOT NULL,
	[is_suspended] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_subscriber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_subscription_info]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_subscription_info](
	[sf_subscription_info_id] [int] NOT NULL,
	[subscription_list_id] [uniqueidentifier] NULL,
	[subscription_date] [datetime] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_subscription_info] PRIMARY KEY CLUSTERED 
(
	[sf_subscription_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_sync_lock]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_sync_lock](
	[lckr] [uniqueidentifier] NULL,
	[last_mod] [datetime] NOT NULL,
	[id] [nvarchar](255) NOT NULL,
 CONSTRAINT [pk_sf_sync_lock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_synonyms]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_synonyms](
	[weight] [int] NOT NULL,
	[val] [nvarchar](255) NULL,
	[taxon_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[culture] [int] NOT NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_synonyms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_taxa]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_taxa](
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[taxonomy_id] [uniqueidentifier] NULL,
	[status] [int] NOT NULL,
	[show_in_navigation] [tinyint] NOT NULL,
	[render_as_link] [tinyint] NOT NULL,
	[ordinal] [real] NOT NULL,
	[nme] [nvarchar](255) NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](2000) NULL,
	[app_name] [varchar](50) NULL,
	[voa_class] [int] NOT NULL,
	[voa_version] [smallint] NOT NULL,
	[fct_txn_fct_tx_id] [uniqueidentifier] NULL,
	[parent_id] [uniqueidentifier] NULL,
 CONSTRAINT [pk_sf_taxa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_taxa_attrbutes]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_taxa_attrbutes](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [nvarchar](1000) NULL,
 CONSTRAINT [pk_sf_taxa_attrbutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_taxonomies]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_taxonomies](
	[title_] [nvarchar](255) NULL,
	[taxon_name_] [nvarchar](500) NULL,
	[root_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[nme] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](500) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[app_name] [varchar](50) NULL,
	[voa_class] [int] NOT NULL,
 CONSTRAINT [pk_sf_taxonomies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_taxonomies_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_taxonomies_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_txnms_sf_prmssn_D112A1A7] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_taxonomy_statistic]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_taxonomy_statistic](
	[taxonomy_id] [uniqueidentifier] NULL,
	[taxon_id] [uniqueidentifier] NULL,
	[statistic_type] [int] NOT NULL,
	[marked_items_count] [bigint] NOT NULL,
	[item_provider_name] [varchar](255) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[data_item_type] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_taxonomy_statistic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_tr_jbs]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_tr_jbs](
	[trg_langs] [varchar](2000) NULL,
	[prjc_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
 CONSTRAINT [pk_sf_tr_jbs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_tr_prjcts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_tr_prjcts](
	[title] [nvarchar](255) NULL,
	[status] [int] NOT NULL,
	[start_date] [datetime] NOT NULL,
	[site_id] [uniqueidentifier] NULL,
	[retry_count] [int] NOT NULL,
	[po_ref] [nvarchar](255) NULL,
	[owner] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[external_id] [varchar](255) NULL,
	[due_date] [datetime] NOT NULL,
	[dscrptn] [nvarchar](255) NULL,
	[date_sent] [datetime] NULL,
	[date_created] [datetime] NOT NULL,
	[date_completed] [datetime] NULL,
	[cnctr] [varchar](255) NULL,
	[act_src_lang] [varchar](255) NULL,
 CONSTRAINT [pk_sf_tr_prjcts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_tr_sources]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_tr_sources](
	[title] [nvarchar](255) NULL,
	[src_lang] [varchar](255) NULL,
	[site_id] [uniqueidentifier] NULL,
	[root_key] [varchar](255) NULL,
	[parnt_id] [uniqueidentifier] NULL,
	[item_type] [varchar](255) NULL,
	[item_prvdr] [varchar](255) NULL,
	[item_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_tr_sources] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_tr_trnsltns]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_tr_trnsltns](
	[unique_item_key] [varchar](255) NOT NULL,
	[trns_status] [int] NOT NULL,
	[trg_lang] [varchar](255) NULL,
	[src_vrsn_type] [int] NOT NULL,
	[tr_source_id] [uniqueidentifier] NULL,
	[owner] [uniqueidentifier] NULL,
	[metadata] [varchar](255) NULL,
	[job_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[ext_status] [nvarchar](500) NULL,
	[external_id] [varchar](255) NULL,
	[err_msg] [nvarchar](max) NULL,
	[date_modified] [datetime] NULL,
	[date_created] [datetime] NOT NULL,
	[act_src_lang] [varchar](255) NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_tr_trnsltns] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_tr_units]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_tr_units](
	[trns_id] [uniqueidentifier] NULL,
	[title] [nvarchar](255) NULL,
	[trg_val] [nvarchar](max) NULL,
	[src_val] [nvarchar](max) NULL,
	[prop_name] [varchar](255) NULL,
	[ordinal] [real] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_tr_units] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_txnms_prmssnst_bjct_ttl_rs_]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_txnms_prmssnst_bjct_ttl_rs_](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_txnms_prmssnst__43FCF889] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_txnms_spprtd_prmission_sets]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_txnms_spprtd_prmission_sets](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_txnms_spprtd_pr_89E2DFDC] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_unsubscription_info]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_unsubscription_info](
	[sf_unsubscription_info_id] [int] NOT NULL,
	[unsubscription_list_id] [uniqueidentifier] NULL,
	[unsubscription_date] [datetime] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[reason] [nvarchar](255) NULL,
	[last_modified] [datetime] NULL,
	[sf_campaign_id] [uniqueidentifier] NULL,
	[id] [uniqueidentifier] NULL,
	[application_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_unsubscription_info] PRIMARY KEY CLUSTERED 
(
	[sf_unsubscription_info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_url_data]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_url_data](
	[url] [nvarchar](510) NULL,
	[redirect] [tinyint] NOT NULL,
	[qery] [varchar](255) NULL,
	[last_modified] [datetime] NULL,
	[is_default] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[disabled] [tinyint] NOT NULL,
	[culture] [int] NOT NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
	[voa_class] [int] NOT NULL,
	[content_id] [uniqueidentifier] NULL,
	[id2] [uniqueidentifier] NULL,
	[item_type] [varchar](256) NULL,
 CONSTRAINT [pk_sf_url_data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_user_action]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_user_action](
	[user_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[exipration_date] [datetime] NOT NULL,
	[data_item_id] [uniqueidentifier] NULL,
	[dta] [varchar](255) NULL,
	[context] [varchar](255) NULL,
	[application_name] [varchar](255) NULL,
	[action_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_user_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_user_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_user_link](
	[user_id] [uniqueidentifier] NULL,
	[role_id] [uniqueidentifier] NULL,
	[membership_info] [uniqueidentifier] NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_user_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_user_profile]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_user_profile](
	[url_name_] [nvarchar](255) NULL,
	[title_] [nvarchar](255) NULL,
	[source_key] [nvarchar](255) NULL,
	[user_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description_] [nvarchar](255) NULL,
	[date_created] [datetime] NOT NULL,
	[app_name] [nvarchar](255) NULL,
	[voa_class] [int] NOT NULL,
 CONSTRAINT [pk_sf_user_profile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_user_profile_link]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_user_profile_link](
	[user_profile_type_name] [nvarchar](255) NULL,
	[user_id] [uniqueidentifier] NULL,
	[profile_id] [uniqueidentifier] NULL,
	[membership] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_user_profile_link] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_users]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_users](
	[user_name] [nvarchar](255) NULL,
	[salt] [varchar](128) NULL,
	[password_question] [nvarchar](500) NULL,
	[password_format] [int] NOT NULL,
	[password_answer] [varchar](255) NULL,
	[passwd] [varchar](255) NULL,
	[manager_info] [uniqueidentifier] NULL,
	[last_password_changed_date] [datetime] NULL,
	[last_name] [nvarchar](255) NULL,
	[last_modified] [datetime] NULL,
	[last_login_ip] [varchar](50) NULL,
	[last_login_date] [datetime] NULL,
	[last_lockout_date] [datetime] NULL,
	[last_activity_date] [datetime] NULL,
	[is_logged_in] [bit] NULL,
	[is_locked_out] [bit] NULL,
	[is_backend_user] [bit] NULL,
	[is_approved] [bit] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[fld_psswrd_ttempt_window_start] [datetime] NULL,
	[failed_password_attempt_count] [int] NOT NULL,
	[fld_psswrd_nswr_ttmpt_wndw_str] [datetime] NULL,
	[fld_psswrd_nswer_attempt_count] [int] NOT NULL,
	[ext_provider_name] [nvarchar](255) NULL,
	[ext_id] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[creation_date] [datetime] NULL,
	[commnt] [varchar](max) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_version_chnges]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_version_chnges](
	[vrsion] [int] NOT NULL,
	[serial_info_id] [uniqueidentifier] NULL,
	[item_id] [uniqueidentifier] NULL,
	[ownr] [uniqueidentifier] NULL,
	[metadata] [varchar](4000) NULL,
	[last_modified] [datetime] NULL,
	[lbel] [varchar](50) NULL,
	[is_published_version] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NULL,
	[dta] [varbinary](max) NULL,
	[culture] [int] NOT NULL,
	[commnt] [nvarchar](255) NULL,
	[change_type] [varchar](50) NULL,
	[app_name] [varchar](50) NULL,
	[add_info] [nvarchar](max) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_version_chnges] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_version_dependency]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_version_dependency](
	[key] [varchar](255) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[data] [nvarchar](max) NOT NULL,
	[clean_up_task_type] [varchar](255) NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_version_dependency] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_version_serial_info]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_version_serial_info](
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[formatter] [varchar](255) NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_version_serial_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_version_trunks]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_version_trunks](
	[nme] [varchar](50) NULL,
	[last_modified] [datetime] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[description] [varchar](255) NULL,
	[app_name] [varchar](50) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_version_trunks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_vesion_items]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_vesion_items](
	[type_name] [varchar](255) NULL,
	[trunk_id] [uniqueidentifier] NULL,
	[last_version] [int] NOT NULL,
	[id2] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[synced] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](50) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_vesion_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_vnts_published_translations]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_vnts_published_translations](
	[content_id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_vnts_pblshd_trn_4EB48CFB] PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_vrsn_chngs_sf_v_4950C6B0] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_definition]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_definition](
	[workflow_type] [int] NOT NULL,
	[title_] [nvarchar](255) NULL,
	[ownr] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[is_active] [tinyint] NOT NULL,
	[inherits_permissions] [tinyint] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[date_created] [datetime] NOT NULL,
	[custom_xamlx_url] [nvarchar](255) NULL,
	[can_inherit_permissions] [tinyint] NOT NULL,
	[application_name] [varchar](255) NULL,
	[allw_pblshers_to_skip_workflow] [tinyint] NOT NULL,
	[allow_notes] [tinyint] NULL,
	[allw_dmnstrtrs_t_skip_workflow] [tinyint] NOT NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_wfl_definition] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_dfnition_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_dfnition_sf_permissions](
	[id] [uniqueidentifier] NOT NULL,
	[id2] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_sf_wfl_dfntn_sf_pr_9B8007B6] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_dfntn_prmssnst_bjct_ttl]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_dfntn_prmssnst_bjct_ttl](
	[id] [uniqueidentifier] NOT NULL,
	[mapkey] [varchar](255) NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_wfl_dfntn_prmss_8F92C9AA] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[mapkey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_dfntn_spprtd_prmssn_sts]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_dfntn_spprtd_prmssn_sts](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [varchar](255) NULL,
 CONSTRAINT [pk_sf_wfl_dfntn_spprt_95FBD0A6] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_level]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_level](
	[ordinal] [real] NOT NULL,
	[notify_approvers] [tinyint] NOT NULL,
	[notify_administrators] [tinyint] NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[workflow_definition_id] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NULL,
	[action_name] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_wfl_level] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_lvl_cstm_mil_recipients]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_lvl_cstm_mil_recipients](
	[id] [uniqueidentifier] NOT NULL,
	[seq] [int] NOT NULL,
	[val] [nvarchar](255) NULL,
 CONSTRAINT [pk_sf_wfl_lvl_cstm_ml_F5742FEA] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[seq] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_permission]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_permission](
	[principal_type] [int] NOT NULL,
	[principal_name] [nvarchar](255) NULL,
	[principal_id] [varchar](255) NULL,
	[workflow_level_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[app_name] [varchar](255) NULL,
	[action_name] [nvarchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_wfl_permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_scope]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_scope](
	[provider_name] [nvarchar](100) NULL,
	[last_modified] [datetime] NOT NULL,
	[lnguage] [varchar](20) NULL,
	[id] [uniqueidentifier] NOT NULL,
	[workflow_definition_id] [uniqueidentifier] NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_wfl_scope] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_wfl_type_scope]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_wfl_type_scope](
	[scope_id] [uniqueidentifier] NULL,
	[last_modified] [datetime] NOT NULL,
	[include_children] [tinyint] NULL,
	[id] [uniqueidentifier] NOT NULL,
	[content_type] [varchar](255) NULL,
	[content_filter] [nvarchar](max) NULL,
	[app_name] [varchar](255) NULL,
	[voa_version] [smallint] NOT NULL,
 CONSTRAINT [pk_sf_wfl_type_scope] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sf_xml_config_items]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sf_xml_config_items](
	[path] [varchar](255) NOT NULL,
	[last_modified] [datetime] NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[dta] [nvarchar](max) NULL,
	[app_name] [varchar](255) NULL,
 CONSTRAINT [pk_sf_xml_config_items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyncSchedulerExecution]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyncSchedulerExecution](
	[Id] [uniqueidentifier] NOT NULL,
	[ProcessId] [int] NOT NULL,
	[SchedulerName] [varchar](255) NULL,
	[StartTime] [datetimeoffset](7) NOT NULL,
	[EndTime] [datetimeoffset](7) NULL,
	[WatchdogUpdateTime] [datetimeoffset](7) NULL,
	[ImportContextUpdateTime] [datetimeoffset](7) NULL,
	[Status] [int] NOT NULL,
	[ErrorMessage] [varchar](1024) NULL,
 CONSTRAINT [pk_SyncSchedulerExecution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyncTask]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyncTask](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
	[Enabled] [tinyint] NOT NULL,
	[FirstExecution] [datetimeoffset](7) NOT NULL,
	[LastExecution] [datetimeoffset](7) NULL,
	[FinalExecution] [datetimeoffset](7) NULL,
	[Name] [varchar](255) NULL,
	[NextExecution] [datetimeoffset](7) NULL,
	[ExecutionCount] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[RecurrenceRule] [varchar](255) NULL,
	[FatalityThreshold] [int] NOT NULL,
	[ConfigurationId] [nvarchar](64) NULL,
 CONSTRAINT [pk_SyncTask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyncTaskExecution]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyncTaskExecution](
	[Id] [uniqueidentifier] NOT NULL,
	[StartTime] [datetimeoffset](7) NOT NULL,
	[EndTime] [datetimeoffset](7) NULL,
	[ErrorMessage] [varchar](1024) NULL,
	[Status] [int] NOT NULL,
	[UsesOwnAppdomain] [tinyint] NOT NULL,
	[SyncStopAction] [int] NULL,
	[WatchdogUpdateTime] [datetimeoffset](7) NULL,
	[TaskId] [uniqueidentifier] NULL,
	[ResultId] [int] NULL,
	[SchedulerExecutionId] [uniqueidentifier] NULL,
 CONSTRAINT [pk_SyncTaskExecution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SyncTaskLock]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SyncTaskLock](
	[TaskId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [pk_SyncTaskLock] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voa_keygen]    Script Date: 12/30/2020 8:38:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voa_keygen](
	[table_name] [varchar](64) NOT NULL,
	[last_used_id] [int] NOT NULL,
 CONSTRAINT [pk_voa_keygen_88150C0D7] PRIMARY KEY CLUSTERED 
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_OASyncLstSmmry_ImprtSmmary]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_OASyncLstSmmry_ImprtSmmary] ON [dbo].[OASyncListSummary]
(
	[ImportSummary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ab_campaign_campaign_a]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ab_campaign_campaign_a] ON [dbo].[sf_ab_campaign]
(
	[campaign_a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ab_campaign_campaign_b]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ab_campaign_campaign_b] ON [dbo].[sf_ab_campaign]
(
	[campaign_b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ab_test_date_created]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_ab_test_date_created] ON [dbo].[sf_ab_test]
(
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ab_test_last_modified]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_ab_test_last_modified] ON [dbo].[sf_ab_test]
(
	[last_modified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ab_test_status]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_ab_test_status] ON [dbo].[sf_ab_test]
(
	[culture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ab_test_goal_ab_test_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ab_test_goal_ab_test_id] ON [dbo].[sf_ab_test_goal]
(
	[ab_test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_b_tst_vrtion_ab_test_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_b_tst_vrtion_ab_test_id] ON [dbo].[sf_ab_test_variation]
(
	[ab_test_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_setting_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_setting_key] ON [dbo].[sf_app_setting]
(
	[nme] ASC,
	[policy_type] ASC,
	[policy_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_dt_crtd]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_dt_crtd] ON [dbo].[sf_approval_tracking_record]
(
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_wrk_itm_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_wrk_itm_id] ON [dbo].[sf_approval_tracking_record]
(
	[workflow_item_id] ASC,
	[culture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_blg_psts_pblshd_trnsltn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blg_psts_pblshd_trnsltn] ON [dbo].[sf_blg_psts_pblshd_trnslations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blog_posts_parent_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blog_posts_parent_id] ON [dbo].[sf_blog_posts]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_bposts_org_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bposts_org_cnt_id] ON [dbo].[sf_blog_posts]
(
	[original_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blog_posts_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blog_posts_category_val] ON [dbo].[sf_blog_posts_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blg_psts_sf_cmmnt_cntnt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blg_psts_sf_cmmnt_cntnt] ON [dbo].[sf_blog_posts_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blg_psts_sf_lngg_dta_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blg_psts_sf_lngg_dta_id] ON [dbo].[sf_blog_posts_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blg_psts_sf_prmssons_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blg_psts_sf_prmssons_id] ON [dbo].[sf_blog_posts_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blog_posts_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blog_posts_tags_val] ON [dbo].[sf_blog_posts_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_blogs]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blogs] ON [dbo].[sf_blogs]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blgs_sf_cmmnt_cntnt_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blgs_sf_cmmnt_cntnt_id2] ON [dbo].[sf_blogs_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_blogs_sf_permissions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_blogs_sf_permissions_id] ON [dbo].[sf_blogs_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_bounce_stat_camp_subscr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bounce_stat_camp_subscr] ON [dbo].[sf_bounce_stat]
(
	[sf_campaign_id] ASC,
	[sf_subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cmpgn_sf_cmpgn_link_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cmpgn_sf_cmpgn_link_id2] ON [dbo].[sf_campaign_sf_campaign_link]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_cnt_lctn_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_cnt_lctn_cnt_id] ON [dbo].[sf_cnt_location_filters]
(
	[cnt_location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cnt_locations_type]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_cnt_locations_type] ON [dbo].[sf_cnt_locations]
(
	[app_name] ASC,
	[item_type] ASC,
	[item_provider] ASC,
	[priority] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_tms_sf_prmssns_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tms_sf_prmssns_id] ON [dbo].[sf_cntent_items_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_tms_sf_lngg_dt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tms_sf_lngg_dt_id] ON [dbo].[sf_cntnt_tems_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_cntnt_tms_pblshd_trnslt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tms_pblshd_trnslt] ON [dbo].[sf_cntnt_tms_pblshd_trnsltions]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cmmnt_prnt_grup_ids_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cmmnt_prnt_grup_ids_val] ON [dbo].[sf_commnt_parent_group_ids]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cmmnt_sf_cmmnt_cntnt_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cmmnt_sf_cmmnt_cntnt_d2] ON [dbo].[sf_commnt_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_tems_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tems_category_val] ON [dbo].[sf_content_items_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_tms_sf_cmmnt_cntn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_tms_sf_cmmnt_cntn] ON [dbo].[sf_content_items_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_content_items_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_content_items_tags_val] ON [dbo].[sf_content_items_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cnt_lnk_chld_itm_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_chld_itm_id] ON [dbo].[sf_content_link]
(
	[child_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_cnt_lnk_chld_type_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_chld_type_id] ON [dbo].[sf_content_link]
(
	[child_item_type] ASC,
	[child_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cnt_lnk_prnt_itm_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cnt_lnk_prnt_itm_id] ON [dbo].[sf_content_link]
(
	[parent_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_rltn_obj]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_rltn_obj] ON [dbo].[sf_content_relation]
(
	[object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntnt_rltn_subj]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntnt_rltn_subj] ON [dbo].[sf_content_relation]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntrl_prprts_control_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntrl_prprts_control_id] ON [dbo].[sf_control_properties]
(
	[control_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cntrl_prprts_prnt_prp_d]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cntrl_prprts_prnt_prp_d] ON [dbo].[sf_control_properties]
(
	[prnt_prop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ctrl_props]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ctrl_props] ON [dbo].[sf_control_properties]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cs_comments_thread]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cs_comments_thread] ON [dbo].[sf_cs_comments]
(
	[parent_thread_id] ASC,
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_cs_groups_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_cs_groups_key] ON [dbo].[sf_cs_groups]
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_cs_threads_group]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_cs_threads_group] ON [dbo].[sf_cs_threads]
(
	[parent_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_cs_threads_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_cs_threads_key] ON [dbo].[sf_cs_threads]
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_dashboard_log_id_type]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dashboard_log_id_type] ON [dbo].[sf_dashboard_log]
(
	[item_id] ASC,
	[item_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dashboard_log_time]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dashboard_log_time] ON [dbo].[sf_dashboard_log]
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dshbrd_watch_entry_usr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dshbrd_watch_entry_usr] ON [dbo].[sf_dashboard_watchlist]
(
	[dashboard_log_entry_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_delivery_entry_camp_subscr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_delivery_entry_camp_subscr] ON [dbo].[sf_delivery_entry]
(
	[campaign_id] ASC,
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_draft_pages_content_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_draft_pages_content_id] ON [dbo].[sf_draft_pages]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_draft_pages_page_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_draft_pages_page_id] ON [dbo].[sf_draft_pages]
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_FormName]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_FormName] ON [dbo].[sf_draft_pages]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_drft_pgs_sf_lngg_dt_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_drft_pgs_sf_lngg_dt_id2] ON [dbo].[sf_drft_pages_sf_language_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dyn_org_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dyn_org_cnt_id] ON [dbo].[sf_dynamic_content]
(
	[original_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_dyn_sys_prnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dyn_sys_prnt_id] ON [dbo].[sf_dynamic_content]
(
	[application_name] ASC,
	[system_parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dynmc_lst_dynmc_list_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_lst_dynmc_list_id] ON [dbo].[sf_dynamic_list]
(
	[dynamic_list_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dynmc_cntnt_sf_prmssns_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_cntnt_sf_prmssns_] ON [dbo].[sf_dynmc_cntent_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_dynmc_cntnt_pblshd_trns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_cntnt_pblshd_trns] ON [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dynmc_cntnt_sf_lngg_dt_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dynmc_cntnt_sf_lngg_dt_] ON [dbo].[sf_dynmc_cntnt_sf_lnguage_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_events]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_events] ON [dbo].[sf_events]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_events_org_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_events_org_cnt_id] ON [dbo].[sf_events]
(
	[original_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_events_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_events_category_val] ON [dbo].[sf_events_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_vnts_sf_cmmnt_cntnt_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vnts_sf_cmmnt_cntnt_id2] ON [dbo].[sf_events_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_vnts_sf_lnguage_data_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vnts_sf_lnguage_data_id] ON [dbo].[sf_events_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_vents_sf_permissions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vents_sf_permissions_id] ON [dbo].[sf_events_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_events_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_events_tags_val] ON [dbo].[sf_events_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_facet_facets_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_facet_facets_id2] ON [dbo].[sf_facet_facets]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_fls_mntr_dta_path]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_fls_mntr_dta_path] ON [dbo].[sf_files_monitor_data]
(
	[file_path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_fldrs_prntId]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_fldrs_prntId] ON [dbo].[sf_folders]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_fldrs_rtId_pth]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_fldrs_rtId_pth] ON [dbo].[sf_folders]
(
	[root_id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscrptn_ctegory_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_ctegory_val] ON [dbo].[sf_form_description_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscrptn_sf_cmmnt_cn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_sf_cmmnt_cn] ON [dbo].[sf_form_description_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscription_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscription_tags_val] ON [dbo].[sf_form_description_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_ApplicationName]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_ApplicationName] ON [dbo].[sf_form_entry]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_forum_groups]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_forum_groups] ON [dbo].[sf_forum_groups]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_grps_sf_prmssns_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_grps_sf_prmssns_id2] ON [dbo].[sf_forum_groups_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_posts_last_modified]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_posts_last_modified] ON [dbo].[sf_forum_posts]
(
	[last_modified] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_thread_posts]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_thread_posts] ON [dbo].[sf_forum_posts]
(
	[thread_id] ASC,
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_forum_threads]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_forum_threads] ON [dbo].[sf_forum_threads]
(
	[forum_id] ASC,
	[last_post_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_forums_group_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_forums_group_id] ON [dbo].[sf_forums]
(
	[app_name] ASC,
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frms_sf_permissions_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frms_sf_permissions_id2] ON [dbo].[sf_forums_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_frm_dscrptn_pblshd_trns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_pblshd_trns] ON [dbo].[sf_frm_dscrptn_pblshd_trnsltns]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscrptn_sf_lngg_dt_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_sf_lngg_dt_] ON [dbo].[sf_frm_dscrptn_sf_lnguage_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscrptn_sf_prsnttn_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_sf_prsnttn_] ON [dbo].[sf_frm_dscrptn_sf_prsnttn_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_frm_dscrptn_sf_prmssns_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_frm_dscrptn_sf_prmssns_] ON [dbo].[sf_frm_dscrpton_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idsrv_claims_external]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idsrv_claims_external] ON [dbo].[sf_idsrv_claims]
(
	[ext_provider_name] ASC,
	[ext_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_dsrv_consents_idsrv_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_dsrv_consents_idsrv_key] ON [dbo].[sf_idsrv_consents]
(
	[idsrv_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idsrv_keys_sbj]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idsrv_keys_sbj] ON [dbo].[sf_idsrv_keys]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_idsrv_tokens_idsrv_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_idsrv_tokens_idsrv_key] ON [dbo].[sf_idsrv_tokens]
(
	[idsrv_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_iss_sub_rprt_issue_subscr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_iss_sub_rprt_issue_subscr] ON [dbo].[sf_issue_subscriber_report]
(
	[sf_campaign_id] ASC,
	[sf_subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_lbrrs_thmbnl_prfles_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lbrrs_thmbnl_prfles_val] ON [dbo].[sf_lbraries_thumbnail_profiles]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_libraries]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_libraries] ON [dbo].[sf_libraries]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lbrrs_sf_cmmnt_cntnt_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lbrrs_sf_cmmnt_cntnt_d2] ON [dbo].[sf_libraries_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lbrrs_sf_permissions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lbrrs_sf_permissions_id] ON [dbo].[sf_libraries_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_click_stat_camp_subscr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_click_stat_camp_subscr] ON [dbo].[sf_link_click_stat]
(
	[campaign_id] ASC,
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_list_items_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_list_items_category_val] ON [dbo].[sf_list_items_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lst_tms_sf_cmmnt_cntnt_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_tms_sf_cmmnt_cntnt_] ON [dbo].[sf_list_items_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lst_tms_sf_lngg_data_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_tms_sf_lngg_data_id] ON [dbo].[sf_list_items_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lst_tms_sf_prmssions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_tms_sf_prmssions_id] ON [dbo].[sf_list_items_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_list_items_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_list_items_tags_val] ON [dbo].[sf_list_items_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_lists]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lists] ON [dbo].[sf_lists]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lsts_sf_cmmnt_cntnt_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lsts_sf_cmmnt_cntnt_id2] ON [dbo].[sf_lists_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lists_sf_permissions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lists_sf_permissions_id] ON [dbo].[sf_lists_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_lst_sf_subscriber_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_sf_subscriber_id] ON [dbo].[sf_lst_sf_subscriber]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_lst_tms_pblshd_trnsltns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_lst_tms_pblshd_trnsltns] ON [dbo].[sf_lst_tms_pblshd_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_mngr_info]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_mngr_info] ON [dbo].[sf_manager_info]
(
	[app_name] ASC,
	[manager_type] ASC,
	[provider_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mb_dnc_cnt_prvdr_sf_prm]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mb_dnc_cnt_prvdr_sf_prm] ON [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mb_dynmc_mdl_fld_sf_prm]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mb_dynmc_mdl_fld_sf_prm] ON [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mb_dynmc_mdl_sf_prmssns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mb_dynmc_mdl_sf_prmssns] ON [dbo].[sf_mb_dynmc_mdl_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mb_dynmc_mdl_typ_sf_prm]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mb_dynmc_mdl_typ_sf_prm] ON [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mbl_frmt_sf_mbl_cntnt_t]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mbl_frmt_sf_mbl_cntnt_t] ON [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mbl_frmt_tmplts_mbl_fr2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mbl_frmt_tmplts_mbl_fr2] ON [dbo].[sf_mbl_frmt_templates]
(
	[mbl_frmt_dfntn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_mbl_frmt_tmplts_mbl_frm]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mbl_frmt_tmplts_mbl_frm] ON [dbo].[sf_mbl_frmt_templates]
(
	[mbl_frmt_cntnt_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_md_cntnt_pblshd_trnsltn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_pblshd_trnsltn] ON [dbo].[sf_md_cntnt_pblshd_trnslations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_cntnt_sf_lngg_dta_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_sf_lngg_dta_id] ON [dbo].[sf_md_content_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_cntnt_sf_prmssons_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_sf_prmssons_id] ON [dbo].[sf_mdia_content_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_cnt_fldr_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_cnt_fldr_id] ON [dbo].[sf_media_content]
(
	[folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_cnt_org_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_cnt_org_cnt_id] ON [dbo].[sf_media_content]
(
	[original_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_content_parent_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_content_parent_id] ON [dbo].[sf_media_content]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_content_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_content_category_val] ON [dbo].[sf_media_content_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_cntent_category2_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntent_category2_val] ON [dbo].[sf_media_content_category2]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_cntent_category3_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntent_category3_val] ON [dbo].[sf_media_content_category3]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_cntnt_sf_cmmnt_cntnt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_cntnt_sf_cmmnt_cntnt] ON [dbo].[sf_media_content_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_content_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_content_tags_val] ON [dbo].[sf_media_content_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_content_tags2_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_content_tags2_val] ON [dbo].[sf_media_content_tags2]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_media_content_tags3_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_media_content_tags3_val] ON [dbo].[sf_media_content_tags3]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_fle_links_content_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_fle_links_content_id] ON [dbo].[sf_media_file_links]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_fl_rls_md_fl_link_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_fl_rls_md_fl_link_id] ON [dbo].[sf_media_file_urls]
(
	[media_file_link_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_mfu_url_mfl]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sf_idx_mfu_url_mfl] ON [dbo].[sf_media_file_urls]
(
	[url] ASC,
	[media_file_link_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_md_thmbnails_content_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_md_thmbnails_content_id] ON [dbo].[sf_media_thumbnails]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_meta_attribute_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_meta_attribute_id2] ON [dbo].[sf_meta_attribute]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_meta_fields_type_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_meta_fields_type_id] ON [dbo].[sf_meta_fields]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_metafields]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_metafields] ON [dbo].[sf_meta_fields]
(
	[app_name] ASC,
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_mt_ndx_cmpst_fields_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mt_ndx_cmpst_fields_val] ON [dbo].[sf_meta_index_composite_fields]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_meta_types]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_meta_types] ON [dbo].[sf_meta_types]
(
	[app_name] ASC,
	[class_name] ASC,
	[name_space] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_mt_typs_scton_names_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_mt_typs_scton_names_val] ON [dbo].[sf_meta_types_section_names]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_module_vrsn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_module_vrsn] ON [dbo].[sf_module_vrsn]
(
	[module_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_network_subtaxa_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_network_subtaxa_id2] ON [dbo].[sf_network_subtaxa]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_network_supertaxa_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_network_supertaxa_id2] ON [dbo].[sf_network_supertaxa]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_news]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_news] ON [dbo].[sf_news_items]
(
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_news_org_cnt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_news_org_cnt_id] ON [dbo].[sf_news_items]
(
	[original_content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_news_items_category_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_news_items_category_val] ON [dbo].[sf_news_items_category]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_nws_tms_sf_cmmnt_cntnt_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_sf_cmmnt_cntnt_] ON [dbo].[sf_news_items_sf_commnt]
(
	[content_id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_nws_tms_sf_lngg_data_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_sf_lngg_data_id] ON [dbo].[sf_news_items_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_nws_tms_sf_prmssions_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_sf_prmssions_id] ON [dbo].[sf_news_items_sf_permissions]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_news_items_tags_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_news_items_tags_val] ON [dbo].[sf_news_items_tags]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ns_slist_resolvekey]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ns_slist_resolvekey] ON [dbo].[sf_notif_subscr_list]
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ns_sr_resolvekey]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ns_sr_resolvekey] ON [dbo].[sf_notif_subscribers]
(
	[resolve_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ns_sn_list_subscriber]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_ns_sn_list_subscriber] ON [dbo].[sf_notif_subscriptions]
(
	[list_id] ASC,
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ns_sn_subscriber]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ns_sn_subscriber] ON [dbo].[sf_notif_subscriptions]
(
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ntf_msg_jb_cstm_mssg_hd]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_msg_jb_cstm_mssg_hd] ON [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ntf_msg_jb_xcldd_rslvd_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_msg_jb_xcldd_rslvd_] ON [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ntf_sbscrbrs_cstm_prprt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ntf_sbscrbrs_cstm_prprt] ON [dbo].[sf_ntf_sbscrbrs_cstm_prperties]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_nws_tms_pblshd_trnsltns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_nws_tms_pblshd_trnsltns] ON [dbo].[sf_nws_tms_pblshd_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Collections]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [Collections] ON [dbo].[sf_object_data]
(
	[collection_index] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_bjct_dta_parent_prop_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bjct_dta_parent_prop_id] ON [dbo].[sf_object_data]
(
	[parent_prop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_bjct_dta_sibling_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bjct_dta_sibling_id] ON [dbo].[sf_object_data]
(
	[sibling_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_object_data_content_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_content_id] ON [dbo].[sf_object_data]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_object_data_id3]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_id3] ON [dbo].[sf_object_data]
(
	[id3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_object_data_page_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_object_data_page_id] ON [dbo].[sf_object_data]
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_od_pers_master_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_od_pers_master_id] ON [dbo].[sf_object_data]
(
	[personalization_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_bjct_dt_sf_prmssons_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_bjct_dt_sf_prmssons_id2] ON [dbo].[sf_object_data_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ocd_dpndncies_cache_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ocd_dpndncies_cache_key] ON [dbo].[sf_ocd_dpndncies]
(
	[cache_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ocd_typ_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ocd_typ_id] ON [dbo].[sf_ocd_dpndncies]
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ocd_itms_dte_md]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ocd_itms_dte_md] ON [dbo].[sf_ocd_itms]
(
	[date_modified] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_ocd_itms_ste]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ocd_itms_ste] ON [dbo].[sf_ocd_itms]
(
	[site_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ocd_ste_nde]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_ocd_ste_nde] ON [dbo].[sf_ocd_itms]
(
	[site_map_node_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_ocd_typ_nme]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_ocd_typ_nme] ON [dbo].[sf_ocd_typs]
(
	[type_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_open_stat_camp_subscr]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_open_stat_camp_subscr] ON [dbo].[sf_open_stat]
(
	[campaign_id] ASC,
	[subscriber_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_page_data_page_node_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_page_data_page_node_id] ON [dbo].[sf_page_data]
(
	[page_node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_page_data_template_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_page_data_template_id] ON [dbo].[sf_page_data]
(
	[template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pd_pers_master_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pd_pers_master_id] ON [dbo].[sf_page_data]
(
	[personalization_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_dt_sf_lngage_data_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_dt_sf_lngage_data_id] ON [dbo].[sf_page_data_sf_language_data]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_page_node_parent_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_page_node_parent_id] ON [dbo].[sf_page_node]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pages_root_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pages_root_id] ON [dbo].[sf_page_node]
(
	[root_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_node_prnt_id_ordnl]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_node_prnt_id_ordnl] ON [dbo].[sf_page_node]
(
	[parent_id] ASC,
	[ordinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_nd_rfrncs_pg_node_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_nd_rfrncs_pg_node_id] ON [dbo].[sf_page_node_references]
(
	[page_node_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_pn_split_id_app_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_pn_split_id_app_name] ON [dbo].[sf_page_node_references]
(
	[id] ASC,
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_nd_sf_prmissions_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_nd_sf_prmissions_id2] ON [dbo].[sf_page_node_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_tmplts_prnt_tmplt_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_prnt_tmplt_id] ON [dbo].[sf_page_templates]
(
	[prent_template_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pblshng_mppng_sf_pp_mpp]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_mppng_sf_pp_mpp] ON [dbo].[sf_pblshng_mppng_sf_pp_mppng_t]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_pblshng_mppng_src_prprt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_mppng_src_prprt] ON [dbo].[sf_pblshng_mppng_src_prprty_nm]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pblshng_mppng_sttngs_sf]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_mppng_sttngs_sf] ON [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pblshng_pp_sttngs_cntnt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_pp_sttngs_cntnt] ON [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_pblshng_pp_sttngs_lngg_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_pp_sttngs_lngg_] ON [dbo].[sf_pblshng_pp_sttngs_lngge_ids]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_addn_id_itm_tpe]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_addn_id_itm_tpe] ON [dbo].[sf_pckgng_addn_lnks]
(
	[addn_id] ASC,
	[itm_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_name] ON [dbo].[sf_pckgng_addns]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pckgng_ddns_stts_ddn_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pckgng_ddns_stts_ddn_id] ON [dbo].[sf_pckgng_addns_stts]
(
	[addn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_permission_setname]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_permission_setname] ON [dbo].[sf_permissions]
(
	[set_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_permissions]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_permissions] ON [dbo].[sf_permissions]
(
	[object_id] ASC,
	[principal_id] ASC,
	[app_name] ASC,
	[set_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pinhmap_object_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pinhmap_object_id] ON [dbo].[sf_permissions_inheritance_map]
(
	[object_id] ASC,
	[child_object_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_pg_dt_pblshd_trnsltns_v]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_dt_pblshd_trnsltns_v] ON [dbo].[sf_pg_dt_pblished_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_pg_nd_prmssnst_bjct_ttl]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_nd_prmssnst_bjct_ttl] ON [dbo].[sf_pg_nd_prmssnst_bjct_ttl_rs_]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_tmplts_sf_prmssns_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_sf_prmssns_d2] ON [dbo].[sf_pg_templates_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pg_tmplts_sf_lngg_dt_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_sf_lngg_dt_d2] ON [dbo].[sf_pg_tmpltes_sf_language_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_pg_tmplts_pblshd_trnslt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pg_tmplts_pblshd_trnslt] ON [dbo].[sf_pg_tmplts_pblshd_trnsltions]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_presentation_data]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_presentation_data] ON [dbo].[sf_presentation_data]
(
	[app_name] ASC,
	[embedded_template_name] ASC,
	[resource_assembly_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_presentation_data_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_presentation_data_id2] ON [dbo].[sf_presentation_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_presentation_data_id4]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_presentation_data_id4] ON [dbo].[sf_presentation_data]
(
	[id4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_prsntation_data_item_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_prsntation_data_item_id] ON [dbo].[sf_presentation_data]
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_prs_crtr_grp_sf_prs_crt]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_prs_crtr_grp_sf_prs_crt] ON [dbo].[sf_prs_crtr_grp_sf_prs_crtrion]
(
	[sf_prs_criterion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_segment_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_segment_name] ON [dbo].[sf_prs_segment]
(
	[app_name] ASC,
	[site_id] ASC,
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_prs_sgmnt_sf_prs_crtr_g]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_prs_sgmnt_sf_prs_crtr_g] ON [dbo].[sf_prs_sgmnt_sf_prs_crtr_group]
(
	[sf_prs_criteria_group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_pblshng_pp_settings_id3]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_pblshng_pp_settings_id3] ON [dbo].[sf_publishing_pipe_settings]
(
	[id3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_rbin_date_created]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_rbin_date_created] ON [dbo].[sf_rbin_item]
(
	[date_created] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_rbin_item_type_prov_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_rbin_item_type_prov_id] ON [dbo].[sf_rbin_item]
(
	[del_item_type_name] ASC,
	[del_item_prvdr_name] ASC,
	[del_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_rdsgn_md_qry_lnk_sf_rds]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_rdsgn_md_qry_lnk_sf_rds] ON [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_rdsgn_md_qry_rl_prnt_md]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_rdsgn_md_qry_rl_prnt_md] ON [dbo].[sf_rdsgn_media_query_rule]
(
	[parent_media_query_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [sf_rdsgn_nav_trnsfrmtn_pmqid]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_rdsgn_nav_trnsfrmtn_pmqid] ON [dbo].[sf_rdsgn_nav_trnsfrmtn]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_roles_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_roles_name] ON [dbo].[sf_roles]
(
	[app_name] ASC,
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [appName]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [appName] ON [dbo].[sf_scheduled_tasks]
(
	[application_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [excecutionDate]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [excecutionDate] ON [dbo].[sf_scheduled_tasks]
(
	[execute_time] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [key] ON [dbo].[sf_scheduled_tasks]
(
	[ky] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_schema_vrsns]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_schema_vrsns] ON [dbo].[sf_schema_vrsns]
(
	[app_name] ASC,
	[module_name] ASC,
	[connection_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_schm_vrsns_mt_types_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_schm_vrsns_mt_types_val] ON [dbo].[sf_schema_vrsns_meta_types]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_scrty_rts_sf_prmssns_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_scrty_rts_sf_prmssns_d2] ON [dbo].[sf_scrity_roots_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_scrty_rts_prmssnst_bjct]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_scrty_rts_prmssnst_bjct] ON [dbo].[sf_scrty_rts_prmssnst_bjct_ttl]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_scrty_rts_spprtd_prmssn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_scrty_rts_spprtd_prmssn] ON [dbo].[sf_scrty_rts_spprtd_prmssn_sts]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_security_roots]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_security_roots] ON [dbo].[sf_security_roots]
(
	[ky] ASC,
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_links_item_id_type]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_links_item_id_type] ON [dbo].[sf_site_item_links]
(
	[item_id] ASC,
	[item_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_site_live_url]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_site_live_url] ON [dbo].[sf_sites]
(
	[live_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_site_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_site_name] ON [dbo].[sf_sites]
(
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_sites_culture_keys_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_sites_culture_keys_val] ON [dbo].[sf_sites_culture_keys]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_stes_domain_aliases_val]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_stes_domain_aliases_val] ON [dbo].[sf_sites_domain_aliases]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_stes_sf_permissions_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_stes_sf_permissions_id2] ON [dbo].[sf_sites_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_sf_stat_sntnc_subject_key]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [IX_sf_stat_sntnc_subject_key] ON [dbo].[sf_stat_sentence]
(
	[subject_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_sts_sf_st_dt_src_lnks_d]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_sts_sf_st_dt_src_lnks_d] ON [dbo].[sf_sts_sf_st_data_source_links]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_subscr_email_app_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_subscr_email_app_name] ON [dbo].[sf_subscriber]
(
	[email] ASC,
	[application_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_subscription_info_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_subscription_info_id2] ON [dbo].[sf_subscription_info]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_synonyms_taxon_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_synonyms_taxon_id] ON [dbo].[sf_synonyms]
(
	[taxon_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_taxa_fct_txn_fct_tx_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_fct_txn_fct_tx_id] ON [dbo].[sf_taxa]
(
	[fct_txn_fct_tx_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_taxa_parent_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_parent_id] ON [dbo].[sf_taxa]
(
	[parent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_taxa_taxonomy_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxa_taxonomy_id] ON [dbo].[sf_taxa]
(
	[taxonomy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_taxon_status]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxon_status] ON [dbo].[sf_taxa]
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_txnms_sf_prmissions_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_txnms_sf_prmissions_id2] ON [dbo].[sf_taxonomies_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_taxonomy_statistic]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_taxonomy_statistic] ON [dbo].[sf_taxonomy_statistic]
(
	[data_item_type] ASC,
	[taxon_id] ASC,
	[statistic_type] ASC,
	[item_provider_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_tr_prjcts_extrnl_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_tr_prjcts_extrnl_id] ON [dbo].[sf_tr_prjcts]
(
	[external_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_itm_descrtn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_itm_descrtn] ON [dbo].[sf_tr_sources]
(
	[item_id] ASC,
	[item_type] ASC,
	[item_prvdr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_tr_trnsltns_tr_surce_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_tr_trnsltns_tr_surce_id] ON [dbo].[sf_tr_trnsltns]
(
	[tr_source_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_trns_extrnl_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_trns_extrnl_id] ON [dbo].[sf_tr_trnsltns]
(
	[external_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_trns_status]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_trns_status] ON [dbo].[sf_tr_trnsltns]
(
	[trns_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_trns_unq_item_trglang]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_trns_unq_item_trglang] ON [dbo].[sf_tr_trnsltns]
(
	[unique_item_key] ASC,
	[trg_lang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_tr_units_trns_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_tr_units_trns_id] ON [dbo].[sf_tr_units]
(
	[trns_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_txnms_prmssnst_bjct_ttl]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_txnms_prmssnst_bjct_ttl] ON [dbo].[sf_txnms_prmssnst_bjct_ttl_rs_]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_txnms_spprtd_prmssn_sts]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_txnms_spprtd_prmssn_sts] ON [dbo].[sf_txnms_spprtd_prmission_sets]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_unsubscr_info_camp_sub]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_unsubscr_info_camp_sub] ON [dbo].[sf_unsubscription_info]
(
	[sf_campaign_id] ASC,
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_unsubscription_info_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_unsubscription_info_id2] ON [dbo].[sf_unsubscription_info]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_url_data]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data] ON [dbo].[sf_url_data]
(
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_url_data_content_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data_content_id] ON [dbo].[sf_url_data]
(
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_url_data_id2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_data_id2] ON [dbo].[sf_url_data]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_url_type]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_url_type] ON [dbo].[sf_url_data]
(
	[item_type] ASC,
	[url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_user_link]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_user_link] ON [dbo].[sf_user_link]
(
	[app_name] ASC,
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_user_link_role_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_user_link_role_id] ON [dbo].[sf_user_link]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_profile_link_user_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_profile_link_user_id] ON [dbo].[sf_user_profile_link]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UC_profile]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UC_profile] ON [dbo].[sf_user_profile_link]
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_email]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_idx_email] ON [dbo].[sf_users]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_users_external]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [sf_users_external] ON [dbo].[sf_users]
(
	[ext_provider_name] ASC,
	[ext_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [userNameIndex]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [userNameIndex] ON [dbo].[sf_users]
(
	[user_name] ASC,
	[app_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_version_chnges_item_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_version_chnges_item_id] ON [dbo].[sf_version_chnges]
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_vrsn_dpndncy]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sf_idx_vrsn_dpndncy] ON [dbo].[sf_version_dependency]
(
	[key] ASC,
	[clean_up_task_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [sf_idx_vrsn_trnks_app_nme]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [sf_idx_vrsn_trnks_app_nme] ON [dbo].[sf_version_trunks]
(
	[app_name] ASC,
	[nme] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_vnts_pblshd_trnsltns_vl]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vnts_pblshd_trnsltns_vl] ON [dbo].[sf_vnts_published_translations]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_vrsn_chngs_sf_vrsn_dpnd]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_vrsn_chngs_sf_vrsn_dpnd] ON [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_wfl_dfntn_sf_prmssns_d2]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_dfntn_sf_prmssns_d2] ON [dbo].[sf_wfl_dfnition_sf_permissions]
(
	[id2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_wfl_dfntn_prmssnst_bjct]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_dfntn_prmssnst_bjct] ON [dbo].[sf_wfl_dfntn_prmssnst_bjct_ttl]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_wfl_dfntn_spprtd_prmssn]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_dfntn_spprtd_prmssn] ON [dbo].[sf_wfl_dfntn_spprtd_prmssn_sts]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_wfl_lvl_wrkflw_dfntn_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_lvl_wrkflw_dfntn_id] ON [dbo].[sf_wfl_level]
(
	[workflow_definition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_wfl_lvl_cstm_ml_rcpnts_]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_lvl_cstm_ml_rcpnts_] ON [dbo].[sf_wfl_lvl_cstm_mil_recipients]
(
	[val] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_wfl_prmssn_wrkflw_lvl_d]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_prmssn_wrkflw_lvl_d] ON [dbo].[sf_wfl_permission]
(
	[workflow_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_wfl_scp_wrkflw_dfntn_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_scp_wrkflw_dfntn_id] ON [dbo].[sf_wfl_scope]
(
	[workflow_definition_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_sf_wfl_type_scope_scope_id]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE NONCLUSTERED INDEX [idx_sf_wfl_type_scope_scope_id] ON [dbo].[sf_wfl_type_scope]
(
	[scope_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_sf_xml_config_items]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [idx_sf_xml_config_items] ON [dbo].[sf_xml_config_items]
(
	[app_name] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_sync_ex_name]    Script Date: 12/30/2020 8:38:27 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [ix_sync_ex_name] ON [dbo].[SyncSchedulerExecution]
(
	[SchedulerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImportWarnings]  WITH CHECK ADD  CONSTRAINT [ref_ImportWarnings_OASyncLog] FOREIGN KEY([LogId])
REFERENCES [dbo].[OASyncLog] ([Id])
GO
ALTER TABLE [dbo].[ImportWarnings] CHECK CONSTRAINT [ref_ImportWarnings_OASyncLog]
GO
ALTER TABLE [dbo].[ImportWarnings]  WITH CHECK ADD  CONSTRAINT [ref_ImprtWrnngs_OASyn_907689F8] FOREIGN KEY([ImportId])
REFERENCES [dbo].[OASyncImportSummary] ([Id])
GO
ALTER TABLE [dbo].[ImportWarnings] CHECK CONSTRAINT [ref_ImprtWrnngs_OASyn_907689F8]
GO
ALTER TABLE [dbo].[OAConflicts]  WITH CHECK ADD  CONSTRAINT [ref_OACnflcts_OAImprt_87EE1F07] FOREIGN KEY([ConfigurationName])
REFERENCES [dbo].[OAImportConfigurations] ([Name])
GO
ALTER TABLE [dbo].[OAConflicts] CHECK CONSTRAINT [ref_OACnflcts_OAImprt_87EE1F07]
GO
ALTER TABLE [dbo].[OASyncImportSummary]  WITH CHECK ADD  CONSTRAINT [ref_OASyncImprtSmmry__80271C87] FOREIGN KEY([ConfigurationName])
REFERENCES [dbo].[OAImportConfigurations] ([Name])
GO
ALTER TABLE [dbo].[OASyncImportSummary] CHECK CONSTRAINT [ref_OASyncImprtSmmry__80271C87]
GO
ALTER TABLE [dbo].[sf_blg_psts_pblshd_trnslations]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_pblsh_133B1DFA] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blg_psts_pblshd_trnslations] CHECK CONSTRAINT [ref_sf_blg_psts_pblsh_133B1DFA]
GO
ALTER TABLE [dbo].[sf_blog_posts_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_ctgry_0E1420AF] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_category] CHECK CONSTRAINT [ref_sf_blg_psts_ctgry_0E1420AF]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_cm_BE833FC3] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt] CHECK CONSTRAINT [ref_sf_blg_psts_sf_cm_BE833FC3]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_cm_EBEDB972] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_commnt] CHECK CONSTRAINT [ref_sf_blg_psts_sf_cm_EBEDB972]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_ln_23023E19] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_language_data] CHECK CONSTRAINT [ref_sf_blg_psts_sf_ln_23023E19]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_ln_7BCC534D] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_language_data] CHECK CONSTRAINT [ref_sf_blg_psts_sf_ln_7BCC534D]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_pr_5EEBF1BB] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_permissions] CHECK CONSTRAINT [ref_sf_blg_psts_sf_pr_5EEBF1BB]
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_sf_pr_A299AEB5] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_sf_permissions] CHECK CONSTRAINT [ref_sf_blg_psts_sf_pr_A299AEB5]
GO
ALTER TABLE [dbo].[sf_blog_posts_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_blg_psts_tgs_s_8440CA61] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blog_posts] ([content_id])
GO
ALTER TABLE [dbo].[sf_blog_posts_tags] CHECK CONSTRAINT [ref_sf_blg_psts_tgs_s_8440CA61]
GO
ALTER TABLE [dbo].[sf_blogs_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blgs_sf_cmmnt__60EBEB17] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_blogs_sf_commnt] CHECK CONSTRAINT [ref_sf_blgs_sf_cmmnt__60EBEB17]
GO
ALTER TABLE [dbo].[sf_blogs_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_blgs_sf_cmmnt__E1B764AE] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blogs] ([content_id])
GO
ALTER TABLE [dbo].[sf_blogs_sf_commnt] CHECK CONSTRAINT [ref_sf_blgs_sf_cmmnt__E1B764AE]
GO
ALTER TABLE [dbo].[sf_blogs_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_blgs_sf_prmssn_B9080DAB] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_blogs_sf_permissions] CHECK CONSTRAINT [ref_sf_blgs_sf_prmssn_B9080DAB]
GO
ALTER TABLE [dbo].[sf_blogs_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_blgs_sf_prmssn_BB3B2877] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_blogs] ([content_id])
GO
ALTER TABLE [dbo].[sf_blogs_sf_permissions] CHECK CONSTRAINT [ref_sf_blgs_sf_prmssn_BB3B2877]
GO
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_3D3571B2] FOREIGN KEY([id])
REFERENCES [dbo].[sf_campaign] ([id])
GO
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link] CHECK CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_3D3571B2]
GO
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_9A451AA2] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_campaign_link] ([id])
GO
ALTER TABLE [dbo].[sf_campaign_sf_campaign_link] CHECK CONSTRAINT [ref_sf_cmpgn_sf_cmpgn_9A451AA2]
GO
ALTER TABLE [dbo].[sf_cntent_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_p_4D6FB4E1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_cntent_items_sf_permissions] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_p_4D6FB4E1]
GO
ALTER TABLE [dbo].[sf_cntent_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_p_F10391D6] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_cntent_items_sf_permissions] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_p_F10391D6]
GO
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_l_468FB44F] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_l_468FB44F]
GO
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_l_D3A810FF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_cntnt_tems_sf_language_data] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_l_D3A810FF]
GO
ALTER TABLE [dbo].[sf_cntnt_tms_pblshd_trnsltions]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_pbls_64AAB6C3] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_cntnt_tms_pblshd_trnsltions] CHECK CONSTRAINT [ref_sf_cntnt_tms_pbls_64AAB6C3]
GO
ALTER TABLE [dbo].[sf_commnt_parent_group_ids]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmmnt_prnt_grp_4E481DC9] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_commnt_parent_group_ids] CHECK CONSTRAINT [ref_sf_cmmnt_prnt_grp_4E481DC9]
GO
ALTER TABLE [dbo].[sf_commnt_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmmnt_sf_cmmnt_B9C81E12] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_commnt_sf_commnt] CHECK CONSTRAINT [ref_sf_cmmnt_sf_cmmnt_B9C81E12]
GO
ALTER TABLE [dbo].[sf_commnt_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_cmmnt_sf_cmmnt_B9C81E1F] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_commnt_sf_commnt] CHECK CONSTRAINT [ref_sf_cmmnt_sf_cmmnt_B9C81E1F]
GO
ALTER TABLE [dbo].[sf_content_items_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_ctgr_83800DF6] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_content_items_category] CHECK CONSTRAINT [ref_sf_cntnt_tms_ctgr_83800DF6]
GO
ALTER TABLE [dbo].[sf_content_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_c_3E3E23FE] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_content_items_sf_commnt] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_c_3E3E23FE]
GO
ALTER TABLE [dbo].[sf_content_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_sf_c_C9444F40] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_content_items_sf_commnt] CHECK CONSTRAINT [ref_sf_cntnt_tms_sf_c_C9444F40]
GO
ALTER TABLE [dbo].[sf_content_items_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_tms_tgs__BD164FC6] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_content_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_content_items_tags] CHECK CONSTRAINT [ref_sf_cntnt_tms_tgs__BD164FC6]
GO
ALTER TABLE [dbo].[sf_content_link_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_cntnt_lnk_ttrb_E946E39C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_content_link] ([id])
GO
ALTER TABLE [dbo].[sf_content_link_attrbutes] CHECK CONSTRAINT [ref_sf_cntnt_lnk_ttrb_E946E39C]
GO
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_drft_pgs_sf_ln_2C0B2153] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data] CHECK CONSTRAINT [ref_sf_drft_pgs_sf_ln_2C0B2153]
GO
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_drft_pgs_sf_ln_B7881151] FOREIGN KEY([id])
REFERENCES [dbo].[sf_draft_pages] ([id])
GO
ALTER TABLE [dbo].[sf_drft_pages_sf_language_data] CHECK CONSTRAINT [ref_sf_drft_pgs_sf_ln_B7881151]
GO
ALTER TABLE [dbo].[sf_dynmc_cntent_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_sf_35AE9BBA] FOREIGN KEY([base_id])
REFERENCES [dbo].[sf_dynamic_content] ([base_id])
GO
ALTER TABLE [dbo].[sf_dynmc_cntent_sf_permissions] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_sf_35AE9BBA]
GO
ALTER TABLE [dbo].[sf_dynmc_cntent_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_sf_50D77764] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_dynmc_cntent_sf_permissions] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_sf_50D77764]
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_pb_494E9A61] FOREIGN KEY([base_id])
REFERENCES [dbo].[sf_dynamic_content] ([base_id])
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_pblshd_trnsltns] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_pb_494E9A61]
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_sf_681AF741] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_sf_681AF741]
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_dynmc_cntnt_sf_9C75A004] FOREIGN KEY([base_id])
REFERENCES [dbo].[sf_dynamic_content] ([base_id])
GO
ALTER TABLE [dbo].[sf_dynmc_cntnt_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_dynmc_cntnt_sf_9C75A004]
GO
ALTER TABLE [dbo].[sf_ec_customer_profile]  WITH CHECK ADD  CONSTRAINT [ref_sf_c_cstmr_prfl_s_6EB624B1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_user_profile] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sf_ec_customer_profile] CHECK CONSTRAINT [ref_sf_c_cstmr_prfl_s_6EB624B1]
GO
ALTER TABLE [dbo].[sf_events_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_ctgry_sf__3DC02376] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_category] CHECK CONSTRAINT [ref_sf_vnts_ctgry_sf__3DC02376]
GO
ALTER TABLE [dbo].[sf_events_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_cmmnt__A46AC163] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_sf_commnt] CHECK CONSTRAINT [ref_sf_vnts_sf_cmmnt__A46AC163]
GO
ALTER TABLE [dbo].[sf_events_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_cmmnt__F6782E43] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_sf_commnt] CHECK CONSTRAINT [ref_sf_vnts_sf_cmmnt__F6782E43]
GO
ALTER TABLE [dbo].[sf_events_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_lngg_d_14085936] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_events_sf_language_data] CHECK CONSTRAINT [ref_sf_vnts_sf_lngg_d_14085936]
GO
ALTER TABLE [dbo].[sf_events_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_lngg_d_1534079D] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_sf_language_data] CHECK CONSTRAINT [ref_sf_vnts_sf_lngg_d_1534079D]
GO
ALTER TABLE [dbo].[sf_events_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_prmssn_411088A3] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_sf_permissions] CHECK CONSTRAINT [ref_sf_vnts_sf_prmssn_411088A3]
GO
ALTER TABLE [dbo].[sf_events_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_sf_prmssn_F6B61EA8] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_events_sf_permissions] CHECK CONSTRAINT [ref_sf_vnts_sf_prmssn_F6B61EA8]
GO
ALTER TABLE [dbo].[sf_events_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_events_tags_sf_events] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_events_tags] CHECK CONSTRAINT [ref_sf_events_tags_sf_events]
GO
ALTER TABLE [dbo].[sf_facet_facets]  WITH CHECK ADD  CONSTRAINT [ref_sf_facet_facets_sf_taxa] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_facet_facets] CHECK CONSTRAINT [ref_sf_facet_facets_sf_taxa]
GO
ALTER TABLE [dbo].[sf_facet_facets]  WITH CHECK ADD  CONSTRAINT [ref_sf_fct_fcts_sf_tx_A3F38EB4] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_taxonomies] ([id])
GO
ALTER TABLE [dbo].[sf_facet_facets] CHECK CONSTRAINT [ref_sf_fct_fcts_sf_tx_A3F38EB4]
GO
ALTER TABLE [dbo].[sf_form_description_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_tt_A8F24C50] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_form_description_attrbutes] CHECK CONSTRAINT [ref_sf_frm_dscrptn_tt_A8F24C50]
GO
ALTER TABLE [dbo].[sf_form_description_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_ct_11CBF836] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_form_description_category] CHECK CONSTRAINT [ref_sf_frm_dscrptn_ct_11CBF836]
GO
ALTER TABLE [dbo].[sf_form_description_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_DC8E209C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_form_description_sf_commnt] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_DC8E209C]
GO
ALTER TABLE [dbo].[sf_form_description_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_E34452C4] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_form_description_sf_commnt] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_E34452C4]
GO
ALTER TABLE [dbo].[sf_form_description_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_tg_863C6CB2] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_form_description_tags] CHECK CONSTRAINT [ref_sf_frm_dscrptn_tg_863C6CB2]
GO
ALTER TABLE [dbo].[sf_forum_groups_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_grps_sf_pr_1257B58B] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_forum_groups_sf_permissions] CHECK CONSTRAINT [ref_sf_frm_grps_sf_pr_1257B58B]
GO
ALTER TABLE [dbo].[sf_forum_groups_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_grps_sf_pr_4F9A96B9] FOREIGN KEY([id])
REFERENCES [dbo].[sf_forum_groups] ([id])
GO
ALTER TABLE [dbo].[sf_forum_groups_sf_permissions] CHECK CONSTRAINT [ref_sf_frm_grps_sf_pr_4F9A96B9]
GO
ALTER TABLE [dbo].[sf_forums_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frms_sf_prmssn_19E1A110] FOREIGN KEY([id])
REFERENCES [dbo].[sf_forums] ([id])
GO
ALTER TABLE [dbo].[sf_forums_sf_permissions] CHECK CONSTRAINT [ref_sf_frms_sf_prmssn_19E1A110]
GO
ALTER TABLE [dbo].[sf_forums_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frms_sf_prmssn_E3E05598] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_forums_sf_permissions] CHECK CONSTRAINT [ref_sf_frms_sf_prmssn_E3E05598]
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_pblshd_trnsltns]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_pb_AF91AE04] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_pblshd_trnsltns] CHECK CONSTRAINT [ref_sf_frm_dscrptn_pb_AF91AE04]
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_929C00E9] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_929C00E9]
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_A3601094] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_lnguage_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_A3601094]
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_prsnttn_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_28F80C1E] FOREIGN KEY([id])
REFERENCES [dbo].[sf_presentation_data] ([id])
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_prsnttn_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_28F80C1E]
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_prsnttn_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_E5552520] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_frm_dscrptn_sf_prsnttn_data] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_E5552520]
GO
ALTER TABLE [dbo].[sf_frm_dscrpton_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_8105C4C5] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_frm_dscrpton_sf_permissions] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_8105C4C5]
GO
ALTER TABLE [dbo].[sf_frm_dscrpton_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_frm_dscrptn_sf_C0EF0D12] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_form_description] ([content_id])
GO
ALTER TABLE [dbo].[sf_frm_dscrpton_sf_permissions] CHECK CONSTRAINT [ref_sf_frm_dscrptn_sf_C0EF0D12]
GO
ALTER TABLE [dbo].[sf_lbraries_thumbnail_profiles]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_thmbnl_p_88772027] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_libraries] ([content_id])
GO
ALTER TABLE [dbo].[sf_lbraries_thumbnail_profiles] CHECK CONSTRAINT [ref_sf_lbrrs_thmbnl_p_88772027]
GO
ALTER TABLE [dbo].[sf_libraries_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_sf_cmmnt_14374312] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_libraries] ([content_id])
GO
ALTER TABLE [dbo].[sf_libraries_sf_commnt] CHECK CONSTRAINT [ref_sf_lbrrs_sf_cmmnt_14374312]
GO
ALTER TABLE [dbo].[sf_libraries_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_sf_cmmnt_78DD7ED2] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_libraries_sf_commnt] CHECK CONSTRAINT [ref_sf_lbrrs_sf_cmmnt_78DD7ED2]
GO
ALTER TABLE [dbo].[sf_libraries_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_sf_prmss_738E3946] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_libraries] ([content_id])
GO
ALTER TABLE [dbo].[sf_libraries_sf_permissions] CHECK CONSTRAINT [ref_sf_lbrrs_sf_prmss_738E3946]
GO
ALTER TABLE [dbo].[sf_libraries_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lbrrs_sf_prmss_B00F476C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_libraries_sf_permissions] CHECK CONSTRAINT [ref_sf_lbrrs_sf_prmss_B00F476C]
GO
ALTER TABLE [dbo].[sf_list_items_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_ctgry__FE1E1F41] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_category] CHECK CONSTRAINT [ref_sf_lst_tms_ctgry__FE1E1F41]
GO
ALTER TABLE [dbo].[sf_list_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_cmm_09D2A916] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_commnt] CHECK CONSTRAINT [ref_sf_lst_tms_sf_cmm_09D2A916]
GO
ALTER TABLE [dbo].[sf_list_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_cmm_B563FADD] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_commnt] CHECK CONSTRAINT [ref_sf_lst_tms_sf_cmm_B563FADD]
GO
ALTER TABLE [dbo].[sf_list_items_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_lng_3054E1ED] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_language_data] CHECK CONSTRAINT [ref_sf_lst_tms_sf_lng_3054E1ED]
GO
ALTER TABLE [dbo].[sf_list_items_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_lng_663F5578] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_language_data] CHECK CONSTRAINT [ref_sf_lst_tms_sf_lng_663F5578]
GO
ALTER TABLE [dbo].[sf_list_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_prm_22020C74] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_permissions] CHECK CONSTRAINT [ref_sf_lst_tms_sf_prm_22020C74]
GO
ALTER TABLE [dbo].[sf_list_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_sf_prm_D7B45207] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_sf_permissions] CHECK CONSTRAINT [ref_sf_lst_tms_sf_prm_D7B45207]
GO
ALTER TABLE [dbo].[sf_list_items_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_tgs_sf_28B5A063] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_list_items_tags] CHECK CONSTRAINT [ref_sf_lst_tms_tgs_sf_28B5A063]
GO
ALTER TABLE [dbo].[sf_lists_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lsts_sf_cmmnt__5E006C86] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_lists_sf_commnt] CHECK CONSTRAINT [ref_sf_lsts_sf_cmmnt__5E006C86]
GO
ALTER TABLE [dbo].[sf_lists_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_lsts_sf_cmmnt__987A7B9C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_lists] ([content_id])
GO
ALTER TABLE [dbo].[sf_lists_sf_commnt] CHECK CONSTRAINT [ref_sf_lsts_sf_cmmnt__987A7B9C]
GO
ALTER TABLE [dbo].[sf_lists_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lsts_sf_prmssn_B3B364C2] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_lists_sf_permissions] CHECK CONSTRAINT [ref_sf_lsts_sf_prmssn_B3B364C2]
GO
ALTER TABLE [dbo].[sf_lists_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_lsts_sf_prmssn_DA6BC1EA] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_lists] ([content_id])
GO
ALTER TABLE [dbo].[sf_lists_sf_permissions] CHECK CONSTRAINT [ref_sf_lsts_sf_prmssn_DA6BC1EA]
GO
ALTER TABLE [dbo].[sf_lst_sf_subscriber]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_sf_sbscrbr_63418318] FOREIGN KEY([id])
REFERENCES [dbo].[sf_lst] ([id])
GO
ALTER TABLE [dbo].[sf_lst_sf_subscriber] CHECK CONSTRAINT [ref_sf_lst_sf_sbscrbr_63418318]
GO
ALTER TABLE [dbo].[sf_lst_sf_subscriber]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_sf_sbscrbr_791CF52E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_subscriber] ([id])
GO
ALTER TABLE [dbo].[sf_lst_sf_subscriber] CHECK CONSTRAINT [ref_sf_lst_sf_sbscrbr_791CF52E]
GO
ALTER TABLE [dbo].[sf_lst_tms_pblshd_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_lst_tms_pblshd_985914FA] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_list_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_lst_tms_pblshd_translations] CHECK CONSTRAINT [ref_sf_lst_tms_pblshd_985914FA]
GO
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dnc_cnt_prv_2D552106] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dnc_cnt_prv_2D552106]
GO
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dnc_cnt_prv_D7D592EA] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mb_dnc_cnt_provider] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dnc_cnt_prvdr_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dnc_cnt_prv_D7D592EA]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_f_AE25D842] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_f_AE25D842]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_f_E365C93C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mb_dynamic_module_field] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_fld_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_f_E365C93C]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_s_7521815B] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_sf_permissions] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_s_7521815B]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_s_B717FC1D] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mb_dynamic_module] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_sf_permissions] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_s_B717FC1D]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_t_A2809F53] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mb_dynamic_module_type] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_t_A2809F53]
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns]  WITH CHECK ADD  CONSTRAINT [ref_sf_mb_dynmc_mdl_t_CDEAFFA6] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_mb_dynmc_mdl_typ_sf_prmssns] CHECK CONSTRAINT [ref_sf_mb_dynmc_mdl_t_CDEAFFA6]
GO
ALTER TABLE [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs]  WITH CHECK ADD  CONSTRAINT [ref_sf_mbl_frmt_sf_mb_081E6663] FOREIGN KEY([id])
REFERENCES [dbo].[sf_mbl_frmt_cntnt_types] ([id])
GO
ALTER TABLE [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs] CHECK CONSTRAINT [ref_sf_mbl_frmt_sf_mb_081E6663]
GO
ALTER TABLE [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs]  WITH CHECK ADD  CONSTRAINT [ref_sf_mbl_frmt_sf_mb_CA69080E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_mbl_frmt_dfntns] ([id])
GO
ALTER TABLE [dbo].[sf_mbl_frmt_sf_mbl_cntnt_typs] CHECK CONSTRAINT [ref_sf_mbl_frmt_sf_mb_CA69080E]
GO
ALTER TABLE [dbo].[sf_md_cntnt_pblshd_trnslations]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_pblsh_5088F2F2] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_md_cntnt_pblshd_trnslations] CHECK CONSTRAINT [ref_sf_md_cntnt_pblsh_5088F2F2]
GO
ALTER TABLE [dbo].[sf_md_content_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_ln_63674A2C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_md_content_sf_language_data] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_ln_63674A2C]
GO
ALTER TABLE [dbo].[sf_md_content_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_ln_638FE5E3] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_md_content_sf_language_data] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_ln_638FE5E3]
GO
ALTER TABLE [dbo].[sf_mdia_content_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_pr_39D160B5] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_mdia_content_sf_permissions] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_pr_39D160B5]
GO
ALTER TABLE [dbo].[sf_mdia_content_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_pr_C6D2D223] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_mdia_content_sf_permissions] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_pr_C6D2D223]
GO
ALTER TABLE [dbo].[sf_media_content_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_ctgry_7AA70260] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_category] CHECK CONSTRAINT [ref_sf_md_cntnt_ctgry_7AA70260]
GO
ALTER TABLE [dbo].[sf_media_content_category2]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_ctgry_546FC87C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_category2] CHECK CONSTRAINT [ref_sf_md_cntnt_ctgry_546FC87C]
GO
ALTER TABLE [dbo].[sf_media_content_category3]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_ctgry_BB3D7E9D] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_category3] CHECK CONSTRAINT [ref_sf_md_cntnt_ctgry_BB3D7E9D]
GO
ALTER TABLE [dbo].[sf_media_content_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_cm_8531F6E7] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_sf_commnt] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_cm_8531F6E7]
GO
ALTER TABLE [dbo].[sf_media_content_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_sf_cm_9C7E1F5B] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_sf_commnt] CHECK CONSTRAINT [ref_sf_md_cntnt_sf_cm_9C7E1F5B]
GO
ALTER TABLE [dbo].[sf_media_content_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_tgs_s_D4C6D2D2] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_tags] CHECK CONSTRAINT [ref_sf_md_cntnt_tgs_s_D4C6D2D2]
GO
ALTER TABLE [dbo].[sf_media_content_tags2]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_tgs2__71AE7B0C] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_tags2] CHECK CONSTRAINT [ref_sf_md_cntnt_tgs2__71AE7B0C]
GO
ALTER TABLE [dbo].[sf_media_content_tags3]  WITH CHECK ADD  CONSTRAINT [ref_sf_md_cntnt_tgs3__9EFCCDED] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_media_content] ([content_id])
GO
ALTER TABLE [dbo].[sf_media_content_tags3] CHECK CONSTRAINT [ref_sf_md_cntnt_tgs3__9EFCCDED]
GO
ALTER TABLE [dbo].[sf_meta_index_composite_fields]  WITH CHECK ADD  CONSTRAINT [ref_sf_mt_ndx_cmpst_f_55A5FF42] FOREIGN KEY([id])
REFERENCES [dbo].[sf_meta_index] ([id])
GO
ALTER TABLE [dbo].[sf_meta_index_composite_fields] CHECK CONSTRAINT [ref_sf_mt_ndx_cmpst_f_55A5FF42]
GO
ALTER TABLE [dbo].[sf_meta_types_section_names]  WITH CHECK ADD  CONSTRAINT [ref_sf_mt_typs_sctn_n_67C53CAD] FOREIGN KEY([id])
REFERENCES [dbo].[sf_meta_types] ([id])
GO
ALTER TABLE [dbo].[sf_meta_types_section_names] CHECK CONSTRAINT [ref_sf_mt_typs_sctn_n_67C53CAD]
GO
ALTER TABLE [dbo].[sf_network_subtaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_network_subtaxa_sf_taxa] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_network_subtaxa] CHECK CONSTRAINT [ref_sf_network_subtaxa_sf_taxa]
GO
ALTER TABLE [dbo].[sf_network_subtaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntwrk_sbtx_sf__BFF81C09] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_network_subtaxa] CHECK CONSTRAINT [ref_sf_ntwrk_sbtx_sf__BFF81C09]
GO
ALTER TABLE [dbo].[sf_network_supertaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF42] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_network_supertaxa] CHECK CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF42]
GO
ALTER TABLE [dbo].[sf_network_supertaxa]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF4F] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_network_supertaxa] CHECK CONSTRAINT [ref_sf_ntwrk_sprtx_sf_E526EF4F]
GO
ALTER TABLE [dbo].[sf_news_items_category]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_ctgry__2CF409F8] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_category] CHECK CONSTRAINT [ref_sf_nws_tms_ctgry__2CF409F8]
GO
ALTER TABLE [dbo].[sf_news_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_cmm_5CA37A87] FOREIGN KEY([content_id2])
REFERENCES [dbo].[sf_commnt] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_commnt] CHECK CONSTRAINT [ref_sf_nws_tms_sf_cmm_5CA37A87]
GO
ALTER TABLE [dbo].[sf_news_items_sf_commnt]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_cmm_B15909E4] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_commnt] CHECK CONSTRAINT [ref_sf_nws_tms_sf_cmm_B15909E4]
GO
ALTER TABLE [dbo].[sf_news_items_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_lng_BCDDA5D5] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_language_data] CHECK CONSTRAINT [ref_sf_nws_tms_sf_lng_BCDDA5D5]
GO
ALTER TABLE [dbo].[sf_news_items_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_lng_C5D9C25A] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_language_data] CHECK CONSTRAINT [ref_sf_nws_tms_sf_lng_C5D9C25A]
GO
ALTER TABLE [dbo].[sf_news_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_prm_30F6C541] FOREIGN KEY([id])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_permissions] CHECK CONSTRAINT [ref_sf_nws_tms_sf_prm_30F6C541]
GO
ALTER TABLE [dbo].[sf_news_items_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_sf_prm_37B82403] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_sf_permissions] CHECK CONSTRAINT [ref_sf_nws_tms_sf_prm_37B82403]
GO
ALTER TABLE [dbo].[sf_news_items_tags]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_tgs_sf_FF6C0D89] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_news_items_tags] CHECK CONSTRAINT [ref_sf_nws_tms_tgs_sf_FF6C0D89]
GO
ALTER TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_msg_jb_cst_FF3D3E2C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_msg_job] ([id])
GO
ALTER TABLE [dbo].[sf_ntf_msg_jb_cstm_mssg_haders] CHECK CONSTRAINT [ref_sf_ntf_msg_jb_cst_FF3D3E2C]
GO
ALTER TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_msg_jb_xcl_3D6E6593] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_msg_job] ([id])
GO
ALTER TABLE [dbo].[sf_ntf_msg_jb_xcldd_rslvd_kys_] CHECK CONSTRAINT [ref_sf_ntf_msg_jb_xcl_3D6E6593]
GO
ALTER TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties]  WITH CHECK ADD  CONSTRAINT [ref_sf_ntf_sbscrbrs_c_66278547] FOREIGN KEY([id])
REFERENCES [dbo].[sf_notif_subscribers] ([id])
GO
ALTER TABLE [dbo].[sf_ntf_sbscrbrs_cstm_prperties] CHECK CONSTRAINT [ref_sf_ntf_sbscrbrs_c_66278547]
GO
ALTER TABLE [dbo].[sf_nws_tms_pblshd_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_nws_tms_pblshd_D2645765] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_news_items] ([content_id])
GO
ALTER TABLE [dbo].[sf_nws_tms_pblshd_translations] CHECK CONSTRAINT [ref_sf_nws_tms_pblshd_D2645765]
GO
ALTER TABLE [dbo].[sf_object_data_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_bjct_dt_sf_prm_E825EAAE] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_object_data_sf_permissions] CHECK CONSTRAINT [ref_sf_bjct_dt_sf_prm_E825EAAE]
GO
ALTER TABLE [dbo].[sf_object_data_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_bjct_dt_sf_prm_F52EE9B1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_object_data] ([id])
GO
ALTER TABLE [dbo].[sf_object_data_sf_permissions] CHECK CONSTRAINT [ref_sf_bjct_dt_sf_prm_F52EE9B1]
GO
ALTER TABLE [dbo].[sf_page_data_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_dt_ttrbts_s_CA759A20] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_page_data] ([content_id])
GO
ALTER TABLE [dbo].[sf_page_data_attrbutes] CHECK CONSTRAINT [ref_sf_pg_dt_ttrbts_s_CA759A20]
GO
ALTER TABLE [dbo].[sf_page_data_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_dt_sf_lngg__5936D8BD] FOREIGN KEY([id])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_page_data_sf_language_data] CHECK CONSTRAINT [ref_sf_pg_dt_sf_lngg__5936D8BD]
GO
ALTER TABLE [dbo].[sf_page_data_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_dt_sf_lngg__78605E03] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_page_data] ([content_id])
GO
ALTER TABLE [dbo].[sf_page_data_sf_language_data] CHECK CONSTRAINT [ref_sf_pg_dt_sf_lngg__78605E03]
GO
ALTER TABLE [dbo].[sf_page_node_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_ttrbts_s_A6852832] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_node] ([id])
GO
ALTER TABLE [dbo].[sf_page_node_attrbutes] CHECK CONSTRAINT [ref_sf_pg_nd_ttrbts_s_A6852832]
GO
ALTER TABLE [dbo].[sf_page_node_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_sf_prmss_8E9F3040] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_page_node_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_nd_sf_prmss_8E9F3040]
GO
ALTER TABLE [dbo].[sf_page_node_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_sf_prmss_9F0409E8] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_node] ([id])
GO
ALTER TABLE [dbo].[sf_page_node_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_nd_sf_prmss_9F0409E8]
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sf_pp_mppng_t]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__423E25FB] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_mapping] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sf_pp_mppng_t] CHECK CONSTRAINT [ref_sf_pblshng_mppng__423E25FB]
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sf_pp_mppng_t]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__99FB3F80] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_pipe_mapping_translation] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sf_pp_mppng_t] CHECK CONSTRAINT [ref_sf_pblshng_mppng__99FB3F80]
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_src_prprty_nm]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__D4283994] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_mapping] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_src_prprty_nm] CHECK CONSTRAINT [ref_sf_pblshng_mppng__D4283994]
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__A0EF7CD1] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_mapping_settings] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl] CHECK CONSTRAINT [ref_sf_pblshng_mppng__A0EF7CD1]
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_mppng__B02ED89D] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_publishing_mapping] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_mppng_sttngs_sf_pbl] CHECK CONSTRAINT [ref_sf_pblshng_mppng__B02ED89D]
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_pp_stt_A5119550] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_pipe_settings] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_cntnt_lnk] CHECK CONSTRAINT [ref_sf_pblshng_pp_stt_A5119550]
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_ddtnl_dta]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_pp_stt_8A8AB5D0] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_pipe_settings] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_ddtnl_dta] CHECK CONSTRAINT [ref_sf_pblshng_pp_stt_8A8AB5D0]
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids]  WITH CHECK ADD  CONSTRAINT [ref_sf_pblshng_pp_stt_E0AFBD06] FOREIGN KEY([id])
REFERENCES [dbo].[sf_publishing_pipe_settings] ([id])
GO
ALTER TABLE [dbo].[sf_pblshng_pp_sttngs_lngge_ids] CHECK CONSTRAINT [ref_sf_pblshng_pp_stt_E0AFBD06]
GO
ALTER TABLE [dbo].[sf_pg_dt_pblished_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_dt_pblshd_t_4AD938FD] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_page_data] ([content_id])
GO
ALTER TABLE [dbo].[sf_pg_dt_pblished_translations] CHECK CONSTRAINT [ref_sf_pg_dt_pblshd_t_4AD938FD]
GO
ALTER TABLE [dbo].[sf_pg_nd_prmssnst_bjct_ttl_rs_]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_nd_prmssnst_5220774D] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_node] ([id])
GO
ALTER TABLE [dbo].[sf_pg_nd_prmssnst_bjct_ttl_rs_] CHECK CONSTRAINT [ref_sf_pg_nd_prmssnst_5220774D]
GO
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_p_1B1C7023] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_templates] ([id])
GO
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_p_1B1C7023]
GO
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_p_95566D85] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_pg_templates_sf_permissions] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_p_95566D85]
GO
ALTER TABLE [dbo].[sf_pg_tmpltes_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_l_070C78C7] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_templates] ([id])
GO
ALTER TABLE [dbo].[sf_pg_tmpltes_sf_language_data] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_l_070C78C7]
GO
ALTER TABLE [dbo].[sf_pg_tmpltes_sf_language_data]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_sf_l_E6D3AFDD] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_language_data] ([id])
GO
ALTER TABLE [dbo].[sf_pg_tmpltes_sf_language_data] CHECK CONSTRAINT [ref_sf_pg_tmplts_sf_l_E6D3AFDD]
GO
ALTER TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions]  WITH CHECK ADD  CONSTRAINT [ref_sf_pg_tmplts_pbls_88E7C526] FOREIGN KEY([id])
REFERENCES [dbo].[sf_page_templates] ([id])
GO
ALTER TABLE [dbo].[sf_pg_tmplts_pblshd_trnsltions] CHECK CONSTRAINT [ref_sf_pg_tmplts_pbls_88E7C526]
GO
ALTER TABLE [dbo].[sf_prs_crtr_grp_sf_prs_crtrion]  WITH CHECK ADD  CONSTRAINT [ref_sf_prs_crtr_grp_s_3FD9548B] FOREIGN KEY([sf_prs_criterion_id])
REFERENCES [dbo].[sf_prs_criterion] ([sf_prs_criterion_id])
GO
ALTER TABLE [dbo].[sf_prs_crtr_grp_sf_prs_crtrion] CHECK CONSTRAINT [ref_sf_prs_crtr_grp_s_3FD9548B]
GO
ALTER TABLE [dbo].[sf_prs_crtr_grp_sf_prs_crtrion]  WITH CHECK ADD  CONSTRAINT [ref_sf_prs_crtr_grp_s_AA06D665] FOREIGN KEY([sf_prs_criteria_group_id])
REFERENCES [dbo].[sf_prs_criteria_group] ([sf_prs_criteria_group_id])
GO
ALTER TABLE [dbo].[sf_prs_crtr_grp_sf_prs_crtrion] CHECK CONSTRAINT [ref_sf_prs_crtr_grp_s_AA06D665]
GO
ALTER TABLE [dbo].[sf_prs_sgmnt_sf_prs_crtr_group]  WITH CHECK ADD  CONSTRAINT [ref_sf_prs_sgmnt_sf_p_8B779700] FOREIGN KEY([sf_prs_criteria_group_id])
REFERENCES [dbo].[sf_prs_criteria_group] ([sf_prs_criteria_group_id])
GO
ALTER TABLE [dbo].[sf_prs_sgmnt_sf_prs_crtr_group] CHECK CONSTRAINT [ref_sf_prs_sgmnt_sf_p_8B779700]
GO
ALTER TABLE [dbo].[sf_prs_sgmnt_sf_prs_crtr_group]  WITH CHECK ADD  CONSTRAINT [ref_sf_prs_sgmnt_sf_p_DCC8A1FE] FOREIGN KEY([id])
REFERENCES [dbo].[sf_prs_segment] ([id])
GO
ALTER TABLE [dbo].[sf_prs_sgmnt_sf_prs_crtr_group] CHECK CONSTRAINT [ref_sf_prs_sgmnt_sf_p_DCC8A1FE]
GO
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]  WITH CHECK ADD  CONSTRAINT [ref_sf_rdsgn_md_qry_l_B376AFEF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_rdsgn_media_query_link] ([id])
GO
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m] CHECK CONSTRAINT [ref_sf_rdsgn_md_qry_l_B376AFEF]
GO
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m]  WITH CHECK ADD  CONSTRAINT [ref_sf_rdsgn_md_qry_l_E287174C] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_rdsgn_media_query] ([id])
GO
ALTER TABLE [dbo].[sf_rdsgn_md_qry_lnk_sf_rdsgn_m] CHECK CONSTRAINT [ref_sf_rdsgn_md_qry_l_E287174C]
GO
ALTER TABLE [dbo].[sf_schema_vrsns_meta_types]  WITH CHECK ADD  CONSTRAINT [ref_sf_schm_vrsns_mt__BF84E03B] FOREIGN KEY([id])
REFERENCES [dbo].[sf_schema_vrsns] ([id])
GO
ALTER TABLE [dbo].[sf_schema_vrsns_meta_types] CHECK CONSTRAINT [ref_sf_schm_vrsns_mt__BF84E03B]
GO
ALTER TABLE [dbo].[sf_scrity_roots_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_scrty_rts_sf_p_6763D88D] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_scrity_roots_sf_permissions] CHECK CONSTRAINT [ref_sf_scrty_rts_sf_p_6763D88D]
GO
ALTER TABLE [dbo].[sf_scrity_roots_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_scrty_rts_sf_p_85D52DD2] FOREIGN KEY([id])
REFERENCES [dbo].[sf_security_roots] ([id])
GO
ALTER TABLE [dbo].[sf_scrity_roots_sf_permissions] CHECK CONSTRAINT [ref_sf_scrty_rts_sf_p_85D52DD2]
GO
ALTER TABLE [dbo].[sf_scrty_rts_prmssnst_bjct_ttl]  WITH CHECK ADD  CONSTRAINT [ref_sf_scrty_rts_prms_D96DAF71] FOREIGN KEY([id])
REFERENCES [dbo].[sf_security_roots] ([id])
GO
ALTER TABLE [dbo].[sf_scrty_rts_prmssnst_bjct_ttl] CHECK CONSTRAINT [ref_sf_scrty_rts_prms_D96DAF71]
GO
ALTER TABLE [dbo].[sf_scrty_rts_spprtd_prmssn_sts]  WITH CHECK ADD  CONSTRAINT [ref_sf_scrty_rts_sppr_7424AADB] FOREIGN KEY([id])
REFERENCES [dbo].[sf_security_roots] ([id])
GO
ALTER TABLE [dbo].[sf_scrty_rts_spprtd_prmssn_sts] CHECK CONSTRAINT [ref_sf_scrty_rts_sppr_7424AADB]
GO
ALTER TABLE [dbo].[sf_sitefinity_profile]  WITH CHECK ADD  CONSTRAINT [ref_sf_stfnty_prfl_sf_125BEED3] FOREIGN KEY([id])
REFERENCES [dbo].[sf_user_profile] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[sf_sitefinity_profile] CHECK CONSTRAINT [ref_sf_stfnty_prfl_sf_125BEED3]
GO
ALTER TABLE [dbo].[sf_sites_culture_keys]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_cltr_kys_s_821E5F65] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
GO
ALTER TABLE [dbo].[sf_sites_culture_keys] CHECK CONSTRAINT [ref_sf_sts_cltr_kys_s_821E5F65]
GO
ALTER TABLE [dbo].[sf_sites_domain_aliases]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_dmn_lss_sf_D75D2B5C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
GO
ALTER TABLE [dbo].[sf_sites_domain_aliases] CHECK CONSTRAINT [ref_sf_sts_dmn_lss_sf_D75D2B5C]
GO
ALTER TABLE [dbo].[sf_sites_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_prmssns_2BA50E5F] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
GO
ALTER TABLE [dbo].[sf_sites_sf_permissions] CHECK CONSTRAINT [ref_sf_sts_sf_prmssns_2BA50E5F]
GO
ALTER TABLE [dbo].[sf_sites_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_prmssns_591B75AD] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_sites_sf_permissions] CHECK CONSTRAINT [ref_sf_sts_sf_prmssns_591B75AD]
GO
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_st_dt_s_5186CA5E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_site_data_source_links] ([id])
GO
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links] CHECK CONSTRAINT [ref_sf_sts_sf_st_dt_s_5186CA5E]
GO
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links]  WITH CHECK ADD  CONSTRAINT [ref_sf_sts_sf_st_dt_s_EA6AAC25] FOREIGN KEY([id])
REFERENCES [dbo].[sf_sites] ([id])
GO
ALTER TABLE [dbo].[sf_sts_sf_st_data_source_links] CHECK CONSTRAINT [ref_sf_sts_sf_st_dt_s_EA6AAC25]
GO
ALTER TABLE [dbo].[sf_taxa_attrbutes]  WITH CHECK ADD  CONSTRAINT [ref_sf_taxa_attrbutes_sf_taxa] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxa] ([id])
GO
ALTER TABLE [dbo].[sf_taxa_attrbutes] CHECK CONSTRAINT [ref_sf_taxa_attrbutes_sf_taxa]
GO
ALTER TABLE [dbo].[sf_taxonomies_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_txnms_sf_prmss_8038D0E6] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxonomies] ([id])
GO
ALTER TABLE [dbo].[sf_taxonomies_sf_permissions] CHECK CONSTRAINT [ref_sf_txnms_sf_prmss_8038D0E6]
GO
ALTER TABLE [dbo].[sf_taxonomies_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_txnms_sf_prmss_A046D2CA] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_taxonomies_sf_permissions] CHECK CONSTRAINT [ref_sf_txnms_sf_prmss_A046D2CA]
GO
ALTER TABLE [dbo].[sf_txnms_prmssnst_bjct_ttl_rs_]  WITH CHECK ADD  CONSTRAINT [ref_sf_txnms_prmssnst_28075844] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxonomies] ([id])
GO
ALTER TABLE [dbo].[sf_txnms_prmssnst_bjct_ttl_rs_] CHECK CONSTRAINT [ref_sf_txnms_prmssnst_28075844]
GO
ALTER TABLE [dbo].[sf_txnms_spprtd_prmission_sets]  WITH CHECK ADD  CONSTRAINT [ref_sf_txnms_spprtd_p_E38DFA0F] FOREIGN KEY([id])
REFERENCES [dbo].[sf_taxonomies] ([id])
GO
ALTER TABLE [dbo].[sf_txnms_spprtd_prmission_sets] CHECK CONSTRAINT [ref_sf_txnms_spprtd_p_E38DFA0F]
GO
ALTER TABLE [dbo].[sf_vnts_published_translations]  WITH CHECK ADD  CONSTRAINT [ref_sf_vnts_pblshd_tr_6DA2DE64] FOREIGN KEY([content_id])
REFERENCES [dbo].[sf_events] ([content_id])
GO
ALTER TABLE [dbo].[sf_vnts_published_translations] CHECK CONSTRAINT [ref_sf_vnts_pblshd_tr_6DA2DE64]
GO
ALTER TABLE [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy]  WITH CHECK ADD  CONSTRAINT [ref_sf_vrsn_chngs_sf__08F3435E] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_version_dependency] ([id])
GO
ALTER TABLE [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy] CHECK CONSTRAINT [ref_sf_vrsn_chngs_sf__08F3435E]
GO
ALTER TABLE [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy]  WITH CHECK ADD  CONSTRAINT [ref_sf_vrsn_chngs_sf__1BD4FD1B] FOREIGN KEY([id])
REFERENCES [dbo].[sf_version_chnges] ([id])
GO
ALTER TABLE [dbo].[sf_vrsn_chngs_sf_vrsn_dpndncy] CHECK CONSTRAINT [ref_sf_vrsn_chngs_sf__1BD4FD1B]
GO
ALTER TABLE [dbo].[sf_wfl_dfnition_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_wfl_dfntn_sf_p_456F23F6] FOREIGN KEY([id2])
REFERENCES [dbo].[sf_permissions] ([id])
GO
ALTER TABLE [dbo].[sf_wfl_dfnition_sf_permissions] CHECK CONSTRAINT [ref_sf_wfl_dfntn_sf_p_456F23F6]
GO
ALTER TABLE [dbo].[sf_wfl_dfnition_sf_permissions]  WITH CHECK ADD  CONSTRAINT [ref_sf_wfl_dfntn_sf_p_9539A43C] FOREIGN KEY([id])
REFERENCES [dbo].[sf_wfl_definition] ([id])
GO
ALTER TABLE [dbo].[sf_wfl_dfnition_sf_permissions] CHECK CONSTRAINT [ref_sf_wfl_dfntn_sf_p_9539A43C]
GO
ALTER TABLE [dbo].[sf_wfl_dfntn_prmssnst_bjct_ttl]  WITH CHECK ADD  CONSTRAINT [ref_sf_wfl_dfntn_prms_AE143675] FOREIGN KEY([id])
REFERENCES [dbo].[sf_wfl_definition] ([id])
GO
ALTER TABLE [dbo].[sf_wfl_dfntn_prmssnst_bjct_ttl] CHECK CONSTRAINT [ref_sf_wfl_dfntn_prms_AE143675]
GO
ALTER TABLE [dbo].[sf_wfl_dfntn_spprtd_prmssn_sts]  WITH CHECK ADD  CONSTRAINT [ref_sf_wfl_dfntn_sppr_035D33DF] FOREIGN KEY([id])
REFERENCES [dbo].[sf_wfl_definition] ([id])
GO
ALTER TABLE [dbo].[sf_wfl_dfntn_spprtd_prmssn_sts] CHECK CONSTRAINT [ref_sf_wfl_dfntn_sppr_035D33DF]
GO
ALTER TABLE [dbo].[sf_wfl_lvl_cstm_mil_recipients]  WITH CHECK ADD  CONSTRAINT [ref_sf_wfl_lvl_cstm_m_AB996DAB] FOREIGN KEY([id])
REFERENCES [dbo].[sf_wfl_level] ([id])
GO
ALTER TABLE [dbo].[sf_wfl_lvl_cstm_mil_recipients] CHECK CONSTRAINT [ref_sf_wfl_lvl_cstm_m_AB996DAB]
GO
USE [master]
GO
ALTER DATABASE [Sitefinity_DB] SET  READ_WRITE 
GO
