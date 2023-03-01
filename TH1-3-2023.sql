-- câu 1 Liệt kê danh sách tất cả các nhân viên
select * from NHANVIEN
-- câu 2 Tìm các nhân viên làm việc ở phòng số 5
select * from NHANVIEN WHERE
NHANVIEN.Phong = 5
-- câu 3 Liệt kê họ tên và phòng làm việc các nhân viên có mức lương trên 6.000.000 đồng
select * from NHANVIEN,PHONGBAN WHERE
NHANVIEN.Luong>6000000
-- CÂU 4 Tìm các nhân viên có mức lương trên 6.500.000 ở phòng 1 hoặc các nhân viên có mức lương trên 5.000.000 ở phòng 4
select * from NHANVIEN
where NHANVIEN.Luong >650000 and NHANVIEN.Phong=1 OR NHANVIEN.Luong>5000000 and NHANVIEN.Phong=4
-- câu 5 Cho biết họ tên đầy đủ của các nhân viên ở TP Quảng Ngãi
Select HoNV+TenLot+TenNV as'Họ Và Tên' from NHANVIEN
where NHANVIEN.DiaChi Like 'Tp Quảng Ngãi%'
-- câu 6 Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự &#39;N&#39;
Select HoNV+TenLot+TenNV as'Họ Và Tên' from NHANVIEN
where NHANVIEN.HoNV like 'N%'
 -- câu 7 Cho biết ngày sinh và địa chỉ của nhân viên Cao Thanh Huyền
 select NHANVIEN.NgSinh,NHANVIEN.DiaChi from nhanvien
 where NHANVIEN.HoNV = N'Cao' and NHANVIEN.TenLot = N'Thanh' and NHANVIEN.TenNV =N'Huyền'
  -- câu 8 Cho biết các nhân viên có năm sinh trong khoảng 1955 đến 1975
  select * from NHANVIEN
  where YEAR(NHANVIEN.NgSinh) between '1955' and '1975'
 -- câu 9 Cho biết các nhân viên và năm sinh của nhân viên
 select  NHANVIEN.MaNV,YEAR(NHANVIEN.NgSinh)as N'Năm sinh' from
 NHANVIEN
 -- câu 10 Cho biết họ tên và tuổi của tất cả các nhân viên
  select  NHANVIEN.MaNV,(YEAR(GETDATE())-YEAR(NHANVIEN.NgSinh)) as N'Tuổi' from
 NHANVIEN
 -- câu 11 Tìm tên những người trưởng phòng của từng phòng ban
 select PHONGBAN.TenPhg,( NHANVIEN.HoNV + NHANVIEN.TenLot+NHANVIEN.TenNV)as 'Tên trưởng phòng'
 from NHANVIEN,PHONGBAN where NHANVIEN.Phong=PHONGBAN.MaPhg and NHANVIEN.MaNV=PHONGBAN.TenPhg
 -- câu 12 Tìm tên và địa chỉ của tất cả các nhân viên của phòng &quot;Điều hành&quot;.
 SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV), NHANVIEN.DiaChi
	FROM NHANVIEN, PHONGBAN
	where NHANVIEN.Phong=PHONGBAN.MaPhg and
	PHONGBAN.TenPhg = N'Điều hành'
-- câu 14 Tìm tên những nữ nhân viên và tên người thân của họ
select(NHANVIEN.HoNV + NHANVIEN.TenLot+NHANVIEN.TenNV)as 'Tên nhân viên', THANNHAN.TenTN
from NHANVIEN,THANNHAN
WHERE NHANVIEN.MANV = THANNHAN.MaNV AND NHANVIEN.PHAI = N'Nữ'
-- câu 17 Cho biết tên các đề án mà nhân viên Trần Thanh Tâm đã tham gia.
SELECT DEAN.TENDA
	FROM NHANVIEN, DEAN, PHANCONG
	WHERE DEAN.MADA	= PHANCONG.MADA AND
		  NHANVIEN.MANV = PHANCONG.MaNV AND
		  NHANVIEN.HONV = N'Trần' AND
		  NHANVIEN.TENLOT = N'Thanh' AND
		  NHANVIEN.TENNV = N'Tâm'