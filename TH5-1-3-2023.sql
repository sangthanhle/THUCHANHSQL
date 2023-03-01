--18. Cho biết số lượng đề án của công ty.
	SELECT COUNT(DEAN.MaDA)
	FROM DEAN
--21  Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì.
	SELECT COUNT(DEAN.MADA)
	FROM DEAN, PHONGBAN 
	WHERE   DEAN.PHONG = PHONGBAN.MAPHG AND
		  PHONGBAN.TENPHG = N'Nghiên cứu'
--22 Cho biết lương trung bình của các nữ nhân viên.
	SELECT AVG(NHANVIEN.LUONG)
	FROM NHANVIEN
--23. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'.
	SELECT COUNT(THANNHAN.MaNV)
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MaNV AND
		  NHANVIEN.HONV = N'Đinh' AND
		  NHANVIEN.TENLOT = N'Bá' AND
		  NHANVIEN.TENNV = N'Tiến'	and 
		  
		 NHANVIEN.PHAI = N'Nữ'

--25. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc của tất cả các nhân viên tham dự đề án đó.
	SELECT DEAN.MaDA, DEAN.TenDA, SUM(PHANCONG.ThoiGian)
	FROM DEAN, PHANCONG
	WHERE DEAN.MaDA= PHANCONG.MaDA
	GROUP BY DEAN.MaDA, DEAN.TenDA
----27. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó.
	SELECT DEAN.MaDA, COUNT(PHANCONG.MaNV) AS 'Số nhân viên tham gia'
	FROM DEAN, PHANCONG
	WHERE DEAN.MADA = PHANCONG.MADA
	GROUP BY DEAN.MADA
----28. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân của nhân viên đó.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(THANNHAN.MaNV) AS 'Số lượng thân nhân'
	FROM NHANVIEN, THANNHAN
	WHERE NHANVIEN.MANV = THANNHAN.MaNV
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)
--26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà nhân viên đó đã tham gia.
	SELECT (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV) AS 'Họ tên nhân viên', COUNT(PHANCONG.MaNV) AS'Số lượng đề án tham gia'
	FROM NHANVIEN, DEAN, PHANCONG
	WHERE NHANVIEN.MANV = PHANCONG.MaNV AND
		  DEAN.MADA = PHANCONG.MADA
	GROUP BY (NHANVIEN.HONV + ' ' + NHANVIEN.TENLOT + ' ' + NHANVIEN.TENNV)