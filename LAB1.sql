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


