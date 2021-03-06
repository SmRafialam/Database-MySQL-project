USE [master]
GO
/****** Object:  Database [CarDB]    Script Date: 2019-07-29 4:28:56 PM ******/
CREATE DATABASE [CarDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CarDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CarDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarDB] SET QUERY_STORE = OFF
GO
USE [CarDB]
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
USE [CarDB]
GO
/****** Object:  Table [dbo].[Body]    Script Date: 2019-07-29 4:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Body](
	[bodyType] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bodyType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 2019-07-29 4:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandName] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brandName] ASC,
	[region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2019-07-29 4:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerName] [varchar](30) NULL,
	[customerNumber] [int] NULL,
	[carWarrenty] [int] NULL,
	[receiptID] [int] NULL,
	[totalServices] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exporter]    Script Date: 2019-07-29 4:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exporter](
	[brandName] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[carName] [varchar](50) NOT NULL,
	[vin] [int] NOT NULL,
	[carMilage] [int] NULL,
	[carStrickerPrice] [float] NULL,
	[carCondition] [varchar](50) NULL,
	[transactionID] [int] NULL,
	[exporterName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[brandName] ASC,
	[region] ASC,
	[carName] ASC,
	[vin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 2019-07-29 4:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[brandName] [varchar](50) NULL,
	[region] [varchar](50) NULL,
	[carName] [varchar](50) NULL,
	[vin] [int] NULL,
	[price] [int] NULL,
	[receiptID] [int] NOT NULL,
	[saleDate] [varchar](50) NULL,
	[deliveryDate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[receiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicleRecord]    Script Date: 2019-07-29 4:28:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicleRecord](
	[brandName] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[carName] [varchar](50) NOT NULL,
	[vin] [int] NOT NULL,
	[bodyType] [varchar](50) NULL,
	[yearr] [int] NULL,
	[engineCapacity] [float] NULL,
	[pessengerCapacity] [int] NULL,
	[carType] [varchar](50) NULL,
	[available] [varchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[brandName] ASC,
	[region] ASC,
	[carName] ASC,
	[vin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Compact')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Convertible')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Coupe')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Full Size')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Grand Tourer')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Hatchback')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Large Wheel base')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Mid Size')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Minivan')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Pickup Truck')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Roadster')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Sedan')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Station Wagon')
INSERT [dbo].[Body] ([bodyType]) VALUES (N'Suv')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Audi', N'Germany')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Bmw', N'Germany')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Ferrari', N'Italy')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Lamborghini', N'Italy')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Mercedes ', N'Germany')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Mitshubishi', N'Japan')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Nissan ', N'Japan')
INSERT [dbo].[Brand] ([brandName], [region]) VALUES (N'Toyota', N'Japan')
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'John', 1711457561, 2, 21534042, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Smith', 1711457564, 2, 12295975, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Raisa', 1711457534, 2, 46252703, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Samiul', 1711457234, 2, 38977387, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Shormi', 1717309265, 2, 23235645, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Naimul', 1917309265, 2, 44736997, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Samiul', 1917309265, 2, 27729859, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Kawser', 1917309265, 2, 11595509, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Kaiser', 1917309265, 2, 18431450, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Rakib', 1723457560, 2, 32110492, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Supty', 1711423560, 2, 45617652, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Mamun', 1872347560, 2, 24640690, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Fahim', 1982357560, 2, 45078843, 0)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Tayeba', 1867457560, 2, 28301838, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Ruhee', 1802457560, 2, 18588609, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Sadia', 1635457560, 2, 38800007, 2)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Shormi', 1533457560, 2, 20390778, 4)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Saima', 1634357560, 2, 22794473, 5)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Durjoy', 1911457560, 2, 14591882, 2)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Alim', 1897457560, 2, 40372626, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Nahid', 1823457560, 2, 13037457, 5)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Sushmoy', 1735457560, 2, 39431093, 2)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Nihad', 1926457560, 2, 15794514, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Tonmoy', 1790457560, 2, 10332714, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Rebbeca', 1901457560, 2, 49293978, 1)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Rimon', 1651457560, 2, 41944433, 5)
INSERT [dbo].[Customer] ([customerName], [customerNumber], [carWarrenty], [receiptID], [totalServices]) VALUES (N'Towhid', 1922457560, 2, 19034720, 6)
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'A3', 69295, 2619, 7142055, N'Average', 16954, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'A5', 1625, 6608, 9922688, N'Average', 10716, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'A7', 33128, 7250, 8200793, N'Average', 21015, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'A8', 74409, 6065, 8883701, N'Good', 18398, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'Q3', 85935, 5777, 8855415, N'Average', 20422, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'Q5', 51732, 6726, 5519459, N'Average', 39200, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'Q7', 35096, 6487, 8675017, N'Average', 13893, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'Q8', 23587, 7392, 2490872, N'Average', 49941, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Audi', N'Germany', N'R8', 3284, 7647, 1628886, N'Average', 22219, N'"Audi Belgium,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'350 Li', 38839, 5934, 8938066, N'Good', 48990, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'550 Li', 83324, 7252, 1593982, N'Good', 37655, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'740 Li', 64794, 2876, 4610427, N'Good', 42123, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'750 Li', 83719, 3022, 1041966, N'Good', 25547, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'F10 M5', 13532, 1025, 3689689, N'Good', 48459, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'F12 M6', 80451, 7744, 6584954, N'Good', 44960, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'F16 X6', 23368, 7398, 9821753, N'Good', 36187, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'F25 X3', 46606, 3104, 5928131, N'Good', 11427, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'F48 X1', 18631, 5069, 6003840, N'Good', 49493, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M2 Competition', 83064, 1226, 1503387, N'Good', 15007, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M3', 24651, 7743, 1924815, N'Good', 10945, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M5', 6715, 7412, 2945611, N'Good', 36339, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M5 Competition', 34721, 3623, 1119530, N'Good', 35908, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M7 Competition', 6744, 5831, 8284661, N'Good', 16034, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'M8 Competition', 44201, 7873, 9133535, N'Good', 17347, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'X3', 69511, 4697, 1511197, N'Good', 25607, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'X5', 13944, 7553, 4818801, N'Good', 14243, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Bmw', N'Germany', N'X7', 8634, 2943, 2590380, N'Good', 35707, N'"BMW Ansbach,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Ferrari', N'Italy', N'F40 ', 60100, 7598, 2478284, N'Average', 17197, N'"Ferrari Milano, Italy"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Ferrari', N'Italy', N'LeFerrari', 69410, 3719, 9336077, N'Average', 37510, N'"Ferrari Milano, Italy"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Lamborghini ', N'Italy', N'Aventedor', 73988, 7674, 6388010, N'Average', 23478, N'"Lamborghini Milano ,Italy"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Lamborghini', N'Italy', N'Hurracan', 36173, 7420, 4879314, N'Average', 17797, N'"Lamborghini Milano ,Italy"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'AMG C63', 59982, 6496, 4983364, N'Good', 45130, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'AMG E46', 63393, 7730, 6335282, N'Good', 40811, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'CLK 200', 94699, 6909, 6042734, N'Good', 38514, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'E250', 70152, 5657, 2131901, N'Good', 29370, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'E450', 76915, 6110, 3078721, N'Good', 37196, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'Maybach', 79581, 3447, 9882342, N'Good', 38656, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'Maybach S600', 55516, 5014, 5167083, N'Good', 30527, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'S300', 32161, 2844, 5300674, N'Good', 10131, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mercedes ', N'Germany', N'S500', 89380, 5583, 4556736, N'Good', 27162, N'"Mercedes Neckarsulm,Germany"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'Evo8', 17454, 7341, 9472296, N'Average', 45974, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'Evo9', 52856, 2633, 2598084, N'Average', 40860, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'EvoX', 99627, 2468, 6439947, N'Average', 25236, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'Galant', 11027, 2657, 7191325, N'Average', 48626, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'Lancer', 91374, 4746, 6556921, N'Average', 21666, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Mitsubishi', N'Japan', N'Pajero', 53777, 3142, 4254757, N'Average', 23071, N'"Mitsubishi Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Nissan', N'Japan', N'GTR R35', 51376, 3798, 4706229, N'Average', 43352, N'"Nissan Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Nissan', N'Japan', N'NSX', 1313, 5522, 2560917, N'Average', 46758, N'"Nissan Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Nissan', N'Japan', N'Sunny', 34584, 1735, 9187517, N'Average', 49719, N'"Nissan Osaka, Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Allion', 13009, 3561, 7763768, N'Average', 17322, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Aqua', 35240, 2585, 8747891, N'Average', 22516, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Auris', 79986, 3358, 9148287, N'Average', 46154, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Axio', 19151, 1196, 3669122, N'Average', 21915, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Corolla', 47839, 5505, 2563946, N'Average', 38295, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Fielder', 18403, 6103, 9505964, N'Average', 34400, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Hilux', 77034, 4410, 2384566, N'Average', 11616, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Land Cruiser', 91221, 4243, 9689734, N'Average', 43758, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Prado', 33595, 7529, 8844020, N'Average', 10746, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Premio', 33447, 2405, 4299482, N'Average', 17398, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Exporter] ([brandName], [region], [carName], [vin], [carMilage], [carStrickerPrice], [carCondition], [transactionID], [exporterName]) VALUES (N'Toyota', N'Japan', N'Rush', 51979, 6284, 3748605, N'Average', 18933, N'"Toyota Tokyo,Japan"')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mitsubishi', N'Japan', N'Evo8', 17454, 9572296, 10332714, N'27.06.2019', N'29.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mercedes ', N'Germany', N'E250', 70152, 2331901, 11595509, N'22.06.2019', N'24.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Bmw', N'Germany', N'F25 X3', 46606, 6228131, 12295975, N'21.06.2019', N'23.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Prado', 33595, 8944020, 13037457, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Aqua', 35240, 8947891, 14591882, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mitsubishi', N'Japan', N'Pajero', 53777, 4454757, 15794514, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mercedes ', N'Germany', N'E450', 76915, 3278721, 18431450, N'22.06.2019', N'24.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Premio', 33447, 4399482, 18588609, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Ferrari', N'Italy', N'F40 ', 60100, 24678284, 19034720, N'27.06.2019', N'29.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Axio', 19151, 3869122, 20390778, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Bmw', N'Germany', N'550 Li', 83324, 1693982, 21534042, N'21.06.2019', N'23.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Auris', 79986, 9348287, 22794473, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Bmw', N'Germany', N'F48 X1', 18631, 6203840, 23235645, N'22.06.2019', N'24.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Audi', N'Germany', N'Q5', 51732, 5719459, 24640690, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mercedes ', N'Germany', N'CLK 200', 94699, 6242734, 27729859, N'22.06.2019', N'24.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Allion', 13009, 7863768, 28301838, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Audi', N'Germany', N'A5', 1625, 10022688, 32110492, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Corolla', 47839, 2763946, 38800007, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Bmw', N'Germany', N'F16 X6', 23368, 9921753, 38977387, N'21.06.2019', N'23.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Land Cruiser', 91221, 9889734, 39431093, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Toyota', N'Japan', N'Fielder', 18403, 9705964, 40372626, N'26.06.2019', N'28.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Lamborghini ', N'Italy', N'Aventedor', 73988, 6588010, 41944433, N'27.06.2019', N'29.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Mercedes ', N'Germany', N'AMG C63', 59982, 5183364, 44736997, N'22.06.2019', N'24.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Audi', N'Germany', N'Q3', 85935, 8955415, 45078843, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Audi', N'Germany', N'A3', 69295, 7242055, 45617652, N'23.06.2019', N'25.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Bmw', N'Germany', N'F12 M6', 80451, 6784954, 46252703, N'21.06.2019', N'23.06.2019')
INSERT [dbo].[Sale] ([brandName], [region], [carName], [vin], [price], [receiptID], [saleDate], [deliveryDate]) VALUES (N'Nissan', N'Japan', N'Sunny', 34584, 9387517, 49293978, N'27.06.2019', N'29.06.2019')
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'A3', 69295, N'Coupe', 2018, 3.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'A5', 1625, N'Coupe', 2018, 4.5, 4, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'A7', 33128, N'Coupe', 2018, 6.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'A8', 74409, N'Coupe', 2018, 6.5, 2, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'Q3', 85935, N'Suv', 2019, 4.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'Q5', 51732, N'Suv', 2019, 4.5, 6, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'Q7', 35096, N'Suv', 2018, 4.5, 6, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'Q8', 23587, N'Suv', 2018, 4.5, 4, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Audi', N'Germany', N'R8', 3284, N'Coupe', 2019, 6.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'350 Li', 38839, N'Coupe', 2018, 2.5, 2, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'550 Li', 83324, N'Coupe', 2018, 5.5, 4, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'740 Li', 64794, N'Coupe', 2018, 6.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'750 Li', 83719, N'Coupe', 2019, 6.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'F10 M5', 13532, N'Sedan', 2017, 5.5, 4, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'F12 M6', 80451, N'Convertible', 2017, 5.5, 4, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'F16 X6', 23368, N'Suv', 2017, 5.5, 6, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'F25 X3', 46606, N'Suv', 2016, 2.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'F48 X1', 18631, N'Suv', 2017, 2.5, 4, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M2 Competition', 83064, N'Coupe', 2017, 2.5, 2, N'Sports', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M3', 24651, N'Coupe', 2018, 2.5, 3, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M5', 6715, N'Coupe', 2018, 5.5, 4, N'Sports', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M5 Competition', 34721, N'Sedan', 2017, 5.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M7 Competition', 6744, N'Coupe', 2018, 5.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'M8 Competition', 44201, N'Coupe', 2017, 5.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'X3', 69511, N'Suv', 2017, 2.5, 4, N'Regular', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'X5', 13944, N'Suv', 2018, 5.5, 6, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Bmw', N'Germany', N'X7', 8634, N'Suv', 2019, 5.5, 6, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Ferrari', N'Italy', N'F40 ', 60100, N'Roadster', 2018, 7.5, 2, N'Sports', N'No', 0)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Ferrari', N'Italy', N'LeFerrari', 69410, N'Roadster', 2018, 7.5, 2, N'Sports', N'No', 0)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Lamborghini ', N'Italy', N'Aventedor', 73988, N'Roadster', 2018, 6.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Lamborghini', N'Italy', N'Hurracan', 36173, N'Roadster', 2018, 6.5, 2, N'Sports', N'No', 0)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'AMG C63', 59982, N'Suv', 2019, 3.5, 4, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'AMG E46', 63393, N'Coupe', 2019, 2.7, 4, N'Regular', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'CLK 200', 94699, N'Coupe', 2015, 4.5, 2, N'Sports', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'E250', 70152, N'Sedan', 2017, 2.5, 4, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'E450', 76915, N'Sedan', 2017, 3.5, 4, N'Regular', N'No', 0)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'Maybach', 79581, N'Large Wheel base', 2018, 7.5, 4, N'Luxary', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'Maybach S600', 55516, N'Large Wheel base', 2018, 7.5, 5, N'Luxary', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'S300', 32161, N'Large Wheel base', 2017, 3.5, 4, N'Luxary', N'No', 0)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mercedes ', N'Germany', N'S500', 89380, N'Large Wheel base', 2017, 5.5, 4, N'Luxary', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'Evo8', 17454, N'Sedan', 2013, 1.8, 4, N'Rally', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'Evo9', 52856, N'Sedan', 2014, 1.8, 4, N'Rally', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'EvoX', 99627, N'Sedan', 2016, 1.8, 4, N'Rally', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'Galant', 11027, N'Sedan', 2013, 1.8, 4, N'Regular', N'Yes', 5)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'Lancer', 91374, N'Sedan', 2017, 1.8, 4, N'Regular', N'Yes', 5)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Mitsubishi', N'Japan', N'Pajero', 53777, N'Suv', 2012, 3.5, 6, N'Regular', N'Yes', 4)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Nissan', N'Japan', N'GTR R35', 51376, N'Coupe', 2016, 3.5, 4, N'Sports', N'Yes', 2)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Nissan', N'Japan', N'NSX', 1313, N'Coupe', 2017, 2.5, 2, N'Sports', N'Yes', 1)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Nissan', N'Japan', N'Sunny', 34584, N'Sedan', 2008, 1.5, 4, N'Regular', N'Yes', 4)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Allion', 13009, N'Sedan', 2017, 1.5, 4, N'Regular', N'Yes', 7)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Aqua', 35240, N'Compact', 2017, 1.3, 4, N'Hybrid', N'Yes', 6)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Auris', 79986, N'Hatchback', 2017, 1.8, 4, N'Hybrid', N'Yes', 5)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Axio', 19151, N'Sedan', 2017, 1.5, 4, N'Hybrid', N'Yes', 7)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Corolla', 47839, N'Sedan', 2017, 1.5, 4, N'Regular', N'Yes', 8)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Fielder', 18403, N'Sedan', 2017, 1.5, 4, N'Regular', N'Yes', 4)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Hilux', 77034, N'Suv', 2017, 3.5, 6, N'Regular', N'Yes', 6)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Land Cruiser', 91221, N'Suv', 2017, 4.5, 8, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Prado', 33595, N'Suv', 2017, 3.5, 6, N'Regular', N'Yes', 3)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Premio', 33447, N'Sedan', 2017, 1.5, 4, N'Regular', N'Yes', 8)
INSERT [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin], [bodyType], [yearr], [engineCapacity], [pessengerCapacity], [carType], [available], [quantity]) VALUES (N'Toyota', N'Japan', N'Rush', 51979, N'Mid Size', 2017, 2.3, 4, N'Regular', N'Yes', 4)
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([receiptID])
REFERENCES [dbo].[Sale] ([receiptID])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([brandName], [region], [carName], [vin])
REFERENCES [dbo].[vehicleRecord] ([brandName], [region], [carName], [vin])
GO
ALTER TABLE [dbo].[vehicleRecord]  WITH CHECK ADD FOREIGN KEY([bodyType])
REFERENCES [dbo].[Body] ([bodyType])
GO
ALTER TABLE [dbo].[vehicleRecord]  WITH CHECK ADD FOREIGN KEY([brandName], [region], [carName], [vin])
REFERENCES [dbo].[Exporter] ([brandName], [region], [carName], [vin])
GO
USE [master]
GO
ALTER DATABASE [CarDB] SET  READ_WRITE 
GO
