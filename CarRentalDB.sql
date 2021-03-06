USE [master]
GO
/****** Object:  Database [CarRentalDB]    Script Date: 3/6/2021 9:58:50 PM ******/
CREATE DATABASE [CarRentalDB]
 CONTAINMENT = NONE
ALTER DATABASE [CarRentalDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarRentalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarRentalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarRentalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarRentalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarRentalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarRentalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarRentalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarRentalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarRentalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarRentalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarRentalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarRentalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarRentalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarRentalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarRentalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarRentalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarRentalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarRentalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarRentalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarRentalDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarRentalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarRentalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarRentalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarRentalDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarRentalDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarRentalDB]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Car](
	[CarModelID] [int] NOT NULL,
	[LicensePlates] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Car_1] PRIMARY KEY CLUSTERED 
(
	[LicensePlates] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarFeature]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarFeature](
	[CarModelID] [int] NOT NULL,
	[FeatureID] [int] NOT NULL,
 CONSTRAINT [PK_CarFeature] PRIMARY KEY CLUSTERED 
(
	[CarModelID] ASC,
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CarModel]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarModel](
	[CarModelID] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](255) NOT NULL,
	[SmallImage] [nvarchar](max) NULL,
	[BigImage] [nvarchar](max) NULL,
	[Color] [nvarchar](50) NULL,
	[Seat] [int] NULL,
	[Fuel] [nvarchar](50) NULL,
	[TypeID] [int] NULL,
	[Quantity] [int] NOT NULL,
	[Year] [int] NULL,
	[Price] [money] NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[UserID] [nvarchar](255) NOT NULL,
	[CarModelID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[UserRentalDate] [nvarchar](255) NOT NULL,
	[UserRentalTime] [int] NOT NULL,
	[UserReturnDate] [nvarchar](255) NOT NULL,
	[UserReturnTime] [int] NOT NULL,
	[RentDays] [int] NOT NULL,
	[UserPrice] [money] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CarModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Discount](
	[Code] [varchar](50) NOT NULL,
	[Percent] [int] NOT NULL,
	[ApplyDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[OrderID] [varchar](15) NOT NULL,
	[CarModelID] [int] NOT NULL,
	[NameOfUser] [nvarchar](255) NULL,
	[Rating] [int] NULL,
	[Feedback] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Feedback_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CarModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](15) NOT NULL,
	[UserID] [nvarchar](255) NOT NULL,
	[RentalDate] [datetime] NOT NULL,
	[DiscountCode] [varchar](50) NULL,
	[TotalPrice] [money] NOT NULL,
	[IsActivate] [bit] NULL,
 CONSTRAINT [PK_Renting] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderCarDetail]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderCarDetail](
	[OrderID] [varchar](15) NOT NULL,
	[CarModelID] [int] NOT NULL,
	[LicensePlates] [varchar](20) NOT NULL,
 CONSTRAINT [PK_RentingCarDetail_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CarModelID] ASC,
	[LicensePlates] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderID] [varchar](15) NOT NULL,
	[CarModelID] [int] NOT NULL,
	[CarName] [nvarchar](255) NULL,
	[Image] [nvarchar](max) NULL,
	[Amount] [int] NOT NULL,
	[SubTotal] [money] NOT NULL,
	[PickUpDate] [datetime] NOT NULL,
	[DropOffDate] [datetime] NOT NULL,
	[Days] [int] NOT NULL,
	[IsRenting] [bit] NULL,
 CONSTRAINT [PK_RentingDetail_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[CarModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](255) NOT NULL,
	[Seat] [int] NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 3/6/2021 9:58:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](255) NOT NULL,
	[Password] [char](44) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Phone] [varchar](15) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Code] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CarModel] ADD  CONSTRAINT [DF_CarModel_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Car]  WITH CHECK ADD  CONSTRAINT [FK_CarDetail_Car] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([CarModelID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Car] CHECK CONSTRAINT [FK_CarDetail_Car]
GO
ALTER TABLE [dbo].[CarFeature]  WITH CHECK ADD  CONSTRAINT [FK_CarFeature_Car] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([CarModelID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarFeature] CHECK CONSTRAINT [FK_CarFeature_Car]
GO
ALTER TABLE [dbo].[CarFeature]  WITH CHECK ADD  CONSTRAINT [FK_CarFeature_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CarFeature] CHECK CONSTRAINT [FK_CarFeature_Feature]
GO
ALTER TABLE [dbo].[CarModel]  WITH CHECK ADD  CONSTRAINT [FK_Car_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([TypeID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[CarModel] CHECK CONSTRAINT [FK_Car_Type]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Car] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([CarModelID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Car]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_OrderDetail] FOREIGN KEY([OrderID], [CarModelID])
REFERENCES [dbo].[OrderDetail] ([OrderID], [CarModelID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_OrderDetail]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Renting_Discount] FOREIGN KEY([DiscountCode])
REFERENCES [dbo].[Discount] ([Code])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Renting_Discount]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Renting_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Renting_User]
GO
ALTER TABLE [dbo].[OrderCarDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderCarDetail_Car] FOREIGN KEY([LicensePlates])
REFERENCES [dbo].[Car] ([LicensePlates])
GO
ALTER TABLE [dbo].[OrderCarDetail] CHECK CONSTRAINT [FK_OrderCarDetail_Car]
GO
ALTER TABLE [dbo].[OrderCarDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentingCarDetail_RentingDetail] FOREIGN KEY([OrderID], [CarModelID])
REFERENCES [dbo].[OrderDetail] ([OrderID], [CarModelID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderCarDetail] CHECK CONSTRAINT [FK_RentingCarDetail_RentingDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_CarModel] FOREIGN KEY([CarModelID])
REFERENCES [dbo].[CarModel] ([CarModelID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_CarModel]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_RentingDetail_Renting] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_RentingDetail_Renting]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [ApplyDate_ExpiryDate] CHECK  (([ApplyDate]<=[ExpiryDate]))
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [ApplyDate_ExpiryDate]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [PickUpDate] CHECK  (([PickUpDate]<=[DropOffDate]))
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [PickUpDate]
GO
USE [master]
GO
ALTER DATABASE [CarRentalDB] SET  READ_WRITE 
GO
