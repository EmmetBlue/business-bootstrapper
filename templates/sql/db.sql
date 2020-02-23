USE [master]
GO
/****** Object:  Database [EmmetBlue]    Script Date: 3/2/2018 12:07:30 AM ******/
CREATE DATABASE [EmmetBlue]
GO
ALTER DATABASE [EmmetBlue] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmmetBlue].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmmetBlue] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmmetBlue] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmmetBlue] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmmetBlue] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmmetBlue] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmmetBlue] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmmetBlue] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmmetBlue] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmmetBlue] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmmetBlue] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmmetBlue] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmmetBlue] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmmetBlue] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmmetBlue] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmmetBlue] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EmmetBlue] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmmetBlue] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmmetBlue] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmmetBlue] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmmetBlue] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmmetBlue] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EmmetBlue] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmmetBlue] SET RECOVERY FULL 
GO
ALTER DATABASE [EmmetBlue] SET  MULTI_USER 
GO
ALTER DATABASE [EmmetBlue] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmmetBlue] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmmetBlue] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmmetBlue] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EmmetBlue] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format [EmmetBlue], N'ON'
GO
USE [EmmetBlue]
GO
/****** Object:  User [emmetblue-client]    Script Date: 3/2/2018 12:07:30 AM ******/
CREATE USER [emmetblue-client] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [emmetblue-client]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [emmetblue-client]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [emmetblue-client]
GO
ALTER ROLE [db_datareader] ADD MEMBER [emmetblue-client]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [emmetblue-client]
GO
/****** Object:  Schema [Accounts]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Accounts]
GO
/****** Object:  Schema [Consultancy]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Consultancy]
GO
/****** Object:  Schema [EmmetBlueCloud]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [EmmetBlueCloud]
GO
/****** Object:  Schema [FinancialAccounts]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [FinancialAccounts]
GO
/****** Object:  Schema [FinancialAuditing]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [FinancialAuditing]
GO
/****** Object:  Schema [Lab]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Lab]
GO
/****** Object:  Schema [Logs]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Logs]
GO
/****** Object:  Schema [Nursing]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Nursing]
GO
/****** Object:  Schema [Patients]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Patients]
GO
/****** Object:  Schema [Pharmacy]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Pharmacy]
GO
/****** Object:  Schema [Staffs]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE SCHEMA [Staffs]
GO
/****** Object:  Table [Accounts].[AppendedBillingTypePaymentRules]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[AppendedBillingTypePaymentRules](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItem] [int] NOT NULL,
	[CategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[BillingPaymentMethods]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingPaymentMethods](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [varchar](20) NOT NULL,
	[PaymentMethodDescription] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PaymentMethodName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTransaction]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTransaction](
	[BillingTransactionID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTransactionMetaID] [int] NULL,
	[BillingTransactionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[BillingTransactionCustomerName] [varchar](50) NULL,
	[BillingTransactionCustomerPhone] [varchar](20) NULL,
	[BillingTransactionCustomerAddress] [varchar](500) NULL,
	[BillingPaymentMethod] [varchar](20) NOT NULL,
	[BillingAmountPaid] [money] NOT NULL,
	[BillingAmountBalance] [money] NULL,
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTransactionItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[BillingTransactionItems](
	[BillingTransactionItemID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTransactionMetaID] [int] NOT NULL,
	[BillingTransactionItem] [int] NULL,
	[BillingTransactionItemQuantity] [int] NULL,
	[BillingTransactionItemPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTransactionItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[BillingTransactionMeta]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTransactionMeta](
	[BillingTransactionMetaID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTransactionNumber] [varchar](15) NOT NULL,
	[PatientID] [int] NULL,
	[BillingType] [varchar](100) NULL,
	[BilledAmountTotal] [money] NULL,
	[CreatedByUUID] [varchar](20) NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
	[DateCreatedDateOnly] [date] NULL DEFAULT (CONVERT([date],dateadd(day,datediff(day,(0),getdate()),(0)))),
	[BillingTransactionStatus] [varchar](20) NOT NULL DEFAULT ('Unknown'),
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTransactionMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTransactionNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTransactionStatuses]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTransactionStatuses](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](20) NOT NULL,
	[StatusDescription] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StatusName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingType]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingType](
	[BillingTypeID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeName] [varchar](100) NOT NULL,
	[BillingTypeDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTypeItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTypeItems](
	[BillingTypeItemID] [int] IDENTITY(1000,1) NOT NULL,
	[BillingType] [int] NULL,
	[BillingTypeItemName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTypeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTypeItemsInterval]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTypeItemsInterval](
	[BillingTypeItemsIntervalID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItemID] [int] NOT NULL,
	[Interval] [int] NULL,
	[IntervalIncrementType] [varchar](50) NULL,
	[IntervalIncrement] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTypeItemsIntervalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillingTypeItemsPrices]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillingTypeItemsPrices](
	[BillingTypeItemsPricesID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItem] [int] NULL,
	[PatientType] [int] NULL,
	[BillingTypeItemPrice] [money] NOT NULL,
	[RateBased] [bit] NULL,
	[RateIdentifier] [varchar](100) NULL,
	[IntervalBased] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillingTypeItemsPricesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeItem] ASC,
	[PatientType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[BillPaymentRules]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[BillPaymentRules](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[PatientType] [int] NOT NULL,
	[BillingTypeItem] [int] NOT NULL,
	[RuleType] [char](1) NOT NULL,
	[RuleValue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientType] ASC,
	[BillingTypeItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[DepartmentBillingLink]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[DepartmentBillingLink](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[BillingTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC,
	[DepartmentID] ASC,
	[BillingTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[DepartmentPatientTypesReportLink]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[DepartmentPatientTypesReportLink](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[PatientTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC,
	[DepartmentID] ASC,
	[PatientTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[GeneralDefaultPrices]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[GeneralDefaultPrices](
	[DefaultPriceID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItem] [int] NULL,
	[BillingTypeItemPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DefaultPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[HmoDocuments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[HmoDocuments](
	[DocumentID] [int] IDENTITY(1000,1) NOT NULL,
	[DocumentNumber] [varchar](50) NOT NULL,
	[DocumentName] [varchar](100) NULL,
	[DocumentDescription] [varchar](4000) NULL,
	[DocumentCategory] [varchar](20) NULL,
	[DocumentCreator] [int] NULL,
	[DocumentCreationDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[DocumentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[HmoSalesVerification]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[HmoSalesVerification](
	[SalesID] [int] IDENTITY(1000,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[PatientID] [int] NOT NULL,
	[SaleRequest] [varchar](max) NULL,
	[StaffID] [int] NULL,
	[RequestDate] [datetime] NULL DEFAULT (getdate()),
	[ProceedStatus] [int] NULL,
	[SignedBy] [int] NULL,
	[SignComment] [varchar](400) NULL,
	[SignedDate] [datetime] NULL,
	[Status] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientCategoriesHmoFieldTitles]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientCategoriesHmoFieldTitles](
	[FieldTitleID] [int] IDENTITY(1,1) NOT NULL,
	[PatientCategory] [int] NOT NULL,
	[FieldTitleName] [varchar](50) NOT NULL,
	[FieldTitleType] [varchar](50) NULL,
	[FieldTitleDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldTitleID] ASC,
	[PatientCategory] ASC,
	[FieldTitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientDepositsAccount]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[PatientDepositsAccount](
	[AccountID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[AccountBalance] [money] NOT NULL DEFAULT ((0.00)),
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[PatientDepositsAccountTransactions]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientDepositsAccountTransactions](
	[TransactionID] [int] IDENTITY(1000,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[StaffID] [int] NULL,
	[TransactionAmount] [money] NULL,
	[TransactionComment] [varchar](500) NULL,
	[TransactionDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientHmoFieldValues]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientHmoFieldValues](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[ProfileID] [int] NULL,
	[FieldTitle] [varchar](50) NULL,
	[FieldValue] [varchar](max) NULL,
	[LastModified] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ProfileID] ASC,
	[FieldTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientHmoProfile]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientHmoProfile](
	[ProfileID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientID] [int] NULL,
	[PatientIdentificationDocument] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientTypeCategoriesDefaultPrices]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientTypeCategoriesDefaultPrices](
	[DefaultPriceID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItem] [int] NULL,
	[CategoryID] [int] NULL,
	[BillingTypeItemPrice] [money] NOT NULL,
	[RateBased] [bit] NULL,
	[RateIdentifier] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DefaultPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeItem] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PatientTypeTotalPaymentRules]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PatientTypeTotalPaymentRules](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[PatientType] [int] NOT NULL,
	[RuleType] [char](1) NOT NULL,
	[RuleValue] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PaymentReceipts]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[PaymentReceipts](
	[ReceiptID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[AssociatedTransaction] [int] NULL,
	[RepositoryID] [int] NOT NULL,
	[PrintedBy] [int] NULL,
	[DatePrinted] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ReceiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Accounts].[PaymentRequest]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Accounts].[PaymentRequest](
	[PaymentRequestID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentRequestUUID] [varchar](20) NULL,
	[RequestPatientID] [int] NOT NULL,
	[RequestBy] [varchar](20) NULL,
	[RequestDepartment] [int] NULL,
	[RequestDate] [datetime] NULL DEFAULT (getdate()),
	[RequestFulfillmentStatus] [int] NULL DEFAULT ((0)),
	[AttachedInvoice] [int] NULL,
	[RequestFulfilledBy] [varchar](20) NULL,
	[RequestFulFilledDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PaymentRequestUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Accounts].[PaymentRequestItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounts].[PaymentRequestItems](
	[PaymentRequestItemsItems] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[ItemID] [int] NULL,
	[ItemQuantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentRequestItemsItems] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Consultancy].[Allergies]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[Allergies](
	[AllergyID] [int] IDENTITY(1,1) NOT NULL,
	[AllergyName] [varchar](50) NULL,
	[AllergyDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AllergyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[AllergySeverity]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[AllergySeverity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Severity] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[AllergyTriggers]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[AllergyTriggers](
	[TriggerID] [int] IDENTITY(1,1) NOT NULL,
	[Allergy] [int] NULL,
	[TriggerName] [varchar](50) NULL,
	[TriggerDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[TriggerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TriggerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[ComplaintTemplateItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[ComplaintTemplateItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[Item] [varchar](255) NOT NULL,
	[Note] [varchar](255) NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[ComplaintTemplates]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[ComplaintTemplates](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](255) NOT NULL,
	[TemplateDescription] [varchar](500) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TemplateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[ConsultationSheet]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[ConsultationSheet](
	[ConsultationSheetID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NULL,
	[Note] [varchar](max) NULL,
	[Consultant] [int] NULL,
	[DateTaken] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ConsultationSheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[ExaminationTypeOptions]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[ExaminationTypeOptions](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[ExamTypeID] [int] NULL,
	[OptionTitle] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ExamTypeID] ASC,
	[OptionTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[ExaminationTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[ExaminationTypes](
	[ExamTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ExamTypeTitle] [varchar](50) NOT NULL,
	[ExamTypeDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ExamTypeTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[MedicalImaging]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[MedicalImaging](
	[MedicalImagingID] [int] IDENTITY(1,1) NOT NULL,
	[MedicalImagingName] [varchar](100) NULL,
	[MedicalImagingDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MedicalImagingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[PatientAdmission]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Consultancy].[PatientAdmission](
	[PatientAdmissionID] [int] IDENTITY(1000,1) NOT NULL,
	[Patient] [int] NULL,
	[Ward] [int] NULL,
	[Section] [int] NULL,
	[Consultant] [int] NULL,
	[Diagnosis] [int] NULL,
	[AdmissionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[ReceivedInWard] [bit] NULL DEFAULT ((0)),
	[DischargeStatus] [int] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[PatientAdmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Consultancy].[PatientDiagnosisLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Consultancy].[PatientDiagnosisLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[StaffID] [int] NULL,
	[DiagnosisID] [int] NULL,
	[DateLogged] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Consultancy].[PatientDischargeInformation]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[PatientDischargeInformation](
	[DischargeStatusID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NULL,
	[DischargedBy] [int] NULL,
	[DischargeNote] [varchar](1000) NULL,
	[DischargeDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[DischargeStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[PatientQueue]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Consultancy].[PatientQueue](
	[QueueID] [int] IDENTITY(1,1) NOT NULL,
	[Patient] [int] NOT NULL,
	[Consultant] [int] NOT NULL,
	[QueueDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[QueueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Consultancy].[PatientReferralInfo]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[PatientReferralInfo](
	[ReferralInfoID] [int] IDENTITY(1,1) NOT NULL,
	[ReferralID] [int] NULL,
	[Patient] [int] NOT NULL,
	[Referrer] [int] NOT NULL,
	[ReferralNote] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReferralInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[PatientReferrals]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Consultancy].[PatientReferrals](
	[ReferralID] [int] IDENTITY(1,1) NOT NULL,
	[ReferedTo] [int] NOT NULL,
	[DateReferred] [datetime] NOT NULL DEFAULT (getdate()),
	[ReferralArchived] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ReferralID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Consultancy].[PrescriptionTemplateItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[PrescriptionTemplateItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[Item] [varchar](50) NOT NULL,
	[Note] [varchar](255) NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[PrescriptionTemplates]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[PrescriptionTemplates](
	[TemplateID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateName] [varchar](255) NOT NULL,
	[TemplateDescription] [varchar](500) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TemplateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Consultancy].[SavedDiagnosis]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Consultancy].[SavedDiagnosis](
	[SavedDiagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[Patient] [int] NOT NULL,
	[Consultant] [int] NOT NULL,
	[Diagnosis] [varchar](max) NOT NULL,
	[DateModified] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[SavedDiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Patient] ASC,
	[Consultant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [EmmetBlueCloud].[LinkedProfiles]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [EmmetBlueCloud].[LinkedProfiles](
	[ProfileID] [varchar](20) NULL,
	[AccountID] [varchar](15) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DateLinked] [datetime] NOT NULL DEFAULT (getdate()),
	[LinkedBy] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[AccountID] ASC,
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [EmmetBlueCloud].[Provider]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [EmmetBlueCloud].[Provider](
	[PKey] [smallint] NULL,
	[ProviderID] [varchar](30) NULL DEFAULT (NULL),
	[ProviderAlias] [varchar](50) NULL DEFAULT (NULL),
	[ProviderSecretToken] [varchar](256) NULL DEFAULT (NULL)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[AccountingPeriodBeginningBalances]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FinancialAccounts].[AccountingPeriodBeginningBalances](
	[BeginningBalanceID] [int] IDENTITY(1,1) NOT NULL,
	[AccountingPeriodID] [int] NOT NULL,
	[AccountID] [int] NOT NULL,
	[BalanceValue] [money] NULL DEFAULT ((0.00)),
PRIMARY KEY CLUSTERED 
(
	[BeginningBalanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountingPeriodID] ASC,
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [FinancialAccounts].[AccountingPeriods]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[AccountingPeriods](
	[PeriodID] [int] IDENTITY(1000,1) NOT NULL,
	[PeriodStartDate] [date] NOT NULL,
	[PeriodEndDate] [date] NOT NULL,
	[PeriodAlias] [varchar](100) NULL,
	[PeriodEditable] [int] NOT NULL DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[PeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[Accounts]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[Accounts](
	[AccountID] [int] IDENTITY(10000,100) NOT NULL,
	[AccountTypeID] [int] NOT NULL,
	[AccountName] [varchar](50) NOT NULL,
	[AccountDescription] [varchar](300) NULL,
	[AccountStatus] [varchar](10) NOT NULL DEFAULT ('Active'),
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[AccountTypeCategories]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[AccountTypeCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[CategoryDescription] [varchar](300) NULL,
	[SideOnEquation] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[AccountTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[AccountTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NULL,
	[TypeName] [varchar](50) NOT NULL,
	[TypeDescription] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[CorporateVendors]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[CorporateVendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[VendorName] [varchar](50) NOT NULL,
	[VendorDescription] [varchar](300) NULL,
	[VendorAddress] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[VendorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[CurrentAccountingPeriod]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [FinancialAccounts].[CurrentAccountingPeriod](
	[CurrentAccountingPeriodID] [int] IDENTITY(1,1) NOT NULL,
	[AccountingPeriodID] [int] NOT NULL,
	[StaffID] [int] NULL,
	[SetDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[CurrentAccountingPeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [FinancialAccounts].[GeneralJournal]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[GeneralJournal](
	[GeneralJournalID] [int] IDENTITY(1000,1) NOT NULL,
	[GeneralJournalDate] [date] NOT NULL DEFAULT (getdate()),
	[GeneralJournalTotalAmount] [money] NOT NULL,
	[GeneralJournalDescription] [varchar](100) NULL,
	[StaffID] [int] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
	[DateModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[GeneralJournalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAccounts].[GeneralJournalEntries]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAccounts].[GeneralJournalEntries](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[GeneralJournalID] [int] NULL,
	[EntryDescription] [varchar](100) NULL,
	[AccountID] [int] NOT NULL,
	[EntryType] [char](6) NOT NULL,
	[EntryValue] [money] NOT NULL,
	[DateModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAuditing].[SalesLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAuditing].[SalesLog](
	[SalesLogID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NULL,
	[PatientID] [int] NULL,
	[StaffID] [int] NULL,
	[PaymentRequestNumber] [varchar](20) NULL,
	[Action] [varchar](30) NULL,
	[SalesDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[SalesLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [FinancialAuditing].[UnlockLogStatus]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [FinancialAuditing].[UnlockLogStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[LogID] [int] NULL,
	[Status] [int] NOT NULL,
	[StatusNote] [varchar](200) NULL,
	[StaffID] [int] NULL,
	[LastModified] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[InvestigationTypeFieldDefaults]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[InvestigationTypeFieldDefaults](
	[FieldDefaultID] [int] IDENTITY(1,1) NOT NULL,
	[Field] [int] NULL,
	[Value] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldDefaultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[InvestigationTypeFields]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[InvestigationTypeFields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[InvestigationType] [int] NULL,
	[FieldType] [int] NULL,
	[FieldName] [varchar](50) NULL,
	[FieldDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[InvestigationTypeFieldTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[InvestigationTypeFieldTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](20) NULL,
	[TypeDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[InvestigationTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[InvestigationTypes](
	[InvestigationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[InvestigationTypeLab] [int] NULL,
	[InvestigationTypeName] [varchar](50) NULL,
	[InvestigationTypeDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvestigationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[LabRequests]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[LabRequests](
	[RequestID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ClinicalDiagnosis] [varchar](max) NULL,
	[InvestigationRequired] [varchar](500) NULL,
	[RequestedBy] [int] NOT NULL,
	[InvestigationType] [int] NULL,
	[RequestNote] [varchar](500) NULL,
	[RequestAcknowledged] [int] NULL DEFAULT ((0)),
	[RequestAcknowledgedBy] [int] NULL,
	[RequestDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[LabResults]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[LabResults](
	[ResultID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientLabNumber] [int] NULL,
	[RepositoryID] [int] NULL,
	[DateReported] [datetime] NULL DEFAULT (getdate()),
	[Report] [varchar](max) NULL,
	[ReportLab] [int] NULL,
	[ReportedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[Labs]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[Labs](
	[LabID] [int] IDENTITY(1,1) NOT NULL,
	[LabName] [varchar](20) NULL,
	[LabDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[LabID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Lab].[Patients]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Lab].[Patients](
	[PatientLabNumber] [int] IDENTITY(1000,1) NOT NULL,
	[PatientID] [int] NULL,
	[FullName] [varchar](200) NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](500) NULL,
	[PhoneNumber] [varchar](30) NULL,
	[Clinic] [varchar](50) NULL,
	[ClinicalDiagnosis] [varchar](max) NULL,
	[InvestigationTypeRequired] [int] NULL,
	[InvestigationRequired] [varchar](500) NULL,
	[RegistrationDate] [datetime] NULL DEFAULT (getdate()),
	[RequestID] [int] NULL,
	[RequestedBy] [int] NULL,
	[DateRequested] [datetime] NULL,
	[Published] [bit] NULL DEFAULT ((0)),
	[Unlocked] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[PatientLabNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Logs].[DatabaseLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Logs].[DatabaseLog](
	[DatabaseLogID] [int] IDENTITY(1,1) NOT NULL,
	[PostTime] [datetime] NULL,
	[DatabaseUserID] [int] NULL,
	[Event] [varchar](100) NULL,
	[ObjectSchema] [varchar](200) NULL,
	[Object] [varchar](200) NULL,
	[TSQL] [varchar](max) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DatabaseLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Logs].[ErrorLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Logs].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[ErrorTime] [datetime] NULL,
	[DatabaseUserID] [int] NULL,
	[ErrorNumber] [char](100) NULL,
	[ErrorSeverity] [varchar](100) NULL,
	[ErrorMessage] [varchar](max) NULL,
	[ErrorObject] [varchar](max) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[AdmissionBillingItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nursing].[AdmissionBillingItems](
	[AdmissionBillingItemID] [int] IDENTITY(1,1) NOT NULL,
	[BillingTypeItem] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdmissionBillingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[BillingTypeItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Nursing].[AdmissionTreatmentChart]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[AdmissionTreatmentChart](
	[TreatmentChartID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NOT NULL,
	[Drug] [varchar](100) NULL,
	[Dose] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[Time] [varchar](20) NULL,
	[Note] [varchar](500) NULL,
	[Nurse] [int] NULL,
	[Date] [datetime] NOT NULL DEFAULT (getdate()),
	[DateLogged] [datetime] NOT NULL DEFAULT (getdate()),
	[Deleted] [smallint] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[TreatmentChartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ConsultantDepartments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nursing].[ConsultantDepartments](
	[ConsultantDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConsultantDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Nursing].[NursingStationLoggingDepartments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nursing].[NursingStationLoggingDepartments](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Department] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Nursing].[Observations]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[Observations](
	[ObservationID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[RepositoryID] [int] NULL,
	[ObservationType] [int] NULL,
	[Observation] [varchar](max) NULL,
	[StaffID] [int] NULL,
	[ObservationDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ObservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ObservationTypeFieldDefaults]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ObservationTypeFieldDefaults](
	[FieldDefaultID] [int] IDENTITY(1,1) NOT NULL,
	[Field] [int] NULL,
	[Value] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldDefaultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ObservationTypeFieldDirtyValues]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ObservationTypeFieldDirtyValues](
	[FieldDirtyValueID] [int] IDENTITY(1,1) NOT NULL,
	[Field] [int] NULL,
	[Condition] [char](3) NOT NULL,
	[Value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldDirtyValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ObservationTypeFields]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ObservationTypeFields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldObservationType] [int] NULL,
	[FieldName] [varchar](100) NULL,
	[FieldType] [int] NULL,
	[FieldDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ObservationTypeFieldTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ObservationTypeFieldTypes](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NULL,
	[TypeDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ObservationTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ObservationTypes](
	[ObservationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ObservationTypeName] [varchar](100) NOT NULL,
	[ObservationTypeDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[ObservationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[PatientProcessLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[PatientProcessLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[Nurse] [int] NULL,
	[ObservationSummary] [varchar](500) NULL,
	[Consultant] [int] NULL,
	[Department] [int] NULL,
	[DateLogged] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[PharmacyRequests]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[PharmacyRequests](
	[PharmacyRequestID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[Request] [varchar](500) NOT NULL,
	[RequestDate] [datetime] NOT NULL,
	[Staff] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PharmacyRequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[PharmacyRequestsTreatmentCharts]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[PharmacyRequestsTreatmentCharts](
	[TreatmentChartID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[Drug] [varchar](100) NULL,
	[Dose] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[Time] [varchar](10) NULL,
	[Note] [varchar](500) NULL,
	[Nurse] [int] NULL,
	[Date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TreatmentChartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[SectionBed]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[SectionBed](
	[SectionBedID] [int] IDENTITY(1,1) NOT NULL,
	[WardSectionID] [int] NULL,
	[BedName] [varchar](50) NULL,
	[BedDescription] [varchar](500) NULL,
	[BedStatus] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[SectionBedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[WardSectionID] ASC,
	[BedName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ServicesRendered]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ServicesRendered](
	[ServicesRenderedID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NULL,
	[BillingTypeItem] [int] NULL,
	[BillingTypeItemName] [varchar](100) NULL,
	[BillingTypeItemQuantity] [int] NULL,
	[Nurse] [int] NULL,
	[DoctorInCharge] [int] NULL,
	[ServicesRenderedDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ServicesRenderedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[ShiftSummary]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[ShiftSummary](
	[SummaryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NULL,
	[Nurse] [int] NOT NULL,
	[Ward] [int] NOT NULL,
	[SummaryTitle] [varchar](50) NULL,
	[Summary] [varchar](1000) NULL,
	[SummaryDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[Ward]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[Ward](
	[WardID] [int] IDENTITY(1,1) NOT NULL,
	[WardName] [varchar](50) NOT NULL,
	[WardDescription] [varchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[WardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[WardName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[WardAdmission]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Nursing].[WardAdmission](
	[WardAdmissionID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientAdmissionID] [int] NOT NULL,
	[Bed] [int] NOT NULL,
	[AdmissionProcessedBy] [int] NULL,
	[AdmissionDate] [datetime] NOT NULL DEFAULT (getdate()),
	[DischargeStatus] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[WardAdmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientAdmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Nursing].[WardSection]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[WardSection](
	[WardSectionID] [int] IDENTITY(1,1) NOT NULL,
	[WardID] [int] NULL,
	[WardSectionName] [varchar](50) NOT NULL,
	[WardSectionDescription] [varchar](500) NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[WardSectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[WardID] ASC,
	[WardSectionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Nursing].[WardTransferLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Nursing].[WardTransferLog](
	[TransferLogID] [int] IDENTITY(1,1) NOT NULL,
	[PatientAdmissionID] [int] NULL,
	[WardFrom] [int] NULL,
	[WardTo] [int] NULL,
	[TransferNote] [varchar](1000) NULL,
	[TransferredBy] [int] NULL,
	[TransferDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[TransferLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[FieldTitleType]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[FieldTitleType](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NULL,
	[TypeDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[MedicalSummary]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[MedicalSummary](
	[SummaryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[FieldID] [int] NULL,
	[SummaryText] [varchar](500) NOT NULL,
	[LastModified] [datetime] NOT NULL DEFAULT (getdate()),
	[LastModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[MedicalSummaryFields]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[MedicalSummaryFields](
	[FieldID] [int] IDENTITY(1,1) NOT NULL,
	[FieldTitle] [varchar](50) NOT NULL,
	[FieldDescription] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FieldTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[Patient]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[PatientFullName] [varchar](50) NULL,
	[PatientPicture] [varchar](max) NULL,
	[PatientType] [int] NULL,
	[PatientIdentificationDocument] [varchar](max) NULL,
	[PatientProfileLockStatus] [bit] NULL DEFAULT ((1)),
	[ProfileDeleted] [bit] NULL DEFAULT ((0)),
	[PatientUUID] [varchar](20) NOT NULL,
	[LastModified] [datetime] NULL DEFAULT (getdate()),
	[CreatedBy] [int] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PatientUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientAllergies]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientAllergies](
	[AllergyID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[AllergyTitle] [varchar](50) NULL,
	[AllergySeverity] [varchar](20) NULL,
	[AllergyType] [varchar](50) NULL,
	[AllergyDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[AllergyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientAllergySymptoms]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientAllergySymptoms](
	[TriggerID] [int] IDENTITY(1,1) NOT NULL,
	[AllergyID] [int] NULL,
	[Symptom] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TriggerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientAllergyTriggers]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientAllergyTriggers](
	[TriggerID] [int] IDENTITY(1,1) NOT NULL,
	[AllergyID] [int] NULL,
	[TriggerTitle] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TriggerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientAppointments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientAppointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[Staff] [int] NULL,
	[AppointmentReason] [varchar](max) NULL,
	[AppointmentDate] [datetime] NOT NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientDepartment]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Patients].[PatientDepartment](
	[PatientDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[DepartmentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Patients].[PatientDiagnosis]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientDiagnosis](
	[DiagnosisID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DiagnosisDate] [datetime] NULL DEFAULT (getdate()),
	[CodeNumber] [varchar](50) NULL,
	[DiagnosisType] [varchar](20) NULL,
	[DiagnosisTitle] [varchar](100) NULL,
	[Diagnosis] [varchar](max) NULL,
	[DiagnosisBy] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientEvents]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientEvents](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[EventDate] [date] NOT NULL,
	[EventTime] [time](7) NOT NULL,
	[EventActor] [varchar](50) NOT NULL,
	[EventLinkID] [varchar](30) NULL,
	[EventLink] [varchar](max) NULL,
	[EventText] [varchar](100) NULL,
	[EventIcon] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientHospitalHistory]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientHospitalHistory](
	[HospitalHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[DateAttended] [datetime] NULL,
	[ReferredBy] [varchar](50) NULL,
	[Physician] [varchar](50) NULL,
	[Ward] [varchar](50) NULL,
	[DateDischarged] [datetime] NULL,
	[DischargedTo] [varchar](50) NULL,
	[Condition] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[HospitalHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientProcessCheck]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientProcessCheck](
	[ProcessCheckID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[ProcessCheck] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcessCheckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientProcessCheckDates]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientProcessCheckDates](
	[ProcessCheckDateID] [int] IDENTITY(1,1) NOT NULL,
	[ProcessCheckID] [int] NOT NULL,
	[ProcessCheckDateTitle] [varchar](50) NULL,
	[ProcessCheckDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProcessCheckDateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientProfileUnlockLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Patients].[PatientProfileUnlockLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[Staff] [int] NULL,
	[DateLogged] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Patients].[PatientRecordsFieldTitle]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientRecordsFieldTitle](
	[FieldTitleID] [int] IDENTITY(1,1) NOT NULL,
	[FieldTitleName] [varchar](50) NULL,
	[FieldTitleType] [varchar](50) NULL,
	[FieldTitleDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FieldTitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientRecordsFieldValue]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientRecordsFieldValue](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[FieldTitle] [varchar](50) NULL,
	[FieldValue] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientRepository]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientRepository](
	[RepositoryID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[RepositoryNumber] [varchar](500) NOT NULL,
	[RepositoryName] [varchar](500) NULL,
	[RepositoryType] [varchar](30) NULL,
	[RepositoryDescription] [varchar](4000) NULL,
	[RepositoryCreator] [int] NULL,
	[RepositoryCreationDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[RepositoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RepositoryNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientRepositoryItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientRepositoryItems](
	[RepositoryItemID] [int] IDENTITY(1,1) NOT NULL,
	[RepositoryID] [int] NULL,
	[RepositoryItemNumber] [varchar](500) NOT NULL,
	[RepositoryItemName] [varchar](500) NULL,
	[RepositoryItemDescription] [varchar](4000) NULL,
	[RepositoryItemCategory] [varchar](20) NULL,
	[RepositoryItemCreator] [int] NULL,
	[RepositoryItemCreationDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[RepositoryItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RepositoryItemNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientRepositoryTypes]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientRepositoryTypes](
	[RepositoryTypeID] [int] IDENTITY(1,1) NOT NULL,
	[RepositoryTypeName] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RepositoryTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RepositoryTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientType]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientType](
	[PatientTypeID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[PatientTypeName] [varchar](100) NULL,
	[PatientTypeDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[PatientTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientTypeCategories]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[PatientTypeCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
	[CategoryDescription] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[PatientTypeChangeLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Patients].[PatientTypeChangeLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NULL,
	[PreviousType] [int] NULL,
	[NewType] [int] NULL,
	[ChangedBy] [int] NULL,
	[DateLogged] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Patients].[RepositoryItemsComments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[RepositoryItemsComments](
	[RepositoryItemsCommentID] [int] NOT NULL,
	[RepositoryItemID] [int] NULL,
	[CommenterID] [int] NULL,
	[Comment] [varchar](4000) NULL,
	[CommentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RepositoryItemsCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Patients].[RepositoryItemsMediaMeta]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Patients].[RepositoryItemsMediaMeta](
	[RepositoryItemsMetaID] [int] IDENTITY(1,1) NOT NULL,
	[RepositoryItemID] [int] NULL,
	[RepositoryItemType] [varchar](20) NULL,
	[RepositoryItemUrl] [varchar](500) NULL,
	[RepositoryItemSize] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[RepositoryItemsMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[Dispensation]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[Dispensation](
	[DispensationID] [int] IDENTITY(1,1) NOT NULL,
	[DispensingStore] [int] NULL,
	[EligibleDispensory] [int] NULL,
	[DispenseeID] [varchar](20) NULL,
	[Patient] [int] NULL,
	[RequestID] [int] NULL,
	[DispensationDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[DispensationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[DispensedItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[DispensedItems](
	[DispensedItemsID] [int] IDENTITY(1,1) NOT NULL,
	[DispensationID] [int] NOT NULL,
	[ItemID] [int] NULL,
	[DispensedQuantity] [int] NULL,
	[DispensationStatus] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[DispensedItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pharmacy].[DispensoryStoreLink]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[DispensoryStoreLink](
	[LinkID] [int] IDENTITY(1,1) NOT NULL,
	[Dispensory] [int] NULL,
	[Store] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LinkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Dispensory] ASC,
	[Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pharmacy].[EligibleDispensory]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[EligibleDispensory](
	[EligibleDispensoryID] [int] IDENTITY(1,1) NOT NULL,
	[EligibleDispensory] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[EligibleDispensoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EligibleDispensory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[GlobalRestockLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[GlobalRestockLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[ItemQuantity] [int] NULL,
	[Comment] [varchar](500) NULL,
	[StaffID] [int] NULL,
	[RestockDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[InventoryLabelDispensation]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[InventoryLabelDispensation](
	[LabelDispensationID] [int] IDENTITY(1,1) NOT NULL,
	[LabelUUID] [varchar](30) NOT NULL,
	[DispensationID] [int] NULL,
	[DispensedQuantity] [smallint] NULL DEFAULT ((1)),
	[DispensationTime] [datetime] NOT NULL DEFAULT (getdate()),
	[StaffID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LabelDispensationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[InventoryLabels]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[InventoryLabels](
	[LabelID] [int] IDENTITY(1,1) NOT NULL,
	[LabelUUID] [varchar](30) NOT NULL,
	[ItemID] [int] NULL,
	[ItemManufacturedDate] [datetime] NULL,
	[ItemExpiryDate] [datetime] NULL,
	[ItemBatchNumber] [varchar](50) NULL,
	[ItemSerialNumber] [varchar](50) NULL,
	[ItemDispensableInUnits] [bit] NOT NULL DEFAULT ((0)),
	[ItemTotalUnit] [smallint] NOT NULL DEFAULT ((1)),
	[LabelCreationTime] [datetime] NOT NULL DEFAULT (getdate()),
	[LabelCreatedBy] [int] NULL,
	[LabelPrinted] [bit] NULL DEFAULT ((0)),
	[LabelCurrentStore] [int] NULL,
	[LabelPrintedDate] [datetime] NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[LabelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LabelUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[ItemPurchaseLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[ItemPurchaseLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[InvoiceNumber] [varchar](20) NULL,
	[ItemQuantity] [int] NULL,
	[ItemCostPrice] [money] NULL,
	[ItemVendor] [int] NULL,
	[ItemPurchaseDate] [datetime] NULL,
	[ItemBuyee] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[PrescriptionRequests]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[PrescriptionRequests](
	[RequestID] [int] IDENTITY(1000,1) NOT NULL,
	[PatientID] [int] NOT NULL,
	[Request] [varchar](max) NULL,
	[RequestedBy] [int] NULL,
	[RequestDate] [datetime] NULL DEFAULT (getdate()),
	[Acknowledged] [int] NULL,
	[AcknowledgedBy] [int] NULL,
	[Status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[Store]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[Store](
	[StoreID] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NOT NULL,
	[StoreDescription] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StoreName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreInventory]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[StoreInventory](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Item] [int] NULL,
	[ItemBrand] [varchar](50) NULL,
	[ItemManufacturer] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Item] ASC,
	[ItemBrand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreInventoryItems]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[StoreInventoryItems](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[Item] [int] NULL,
	[StoreID] [int] NULL,
	[ItemQuantity] [int] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Item] ASC,
	[StoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Pharmacy].[StoreInventoryProperties]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[StoreInventoryProperties](
	[StoreInventoryPropertiesID] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[PropertyName] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreInventoryPropertiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreInventoryTags]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[StoreInventoryTags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[TagTitle] [varchar](50) NULL,
	[TagName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreRestockHistory]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[StoreRestockHistory](
	[HistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NULL,
	[QuantityBefore] [int] NULL,
	[QuantityAdded] [int] NULL,
	[Comment] [varchar](500) NULL,
	[StaffID] [int] NULL,
	[RestockDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[HistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreRestockHistoryTags]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Pharmacy].[StoreRestockHistoryTags](
	[TagID] [int] IDENTITY(1,1) NOT NULL,
	[HistoryID] [int] NULL,
	[TagTitle] [varchar](50) NULL,
	[TagName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Pharmacy].[StoreTransferLog]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Pharmacy].[StoreTransferLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[TransferringStore] [int] NULL,
	[RecipientStore] [int] NULL,
	[ItemID] [int] NULL,
	[ItemQuantity] [int] NULL,
	[StaffID] [int] NULL,
	[TransferDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Staffs].[Department]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[GroupID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[DepartmentGroup]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[DepartmentGroup](
	[DepartmentGroupID] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[GroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[DepartmentRootUrl]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[DepartmentRootUrl](
	[UrlID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NULL,
	[Url] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UrlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[Role]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Description] [varchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[Staff]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[StaffUUID] [varchar](20) NULL,
	[AccountActivated] [bit] NOT NULL DEFAULT ((0)),
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffUUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffDepartment]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staffs].[StaffDepartment](
	[StaffDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[DepartmentID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Staffs].[StaffPassword]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[StaffPassword](
	[StaffPasswordID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[StaffUsername] [varchar](100) NULL,
	[PasswordHash] [varchar](max) NULL,
	[PasswordSalt] [varchar](20) NULL,
	[ModifiedDate] [datetime] NULL,
	[LoggedIn] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[StaffPasswordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffUsername] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffProfile]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[StaffProfile](
	[StaffProfile] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[StaffFullName] [varchar](50) NULL,
	[StaffPicture] [varchar](max) NULL,
	[StaffIdentificationDocument] [varchar](max) NULL,
	[LastModified] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[StaffProfile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffRecordsFieldTitle]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[StaffRecordsFieldTitle](
	[FieldTitleID] [int] IDENTITY(1,1) NOT NULL,
	[FieldTitleName] [varchar](50) NULL,
	[FieldTitleType] [varchar](50) NULL,
	[FieldTitleDescription] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldTitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[FieldTitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffRecordsFieldValue]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[StaffRecordsFieldValue](
	[FieldValueID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[FieldTitle] [varchar](50) NULL,
	[FieldValue] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldValueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffRole]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staffs].[StaffRole](
	[StaffRoleID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[RoleID] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Staffs].[StaffRoleColorTags]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Staffs].[StaffRoleColorTags](
	[ColorTagID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[PrimaryColor] [varchar](8) NOT NULL,
	[SecondaryColor] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorTagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [Staffs].[StaffSecondaryDepartments]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staffs].[StaffSecondaryDepartments](
	[StaffDepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[DepartmentID] [int] NULL,
	[ModifiedDate] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[StaffDepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[StaffID] ASC,
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Staffs].[WorkSchedules]    Script Date: 3/2/2018 12:07:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staffs].[WorkSchedules](
	[WorkScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [_dta_index_BillingTransaction_5_479340772__K2_8]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_BillingTransaction_5_479340772__K2_8] ON [Accounts].[BillingTransaction]
(
	[BillingTransactionMetaID] ASC
)
INCLUDE ( 	[BillingAmountPaid]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_BillingTransaction_5_479340772__K2_K3]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_BillingTransaction_5_479340772__K2_K3] ON [Accounts].[BillingTransaction]
(
	[BillingTransactionMetaID] ASC,
	[BillingTransactionDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_BillingTransaction_5_479340772__K2_K3_8_9]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_BillingTransaction_5_479340772__K2_K3_8_9] ON [Accounts].[BillingTransaction]
(
	[BillingTransactionMetaID] ASC,
	[BillingTransactionDate] ASC
)
INCLUDE ( 	[BillingAmountPaid],
	[BillingAmountBalance]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_BillingTransactionItems_5_415340544__K2]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_BillingTransactionItems_5_415340544__K2] ON [Accounts].[BillingTransactionItems]
(
	[BillingTransactionMetaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_BillingTransactionItems_5_415340544__K2_1_3_4_5]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_BillingTransactionItems_5_415340544__K2_1_3_4_5] ON [Accounts].[BillingTransactionItems]
(
	[BillingTransactionMetaID] ASC
)
INCLUDE ( 	[BillingTransactionItemID],
	[BillingTransactionItem],
	[BillingTransactionItemQuantity],
	[BillingTransactionItemPrice]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_PaymentRequest_5_575341114__K8_K3_K5_K6_1_2_4_7_9_10]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PaymentRequest_5_575341114__K8_K3_K5_K6_1_2_4_7_9_10] ON [Accounts].[PaymentRequest]
(
	[AttachedInvoice] ASC,
	[RequestPatientID] ASC,
	[RequestDepartment] ASC,
	[RequestDate] ASC
)
INCLUDE ( 	[PaymentRequestID],
	[PaymentRequestUUID],
	[RequestBy],
	[RequestFulfillmentStatus],
	[RequestFulfilledBy],
	[RequestFulFilledDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PaymentRequestItems_5_735341684__K2_K3_1_4]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PaymentRequestItems_5_735341684__K2_K3_1_4] ON [Accounts].[PaymentRequestItems]
(
	[RequestID] ASC,
	[ItemID] ASC
)
INCLUDE ( 	[PaymentRequestItemsItems],
	[ItemQuantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PaymentRequestItems_5_735341684__K3]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PaymentRequestItems_5_735341684__K3] ON [Accounts].[PaymentRequestItems]
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_ConsultationSheet_5_1970822083__K2]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_ConsultationSheet_5_1970822083__K2] ON [Consultancy].[ConsultationSheet]
(
	[PatientAdmissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PatientAdmission_5_178815699__K2_K9_K4_K3_K1_5_6_7_8]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PatientAdmission_5_178815699__K2_K9_K4_K3_K1_5_6_7_8] ON [Consultancy].[PatientAdmission]
(
	[Patient] ASC,
	[DischargeStatus] ASC,
	[Section] ASC,
	[Ward] ASC,
	[PatientAdmissionID] ASC
)
INCLUDE ( 	[Consultant],
	[Diagnosis],
	[AdmissionDate],
	[ReceivedInWard]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_UnlockLogStatus_5_1816393540__K3_K2_K1_4_5_6]    Script Date: 3/2/2018 12:07:31 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_UnlockLogStatus_5_1816393540__K3_K2_K1_4_5_6] ON [FinancialAuditing].[UnlockLogStatus]
(
	[Status] ASC,
	[LogID] ASC,
	[StatusID] ASC
)
INCLUDE ( 	[StatusNote],
	[StaffID],
	[LastModified]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_Patients_5_630293305__K17]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_Patients_5_630293305__K17] ON [Lab].[Patients]
(
	[Unlocked] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_DatabaseLog_5_245575913__K3]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_DatabaseLog_5_245575913__K3] ON [Logs].[DatabaseLog]
(
	[DatabaseUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PatientDiagnosis_5_1741249258__K1]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PatientDiagnosis_5_1741249258__K1] ON [Patients].[PatientDiagnosis]
(
	[DiagnosisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PatientEvents_5_1981250113__K3]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PatientEvents_5_1981250113__K3] ON [Patients].[PatientEvents]
(
	[EventDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PatientProfileUnlockLog_5_1624392856__K2_K1]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PatientProfileUnlockLog_5_1624392856__K2_K1] ON [Patients].[PatientProfileUnlockLog]
(
	[PatientID] ASC,
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PatientRecordsFieldValue_5_1629248859__K2]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PatientRecordsFieldValue_5_1629248859__K2] ON [Patients].[PatientRecordsFieldValue]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_PrescriptionRequests_5_376388410__K4]    Script Date: 3/2/2018 12:07:32 AM ******/
CREATE NONCLUSTERED INDEX [_dta_index_PrescriptionRequests_5_376388410__K4] ON [Pharmacy].[PrescriptionRequests]
(
	[RequestedBy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Accounts].[BillingTypeItemsInterval] ADD  DEFAULT ((1)) FOR [Interval]
GO
ALTER TABLE [Accounts].[BillingTypeItemsInterval] ADD  DEFAULT ('custom') FOR [IntervalIncrementType]
GO
ALTER TABLE [Nursing].[PharmacyRequests] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [Nursing].[PharmacyRequestsTreatmentCharts] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [Nursing].[ShiftSummary] ADD  DEFAULT (getdate()) FOR [SummaryDate]
GO
ALTER TABLE [Patients].[RepositoryItemsComments] ADD  DEFAULT (getdate()) FOR [CommentDate]
GO
ALTER TABLE [Pharmacy].[GlobalRestockLog] ADD  DEFAULT (getdate()) FOR [RestockDate]
GO
ALTER TABLE [Accounts].[AppendedBillingTypePaymentRules]  WITH CHECK ADD FOREIGN KEY([BillingTypeItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[AppendedBillingTypePaymentRules]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [Patients].[PatientTypeCategories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillingTransaction]  WITH CHECK ADD FOREIGN KEY([BillingTransactionMetaID])
REFERENCES [Accounts].[BillingTransactionMeta] ([BillingTransactionMetaID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[BillingTransaction]  WITH CHECK ADD FOREIGN KEY([BillingPaymentMethod])
REFERENCES [Accounts].[BillingPaymentMethods] ([PaymentMethodName])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[BillingTransaction]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Accounts].[BillingTransactionItems]  WITH CHECK ADD FOREIGN KEY([BillingTransactionMetaID])
REFERENCES [Accounts].[BillingTransactionMeta] ([BillingTransactionMetaID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillingTransactionItems]  WITH CHECK ADD FOREIGN KEY([BillingTransactionItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
GO
ALTER TABLE [Accounts].[BillingTransactionMeta]  WITH CHECK ADD FOREIGN KEY([BillingType])
REFERENCES [Accounts].[BillingType] ([BillingTypeName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[BillingTransactionMeta]  WITH CHECK ADD FOREIGN KEY([BillingTransactionStatus])
REFERENCES [Accounts].[BillingTransactionStatuses] ([StatusName])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[BillingTransactionMeta]  WITH CHECK ADD FOREIGN KEY([CreatedByUUID])
REFERENCES [Staffs].[Staff] ([StaffUUID])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[BillingTransactionMeta]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[BillingTypeItems]  WITH CHECK ADD FOREIGN KEY([BillingType])
REFERENCES [Accounts].[BillingType] ([BillingTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillingTypeItemsInterval]  WITH CHECK ADD FOREIGN KEY([BillingTypeItemID])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillingTypeItemsPrices]  WITH CHECK ADD FOREIGN KEY([BillingTypeItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillPaymentRules]  WITH CHECK ADD FOREIGN KEY([BillingTypeItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[BillPaymentRules]  WITH CHECK ADD FOREIGN KEY([PatientType])
REFERENCES [Patients].[PatientType] ([PatientTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[DepartmentBillingLink]  WITH CHECK ADD FOREIGN KEY([BillingTypeID])
REFERENCES [Accounts].[BillingType] ([BillingTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[DepartmentBillingLink]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[DepartmentPatientTypesReportLink]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[DepartmentPatientTypesReportLink]  WITH CHECK ADD FOREIGN KEY([PatientTypeID])
REFERENCES [Patients].[PatientType] ([PatientTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[GeneralDefaultPrices]  WITH CHECK ADD FOREIGN KEY([BillingTypeItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[HmoDocuments]  WITH CHECK ADD FOREIGN KEY([DocumentCreator])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[HmoSalesVerification]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
GO
ALTER TABLE [Accounts].[HmoSalesVerification]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Accounts].[HmoSalesVerification]  WITH CHECK ADD FOREIGN KEY([SignedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Accounts].[HmoSalesVerification]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Accounts].[PatientCategoriesHmoFieldTitles]  WITH CHECK ADD FOREIGN KEY([FieldTitleType])
REFERENCES [Patients].[FieldTitleType] ([TypeName])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[PatientCategoriesHmoFieldTitles]  WITH CHECK ADD FOREIGN KEY([PatientCategory])
REFERENCES [Patients].[PatientTypeCategories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PatientDepositsAccount]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Accounts].[PatientDepositsAccount]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Accounts].[PatientDepositsAccountTransactions]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [Accounts].[PatientDepositsAccount] ([AccountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PatientDepositsAccountTransactions]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Accounts].[PatientHmoFieldValues]  WITH CHECK ADD FOREIGN KEY([ProfileID])
REFERENCES [Accounts].[PatientHmoProfile] ([ProfileID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PatientHmoProfile]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Accounts].[PatientTypeCategoriesDefaultPrices]  WITH CHECK ADD FOREIGN KEY([BillingTypeItem])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PatientTypeCategoriesDefaultPrices]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [Patients].[PatientTypeCategories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PatientTypeTotalPaymentRules]  WITH CHECK ADD FOREIGN KEY([PatientType])
REFERENCES [Patients].[PatientType] ([PatientTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounts].[PaymentReceipts]  WITH CHECK ADD FOREIGN KEY([AssociatedTransaction])
REFERENCES [Accounts].[BillingTransaction] ([BillingTransactionID])
GO
ALTER TABLE [Accounts].[PaymentReceipts]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[PaymentReceipts]  WITH CHECK ADD FOREIGN KEY([PrintedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Accounts].[PaymentReceipts]  WITH CHECK ADD FOREIGN KEY([RepositoryID])
REFERENCES [Patients].[PatientRepository] ([RepositoryID])
GO
ALTER TABLE [Accounts].[PaymentRequest]  WITH CHECK ADD FOREIGN KEY([AttachedInvoice])
REFERENCES [Accounts].[BillingTransactionMeta] ([BillingTransactionMetaID])
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[PaymentRequest]  WITH CHECK ADD FOREIGN KEY([RequestPatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Accounts].[PaymentRequest]  WITH CHECK ADD FOREIGN KEY([RequestBy])
REFERENCES [Staffs].[Staff] ([StaffUUID])
GO
ALTER TABLE [Accounts].[PaymentRequest]  WITH CHECK ADD FOREIGN KEY([RequestFulfilledBy])
REFERENCES [Staffs].[Staff] ([StaffUUID])
GO
ALTER TABLE [Accounts].[PaymentRequest]  WITH CHECK ADD FOREIGN KEY([RequestDepartment])
REFERENCES [Staffs].[Department] ([DepartmentID])
GO
ALTER TABLE [Accounts].[PaymentRequestItems]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[PaymentRequestItems]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [Accounts].[PaymentRequest] ([PaymentRequestID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[AllergyTriggers]  WITH CHECK ADD FOREIGN KEY([Allergy])
REFERENCES [Consultancy].[Allergies] ([AllergyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[ComplaintTemplateItems]  WITH CHECK ADD FOREIGN KEY([TemplateID])
REFERENCES [Consultancy].[ComplaintTemplates] ([TemplateID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[ComplaintTemplates]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Consultancy].[ConsultationSheet]  WITH CHECK ADD FOREIGN KEY([Consultant])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Consultancy].[ConsultationSheet]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Nursing].[WardAdmission] ([WardAdmissionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[ExaminationTypeOptions]  WITH CHECK ADD FOREIGN KEY([ExamTypeID])
REFERENCES [Consultancy].[ExaminationTypes] ([ExamTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([Consultant])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Consultancy].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([Diagnosis])
REFERENCES [Patients].[PatientDiagnosis] ([DiagnosisID])
GO
ALTER TABLE [Consultancy].[PatientAdmission]  WITH CHECK ADD FOREIGN KEY([Patient])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientDiagnosisLog]  WITH CHECK ADD FOREIGN KEY([DiagnosisID])
REFERENCES [Patients].[PatientDiagnosis] ([DiagnosisID])
GO
ALTER TABLE [Consultancy].[PatientDiagnosisLog]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Consultancy].[PatientDiagnosisLog]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientDischargeInformation]  WITH CHECK ADD FOREIGN KEY([DischargedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Consultancy].[PatientDischargeInformation]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Consultancy].[PatientQueue]  WITH CHECK ADD FOREIGN KEY([Consultant])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientQueue]  WITH CHECK ADD FOREIGN KEY([Patient])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientReferralInfo]  WITH CHECK ADD FOREIGN KEY([Patient])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Consultancy].[PatientReferralInfo]  WITH CHECK ADD FOREIGN KEY([Referrer])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Consultancy].[PatientReferralInfo]  WITH CHECK ADD FOREIGN KEY([ReferralID])
REFERENCES [Consultancy].[PatientReferrals] ([ReferralID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PatientReferrals]  WITH CHECK ADD FOREIGN KEY([ReferedTo])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Consultancy].[PrescriptionTemplateItems]  WITH CHECK ADD FOREIGN KEY([TemplateID])
REFERENCES [Consultancy].[PrescriptionTemplates] ([TemplateID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[PrescriptionTemplates]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Consultancy].[SavedDiagnosis]  WITH CHECK ADD FOREIGN KEY([Consultant])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Consultancy].[SavedDiagnosis]  WITH CHECK ADD FOREIGN KEY([Patient])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [EmmetBlueCloud].[LinkedProfiles]  WITH CHECK ADD FOREIGN KEY([LinkedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [EmmetBlueCloud].[LinkedProfiles]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [FinancialAccounts].[AccountingPeriodBeginningBalances]  WITH CHECK ADD FOREIGN KEY([AccountingPeriodID])
REFERENCES [FinancialAccounts].[AccountingPeriods] ([PeriodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FinancialAccounts].[AccountingPeriodBeginningBalances]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [FinancialAccounts].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [FinancialAccounts].[Accounts]  WITH CHECK ADD FOREIGN KEY([AccountTypeID])
REFERENCES [FinancialAccounts].[AccountTypes] ([TypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [FinancialAccounts].[AccountTypes]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [FinancialAccounts].[AccountTypeCategories] ([CategoryID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [FinancialAccounts].[CurrentAccountingPeriod]  WITH CHECK ADD FOREIGN KEY([AccountingPeriodID])
REFERENCES [FinancialAccounts].[AccountingPeriods] ([PeriodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FinancialAccounts].[CurrentAccountingPeriod]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [FinancialAccounts].[GeneralJournal]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [FinancialAccounts].[GeneralJournalEntries]  WITH CHECK ADD FOREIGN KEY([AccountID])
REFERENCES [FinancialAccounts].[Accounts] ([AccountID])
ON UPDATE CASCADE
GO
ALTER TABLE [FinancialAccounts].[GeneralJournalEntries]  WITH CHECK ADD FOREIGN KEY([GeneralJournalID])
REFERENCES [FinancialAccounts].[GeneralJournal] ([GeneralJournalID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FinancialAuditing].[SalesLog]  WITH CHECK ADD FOREIGN KEY([Department])
REFERENCES [Staffs].[Department] ([DepartmentID])
GO
ALTER TABLE [FinancialAuditing].[SalesLog]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [FinancialAuditing].[UnlockLogStatus]  WITH CHECK ADD FOREIGN KEY([LogID])
REFERENCES [Patients].[PatientProfileUnlockLog] ([LogID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FinancialAuditing].[UnlockLogStatus]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Lab].[InvestigationTypeFieldDefaults]  WITH CHECK ADD FOREIGN KEY([Field])
REFERENCES [Lab].[InvestigationTypeFields] ([FieldID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Lab].[InvestigationTypeFields]  WITH CHECK ADD FOREIGN KEY([FieldType])
REFERENCES [Lab].[InvestigationTypeFieldTypes] ([TypeID])
ON UPDATE CASCADE
GO
ALTER TABLE [Lab].[InvestigationTypeFields]  WITH CHECK ADD FOREIGN KEY([InvestigationType])
REFERENCES [Lab].[InvestigationTypes] ([InvestigationTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Lab].[InvestigationTypes]  WITH CHECK ADD FOREIGN KEY([InvestigationTypeLab])
REFERENCES [Lab].[Labs] ([LabID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Lab].[LabRequests]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Lab].[LabRequests]  WITH CHECK ADD FOREIGN KEY([RequestedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Lab].[LabResults]  WITH CHECK ADD FOREIGN KEY([PatientLabNumber])
REFERENCES [Lab].[Patients] ([PatientLabNumber])
GO
ALTER TABLE [Lab].[LabResults]  WITH CHECK ADD FOREIGN KEY([ReportedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Lab].[LabResults]  WITH CHECK ADD FOREIGN KEY([ReportLab])
REFERENCES [Lab].[Labs] ([LabID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Lab].[LabResults]  WITH CHECK ADD FOREIGN KEY([RepositoryID])
REFERENCES [Patients].[PatientRepository] ([RepositoryID])
GO
ALTER TABLE [Lab].[Patients]  WITH CHECK ADD FOREIGN KEY([InvestigationTypeRequired])
REFERENCES [Lab].[InvestigationTypes] ([InvestigationTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Lab].[Patients]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Lab].[Patients]  WITH CHECK ADD FOREIGN KEY([RequestedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Nursing].[AdmissionTreatmentChart]  WITH CHECK ADD FOREIGN KEY([Nurse])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[AdmissionTreatmentChart]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
GO
ALTER TABLE [Nursing].[ConsultantDepartments]  WITH CHECK ADD FOREIGN KEY([Department])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[NursingStationLoggingDepartments]  WITH CHECK ADD FOREIGN KEY([Department])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[Observations]  WITH CHECK ADD FOREIGN KEY([ObservationType])
REFERENCES [Nursing].[ObservationTypes] ([ObservationTypeID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[Observations]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[Observations]  WITH CHECK ADD FOREIGN KEY([RepositoryID])
REFERENCES [Patients].[PatientRepository] ([RepositoryID])
GO
ALTER TABLE [Nursing].[Observations]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[ObservationTypeFieldDefaults]  WITH CHECK ADD FOREIGN KEY([Field])
REFERENCES [Nursing].[ObservationTypeFields] ([FieldID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[ObservationTypeFieldDirtyValues]  WITH CHECK ADD FOREIGN KEY([Field])
REFERENCES [Nursing].[ObservationTypeFields] ([FieldID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[ObservationTypeFields]  WITH CHECK ADD FOREIGN KEY([FieldType])
REFERENCES [Nursing].[ObservationTypeFieldTypes] ([TypeID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[ObservationTypeFields]  WITH CHECK ADD FOREIGN KEY([FieldObservationType])
REFERENCES [Nursing].[ObservationTypes] ([ObservationTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[PatientProcessLog]  WITH CHECK ADD FOREIGN KEY([Department])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[PatientProcessLog]  WITH CHECK ADD FOREIGN KEY([Nurse])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[PatientProcessLog]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[PharmacyRequests]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Nursing].[PharmacyRequests]  WITH CHECK ADD FOREIGN KEY([Staff])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[PharmacyRequestsTreatmentCharts]  WITH CHECK ADD FOREIGN KEY([Nurse])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[PharmacyRequestsTreatmentCharts]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
GO
ALTER TABLE [Nursing].[SectionBed]  WITH CHECK ADD FOREIGN KEY([WardSectionID])
REFERENCES [Nursing].[WardSection] ([WardSectionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[ServicesRendered]  WITH CHECK ADD FOREIGN KEY([DoctorInCharge])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Nursing].[ServicesRendered]  WITH CHECK ADD FOREIGN KEY([Nurse])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[ServicesRendered]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
GO
ALTER TABLE [Nursing].[ShiftSummary]  WITH CHECK ADD FOREIGN KEY([Nurse])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Nursing].[ShiftSummary]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
GO
ALTER TABLE [Nursing].[ShiftSummary]  WITH CHECK ADD FOREIGN KEY([Ward])
REFERENCES [Nursing].[Ward] ([WardID])
ON UPDATE CASCADE
GO
ALTER TABLE [Nursing].[WardAdmission]  WITH CHECK ADD FOREIGN KEY([AdmissionProcessedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[WardAdmission]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
GO
ALTER TABLE [Nursing].[WardAdmission]  WITH CHECK ADD FOREIGN KEY([Bed])
REFERENCES [Nursing].[SectionBed] ([SectionBedID])
ON UPDATE CASCADE
GO
ALTER TABLE [Nursing].[WardSection]  WITH CHECK ADD FOREIGN KEY([WardID])
REFERENCES [Nursing].[Ward] ([WardID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Nursing].[WardTransferLog]  WITH CHECK ADD FOREIGN KEY([PatientAdmissionID])
REFERENCES [Consultancy].[PatientAdmission] ([PatientAdmissionID])
GO
ALTER TABLE [Nursing].[WardTransferLog]  WITH CHECK ADD FOREIGN KEY([TransferredBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Nursing].[WardTransferLog]  WITH CHECK ADD FOREIGN KEY([WardTo])
REFERENCES [Nursing].[Ward] ([WardID])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[MedicalSummary]  WITH CHECK ADD FOREIGN KEY([FieldID])
REFERENCES [Patients].[MedicalSummaryFields] ([FieldID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[MedicalSummary]  WITH CHECK ADD FOREIGN KEY([LastModifiedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[MedicalSummary]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[Patient]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Patients].[Patient]  WITH CHECK ADD FOREIGN KEY([PatientType])
REFERENCES [Patients].[PatientType] ([PatientTypeID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientAllergies]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientAllergySymptoms]  WITH CHECK ADD FOREIGN KEY([AllergyID])
REFERENCES [Patients].[PatientAllergies] ([AllergyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientAllergyTriggers]  WITH CHECK ADD FOREIGN KEY([AllergyID])
REFERENCES [Patients].[PatientAllergies] ([AllergyID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientAppointments]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[PatientAppointments]  WITH CHECK ADD FOREIGN KEY([Staff])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientDepartment]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientDiagnosis]  WITH CHECK ADD FOREIGN KEY([DiagnosisBy])
REFERENCES [Staffs].[Staff] ([StaffUUID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientDiagnosis]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientEvents]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientHospitalHistory]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientProcessCheck]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientProcessCheckDates]  WITH CHECK ADD FOREIGN KEY([ProcessCheckID])
REFERENCES [Patients].[PatientProcessCheck] ([ProcessCheckID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientProfileUnlockLog]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[PatientProfileUnlockLog]  WITH CHECK ADD FOREIGN KEY([Staff])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientRecordsFieldTitle]  WITH CHECK ADD FOREIGN KEY([FieldTitleType])
REFERENCES [Patients].[FieldTitleType] ([TypeName])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[PatientRecordsFieldValue]  WITH CHECK ADD FOREIGN KEY([FieldTitle])
REFERENCES [Patients].[PatientRecordsFieldTitle] ([FieldTitleName])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[PatientRecordsFieldValue]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Patients].[PatientRepository]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[PatientRepository]  WITH CHECK ADD FOREIGN KEY([RepositoryCreator])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientRepository]  WITH CHECK ADD FOREIGN KEY([RepositoryType])
REFERENCES [Patients].[PatientRepositoryTypes] ([RepositoryTypeName])
GO
ALTER TABLE [Patients].[PatientRepositoryItems]  WITH CHECK ADD FOREIGN KEY([RepositoryItemCreator])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientRepositoryItems]  WITH CHECK ADD FOREIGN KEY([RepositoryID])
REFERENCES [Patients].[PatientRepository] ([RepositoryID])
GO
ALTER TABLE [Patients].[PatientType]  WITH CHECK ADD FOREIGN KEY([CategoryName])
REFERENCES [Patients].[PatientTypeCategories] ([CategoryName])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientTypeChangeLog]  WITH CHECK ADD FOREIGN KEY([ChangedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[PatientTypeChangeLog]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
GO
ALTER TABLE [Patients].[RepositoryItemsComments]  WITH CHECK ADD FOREIGN KEY([CommenterID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Patients].[RepositoryItemsComments]  WITH CHECK ADD FOREIGN KEY([RepositoryItemID])
REFERENCES [Patients].[PatientRepositoryItems] ([RepositoryItemID])
GO
ALTER TABLE [Patients].[RepositoryItemsMediaMeta]  WITH CHECK ADD FOREIGN KEY([RepositoryItemID])
REFERENCES [Patients].[PatientRepositoryItems] ([RepositoryItemID])
ON UPDATE CASCADE
GO
ALTER TABLE [Pharmacy].[Dispensation]  WITH CHECK ADD FOREIGN KEY([DispensingStore])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
GO
ALTER TABLE [Pharmacy].[Dispensation]  WITH CHECK ADD FOREIGN KEY([DispenseeID])
REFERENCES [Staffs].[Staff] ([StaffUUID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[Dispensation]  WITH CHECK ADD FOREIGN KEY([EligibleDispensory])
REFERENCES [Pharmacy].[EligibleDispensory] ([EligibleDispensoryID])
ON UPDATE CASCADE
GO
ALTER TABLE [Pharmacy].[Dispensation]  WITH CHECK ADD FOREIGN KEY([Patient])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[Dispensation]  WITH CHECK ADD FOREIGN KEY([RequestID])
REFERENCES [Pharmacy].[PrescriptionRequests] ([RequestID])
GO
ALTER TABLE [Pharmacy].[DispensedItems]  WITH CHECK ADD FOREIGN KEY([DispensationID])
REFERENCES [Pharmacy].[Dispensation] ([DispensationID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[DispensoryStoreLink]  WITH CHECK ADD FOREIGN KEY([Dispensory])
REFERENCES [Pharmacy].[EligibleDispensory] ([EligibleDispensoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[DispensoryStoreLink]  WITH CHECK ADD FOREIGN KEY([Store])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[GlobalRestockLog]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[GlobalRestockLog]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[InventoryLabelDispensation]  WITH CHECK ADD FOREIGN KEY([DispensationID])
REFERENCES [Pharmacy].[Dispensation] ([DispensationID])
ON UPDATE CASCADE
GO
ALTER TABLE [Pharmacy].[InventoryLabelDispensation]  WITH CHECK ADD FOREIGN KEY([LabelUUID])
REFERENCES [Pharmacy].[InventoryLabels] ([LabelUUID])
GO
ALTER TABLE [Pharmacy].[InventoryLabelDispensation]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
GO
ALTER TABLE [Pharmacy].[InventoryLabels]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[InventoryLabels]  WITH CHECK ADD FOREIGN KEY([LabelCurrentStore])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[InventoryLabels]  WITH CHECK ADD FOREIGN KEY([LabelCreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[ItemPurchaseLog]  WITH CHECK ADD FOREIGN KEY([CreatedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[ItemPurchaseLog]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[ItemPurchaseLog]  WITH CHECK ADD FOREIGN KEY([ItemVendor])
REFERENCES [FinancialAccounts].[CorporateVendors] ([VendorID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[PrescriptionRequests]  WITH CHECK ADD FOREIGN KEY([PatientID])
REFERENCES [Patients].[Patient] ([PatientID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[PrescriptionRequests]  WITH CHECK ADD FOREIGN KEY([RequestedBy])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreInventory]  WITH CHECK ADD FOREIGN KEY([Item])
REFERENCES [Accounts].[BillingTypeItems] ([BillingTypeItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreInventoryItems]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreInventoryItems]  WITH CHECK ADD FOREIGN KEY([Item])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreInventoryProperties]  WITH CHECK ADD FOREIGN KEY([StoreID])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreInventoryTags]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreRestockHistory]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[StoreRestockHistory]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[StoreRestockHistoryTags]  WITH CHECK ADD FOREIGN KEY([HistoryID])
REFERENCES [Pharmacy].[StoreRestockHistory] ([HistoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Pharmacy].[StoreTransferLog]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [Pharmacy].[StoreInventory] ([ItemID])
GO
ALTER TABLE [Pharmacy].[StoreTransferLog]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Pharmacy].[StoreTransferLog]  WITH CHECK ADD FOREIGN KEY([TransferringStore])
REFERENCES [Pharmacy].[Store] ([StoreID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[Department]  WITH CHECK ADD FOREIGN KEY([GroupID])
REFERENCES [Staffs].[DepartmentGroup] ([DepartmentGroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[DepartmentRootUrl]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[Role]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffDepartment]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Staffs].[StaffDepartment]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffPassword]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffRecordsFieldValue]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffRole]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [Staffs].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Staffs].[StaffRole]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffRoleColorTags]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [Staffs].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[StaffSecondaryDepartments]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [Staffs].[Department] ([DepartmentID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Staffs].[StaffSecondaryDepartments]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Staffs].[WorkSchedules]  WITH CHECK ADD FOREIGN KEY([StaffID])
REFERENCES [Staffs].[Staff] ([StaffID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Accounts].[BillingTypeItemsInterval]  WITH CHECK ADD CHECK  (([IntervalIncrementType]='geometric' OR [IntervalIncrementType]='multiplicative' OR [IntervalIncrementType]='additive' OR [IntervalIncrementType]='custom'))
GO
ALTER TABLE [Accounts].[BillPaymentRules]  WITH CHECK ADD CHECK  (([RuleType]='*' OR [RuleType]='+' OR [RuleType]='-' OR [RuleType]='%'))
GO
ALTER TABLE [Accounts].[PatientTypeTotalPaymentRules]  WITH CHECK ADD CHECK  (([RuleType]='*' OR [RuleType]='+' OR [RuleType]='-' OR [RuleType]='%'))
GO
ALTER TABLE [FinancialAccounts].[Accounts]  WITH CHECK ADD CHECK  (([AccountStatus]='Inactive' OR [AccountStatus]='Active'))
GO
ALTER TABLE [FinancialAccounts].[AccountTypeCategories]  WITH CHECK ADD CHECK  (([SideOnEquation]='L' OR [SideOnEquation]='R'))
GO
ALTER TABLE [FinancialAccounts].[GeneralJournalEntries]  WITH CHECK ADD CHECK  (([EntryType]='debit' OR [EntryType]='credit'))
GO
ALTER TABLE [Nursing].[ObservationTypeFieldDirtyValues]  WITH CHECK ADD CHECK  (([Condition]='=' OR [Condition]='<' OR [Condition]='>'))
GO
ALTER TABLE [Patients].[PatientDiagnosis]  WITH CHECK ADD CHECK  (([DiagnosisType]='operation' OR [DiagnosisType]='diagnosis'))
GO
/****** Object:  StoredProcedure [Accounts].[GetPatientHmoProfile]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Adeshina
-- Create date: 22/09/2016
-- Description:	
-- =============================================
CREATE PROCEDURE [Accounts].[GetPatientHmoProfile] @patient nvarchar(10) = 'NULL'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @cols AS nvarchar(max),
        @query AS nvarchar(max),
		@queryFinal AS nvarchar(max),
		@queryRoleDept AS nvarchar(max),
		@queryDept AS nvarchar(max)

	SELECT
		@cols = STUFF((SELECT DISTINCT
		',' + QUOTENAME(FieldTitle)
		FROM Accounts.PatientHmoFieldValues
		GROUP BY ProfileID,
				FieldTitle,
				FieldValueID
		ORDER BY 1
		FOR xml PATH (''), TYPE)
		.value('.', 'NVARCHAR(MAX)'), 1, 1, '')

	SET @query = N'SELECT ' + @cols + N' from 
					(
					select FieldValue, FieldTitle, ProfileID
					from Accounts.PatientHmoFieldValues 
				) x
				pivot 
				(
					max(FieldValue)
					for FieldTitle in (' + @cols + N')
				) p'

	IF (@patient = 'NULL')
		BEGIN
			SET @queryFinal = N'SELECT a.ProfileID, a.PatientIdentificationDocument, b.* FROM Accounts.PatientHmoProfile a INNER JOIN ('+ @query+ N')  b ON a.PatientID = b.PatientID'
		END
	ELSE
		BEGIN
			SET @queryFinal = N'SELECT a.ProfileID, a.PatientIdentificationDocument, b.* FROM Accounts.PatientHmoProfile a INNER JOIN ('+ @query+ N')  b ON a.PatientID = b.PatientID WHERE a.PatientID = '+@patient
		END

	EXEC sp_executesql @queryFinal
END

GO
/****** Object:  StoredProcedure [dbo].[CleanUpSchema]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/********************************************************
 COPYRIGHTS http://www.ranjithk.com
*********************************************************/  
CREATE PROCEDURE [dbo].[CleanUpSchema]
(
  @SchemaName varchar(100)
 ,@WorkTest char(1) = 'w'  -- use 'w' to work and 't' to print
)
AS
/*-----------------------------------------------------------------------------------------
  
  Author : Ranjith Kumar S
  Date:    31/01/10
  
  Description: It drop all the objects in a schema and then the schema itself
  
  Limitations:
   
    1. If a table has a PK with XML or a Spatial Index then it wont work 
       (workaround: drop that table manually and re run it)
    2. If the schema is referred by a XML Schema collection then it wont work

If it is helpful, Please send your comments ranjith_842@hotmail.com or visit http://www.ranjithk.com
 
-------------------------------------------------------------------------------------------*/
BEGIN    

declare @SQL varchar(4000)
declare @msg varchar(500)
 
IF OBJECT_ID('tempdb..#dropcode') IS NOT NULL DROP TABLE #dropcode
CREATE TABLE #dropcode
(
   ID int identity(1,1)
  ,SQLstatement varchar(1000) 
 )

-- removes all the foreign keys that reference a PK in the target schema
 SELECT @SQL = 
  'select 
       '' ALTER TABLE ''+SCHEMA_NAME(fk.schema_id)+''.''+OBJECT_NAME(fk.parent_object_id)+'' DROP CONSTRAINT ''+ fk.name
  FROM sys.foreign_keys fk
  join sys.tables t on t.object_id = fk.referenced_object_id
  where t.schema_id = schema_id(''' + @SchemaName+''')
    and fk.schema_id <> t.schema_id 
  order by fk.name desc'
 
 IF @WorkTest = 't' PRINT (@SQL )
 INSERT INTO #dropcode
 EXEC (@SQL)
   
 -- drop all default constraints, check constraints and Foreign Keys
 SELECT @SQL = 
 'SELECT 
       '' ALTER TABLE ''+schema_name(t.schema_id)+''.''+OBJECT_NAME(fk.parent_object_id)+'' DROP CONSTRAINT ''+ fk.[Name]
  FROM sys.objects fk
  join sys.tables t on t.object_id = fk.parent_object_id
  where t.schema_id = schema_id(''' + @SchemaName+''')
   and fk.type IN (''D'', ''C'', ''F'')'
   
 IF @WorkTest = 't' PRINT (@SQL )
 INSERT INTO #dropcode
 EXEC (@SQL)
  
 -- drop all other objects in order    
 SELECT @SQL =   
 'SELECT 
      CASE WHEN SO.type=''PK'' THEN '' ALTER TABLE ''+SCHEMA_NAME(SO.schema_id)+''.''+OBJECT_NAME(SO.parent_object_id)+'' DROP CONSTRAINT ''+ SO.name
           WHEN SO.type=''U'' THEN '' DROP TABLE ''+SCHEMA_NAME(SO.schema_id)+''.''+ SO.[Name]
           WHEN SO.type=''V'' THEN '' DROP VIEW  ''+SCHEMA_NAME(SO.schema_id)+''.''+ SO.[Name]
           WHEN SO.type=''P'' THEN '' DROP PROCEDURE  ''+SCHEMA_NAME(SO.schema_id)+''.''+ SO.[Name]          
           WHEN SO.type=''TR'' THEN ''  DROP TRIGGER  ''+SCHEMA_NAME(SO.schema_id)+''.''+ SO.[Name]
           WHEN SO.type  IN (''FN'', ''TF'',''IF'',''FS'',''FT'') THEN '' DROP FUNCTION  ''+SCHEMA_NAME(SO.schema_id)+''.''+ SO.[Name]
       END
FROM sys.objects SO
WHERE SO.schema_id = schema_id('''+ @SchemaName +''')
  AND SO.type IN (''PK'', ''FN'', ''TF'', ''TR'', ''V'', ''U'', ''P'')
ORDER BY CASE WHEN type = ''PK'' THEN 1 
              WHEN type in (''FN'', ''TF'', ''P'',''IF'',''FS'',''FT'') THEN 2
              WHEN type = ''TR'' THEN 3
              WHEN type = ''V'' THEN 4
              WHEN type = ''U'' THEN 5
            ELSE 6 
          END'

IF @WorkTest = 't' PRINT (@SQL )
INSERT INTO #dropcode
EXEC (@SQL)
  
DECLARE @ID int, @statement varchar(1000)
DECLARE statement_cursor CURSOR
FOR SELECT SQLstatement
      FROM #dropcode
  ORDER BY ID ASC
     
 OPEN statement_cursor
 FETCH statement_cursor INTO @statement 
 WHILE (@@FETCH_STATUS = 0)
 BEGIN
 
 IF @WorkTest = 't' PRINT (@statement)
 ELSE
  BEGIN
    PRINT (@statement)
    EXEC(@statement) 
  END
   
 FETCH statement_cursor INTO @statement     
END
  
CLOSE statement_cursor
DEALLOCATE statement_cursor
  
IF @WorkTest = 't' PRINT ('DROP SCHEMA '+@SchemaName)
ELSE
 BEGIN
   PRINT ('DROP SCHEMA '+@SchemaName)
   EXEC ('DROP SCHEMA '+@SchemaName)
 END  
 
PRINT '------- ALL - DONE -------'    
END



GO
/****** Object:  StoredProcedure [Patients].[GetPatientBasicProfile]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Adeshina
-- Create date: 22/09/2016
-- Description:	
-- =============================================
CREATE PROCEDURE [Patients].[GetPatientBasicProfile] @PatientID INT = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @cols AS nvarchar(max),
        @query AS nvarchar(max),
		@queryFinal AS nvarchar(max)

	SELECT
		@cols = STUFF((SELECT DISTINCT
		',' + QUOTENAME(FieldTitle)
		FROM Patients.PatientRecordsFieldValue
		GROUP BY PatientID,
				FieldTitle,
				FieldValueID
		ORDER BY 1
		FOR xml PATH (''), TYPE)
		.value('.', 'NVARCHAR(MAX)'), 1, 1, '')

	SET @query = N'SELECT ' + @cols + N' from 
					(
					select FieldValue, FieldTitle, PatientID
					from Patients.PatientRecordsFieldValue 
				) x
				pivot 
				(
					max(FieldValue)
					for FieldTitle in (' + @cols + N')
				) p'

	--EXEC sp_executesql @query;
	IF (@PatientID IS NOT NULL)
	BEGIN
		SET @queryFinal = N'SELECT * FROM Patients.PatientType a INNER JOIN (SELECT * FROM Patients.Patient a INNER JOIN ('+ @query+ N' WHERE PatientID = @PatientID)  b ON a.PatientID = b.Patient WHERE a.ProfileDeleted = 0 AND a.PatientID = @PatientID) b ON a.PatientTypeID = b.PatientType'
		EXEC sp_executesql @queryFinal, N'@PatientID INT', @PatientID = @PatientID
	END
	ELSE
	BEGIN
		SET @queryFinal = N'SELECT * FROM Patients.PatientType a INNER JOIN (SELECT * FROM Patients.Patient a INNER JOIN ('+ @query+ N')  b ON a.PatientID = b.Patient WHERE a.ProfileDeleted = 0) b ON a.PatientTypeID = b.PatientType'
		EXEC sp_executesql @queryFinal
	END
END

GO
/****** Object:  StoredProcedure [Staffs].[GetStaffBasicProfile]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Adeshina
-- Create date: 22/09/2016
-- Description:	
-- =============================================
CREATE PROCEDURE [Staffs].[GetStaffBasicProfile] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @cols AS nvarchar(max),
        @query AS nvarchar(max),
		@queryFinal AS nvarchar(max),
		@queryRoleDept AS nvarchar(max),
		@queryDept AS nvarchar(max)

	SELECT
		@cols = STUFF((SELECT DISTINCT
		',' + QUOTENAME(FieldTitle)
		FROM Staffs.StaffRecordsFieldValue
		GROUP BY StaffID,
				FieldTitle,
				FieldValueID
		ORDER BY 1
		FOR xml PATH (''), TYPE)
		.value('.', 'NVARCHAR(MAX)'), 1, 1, '')

	SET @query = N'SELECT ' + @cols + N' from 
					(
					select FieldValue, FieldTitle, StaffID
					from Staffs.StaffRecordsFieldValue 
				) x
				pivot 
				(
					max(FieldValue)
					for FieldTitle in (' + @cols + N')
				) p'

	--EXEC sp_executesql @query;
	SET @queryRoleDept = N'SELECT j.StaffID, j.DepartmentName, k.RoleName FROM (SELECT a.StaffID, b.Name as DepartmentName FROM Staffs.StaffDepartment a INNER JOIN Staffs.Department b ON a.DepartmentID = b.DepartmentID ) j INNER JOIN (SELECT c.StaffID, d.Name as RoleName FROM Staffs.StaffRole c INNER JOIN Staffs.Role d ON c.RoleID = d.RoleID ) k ON j.StaffID = k.StaffID'
	SET @queryFinal = N'SELECT a.StaffID, a.StaffFullName, a.StaffPicture, a.StaffIdentificationDocument, a.LastModified, b.* FROM Staffs.StaffProfile a INNER JOIN ('+ @query+ N')  b ON a.StaffProfile = b.StaffProfile'
	SET @queryDept = N'SELECT h.*, g.DepartmentName, g.RoleName FROM ('+ @queryRoleDept+ N') g INNER JOIN ('+ @queryFinal+ N') h ON g.StaffID = h.StaffID'

	EXEC sp_executesql @queryDept
END

GO
/****** Object:  Trigger [Accounts].[PreventBillingTypeItemsDuplicates]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Accounts].[PreventBillingTypeItemsDuplicates]
 ON [Accounts].[BillingTypeItems]
 INSTEAD OF INSERT
AS
BEGIN
  SET NOCOUNT ON;

  IF NOT EXISTS (SELECT 1 FROM inserted AS i 
    INNER JOIN Accounts.BillingTypeItems AS t
    ON i.BillingType = t.BillingType
    AND i.BillingTypeItemName = t.BillingTypeItemName
  )
  BEGIN
    INSERT Accounts.BillingTypeItems(BillingType, BillingTypeItemName)
      SELECT BillingType, BillingTypeItemName FROM inserted;
  END
  ELSE
  BEGIN
    RAISERROR('Error: Duplicate items are not allowed', 16, 1);
  END
END

GO
/****** Object:  Trigger [Accounts].[UpdatePatientAccountsDepositBalance]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Accounts].[UpdatePatientAccountsDepositBalance] 
ON [Accounts].[PatientDepositsAccountTransactions] 
AFTER INSERT 
AS 
BEGIN
  DECLARE @amount AS MONEY, @account AS INT, @oldAmount AS MONEY;
  SELECT @amount = TransactionAmount, @account = AccountID FROM inserted;
  SELECT @oldAmount = AccountBalance FROM Accounts.PatientDepositsAccount WHERE AccountID = @account;
  IF (@amount + @oldAmount < 0)
  BEGIN
    ROLLBACK TRANSACTION;
    RAISERROR('Error: Balance in deposit account cannot be less than zero', 16, 1);
  END
  ELSE
  BEGIN
    UPDATE Accounts.PatientDepositsAccount SET AccountBalance = CAST(@amount + @oldAmount AS MONEY) WHERE AccountID = @account;
  END
END

GO
/****** Object:  Trigger [Consultancy].[PreventDuplicateAdmission]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Consultancy].[PreventDuplicateAdmission] ON [Consultancy].[PatientAdmission] AFTER INSERT
AS
	BEGIN
		DECLARE @PatientID AS INT, @currentAdmissions AS INT;
		SELECT @PatientID = Patient FROM inserted;
		SELECT @currentAdmissions = COUNT(*) FROM Consultancy.PatientAdmission WHERE Patient = @PatientID AND DischargeStatus IN (0, -1)
		IF (@currentAdmissions > 1)
			BEGIN
				ROLLBACK TRANSACTION
			END
	END;

GO
/****** Object:  Trigger [Consultancy].[UpdateAdmissionOnDischarge]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Consultancy].[UpdateAdmissionOnDischarge] ON [Consultancy].[PatientDischargeInformation] AFTER INSERT
AS
	BEGIN
		DECLARE @admissionId AS INT;
		SELECT @admissionId = PatientAdmissionID FROM inserted;
		UPDATE Consultancy.PatientAdmission SET DischargeStatus = -1 WHERE PatientAdmissionID = @admissionId
	END

GO
/****** Object:  Trigger [FinancialAccounts].[GeneralJournalModified]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [FinancialAccounts].[GeneralJournalModified] ON [FinancialAccounts].[GeneralJournal] AFTER UPDATE
AS
	BEGIN
		DECLARE @colId AS INT;
		SELECT @colId = GeneralJournalID FROM inserted;
		UPDATE FinancialAccounts.GeneralJournal SET DateModified = GETDATE() WHERE GeneralJournalID = @colId;
	END;

GO
/****** Object:  Trigger [FinancialAccounts].[GeneralJournalEntriesCreated]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [FinancialAccounts].[GeneralJournalEntriesCreated] ON [FinancialAccounts].[GeneralJournalEntries] AFTER INSERT
AS
	BEGIN
		DECLARE @totalAmount AS MONEY, @JournalID AS INT;
		SELECT @JournalID = GeneralJournalID FROM inserted;
		SELECT @totalAmount = SUM(EntryValue) FROM FinancialAccounts.GeneralJournalEntries WHERE GeneralJournalID = @JournalID AND EntryType='credit';
		UPDATE FinancialAccounts.GeneralJournal SET GeneralJournalTotalAmount = @totalAmount WHERE GeneralJournalID = @JournalID
	END;

GO
/****** Object:  Trigger [FinancialAccounts].[GeneralJournalEntriesModified]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [FinancialAccounts].[GeneralJournalEntriesModified] ON [FinancialAccounts].[GeneralJournalEntries] AFTER UPDATE
AS
	BEGIN
		DECLARE @OldID AS INT, @JournalID AS INT, @totalAmount AS MONEY;
		SELECT @OldID = EntryID, @JournalID = GeneralJournalID FROM inserted;
		SELECT @totalAmount = SUM(EntryValue) FROM FinancialAccounts.GeneralJournalEntries WHERE GeneralJournalID = @JournalID AND EntryType='credit';

		IF EXISTS (
			SELECT * FROM FinancialAccounts.GeneralJournalEntries WHERE
			(SELECT SUM(EntryValue) FROM FinancialAccounts.GeneralJournalEntries WHERE EntryType='credit' AND GeneralJournalID = @JournalID)
			=
			(SELECT SUM(EntryValue) FROM FinancialAccounts.GeneralJournalEntries WHERE EntryType='debit' AND GeneralJournalID = @JournalID)
			AND GeneralJournalID = @JournalID
		)
			BEGIN
				UPDATE FinancialAccounts.GeneralJournalEntries SET DateModified = GETDATE() WHERE EntryID = @OldID;
				UPDATE FinancialAccounts.GeneralJournal SET GeneralJournalTotalAmount = @totalAmount WHERE GeneralJournalID = @JournalID
			END
		ELSE
			BEGIN
				ROLLBACK TRANSACTION
			END
	END;

GO
/****** Object:  Trigger [FinancialAuditing].[updateUnlockLogStatus]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [FinancialAuditing].[updateUnlockLogStatus] ON [FinancialAuditing].[UnlockLogStatus] AFTER UPDATE
AS
	UPDATE FinancialAuditing.UnlockLogStatus SET LastModified = GETDATE()
	FROM Inserted i
	WHERE FinancialAuditing.UnlockLogStatus.LogID = i.LogID
GO
/****** Object:  Trigger [Patients].[DeletePatientRepository]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Patients].[DeletePatientRepository]
   ON [Patients].[PatientRepository]
   INSTEAD OF DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Patients.PatientRepositoryItems WHERE RepositoryID IN (SELECT RepositoryID FROM DELETED)
	DELETE FROM Patients.PatientRepository WHERE  RepositoryID IN (SELECT RepositoryID FROM DELETED)
END

GO
/****** Object:  Trigger [Patients].[DeletePatientRepositoryItems]    Script Date: 3/2/2018 12:07:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Patients].[DeletePatientRepositoryItems]
   ON [Patients].[PatientRepositoryItems]
   INSTEAD OF DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	DELETE FROM Patients.RepositoryItemsMediaMeta WHERE RepositoryItemID IN (SELECT RepositoryItemID FROM DELETED)
	DELETE FROM Patients.RepositoryItemsComments WHERE RepositoryItemID IN (SELECT RepositoryItemID FROM DELETED)
	DELETE FROM Patients.PatientRepositoryItems WHERE RepositoryItemID IN (SELECT RepositoryItemID FROM DELETED)
END

GO
USE [master]
GO
ALTER DATABASE [EmmetBlue] SET  READ_WRITE 
GO

USE [EmmetBlue]
GO