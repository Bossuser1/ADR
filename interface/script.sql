USE [master]
GO
/****** Object:  Database [GestCompTech]    Script Date: 01/03/2018 11:51:11 ******/
CREATE DATABASE [GestCompTech]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GestCompTech', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GestCompTech.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GestCompTech_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\GestCompTech_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GestCompTech] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GestCompTech].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GestCompTech] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GestCompTech] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GestCompTech] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GestCompTech] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GestCompTech] SET ARITHABORT OFF 
GO
ALTER DATABASE [GestCompTech] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GestCompTech] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GestCompTech] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GestCompTech] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GestCompTech] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GestCompTech] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GestCompTech] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GestCompTech] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GestCompTech] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GestCompTech] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GestCompTech] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GestCompTech] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GestCompTech] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GestCompTech] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GestCompTech] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GestCompTech] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GestCompTech] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GestCompTech] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GestCompTech] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GestCompTech] SET  MULTI_USER 
GO
ALTER DATABASE [GestCompTech] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GestCompTech] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GestCompTech] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GestCompTech] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [GestCompTech]
GO
/****** Object:  DatabaseRole [Tech_Comp_Sup]    Script Date: 01/03/2018 11:51:11 ******/
CREATE ROLE [Tech_Comp_Sup]
GO
/****** Object:  DatabaseRole [Tech_Comp_Ges]    Script Date: 01/03/2018 11:51:11 ******/
CREATE ROLE [Tech_Comp_Ges]
GO
/****** Object:  DatabaseRole [GRP_CRAPO]    Script Date: 01/03/2018 11:51:11 ******/
CREATE ROLE [GRP_CRAPO]
GO
/****** Object:  DatabaseRole [GRP_CALROUL]    Script Date: 01/03/2018 11:51:11 ******/
CREATE ROLE [GRP_CALROUL]
GO
/****** Object:  Table [dbo].[GRAISSES]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRAISSES](
	[IdGraisses] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](55) NULL,
	[CodeAdr] [nvarchar](5) NOT NULL,
	[Fabricant] [nvarchar](55) NULL,
	[NormeMIL] [nvarchar](55) NULL,
	[NormeAIR] [nvarchar](55) NULL,
	[NormeDTD] [nvarchar](55) NULL,
	[NormeOTAN] [nvarchar](55) NULL,
	[NormeDivers] [nvarchar](55) NULL,
	[TempLimMax] [smallint] NULL,
	[TempLimMin] [smallint] NULL,
	[TempRecomMax] [smallint] NULL,
	[TempRecomMin] [smallint] NULL,
	[BaseHuile1] [nvarchar](55) NULL,
	[BaseHuile2] [nvarchar](55) NULL,
	[BaseHuile3] [nvarchar](55) NULL,
	[BaseEpaiss1] [nvarchar](55) NULL,
	[BaseEpaiss2] [nvarchar](55) NULL,
	[BaseEpaiss3] [nvarchar](55) NULL,
	[BaseAdditif1] [nvarchar](55) NULL,
	[BaseAdditif2] [nvarchar](55) NULL,
	[BaseAdditif3] [nvarchar](55) NULL,
	[Proprietes] [nvarchar](255) NULL,
	[Utilisations] [nvarchar](255) NULL,
	[Couleur] [nvarchar](55) NULL,
	[Nuance] [nvarchar](55) NULL,
	[Densite] [real] NULL,
	[DN] [int] NULL,
	[ClasseNGLI] [smallint] NULL,
	[IndiceRefraction] [nvarchar](55) NULL,
	[TempFusion] [smallint] NULL,
	[TempCongelation] [smallint] NULL,
	[PointAniline] [smallint] NULL,
	[PointEclair] [smallint] NULL,
	[PointIgnition] [smallint] NULL,
	[PointAutoInflam] [smallint] NULL,
	[IndexVisco] [nvarchar](55) NULL,
	[Visco20] [real] NULL,
	[Visco] [real] NULL,
	[ViscoTemp] [smallint] NULL,
	[ViscoBis] [real] NULL,
	[ViscoBisTemp] [smallint] NULL,
	[ViscoTer] [real] NULL,
	[ViscoTerTemp] [smallint] NULL,
	[WlfA1] [real] NULL,
	[WlfB1] [real] NULL,
	[WlfC1] [real] NULL,
	[WlfA2] [real] NULL,
	[WlfB2] [real] NULL,
	[WlfC2] [real] NULL,
	[WlfTg0] [real] NULL,
	[WlfUg] [real] NULL,
	[GuptaAlpha] [real] NULL,
	[MasseMol] [real] NULL,
	[DureeVie] [int] NULL,
	[DureeVieTemp] [smallint] NULL,
	[PressVap1] [real] NULL,
	[PressVapTemp1] [smallint] NULL,
	[PressVap2] [real] NULL,
	[PressVapTemp2] [smallint] NULL,
	[PressVap3] [real] NULL,
	[PressVapTemp3] [smallint] NULL,
	[TensionVapeur] [nvarchar](255) NULL,
	[TensionVapeurTemp] [nvarchar](255) NULL,
	[VcmTml] [real] NULL,
	[VcmRml] [real] NULL,
	[VcmCvcm] [real] NULL,
	[TensionSurface] [real] NULL,
	[Kf] [real] NULL,
	[PerteEvaporation] [real] NULL CONSTRAINT [DF__GRAISSES__Perte __1B0907CE]  DEFAULT ((0)),
	[PerteEvapoTemp] [real] NULL,
	[PerteEvapoDuree] [real] NULL,
	[SepHuile] [nvarchar](255) NULL,
	[SepHuileTemp] [nvarchar](255) NULL,
	[SepHuileDuree] [nvarchar](255) NULL,
	[DocTech] [ntext] NULL,
	[Couple] [nvarchar](5) NULL,
	[Temperature] [nvarchar](5) NULL,
	[TemperatureB] [nvarchar](5) NULL,
	[Duree] [nvarchar](5) NULL,
	[Vibration] [nvarchar](5) NULL,
	[Bruit] [nvarchar](5) NULL,
	[Vitesse] [nvarchar](5) NULL,
	[Purete] [nvarchar](5) NULL,
	[Charge] [nvarchar](5) NULL,
	[Radiation] [nvarchar](5) NULL,
	[ResistanceChim] [nvarchar](5) NULL,
	[Oxydation] [nvarchar](5) NULL,
	[ResistanceEau] [nvarchar](5) NULL,
	[StableMaleabilte] [nvarchar](5) NULL,
	[StableStockage] [nvarchar](5) NULL,
	[IndexNeutra] [nvarchar](55) NULL,
	[MHL] [nvarchar](255) NULL,
	[Conserv] [smallint] NULL,
	[ConservH] [smallint] NULL,
	[Failure] [nvarchar](255) NULL,
	[W] [nvarchar](255) NULL,
	[Temp7] [nvarchar](255) NULL,
	[Pmax] [nvarchar](255) NULL,
	[Pmin] [nvarchar](255) NULL,
	[TauxSalissure] [nvarchar](255) NULL,
	[TypeFiltre] [nvarchar](100) NULL,
	[Filtration] [real] NULL,
	[Solvant] [nvarchar](255) NULL,
	[ProdNC] [nvarchar](255) NULL,
	[Dyna] [nvarchar](255) NULL,
	[CapaCharge] [nvarchar](255) NULL,
	[Divers] [nvarchar](255) NULL,
	[SKF] [nvarchar](55) NULL,
	[BARDEN] [nvarchar](55) NULL,
	[MPB] [nvarchar](55) NULL,
	[NMB] [nvarchar](55) NULL,
	[RMB] [nvarchar](55) NULL,
	[FAFNIR] [nvarchar](55) NULL,
	[GRW] [nvarchar](55) NULL,
	[GMN] [nvarchar](55) NULL,
	[NSK] [nvarchar](55) NULL,
	[NHBB] [nvarchar](55) NULL,
	[NTN] [nvarchar](55) NULL,
	[MKL] [nvarchar](55) NULL,
	[Observations] [ntext] NULL,
	[DateCodification] [datetime] NULL,
	[DateModif] [datetime] NULL,
	[UserModif] [nvarchar](5) NULL,
	[Etat] [nvarchar](1) NULL,
	[IndiceClassement] [nvarchar](5) NULL,
 CONSTRAINT [PK_GRAISSES] PRIMARY KEY CLUSTERED 
(
	[IdGraisses] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HUILES]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HUILES](
	[IdHuiles] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](55) NULL,
	[CodeAdr] [nvarchar](5) NOT NULL,
	[Fabricant] [nvarchar](55) NULL,
	[NormeMIL] [nvarchar](55) NULL,
	[NormeAIR] [nvarchar](55) NULL,
	[NormeDTD] [nvarchar](55) NULL,
	[NormeOTAN] [nvarchar](55) NULL,
	[TempLimMax] [smallint] NULL,
	[TempLimMin] [smallint] NULL,
	[TempRecomMax] [smallint] NULL,
	[TempRecomMin] [smallint] NULL,
	[BaseHuile1] [nvarchar](55) NULL,
	[BaseHuile2] [nvarchar](55) NULL,
	[BaseHuile3] [nvarchar](55) NULL,
	[BaseAdditif1] [nvarchar](55) NULL,
	[BaseAdditif2] [nvarchar](55) NULL,
	[BaseAdditif3] [nvarchar](55) NULL,
	[Proprietes] [nvarchar](255) NULL,
	[Utilisations] [nvarchar](255) NULL,
	[Couleur] [nvarchar](55) NULL,
	[Nuance] [nvarchar](55) NULL,
	[Densite] [real] NULL,
	[DN] [int] NULL,
	[IndiceRefraction] [nvarchar](55) NULL,
	[TempFusion] [smallint] NULL,
	[TempCongelation] [smallint] NULL,
	[PointAniline] [smallint] NULL,
	[PointEclair] [smallint] NULL,
	[PointIgnition] [smallint] NULL,
	[PointAutoInflam] [smallint] NULL,
	[IndexVisco] [nvarchar](55) NULL,
	[Visco20] [real] NULL,
	[Visco] [real] NULL,
	[ViscoTemp] [smallint] NULL,
	[ViscoBis] [real] NULL,
	[ViscoBisTemp] [smallint] NULL,
	[ViscoTer] [real] NULL,
	[ViscoTerTemp] [smallint] NULL,
	[WlfA1] [real] NULL,
	[WlfB1] [real] NULL,
	[WlfC1] [real] NULL,
	[WlfA2] [real] NULL,
	[WlfB2] [real] NULL,
	[WlfC2] [real] NULL,
	[WlfTg0] [real] NULL,
	[WlfUg] [real] NULL,
	[GuptaAlpha] [real] NULL,
	[MasseMol] [real] NULL,
	[DureeVie] [int] NULL,
	[DureeVieTemp] [smallint] NULL,
	[PressVap1] [real] NULL,
	[PressVapTemp1] [smallint] NULL,
	[PressVap2] [real] NULL,
	[PressVapTemp2] [smallint] NULL,
	[PressVap3] [real] NULL,
	[PressVapTemp3] [smallint] NULL,
	[VcmTml] [real] NULL,
	[VcmRml] [real] NULL,
	[VcmCvcm] [real] NULL,
	[TensionSurface] [real] NULL,
	[Kf] [real] NULL,
	[PerteEvaporation] [real] NULL CONSTRAINT [DF__HUILES__Perte év__00551192]  DEFAULT ((0)),
	[PerteEvapoTemp] [real] NULL,
	[PerteEvapoDuree] [real] NULL,
	[DocTech] [ntext] NULL,
	[Couple] [nvarchar](5) NULL,
	[Temperature] [nvarchar](5) NULL,
	[TemperatureB] [nvarchar](5) NULL,
	[Duree] [nvarchar](5) NULL,
	[Vibration] [nvarchar](5) NULL,
	[Bruit] [nvarchar](5) NULL,
	[Vitesse] [nvarchar](5) NULL,
	[Purete] [nvarchar](5) NULL,
	[Charge] [nvarchar](5) NULL,
	[Radiation] [nvarchar](5) NULL,
	[ResistanceChim] [nvarchar](5) NULL,
	[Oxydation] [nvarchar](5) NULL,
	[ResistanceEau] [nvarchar](5) NULL,
	[StableMaleabilte] [nvarchar](5) NULL,
	[StableStockage] [nvarchar](5) NULL,
	[IndexNeutra] [nvarchar](55) NULL,
	[MHL] [nvarchar](255) NULL,
	[Conserv] [smallint] NULL,
	[Failure] [nvarchar](255) NULL,
	[W] [nvarchar](255) NULL,
	[Temp7] [nvarchar](255) NULL,
	[Pmax] [nvarchar](255) NULL,
	[Pmin] [nvarchar](255) NULL,
	[TauxSalissure] [nvarchar](255) NULL,
	[TypeFiltre] [nvarchar](100) NULL,
	[Filtration] [real] NULL,
	[Solvant] [nvarchar](255) NULL,
	[ProdNC] [nvarchar](255) NULL,
	[Divers] [nvarchar](255) NULL,
	[SKF] [nvarchar](55) NULL,
	[BARDEN] [nvarchar](55) NULL,
	[MPB] [nvarchar](55) NULL,
	[NMB] [nvarchar](55) NULL,
	[RMB] [nvarchar](55) NULL,
	[FAFNIR] [nvarchar](55) NULL,
	[GRW] [nvarchar](55) NULL,
	[GMN] [nvarchar](55) NULL,
	[NSK] [nvarchar](55) NULL,
	[NHBB] [nvarchar](55) NULL,
	[NTN] [nvarchar](55) NULL,
	[MKL] [nvarchar](55) NULL,
	[Observations] [ntext] NULL,
	[DateCodification] [datetime] NULL,
	[DateModif] [datetime] NULL,
	[UserModif] [nvarchar](5) NULL,
	[Etat] [nvarchar](1) NULL,
	[IndiceClassement] [nvarchar](5) NULL,
 CONSTRAINT [PK_HUILES] PRIMARY KEY CLUSTERED 
(
	[IdHuiles] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Revetement]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revetement](
	[IdRevetement] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](25) NOT NULL,
	[NomCom] [nvarchar](50) NULL,
	[Fournis] [nvarchar](25) NULL,
	[Compochim] [nvarchar](80) NULL,
	[Epaisseur] [real] NULL,
	[Durete] [real] NULL,
	[UnitDurete] [nvarchar](5) NULL,
	[CoeffFrottement] [real] NULL,
	[Propriete] [nvarchar](160) NULL,
	[Observation] [nvarchar](160) NULL,
	[Procedure] [ntext] NULL,
 CONSTRAINT [PK_Revetement] PRIMARY KEY CLUSTERED 
(
	[IdRevetement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoulAnnul]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoulAnnul](
	[IdRoulAnnul] [int] IDENTITY(1,1) NOT NULL,
	[DateMaj] [datetime] NULL,
	[SerieAnn] [nvarchar](5) NULL,
	[Designation] [nvarchar](55) NOT NULL,
	[VersionAnn] [nvarchar](5) NOT NULL,
	[d] [float] NULL,
	[Dia] [float] NULL,
	[B] [float] NULL,
	[Li] [float] NULL,
	[Lo] [float] NULL,
	[Uo] [float] NULL,
	[Di] [float] NULL,
	[Do] [float] NULL,
	[Dm] [float] NULL,
	[Ki] [float] NULL,
	[Ko] [float] NULL,
	[Dw] [float] NULL,
	[Z] [smallint] NULL,
	[Amin1] [float] NULL,
	[Amax1] [float] NULL,
	[Amin2] [float] NULL,
	[Amax2] [float] NULL,
	[Amin3] [float] NULL,
	[Amax3] [float] NULL,
	[Bl] [float] NULL,
	[Be] [float] NULL,
	[masse] [float] NULL,
	[massezz] [float] NULL,
	[massel] [float] NULL,
	[masselzz] [float] NULL,
	[massee] [float] NULL,
	[masseezz] [float] NULL,
	[Viteslim] [smallint] NULL,
	[Jr2min] [smallint] NULL,
	[JrNmin] [smallint] NULL,
	[Jr3min] [smallint] NULL,
	[Jr4min] [smallint] NULL,
	[Jr5min] [smallint] NULL,
	[Jr2max] [smallint] NULL,
	[JrNmax] [smallint] NULL,
	[Jr3max] [smallint] NULL,
	[Jr4max] [smallint] NULL,
	[Jr5max] [smallint] NULL,
	[Ja2min] [smallint] NULL,
	[JaNmin] [smallint] NULL,
	[Ja3min] [smallint] NULL,
	[Ja4min] [smallint] NULL,
	[Ja5min] [smallint] NULL,
	[Ja2max] [smallint] NULL,
	[JaNmax] [smallint] NULL,
	[Ja3max] [smallint] NULL,
	[Ja4max] [smallint] NULL,
	[Ja5max] [smallint] NULL,
	[V100] [float] NULL,
	[VRmin] [float] NULL,
	[VRmax] [float] NULL,
	[VNmin] [float] NULL,
	[VNmax] [float] NULL,
	[Vz100] [float] NULL,
	[VRzmin] [float] NULL,
	[VRzmax] [float] NULL,
	[VNzmin] [float] NULL,
	[VNzmax] [float] NULL,
	[Vzz100] [float] NULL,
	[VRzzmin] [float] NULL,
	[VRzzmax] [float] NULL,
	[VNzzmin] [float] NULL,
	[VNzzmax] [float] NULL,
	[Mhmin] [smallint] NULL,
	[Mhmax] [smallint] NULL,
	[Mhmin2] [smallint] NULL,
	[Mhmax2] [smallint] NULL,
	[Mhmin3] [smallint] NULL,
	[Mhmax3] [smallint] NULL,
	[ProtecZ] [nvarchar](1) NULL,
	[MatZ] [nvarchar](25) NULL,
	[ProtecF] [nvarchar](1) NULL,
	[MatF] [nvarchar](25) NULL,
	[ProtecRS] [nvarchar](1) NULL,
	[MatRS] [nvarchar](25) NULL,
	[Jonc] [nvarchar](25) NULL,
	[ProtecU] [nvarchar](1) NULL,
	[MatU] [nvarchar](25) NULL,
	[DesignADR] [nvarchar](25) NULL,
	[EquivKAYDON] [nvarchar](25) NULL,
	[EquivMPB] [nvarchar](25) NULL,
	[EquivBARDEN] [nvarchar](25) NULL,
	[EquivNHBB] [nvarchar](25) NULL,
	[EquivSKF] [nvarchar](25) NULL,
	[EquivFAG] [nvarchar](25) NULL,
	[EquivINA] [nvarchar](25) NULL,
 CONSTRAINT [PK_RoulAnnul] PRIMARY KEY CLUSTERED 
(
	[IdRoulAnnul] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoulAnnulCapa]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoulAnnulCapa](
	[IdroulAnnulCapa] [int] IDENTITY(1,1) NOT NULL,
	[DateMaj] [datetime] NULL,
	[SerieAnn] [nvarchar](5) NULL,
	[Designation] [nvarchar](55) NOT NULL,
	[VersionAnn] [nvarchar](5) NOT NULL,
	[C] [int] NULL,
	[Co2] [int] NULL,
	[CoN] [int] NULL,
	[Co3] [int] NULL,
	[Co4] [int] NULL,
	[Co5] [int] NULL,
	[Cw] [int] NULL,
	[Co2w] [int] NULL,
	[CoNw] [int] NULL,
	[Co3w] [int] NULL,
	[Co4w] [int] NULL,
	[Co5w] [int] NULL,
	[Cm] [int] NULL,
	[Co2m] [int] NULL,
	[CoNm] [int] NULL,
	[Co3m] [int] NULL,
	[Co4m] [int] NULL,
	[Co5m] [int] NULL,
	[Cd] [int] NULL,
	[Co2d] [int] NULL,
	[CoNd] [int] NULL,
	[Co3d] [int] NULL,
	[Co4d] [int] NULL,
	[Co5d] [int] NULL,
	[Fa2] [int] NULL,
	[FaN] [int] NULL,
	[Fa3] [int] NULL,
	[Fa4] [int] NULL,
	[Fa5] [int] NULL,
	[nq2e] [real] NULL,
	[nqNe] [real] NULL,
	[nq3e] [real] NULL,
	[nq4e] [real] NULL,
	[nq5e] [real] NULL,
	[nq2i] [real] NULL,
	[nqNi] [real] NULL,
	[nq3i] [real] NULL,
	[nq4i] [real] NULL,
	[nq5i] [real] NULL,
	[Fa2n] [int] NULL,
	[FaNn] [int] NULL,
	[Fa3n] [int] NULL,
	[Fa4n] [int] NULL,
	[Fa5n] [int] NULL,
	[Fa2c] [int] NULL,
	[FaNc] [int] NULL,
	[Fa3c] [int] NULL,
	[Fa4c] [int] NULL,
	[Fa5c] [int] NULL,
	[Fa2m] [int] NULL,
	[FaNm] [int] NULL,
	[Fa3m] [int] NULL,
	[Fa4m] [int] NULL,
	[Fa5m] [int] NULL,
	[Fa2mn] [int] NULL,
	[FaNmn] [int] NULL,
	[Fa3mn] [int] NULL,
	[Fa4mn] [int] NULL,
	[Fa5mn] [int] NULL,
	[Fa2mc] [int] NULL,
	[FaNmc] [int] NULL,
	[Fa3mc] [int] NULL,
	[Fa4mc] [int] NULL,
	[Fa5mc] [int] NULL,
	[Fa2d] [int] NULL,
	[FaNd] [int] NULL,
	[Fa3d] [int] NULL,
	[Fa4d] [int] NULL,
	[Fa5d] [int] NULL,
	[Fa2dn] [int] NULL,
	[FaNdn] [int] NULL,
	[Fa3dn] [int] NULL,
	[Fa4dn] [int] NULL,
	[Fa5dn] [int] NULL,
	[Fa2dc] [int] NULL,
	[FaNdc] [int] NULL,
	[Fa3dc] [int] NULL,
	[Fa4dc] [int] NULL,
	[Fa5dc] [int] NULL,
 CONSTRAINT [PK_RoulAnnulCapa] PRIMARY KEY CLUSTERED 
(
	[IdroulAnnulCapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoulNorm]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoulNorm](
	[IdRoulNorm] [int] IDENTITY(1,1) NOT NULL,
	[DateMaj] [datetime] NULL,
	[SerieISO] [nvarchar](5) NULL,
	[InchMetrique] [nvarchar](5) NULL,
	[Designation] [nvarchar](55) NOT NULL,
	[Version] [nvarchar](5) NOT NULL,
	[d] [float] NULL,
	[Dia] [float] NULL,
	[B] [float] NULL,
	[Bf] [float] NULL,
	[Li] [float] NULL,
	[Lo] [float] NULL,
	[Ui] [float] NULL,
	[Uo] [float] NULL,
	[Di] [float] NULL,
	[Do] [float] NULL,
	[Dm] [float] NULL,
	[Ki] [float] NULL,
	[Ko] [float] NULL,
	[Z] [smallint] NULL,
	[Dw] [float] NULL,
	[Dc] [float] NULL,
	[Bc] [float] NULL,
	[Bcf] [float] NULL,
	[C1] [float] NULL,
	[C2] [float] NULL,
	[r1] [nvarchar](25) NULL,
	[Amin1] [float] NULL,
	[Amax1] [float] NULL,
	[r2] [nvarchar](25) NULL,
	[Amin2] [float] NULL,
	[Amax2] [float] NULL,
	[r3] [nvarchar](25) NULL,
	[Amin3] [float] NULL,
	[Amax3] [float] NULL,
	[r4] [nvarchar](25) NULL,
	[Amin4] [float] NULL,
	[Amax4] [float] NULL,
	[Bl] [float] NULL,
	[Blf] [float] NULL,
	[Be] [float] NULL,
	[Bef] [float] NULL,
	[VB] [nvarchar](5) NULL,
	[VH] [nvarchar](5) NULL,
	[VC] [nvarchar](5) NULL,
	[C] [int] NULL,
	[Cw] [int] NULL,
	[Cm] [int] NULL,
	[Cz] [int] NULL,
	[Cd] [int] NULL,
	[Co] [int] NULL,
	[Cow] [int] NULL,
	[Com] [int] NULL,
	[Coz] [int] NULL,
	[Cod] [int] NULL,
	[Fa] [int] NULL,
	[Vhi] [int] NULL,
	[Vgi] [int] NULL,
	[Vho] [int] NULL,
	[Vgo] [int] NULL,
	[masse] [float] NULL,
	[V100] [float] NULL,
	[VRmin] [float] NULL,
	[VRmax] [float] NULL,
	[VNmin] [float] NULL,
	[VNmax] [float] NULL,
	[VZ100] [float] NULL,
	[VZRmin] [float] NULL,
	[VZRmax] [float] NULL,
	[VZNmin] [float] NULL,
	[VZNmax] [float] NULL,
	[Vhuile] [smallint] NULL,
	[NbrGout] [smallint] NULL,
	[NumAiguille] [smallint] NULL,
	[K1] [nvarchar](5) NULL,
	[M1] [nvarchar](25) NULL,
	[K2] [nvarchar](5) NULL,
	[M2] [nvarchar](25) NULL,
	[K3] [nvarchar](5) NULL,
	[M3] [nvarchar](25) NULL,
	[K4] [nvarchar](5) NULL,
	[M4] [nvarchar](25) NULL,
	[K5] [nvarchar](5) NULL,
	[M5] [nvarchar](25) NULL,
	[K6] [nvarchar](5) NULL,
	[M6] [nvarchar](25) NULL,
	[K7] [nvarchar](5) NULL,
	[M7] [nvarchar](25) NULL,
	[K8] [nvarchar](5) NULL,
	[M8] [nvarchar](25) NULL,
	[K9] [nvarchar](5) NULL,
	[M9] [nvarchar](25) NULL,
	[K10] [nvarchar](5) NULL,
	[M10] [nvarchar](25) NULL,
	[K11] [nvarchar](5) NULL,
	[M11] [nvarchar](25) NULL,
	[K12] [nvarchar](5) NULL,
	[M12] [nvarchar](25) NULL,
	[K13] [nvarchar](5) NULL,
	[M13] [nvarchar](25) NULL,
	[K14] [nvarchar](5) NULL,
	[M14] [nvarchar](25) NULL,
	[ProtecZ] [nvarchar](5) NULL,
	[MatZ] [nvarchar](25) NULL,
	[ProtecF] [nvarchar](5) NULL,
	[MatF] [nvarchar](25) NULL,
	[ProtecRS] [nvarchar](5) NULL,
	[MatRS] [nvarchar](25) NULL,
	[ProtecRS2] [nvarchar](5) NULL,
	[MatRS2] [nvarchar](25) NULL,
	[ProtecU] [nvarchar](5) NULL,
	[MatU] [nvarchar](25) NULL,
	[ProtecT] [nvarchar](5) NULL,
	[MatT] [nvarchar](25) NULL,
	[ProtecS] [nvarchar](5) NULL,
	[MatS] [nvarchar](25) NULL,
	[Jonc] [nvarchar](25) NULL,
	[JoncAdap] [nvarchar](25) NULL,
	[Circlip] [nvarchar](5) NULL,
	[IdemConcepInt1] [nvarchar](25) NULL,
	[IdemConcepInt2] [nvarchar](25) NULL,
	[IdemConcepInt3] [nvarchar](25) NULL,
	[EquivSKF] [nvarchar](25) NULL,
	[EquivGRW] [nvarchar](25) NULL,
	[EquivRMB] [nvarchar](25) NULL,
	[EquivNMB] [nvarchar](255) NULL,
	[EquivBARDEN] [nvarchar](255) NULL,
	[EquivMPB] [nvarchar](255) NULL,
	[EquivNHBB] [nvarchar](255) NULL,
 CONSTRAINT [PK_RoulNorm] PRIMARY KEY CLUSTERED 
(
	[IdRoulNorm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoulNormcapa]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoulNormcapa](
	[IdRoulNormCapa] [int] IDENTITY(1,1) NOT NULL,
	[DateMaj] [datetime] NULL,
	[Designation] [nvarchar](55) NOT NULL,
	[C] [int] NULL,
	[Cw] [int] NULL,
	[Cm] [int] NULL,
	[Cz] [int] NULL,
	[Cd] [int] NULL,
	[Co] [int] NULL,
	[Cow] [int] NULL,
	[Com] [int] NULL,
	[Coz] [int] NULL,
	[Cod] [int] NULL,
	[Fa] [int] NULL,
 CONSTRAINT [PK_RoulNormcapa] PRIMARY KEY CLUSTERED 
(
	[IdRoulNormCapa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiCage]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiCage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[NumRoult] [smallint] NOT NULL,
	[DiaExt] [real] NULL,
	[DiaInt] [real] NULL,
	[Largeur] [real] NULL,
	[DiaPattes] [real] NULL,
	[LargPattes] [real] NULL,
	[LargSect] [real] NULL,
	[DiaAlveole] [real] NULL,
	[LargOuverture] [real] NULL,
	[DistAlveole] [real] NULL,
	[TypAlveole] [smallint] NULL,
	[DiaSurBille] [real] NULL,
	[AngleCone] [real] NULL,
	[DiaRetenue] [real] NULL,
	[ChanDif] [bit] NULL CONSTRAINT [DF__T_CrapoSa__ChanD__1273C1CD]  DEFAULT ((0)),
	[ChanInt1Long] [real] NULL,
	[ChanInt1Ang] [real] NULL,
	[ChanInt2Long] [real] NULL,
	[ChanInt2Ang] [real] NULL,
	[ChanExt1Long] [real] NULL,
	[ChanExt1Ang] [real] NULL,
	[ChanExt2Long] [real] NULL,
	[ChanExt2Ang] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiCone]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiCone](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[NumRoult] [smallint] NOT NULL,
	[AngleConeOR] [real] NULL,
	[HautRessOR] [real] NULL,
	[DeportOR] [real] NULL,
	[LargParCylinOR] [real] NULL,
	[AngleConeIR] [real] NULL,
	[HautRessIR] [real] NULL,
	[DeportIR] [real] NULL,
	[LargParCylinIR] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiData]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiData](
	[ID] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Valid] [bit] NULL CONSTRAINT [DF__T_CrapoSa__Valid__693CA210]  DEFAULT ((0)),
	[Projet] [nvarchar](30) NULL,
	[Client] [nvarchar](30) NULL,
	[Reference] [nvarchar](30) NULL,
	[CodProjet] [nvarchar](15) NULL,
	[Type montage] [nvarchar](4) NULL,
	[Type de rlt] [nvarchar](10) NULL,
	[Entretoise] [bit] NULL CONSTRAINT [DF__T_CrapoSa__Entre__6A30C649]  DEFAULT ((0)),
	[RltDiff] [bit] NULL CONSTRAINT [DF__T_CrapoSa__RltDi__6B24EA82]  DEFAULT ((0)),
	[TourneIR] [bit] NULL CONSTRAINT [DF__T_CrapoSa__Tourn__6C190EBB]  DEFAULT ((0)),
	[OptStaDyn] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptSt__6D0D32F4]  DEFAULT ((0)),
	[OptDef] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptDe__6E01572D]  DEFAULT ((0)),
	[Vitesse] [real] NULL CONSTRAINT [DF__T_CrapoSa__Vites__6EF57B66]  DEFAULT ((0)),
	[PrechTolEffort] [real] NULL CONSTRAINT [DF__T_CrapoSa__Prech__6FE99F9F]  DEFAULT ((1)),
	[PrechTolRetouch] [real] NULL CONSTRAINT [DF__T_CrapoSa__Prech__70DDC3D8]  DEFAULT ((2)),
	[Prechmin] [float] NULL,
	[Prechnom] [float] NULL,
	[Prechmax] [float] NULL,
	[OptEff1] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptEf__71D1E811]  DEFAULT ((0)),
	[ComCas1] [nvarchar](45) NULL,
	[EffortA] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__72C60C4A]  DEFAULT ((0)),
	[EffortRY] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__73BA3083]  DEFAULT ((0)),
	[EffortRZ] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__74AE54BC]  DEFAULT ((0)),
	[MomentY] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__75A278F5]  DEFAULT ((0)),
	[MomentZ] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__76969D2E]  DEFAULT ((0)),
	[EffAY] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAY__778AC167]  DEFAULT ((0)),
	[EffAZ] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAZ__787EE5A0]  DEFAULT ((0)),
	[EffRYX] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRY__797309D9]  DEFAULT ((0)),
	[EffRZX] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRZ__7A672E12]  DEFAULT ((0)),
	[OptEff2] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptEf__7B5B524B]  DEFAULT ((0)),
	[ComCas2] [nvarchar](45) NULL,
	[EffortA2] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__7C4F7684]  DEFAULT ((0)),
	[EffortRY2] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__7D439ABD]  DEFAULT ((0)),
	[EffortRZ2] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__7E37BEF6]  DEFAULT ((0)),
	[MomentY2] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__7F2BE32F]  DEFAULT ((0)),
	[MomentZ2] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__00200768]  DEFAULT ((0)),
	[EffAY2] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAY__01142BA1]  DEFAULT ((0)),
	[EffAZ2] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAZ__02084FDA]  DEFAULT ((0)),
	[EffRYX2] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRY__02FC7413]  DEFAULT ((0)),
	[EffRZX2] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRZ__03F0984C]  DEFAULT ((0)),
	[OptEff3] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptEf__04E4BC85]  DEFAULT ((0)),
	[ComCas3] [nvarchar](45) NULL,
	[EffortA3] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__05D8E0BE]  DEFAULT ((0)),
	[EffortRY3] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__06CD04F7]  DEFAULT ((0)),
	[EffortRZ3] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__07C12930]  DEFAULT ((0)),
	[MomentY3] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__08B54D69]  DEFAULT ((0)),
	[MomentZ3] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__09A971A2]  DEFAULT ((0)),
	[EffAY3] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAY__0A9D95DB]  DEFAULT ((0)),
	[EffAZ3] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAZ__0B91BA14]  DEFAULT ((0)),
	[EffRYX3] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRY__0C85DE4D]  DEFAULT ((0)),
	[EffRZX3] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRZ__0D7A0286]  DEFAULT ((0)),
	[OptEff4] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptEf__0E6E26BF]  DEFAULT ((0)),
	[ComCas4] [nvarchar](45) NULL,
	[EffortA4] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__0F624AF8]  DEFAULT ((0)),
	[EffortRY4] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__10566F31]  DEFAULT ((0)),
	[EffortRZ4] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__114A936A]  DEFAULT ((0)),
	[MomentY4] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__123EB7A3]  DEFAULT ((0)),
	[MomentZ4] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__1332DBDC]  DEFAULT ((0)),
	[EffAY4] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAY__14270015]  DEFAULT ((0)),
	[EffAZ4] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAZ__151B244E]  DEFAULT ((0)),
	[EffRYX4] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRY__160F4887]  DEFAULT ((0)),
	[EffRZX4] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRZ__17036CC0]  DEFAULT ((0)),
	[OptEff5] [bit] NULL CONSTRAINT [DF__T_CrapoSa__OptEf__17F790F9]  DEFAULT ((0)),
	[ComCas5] [nvarchar](45) NULL,
	[EffortA5] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__18EBB532]  DEFAULT ((0)),
	[EffortRY5] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__19DFD96B]  DEFAULT ((0)),
	[EffortRZ5] [float] NULL CONSTRAINT [DF__T_CrapoSa__Effor__1AD3FDA4]  DEFAULT ((0)),
	[MomentY5] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__1BC821DD]  DEFAULT ((0)),
	[MomentZ5] [float] NULL CONSTRAINT [DF__T_CrapoSa__Momen__1CBC4616]  DEFAULT ((0)),
	[EffAY5] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAY__1DB06A4F]  DEFAULT ((0)),
	[EffAZ5] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffAZ__1EA48E88]  DEFAULT ((0)),
	[EffRYX5] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRY__1F98B2C1]  DEFAULT ((0)),
	[EffRZX5] [float] NULL CONSTRAINT [DF__T_CrapoSa__EffRZ__208CD6FA]  DEFAULT ((0)),
	[Contrmax] [float] NULL,
	[Arcsecu] [float] NULL,
	[Troncellipse] [float] NULL,
	[Thermiq] [bit] NULL CONSTRAINT [DF__T_CrapoSa__Therm__2180FB33]  DEFAULT ((0)),
	[Temp_int] [real] NULL CONSTRAINT [DF__T_CrapoSa__Temp___22751F6C]  DEFAULT ((20)),
	[Temp_bille] [real] NULL CONSTRAINT [DF__T_CrapoSa__Temp___236943A5]  DEFAULT ((20)),
	[Temp_ext] [real] NULL CONSTRAINT [DF__T_CrapoSa__Temp___245D67DE]  DEFAULT ((20)),
	[IncLub] [bit] NULL CONSTRAINT [DF__T_CrapoSa__IncLu__25518C17]  DEFAULT ((0)),
	[Modele] [bit] NULL CONSTRAINT [DF__T_CrapoSa__Model__2645B050]  DEFAULT ((0)),
	[PresEnt] [float] NULL,
	[TempEnt] [float] NULL,
	[RaBille] [float] NULL,
	[RaPiste] [float] NULL,
	[Commentaire] [nvarchar](170) NULL,
	[Utilisateur] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiEnt]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiEnt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[B_OS] [float] NULL CONSTRAINT [DF__T_CrapoSai__B_OS__1FCDBCEB]  DEFAULT ((0)),
	[B_IS] [float] NULL CONSTRAINT [DF__T_CrapoSai__B_IS__20C1E124]  DEFAULT ((0)),
	[Mat_OS] [nvarchar](5) NULL,
	[Mat_IS] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiProtec]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiProtec](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[NumRoult] [smallint] NOT NULL,
	[GenreProtec1] [nvarchar](2) NULL,
	[GenreProtec2] [nvarchar](2) NULL,
	[LargDrag1] [real] NULL,
	[LargDrag2] [real] NULL,
	[EpProtec1] [real] NULL,
	[EpProtec2] [real] NULL,
	[CoteB1] [real] NULL,
	[CoteB2] [real] NULL,
	[DiaPliage1] [real] NULL,
	[DiaPliage2] [real] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CrapoSaisiRoul]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CrapoSaisiRoul](
	[ID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Numero rlt] [smallint] NOT NULL,
	[AbsRlt] [float] NULL,
	[dint] [float] NULL,
	[dint_arbre] [float] NULL CONSTRAINT [DF__T_CrapoSa__dint___29572725]  DEFAULT ((0)),
	[FrettageMaxIR] [real] NULL CONSTRAINT [DF__T_CrapoSa__Frett__2A4B4B5E]  DEFAULT ((0)),
	[FrettageMinIR] [real] NULL CONSTRAINT [DF__T_CrapoSa__Frett__2B3F6F97]  DEFAULT ((0)),
	[Dext] [float] NULL,
	[Dext_logement] [float] NULL CONSTRAINT [DF__T_CrapoSa__Dext___2C3393D0]  DEFAULT ((0)),
	[FrettageMaxOR] [real] NULL CONSTRAINT [DF__T_CrapoSa__Frett__2D27B809]  DEFAULT ((0)),
	[FrettageMinOR] [real] NULL CONSTRAINT [DF__T_CrapoSa__Frett__2E1BDC42]  DEFAULT ((0)),
	[Bi] [float] NULL,
	[B_arbre] [float] NULL CONSTRAINT [DF__T_CrapoSa__B_arb__2F10007B]  DEFAULT ((0)),
	[Bo] [float] NULL,
	[B_logement] [float] NULL CONSTRAINT [DF__T_CrapoSa__B_log__300424B4]  DEFAULT ((0)),
	[Li] [float] NULL,
	[Lo] [float] NULL,
	[Di] [float] NULL,
	[Do] [float] NULL,
	[Deci] [float] NULL,
	[Deco] [float] NULL,
	[Ki] [float] NULL,
	[Ko] [float] NULL,
	[Dw] [float] NULL,
	[Z] [float] NULL,
	[Jr] [float] NULL,
	[Beta] [float] NULL,
	[TypeCone] [smallint] NULL CONSTRAINT [DF__T_CrapoSa__TypeC__30F848ED]  DEFAULT ((0)),
	[TypeCage] [smallint] NULL CONSTRAINT [DF__T_CrapoSa__TypeC__31EC6D26]  DEFAULT ((0)),
	[TypeProtec] [smallint] NULL CONSTRAINT [DF__T_CrapoSa__TypeP__32E0915F]  DEFAULT ((0)),
	[MatBagueOR] [nvarchar](5) NULL,
	[Mat_logement] [nvarchar](15) NULL CONSTRAINT [DF__T_CrapoSa__Mat_l__33D4B598]  DEFAULT ('W14'),
	[Young_logement] [float] NULL CONSTRAINT [DF__T_CrapoSa__Young__34C8D9D1]  DEFAULT ((204000)),
	[Poisson_logement] [float] NULL CONSTRAINT [DF__T_CrapoSa__Poiss__35BCFE0A]  DEFAULT ((0.3)),
	[Dilatation_logement] [float] NULL CONSTRAINT [DF__T_CrapoSa__Dilat__36B12243]  DEFAULT ((0.0000102)),
	[MatBagueIR] [nvarchar](5) NULL,
	[Mat_arbre] [nvarchar](15) NULL CONSTRAINT [DF__T_CrapoSa__Mat_a__37A5467C]  DEFAULT ('W14'),
	[Young_arbre] [float] NULL CONSTRAINT [DF__T_CrapoSa__Young__38996AB5]  DEFAULT ((204000)),
	[Poisson_arbre] [float] NULL CONSTRAINT [DF__T_CrapoSa__Poiss__398D8EEE]  DEFAULT ((0.3)),
	[Dilatation_arbre] [float] NULL CONSTRAINT [DF__T_CrapoSa__Dilat__3A81B327]  DEFAULT ((0.0000102)),
	[FretolAlmin] [real] NULL CONSTRAINT [DF__T_CrapoSa__Freto__3B75D760]  DEFAULT ((0)),
	[FretolAlmax] [real] NULL CONSTRAINT [DF__T_CrapoSa__Freto__3C69FB99]  DEFAULT ((0)),
	[FretolDiamin] [real] NULL CONSTRAINT [DF__T_CrapoSa__Freto__3D5E1FD2]  DEFAULT ((0)),
	[FretolDiamax] [real] NULL CONSTRAINT [DF__T_CrapoSa__Freto__3E52440B]  DEFAULT ((0)),
	[MatCage] [nvarchar](5) NULL,
	[MatBille] [nvarchar](5) NULL,
	[Lub] [nvarchar](5) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_CritereTech]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CritereTech](
	[CodeCT] [nvarchar](3) NOT NULL,
	[TextCT] [nvarchar](50) NULL,
	[IndiceTri] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_HistoCouple]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_HistoCouple](
	[IdHistoCouple] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Designation] [nvarchar](30) NULL,
	[Specification] [nvarchar](6) NULL CONSTRAINT [DF__T_HistoCo__Speci__787EE5A0]  DEFAULT ('K'),
	[NumProjet] [nvarchar](8) NULL,
	[Dm] [real] NULL,
	[Ko] [real] NULL,
	[Ki] [real] NULL,
	[AngleContact] [real] NULL,
	[yZERO] [real] NULL,
	[JrMoy] [real] NULL,
	[DW] [real] NULL,
	[Z] [smallint] NULL,
	[MateriauBague] [nvarchar](20) NULL,
	[MateriauBille] [nvarchar](20) NULL,
	[TypeCage] [nvarchar](2) NULL,
	[MateriauCage] [nvarchar](20) NULL,
	[Revetement] [nvarchar](20) NULL,
	[Typelubrification] [nvarchar](3) NULL,
	[LubrificationH] [nvarchar](4) NULL,
	[QuantiteLubrifiantH] [real] NULL CONSTRAINT [DF__T_HistoCo__Quant__797309D9]  DEFAULT ((0)),
	[LubrificationG] [nvarchar](4) NULL,
	[QuantiteLubrifiantG] [real] NULL CONSTRAINT [DF__T_HistoCo__Quant__7A672E12]  DEFAULT ((0)),
	[cZERO] [real] NULL,
	[Charge] [real] NULL,
	[PrechargeMin] [real] NULL,
	[PrechargeMax] [real] NULL,
	[VitesseRotation] [real] NULL CONSTRAINT [DF__T_HistoCo__Vites__7B5B524B]  DEFAULT ((2)),
	[CmMin] [real] NULL,
	[CmMoy] [real] NULL,
	[CmMax] [real] NULL,
	[CaMin] [real] NULL,
	[CaMoy] [real] NULL,
	[CaMax] [real] NULL,
	[VCmMin] [real] NULL,
	[VCmMoy] [real] NULL,
	[VCmMax] [real] NULL,
	[VCaMin] [real] NULL,
	[VCaMoy] [real] NULL,
	[VCaMax] [real] NULL,
	[DC] [real] NULL,
	[CDemMin] [real] NULL,
	[CDemMoy] [real] NULL,
	[CDemMax] [real] NULL,
	[NombreRoulements] [smallint] NULL,
	[Observations] [nvarchar](150) NULL,
 CONSTRAINT [PK_T_HistoCouple] PRIMARY KEY CLUSTERED 
(
	[IdHistoCouple] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Mat_Coeff]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Mat_Coeff](
	[IdMatCoeff] [int] IDENTITY(1,1) NOT NULL,
	[DesignADR] [nvarchar](5) NOT NULL,
	[TempMin] [smallint] NOT NULL CONSTRAINT [DF__T_Mat_Coe__TempM__4F7CD00D]  DEFAULT ((0)),
	[TempMax] [smallint] NOT NULL CONSTRAINT [DF__T_Mat_Coe__TempM__5070F446]  DEFAULT ((0)),
	[Young] [float] NULL,
 CONSTRAINT [PK_T_Mat_Coeff] PRIMARY KEY CLUSTERED 
(
	[IdMatCoeff] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Mat_Dilatation]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Mat_Dilatation](
	[IdMatDilatation] [int] IDENTITY(1,1) NOT NULL,
	[DesignADR] [nvarchar](5) NOT NULL,
	[TempMin] [smallint] NOT NULL CONSTRAINT [DF__T_Mat_Dil__TempM__5441852A]  DEFAULT ((0)),
	[TempMax] [smallint] NOT NULL CONSTRAINT [DF__T_Mat_Dil__TempM__5535A963]  DEFAULT ((0)),
	[Dilatation] [float] NULL,
 CONSTRAINT [PK_T_Mat_Dilatation] PRIMARY KEY CLUSTERED 
(
	[IdMatDilatation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Mat_Etat]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Mat_Etat](
	[IdMatEtat] [int] IDENTITY(1,1) NOT NULL,
	[EtatMat] [nvarchar](30) NOT NULL,
	[DesignADR] [nvarchar](5) NOT NULL,
	[ResistMeca] [real] NULL,
	[LimElastique] [real] NULL,
	[Maleabilite] [real] NULL,
	[Resilience] [real] NULL,
	[DureteHV] [smallint] NULL,
	[DureteHB] [smallint] NULL,
	[DureteHRC] [smallint] NULL,
	[upsize_ts] [timestamp] NULL,
 CONSTRAINT [PK_T_Mat_Etat] PRIMARY KEY CLUSTERED 
(
	[IdMatEtat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Materiaux]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Materiaux](
	[IdMateriaux] [int] IDENTITY(1,1) NOT NULL,
	[NomCom] [nvarchar](40) NOT NULL,
	[Famille] [nvarchar](1) NULL,
	[SousFamille] [nvarchar](50) NULL,
	[DesignADR] [nvarchar](5) NOT NULL,
	[NuanceMat] [nvarchar](50) NULL,
	[DocADR] [nvarchar](250) NULL,
	[NormeAFNOR] [nvarchar](30) NULL,
	[NormeAISI] [nvarchar](30) NULL,
	[NormeDIN] [nvarchar](30) NULL,
	[NormeSAE] [nvarchar](30) NULL,
	[NormeEN] [nvarchar](30) NULL,
	[Utilisation] [nvarchar](30) NULL,
	[Proprietes] [nvarchar](250) NULL,
	[Applications] [nvarchar](200) NULL,
	[Observations] [nvarchar](250) NULL,
	[Young] [float] NULL,
	[Poisson] [float] NULL,
	[Densite] [float] NULL,
	[ConductTherm] [float] NULL,
	[CapaTherm] [float] NULL,
	[ContrainteMax] [float] NULL,
	[MatMagnetique] [nchar](3) NOT NULL CONSTRAINT [DF_T_Materiaux_MatMagnetique]  DEFAULT (N'???'),
	[PermMagnAbsolue] [float] NULL,
	[ResistivElect] [real] NULL,
	[Dilatation] [float] NULL,
	[VCmTML] [real] NULL,
	[VCmRML] [real] NULL,
	[VCmCVCM] [real] NULL,
	[TempUtilMax] [smallint] NULL,
	[TempUtilMin] [smallint] NULL,
	[FatigFmA2] [float] NULL,
	[FatigFTdTmin] [smallint] NULL,
	[FatigFTdTmax] [smallint] NULL,
	[FatigFTdAlpha] [float] NULL,
	[FatigFTdBeta] [float] NULL,
	[ImageCourbeWohler] [image] NULL,
	[DateCodif] [datetime] NULL,
	[DateModif] [datetime] NULL,
	[UserModif] [nchar](5) NULL,
	[IndClass] [nchar](5) NULL,
	[EnumMK] [smallint] NULL CONSTRAINT [DF__T_Materia__EnumM__5CD6CB2B]  DEFAULT ((0)),
 CONSTRAINT [PK_T_Materiaux] PRIMARY KEY CLUSTERED 
(
	[IdMateriaux] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_MatFam]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_MatFam](
	[IdMatFam] [int] IDENTITY(1,1) NOT NULL,
	[CodeFamille] [nvarchar](1) NOT NULL,
	[TextFamille] [nvarchar](80) NULL,
 CONSTRAINT [PK_T_MatFam] PRIMARY KEY CLUSTERED 
(
	[IdMatFam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_TypeCage]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TypeCage](
	[IdTypeCage] [int] IDENTITY(1,1) NOT NULL,
	[CodeTypeCage] [nvarchar](2) NOT NULL,
	[DescripTypeCage] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_TypeCage] PRIMARY KEY CLUSTERED 
(
	[IdTypeCage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_TypeLub]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TypeLub](
	[IdTypeLub] [int] NOT NULL,
	[CodeTypeLub] [nvarchar](5) NOT NULL,
	[DescripTypeLub] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_TypeLub] PRIMARY KEY CLUSTERED 
(
	[IdTypeLub] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_1]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_1](
	[12445auto] [int] IDENTITY(1,1) NOT NULL,
	[hhh] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Table_test]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_test](
	[test] [ntext] NULL,
	[test1] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilisateur]    Script Date: 01/03/2018 11:51:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilisateur](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [nvarchar](20) NOT NULL,
	[Prenom] [nvarchar](20) NOT NULL,
	[login] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[connectionStr] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Utilisateur] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[T_CritereTech] ADD  DEFAULT ((0)) FOR [IndiceTri]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Revetement', @level2type=N'COLUMN',@level2name=N'NomCom'
GO
USE [master]
GO
ALTER DATABASE [GestCompTech] SET  READ_WRITE 
GO
