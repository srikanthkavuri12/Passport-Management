USE [master]
GO
/****** Object:  Database [final]    Script Date: 04/23/2019 09:43:23 ******/
CREATE DATABASE [final] ON  PRIMARY 
( NAME = N'final', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\final.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'final_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\final_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [final] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [final].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [final] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [final] SET ANSI_NULLS OFF
GO
ALTER DATABASE [final] SET ANSI_PADDING OFF
GO
ALTER DATABASE [final] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [final] SET ARITHABORT OFF
GO
ALTER DATABASE [final] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [final] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [final] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [final] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [final] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [final] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [final] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [final] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [final] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [final] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [final] SET  DISABLE_BROKER
GO
ALTER DATABASE [final] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [final] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [final] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [final] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [final] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [final] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [final] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [final] SET  READ_WRITE
GO
ALTER DATABASE [final] SET RECOVERY SIMPLE
GO
ALTER DATABASE [final] SET  MULTI_USER
GO
ALTER DATABASE [final] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [final] SET DB_CHAINING OFF
GO
USE [final]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Insertpass]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_Insertpass]
	@Customer_id nvarchar(50),@Country_id nvarchar(50),@State_id nvarchar(50),@City_id nvarchar(50),@Service_id int,@Booklet_id int,@Pin int,@Issue_Date Date,@Expiry_Date date,
	@Passport_Number nvarchar(255)
AS
BEGIN
	Insert into Applypassport values(@Customer_id,@Country_id,@State_id,@City_id,@Service_id,@Booklet_id,@Pin,@Issue_Date,@Expiry_Date,@Passport_Number)
	
