USE [master]
GO
/****** Object:  Database [CommunityDB]    Script Date: 2024/6/28 17:25:31 ******/
CREATE DATABASE [CommunityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CommunityDB', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CommunityDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CommunityDB_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CommunityDB_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CommunityDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CommunityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CommunityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CommunityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CommunityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CommunityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CommunityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CommunityDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CommunityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CommunityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CommunityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CommunityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CommunityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CommunityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CommunityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CommunityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CommunityDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CommunityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CommunityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CommunityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CommunityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CommunityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CommunityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CommunityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CommunityDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CommunityDB] SET  MULTI_USER 
GO
ALTER DATABASE [CommunityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CommunityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CommunityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CommunityDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CommunityDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CommunityDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CommunityDB', N'ON'
GO
ALTER DATABASE [CommunityDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CommunityDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CommunityDB]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Administrator]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttendanceRecord]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [varchar](100) NULL,
	[JobNumber] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Photo] [varchar](300) NULL,
	[ChuQianTime] [datetime] NULL,
 CONSTRAINT [PK_AttendanceRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Building]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
	[FloorsCount] [int] NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Photo] [varchar](200) NULL,
	[OwnerId] [int] NULL,
	[OwnerName] [varchar](50) NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carbarn]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carbarn](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarbarnName] [varchar](50) NULL,
	[ResidentId] [int] NULL,
	[ResidentName] [varchar](50) NULL,
	[Phone] [varchar](200) NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_Carbarn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commodity]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commodity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Label] [varchar](50) NULL,
	[Introduce] [varchar](300) NULL,
	[Price] [money] NULL,
	[Integral] [varchar](100) NULL,
	[Image] [varchar](300) NULL,
 CONSTRAINT [PK_Commodity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Community]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Community](
	[Name] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[TotalArea] [varchar](50) NULL,
	[GreenRate] [varchar](50) NULL,
	[Description] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ResidentId] [int] NULL,
	[ResidentName] [varchar](50) NULL,
	[RoomNumber] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Content] [varchar](500) NULL,
	[Photo] [varchar](200) NULL,
	[Time] [datetime] NULL,
	[State] [int] NULL,
 CONSTRAINT [PK_Complaint] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EWFee]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EWFee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Electricity] [varchar](50) NULL,
	[Water] [varchar](50) NULL,
	[PayTime] [datetime] NULL,
 CONSTRAINT [PK_EWFee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Family]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Family](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name1] [varchar](50) NULL,
	[ResidentId] [int] NULL,
	[Relation] [varchar](50) NULL,
	[FamilyPhoto] [varchar](300) NULL,
	[FamilySex] [int] NULL,
 CONSTRAINT [PK_Family] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[House]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[House](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomNumber] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Area] [float] NULL,
	[OwnerId] [int] NULL,
	[OwnerName] [varchar](50) NULL,
 CONSTRAINT [PK_PropertyUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inform]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inform](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InformName] [varchar](50) NULL,
	[SenderId] [varchar](50) NULL,
	[Sender] [varchar](50) NULL,
	[ResidentId] [int] NULL,
	[content] [varchar](200) NULL,
	[time] [datetime] NULL,
	[timeEnd] [datetime] NULL,
 CONSTRAINT [PK_Inform] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaintenanceRecord]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintenanceRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDescription] [varchar](50) NULL,
	[ResidentId] [int] NULL,
	[ResidentName] [varchar](50) NULL,
	[RoomNumber] [varchar](50) NULL,
	[PhotoBefore] [varchar](200) NULL,
	[ApplyTime] [datetime] NULL,
	[RepairStartTime] [datetime] NULL,
	[RepairEndTime] [datetime] NULL,
	[PhotoAfter] [varchar](200) NULL,
	[RepairerID] [int] NULL,
	[Status] [int] NULL,
	[expenses] [money] NULL,
 CONSTRAINT [PK_MaintenanceRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Content] [varchar](500) NULL,
	[Photo] [varchar](500) NULL,
	[PublishTime] [date] NULL,
	[FaSongID] [int] NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resident]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[Name] [varchar](50) NULL,
	[Sex] [int] NULL,
	[Photo] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[HouseName] [varchar](50) NULL,
 CONSTRAINT [PK_Resident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serve]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serve](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[price] [money] NULL,
	[OrderNumber] [varchar](100) NULL,
	[Area] [varchar](50) NULL,
	[SMTime] [datetime] NULL,
	[Phone] [varchar](50) NULL,
	[ResId] [int] NULL,
	[ResName] [varchar](50) NULL,
	[BeiZhu] [varchar](100) NULL,
	[State] [int] NULL,
	[DownPayment] [money] NULL,
	[Type] [int] NULL,
	[FenPei] [int] NULL,
	[Grade] [int] NULL,
	[Estimate] [varchar](200) NULL,
 CONSTRAINT [PK_Serve] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCharge]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCharge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SypeId] [int] NULL,
	[StateTime] [date] NULL,
	[ResidentId] [int] NULL,
	[ResidentName] [varchar](50) NULL,
	[RoomNumber] [varchar](50) NULL,
	[PaymentAmount] [money] NULL,
	[PaidStatus] [int] NULL,
	[PaymentTime] [datetime] NULL,
	[Before] [float] NULL,
	[After] [float] NULL,
	[DiffValue] [float] NULL,
 CONSTRAINT [PK_ServiceCharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceChargeType]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceChargeType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ServiceChargeType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShangMenStaff]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShangMenStaff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Posswork] [varchar](100) NULL,
	[JobNumber] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Sex] [int] NULL,
	[Age] [int] NULL,
	[Phone] [varchar](50) NULL,
	[Photo] [varchar](300) NULL,
	[Department] [int] NULL,
	[State] [int] NULL,
	[Grade] [int] NULL,
	[DingdanNumber] [varchar](200) NULL,
	[ChuQianTime] [datetime] NULL,
 CONSTRAINT [PK_ShangMenStaff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Sex] [int] NULL,
	[Age] [int] NULL,
	[Photo] [varchar](200) NULL,
	[Phone] [varchar](50) NULL,
	[Department] [int] NULL,
 CONSTRAINT [PK_Repairer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitRecord]    Script Date: 2024/6/28 17:25:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitRecord](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Phone] [varchar](100) NULL,
	[ResidentName] [varchar](50) NULL,
	[RoomNumber] [varchar](50) NULL,
	[ArrivalTime] [datetime] NULL,
	[Leave] [int] NULL,
	[DepartureTime] [datetime] NULL,
	[Purpose] [varchar](100) NULL,
 CONSTRAINT [PK_VisitRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrator] ON 

INSERT [dbo].[Administrator] ([Id], [UserName], [Password]) VALUES (1, N'hhh', N'123')
INSERT [dbo].[Administrator] ([Id], [UserName], [Password]) VALUES (2, N'www', N'123')
SET IDENTITY_INSERT [dbo].[Administrator] OFF
GO
SET IDENTITY_INSERT [dbo].[AttendanceRecord] ON 

INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (9, N'000606291856', N'11285644', N'黄沙', N'15486523589', N'~/upload/OIP-C.jpg', CAST(N'2024-04-23T22:54:55.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (10, N'000606801280', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:51:38.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (11, N'000606975538', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:54:36.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (12, N'000606975538', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:55:03.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (13, N'000606975538', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:55:06.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (14, N'000606975538', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:55:10.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (15, N'000607135322', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T13:57:47.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (16, N'000607284159', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T14:14:36.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (17, N'000956165738', N'21300426', N'张亮', N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-04-24T14:20:14.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (18, N'000607446653', N'21250402', N'邱文', N'15698523654', N'~/upload/OIP-C.jpg', CAST(N'2024-04-24T21:03:52.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (19, N'000607578000', N'30220724', N'路由器', N'18887698638', N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', CAST(N'2024-04-28T14:44:16.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (20, N'000478406947', N'21300426', N'张亮', N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-04-28T17:00:38.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (21, N'000661906636', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-04-30T14:54:08.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (22, N'000775163864', N'21285987', N'坤坤', N'15458965325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-05-02T13:29:29.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (23, N'000957419760', N'10309583', N'毛易', N'12546598632', N'~/upload/veer-131734763.jpg', CAST(N'2024-05-02T13:59:42.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (24, N'000458859234', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-02T15:23:45.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (25, N'000461352188', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-02T15:28:49.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (26, N'000169254046', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-02T17:22:52.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (27, N'000174574510', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-02T17:32:42.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (28, N'000112490148', N'21285987', N'坤坤', N'15458965325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-05-02T23:42:40.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (1028, N'000404617906', N'21250402', N'邱文文1', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-05T17:44:12.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (2028, N'000112490148', N'21300426', N'张亮', N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-05-07T22:52:47.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (2029, N'000305406354', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-07T23:17:11.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (2030, N'000564746488', N'21300426', N'张亮', N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-05-08T09:26:52.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (3028, N'000559269312', N'21250402', N'邱文文', N'15698523654', N'~/upload/20220718001858_4c9eb.jpg', CAST(N'2024-05-08T14:46:44.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4028, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4029, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4030, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4031, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4032, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4033, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4034, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4035, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4036, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4037, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4038, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4039, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4040, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4041, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4042, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4043, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4044, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4045, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4046, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4047, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4048, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4049, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4050, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4051, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4052, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4053, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4054, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4055, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4056, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4057, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4058, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4059, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4060, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4061, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4062, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4063, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4064, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4065, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4066, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4067, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4068, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4069, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4070, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4071, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4072, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4073, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4074, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4075, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4076, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4077, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4078, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4079, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4080, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4081, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4082, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4083, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4084, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4085, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4086, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4087, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4088, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4089, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4090, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4091, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4092, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4093, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4094, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4095, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4096, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4097, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4098, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4099, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4100, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4101, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4102, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4103, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4104, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (4105, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5028, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5029, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5030, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5031, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5032, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5033, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5034, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5035, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5036, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5037, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5038, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5039, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5040, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5041, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5042, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5043, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5044, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5045, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5046, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5047, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5048, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5049, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5050, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5051, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5052, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5053, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5054, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5055, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5056, N'000680087189', N'21250402', N'邱文文', N'15698523654', N'~/upload/20140823161717_USsSX.jpg', CAST(N'2024-05-10T11:12:17.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (5057, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6028, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6029, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6030, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6031, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6032, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6033, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6034, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6035, N'000223461108', N'21285987', N'张杰', N'15458965325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-06-03T10:11:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6036, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6037, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6038, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6039, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6040, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6041, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6042, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6043, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6044, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6045, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6046, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6047, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (6048, N'', N'', N'', N'', N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (7028, N'000058141411', N'10309583', N'毛易', N'12546598632', N'~/upload/veer-131734763.jpg', CAST(N'2024-06-28T13:35:12.000' AS DateTime))
INSERT [dbo].[AttendanceRecord] ([Id], [OrderNumber], [JobNumber], [Name], [Phone], [Photo], [ChuQianTime]) VALUES (7029, N'000058141411', N'21300426', N'张亮', N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', CAST(N'2024-06-28T13:35:14.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[AttendanceRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (4064, N'云A893EX', N'~/carUpload/20150126213929.jpg', 6209, N'张昊')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6062, N'云H35BX', N'~/carUpload/R-C (5).jpg', 6210, N'周向')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6063, N'云H666S', N'~/carUpload/R-C (1).jpg', 6210, N'周向')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6065, N'云C88888', N'~/carUpload/R-C (3).jpg', 6211, N'谭涛')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6066, N'云PKK008', N'~/carUpload/R-C (6).jpg', 6212, N'王丛')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6067, N'云A9T89S', N'~/carUpload/R-C (3).jpg', 6212, N'王丛')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6068, N'云GJE937', N'~/carUpload/6dcc6f145f124b99650b723e634144c4.jpg', 6213, N'张明')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6069, N'云GMV312', N'~/carUpload/20151112003423m3ebQm3ebQ.jpg', 6214, N'路远')
INSERT [dbo].[Car] ([Id], [Name], [Photo], [OwnerId], [OwnerName]) VALUES (6070, N'云AZ636S', N'~/carUpload/R-C (4).jpg', 6214, N'路远')
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Carbarn] ON 

INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (1, N'1-1', 6209, N'张昊', N'15554569856', 1)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (6, N'1-6', 6210, N'周向', N'15698545698', 2)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (7, N'1-7', 6209, N'张昊', N'15554569856', 1)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (8, N'1-8', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (12, N'1-12', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (23, N'2-2', 6212, N'王丛', N'15459632589', 1)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (1029, N'2-3', 6215, N'高进', N'15554865236', 2)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (1031, N'2-5', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (1032, N'2-6', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (2030, N'2-7', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (2031, N'2-8', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (2032, N'3-1', 6214, N'路远', N'12232323453', 1)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (2033, N'3-2', 0, N'', N'', 0)
INSERT [dbo].[Carbarn] ([Id], [CarbarnName], [ResidentId], [ResidentName], [Phone], [State]) VALUES (2034, N'3-3', 0, N'', N'', 0)
SET IDENTITY_INSERT [dbo].[Carbarn] OFF
GO
SET IDENTITY_INSERT [dbo].[Commodity] ON 

INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (1, N'女包', N'歌诗嫚包包女包轻奢品牌高级感中年女士真皮手提包送妈妈款斜挎包', 415.0000, N'415000', N'~/upload/12.jpg')
INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (2, N'男鞋', N'男鞋夏季透气板鞋新款潮牌百搭运动休闲小白白鞋男士男款鞋子潮鞋', 498.0000, N'498000', N'~/upload/11.jpg')
INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (3, N'男鞋', N'木林森布鞋男夏季青少年学生经典黑色平底2024新款软底防滑帆布鞋', 399.0000, N'390000', N'~/upload/13.jpg')
INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (4, N'手工刀', N'得力美工刀手工裁纸刀小号美术开箱切割包裹专用刀具', 2.0000, N'200', N'~/upload/14.jpg')
INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (5, N'女衣', N'早春装搭配一整套女2024新款初春季穿搭炸街减龄时尚初春两件套装', 69.0000, N'69000', N'~/upload/15.jpg')
INSERT [dbo].[Commodity] ([Id], [Label], [Introduce], [Price], [Integral], [Image]) VALUES (6, N'篮球鞋男', N'nike耐克 AJ1 空军一号airjordan1中高帮篮球鞋switch红蓝PS电玩', 1299.0000, N'1299000', N'~/upload/16.jpg')
SET IDENTITY_INSERT [dbo].[Commodity] OFF
GO
SET IDENTITY_INSERT [dbo].[Complaint] ON 

INSERT [dbo].[Complaint] ([Id], [ResidentId], [ResidentName], [RoomNumber], [Title], [Content], [Photo], [Time], [State]) VALUES (1009, 2148, N'高顺昆', N'1-601', N'乱堆放物品', N'1栋旁边有人乱堆放垃圾', N'~/upload/300.jpg', CAST(N'2024-03-27T20:19:16.000' AS DateTime), 1)
INSERT [dbo].[Complaint] ([Id], [ResidentId], [ResidentName], [RoomNumber], [Title], [Content], [Photo], [Time], [State]) VALUES (2010, 4183, N'香烟', N'1-401', N'噪音1', N'1-402业主总是晚上十一二点弹奏乐器，严重影响到我们的正常休息质量，请及时处理！', N'~/upload/0305_175936144405.jpg', CAST(N'2024-05-02T14:54:28.000' AS DateTime), 1)
INSERT [dbo].[Complaint] ([Id], [ResidentId], [ResidentName], [RoomNumber], [Title], [Content], [Photo], [Time], [State]) VALUES (2011, 4183, N'香烟', N'1-401', N'方法', N'范德萨', N'~/upload/veer-131734763.jpg', CAST(N'2024-04-30T23:17:52.000' AS DateTime), 1)
INSERT [dbo].[Complaint] ([Id], [ResidentId], [ResidentName], [RoomNumber], [Title], [Content], [Photo], [Time], [State]) VALUES (4014, 6209, N'张昊', N'1-101', N'占用公共过道', N'1栋1楼过道有人总是堆放个人物品，占用公共面积，请处理。', N'~/upload/1000.png', CAST(N'2024-06-03T10:14:15.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Complaint] OFF
GO
SET IDENTITY_INSERT [dbo].[Family] ON 

INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (2011, N'张明', 4183, N'儿子', N'~/carUpload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', 1)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (2012, N'张媛媛', 4183, N'女儿', N'~/carUpload/20220718001858_4c9eb.jpg', 0)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (2014, N'张亮', 4183, N'父亲', N'~/carUpload/u=3333338384,401021464&fm=253&gp=0.jpg', 1)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (2015, N'罗翠华', 4183, N'母亲', N'~/carUpload/veer-153745543.jpg', 0)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (2016, N'张亮', 6209, N'儿子', N'~/carUpload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', 1)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (3016, N'张欣欣', 6209, N'女儿', N'~/carUpload/20220718001858_4c9eb.jpg', 0)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (3017, N'罗花', 6209, N'母亲', N'~/carUpload/veer-153745543.jpg', 0)
INSERT [dbo].[Family] ([Id], [Name1], [ResidentId], [Relation], [FamilyPhoto], [FamilySex]) VALUES (3018, N'张子爱', 6209, N'女儿', N'~/carUpload/20140823161717_USsSX.jpg', 0)
SET IDENTITY_INSERT [dbo].[Family] OFF
GO
SET IDENTITY_INSERT [dbo].[House] ON 

INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1, N'1-101', N'三室一厅', 400, 6209, N'张昊')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (8, N'1-204', N'三室一厅', 350, 6210, N'周向')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1009, N'1-301', N'三室一厅', 350, 6211, N'谭涛')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1010, N'1-302', N'三室一厅', 350, 6213, N'张明')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1012, N'1-304', N'三室一厅', 350, 6214, N'路远')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1013, N'1-401', N'三室一厅', 350, 6223, N'周文')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1014, N'1-402', N'三室一厅', 350, 6212, N'王丛')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1015, N'1-403', N'三室一厅', 350, 6215, N'高进')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1016, N'1-404', N'两室一厅', 240, 6216, N'高源')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1017, N'1-501', N'两室一厅', 240, 6220, N'周媛')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1019, N'1-503', N'一室一厅', 120, 6221, N'向云')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1020, N'1-504', N'两室一厅', 240, 6224, N'张华')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1022, N'1-602', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1023, N'1-603', N'两室一厅', 240, 0, N'')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1025, N'2-101', N'两室一厅', 240, 0, N'')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1026, N'2-102', N'两室一厅', 240, 0, N'')
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1027, N'2-103', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1028, N'2-104', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1029, N'2-201', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1030, N'2-202', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1031, N'2-203', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1032, N'2-204', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1033, N'2-301', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1034, N'2-302', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1035, N'2-303', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1036, N'2-304', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1037, N'2-401', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1038, N'2-402', N'三室一厅', 350, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1039, N'2-403', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1040, N'2-404', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1041, N'2-501', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1042, N'2-502', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1043, N'2-503', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1044, N'2-504', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1045, N'2-601', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1046, N'2-602', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1047, N'2-603', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (1048, N'2-604', N'两室一厅', 240, NULL, NULL)
INSERT [dbo].[House] ([Id], [RoomNumber], [Type], [Area], [OwnerId], [OwnerName]) VALUES (3068, N'1-10121', N'一室一厅', 255, NULL, N'')
SET IDENTITY_INSERT [dbo].[House] OFF
GO
SET IDENTITY_INSERT [dbo].[Inform] ON 

INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4023, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4024, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4025, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4026, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4027, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4028, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4029, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4030, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4031, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4032, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4033, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4034, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4035, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4036, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4037, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4038, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4039, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4040, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4041, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4042, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4043, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4044, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4045, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4046, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4047, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4048, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4049, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4050, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4051, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4052, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4053, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4054, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4055, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4056, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4057, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4058, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4059, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4060, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4061, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4062, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4063, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4064, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4065, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4066, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4067, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4068, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4069, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4070, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4071, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4072, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4073, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4074, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4075, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4077, N'欠费缴纳', N'', N'系统管理员', -1, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4078, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4079, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4080, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4081, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4082, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4083, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4084, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4085, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4086, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4087, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4088, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4090, N'欠费缴纳', N'', N'系统管理员', 5182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4091, N'欠费缴纳', N'', N'系统管理员', 5183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4092, N'欠费缴纳', N'', N'系统管理员', 5184, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4093, N'欠费缴纳', N'', N'系统管理员', 5185, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4094, N'欠费缴纳', N'', N'系统管理员', 6198, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4095, N'欠费缴纳', N'', N'系统管理员', 6199, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4096, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4097, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4098, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4099, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4100, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4101, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4102, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4103, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4104, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4105, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4106, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4107, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-28T22:28:57.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4108, N'病假', N'21250402', N'邱文文', 1, N'生病请假', CAST(N'2024-04-30T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4109, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4110, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4111, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4112, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4113, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4114, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4115, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4116, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4117, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4118, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4119, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4120, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4121, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4122, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4123, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4124, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4125, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4126, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4127, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4128, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4129, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4130, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4131, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4132, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4133, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4134, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4135, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4136, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4137, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4138, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4139, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4140, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4141, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4142, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4143, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4144, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4145, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4146, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4147, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4148, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4149, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4150, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4151, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4152, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4153, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4154, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4155, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4156, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4157, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4158, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4159, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4160, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4161, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4163, N'欠费缴纳', N'', N'系统管理员', -1, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4164, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4165, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4166, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4167, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4168, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4169, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4170, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4171, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4172, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4173, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4174, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4176, N'欠费缴纳', N'', N'系统管理员', 5182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4177, N'欠费缴纳', N'', N'系统管理员', 5183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4178, N'欠费缴纳', N'', N'系统管理员', 5184, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4179, N'欠费缴纳', N'', N'系统管理员', 5185, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4180, N'欠费缴纳', N'', N'系统管理员', 6198, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4181, N'欠费缴纳', N'', N'系统管理员', 6199, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4182, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4183, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4184, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4185, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4186, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4187, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4188, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4189, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4190, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4191, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4192, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4193, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4194, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4195, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4196, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4197, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4198, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4199, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4200, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4201, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4202, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4203, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4204, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4205, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4206, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4207, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4208, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4209, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4210, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4211, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4212, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4213, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4214, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4215, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4216, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4217, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4218, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4219, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4220, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4221, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4222, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4223, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:50:51.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4224, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4225, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4226, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4227, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4228, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4229, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4230, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4231, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4232, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4233, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4234, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4235, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4236, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4237, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4238, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4239, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4240, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4241, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4242, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4243, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4244, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4245, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4246, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4247, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4248, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4249, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4250, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4251, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4252, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4253, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4254, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4255, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4256, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4257, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4258, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4259, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4260, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4261, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4262, N'欠费缴纳', N'', N'系统管理员', 2151, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4263, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4264, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4265, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4266, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4267, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4268, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4269, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4270, N'欠费缴纳', N'', N'系统管理员', 4178, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4271, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4272, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4273, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4274, N'欠费缴纳', N'', N'系统管理员', 4182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4275, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4277, N'欠费缴纳', N'', N'系统管理员', -1, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4278, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4279, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4280, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4281, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4282, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4283, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4284, N'欠费缴纳', N'', N'系统管理员', 4176, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4285, N'欠费缴纳', N'', N'系统管理员', 4177, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4286, N'欠费缴纳', N'', N'系统管理员', 4179, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4287, N'欠费缴纳', N'', N'系统管理员', 4180, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4288, N'欠费缴纳', N'', N'系统管理员', 4181, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4290, N'欠费缴纳', N'', N'系统管理员', 5182, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4291, N'欠费缴纳', N'', N'系统管理员', 5183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4292, N'欠费缴纳', N'', N'系统管理员', 5184, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4293, N'欠费缴纳', N'', N'系统管理员', 5185, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4294, N'欠费缴纳', N'', N'系统管理员', 6198, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4295, N'欠费缴纳', N'', N'系统管理员', 6199, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4296, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4297, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4298, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4299, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4300, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4301, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4302, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4303, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4304, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4305, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4306, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4307, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4308, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4309, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4310, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4311, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4312, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4313, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4314, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4315, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4316, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4317, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4318, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4319, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4320, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4321, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4322, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4323, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4324, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4325, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4326, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4327, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4328, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4329, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4330, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4331, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4332, N'欠费缴纳', N'', N'系统管理员', 2149, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4333, N'欠费缴纳', N'', N'系统管理员', 4169, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4334, N'欠费缴纳', N'', N'系统管理员', 4170, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4335, N'欠费缴纳', N'', N'系统管理员', 4171, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4336, N'欠费缴纳', N'', N'系统管理员', 4174, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4337, N'欠费缴纳', N'', N'系统管理员', 4175, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-04-30T13:51:04.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4340, N'噪音投诉', N'', N'物业管理员', -1, N'已处理', CAST(N'2024-05-01T21:10:15.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4341, N'42423', N'', N'物业管理员', -1, N'432432', CAST(N'2024-05-01T21:11:24.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4342, N'噪音问题', N'', N'物业管理员', 4183, N'已解决', CAST(N'2024-05-01T21:14:52.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4411, N'欠费缴纳', N'', N'系统管理员', 4183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T14:29:43.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4412, N'欠费缴纳', N'', N'系统管理员', 4183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T14:29:45.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4413, N'欠费缴纳', N'', N'系统管理员', 4183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T14:29:45.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4417, N'欠费缴纳', N'', N'系统管理员', 4183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:01:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4418, N'欠费缴纳', N'', N'系统管理员', 4183, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4421, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4424, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4427, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4428, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4429, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4430, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4431, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4432, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4433, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4434, N'欠费缴纳', N'', N'系统管理员', 6218, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:15:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4441, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4444, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4445, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4446, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4447, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4448, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4449, N'欠费缴纳', N'', N'系统管理员', 6218, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4451, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4454, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4455, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4456, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4459, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4460, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4461, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4464, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4465, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4466, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4469, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4470, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4471, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4474, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4475, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4476, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4477, N'欠费缴纳', N'', N'系统管理员', -1, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4480, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4481, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4482, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4483, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4484, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4485, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4486, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4489, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4490, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4491, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4492, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4493, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4494, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (4495, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-02T23:41:10.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5419, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5421, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5422, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5423, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5424, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5425, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5426, N'欠费缴纳', N'', N'系统管理员', 6218, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5428, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5431, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5432, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5433, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5436, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5437, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5438, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5441, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5442, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5443, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5446, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5447, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5448, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5450, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5451, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5452, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5453, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5454, N'欠费缴纳', N'', N'系统管理员', -1, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5456, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5457, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5458, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5459, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5460, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5461, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5462, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5463, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5465, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5466, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5467, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5468, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5469, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5470, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5471, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5472, N'欠费缴纳', N'', N'系统管理员', 6217, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5474, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:13.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (5475, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-05T15:09:15.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6418, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6419, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6420, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6421, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6422, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6423, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6424, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6425, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6426, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6428, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6429, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6430, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:03:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6432, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6433, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6434, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6435, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6436, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6437, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6438, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6439, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6440, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6442, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6443, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6444, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6447, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6448, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6449, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6450, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6451, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6452, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6453, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6454, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6455, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6456, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6458, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6459, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6460, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:09.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6462, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6463, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6464, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6465, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6466, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6467, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6468, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6469, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6470, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6472, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6473, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6474, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6477, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6478, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6479, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6480, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6481, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6482, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6483, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6484, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6485, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6486, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6488, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6489, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6490, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:04:23.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6492, N'噪音', N'', N'物业管理员', 6209, N'已处理', CAST(N'2024-05-07T23:47:06.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6494, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6495, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6496, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6497, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6498, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6499, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6500, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6501, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6502, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6504, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6505, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6506, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-07T23:56:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6508, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6509, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6510, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6511, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6512, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6513, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6514, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6515, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6516, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6518, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6519, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6520, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T08:57:25.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6522, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6523, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6524, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6525, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6526, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6527, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6528, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6529, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6530, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6532, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6533, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6534, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6535, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (6536, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T09:48:03.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7418, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7419, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7420, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7421, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7422, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7423, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7424, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7425, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7426, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7428, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7429, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7430, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7431, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7432, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (7433, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-08T13:13:44.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8418, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8419, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8420, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8421, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8422, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8423, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8424, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8425, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8426, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8427, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8428, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8429, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8430, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8432, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8433, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8434, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8435, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8436, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8437, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8438, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8439, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8441, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8442, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:51:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8445, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8446, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8447, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8448, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8449, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8450, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8451, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8452, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8453, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8454, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8455, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8456, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8457, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8459, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8460, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8461, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8462, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8463, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8464, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8465, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8466, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8468, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8469, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:01.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8472, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8473, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8474, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8475, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8476, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8477, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8478, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8479, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8480, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8481, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8482, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8483, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8484, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8486, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8487, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8488, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8489, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8490, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8491, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8492, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8493, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8495, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8496, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:54:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8499, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8500, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8501, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8502, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8503, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8504, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8505, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8506, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8507, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8508, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8509, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8510, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8511, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8512, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8513, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8514, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8515, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8516, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8517, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8518, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8519, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8520, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8522, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8523, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8524, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:55:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8525, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T21:56:42.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8527, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8528, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8529, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8530, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8531, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8532, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8533, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8534, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8535, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8536, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8537, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8538, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8539, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8540, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8541, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8542, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8543, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8544, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8545, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8546, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8547, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:58.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8549, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8550, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8551, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8552, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8553, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8554, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8555, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8556, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8557, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8558, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8559, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8560, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8561, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8563, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (8564, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-09T23:29:59.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (9417, N'事假', N'21250402', N'邱文文', 1, N'家中有急事，需要回家处理。', CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(N'2024-05-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10417, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10418, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10419, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10420, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10421, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10422, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10423, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10424, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10425, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10426, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10427, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10428, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10429, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10430, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10431, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10432, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10433, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10434, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10435, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10436, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10437, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10439, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10440, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10441, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10442, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10443, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10444, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10446, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10447, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10448, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10449, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10450, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10451, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10452, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10453, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10454, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10455, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10456, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10457, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10458, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10459, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10460, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10461, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10462, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10463, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10464, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10465, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10466, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10467, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10468, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10469, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10470, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10471, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10472, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10473, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10474, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10475, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10476, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10477, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10478, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10479, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10480, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10481, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10482, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10483, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10484, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10485, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10486, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10487, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10488, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10489, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10490, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10491, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10492, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10493, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10494, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10495, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10496, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10497, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10498, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10499, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10500, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (10501, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-05-10T15:50:02.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11417, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11418, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11419, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11420, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11421, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11422, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11423, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11424, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11425, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11426, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11427, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11428, N'欠费缴纳', N'', N'系统管理员', 6227, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11429, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11430, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11431, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11432, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11433, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11434, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11435, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11436, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11437, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11438, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11439, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11440, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11441, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11442, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11443, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11444, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11445, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11446, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11447, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11448, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11449, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11450, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11451, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11452, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11453, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11454, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11455, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11456, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11457, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11458, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11459, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11460, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11461, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11462, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11463, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11464, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11465, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11466, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11467, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11468, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11469, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11470, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11471, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11472, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11473, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11474, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11475, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11476, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11477, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11478, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11479, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11480, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11481, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11482, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11483, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11484, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11485, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11486, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11487, N'欠费缴纳', N'', N'系统管理员', 6226, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11488, N'欠费缴纳', N'', N'系统管理员', 6209, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11489, N'欠费缴纳', N'', N'系统管理员', 6210, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11490, N'欠费缴纳', N'', N'系统管理员', 6211, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11491, N'欠费缴纳', N'', N'系统管理员', 6212, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11492, N'欠费缴纳', N'', N'系统管理员', 6213, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11493, N'欠费缴纳', N'', N'系统管理员', 6214, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11494, N'欠费缴纳', N'', N'系统管理员', 6215, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11495, N'欠费缴纳', N'', N'系统管理员', 6216, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11496, N'欠费缴纳', N'', N'系统管理员', 6220, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11497, N'欠费缴纳', N'', N'系统管理员', 6221, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11498, N'欠费缴纳', N'', N'系统管理员', 6223, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11499, N'欠费缴纳', N'', N'系统管理员', 6224, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11500, N'欠费缴纳', N'', N'系统管理员', 6225, N'尊敬的业主，您的物业费存在未缴或逾期情况，请尽快前往缴费！', CAST(N'2024-06-03T10:08:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11501, N'占用公共过道', N'', N'物业管理员', 6209, N'已解决', CAST(N'2024-06-03T10:12:48.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Inform] ([Id], [InformName], [SenderId], [Sender], [ResidentId], [content], [time], [timeEnd]) VALUES (11502, N'病假', N'21250402', N'邱文文', 1, N'病假', CAST(N'2024-06-13T00:00:00.000' AS DateTime), CAST(N'2024-06-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Inform] OFF
GO
SET IDENTITY_INSERT [dbo].[MaintenanceRecord] ON 

INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (19, N'电路短路', 2148, N'高顺昆', N'1-601', N'~/maintainUpload/OIP-C.jpg', CAST(N'2024-03-08T17:23:56.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (20, N'水管爆裂', 2148, N'高顺昆', N'1-601', N'~/maintainUpload/20140823161717_USsSX.jpg', CAST(N'2024-03-08T17:44:50.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 7, 1, NULL)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (21, N'马桶烂了', 2148, N'高顺昆', N'1-601', N'~/maintainUpload/0305_175936144405.jpg', CAST(N'2024-03-09T16:50:55.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 2, 1, NULL)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (22, N'水管裂开', 2148, N'高顺昆', N'1-601', N'~/maintainUpload/R-C (5).jpg', CAST(N'2024-03-24T14:45:46.000' AS DateTime), CAST(N'2024-04-03T22:24:23.000' AS DateTime), CAST(N'2024-04-03T22:24:33.000' AS DateTime), N'~/maintainUpload/R-C (4).jpg', 1, 2, 88.0000)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (23, N'地砖破裂', 2148, N'高顺昆', N'1-601', N'~/maintainUpload/20140823161717_USsSX.jpg', CAST(N'2024-04-01T14:21:40.000' AS DateTime), CAST(N'2024-04-01T14:23:10.000' AS DateTime), CAST(N'2024-04-01T14:23:18.000' AS DateTime), N'~/maintainUpload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', 3, 1, 88.0000)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (24, N'fgh', 4173, N'昂热', N'2-501', N'', CAST(N'2024-04-03T22:21:47.000' AS DateTime), CAST(N'2024-04-03T22:25:42.000' AS DateTime), CAST(N'2024-04-03T22:25:49.000' AS DateTime), N'~/maintainUpload/R-C (1).jpg', 3, 1, 22.0000)
INSERT [dbo].[MaintenanceRecord] ([Id], [IssueDescription], [ResidentId], [ResidentName], [RoomNumber], [PhotoBefore], [ApplyTime], [RepairStartTime], [RepairEndTime], [PhotoAfter], [RepairerID], [Status], [expenses]) VALUES (25, N'佛挡杀佛发多少', 4183, N'香烟', N'1-401', N'~/maintainUpload/20151112003423m3ebQm3ebQ.jpg', CAST(N'2024-04-22T00:19:24.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), NULL, NULL, 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[MaintenanceRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Notice] ON 

INSERT [dbo].[Notice] ([Id], [Title], [Content], [Photo], [PublishTime], [FaSongID]) VALUES (4040, N'系统维修', N'2024-5-9至20224-5-10将进行系统维修，带来不便望海涵！', N'', CAST(N'2024-06-03' AS Date), 0)
INSERT [dbo].[Notice] ([Id], [Title], [Content], [Photo], [PublishTime], [FaSongID]) VALUES (6041, N'小区环境卫生问题', N'请各位业主和工作人员，爱护小区环境卫生，做到不随地丢垃圾，共同打造健康舒适卫生的小区环境', N'', CAST(N'2024-05-10' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Notice] OFF
GO
SET IDENTITY_INSERT [dbo].[Resident] ON 

INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6209, N'青山绿水', N'GGGGG3643ggggg', N'张昊', 1, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'15554569856', N'1-101')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6210, N'zhouxiang', N'ZZZZZ3643zzzzz', N'周向', 1, N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', N'15698545698', N'1-204')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6211, N'tantao', N'TTTTT3643ttttt', N'谭涛', 1, N'~/upload/v2-a1f1150e140ba4b6304e5e06d9b546bc_r.jpg', N'15659854563', N'1-301')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6212, N'wangcong', N'WWWWW3643wwwww', N'王丛', 0, N'~/upload/OIP-C.jpg', N'15459632589', N'1-402')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6213, N'zhangming', N'ZZZZZ3643zzzzz', N'张明', 0, N'~/upload/R-C.jpg', N'15554563256', N'1-302')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6214, N'luyuan', N'LLLLL3643lllll', N'路远', 1, N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', N'12232323453', N'1-304')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6215, N'gaojin', N'GGGGG3643ggggg', N'高进', 1, N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', N'15554865236', N'1-403')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6216, N'gaoyuan', N'GGGGG3643ggggg', N'高源', 0, N'~/upload/OIP-C.jpg', N'15458965236', N'1-404')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6220, N'zhouyuan', N'ZZZZZ3643zzzzz', N'周媛', 0, N'~/upload/20220718001858_4c9eb.jpg', N'15554589632', N'1-501')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6221, N'xiangyun', N'XXXXX3643xxxxx', N'向云', 1, N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', N'15465896523', N'1-503')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6223, N'zhouwen', N'ZZZZZ3643zzzzz', N'周文', 1, N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', N'15554569859', N'1-401')
INSERT [dbo].[Resident] ([Id], [Username], [Password], [Name], [Sex], [Photo], [Phone], [HouseName]) VALUES (6224, N'ZZZ', N'ZZZZZ3643zzzzz', N'张华', 1, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'15545985634', N'1-504')
SET IDENTITY_INSERT [dbo].[Resident] OFF
GO
SET IDENTITY_INSERT [dbo].[Serve] ON 

INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (1064, N'日常清洁4小时', 150.0000, N'000169254046', N'1-401', CAST(N'2024-05-10T19:23:00.000' AS DateTime), N'15554589632', 6209, N'张昊', N'家有小孩', 0, 0.0000, 2, 2, 5, N'好！')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (1065, N'床组装/维修', 50.0000, N'000174574510', N'1-401', CAST(N'2024-05-10T19:23:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'家有宠物', 0, 9.0000, 8, 2, 2, N'服务态度很不好')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (2066, N'深度保洁6小时', 469.0000, N'000404617906', N'1-101', CAST(N'2024-05-13T17:29:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'家有老人', 0, 0.0000, 1, 2, 1, N'服务态度很不好')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (2067, N'日常清洁4小时', 150.0000, N'000223461108', N'1-204', CAST(N'2024-05-09T15:00:00.000' AS DateTime), N'15698545698', 6210, N'周向', N'家中有贵重易碎物品，请勿损坏', 1, 0.0000, 2, 2, 0, N'')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (2068, N'床组装/维修', 80.0000, N'000305406354', N'1-204', CAST(N'2024-05-09T14:00:00.000' AS DateTime), N'15698545698', 6210, N'周向', N'无', 0, 9.0000, 8, 2, 0, N'')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (2069, N'窗帘杆轨道/打孔/维修', 100.0000, N'000559269312', N'1-101', CAST(N'2024-05-10T14:30:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'', 0, 9.0000, 8, 2, 5, N'好')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (2070, N'地漏/浴室疏通', 120.0000, N'000564746488', N'1-101', CAST(N'2024-05-11T17:30:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'无', 0, 9.0000, 7, 2, 0, N'')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (3067, N'油烟机拆洗+灶台清洗', 189.0000, N'000775529463', N'1-101', CAST(N'2024-05-10T15:00:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'无', 1, 0.0000, 5, 1, 0, N'')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (4069, N'地漏/浴室疏通', 120.0000, N'000680087189', N'1-101', CAST(N'2024-05-10T03:00:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'', 0, 9.0000, 7, 2, 3, N'一般')
INSERT [dbo].[Serve] ([Id], [Name], [price], [OrderNumber], [Area], [SMTime], [Phone], [ResId], [ResName], [BeiZhu], [State], [DownPayment], [Type], [FenPei], [Grade], [Estimate]) VALUES (5067, N'对开门冰箱', 165.0000, N'000058141411', N'1-101', CAST(N'2024-05-11T14:00:00.000' AS DateTime), N'18887698638', 6209, N'张昊', N'无', 1, 0.0000, 6, 2, 0, N'')
SET IDENTITY_INSERT [dbo].[Serve] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCharge] ON 

INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5898, 1, CAST(N'2024-05-07' AS Date), 6209, N'张昊', N'1-101', 400.0000, 3, CAST(N'2024-05-09T23:19:19.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5899, 1, CAST(N'2024-05-07' AS Date), 6210, N'周向', N'1-204', 350.0000, 1, CAST(N'2024-05-07T22:40:02.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5900, 1, CAST(N'2024-05-07' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5901, 1, CAST(N'2024-05-07' AS Date), 6212, N'王丛', N'1-402', 350.0000, 1, CAST(N'2024-06-03T10:09:41.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5902, 1, CAST(N'2024-05-07' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5903, 1, CAST(N'2024-05-07' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5904, 1, CAST(N'2024-05-07' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5905, 1, CAST(N'2024-05-07' AS Date), 6216, N'高源', N'1-404', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5906, 1, CAST(N'2024-05-07' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5907, 1, CAST(N'2024-05-07' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5908, 1, CAST(N'2024-05-07' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5909, 1, CAST(N'2024-05-07' AS Date), 6224, N'张华', N'1-504', 240.0000, 1, CAST(N'2024-05-09T21:50:07.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5910, 1, CAST(N'2024-05-07' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5911, 1, CAST(N'2024-05-07' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5912, 1, CAST(N'2024-05-07' AS Date), 6227, N'唐欣', N'1-603', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5913, 2, CAST(N'2024-05-07' AS Date), 6210, N'周向', N'1-204', 50.0000, 1, CAST(N'2024-05-07T22:41:02.000' AS DateTime), 50, 100, 50)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5914, 3, CAST(N'2024-05-07' AS Date), 6210, N'周向', N'1-204', 70.0000, 1, CAST(N'2024-05-07T22:40:09.000' AS DateTime), 230, 300, 70)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5915, 2, CAST(N'2024-05-07' AS Date), 6209, N'张昊', N'1-101', 50.0000, 1, CAST(N'2024-05-07T23:16:41.000' AS DateTime), 180, 230, 50)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5931, 1, CAST(N'2024-04-08' AS Date), 6209, N'张昊', N'1-101', 400.0000, 1, CAST(N'2024-05-08T09:12:00.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5932, 1, CAST(N'2024-04-08' AS Date), 6210, N'周向', N'1-204', 350.0000, 1, CAST(N'2024-05-08T09:12:09.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5933, 1, CAST(N'2024-04-08' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 1, CAST(N'2024-05-08T09:12:13.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5934, 1, CAST(N'2024-04-08' AS Date), 6212, N'王丛', N'1-402', 350.0000, 1, CAST(N'2024-05-08T09:12:16.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5935, 1, CAST(N'2024-04-08' AS Date), 6213, N'张明', N'1-302', 350.0000, 1, CAST(N'2024-05-08T09:12:21.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5936, 1, CAST(N'2024-04-08' AS Date), 6214, N'路远', N'1-304', 350.0000, 1, CAST(N'2024-05-08T09:12:23.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5937, 1, CAST(N'2024-04-08' AS Date), 6215, N'高进', N'1-403', 350.0000, 1, CAST(N'2024-05-08T09:12:25.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5938, 1, CAST(N'2024-04-08' AS Date), 6216, N'高源', N'1-404', 240.0000, 1, CAST(N'2024-05-08T09:12:27.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5939, 1, CAST(N'2024-04-08' AS Date), 6220, N'周媛', N'1-501', 240.0000, 1, CAST(N'2024-05-08T09:12:30.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5940, 1, CAST(N'2024-04-08' AS Date), 6221, N'向云', N'1-503', 120.0000, 1, CAST(N'2024-05-08T09:12:33.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5941, 1, CAST(N'2024-04-08' AS Date), 6223, N'周文', N'1-401', 350.0000, 1, CAST(N'2024-05-08T09:12:35.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5942, 1, CAST(N'2024-04-08' AS Date), 6224, N'张华', N'1-504', 240.0000, 1, CAST(N'2024-05-08T09:12:37.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5943, 1, CAST(N'2024-04-08' AS Date), 6225, N'梁成', N'1-601', 240.0000, 1, CAST(N'2024-05-08T09:12:39.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5944, 1, CAST(N'2024-04-08' AS Date), 6226, N'高赫', N'1-602', 240.0000, 1, CAST(N'2024-05-10T15:50:27.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5945, 1, CAST(N'2024-04-08' AS Date), 6227, N'唐欣', N'1-603', 240.0000, 1, CAST(N'2024-05-09T21:50:03.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (5946, 3, CAST(N'2024-05-08' AS Date), 6221, N'向云', N'1-503', 90.0000, 1, CAST(N'2024-05-09T21:49:58.000' AS DateTime), 210, 300, 90)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6890, 1, CAST(N'2024-05-08' AS Date), 6209, N'张昊', N'1-101', 400.0000, 1, CAST(N'2024-05-09T21:57:44.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6891, 1, CAST(N'2024-05-08' AS Date), 6210, N'周向', N'1-204', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6892, 1, CAST(N'2024-05-08' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6893, 1, CAST(N'2024-05-08' AS Date), 6212, N'王丛', N'1-402', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6894, 1, CAST(N'2024-05-08' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6895, 1, CAST(N'2024-05-08' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6896, 1, CAST(N'2024-05-08' AS Date), 6215, N'高进', N'1-403', 350.0000, 1, CAST(N'2024-05-09T21:50:01.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6897, 1, CAST(N'2024-05-08' AS Date), 6216, N'高源', N'1-404', 240.0000, 1, CAST(N'2024-05-09T21:49:55.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6898, 1, CAST(N'2024-05-08' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6899, 1, CAST(N'2024-05-08' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6900, 1, CAST(N'2024-05-08' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6901, 1, CAST(N'2024-05-08' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6902, 1, CAST(N'2024-05-08' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (6903, 1, CAST(N'2024-05-08' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7890, 3, CAST(N'2024-05-09' AS Date), 6209, N'张昊', N'1-101', 60.0000, 1, CAST(N'2024-05-09T23:29:48.000' AS DateTime), 20, 80, 60)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7891, 1, CAST(N'2024-05-09' AS Date), 6209, N'张昊', N'1-101', 400.0000, 1, CAST(N'2024-05-09T23:30:40.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7892, 1, CAST(N'2024-05-09' AS Date), 6210, N'周向', N'1-204', 350.0000, 1, CAST(N'2024-05-09T23:30:36.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7893, 1, CAST(N'2024-05-09' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 1, CAST(N'2024-05-09T23:30:27.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7894, 1, CAST(N'2024-05-09' AS Date), 6212, N'王丛', N'1-402', 350.0000, 1, CAST(N'2024-05-09T23:30:38.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7895, 1, CAST(N'2024-05-09' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7896, 1, CAST(N'2024-05-09' AS Date), 6214, N'路远', N'1-304', 350.0000, 1, CAST(N'2024-05-09T23:30:30.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7897, 1, CAST(N'2024-05-09' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7898, 1, CAST(N'2024-05-09' AS Date), 6216, N'高源', N'1-404', 240.0000, 1, CAST(N'2024-05-09T23:30:33.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7899, 1, CAST(N'2024-05-09' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7900, 1, CAST(N'2024-05-09' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7901, 1, CAST(N'2024-05-09' AS Date), 6223, N'周文', N'1-401', 350.0000, 1, CAST(N'2024-05-09T23:30:32.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7902, 1, CAST(N'2024-05-09' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7903, 1, CAST(N'2024-05-09' AS Date), 6225, N'梁成', N'1-601', 240.0000, 1, CAST(N'2024-05-09T23:30:44.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7904, 1, CAST(N'2024-05-09' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7905, 1, CAST(N'2024-05-10' AS Date), 6209, N'张昊', N'1-101', 400.0000, 3, CAST(N'2024-06-03T10:13:50.000' AS DateTime), 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7906, 1, CAST(N'2024-05-10' AS Date), 6210, N'周向', N'1-204', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7907, 1, CAST(N'2024-05-10' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7908, 1, CAST(N'2024-05-10' AS Date), 6212, N'王丛', N'1-402', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7909, 1, CAST(N'2024-05-10' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7910, 1, CAST(N'2024-05-10' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7911, 1, CAST(N'2024-05-10' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7912, 1, CAST(N'2024-05-10' AS Date), 6216, N'高源', N'1-404', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7913, 1, CAST(N'2024-05-10' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7914, 1, CAST(N'2024-05-10' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7915, 1, CAST(N'2024-05-10' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7916, 1, CAST(N'2024-05-10' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7917, 1, CAST(N'2024-05-10' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7918, 1, CAST(N'2024-05-10' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7919, 1, CAST(N'2024-05-10' AS Date), 6209, N'张昊', N'1-101', 400.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7920, 1, CAST(N'2024-05-10' AS Date), 6210, N'周向', N'1-204', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7921, 1, CAST(N'2024-05-10' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7922, 1, CAST(N'2024-05-10' AS Date), 6212, N'王丛', N'1-402', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7923, 1, CAST(N'2024-05-10' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7924, 1, CAST(N'2024-05-10' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7925, 1, CAST(N'2024-05-10' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7926, 1, CAST(N'2024-05-10' AS Date), 6216, N'高源', N'1-404', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7927, 1, CAST(N'2024-05-10' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7928, 1, CAST(N'2024-05-10' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7929, 1, CAST(N'2024-05-10' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7930, 1, CAST(N'2024-05-10' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7931, 1, CAST(N'2024-05-10' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (7932, 1, CAST(N'2024-05-10' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8890, 1, CAST(N'2024-05-10' AS Date), 6209, N'张昊', N'1-101', 400.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8891, 1, CAST(N'2024-05-10' AS Date), 6210, N'周向', N'1-204', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8892, 1, CAST(N'2024-05-10' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8893, 1, CAST(N'2024-05-10' AS Date), 6212, N'王丛', N'1-402', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8894, 1, CAST(N'2024-05-10' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8895, 1, CAST(N'2024-05-10' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8896, 1, CAST(N'2024-05-10' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8897, 1, CAST(N'2024-05-10' AS Date), 6216, N'高源', N'1-404', 240.0000, 0, NULL, 0, 0, 0)
GO
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8898, 1, CAST(N'2024-05-10' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8899, 1, CAST(N'2024-05-10' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8900, 1, CAST(N'2024-05-10' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8901, 1, CAST(N'2024-05-10' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8902, 1, CAST(N'2024-05-10' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8903, 1, CAST(N'2024-05-10' AS Date), 6226, N'高赫', N'1-602', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8904, 1, CAST(N'2024-05-10' AS Date), 6209, N'张昊', N'1-101', 400.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8905, 1, CAST(N'2024-05-10' AS Date), 6210, N'周向', N'1-204', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8906, 1, CAST(N'2024-05-10' AS Date), 6211, N'谭涛', N'1-301', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8907, 1, CAST(N'2024-05-10' AS Date), 6212, N'王丛', N'1-402', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8908, 1, CAST(N'2024-05-10' AS Date), 6213, N'张明', N'1-302', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8909, 1, CAST(N'2024-05-10' AS Date), 6214, N'路远', N'1-304', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8910, 1, CAST(N'2024-05-10' AS Date), 6215, N'高进', N'1-403', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8911, 1, CAST(N'2024-05-10' AS Date), 6216, N'高源', N'1-404', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8912, 1, CAST(N'2024-05-10' AS Date), 6220, N'周媛', N'1-501', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8913, 1, CAST(N'2024-05-10' AS Date), 6221, N'向云', N'1-503', 120.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8914, 1, CAST(N'2024-05-10' AS Date), 6223, N'周文', N'1-401', 350.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8915, 1, CAST(N'2024-05-10' AS Date), 6224, N'张华', N'1-504', 240.0000, 0, NULL, 0, 0, 0)
INSERT [dbo].[ServiceCharge] ([Id], [SypeId], [StateTime], [ResidentId], [ResidentName], [RoomNumber], [PaymentAmount], [PaidStatus], [PaymentTime], [Before], [After], [DiffValue]) VALUES (8916, 1, CAST(N'2024-05-10' AS Date), 6225, N'梁成', N'1-601', 240.0000, 0, NULL, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[ServiceCharge] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceChargeType] ON 

INSERT [dbo].[ServiceChargeType] ([Id], [Name]) VALUES (1, N'水费')
INSERT [dbo].[ServiceChargeType] ([Id], [Name]) VALUES (2, N'电费')
INSERT [dbo].[ServiceChargeType] ([Id], [Name]) VALUES (3, N'公共设施维护费')
SET IDENTITY_INSERT [dbo].[ServiceChargeType] OFF
GO
SET IDENTITY_INSERT [dbo].[ShangMenStaff] ON 

INSERT [dbo].[ShangMenStaff] ([Id], [UserName], [Posswork], [JobNumber], [Name], [Sex], [Age], [Phone], [Photo], [Department], [State], [Grade], [DingdanNumber], [ChuQianTime]) VALUES (10, N'ZZZ', N'ZZZZZ3643zzzzz', N'21300426', N'张亮', 1, 30, N'15856986325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', 2, 1, 2, N'000058141411', CAST(N'2024-06-28T13:35:14.000' AS DateTime))
INSERT [dbo].[ShangMenStaff] ([Id], [UserName], [Posswork], [JobNumber], [Name], [Sex], [Age], [Phone], [Photo], [Department], [State], [Grade], [DingdanNumber], [ChuQianTime]) VALUES (12, N'QQQ', N'QQQQQ3643qqqqq', N'21250402', N'邱文文', 0, 30, N'15698523654', N'~/upload/20140823161717_USsSX.jpg', 1, 2, 2, N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[ShangMenStaff] ([Id], [UserName], [Posswork], [JobNumber], [Name], [Sex], [Age], [Phone], [Photo], [Department], [State], [Grade], [DingdanNumber], [ChuQianTime]) VALUES (14, N'MMM', N'MMMMM3643mmmmm', N'10309583', N'毛易', 1, 55, N'12546598632', N'~/upload/veer-131734763.jpg', 4, 1, 3, N'000058141411', CAST(N'2024-06-28T13:35:12.000' AS DateTime))
INSERT [dbo].[ShangMenStaff] ([Id], [UserName], [Posswork], [JobNumber], [Name], [Sex], [Age], [Phone], [Photo], [Department], [State], [Grade], [DingdanNumber], [ChuQianTime]) VALUES (17, N'LLL', N'LLLLL3643lllll', N'30220724', N'路由器', 0, 22, N'18887698638', N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', 3, 2, 1, NULL, NULL)
INSERT [dbo].[ShangMenStaff] ([Id], [UserName], [Posswork], [JobNumber], [Name], [Sex], [Age], [Phone], [Photo], [Department], [State], [Grade], [DingdanNumber], [ChuQianTime]) VALUES (18, N'KKK', N'KKKKK3643kkkkk', N'21285987', N'张杰', 1, 28, N'15458965325', N'~/upload/20220730151443_2b7ba.thumb.1000_0.jpg', 2, 1, 1, N'000223461108', CAST(N'2024-06-03T10:11:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ShangMenStaff] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (1, N'黎明', 1, 32, N'~/upload/v2-f6d48d694bfd5e7581c43ed9b42e30af_r.jpg', N'18895678982', 4)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (2, N'章华', 1, 49, N'~/upload/veer-131734763.jpg', N'15265987563', 3)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (3, N'王福海', 1, 36, N'~/upload/v2-e8dca0a19e928a9531d3bfc3a2cab595_r.jpg', N'19256879856', 3)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (4, N'张大海', 1, 44, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'15465896535', 4)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (5, N'黄小花', 0, 31, N'~/upload/OIP-C.jpg', N'12565654525', 2)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (6, N'锤大仙', 1, 33, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'12569863254', 2)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (8, N'江离汇', 0, 33, N'~/upload/20140823161717_USsSX.jpg', N'12565456585', 3)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (9, N'张良梁', 1, 25, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'15698545236', 1)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (10, N'黄石龙', 1, 27, N'~/upload/v2-e8dca0a19e928a9531d3bfc3a2cab595_r.jpg', N'15896523545', 4)
INSERT [dbo].[Staff] ([Id], [Name], [Sex], [Age], [Photo], [Phone], [Department]) VALUES (12, N'张大海', 1, 44, N'~/upload/u=3333338384,401021464&fm=253&gp=0.jpg', N'15465896535', 3)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[VisitRecord] ON 

INSERT [dbo].[VisitRecord] ([Id], [Name], [Phone], [ResidentName], [RoomNumber], [ArrivalTime], [Leave], [DepartureTime], [Purpose]) VALUES (21, N'张良', N'15545896524', N'周文', N'1-401', CAST(N'2024-04-30T23:07:00.000' AS DateTime), 1, CAST(N'2024-05-05T15:48:09.000' AS DateTime), N'聚餐')
INSERT [dbo].[VisitRecord] ([Id], [Name], [Phone], [ResidentName], [RoomNumber], [ArrivalTime], [Leave], [DepartureTime], [Purpose]) VALUES (1024, N'张杰', N'15698523658', N'张昊', N'1-101', CAST(N'2024-05-08T13:20:26.000' AS DateTime), 0, NULL, N'吃饭')
INSERT [dbo].[VisitRecord] ([Id], [Name], [Phone], [ResidentName], [RoomNumber], [ArrivalTime], [Leave], [DepartureTime], [Purpose]) VALUES (2024, N'王鑫宇', N'15456985325', N'路远', N'1-304', CAST(N'2024-05-09T22:06:56.000' AS DateTime), 0, NULL, N'做客')
INSERT [dbo].[VisitRecord] ([Id], [Name], [Phone], [ResidentName], [RoomNumber], [ArrivalTime], [Leave], [DepartureTime], [Purpose]) VALUES (2025, N'黄天成', N'14589635987', N'王丛', N'1-402', CAST(N'2024-05-09T22:07:38.000' AS DateTime), 1, CAST(N'2024-06-03T10:12:05.000' AS DateTime), N'留宿')
SET IDENTITY_INSERT [dbo].[VisitRecord] OFF
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_Car_User] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[Resident] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_Car_User]
GO
USE [master]
GO
ALTER DATABASE [CommunityDB] SET  READ_WRITE 
GO
