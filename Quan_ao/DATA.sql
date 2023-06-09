USE [_Ban_Quan_ao_demo3]
GO
/****** Object:  Table [dbo].[Chi_tiet_SP]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chi_tiet_SP](
	[Ma_Size_Color] [int] IDENTITY(1,1) NOT NULL,
	[MaMau] [int] NULL,
	[MaSize] [int] NULL,
	[SoLuong] [int] NULL,
	[MaSP_ID] [int] NULL,
	[MaNCC] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ma_Size_Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc_SP]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc_SP](
	[MaDMSP] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NULL,
	[TenMuc] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDMSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TongTien] [int] NULL,
	[MaTK] [int] NULL,
	[DiaChi] [nvarchar](500) NULL,
	[NgayDat] [datetime] NULL,
	[XacNhan] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAUSAC]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAUSAC](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCC]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCC](
	[MaNhaCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNhaCC] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP_ID] [int] IDENTITY(1,1) NOT NULL,
	[MaDMSP] [int] NULL,
	[TenSP] [nvarchar](200) NULL,
	[Gia] [int] NULL,
	[TinhTrang] [bit] NULL,
	[URL_Hinh_Anh] [nvarchar](200) NULL,
	[NhanXet] [nvarchar](max) NULL,
	[DanhGia] [int] NULL,
	[LuotMua] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham_Mua]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_Mua](
	[MaSP_Mua] [int] IDENTITY(1,1) NOT NULL,
	[MaSP_ID] [int] NULL,
	[MaHoaDon] [int] NULL,
	[SoLuong] [int] NULL,
	[masize] [int] NULL,
	[mamau] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP_Mua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SIZE]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SIZE](
	[MaSize] [int] IDENTITY(1,1) NOT NULL,
	[Size] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/16/2023 10:59:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[TenTK] [nvarchar](100) NULL,
	[MatKhauTk] [varchar](100) NULL,
	[PhanCap] [bit] NULL,
	[SDT] [int] NULL,
	[Email] [varchar](100) NULL,
	[TenNguoiDung] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chi_tiet_SP] ON 

INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (1, 1, 1, 12, 1, 1)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (2, 1, 2, 34, 13, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (3, 1, 3, 121, 13, 3)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (4, 2, 1, 125, 1, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (5, 2, 2, 232, 1, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (6, 2, 3, 34, 1, 3)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (7, 1, 1, 162, 2, 4)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (8, 1, 2, 62, 14, 1)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (9, 1, 3, 76, 14, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (10, 2, 1, 12, 2, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (11, 2, 3, 32, 2, 4)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (12, 2, 5, 47, 2, 5)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (13, 3, 1, 12, 3, 6)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (14, 4, 2, 34, 3, 4)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (16, 1, 4, 125, 4, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (18, 5, 2, 34, 6, 5)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (19, 3, 5, 162, 9, 6)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (20, 1, 1, 62, 9, 3)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (21, 5, 4, 76, 10, 3)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (22, 3, 3, 12, 10, 5)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (23, 1, 5, 32, 11, 2)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (24, 4, 5, 47, 12, 4)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (25, 2, 5, 123, 15, 5)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (26, 3, 5, 44, 16, 1)
INSERT [dbo].[Chi_tiet_SP] ([Ma_Size_Color], [MaMau], [MaSize], [SoLuong], [MaSP_ID], [MaNCC]) VALUES (27, 3, 3, 122, 16, 4)
SET IDENTITY_INSERT [dbo].[Chi_tiet_SP] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Áo nam')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Quần nam')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Phụ kiện')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (4, N'Giày dép nam')
INSERT [dbo].[DanhMuc] ([MaDanhMuc], [TenDanhMuc]) VALUES (5, N'Quần nam')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc_SP] ON 

INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (1, 1, N'Áo hoodie')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (2, 2, N'Quần tây')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (3, 2, N'Quần kaki')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (4, 2, N'Quần jogger')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (5, 2, N'Quần short')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (6, 2, N'Quần jeans')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (7, 2, N'Quần lót')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (8, 1, N'Áo So mi')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (9, 1, N'Áo Polo')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (10, 1, N'Áo Khoác')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (11, 1, N'Áo Thun')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (12, 1, N'Áo Hoodie')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (13, 1, N'Áo len')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (14, 4, N'Giày')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (15, 4, N'Dép nam')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (16, 4, N'Sandal')
INSERT [dbo].[DanhMuc_SP] ([MaDMSP], [MaDanhMuc], [TenMuc]) VALUES (20, 3, N'Ví')
SET IDENTITY_INSERT [dbo].[DanhMuc_SP] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [TongTien], [MaTK], [DiaChi], [NgayDat], [XacNhan]) VALUES (3, 47700, 1, N'khong thay', CAST(N'2023-03-08T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TongTien], [MaTK], [DiaChi], [NgayDat], [XacNhan]) VALUES (4, 33000, 1, N'khong thay', CAST(N'2023-03-13T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TongTien], [MaTK], [DiaChi], [NgayDat], [XacNhan]) VALUES (5, 34500, 1, N'khong thay', CAST(N'2023-03-13T00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[MAUSAC] ON 

INSERT [dbo].[MAUSAC] ([MaMau], [TenMau]) VALUES (1, N'Trắng')
INSERT [dbo].[MAUSAC] ([MaMau], [TenMau]) VALUES (2, N'Đỏ')
INSERT [dbo].[MAUSAC] ([MaMau], [TenMau]) VALUES (3, N'Đen')
INSERT [dbo].[MAUSAC] ([MaMau], [TenMau]) VALUES (4, N'Vàng')
INSERT [dbo].[MAUSAC] ([MaMau], [TenMau]) VALUES (5, N'Nâu')
SET IDENTITY_INSERT [dbo].[MAUSAC] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCC] ON 

INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (1, N'Áo')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (2, N'Quần')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (3, N'Ví')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (4, N'Giày')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (5, N'Áo Hoodie1')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (6, N'Áo len1')
INSERT [dbo].[NhaCC] ([MaNhaCC], [TenNhaCC]) VALUES (7, N'Áo vest1')
SET IDENTITY_INSERT [dbo].[NhaCC] OFF
GO
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (1, 1, N'Hoodie hat', 5000, 1, N'product_1.png', N'đẹp', 5, 12)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (2, 1, N'Sweater dài tay', 4900, 1, N'product_7.png', N'đẹp', 4, 7)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (3, 2, N'Cardigan', 7000, 1, N'product_9.png', N'đẹp', 3, 23)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (4, 2, N'Sweater dài tay', 4500, 1, N'product_10.png', N'đẹp', 4, 432)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (6, 3, N'Sweater dài tay', 4900, 1, N'product_3.png', N'đẹp', 4, 5)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (9, 5, N'Pocket trơn xanh', 5000, 1, N'product_2.png', N'đẹp', 5, 65)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (10, 5, N'Crossbody bag', 4900, 1, N'product_4.png', N'đẹp', 4, 77)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (11, 8, N'Polo sọc ngang', 3500, 1, N'product_3.png', N'đẹp', 5, 344)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (12, 8, N'Giày vans', 4700, 1, N'product_5.png', N'đẹp', 2, 2)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (13, 9, N'Kính râm', 5000, 1, N'product_6.png', N'đẹp', 3, 54)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (14, 9, N'Ví cowhide', 4900, 1, N'product_8.png', N'đẹp', 4, 45)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (15, 10, N'Áo go sea', 2000, 1, N'product_9.png', N'đẹp', 5, 56)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (16, 10, N'Folo dài tay ', 5000, 1, N'product_1.png', N'đẹp', 5, 76)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (19, 20, N'Ví đẹp', 4000, 1, N'product_8.png', N'đ', 4, 12)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (20, 14, N'Giày trắn ', 1222, 1, N'product_5.png', N'1234', 4, 123)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (21, 8, N'Áo GuGi', 5000, 1, N'product_9.png', N'đẹp', 4, 123)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (22, 1, N'Hooddie chui', 5000, 1, N'10.jpg', N'dep', 5, 333)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (23, 1, N'Hooide span', 5000, 1, N'3.jpg', N'ddep', 5, 0)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (24, 1, N'Hooide AQ', 5000, 1, N'1.jpg', N'ddep', 5, 0)
INSERT [dbo].[SANPHAM] ([MaSP_ID], [MaDMSP], [TenSP], [Gia], [TinhTrang], [URL_Hinh_Anh], [NhanXet], [DanhGia], [LuotMua]) VALUES (25, 1, N'Hooide zip', 5000, 1, N'product_9.png', N'ddep', 5, 0)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham_Mua] ON 

INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (14, 1, 3, 3, 2, 2)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (15, 2, 3, 3, 2, 3)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (16, 4, 3, 4, 4, 3)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (17, 9, 4, 2, 4, 1)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (18, 16, 4, 3, 2, 3)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (19, 19, 4, 2, 3, 3)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (20, 3, 5, 3, 3, 2)
INSERT [dbo].[SanPham_Mua] ([MaSP_Mua], [MaSP_ID], [MaHoaDon], [SoLuong], [masize], [mamau]) VALUES (21, 4, 5, 3, 2, 1)
SET IDENTITY_INSERT [dbo].[SanPham_Mua] OFF
GO
SET IDENTITY_INSERT [dbo].[SIZE] ON 

INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (1, N'S')
INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (2, N'M')
INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (3, N'L')
INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (4, N'XL')
INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (5, N'XXL')
INSERT [dbo].[SIZE] ([MaSize], [Size]) VALUES (14, N'A')
SET IDENTITY_INSERT [dbo].[SIZE] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhauTk], [PhanCap], [SDT], [Email], [TenNguoiDung]) VALUES (1, N'hiep123', N'12345', 1, 98788972, N'hiep@gmail.com', N'Hiệp')
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhauTk], [PhanCap], [SDT], [Email], [TenNguoiDung]) VALUES (2, N'user', N'12345', 0, 12345, N'user@gmail.com', N'khach hang')
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhauTk], [PhanCap], [SDT], [Email], [TenNguoiDung]) VALUES (3, N'hiep', N'12345', 0, 41234, N'iuwkh@gmail.com', N'hiep')
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhauTk], [PhanCap], [SDT], [Email], [TenNguoiDung]) VALUES (4, N'Thay_thanh_deptrai', N'cho_em_10D', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
ALTER TABLE [dbo].[Chi_tiet_SP]  WITH CHECK ADD  CONSTRAINT [FK_Size_Color_MAUSAC] FOREIGN KEY([MaMau])
REFERENCES [dbo].[MAUSAC] ([MaMau])
GO
ALTER TABLE [dbo].[Chi_tiet_SP] CHECK CONSTRAINT [FK_Size_Color_MAUSAC]
GO
ALTER TABLE [dbo].[Chi_tiet_SP]  WITH CHECK ADD  CONSTRAINT [FK_Size_Color_NhaCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCC] ([MaNhaCC])
GO
ALTER TABLE [dbo].[Chi_tiet_SP] CHECK CONSTRAINT [FK_Size_Color_NhaCC]
GO
ALTER TABLE [dbo].[Chi_tiet_SP]  WITH CHECK ADD  CONSTRAINT [FK_Size_Color_SANPHAM] FOREIGN KEY([MaSP_ID])
REFERENCES [dbo].[SANPHAM] ([MaSP_ID])
GO
ALTER TABLE [dbo].[Chi_tiet_SP] CHECK CONSTRAINT [FK_Size_Color_SANPHAM]
GO
ALTER TABLE [dbo].[Chi_tiet_SP]  WITH CHECK ADD  CONSTRAINT [FK_Size_Color_SIZE] FOREIGN KEY([MaSize])
REFERENCES [dbo].[SIZE] ([MaSize])
GO
ALTER TABLE [dbo].[Chi_tiet_SP] CHECK CONSTRAINT [FK_Size_Color_SIZE]
GO
ALTER TABLE [dbo].[DanhMuc_SP]  WITH CHECK ADD  CONSTRAINT [FK_DanhMuc_SP_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[DanhMuc_SP] CHECK CONSTRAINT [FK_DanhMuc_SP_DanhMuc]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_DanhMuc] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_DanhMuc]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_DanhMuc_SP] FOREIGN KEY([MaDMSP])
REFERENCES [dbo].[DanhMuc_SP] ([MaDMSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_DanhMuc_SP]
GO
ALTER TABLE [dbo].[SanPham_Mua]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mua_HoaDon] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[SanPham_Mua] CHECK CONSTRAINT [FK_SanPham_Mua_HoaDon]
GO
ALTER TABLE [dbo].[SanPham_Mua]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mua_MAUSAC] FOREIGN KEY([mamau])
REFERENCES [dbo].[MAUSAC] ([MaMau])
GO
ALTER TABLE [dbo].[SanPham_Mua] CHECK CONSTRAINT [FK_SanPham_Mua_MAUSAC]
GO
ALTER TABLE [dbo].[SanPham_Mua]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mua_SANPHAM] FOREIGN KEY([MaSP_ID])
REFERENCES [dbo].[SANPHAM] ([MaSP_ID])
GO
ALTER TABLE [dbo].[SanPham_Mua] CHECK CONSTRAINT [FK_SanPham_Mua_SANPHAM]
GO
ALTER TABLE [dbo].[SanPham_Mua]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mua_SIZE] FOREIGN KEY([masize])
REFERENCES [dbo].[SIZE] ([MaSize])
GO
ALTER TABLE [dbo].[SanPham_Mua] CHECK CONSTRAINT [FK_SanPham_Mua_SIZE]
GO
ALTER TABLE [dbo].[SanPham_Mua]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mua_SIZE1] FOREIGN KEY([masize])
REFERENCES [dbo].[SIZE] ([MaSize])
GO
ALTER TABLE [dbo].[SanPham_Mua] CHECK CONSTRAINT [FK_SanPham_Mua_SIZE1]
GO
