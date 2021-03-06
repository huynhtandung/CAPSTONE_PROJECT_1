USE [master]
GO
/****** Object:  Database [BGrade]    Script Date: 2019-12-17 10:32:12 AM ******/
CREATE DATABASE [BGrade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BGrade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BGrade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BGrade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BGrade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BGrade] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BGrade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BGrade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BGrade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BGrade] SET ARITHABORT OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BGrade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BGrade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BGrade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BGrade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BGrade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BGrade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BGrade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BGrade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BGrade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BGrade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BGrade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BGrade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BGrade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BGrade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BGrade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BGrade] SET RECOVERY FULL 
GO
ALTER DATABASE [BGrade] SET  MULTI_USER 
GO
ALTER DATABASE [BGrade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BGrade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BGrade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BGrade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BGrade] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BGrade', N'ON'
GO
ALTER DATABASE [BGrade] SET QUERY_STORE = OFF
GO
USE [BGrade]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [BGrade]
GO
/****** Object:  Table [dbo].[AcademicAffairsDepartment]    Script Date: 2019-12-17 10:32:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcademicAffairsDepartment](
	[AAD_Username] [varchar](30) NOT NULL,
	[AAD_Password] [varchar](60) NULL,
	[AAD_Name] [nvarchar](30) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
	[IsHead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AAD_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2019-12-17 10:32:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Admin_Username] [nchar](20) NULL,
	[Admin_Password] [nchar](60) NULL,
	[Admin_WalletAddress] [nchar](100) NULL,
	[Admin_PrivateKey] [nchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Announce]    Script Date: 2019-12-17 10:32:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Announce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Session_ID] [int] NULL,
	[OutLine_ID] [int] NULL,
	[DateTime] [varchar](40) NULL,
	[Type] [varchar](10) NULL,
	[Reason] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2019-12-17 10:32:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[Class_ID] [int] IDENTITY(1,1) NOT NULL,
	[Class_Name] [nvarchar](20) NULL,
	[Class_Course] [int] NULL,
	[Class_Department] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2019-12-17 10:32:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [varchar](20) NOT NULL,
	[Course_Name] [nvarchar](50) NULL,
	[Course_Number_Of_Learning_Unit] [int] NULL,
	[Course_Dep_ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dean]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dean](
	[Dean_Username] [varchar](30) NOT NULL,
	[Dean_Password] [varchar](60) NULL,
	[Dean_Name] [nvarchar](30) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dean_Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dep_ID] [varchar](10) NOT NULL,
	[Dep_Name] [nvarchar](30) NULL,
	[Dep_Dean_Username] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dep_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JoinSession]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JoinSession](
	[JS_Session_ID] [int] NOT NULL,
	[JS_Student_ID] [varchar](15) NOT NULL,
 CONSTRAINT [pk_JoinSession] PRIMARY KEY CLUSTERED 
(
	[JS_Session_ID] ASC,
	[JS_Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[Lecturer_ID] [varchar](15) NOT NULL,
	[Lecturer_Username] [varchar](30) NULL,
	[Lecturer_Password] [varchar](60) NULL,
	[Lecturer_Name] [nvarchar](30) NULL,
	[Lecturer_Dep_ID] [varchar](10) NULL,
	[PrivateKey] [nchar](100) NULL,
	[WalletAddress] [nchar](100) NULL,
	[Lecturer_Email] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Lecturer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OutLine]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutLine](
	[OutLine_ID] [int] IDENTITY(1,1) NOT NULL,
	[OutLine_Session_ID] [int] NULL,
	[OutLine_Name] [nvarchar](30) NULL,
	[OutLine_Percent] [int] NULL,
	[OutLine_DeadLine] [date] NULL,
	[IsFinalTest] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[OutLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Lecturer_ID] [varchar](15) NULL,
	[Session_ID] [int] NULL,
	[OutLine_ID] [int] NULL,
	[Grade] [text] NULL,
	[DateTime] [varchar](50) NULL,
	[AcceptByDean] [int] NULL,
	[AcceptByPDT] [int] NULL,
	[STT] [int] NULL,
	[OldGrade] [text] NULL,
	[Reason] [text] NULL,
	[HasUpload] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Session_ID] [int] IDENTITY(1,1) NOT NULL,
	[Session_Course_ID] [varchar](20) NULL,
	[Session_Lecturer_ID] [varchar](15) NULL,
	[Session_Year] [char](10) NULL,
	[Session_Semester] [int] NULL,
	[Session_Start_Date] [date] NULL,
	[Session_End_Date] [date] NULL,
	[Session_Type] [nchar](10) NULL,
	[Session_IsUpload] [bit] NULL,
	[Session_IsSubmitFinalTest] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Student_ID] [varchar](15) NOT NULL,
	[Student_Username] [varchar](30) NULL,
	[Student_Password] [varchar](60) NULL,
	[Student_Name] [nvarchar](30) NULL,
	[Student_Email] [varchar](40) NULL,
	[Student_Dep_ID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[Class_ID] [int] NOT NULL,
	[Student_ID] [varchar](15) NOT NULL,
 CONSTRAINT [pk_studentclass] PRIMARY KEY CLUSTERED 
(
	[Class_ID] ASC,
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrHash]    Script Date: 2019-12-17 10:32:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrHash](
	[TrHash_ID] [int] IDENTITY(1,1) NOT NULL,
	[TrHash_OutLine_ID] [int] NOT NULL,
	[TrHash] [text] NULL,
	[DateTime] [text] NULL,
 CONSTRAINT [pk_hash] PRIMARY KEY CLUSTERED 
(
	[TrHash_ID] ASC,
	[TrHash_OutLine_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AcademicAffairsDepartment] ([AAD_Username], [AAD_Password], [AAD_Name], [PrivateKey], [WalletAddress], [IsHead]) VALUES (N'hoanglinhgiang', N'202cb962ac59075b964b07152d234b70', N'Hoàng Linh Giang', N'8BC5DD862E7B6702E20294E636EF0DE11B73523653E405C7F61F4587ED1E15F7                                    ', N'0x3F51Fb174e5fC0e3B75d2040Dd97EE82290f2b1c                                                          ', 0)
INSERT [dbo].[AcademicAffairsDepartment] ([AAD_Username], [AAD_Password], [AAD_Name], [PrivateKey], [WalletAddress], [IsHead]) VALUES (N'truongduytuong', N'202cb962ac59075b964b07152d234b70', N'Trương Duy Tường', N'CDA0109BCEA1BE2A19C75034C68FCF5CF1520EC234A54E3EE7FB4342AA5E182B                                    ', N'0xD147760aE246795BA4D05BF4c2c9631F06dF9A5B                                                          ', 1)
INSERT [dbo].[Admin] ([Admin_Username], [Admin_Password], [Admin_WalletAddress], [Admin_PrivateKey]) VALUES (N'admin               ', N'202cb962ac59075b964b07152d234b70                            ', N'0x8c457656323C73c91655369F920366AFf8DA0861                                                          ', N'6C3D2E442AC4D0BA3FBA3662A5BEA7FE47E941329ED89EF1940B2F4DAB3B28B9                                    ')
SET IDENTITY_INSERT [dbo].[Announce] ON 

INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (74, 15, 30, N'8:5 17/12/2019', N'2221128422', N'You have a mistake')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (75, 17, 44, N'8:19 17/12/2019', N'Lecturer', N'I have a mistake')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (76, 17, 45, N'8:22 17/12/2019', N'Lecturer', N'Mistake')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (77, 17, 48, N'8:26 17/12/2019', N'PDT', N'Mistake')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (78, 17, 44, N'8:33 17/12/2019', N'Lecturer', N'Approved by academic affairs department and Dean')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (79, 17, 44, N'8:35 17/12/2019', N'Lecturer', N'Approved by academic affairs department and Dean')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (80, 17, 48, N'8:54 17/12/2019', N'2221128422', N'Mistake')
INSERT [dbo].[Announce] ([ID], [Session_ID], [OutLine_ID], [DateTime], [Type], [Reason]) VALUES (81, 17, 44, N'10:7 17/12/2019', N'Lecturer', N'Approved by academic affairs department and Dean')
SET IDENTITY_INSERT [dbo].[Announce] OFF
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (1, N'CMUTPM1', 22, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (2, N'CMUTPM2', 22, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (3, N'CMUTPM1', 23, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (4, N'CMUTPM2', 23, N'DTQT')
INSERT [dbo].[Class] ([Class_ID], [Class_Name], [Class_Course], [Class_Department]) VALUES (5, N'CNTT1', 24, N'CNTT')
SET IDENTITY_INSERT [dbo].[Class] OFF
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-CS 445 BIS', N'System Integration Practices', 3, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-CS 447 AIS', N'CDIO', 1, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-SE 303 GIS', N'Software Testing', 3, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CMU-SE 403 AIS', N'Software Architecture & Design', 4, N'DTQT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CS 414 C', N'Winforms: VB.NET / C#.NET', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'CS 466 SA', N'Perl & Python', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'IS 301 P', N'Database', 2, N'CNTT')
INSERT [dbo].[Course] ([Course_ID], [Course_Name], [Course_Number_Of_Learning_Unit], [Course_Dep_ID]) VALUES (N'IS 384 AIS', N'ASP.NET', 3, N'CNTT')
INSERT [dbo].[Dean] ([Dean_Username], [Dean_Password], [Dean_Name], [PrivateKey], [WalletAddress]) VALUES (N'nguyenducman', N'202cb962ac59075b964b07152d234b70', N'Nguyễn Đức Mận', N'7AF6C5056A4D6101B95957DDE6499A342F4805D3FDDAFF4894DBA79DFEB6CCB1                                    ', N'0x4Cdefe5f12b8406710c7dC8ecEB9aAe3b3Cd06F6                                                          ')
INSERT [dbo].[Dean] ([Dean_Username], [Dean_Password], [Dean_Name], [PrivateKey], [WalletAddress]) VALUES (N'nguyentanthuan', N'202cb962ac59075b964b07152d234b70', N'Nguyễn Tấn Thuận', N'C6CC47F620A3724F4C15B40E9B9AD8DBC63332E4ED1D574654BC4F4EEC6901EC                                    ', N'0x6b79cC85ffDdA36687eB6055b4876006bF7aF1d8                                                          ')
INSERT [dbo].[Department] ([Dep_ID], [Dep_Name], [Dep_Dean_Username]) VALUES (N'CNTT', N'Information Technology', N'nguyentanthuan')
INSERT [dbo].[Department] ([Dep_ID], [Dep_Name], [Dep_Dean_Username]) VALUES (N'DTQT', N'International School', N'nguyenducman')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (14, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (15, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (16, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (17, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (18, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (19, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (20, N'2221128426')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128422')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128423')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128424')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128425')
INSERT [dbo].[JoinSession] ([JS_Session_ID], [JS_Student_ID]) VALUES (21, N'2221128426')
INSERT [dbo].[Lecturer] ([Lecturer_ID], [Lecturer_Username], [Lecturer_Password], [Lecturer_Name], [Lecturer_Dep_ID], [PrivateKey], [WalletAddress], [Lecturer_Email]) VALUES (N'001', N'huynhbadieu', N'202cb962ac59075b964b07152d234b70', N'Huỳnh Bá Diệu', N'DTQT', N'2052277B5DFD8481FBFCA90DA1982C8E81E14670721767EE736BAF41351B8BDD                                    ', N'0xB4E2c4a0b461Fdf68D7FC72889eb77f7dFA13966                                                          ', N'          ')
INSERT [dbo].[Lecturer] ([Lecturer_ID], [Lecturer_Username], [Lecturer_Password], [Lecturer_Name], [Lecturer_Dep_ID], [PrivateKey], [WalletAddress], [Lecturer_Email]) VALUES (N'002', N'phanlong', N'202cb962ac59075b964b07152d234b70', N'Phan Long', N'CNTT', N'412640439814E855409E73F212E6E6723D1635B2858B96C506B5C10BAFC27716                                    ', N'0x35413cE9FE4a064286C8778C1533E9CacFe3828A                                                          ', NULL)
SET IDENTITY_INSERT [dbo].[OutLine] ON 

INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (25, 14, N'Conceive', 25, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (26, 14, N'Skill/Method', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (27, 14, N'Design', 25, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (28, 14, N'Implement', 35, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (29, 14, N'Operate', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (30, 15, N'Quizzes', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (31, 15, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (32, 15, N'Homework', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (33, 15, N'Labs', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (34, 15, N'Midterm Exam', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (35, 15, N'Final Exam', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (36, 16, N'Quiz 1', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (37, 16, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (38, 16, N'Homework 1 ', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (39, 16, N'Midterm Exam', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (40, 16, N'Quiz 2', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (41, 16, N'Homework 2', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (42, 16, N'Quiz 3', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (43, 16, N'Final Exam', 25, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (44, 17, N'Quiz', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (45, 17, N'Homework', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (46, 17, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (47, 17, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (48, 17, N'Final Exam ', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (49, 18, N'Attendance', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (50, 18, N'Group Project', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (51, 18, N'Speech & Discussion', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (52, 18, N'Mid Term', 30, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (53, 18, N'Final Exam', 45, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (54, 19, N'Attendance', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (55, 19, N'Dicussion', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (56, 19, N'Homework', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (57, 19, N'Personal Project', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (58, 19, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (59, 19, N'Final Exam', 35, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (60, 20, N'Attendance', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (61, 20, N'Homework', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (62, 20, N'Group Project', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (63, 20, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (64, 20, N'Final Exam', 45, NULL, 1)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (65, 21, N'Attendance', 5, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (66, 21, N'Dicussion', 10, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (67, 21, N'Group Project', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (68, 21, N'Practices', 15, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (69, 21, N'Mid Term', 20, NULL, 0)
INSERT [dbo].[OutLine] ([OutLine_ID], [OutLine_Session_ID], [OutLine_Name], [OutLine_Percent], [OutLine_DeadLine], [IsFinalTest]) VALUES (70, 21, N'Final Exam', 35, NULL, 1)
SET IDENTITY_INSERT [dbo].[OutLine] OFF
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([ID], [Lecturer_ID], [Session_ID], [OutLine_ID], [Grade], [DateTime], [AcceptByDean], [AcceptByPDT], [STT], [OldGrade], [Reason], [HasUpload]) VALUES (55, N'001', 17, 44, N'5-5-5-5-5', N'8:30 17/12/2019', 1, 1, 0, N'10-10-10-10-10', N'Mistake', 1)
INSERT [dbo].[Request] ([ID], [Lecturer_ID], [Session_ID], [OutLine_ID], [Grade], [DateTime], [AcceptByDean], [AcceptByPDT], [STT], [OldGrade], [Reason], [HasUpload]) VALUES (56, N'001', 17, 45, N'10-10-10-10-10', N'8:41 17/12/2019', 1, -1, 1, N'8-9-9-8-9', N'Mistake', -1)
INSERT [dbo].[Request] ([ID], [Lecturer_ID], [Session_ID], [OutLine_ID], [Grade], [DateTime], [AcceptByDean], [AcceptByPDT], [STT], [OldGrade], [Reason], [HasUpload]) VALUES (57, N'001', 17, 44, N'10-10-10-10-10', N'10:5 17/12/2019', 1, 1, 0, N'5-5-5-5-5', N'Mistake', 1)
INSERT [dbo].[Request] ([ID], [Lecturer_ID], [Session_ID], [OutLine_ID], [Grade], [DateTime], [AcceptByDean], [AcceptByPDT], [STT], [OldGrade], [Reason], [HasUpload]) VALUES (58, N'001', 17, 46, N'10-10-10-10-10', N'10:14 17/12/2019', 1, -1, 2, N'7-9-8-5-10', N'Mistake', -1)
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[Session] ON 

INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (14, N'CMU-CS 447 AIS', N'001', N'2018-2019 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (15, N'CMU-SE 403 AIS', N'001', N'2018-2019 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 1, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (16, N'CMU-SE 303 GIS', N'001', N'2019-2020 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (17, N'CMU-CS 445 BIS', N'001', N'2019-2020 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 1, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (18, N'CS 466 SA', N'002', N'2018-2019 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (19, N'IS 301 P', N'002', N'2018-2019 ', 2, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (20, N'CS 414 C', N'002', N'2019-2020 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
INSERT [dbo].[Session] ([Session_ID], [Session_Course_ID], [Session_Lecturer_ID], [Session_Year], [Session_Semester], [Session_Start_Date], [Session_End_Date], [Session_Type], [Session_IsUpload], [Session_IsSubmitFinalTest]) VALUES (21, N'IS 384 AIS', N'002', N'2019-2020 ', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'LEC       ', 0, 0)
SET IDENTITY_INSERT [dbo].[Session] OFF
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128422', N'huynhtandung', N'202cb962ac59075b964b07152d234b70', N'Huỳnh Tấn Dũng', N'dunghuynh.010598@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128423', N'leminhhoang', N'202cb962ac59075b964b07152d234b70', N'Lê Minh Hoàng', N'lehoang97minh@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128424', N'hoangkimquy', N'202cb962ac59075b964b07152d234b70', N'Hoàng Kim Quý', N'quykimhoang@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128425', N'maivanthanh', N'202cb962ac59075b964b07152d234b70', N'Mai Văn Thạnh', N'thanhmai@gmail.com', N'DTQT')
INSERT [dbo].[Student] ([Student_ID], [Student_Username], [Student_Password], [Student_Name], [Student_Email], [Student_Dep_ID]) VALUES (N'2221128426', N'nguyenthanhsang', N'202cb962ac59075b964b07152d234b70', N'Nguyễn Thành Sang', N'sangnguyen@gmail.com', N'CNTT')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (1, N'2221128422')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (2, N'2221128423')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (3, N'2221128424')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (4, N'2221128425')
INSERT [dbo].[StudentClass] ([Class_ID], [Student_ID]) VALUES (5, N'2221128426')
SET IDENTITY_INSERT [dbo].[TrHash] ON 

INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (160, 30, N'0x16b389b3bc56da5d9ebd077b086b12501d0afe75095670ae9265862c186d166f', N'7:55 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (161, 31, N'0xc83eb54e5b802117252fa5b1bb007db9ba6dca7ee6d9ce349a39de3acf44d710', N'7:59 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (162, 44, N'0xfb7ca0a42c729063812105b447c2719729044d7d3f5f9f9207c0b1b49123b76f', N'8:10 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (163, 45, N'0x6b86415ed564d2cb7194a83873dd72911986c08f8caa892156ea5b0a3dae69d8', N'8:10 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (164, 46, N'0x70b7fe3d3756b34ad706013d38ee0bf5d9756c7856986165b89bc44090c7b658', N'8:11 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (165, 47, N'0x3d342d407f73e13e13a3f4fead5e702924fd29439627be353125207c613dd93a', N'8:11 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (166, 32, N'0x12540d1a9770918caca64bfd3846a875dfc1415a13166517cd46827dd31f3168', N'8:14 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (167, 33, N'0x1d1c1636db7bee7ffec7dbe86f2349e1bc8029eacbbf760f72e495666183da1b', N'8:16 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (168, 44, N'0xe10f3cb6dcfab14261a28bca329452fb6b55504d150b1c3852ac6c6b5e293bd9', N'8:19 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (169, 45, N'0xea1c69d7cb1377ffdb5e20e69d73d584e8e22bd72b00389f1217af50af033e2f', N'8:23 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (170, 48, N'0x4c9cd5e0b512adf42d0e87417647203f82384fdcec4c8a32d5944588345d8d4c', N'8:25 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (171, 48, N'0xd0d9b78692fa3c355275cbf25a9f900a212fe4711f01d35e266d9140faf53874', N'8:26 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (172, 44, N'0xf8a9578587bdc733bbdf8becc26415269ddfeb2ea78833fd028a90348c7b02c6', N'8:36 17/12/2019')
INSERT [dbo].[TrHash] ([TrHash_ID], [TrHash_OutLine_ID], [TrHash], [DateTime]) VALUES (173, 44, N'0x33c9b27358915b0c4874d2a95152770cb81fde8f2d2f67ca360904b1c1226deb', N'10:9 17/12/2019')
SET IDENTITY_INSERT [dbo].[TrHash] OFF
ALTER TABLE [dbo].[Announce]  WITH CHECK ADD FOREIGN KEY([OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
ALTER TABLE [dbo].[Announce]  WITH CHECK ADD FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([Course_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD FOREIGN KEY([Dep_Dean_Username])
REFERENCES [dbo].[Dean] ([Dean_Username])
GO
ALTER TABLE [dbo].[JoinSession]  WITH CHECK ADD FOREIGN KEY([JS_Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[JoinSession]  WITH CHECK ADD FOREIGN KEY([JS_Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD FOREIGN KEY([Lecturer_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[OutLine]  WITH CHECK ADD FOREIGN KEY([OutLine_Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Lecturer_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([Session_ID])
REFERENCES [dbo].[Session] ([Session_ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([Session_Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD FOREIGN KEY([Session_Lecturer_ID])
REFERENCES [dbo].[Lecturer] ([Lecturer_ID])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([Student_Dep_ID])
REFERENCES [dbo].[Department] ([Dep_ID])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD FOREIGN KEY([Class_ID])
REFERENCES [dbo].[Class] ([Class_ID])
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([Student_ID])
GO
ALTER TABLE [dbo].[TrHash]  WITH CHECK ADD FOREIGN KEY([TrHash_OutLine_ID])
REFERENCES [dbo].[OutLine] ([OutLine_ID])
GO
USE [master]
GO
ALTER DATABASE [BGrade] SET  READ_WRITE 
GO
