USE [master]
GO
/****** Object:  Database [KidsSchoolManagement]    Script Date: 31-03-2020 01:33:20 ******/
CREATE DATABASE [KidsSchoolManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KidsSchoolManagement', FILENAME = N'D:\Gagan\Program Files\Microsoft Sql Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KidsSchoolManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KidsSchoolManagement_log', FILENAME = N'D:\Gagan\Program Files\Microsoft Sql Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\KidsSchoolManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KidsSchoolManagement] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KidsSchoolManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KidsSchoolManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KidsSchoolManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KidsSchoolManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KidsSchoolManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KidsSchoolManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [KidsSchoolManagement] SET  MULTI_USER 
GO
ALTER DATABASE [KidsSchoolManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KidsSchoolManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KidsSchoolManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KidsSchoolManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KidsSchoolManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'KidsSchoolManagement', N'ON'
GO
ALTER DATABASE [KidsSchoolManagement] SET QUERY_STORE = OFF
GO
USE [KidsSchoolManagement]
GO
/****** Object:  Table [dbo].[Admission]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admission](
	[AdmissionId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[StandardId] [int] NOT NULL,
	[FeeInstallmentPending] [int] NOT NULL,
 CONSTRAINT [PK_Admission] PRIMARY KEY CLUSTERED 
(
	[AdmissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[SessionName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Standard]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Standard](
	[StandardId] [int] IDENTITY(1,1) NOT NULL,
	[StandardName] [nvarchar](max) NULL,
	[SeatAvailable] [int] NOT NULL,
	[TotalFees] [bigint] NOT NULL,
	[SessionId] [int] NOT NULL,
 CONSTRAINT [PK_Standard] PRIMARY KEY CLUSTERED 
(
	[StandardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[ParentId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAdmissions]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAdmissions]
AS
SELECT dbo.Student.StudentName, dbo.Standard.StandardName, dbo.Session.SessionName, dbo.Student.Age, dbo.Standard.TotalFees, dbo.Admission.FeeInstallmentPending, dbo.Admission.AdmissionId
FROM   dbo.Admission INNER JOIN
             dbo.Student ON dbo.Admission.StudentId = dbo.Student.StudentId INNER JOIN
             dbo.Standard ON dbo.Admission.StandardId = dbo.Standard.StandardId INNER JOIN
             dbo.Session ON dbo.Standard.SessionId = dbo.Session.SessionId
GO
/****** Object:  Table [dbo].[FeesStructure]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeesStructure](
	[FeeStructureId] [int] IDENTITY(1,1) NOT NULL,
	[FirstInstallment] [bigint] NOT NULL,
	[SecondInstallment] [bigint] NOT NULL,
	[ThirdInstallment] [bigint] NOT NULL,
	[StandardId] [int] NOT NULL,
 CONSTRAINT [PK_FeesStructure] PRIMARY KEY CLUSTERED 
(
	[FeeStructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vEnquiryAdmissions]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEnquiryAdmissions]
AS
SELECT dbo.Session.SessionName, innner.StandardName, innner.SeatAvailable, innner.TotalFees, innner.StandardId, dbo.FeesStructure.FirstInstallment, dbo.FeesStructure.SecondInstallment, dbo.FeesStructure.ThirdInstallment
FROM   dbo.Standard AS innner INNER JOIN
             dbo.FeesStructure ON innner.StandardId = dbo.FeesStructure.StandardId INNER JOIN
             dbo.Session ON innner.SessionId = dbo.Session.SessionId
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[ParentId] [int] IDENTITY(1,1) NOT NULL,
	[FatherName] [nvarchar](max) NULL,
	[MotherName] [nvarchar](max) NULL,
	[MobileNo] [bigint] NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Parent] PRIMARY KEY CLUSTERED 
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vStudents]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vStudents]
AS
SELECT dbo.Student.StudentId, dbo.Student.StudentName, dbo.Student.Age, dbo.Parent.FatherName, dbo.Parent.MotherName, dbo.Parent.MobileNo, dbo.Parent.Address
FROM   dbo.Student INNER JOIN
             dbo.Parent ON dbo.Student.ParentId = dbo.Parent.ParentId
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayFee]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayFee](
	[PayFeesId] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionId] [int] NOT NULL,
	[Fees] [bigint] NOT NULL,
 CONSTRAINT [PK_PayFee] PRIMARY KEY CLUSTERED 
(
	[PayFeesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admission] ADD  CONSTRAINT [DF_Admission_FeeInstallmentPending]  DEFAULT ((3)) FOR [FeeInstallmentPending]
GO
/****** Object:  StoredProcedure [dbo].[spPayFees]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spPayFees]
@StudentName varchar(50),@Fees bigint
as
begin
declare @AdmissionId int,@StudentId int
select @StudentId=studentid from student where StudentName=@StudentName;
select @AdmissionId=AdmissionId from Admission where studentid=@StudentId;
insert into PayFee values (@AdmissionId,@Fees);
update Admission set FeeInstallmentPending=FeeInstallmentPending-1 where AdmissionId=@AdmissionId;
END
GO
/****** Object:  StoredProcedure [dbo].[spStudentAdmission]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spStudentAdmission]
@FatherName varchar(50),@MotherName varchar(50),@MobileNo bigint ,@Address varchar(50),
@StudentName varchar(50),@Age int ,@StandardName varchar(50)
as
begin
declare @id int ,@StudentId int,@StandardId int

insert into parent values(@FatherName,@MotherName,@MobileNo,@Address);
select @id= parentid from parent where fathername=@FatherName;
insert into student values(@StudentName,@Age,@id);
select @StudentId =studentid from student where parentid=@id;
select @StandardId=standardid from standard where StandardName=@StandardName;
insert into Admission (studentid,standardid)values(@StudentId,@StandardId)
update Standard set SeatAvailable=SeatAvailable-1 where StandardId=@StandardId;
end
GO
/****** Object:  StoredProcedure [dbo].[spStudentRegister]    Script Date: 31-03-2020 01:33:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spStudentRegister]
@FatherName varchar(50),@MotherName varchar(50),@MobileNo bigint ,@Address varchar(50),
@StudentName varchar(50),@Age int 
as
begin
declare @id int

insert into parent values(@FatherName,@MotherName,@MobileNo,@Address);
select @id= parentid from parent where fathername=@FatherName;
insert into student values(@StudentName,@Age,@id);
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Admission"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 340
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Student"
            Begin Extent = 
               Top = 9
               Left = 397
               Bottom = 206
               Right = 619
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Standard"
            Begin Extent = 
               Top = 9
               Left = 676
               Bottom = 206
               Right = 899
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Session"
            Begin Extent = 
               Top = 9
               Left = 956
               Bottom = 152
               Right = 1178
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdmissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAdmissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "innner"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Session"
            Begin Extent = 
               Top = 9
               Left = 616
               Bottom = 152
               Right = 838
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FeesStructure"
            Begin Extent = 
               Top = 9
               Left = 337
               Bottom = 206
               Right = 587
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEnquiryAdmissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEnquiryAdmissions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Parent"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vStudents'
GO
USE [master]
GO
ALTER DATABASE [KidsSchoolManagement] SET  READ_WRITE 
GO
