use [ Sales]
go
--1. Tao kieu du lieu nguoi dung
Exec sp_addtype 'Mota', 'nvarchar(40)'
Exec sp_addtype 'IDKH', 'char(10)', 'Not null'
Exec sp_addtype 'DT', 'char(12)'

-- 2. Tạo table
CREATE TABLE SanPham (
MaSP CHAR(6) NOT NULL Primary key,
TenSP VARCHAR(20),
NgayNhap Date,
DVT CHAR(10),
SoLuongTon INT,
DonGiaNhap money
)
CREATE TABLE KhachHang (
MaKH IDKH primary key,
TenKH NVARCHAR(30),
DiaCHi NVARCHAR(40),
DienThoai DT
)
CREATE TABLE HoaDon (
MaHD CHAR(10) NOT NULL Primary key,
NgayLap Date,
NgayGiao Date,
MaKH IDKH FOREIGN KEY REFERENCES KhachHang(MaKH),
DienGiai Mota
)

CREATE TABLE ChiTietHD (
MaHD CHAR(10) NOT NULL,
MaSP CHAR(6) NOT NULL  ,
SoLuong INT,
FOREIGN KEY (Masp)REFERENCES SanPham (Masp),
FOREIGN KEY (MaHD)REFERENCES HoaDon (MaHD)
)


-- 3. Trong Table HoaDon, sửa cột DienGiai thành nvarchar(100).
ALTER TABLE HoaDon
ALTER COLUMN DienGiai NVARCHAR(100)
-- 4. Thêm vào bảng SanPham cột TyLeHoaHong float
ALTER TABLE SanPham
ADD TyLeHoaHong float
-- 5. Xóa cột NgayNhap trong bảng SanPham
ALTER TABLE SanPham
DROP COLUMN NgayNhap
-- 7. 
-- ngay giao> ngay lap
ALTER TABLE HoaDon
ADD CONSTRAINT check_ngaygiao CHECK (NgayGiao >= NgayLap);
--MaHD gồm 6 ký tự, 2 ký tự đầu là chữ, các ký tự còn lại là số
ALTER TABLE HoaDon
ADD CONSTRAINT check_hoadon CHECK (MaHD like '[A-Z][A-Z][0-9][0-9][0-9][0-9]')
--Giá trị mặc định ban đầu cho cột NgayLap luôn luôn là ngày hiện hành
ALTER TABLE HoaDon
ADD CONSTRAINT df_ngaylap DEFAULT GETDATE() FOR NgayLap;

--8 
--SoLuongTon chỉ nhập từ 0 đến 500
ALTER TABLE SanPham
ADD CONSTRAINT check_SoLuongTon CHECK (SoLuongTon BETWEEN 0 AND 500)
--DonGiaNhap lớn hơn 0
ALTER TABLE SanPham
ADD CONSTRAINT check_DonGiaNhap CHECK (DonGiaNhap > 0)
--Giá trị mặc định cho NgayNhap là ngày hiện hành
ALTER TABLE SanPham
ADD CONSTRAINT df_ngaynhap DEFAULT GETDATE() FOR NgayNhap;
--DVT chỉ nhập vào các giá trị ‘KG’, ‘Thùng’, ‘Hộp’, ‘Cái’
ALTER TABLE SanPham
ADD CONSTRAINT df_dvt Check (DVT = N'KG' or DVT = N'Thùng' OR DVT = 'Hộp' OR DVT = 'Cái')
--9.Dùng lệnh T-SQL nhập dữ liệu vào 4 table trên, dữ liệu tùy ý, chú ý các ràng buộc của mỗi Table
INSERT INTO SanPham (Masp, Tensp, NgayNhap, DVT, SoluongTon, DongiaNhap, TyLeHoaHong)
 VALUES ('SP1', N'Bút chì', '2022-08-14', N'Cái', 200, 3000, 15)
 INSERT INTO SanPham (Masp, Tensp, NgayNhap, DVT, SoluongTon, DongiaNhap, TyLeHoaHong)
 VALUES ('SP2', N'Bút Bi', '2022-08-15', N'Cái', 220, 4000, 10)
 INSERT INTO SanPham (Masp, Tensp, NgayNhap, DVT, SoluongTon, DongiaNhap, TyLeHoaHong)
 VALUES ('SP3', N'Bút xoa', '2022-05-14', N'Cái', 10, 3000, 5)

 INSERT INTO KhachHang (MaKH, TenKH, Diachi, Dienthoai)
VALUES ('KH1', N'Thanh Lam', 'TP.HCM', '0945578442')
INSERT INTO KhachHang (MaKH, TenKH, Diachi, Dienthoai)
VALUES ('KH2', N'Toàn Thắng', 'Tây Ninh', '0945566778')

INSERT INTO HoaDon (MaHD, Ngaylap, Ngaygiao, MaKH, Diengiai)
VALUES ('HD0001', '2022-08-16', '2022-08-25', 'KH1', 'Sản phẩm bút chì loại 1')
INSERT INTO HoaDon (MaHD, Ngaylap, Ngaygiao, MaKH, Diengiai)
VALUES ('HD0002', '2022-10-20', '2022-11-05', 'KH2', 'Sản phẩm khẩu trang kháng khuẩn')

INSERT INTO ChiTietHD (MaHD, Masp, Soluong)
VALUES ('HD0001', 'SP1', 300)
INSERT INTO ChiTietHD (MaHD, Masp, Soluong)
VALUES ('HD0002', 'SP2', 800)


