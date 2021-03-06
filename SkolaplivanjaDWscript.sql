USE [master]
GO
/****** Object:  Database [SkolaPlivanjaBI_DW_final]    Script Date: 24.01.2019. 16:18:53 ******/
CREATE DATABASE [SkolaPlivanjaBI_DW_final]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkolaPlivanjaDW_2', FILENAME = N'D:\DB\SkolaPlivanjaBI_DW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkolaPlivanjaDW_2_log', FILENAME = N'D:\DB\SkolaPlivanjaBI_DW_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkolaPlivanjaBI_DW_final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET  MULTI_USER 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SkolaPlivanjaBI_DW_final]
GO
/****** Object:  Table [dbo].[DimLokacija]    Script Date: 24.01.2019. 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLokacija](
	[LokacijaKey] [int] NOT NULL,
	[LokacijaAltKey] [int] NOT NULL,
	[Grad] [nvarchar](50) NULL,
	[Regija] [nvarchar](50) NULL,
	[Drzava] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lokacija] PRIMARY KEY CLUSTERED 
(
	[LokacijaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimPlivac]    Script Date: 24.01.2019. 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPlivac](
	[PlivacKey] [int] NOT NULL,
	[ImePrezime] [nvarchar](40) NULL,
 CONSTRAINT [PK_Plivac] PRIMARY KEY CLUSTERED 
(
	[PlivacKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimTrener]    Script Date: 24.01.2019. 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTrener](
	[TrenerKey] [int] NOT NULL,
	[ImePrezime] [nvarchar](40) NULL,
 CONSTRAINT [PK_Trener] PRIMARY KEY CLUSTERED 
(
	[TrenerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimUplata]    Script Date: 24.01.2019. 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimUplata](
	[UplataKey] [int] NOT NULL,
	[UplataAltKey] [int] NOT NULL,
	[mjesecUplate] [date] NULL,
	[godinaUplate] [date] NULL,
	[NazivTreninga] [nvarchar](50) NULL,
 CONSTRAINT [PK_Uplata] PRIMARY KEY CLUSTERED 
(
	[UplataKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FactZarada]    Script Date: 24.01.2019. 16:18:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactZarada](
	[ZaradaKey] [int] IDENTITY(1,1) NOT NULL,
	[PlivacKey] [int] NULL,
	[TrenerKey] [int] NULL,
	[UplataKey] [int] NULL,
	[LokacijaKey] [int] NULL,
	[IznosSvihUplata] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Zarada] PRIMARY KEY CLUSTERED 
(
	[ZaradaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FactZarada]  WITH CHECK ADD  CONSTRAINT [FK_IznosUplata_Lokacija] FOREIGN KEY([LokacijaKey])
REFERENCES [dbo].[DimLokacija] ([LokacijaKey])
GO
ALTER TABLE [dbo].[FactZarada] CHECK CONSTRAINT [FK_IznosUplata_Lokacija]
GO
ALTER TABLE [dbo].[FactZarada]  WITH CHECK ADD  CONSTRAINT [FK_IznosUplata_Plivac] FOREIGN KEY([PlivacKey])
REFERENCES [dbo].[DimPlivac] ([PlivacKey])
GO
ALTER TABLE [dbo].[FactZarada] CHECK CONSTRAINT [FK_IznosUplata_Plivac]
GO
ALTER TABLE [dbo].[FactZarada]  WITH CHECK ADD  CONSTRAINT [FK_IznosUplata_Trener] FOREIGN KEY([TrenerKey])
REFERENCES [dbo].[DimTrener] ([TrenerKey])
GO
ALTER TABLE [dbo].[FactZarada] CHECK CONSTRAINT [FK_IznosUplata_Trener]
GO
ALTER TABLE [dbo].[FactZarada]  WITH CHECK ADD  CONSTRAINT [FK_IznosUplata_Uplata] FOREIGN KEY([UplataKey])
REFERENCES [dbo].[DimUplata] ([UplataKey])
GO
ALTER TABLE [dbo].[FactZarada] CHECK CONSTRAINT [FK_IznosUplata_Uplata]
GO
USE [master]
GO
ALTER DATABASE [SkolaPlivanjaBI_DW_final] SET  READ_WRITE 
GO