END
GO
/****** Object:  Table [dbo].[Servicetype]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicetype](
	[service_id] [int] NOT NULL,
	[Service_type] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Servicetype] PRIMARY KEY CLUSTERED 
(
	[service_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer_Master]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Master](
	[Customer_id] [nvarchar](25) NOT NULL,
	[First_name] [nvarchar](25) NOT NULL,
	[Sur_name] [nvarchar](25) NOT NULL,
	[Gender] [nvarchar](25) NOT NULL,
	[Email_id] [nvarchar](25) NOT NULL,
	[DOB] [date] NOT NULL,
	[Address] [nvarchar](25) NOT NULL,
	[Contact_Number] [nvarchar](25) NOT NULL,
	[Apply_type] [nvarchar](25) NOT NULL,
	[Hint_Question] [nvarchar](100) NOT NULL,
	[Hint_Answer] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Customer_Master] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[country_id] [nvarchar](25) NOT NULL,
	[country_name] [nvarchar](25) NOT NULL,
	[occupation_id] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [nvarchar](25) NOT NULL,
	[city_name] [nvarchar](25) NOT NULL,
	[State_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booklettype]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booklettype](
	[booklet_id] [int] NOT NULL,
	[booklet_type] [nvarchar](25) NULL,
 CONSTRAINT [PK_Booklettype] PRIMARY KEY CLUSTERED 
(
	[booklet_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Insertvisacancel]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Insertvisacancel]
	@User_Id nvarchar(25),@Passport_No nvarchar(25),@visa_id nvarchar(25),@Doi date,@amount int
AS
BEGIN
	insert into Visa_cancellation values(@User_Id,@Passport_No,@visa_id,@Doi,@amount)
END
GO
/****** Object:  Table [dbo].[State]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[state_id] [nvarchar](25) NOT NULL,
	[state_name] [nvarchar](25) NOT NULL,
	[country_id] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Applicants_occupation]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicants_occupation](
	[occupation_id] [int] NOT NULL,
	[occupation_name] [nvarchar](25) NOT NULL,
	[Visa_permit_years] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Applicants_occupation] PRIMARY KEY CLUSTERED 
(
	[occupation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Sp_state]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_state]
	@cname nvarchar(50)
AS
BEGIN
	select * from State where country_id=@cname
END
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginValidate]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginValidate] 
	@username nvarchar(50),
	@password nvarchar(50)
	AS
BEGIN
	Select customer_id,Password from Customer_Master where Customer_id=@username and password=@password 
END
GO
/****** Object:  Table [dbo].[ApplyPassportModule]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplyPassportModule](
	[Userid] [nvarchar](25) NOT NULL,
	[Country] [nvarchar](25) NOT NULL,
	[State] [nvarchar](25) NOT NULL,
	[City] [nvarchar](25) NOT NULL,
	[Pin] [int] NOT NULL,
	[Typeofservices] [int] NOT NULL,
	[Booklettype] [int] NOT NULL,
	[issuedate] [date] NOT NULL,
	[Passport_id] [nvarchar](25) NOT NULL,
	[Expiry_date] [date] NOT NULL,
 CONSTRAINT [PK_ApplyPassportModule] PRIMARY KEY CLUSTERED 
(
	[Passport_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Re_Issue]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Re_Issue](
	[reason_for_issue] [nvarchar](100) NOT NULL,
	[user_id] [nvarchar](25) NOT NULL,
	[country_id] [nvarchar](25) NOT NULL,
	[state_id] [nvarchar](25) NOT NULL,
	[city_id] [nvarchar](25) NOT NULL,
	[service_id] [int] NOT NULL,
	[booklet_id] [int] NOT NULL,
	[issuedate] [date] NOT NULL,
	[Expiry_date] [date] NOT NULL,
	[Passport_Number] [nvarchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Apply_visa]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apply_visa](
	[user_id] [nvarchar](25) NOT NULL,
	[country_id] [nvarchar](25) NOT NULL,
	[occupation_id] [int] NOT NULL,
	[dateofapplication] [date] NOT NULL,
	[visa_id] [nvarchar](25) NOT NULL,
	[date_of_issue] [date] NOT NULL,
	[date_of_expiry] [decimal](18, 1) NOT NULL,
	[registration_cost] [int] NOT NULL,
 CONSTRAINT [PK_Apply_visa] PRIMARY KEY CLUSTERED 
(
	[visa_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Apply_visa] ON [dbo].[Apply_visa] 
(
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_country]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCedure [dbo].[sp_country]
	-- Add the parameters for the stored procedure here
AS
BEGIN
select * from Country;

END
GO
/****** Object:  StoredProcedure [dbo].[Sp_City]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_City]
	@ciname nvarchar(25)
AS
BEGIN
	select * from City where State_id=@ciname
END
GO
/****** Object:  StoredProcedure [dbo].[sp_insert]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_insert]
@Customer_id nvarchar(100),
@First_Name nvarchar(100),
@Sur_Name nvarchar(100),
@Gender nvarchar(10),
@EMAIL_id nvarchar(50),
@DOB date,
@Address nvarchar(255),
@Contact_Number nvarchar(10),
@Apply_Type nvarchar(255),
@Hint_Question nvarchar(255),
@Hint_Answer nvarchar(50),@Password nvarchar(50),@st nvarchar(100) out
as
BEGIN
	begin try
	insert into Customer_Master values (@Customer_id,@First_Name, @Sur_Name, @Gender,@EMAIL_id,@DOB,@Address
	,@Contact_Number,@Apply_Type,@Hint_Question,@Hint_Answer,@Password)
	set @st = 'Data Entered Sucessfully '
    end try
	
	begin catch
		if CHARINDEX('PK_Customer',ERROR_MESSAGE()) != 0
		set @st = 'Cannot have duplicate Customer'
		else
		set @st= ERROR_MESSAGE()
	end catch
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HVALIDATE]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_HVALIDATE]
@hint_qsn nvarchar(255),
@hint_ans nvarchar(255)

as
begin


select * from Customer_Master where Hint_Question=@hint_qsn and Hint_Answer=@hint_ans 

End
GO
/****** Object:  StoredProcedure [dbo].[sp_getOccupation]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getOccupation]
	
AS
BEGIN
	
	SELECT * from Applicants_occupation
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getCustid]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_getCustid]
	-- Add the parameters for the stored procedure here
	@ty nvarchar(4)
	
AS
BEGIN
	select Top 1 Substring(Customer_Id,6,4) from Customer_Master where substring(Customer_id,1,4)=@ty order by Customer_Id desc
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GenerateVisaId]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GenerateVisaId] 
	
AS
BEGIN
	select COUNT(*) from Apply_visa
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Cancellation]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Cancellation]
@user_id nvarchar(25),@visa_id nvarchar(25),@passport_id nvarchar(25),@doi date
AS
BEGIN	
	SELECT user_id=@user_id,visa_id=@visa_id,passport_id=@passport_id,date_of_issue=@doi from Apply_visa as av join applypassportmodule ap on av.user_id=ap.userid
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ApplyVisa]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ApplyVisa]
@User_id nvarchar(25),@Country_id nvarchar(25),@Occupation_id nvarchar(25),@dateofapplication date,@visa_id nvarchar(25) output,@date_of_issue date,@date_of_expiry decimal(18,1),@registration_cost int
AS
BEGIN

	insert into Apply_visa values(@User_id,@Country_id,@Occupation_id,@dateofapplication,@visa_id,@date_of_issue,@date_of_expiry,@registration_cost)
	
	
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_ApplyPassport]    Script Date: 04/23/2019 09:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_ApplyPassport]
	@Customer_id nvarchar(50),@Country_id nvarchar(50),@State_id nvarchar(50),@City_id nvarchar(50),
	@Service_id int,@Booklet_Id int,@Pin int,@Issue_Date date,@Expiry_Date date,@Passport_Number nvarchar(50)
AS
begin

	Insert into ApplyPassportModule values(@Customer_id,@Country_id,@State_id,@City_id,@Pin,@Service_id,@Booklet_Id,@Issue_Date,@Passport_Number,@Expiry_Date);
	




END
GO
/****** Object:  View [dbo].[visa_cancel]    Script Date: 04/23/2019 09:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[visa_cancel] as select user_id,date_of_issue,visa_id,Passport_id from Apply_visa av join ApplyPassportModule apm on av.user_id=apm.userid
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reissueid]    Script Date: 04/23/2019 09:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Reissueid] 
	
AS
BEGIN
	
	SELECT COUNT(*) from ApplyPassportModule
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_reissue]    Script Date: 04/23/2019 09:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Sp_reissue] 
	@Reason nvarchar(50),@Customer_id nvarchar(50),@Country_id nvarchar(50),
	@State_id nvarchar(50),@City_id nvarchar(50),
	@Service_id nvarchar(50),@Booklet_Id nvarchar(50),
	@Issue_Date date,@Expiry_Date Date,@Passport_Number nvarchar(50)
AS
BEGIN
	
	Insert into Re_Issue values(@Reason,@Customer_id,@Country_id,@State_id,@City_id,@Service_id,@Booklet_Id,@Issue_Date,@Expiry_Date,@Passport_Number)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Visacancelauth]    Script Date: 04/23/2019 09:43:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Visacancelauth]
@user_id nvarchar(25),@visa_id nvarchar(25),@passport_id nvarchar(25),@doi date
AS
BEGIN
	
	
	SELECT * from visa_cancel where user_id=@user_id and visa_id=@visa_id and passport_id=@passport_id and date_of_issue=@doi
END
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_Booklettype]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_Booklettype] FOREIGN KEY([Booklettype])
REFERENCES [dbo].[Booklettype] ([booklet_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_Booklettype]
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_City]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_City] FOREIGN KEY([City])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_City]
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_Country]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_Country] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_Country]
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_Customer_Master]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_Customer_Master] FOREIGN KEY([Userid])
REFERENCES [dbo].[Customer_Master] ([Customer_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_Customer_Master]
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_Servicetype]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_Servicetype] FOREIGN KEY([Typeofservices])
REFERENCES [dbo].[Servicetype] ([service_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_Servicetype]
GO
/****** Object:  ForeignKey [FK_ApplyPassportModule_State]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[ApplyPassportModule]  WITH CHECK ADD  CONSTRAINT [FK_ApplyPassportModule_State] FOREIGN KEY([State])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[ApplyPassportModule] CHECK CONSTRAINT [FK_ApplyPassportModule_State]
GO
/****** Object:  ForeignKey [FK_Re_Issue_Booklettype]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_Booklettype] FOREIGN KEY([booklet_id])
REFERENCES [dbo].[Booklettype] ([booklet_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_Booklettype]
GO
/****** Object:  ForeignKey [FK_Re_Issue_City]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_City]
GO
/****** Object:  ForeignKey [FK_Re_Issue_Country]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_Country]
GO
/****** Object:  ForeignKey [FK_Re_Issue_Customer_Master]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_Customer_Master] FOREIGN KEY([user_id])
REFERENCES [dbo].[Customer_Master] ([Customer_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_Customer_Master]
GO
/****** Object:  ForeignKey [FK_Re_Issue_Servicetype]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_Servicetype] FOREIGN KEY([service_id])
REFERENCES [dbo].[Servicetype] ([service_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_Servicetype]
GO
/****** Object:  ForeignKey [FK_Re_Issue_State]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Re_Issue]  WITH CHECK ADD  CONSTRAINT [FK_Re_Issue_State] FOREIGN KEY([state_id])
REFERENCES [dbo].[State] ([state_id])
GO
ALTER TABLE [dbo].[Re_Issue] CHECK CONSTRAINT [FK_Re_Issue_State]
GO
/****** Object:  ForeignKey [FK_Apply_visa_Applicants_occupation]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Apply_visa]  WITH CHECK ADD  CONSTRAINT [FK_Apply_visa_Applicants_occupation] FOREIGN KEY([occupation_id])
REFERENCES [dbo].[Applicants_occupation] ([occupation_id])
GO
ALTER TABLE [dbo].[Apply_visa] CHECK CONSTRAINT [FK_Apply_visa_Applicants_occupation]
GO
/****** Object:  ForeignKey [FK_Apply_visa_Country]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Apply_visa]  WITH CHECK ADD  CONSTRAINT [FK_Apply_visa_Country] FOREIGN KEY([country_id])
REFERENCES [dbo].[Country] ([country_id])
GO
ALTER TABLE [dbo].[Apply_visa] CHECK CONSTRAINT [FK_Apply_visa_Country]
GO
/****** Object:  ForeignKey [FK_Apply_visa_Customer_Master]    Script Date: 04/23/2019 09:43:29 ******/
ALTER TABLE [dbo].[Apply_visa]  WITH CHECK ADD  CONSTRAINT [FK_Apply_visa_Customer_Master] FOREIGN KEY([user_id])
REFERENCES [dbo].[Customer_Master] ([Customer_id])
GO
ALTER TABLE [dbo].[Apply_visa] CHECK CONSTRAINT [FK_Apply_visa_Customer_Master]
GO
