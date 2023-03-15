--câu 1 Viết SP spTangLuong dùng để tăng lương lên 10% cho tất cả các nhân viên.
CREATE PROCEDURE spTangLuong
AS
BEGIN
    UPDATE NhanVien
    SET LUONG = LUONG * 1.1
END;

EXEC spTangLuong

--câu 2 Thêm vào cột NgayNghiHuu (ngày nghỉ hưu) trong bảng NHANVIEN.

ALTER TABLE NHANVIEN
ADD NgayNghiHuu DATE;

CREATE PROCEDURE spNghiHuu
AS
BEGIN
    UPDATE NHANVIEN
    SET NgayNghiHuu = DATEADD(day, 100, GETDATE())
    WHERE (PHAI = 'Nam' AND DATEDIFF(year, NGSINH, GETDATE()) >= 60)
    OR (PHAI = 'Nu' AND DATEDIFF(year, NGSINH, GETDATE()) >= 55)
END;

EXEC spNghiHuu;

---3. 
CREATE PROCEDURE spXemDeAn @DDiemDA NVARCHAR(255)
AS
BEGIN
    SELECT * FROM DeAn
    WHERE DDiemDA = @DDiemDA
END;
EXEC spXemDeAn @DDiemDA = N'<địa điểm>';
---4.
CREATE PROCEDURE spCapNhatDeAn @diadiem_cu NVARCHAR(255), @diadiem_moi NVARCHAR(255)
AS
BEGIN
    UPDATE DeAn
    SET DDiemDA = @diadiem_moi
    WHERE DDiemDA = @diadiem_cu
END;
EXEC spCapNhatDeAn @diadiem_cu = N'<địa điểm cũ>', @diadiem_moi = N'<địa điểm mới>';
---5.
CREATE PROCEDURE spThemDeAn
    @MaDeAn INT,
    @TenDeAn NVARCHAR(50),
    @DDiemDA NVARCHAR(255)
AS
BEGIN
    INSERT INTO DEAN (MaDA, TenDA, DDiemDA)
    VALUES (@MaDeAn, @TenDeAn, @DDiemDA)
END
---6.
CREATE PROCEDURE spThemDeAn
    @MaDeAn INT,
    @TenDeAn NVARCHAR(50),
    @DDiemDA NVARCHAR(255),
    @MaPhongBan INT
AS
BEGIN
    IF EXISTS (SELECT * FROM DEAN WHERE MaDA = @MaDeAn)
    BEGIN
        RAISERROR ('Mã đề án đã tồn tại, đề nghị chọn mã đề án khác', 16, 1);
        RETURN;
    END

    IF NOT EXISTS (SELECT * FROM PHONGBAN WHERE MaPhg = @MaPhongBan)
    BEGIN
        RAISERROR ('Mã phòng không tồn tại', 16, 1);
        RETURN;
    END

    INSERT INTO DEAN (MaDA, TenDA, DDiemDA)
    VALUES (@MaDeAn, @TenDeAn, @DDiemDA)
END
-- Trường hợp hợp lệ:
EXEC spThemDeAn 1, 'Đề án A', 'Mô tả cho Đề án A', 1;

-- Trường hợp không hợp lệ: Mã đề án đã tồн tại
EXEC spThemDeAn 1, 'Đề án B', 'Mô tả cho Đề án B', 1;

-- Trường hợp không hợp lệ: Mã phòng ban không tồн tại
EXEC spThemDeAn 2