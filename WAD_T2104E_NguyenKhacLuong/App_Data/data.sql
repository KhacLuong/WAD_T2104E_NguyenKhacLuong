USE [master]
GO


CREATE DATABASE [DB_T2104E_NguyenKhacLuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_T2104E_NguyenKhacLuong', FILENAME = N'D:\Ky3\C#\WAD\WAD_T2104E_NguyenKhacLuong\WAD_T2104E_NguyenKhacLuong\App_Data\DB_T2104E_NguyenKhacLuong.mdf')
 LOG ON 
( NAME = N'DB_T2104E_NguyenKhacLuong_log', FILENAME = N'D:\Ky3\C#\WAD\WAD_T2104E_NguyenKhacLuong\WAD_T2104E_NguyenKhacLuong\App_Data\DB_T2104E_NguyenKhacLuong_log.ldf')
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_T2104E_NguyenKhacLuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

USE [DB_T2104E_NguyenKhacLuong]
GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Category](
	[CotegoryId] [int] IDENTITY(1,1) NOT NULL,
	[CotegoryName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CotegoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [DB_T2104E_NguyenKhacLuong]
GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quanlity] [int] NOT NULL,
	[ReleaseDate] [date] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Product]  WITH NOCHECK ADD  CONSTRAINT [FK_Product_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CotegoryId])
GO

ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product]
GO
