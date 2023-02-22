use QuanLyDeAn
GO

create table PHONGBAN(
  MaPhg varchar(2) primary key not null
  ,TenPhg nvarchar(20)
)
create table NHANVIEN(
    MaNV varchar(9) Primary key not null
  , HoNV nvarchar(15)
  ,TenLot nvarchar(30)
  ,TenNV nvarchar(30)
  ,NgSinh smalldatetime
  ,DiaChi nvarchar(150)
  ,Phai nvarchar (3)
  ,Luong numeric (18,0)
  ,Phong varchar(2) foreign key references PHONGBAN(MaPhg) not null
)

create table DEAN(
    MaDA  varchar(2) Primary key not null
   ,TenDA nvarchar(50)
   ,DDiemDA varchar(20)
)
create table PHANCONG(
   MaNV varchar(9) foreign key references NHANVIEN(MaNV) not null
   ,MaDA  varchar(2) foreign key references DEAN(MaDA) not null
   ,primary key(MaNV,MaDA)
)

create table THANNHAN( 
  MaNV varchar(9) FOREIGN KEY REFERENCES NHANVIEN(MaNV) not null
  ,TenTN nvarchar(30) 
  ,NgaySinh smalldatetime
  ,Phai varchar(3)
  ,QuanHe varchar(15)
  ,primary key(MaNV,TenTN)
)

--Trong bảng PHONGBAN, chỉnh sửa kiểu dữ liệu của cột TenPhg thành nvarchar(30)
ALTER TABLE PHONGBAN
ALTER COLUMN TenPhg nvarchar(30)
--Trong bảng DEAN, chỉnh sửa kiểu dữ liệu của cột DDiemDA thành nvarchar(20)
ALTER TABLE DEAN
ALTER COLUMN DDiemDA nvarchar(20)
--Trong bảng THANNHAN, chỉnh sửa kiểu dữ liệu của cột TenTN thành nvarchar(20), kiểu dữ liệu của cột Phai thành nvarchar(3), kiểu dữ liệu của cột QuanHe thành nvarchar(15)
ALTER TABLE THANNHAN
ALTER COLUMN TenTN nvarchar(20) 
ALTER TABLE THANNHAN
ALTER COLUMN Phai nvarchar(3) 
ALTER TABLE THANNHAN
ALTER COLUMN QuanHe nvarchar(15) 
--Trong bảng NHANVIEN, thêm cột SoDienThoai với kiểu dữ liệu varchar(15)
ALTER TABLE NHANVIEN
ADD SoDienThoai varchar(15)
--Trong bảng NHANVIEN, xóa cột SoDienThoai vừa tạo.
ALTER TABLE NHANVIEN
 DROP COLUMN SoDienThoai 
--Sử dụng câu lệnh SQL để nhập liệu vào các bảng như sau:
INSERT INTO NHANVIEN
VALUES('123', N'Đinh', N'Bá', N'Tiến', '1982-2-27', N'Mộ Đức', N'Nam', NULL, '4'),
('234', N'Nguyễn', N'Thanh', N'Tùng', '1956-8-12', N'Sơn Tịnh', N'Nam', NULL, '5'),
('345', N'Bùi', N'Thúy', N'Vũ', NULL, N'Tư Nghĩa', N'Nữ', NULL, '5'),
('456', N'Lê', N'Thị', N'Nhàn', '1962-7-12', N'Mộ Đức', N'Nữ', NULL, '4'),
('567', N'Nguyễn', N'Mạnh', N'Hùng', '1985-3-25', N'Sơn Tịnh', N'Nam', NULL, '5'),
('678', N'Trần', N'Hồng', N'Quang', NULL, N'Bình Sơn', N'Nam', NULL, '5'),
('789', N'Trần', N'Thanh', N'Tâm', '1972-6-17', N'Tp Quãng Ngãi', N'Nam', NULL, '5'),
('890', N'Cao', N'Thanh', N'Huyền', NULL, N'Tư Nghĩa', N'Nữ', NULL, '1'),
('901', N'Vương', N'Ngọc', N'Quyền', '1987-12-12', N'Mộ Đức', N'Nam', NULL, '1')
INSERT INTO PHONGBAN ([MaPhg],[TenPhg]) VALUES (1 ,N'Quản lý')
INSERT INTO PHONGBAN ([MaPhg],[TenPhg]) VALUES (4 ,N'Điều hành')
INSERT INTO PHONGBAN ([MaPhg],[TenPhg]) VALUES (5 ,N'Nghiên cứu')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (123 ,N'Châu' ,30/10/2005, N'Nữ' ,N'Con gái')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (123,N'Duy',25/10/2001,N' Nam',N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (123 ,N'Phương', 30/10/1985,N' Nữ',N'Vợ chồng')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (234 ,N'Thanh ',05/04/1980 ,N'Nữ',N'Con gái')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (345,N'Dương ',30/10/1956 ,N'Nam',N'Vợ chồng')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (345 ,N'Khang ',25/10/1982 ,N'Nam',N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (456 ,N'Hùng',01/01/1987, N'Nam',N'Con trai')
INSERT [dbo].[THANNHAN] ([MaNV], [TenTN], [NgaySinh], [Phai], [QuanHe]) VALUES (901 ,N'Thương', 05/04/1989, N' Nữ ',N'Vợ chồng')	
INSERT INTO PHANCONG
VALUES ('123', '1', '33'),
	('123', '2', '8'),
	('345', '10', '10'),
	('345', '20', '10'),
	('345', '3', '10'),
	('456', '1', '20'), 
	('456', '2', '20'),
	('678', '3', '40'),
	('789', '10', '35'),
	('789', '20', '30'),
	('789', '30', '5')
	INSERT INTO DEAN
VALUES ('1', N'Nâng cao chất lượng muối', N'Sa Huỳnh'),
('10', N'Xây dựng nhà máy chế biến thủy sản', N'Dung Quất'),
('2', N'Phát triển hạ tầng mạng', N'Tp Quảng Ngãi'),
('20', N'Truyền tải cáp quang', N'Tp Quảng Ngãi'),
('3', N'Tin học hóa trường học', N'Ba Tơ'),
('30', N'Đào tạo nhân lực', N'Tịnh Phong')
