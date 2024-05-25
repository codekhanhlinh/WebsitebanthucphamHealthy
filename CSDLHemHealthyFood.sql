USE [master]
GO
/****** Object:  Database [CSDLHemHealthyFood]    Script Date: 03/12/2023 11:19:57 CH ******/
CREATE DATABASE [CSDLHemHealthyFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CSDLHemHealthyFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSDLHemHealthyFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CSDLHemHealthyFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CSDLHemHealthyFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CSDLHemHealthyFood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CSDLHemHealthyFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET  MULTI_USER 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CSDLHemHealthyFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CSDLHemHealthyFood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CSDLHemHealthyFood] SET QUERY_STORE = OFF
GO
USE [CSDLHemHealthyFood]
GO
/****** Object:  Table [dbo].[CTHoaDonBan]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHoaDonBan](
	[MaHD] [nchar](6) NOT NULL,
	[MaSP] [nchar](6) NOT NULL,
	[SLDat] [int] NULL,
	[Dvt] [nvarchar](10) NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaPN] [nchar](6) NOT NULL,
	[MaNL] [nchar](6) NOT NULL,
	[SLNhap] [int] NULL,
	[Dvt] [nchar](10) NULL,
	[GiaNhap] [float] NULL,
	[ThanhTien] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonBan]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBan](
	[MaHD] [nchar](6) NOT NULL,
	[MaNV] [nchar](6) NULL,
	[MaKH] [nchar](6) NULL,
	[NgayDat] [date] NULL,
	[PTTT] [nvarchar](30) NULL,
	[TongTienHD] [float] NULL,
	[TinhTrang] [nvarchar](30) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [nchar](6) NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[SDTKH] [nchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoNL]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoNL](
	[MaNL] [nchar](6) NOT NULL,
	[TenNL] [nvarchar](50) NULL,
	[SLHienCo] [int] NULL,
	[Dvt] [nchar](10) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhoNL] PRIMARY KEY CLUSTERED 
(
	[MaNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLSP] [nchar](6) NOT NULL,
	[TenLSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nchar](6) NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[SDT] [nchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](6) NOT NULL,
	[HoTenNV] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](10) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[NgayVaoLam] [date] NOT NULL,
	[ChucVu] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [nchar](6) NOT NULL,
	[MaNV] [nchar](6) NULL,
	[MaNCC] [nchar](6) NULL,
	[NgayNhap] [date] NULL,
	[TongPN] [float] NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nchar](6) NOT NULL,
	[MaLSP] [nchar](6) NULL,
	[TenSP] [nvarchar](50) NULL,
	[Dvt] [nvarchar](30) NULL,
	[Gia] [int] NULL,
	[SLHienCo] [int] NULL,
	[NSX] [datetime] NULL,
	[HSD] [nvarchar](30) NULL,
	[ThanhPhan] [nvarchar](50) NULL,
	[TrongLuong] [nchar](10) NULL,
	[Hinh] [text] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoanKH]    Script Date: 03/12/2023 11:19:57 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanKH](
	[MaTK] [nchar](6) NOT NULL,
	[MaKH] [nchar](6) NOT NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nchar](30) NULL,
 CONSTRAINT [PK_TaiKhoanKH] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD01  ', N'SP0001', 2, N'chai', 25000, 50000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD01  ', N'SP0002', 2, N'chai', 25000, 50000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD01  ', N'SP0013', 2, N'hộp', 55000, 110000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD02  ', N'SP0003', 1, N'chai', 25000, 25000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD02  ', N'SP0004', 2, N'chai', 25000, 50000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD03  ', N'SP0020', 3, N'hộp', 55000, 165000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD03  ', N'SP0013', 3, N'hộp', 55000, 165000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD04  ', N'SP0008', 5, N'chai', 20000, 100000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD04  ', N'SP0019', 3, N'túi', 75000, 225000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD04  ', N'SP0024', 5, N'hộp', 35000, 175000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD05  ', N'SP0016', 10, N'hộp', 55000, 550000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD06  ', N'SP0009', 2, N'hộp', 55000, 110000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD06  ', N'SP0016', 5, N'hộp', 55000, 275000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD07  ', N'SP0022', 10, N'hộp', 75000, 750000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD07  ', N'SP0005', 2, N'chai', 20000, 40000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD08  ', N'SP0018', 10, N'túi', 95000, 950000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD09  ', N'SP0003', 5, N'chai', 25000, 125000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD10  ', N'SP0023', 15, N'hộp', 75000, 1125000)
INSERT [dbo].[CTHoaDonBan] ([MaHD], [MaSP], [SLDat], [Dvt], [DonGia], [ThanhTien]) VALUES (N'HD11  ', N'SP0001', 3, N'chai', 25000, 75000)
GO
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN001 ', N'NL001 ', 15, N'Kg        ', 65000, 825000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN001 ', N'NL002 ', 10, N'Kg        ', 50000, 500000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN002 ', N'NL003 ', 15, N'Kg        ', 15000, 225000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN002 ', N'NL004 ', 12, N'Kg        ', 85000, 1020000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN003 ', N'NL003 ', 20, N'Kg        ', 15000, 300000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN004 ', N'NL004 ', 10, N'Kg        ', 85000, 850000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN004 ', N'NL005 ', 30, N'Kg        ', 20000, 600000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN004 ', N'NL006 ', 10, N'Kg        ', 20000, 200000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN005 ', N'NL007 ', 20, N'Kg        ', 10000, 200000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN006 ', N'NL008 ', 5, N'Kg        ', 25000, 125000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN007 ', N'NL010 ', 15, N'Kg        ', 50000, 750000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN008 ', N'NL011 ', 5, N'Kg        ', 120000, 600000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN007 ', N'NL009 ', 15, N'Kg        ', 29000, 435000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN008 ', N'NL012 ', 10, N'Hộp       ', 45000, 450000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN009 ', N'NL019 ', 200, N'Hộp       ', 8000, 1600000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN010 ', N'NL020 ', 200, N'Chai      ', 6000, 1200000)
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaNL], [SLNhap], [Dvt], [GiaNhap], [ThanhTien]) VALUES (N'PN011 ', N'NL001 ', 1, NULL, 65000, 65000)
GO
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD01  ', N'NV001 ', N'KH0001', CAST(N'2023-11-25' AS Date), N'Ví MoMo', 210000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD02  ', N'NV001 ', N'KH0002', CAST(N'2023-11-25' AS Date), N'Ví ZaloPay', 75000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD03  ', N'NV001 ', N'KH0003', CAST(N'2023-11-25' AS Date), N'Ví ZaloPay', 330000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD04  ', N'NV002 ', N'KH0004', CAST(N'2023-11-25' AS Date), N'Ví MoMo', 500000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD05  ', N'NV002 ', N'KH0005', CAST(N'2023-11-26' AS Date), N'Ví ZaloPay', 550000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD06  ', N'NV002 ', N'KH0006', CAST(N'2023-11-26' AS Date), N'Ví MoMo', 385000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD07  ', N'NV002 ', N'KH0007', CAST(N'2023-11-26' AS Date), N'Ví MoMo', 790000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD08  ', N'NV002 ', N'KH0006', CAST(N'2023-11-27' AS Date), N'Chuyển ngân hàng', 950000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD09  ', N'NV003 ', N'KH0007', CAST(N'2023-11-27' AS Date), N'Ví ZaloPay', 125000, N'Đã giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD10  ', N'NV003 ', N'KH0008', CAST(N'2023-11-27' AS Date), N'Chuyển ngân hàng', 1125000, N'Đang giao')
INSERT [dbo].[HoaDonBan] ([MaHD], [MaNV], [MaKH], [NgayDat], [PTTT], [TongTienHD], [TinhTrang]) VALUES (N'HD11  ', N'NV003 ', N'KH0016', CAST(N'2023-11-30' AS Date), N'Ví MoMo', 75000, N'Đã giao')
GO
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0001', N'Dương Hoàng Anh', N'Nữ', N'0989256320', N'hoanganhduong@gmail.com', N'A15/1 Xô Viết Nghệ Tĩnh - q.Bình Thạnh - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0002', N'Phan Anh Đào', N'Nữ', N'0705322222', N'daoanhphan@gmail.com', N'98 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0003', N'Lê Tuấn Nam', N'Nam', N'0345678923', N'letuannam@gmail.com', N'564/1/3F Nguyễn Xí - Bình Thạnh - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0004', N'Trần Anh Thư', N'Nữ', N'0986753411', N'thuthutran@gmail.com', N'100 Đỗ Xuân Hợp, TP.Thủ Đức, TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0005', N'Phan Nhật Long', N'Nam', N'0357890123', N'longlongnhatphan@gmail.com', N'2/1A Quang Trung - p.10 - GV - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0006', N'Phùng Minh Thi', N'Nữ', N'0325558916', N'thithiphung@gmail.com', N'65 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0007', N'Trần Vi Vân', N'Nữ', N'0986753421', N'maymaytran@gmail.com', N'22 Khu Dân Cư An Bình')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0008', N'Đỗ Anh Kiệt', N'Nam', N'0985673434', N'kietanhdo@gmail.com', N'90 Lê Lợi - q.2 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0009', N'Đỗ Trúc Anh', N'Nữ', N'0343338146', N'anhtructran@gmail.com', N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0010', N'Lê Thị Mỹ Linh', N'Nữ', N'0357890165', N'linhlinhmy@gmail.com', N'100 Võ Văn Ngân - TP.Thủ Đức - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0011', N'Huỳnh Quốc Dương', N'Nam', N'0257893214', N'duonghuynhquoc@gmail.com', N'20 Bạch Đằng - q.1 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0012', N'Thái Hà Vy', N'Nữ', N'0357890145', N'vyvythaiha@gmai.com', N'9 Nguyễn Văn Linh - q.7 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0013', N'Đoàn Thiên Ân', N'Nữ', N'0987876534', N'ananthiendoan@gmail.com', N'29 Võ Văn Ngân - TP.Thủ Đức - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0014', N'Phan Tú Trinh', N'Nữ', N'0989256320', N'trinhphantu@gmail.com', N'253 Nguyễn Văn Linh - q.7 - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0015', N'Nguyễn Khoa Minh', N'Nam', N'0358888520', N'minhkhoakhoa@gmail.com', N'5 Dương Quảng hàm - q.Gò Vấp - TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTenKH], [GioiTinh], [SDTKH], [Email], [DiaChi]) VALUES (N'KH0016', N'Nguyễn Trần Khánh Linh', N'Nữ', N'0332228146', N'linhnguyen@gmail.com', N'441 Lê Văn Việt, thành phố Thủ Đức, TP.HCM')
GO
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL001 ', N'Táo mỹ', 50, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL002 ', N'Bơ ', 45, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL003 ', N'Chuối', 5, N'Trái      ', N'Gần hết')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL004 ', N'Kiwi', 45, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL005 ', N'Dưa gang', 25, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL006 ', N'Cà rốt', 30, N'Củ        ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL007 ', N'Bắp', 45, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL008 ', N'Cà chua', 44, N'Trái      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL009 ', N'Dâu', 0, N'Hộp       ', N'Hết')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL010 ', N'Ức gà', 15, N'Túi       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL011 ', N'Bò', 15, N'Túi       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL012 ', N'Chà bông ăn kiêng', 25, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL013 ', N'Rong biển', 20, N'Túi       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL014 ', N'Nui gạo lứt', 25, N'Bịch      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL015 ', N'Sữa chua', 50, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL016 ', N'Sữa đặc ăn kiêng', 35, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL017 ', N'Hạt óc chó', 35, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL018 ', N'Hạt ngũ cốc', 35, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL019 ', N'Hộp nhựa', 100, N'Hộp       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL020 ', N'Chai nhựa', 100, N'Chai      ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL021 ', N'Gạo lứt', 50, N'Túi       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL022 ', N'Củ dền', 20, N'Củ        ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL023 ', N'Đậu bắp', 15, N'Kg        ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL024 ', N'Trứng gà', 30, N'Qủa       ', N'Còn')
INSERT [dbo].[KhoNL] ([MaNL], [TenNL], [SLHienCo], [Dvt], [TinhTrang]) VALUES (N'NL025 ', N'Su su', 12, N'Củ        ', N'Gần hết')
GO
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP]) VALUES (N'LSP001', N'Sinh tố / Nước ép')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP]) VALUES (N'LSP002', N'Ngũ cốc')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP]) VALUES (N'LSP003', N'Salad')
INSERT [dbo].[LoaiSP] ([MaLSP], [TenLSP]) VALUES (N'LSP004', N'Cơm')
GO
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC001', N'Organica Nguyễn Đình Chiểu', N'02866733350', N'muahang@thucphamhuuco.vn', N'Số 24 Đường Nguyễn Quý Đức, Phường An Phú, TP. Thủ Đức, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC002', N'Cầu Đất Farm', N'18001192   ', N'info@caudatfarm.com', N'313 Nguyễn Thị Thập, Phường Tân Phú, Quận 7, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC003', N'Cửa hàng thực phẩm 3 Sạch', N'02873003111', N'order@3sachfood.vn', N'Số 26 Hoàng Diệu, Phường 12, Quận 4, TP. HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC004', N'Công Ty TNHH Vương Linh', N'02839916405', N' info@koreaking.com.vn', N'333/12/7 Lê Văn Sỹ, P. 1, Q. Tân Bình, TP.HCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC005', N'Công Ty TNHH Gạo Ngon Nhất', N'0907805656 ', N'gaongonnhatst25@gmail.com', N' 11/22 Đường 10, KP. 3, P. Bình Thuận, Q. 7, TPHCM')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SDT], [Email], [DiaChi]) VALUES (N'NCC006', N'Nông Sản Galaxy Agro', N'0919729288 ', N'nancy@galaxy-vn.com', N'Số 14/16, Đường 990, Khu Phố 4, Phường Phú Hữu, Quận 9, TPHCM')
GO
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV001 ', N'Nguyễn Phương Anh', N'Nữ', CAST(N'2000-01-16' AS Date), N'0378904567', N'phuonganh@gmail.com', N'127 Nguyễn Văn Linh - q.7 - TP.HCM', CAST(N'2022-06-20' AS Date), N'Kiểm duyệt đơn')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV002 ', N'Vũ Lạnh Cường', N'Nam', CAST(N'2002-09-20' AS Date), N'0324789021', N'cuongvu@gmail.com', N'28 Đỗ Xuân Hợp - TP.Thủ Đức - TP.HCM', CAST(N'2022-06-20' AS Date), N'Kiểm duyệt đơn')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV003 ', N'Nguyễn Ngọc Thy', N'Nữ', CAST(N'1999-12-13' AS Date), N'0867865789', N'thynguyenngoc@gmail.com', N'27 Nguyễn Tất Thành - q.3 - TP.HCM', CAST(N'2022-06-20' AS Date), N'Kiểm duyệt đơn')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV004 ', N'Cao Tiến Phát', N'Nam', CAST(N'2002-08-04' AS Date), N'0334567891', N'phattiencao@gmail.com', N'127 Nguyễn Văn Linh - q.7 - TP.HCM', CAST(N'2022-06-20' AS Date), N'Chuẩn bị hàng')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV005 ', N'Nguyễn Ngọc Bội', N'Nữ', CAST(N'2000-01-29' AS Date), N'0359785643', N'boiboi@gmail.com', N'100 Đỗ Xuân Hợp - Thủ Đức - HCM', CAST(N'2022-10-18' AS Date), N'Chuẩn bị hàng')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV006 ', N'Phan Thị Hương Bình', N'Nữ', CAST(N'1996-04-03' AS Date), N'0987894561', N'binhhuongphan@gmail.com', N'98 Nam Kỳ Khởi Nghĩa -q.3 - TP.HCM', CAST(N'2022-10-18' AS Date), N'Kế toán')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV007 ', N'Nguyễn Trần Tín', N'Nam', CAST(N'2002-07-09' AS Date), N'0987650921', N'tinnguyentran@gmail.com', N'100 Võ Văn Ngân - TP.Thủ Đức - TP.HCM', CAST(N'2022-10-18' AS Date), N'Kho')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV008 ', N'Nguyễn Vũ Khoa', N'Nam', CAST(N'1997-12-12' AS Date), N'0367659034', N'vukhoangyn@gmail.com', N'253 Nguyễn Văn Linh - q.7 - TP.HCM', CAST(N'2022-10-18' AS Date), N'Kho')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV009 ', N'Nguyễn Như Mai', N'Nữ', CAST(N'2003-08-09' AS Date), N'0345679098', N'maimai@gmail.com', N'123A Nguyễn Kiệm - q. Gò Vấp - TP.HCM', CAST(N'2023-07-17' AS Date), N'Kho')
INSERT [dbo].[NhanVien] ([MaNV], [HoTenNV], [GioiTinh], [NgaySinh], [SDT], [Email], [DiaChi], [NgayVaoLam], [ChucVu]) VALUES (N'NV010 ', N'Đào Tiến Đạt', N'Nam', CAST(N'1991-10-29' AS Date), N'0358923978', N'daotiendatt@gmail.com', N'2/1A Quang Trung - p.10 - GV - TP.HCM', CAST(N'2023-07-17' AS Date), N'Quản lý')
GO
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN001 ', N'NV007 ', N'NCC001', CAST(N'2023-11-01' AS Date), 1325000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN002 ', N'NV007 ', N'NCC002', CAST(N'2023-11-10' AS Date), 1245000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN003 ', N'NV008 ', N'NCC002', CAST(N'2023-11-20' AS Date), 300000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN004 ', N'NV008 ', N'NCC002', CAST(N'2023-11-24' AS Date), 1650000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN005 ', N'NV009 ', N'NCC003', CAST(N'2023-11-26' AS Date), 200000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN006 ', N'NV009 ', N'NCC006', CAST(N'2023-11-26' AS Date), 125000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN007 ', N'NV009 ', N'NCC006', CAST(N'2023-11-26' AS Date), 1185000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN008 ', N'NV007 ', N'NCC006', CAST(N'2023-11-27' AS Date), 1050000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN009 ', N'NV007 ', N'NCC004', CAST(N'2023-11-27' AS Date), 1600000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN010 ', N'NV007 ', N'NCC004', CAST(N'2023-11-27' AS Date), 1200000)
INSERT [dbo].[PhieuNhap] ([MaPN], [MaNV], [MaNCC], [NgayNhap], [TongPN]) VALUES (N'PN011 ', N'NV001 ', N'NCC001', CAST(N'2023-03-12' AS Date), 65000)
GO
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0001', N'LSP001', N'Sinh tố bơ + chuối', N'chai', 25000, 30, CAST(N'2023-11-17T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Bơ, chuối, sữa đặc ăn kiêng', N'400ml     ', N'https://i.pinimg.com/564x/63/9e/1a/639e1a8622a2b36984b2abe188b0d520.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0002', N'LSP001', N'Sinh tố chuối', N'chai', 25000, 30, CAST(N'2023-11-17T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Chuối, sữa đặc ăn kiêng', N'400ml     ', N'https://img.tastykitchen.vn/resize/764x-/2021/04/27/cach-lam-sinh-to-chuoi-truyen-thong-0f24.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0003', N'LSP001', N'Sinh tố dưa gang', N'chai', 25000, 30, CAST(N'2023-11-17T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Dưa gang, sữa đặc hạnh nhân', N'400ml     ', N'https://i.pinimg.com/564x/39/ad/7d/39ad7d0317bec827f803f3a52d553436.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0004', N'LSP001', N'Sinh tố bơ', N'chai', 25000, 30, CAST(N'2023-11-17T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Bơ, hạt óc chó, sữa đặc ăn kiêng', N'400ml     ', N'https://i.pinimg.com/564x/00/41/50/00415004ffebff59a5cac5585e27b6da.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0005', N'LSP001', N'Nước ép cà rốt', N'chai', 20000, 30, CAST(N'2023-11-17T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Cà rốt, nước lọc', N'400ml     ', N'https://i.pinimg.com/564x/75/fe/a3/75fea36c47ccb637cbb61803e2eff5c5.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0006', N'LSP001', N'Nước ép dền + táo', N'chai', 20000, 30, CAST(N'2023-11-18T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Củ dền, táo xanh, nước lọc', N'400ml     ', N'https://i.pinimg.com/564x/5d/0d/de/5d0ddee7c55297a3ad4c9034f0830ccc.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0007', N'LSP001', N'Sinh tố Kiwi', N'chai', 25000, 30, CAST(N'2023-11-18T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Kiwi, sữa đặc ăn kiêng', N'400ml     ', N'https://i.pinimg.com/564x/20/57/92/205792cb75bd0b7ef45d4bea28e4b020.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0008', N'LSP001', N'Sinh tố rau dền', N'chai', 25000, 30, CAST(N'2023-11-18T06:00:00.000' AS DateTime), N'Trong vòng 24g kể từ NSX', N'Rau dền, nước lọc, 2% đường ăn kiêng', N'400ml     ', N'https://i.pinimg.com/564x/06/76/9a/06769a473d23a9fb030f52272376e5f7.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0009', N'LSP003', N'Salad cá hồi + bơ + dưa leo + cà chua', N'hộp', 55000, 25, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Cá hồi, bơ, dưa leo, cà chua, sốt chua ngọt', N'75g       ', N'https://i.pinimg.com/564x/cc/47/45/cc474537618ae14f3d62ff718641c491.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0010', N'LSP003', N'Salad ức gà + bơ + trứng luộc', N'hộp', 55000, 15, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Ức gà, trứng gà, bơ, sốt chua ngọt', N'75g       ', N'https://i.pinimg.com/564x/41/c1/e1/41c1e126c8933bd0f723a06ebb109177.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0011', N'LSP003', N'Salad tôm + bơ', N'hộp', 55000, 15, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Tôm , bơ, sốt trứng muối', N'75g       ', N'https://i.pinimg.com/564x/74/a5/48/74a548d6260b81bcd451636c87e9fea2.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0012', N'LSP003', N'Salad gà + bắp + bơ + cà chua', N'hộp', 55000, 20, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Gà, bắp, bơ, cà chua, sốt chua ngọt', N'75g       ', N'https://i.pinimg.com/564x/bc/45/69/bc456996cf0c4d662368482a62bcbfd3.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0013', N'LSP003', N'Salad ức gà + táo + dâu', N'hộp', 55000, 15, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Ức gà, táo đỏ, dâu, sốt chua ngọt', N'75g       ', N'https://i.pinimg.com/564x/cb/a3/55/cba3556a5db83e26baf936e0cea91851.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0014', N'LSP003', N'Salad gà xé sợi + nui luộc+ bơ + cà chua', N'hộp', 55000, 20, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Gà, nui, bơ, cà chua, sốt chua ngọt', N'75g       ', N'https://i.pinimg.com/564x/a6/3e/3d/a63e3dc0b1851af3559a4feb1de8cc35.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0015', N'LSP003', N'Salad bơ + đào + hạt óc chó', N'hộp', 55000, 15, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Bơ, đào, hạt óc chó, sốt chanh dây', N'75g       ', N'https://i.pinimg.com/564x/ad/58/b6/ad58b6a524f3f0fbee19383db72a60c0.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0016', N'LSP003', N'Salad thập cẩm', N'hộp', 55000, 20, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'1 đến 2 ngày kể từ NSX', N'Gà, Bò, bơ, cà chua, dưa leo, sốt chanh dây', N'75g       ', N'https://i.pinimg.com/564x/f5/09/44/f509447f75a554d4249a21f48c5b792a.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0017', N'LSP002', N'Thanh ngũ cốc chà bông', N'túi', 85000, 30, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'2-3 tuần kể từ NSX', N'Gạo lứt, chà bông, hạnh nhân, yến mạch', N'250g      ', N'https://lzd-img-global.slatic.net/g/p/dabaa48493976276eff7c2ebf2413820.jpg_720x720q80.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0018', N'LSP002', N'Thanh ngũ cốc các loại hạt', N'túi', 95000, 25, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'2-3 tuần kể từ NSX', N'Gạo lứt, hạnh nhân, yến mạch, óc chó', N'250g      ', N'https://bizweb.dktcdn.net/thumb/grande/100/449/089/products/thanh-gao-lut-ngu-coc-an-kieng-gufoods-vi-y-3c41020b-a94f-45e4-9422-b47e338d0a20.png?v=1653880546423')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0019', N'LSP002', N'Thanh ngũ cốc rong biển', N'túi', 75000, 15, CAST(N'2023-11-19T06:00:00.000' AS DateTime), N'2-3 tuần kể từ NSX', N'Gạo lứt, rong biển, hạnh nhân, yến mạch', N'250g      ', N'https://vn-live-01.slatic.net/p/ba7773ad809b873388486c74c2205a70.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0020', N'LSP004', N'Cơm gạo lứt+ tôm + bông cải xanh', N'hộp', 55000, 15, CAST(N'2023-11-20T06:00:00.000' AS DateTime), N'1 ngày kể NSX', N'Gạo lứt, tôm, bông cải xanh, cà rốt', N'75g       ', N'https://file.hstatic.net/1000301274/file/1_6bb43d22bf9f4840a74766e3bb4cb6ad_grande.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0021', N'LSP004', N'Cơm gạo lứt + ức gà + đậu bắp', N'hộp', 55000, 10, CAST(N'2023-11-20T06:00:00.000' AS DateTime), N'1 ngày kể NSX', N'Gạo lứt, ức gà, đậu bắp, sốt chua ngọt', N'75g       ', N'https://y5kbp0ifnvobj.vcdn.cloud/uploads/filecloud/2019/December/24/4639-360491577181575-1577181575.png')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0022', N'LSP004', N'Cơm gạo lứt + cà hồi + susu', N'hộp', 75000, 15, CAST(N'2023-11-20T06:00:00.000' AS DateTime), N'1 ngày kể NSX', N'Gạo lứt, cà hồi, cà chua, susu', N'75g       ', N'https://giadinh.mediacdn.vn/296230595582509056/2022/4/15/2779773772937053029218217668960659855276504n-16500298183321950868565.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0023', N'LSP004', N'Cơm gạo lứt thập cẩm', N'hộp', 75000, 14, CAST(N'2023-11-20T06:00:00.000' AS DateTime), N'1 ngày kể NSX', N'Gạo lứt, ức gà, tôm, trứng, rau', N'80g       ', N'https://img.tastykitchen.vn/resize/764x-/2021/03/31/thuong-thuc-com-gao-lut-nau-tom-va-salad-4-1-7764.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaLSP], [TenSP], [Dvt], [Gia], [SLHienCo], [NSX], [HSD], [ThanhPhan], [TrongLuong], [Hinh]) VALUES (N'SP0024', N'LSP002', N'Ngũ cốc sữa chua hạt', N'hộp', 35000, 12, CAST(N'2023-11-20T06:00:00.000' AS DateTime), N'1 đến 2ngày kể NSX', N'Sữa chua, kiwi, chuối, hạt ngũ cốc', N'75g       ', N'https://bizweb.dktcdn.net/100/357/495/articles/banh-ngu-coc-an-kieng-baker-baking-blog-16.jpg?v=1602663346800')
GO
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH01', N'KH0001', N'hoanganh', N'hoanganh111                   ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH02', N'KH0002', N'panhdao', N'anhdao222                     ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH03', N'KH0003', N'letuannam', N'tuannam2003                   ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH04', N'KH0004', N'anhthu', N'anhthu2004                    ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH05', N'KH0005', N'longnhat', N'long456                       ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH06', N'KH0006', N'thiphungminh', N'minhthi28                     ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH07', N'KH0007', N'trvivan', N'vivi567                       ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH08', N'KH0008', N'anhkietd', N'kiet2003                      ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH09', N'KH0009', N'dotrucanh', N'trucanh000                    ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH10', N'KH0010', N'mylinhle', N'mylinh222                     ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH11', N'KH0011', N'duonghuynh', N'quocduong06                   ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH12', N'KH0012', N'havyth', N'thaihavy2023                  ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH13', N'KH0013', N'anthien', N'anan2011                      ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH14', N'KH0014', N'tutrinhph', N'tutrinh1712                   ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH15', N'KH0015', N'minhkhnguyen', N'khoa2002                      ')
INSERT [dbo].[TaiKhoanKH] ([MaTK], [MaKH], [TenDN], [MatKhau]) VALUES (N'TKKH16', N'KH0016', N'LinhNguyen', N'linhkhanh                     ')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SanPham]    Script Date: 03/12/2023 11:19:57 CH ******/
CREATE NONCLUSTERED INDEX [IX_SanPham] ON [dbo].[SanPham]
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_CTHDB_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDonBan] ([MaHD])
GO
ALTER TABLE [dbo].[CTHoaDonBan] CHECK CONSTRAINT [FK_CTHDB_HoaDon]
GO
ALTER TABLE [dbo].[CTHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_CTHDB_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTHoaDonBan] CHECK CONSTRAINT [FK_CTHDB_SanPham]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_PhieuNhap] FOREIGN KEY([MaNL])
REFERENCES [dbo].[KhoNL] ([MaNL])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_PhieuNhap]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhap_PhieuNhap1] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [FK_CTPhieuNhap_PhieuNhap1]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonBan_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonBan] CHECK CONSTRAINT [FK_HoaDonBan_NhanVien]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhaCungCap]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSP] FOREIGN KEY([MaLSP])
REFERENCES [dbo].[LoaiSP] ([MaLSP])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSP]
GO
ALTER TABLE [dbo].[TaiKhoanKH]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanKH_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[TaiKhoanKH] CHECK CONSTRAINT [FK_TaiKhoanKH_KhachHang]
GO
USE [master]
GO
ALTER DATABASE [CSDLHemHealthyFood] SET  READ_WRITE 
GO
