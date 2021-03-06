USE [master]
GO
/****** Object:  Database [SkolaPlivanjaBI]    Script Date: 22.01.2019. 21:28:56 ******/
CREATE DATABASE [SkolaPlivanjaBI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkolaPlivanja', FILENAME = N'D:\DB\SkolaPlivanja.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkolaPlivanja_log', FILENAME = N'D:\DB\SkolaPlivanja_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SkolaPlivanjaBI] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkolaPlivanjaBI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET  MULTI_USER 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkolaPlivanjaBI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SkolaPlivanjaBI] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SkolaPlivanjaBI]
GO
/****** Object:  Table [dbo].[Bazeni]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bazeni](
	[BazenID] [int] IDENTITY(1,1) NOT NULL,
	[Dimenzije] [nvarchar](15) NOT NULL,
	[Opis] [nvarchar](15) NULL,
	[GradID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BazenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Drzava]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drzava](
	[DrzavaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DrzavaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grad]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grad](
	[GradID] [int] IDENTITY(1,1) NOT NULL,
	[RegijaID] [int] NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GradID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grupe]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupe](
	[GrupaID] [int] IDENTITY(1,1) NOT NULL,
	[Vrsta] [nvarchar](15) NOT NULL,
	[Uzrast] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plivaci]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plivaci](
	[PlivacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](15) NOT NULL,
	[Prezime] [nvarchar](20) NOT NULL,
	[ImeRoditelja] [nvarchar](15) NOT NULL,
	[DatumRodjenja] [date] NOT NULL,
	[Spol] [nvarchar](1) NOT NULL,
	[Kontakt] [nvarchar](30) NOT NULL,
	[UlicaStanovanja] [nvarchar](30) NOT NULL,
	[GradID] [int] NOT NULL,
	[DatumUpisa] [date] NOT NULL,
	[GrupaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlivacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prisustvo]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisustvo](
	[TrenerID] [int] NOT NULL,
	[PlivacID] [int] NOT NULL,
	[TreningID] [int] NOT NULL,
UNIQUE NONCLUSTERED 
(
	[TrenerID] ASC,
	[PlivacID] ASC,
	[TreningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Regija]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regija](
	[RegijaID] [int] IDENTITY(1,1) NOT NULL,
	[DrzavaID] [int] NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RegijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Treneri]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treneri](
	[TrenerID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](15) NOT NULL,
	[Prezime] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Kontakt] [nvarchar](30) NOT NULL,
	[AkademskoZvanje] [nvarchar](30) NOT NULL,
	[GradID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TrenerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trening]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trening](
	[TreningID] [int] IDENTITY(1,1) NOT NULL,
	[GrupaID] [int] NOT NULL,
	[BazenID] [int] NOT NULL,
	[TrenerID] [int] NOT NULL,
	[Datum] [date] NOT NULL,
	[VrijemeOD] [time](7) NOT NULL,
	[VrijemeDO] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TreningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Uplata]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uplata](
	[UplataID] [int] IDENTITY(1,1) NOT NULL,
	[PlivacID] [int] NOT NULL,
	[TrenerID] [int] NOT NULL,
	[DatumUplate] [date] NOT NULL,
	[VrstaTreningaID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UplataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VrstaTreninga]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VrstaTreninga](
	[VrstaTreningaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](20) NOT NULL,
	[Cijena] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VrstaTreningaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zabiljeske]    Script Date: 22.01.2019. 21:28:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zabiljeske](
	[ZabiljeskaID] [int] IDENTITY(1,1) NOT NULL,
	[PlivacID] [int] NOT NULL,
	[TreningID] [int] NOT NULL,
	[TekstZabiljeske] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZabiljeskaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bazeni]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Grad] ([GradID])
GO
ALTER TABLE [dbo].[Grad]  WITH CHECK ADD FOREIGN KEY([RegijaID])
REFERENCES [dbo].[Regija] ([RegijaID])
GO
ALTER TABLE [dbo].[Plivaci]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Grad] ([GradID])
GO
ALTER TABLE [dbo].[Plivaci]  WITH CHECK ADD FOREIGN KEY([GrupaID])
REFERENCES [dbo].[Grupe] ([GrupaID])
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD FOREIGN KEY([PlivacID])
REFERENCES [dbo].[Plivaci] ([PlivacID])
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD FOREIGN KEY([TrenerID])
REFERENCES [dbo].[Treneri] ([TrenerID])
GO
ALTER TABLE [dbo].[Prisustvo]  WITH CHECK ADD FOREIGN KEY([TreningID])
REFERENCES [dbo].[Trening] ([TreningID])
GO
ALTER TABLE [dbo].[Regija]  WITH CHECK ADD FOREIGN KEY([DrzavaID])
REFERENCES [dbo].[Drzava] ([DrzavaID])
GO
ALTER TABLE [dbo].[Treneri]  WITH CHECK ADD FOREIGN KEY([GradID])
REFERENCES [dbo].[Grad] ([GradID])
GO
ALTER TABLE [dbo].[Trening]  WITH CHECK ADD FOREIGN KEY([BazenID])
REFERENCES [dbo].[Bazeni] ([BazenID])
GO
ALTER TABLE [dbo].[Trening]  WITH CHECK ADD FOREIGN KEY([GrupaID])
REFERENCES [dbo].[Grupe] ([GrupaID])
GO
ALTER TABLE [dbo].[Trening]  WITH CHECK ADD FOREIGN KEY([TrenerID])
REFERENCES [dbo].[Treneri] ([TrenerID])
GO
ALTER TABLE [dbo].[Uplata]  WITH CHECK ADD FOREIGN KEY([PlivacID])
REFERENCES [dbo].[Plivaci] ([PlivacID])
GO
ALTER TABLE [dbo].[Uplata]  WITH CHECK ADD FOREIGN KEY([TrenerID])
REFERENCES [dbo].[Treneri] ([TrenerID])
GO
ALTER TABLE [dbo].[Uplata]  WITH CHECK ADD FOREIGN KEY([VrstaTreningaID])
REFERENCES [dbo].[VrstaTreninga] ([VrstaTreningaID])
GO
ALTER TABLE [dbo].[Zabiljeske]  WITH CHECK ADD FOREIGN KEY([PlivacID])
REFERENCES [dbo].[Plivaci] ([PlivacID])
GO
ALTER TABLE [dbo].[Zabiljeske]  WITH CHECK ADD FOREIGN KEY([TreningID])
REFERENCES [dbo].[Trening] ([TreningID])
GO
USE [master]
GO
ALTER DATABASE [SkolaPlivanjaBI] SET  READ_WRITE 
GO
