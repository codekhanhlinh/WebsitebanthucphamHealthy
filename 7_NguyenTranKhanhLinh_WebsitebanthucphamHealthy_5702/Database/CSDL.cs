using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form;
using System.Drawing;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database
{
    public class CSDL
    {
        public CSDL()
        {

        }
        public string chuoiketnoi = ConfigurationManager.ConnectionStrings["conn"].ConnectionString.ToString();
        public SqlConnection getConnection()
        {
            SqlConnection conn = new SqlConnection(chuoiketnoi);
            conn.Open();
            return conn;
        }

        public DataTable GetData(string sql)
        {
            SqlConnection cnn = new SqlConnection(chuoiketnoi);
            try
            {
                SqlDataAdapter sqlDa = new SqlDataAdapter(sql, cnn);
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Excute(string sql)
        {
            SqlConnection cnn = new SqlConnection(chuoiketnoi);
            cnn.Open();
            SqlCommand cmd = new SqlCommand(sql, cnn);
            cmd.ExecuteNonQuery();
            cnn.Close();
        }

        public string GetValue(string sql)
        {
            using (SqlConnection sqlCon = new SqlConnection(chuoiketnoi))
            {
                sqlCon.Open();
                SqlCommand cmd = new SqlCommand(sql, sqlCon);
                string val = cmd.ExecuteScalar().ToString();
                sqlCon.Close();
                return (val);
            }
        }
        public DataTable GetData(string query, SqlParameter[] parameters)
        {
            string connectionString = "Data Source=LAPTOP-QB932246\\SQLEXPRESS;Initial Catalog=CSDLHemHealthyFood;Integrated Security=True;";

            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dataTable);
                    }
                }

                connection.Close();
            }

            return dataTable;
        }

        public void ExecuteNonQuery(string query, SqlParameter[] parameters)
        {
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    command.ExecuteNonQuery();
                }
            }
        }

        public void CapNhatNhanVien(string maNv, string hoTen, string gioiTinh, string ngaySinh, string sdt, string email, string diaChi, string ngayVaoLam, string chucVu)
        {
            string updateQuery = "UPDATE NhanVien SET HoTenNV = @HoTenNV, GioiTinh = @GioiTinh, " +
                "NgaySinh = @NgaySinh, SDT = @SDT, Email = @Email, DiaChi = @DiaChi, NgayVaoLam = @NgayVaoLam, " +
                "ChucVu = @ChucVu WHERE MaNV = @MaNV";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNV", maNv);
                    command.Parameters.AddWithValue("@HoTenNV", hoTen);
                    command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    command.Parameters.AddWithValue("@NgaySinh", DateTime.Parse(ngaySinh));
                    command.Parameters.AddWithValue("@SDT", sdt);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);
                    command.Parameters.AddWithValue("@NgayVaoLam", DateTime.Parse(ngayVaoLam));
                    command.Parameters.AddWithValue("@ChucVu", chucVu);


                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void XoaNhanVien(string maNv)
        {
            string deleteQuery = "DELETE FROM NhanVien WHERE MaNV = @MaNV";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNV", maNv);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public DataTable LayGTKhachHang()
        {
            string query = "SELECT GioiTinh FROM KhachHang";
            DataTable dt = GetData(query);
            return dt;
        }
        public void CapNhatKhachHang(string makh, string hoTen, string gioiTinh, string sdt, string email, string diaChi)
        {
            string updateQuery = "UPDATE KhachHang SET HoTenKH = @HoTenKH, GioiTinh = @GioiTinh, " +
                "SDTKH = @SDTKH, Email = @Email, DiaChi = @DiaChi WHERE MaKH=@MaKH";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaKH", makh);
                    command.Parameters.AddWithValue("@HoTenKH", hoTen);
                    command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    command.Parameters.AddWithValue("@SDTKH", sdt);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);
        
                    command.ExecuteNonQuery();
                }
            }
        }

        public void XoaKhachHang(string makh)
        {
            string deleteQuery = "DELETE FROM KhachHang WHERE MaKH = @MaKH";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaKH", makh);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void CapNhatNCC(string mancc, string ten, string sdt, string email, string diaChi)
        {
            string updateQuery = "UPDATE NhaCungCap SET TenNCC = @TenNCC," +
                "SDT = @SDT, Email = @Email, DiaChi = @DiaChi WHERE MaNCC=@MaNCC";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNCC", mancc);
                    command.Parameters.AddWithValue("@TenNCC", ten);
                    command.Parameters.AddWithValue("@SDT", sdt);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void XoaNCC(string mancc)
        {
            string deleteQuery = "DELETE FROM NhaCungCap WHERE MaNCC = @MaNCC";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNCC", mancc);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public DataTable LayDvtNL()
        {
            string query = "SELECT Dvt FROM KhoNL";
            DataTable dt = GetData(query);
            return dt;
        }

        public DataTable LayTTNL()
        {
            string query = "SELECT TinhTrang FROM KhoNL";
            DataTable dt = GetData(query);
            return dt;
        }

        public void CapNhatKhoNL(string manl, string ten, string sl, string dvt, string tinhtrang)
        {
            string updateQuery = "UPDATE KhoNL SET TenNL = @TenNL," +
                "SLHienCo= @SLHienCo, Dvt= @Dvt, TinhTrang= @TinhTrang WHERE MaNL=@MaNL";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNL", manl);
                    command.Parameters.AddWithValue("@TenNL", ten);
                    command.Parameters.AddWithValue("@SLHienCo", sl);
                    command.Parameters.AddWithValue("@Dvt", dvt);
                    command.Parameters.AddWithValue("@TinhTrang", tinhtrang);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void XoaNL(string mancc)
        {
            string deleteQuery = "DELETE FROM KhoNL WHERE MaNL = @MaNL";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNL", mancc);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public DataTable LayLSP()
        {
            string query = "SELECT MaLSP, TenLSP FROM LoaiSP"; 
            DataTable loaiSPTable = GetData(query);
            return loaiSPTable;
        }

        public DataTable LayDvtSP()
        {
            string query = "SELECT Dvt FROM SanPham";
            DataTable loaiSPTable = GetData(query);
            return loaiSPTable;
        }

        public void CapNhatSP(string masp, string malsp, string tensp, string dvt, string gia, string sl, string nsx, 
            string hsd, string tp, string tl)
        {
            string updateQuery = "UPDATE SanPham SET MaLSP= @MaLSP, TenSP = @TenSP," +
                "Dvt= @Dvt, Gia= @Gia, SLHienCo= @SLHienCo, NSX= @NSX, HSD= @HSD, ThanhPhan= @ThanhPhan, " +
                "TrongLuong= @TrongLuong WHERE MaSP=@MaSP";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaSP", masp);
                    command.Parameters.AddWithValue("@MaLSP", malsp); 
                    command.Parameters.AddWithValue("@TenSP", tensp);
                    command.Parameters.AddWithValue("@Dvt", dvt);
                    command.Parameters.AddWithValue("@Gia", gia);
                    command.Parameters.AddWithValue("@SLHienCo", sl);
                    command.Parameters.AddWithValue("@NSX", nsx);
                    command.Parameters.AddWithValue("@HSD", hsd);
                    command.Parameters.AddWithValue("@ThanhPhan", tp);
                    command.Parameters.AddWithValue("@TrongLuong", tl);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void XoaSP(string mancc)
        {
            string deleteQuery = "DELETE FROM SanPham WHERE MaSP = @MaSP";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaSP", mancc);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void CapNhatLSP(string malsp, string tensp)
        {
            string updateQuery = "UPDATE LoaiSP SET TenLSP = @TenLSP  WHERE MaLSP = @MaLSP";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                   
                    command.Parameters.AddWithValue("@MaLSP", malsp);
                    command.Parameters.AddWithValue("@TenLSP", tensp);
                

                    command.ExecuteNonQuery();
                }
            }
        }

        public bool KiemTraTonTaiSanPhamTheoMaLSP(string maLSP)
        {
            string query = "SELECT COUNT(*) FROM SanPham WHERE MaLSP = @MaLSP";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaLSP", maLSP);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }
        private void XoaSanPhamTheoMaLSP(string maLSP)
        {
            // Viết mã SQL hoặc sử dụng stored procedure để xóa sản phẩm liên quan
            // Ví dụ:
            string query = "DELETE FROM SanPham WHERE MaLSP = @MaLSP";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaLSP", maLSP);
                    command.ExecuteNonQuery();
                }
            }
        }
        public void XoaLSP(string mancc)
        {
            string deleteQuery = "DELETE FROM LoaiSP WHERE MaLSP = @MaLSP";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaLSP", mancc);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void XoaSanPhamVaLoaiSanPham(string maLSP)
        {
            // Thực hiện xóa sản phẩm liên quan và loại sản phẩm
            XoaSanPhamTheoMaLSP(maLSP);
            XoaLSP(maLSP);
        }

        public DataTable LayDLCTPN(string maPN)
        {
            string query = "SELECT CTPN.*, K.TenNL " +
                            "FROM CTPhieuNhap CTPN " +
                            "INNER JOIN KhoNL K ON CTPN.MaNL = K.MaNL WHERE CTPN.MaPN = @MaPN";
            SqlParameter[] parameters = { new SqlParameter("@MaPN", maPN) };
            DataTable dt = GetData(query, parameters);
            return dt;
        }

        public DataTable LayDLCTHD(string maHD)
        {
            string query = "SELECT CTHD.*, P.TenSP " +
                            "FROM CTHoaDonBan CTHD " +
                            "INNER JOIN SanPham P ON CTHD.MaSP = P.MaSP WHERE CTHD.MaHD = @MaHD";
            SqlParameter[] parameters = { new SqlParameter("@MaHD", maHD) };
            DataTable dt = GetData(query, parameters);
            return dt;
        }
        public DataTable LayDSNV()
        {
            string query = "SELECT MaNV, HoTenNV FROM NhanVien";
            DataTable NVTable = GetData(query);
            return NVTable;
        }

        public DataTable LayDSNCC()
        {
            string query = "SELECT MaNCC, TenNCC FROM NhaCungCap";
            DataTable NCCTable = GetData(query);
            return NCCTable;
        }

        public DataTable LayDSNL()
        {
            string query = "SELECT MaNL, TenNL FROM KhoNL";
            DataTable NLTable = GetData(query);
            return NLTable;
        }

        public DataTable LayDSKH()
        {
            string query = "SELECT MaKH, HoTenKH FROM KhachHang";
            DataTable KHTable = GetData(query);
            return KHTable;
        }

        public DataTable LayPTTT()
        {
            string query = "SELECT PTTT FROM HoaDonBan";
            DataTable PTTable = GetData(query);
            return PTTable;
        }

        public DataTable LayDSSP()
        {
            string query = "SELECT MaSP, TenSP FROM SanPham";
            DataTable SPTable = GetData(query);
            return SPTable;
        }

        public void CapNhatPN(string mapn, string manv, string mancc, string ngaynhap, string tongpn)
        {
            string updateQuery = "UPDATE PhieuNhap SET MaNV= @MaNV, MaNCC = @MaNCC," +
                "NgayNhap= @NgayNhap, TongPN= @TongPN WHERE MaPN=@MaPN";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaPN", mapn);
                    command.Parameters.AddWithValue("@MaNV", manv);
                    command.Parameters.AddWithValue("@MaNCC", mancc);
                    command.Parameters.AddWithValue("@NgayNhap",DateTime.Parse(ngaynhap));
                    command.Parameters.AddWithValue("@TongPN", tongpn);

                    command.ExecuteNonQuery();
                }
            }
        }
        public bool KiemTraTonTaiCTPNTheoPN(string maPN)
        {
            string query = "SELECT COUNT(*) FROM CTPhieuNhap WHERE MaPN = @MaPN";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaPN", maPN);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }
        public void XoaCTPN(string maPN)
        {
            string query = "DELETE FROM CTPhieuNhap WHERE MaPN = @MaPN " +
                "AND EXISTS (SELECT 1 FROM CTPhieuNhap WHERE MaPN = @MaPN)";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaPN", maPN);
                    command.ExecuteNonQuery();
                }
            }
        }
        public void XoaPN(string mapn)
        {
            string deleteQuery = "DELETE FROM PhieuNhap WHERE MaPN = @MaPN";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaPN", mapn);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void XoaPNvaCTPN(string maPN)
        {
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                // Bắt đầu một TRANSACTION
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    // Xóa dữ liệu từ bảng CTPhieuNhap
                    string deleteCTPNQuery = "DELETE FROM CTPhieuNhap WHERE MaPN = @MaPN";
                    using (SqlCommand commandCTPN = new SqlCommand(deleteCTPNQuery, connection, transaction))
                    {
                        commandCTPN.Parameters.AddWithValue("@MaPN", maPN);
                        commandCTPN.ExecuteNonQuery();
                    }

                    // Xóa dữ liệu từ bảng PhieuNhap
                    string deletePNQuery = "DELETE FROM PhieuNhap WHERE MaPN = @MaPN";
                    using (SqlCommand commandPN = new SqlCommand(deletePNQuery, connection, transaction))
                    {
                        commandPN.Parameters.AddWithValue("@MaPN", maPN);
                        commandPN.ExecuteNonQuery();
                    }

                    // COMMIT TRANSACTION nếu không có lỗi
                    transaction.Commit();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    // Nếu có lỗi, ROLLBACK TRANSACTION và xử lý lỗi
                    transaction.Rollback();
                    connection.Close();
                    Console.WriteLine($"Lỗi khi xóa phiếu nhập và chi tiết phiếu nhập: {ex.Message}");
                }
            }
        }

        public void CapNhatCTPN(string mactpn, string manl, string sln, string dvt, string gianhap, string thanhtien)
        {
            string updateQuery = "UPDATE CTPhieuNhap SET MaNL= @MaNL"+
                ", SLNhap= @SLNhap, Dvt= @Dvt, GiaNhap= @GiaNhap, ThanhTien=@ThanhTien WHERE MaPN=@MaPN";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaPN", mactpn);
                    command.Parameters.AddWithValue("@MaNL", manl);
                    command.Parameters.AddWithValue("@SLNhap", sln);
                    command.Parameters.AddWithValue("@Dvt", dvt);
                    command.Parameters.AddWithValue("@GiaNhap", gianhap);
                    command.Parameters.AddWithValue("@ThanhTien", thanhtien);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void CapNhatTongPN(string maPN)
        {
            try
            {
                // Lấy tổng thành tiền của tất cả chi tiết phiếu nhập cho một mã phiếu nhập
                string sql = "SELECT SUM(ISNULL(ThanhTien, 0)) AS TongThanhTien FROM CTPhieuNhap WHERE MaPN = @MaPN";
                SqlParameter[] parameters = { new SqlParameter("@MaPN", maPN) };
                DataTable dt = GetData(sql, parameters);

                if (dt != null && dt.Rows.Count > 0)
                {
                    // Lấy giá trị tổng thành tiền
                    decimal tongThanhTien = Convert.ToDecimal(dt.Rows[0]["TongThanhTien"]);

                    // Cập nhật giá trị TongPN trong bảng PhieuNhap
                    string updateSql = "UPDATE PhieuNhap SET TongPN = @TongPN WHERE MaPN = @MaPN";
                    SqlParameter[] updateParameters = {
                        new SqlParameter("@TongPN", tongThanhTien),
                        new SqlParameter("@MaPN", maPN)
                    };
                    ExecuteNonQuery(updateSql, updateParameters);
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần thiết
                Console.WriteLine($"Lỗi khi cập nhật TongPN: {ex.Message}");
            }
        }

        public string LayMaPNTheoMaCTPN(string maPN)
        {
            string query = "SELECT MaPN FROM CTPhieuNhap WHERE MaPN = @MaPN";
            SqlParameter[] parameters = { new SqlParameter("@MaPN", maPN) };
            DataTable dt = GetData(query, parameters);

            if (dt != null && dt.Rows.Count > 0)
            {
                return dt.Rows[0]["MaPN"].ToString();
            }

            return string.Empty; // hoặc giá trị mặc định phù hợp với ứng dụng của bạn
        }
        private int GetNextTKNumberFromDatabase()
        {
            int nextTKNumber = 0;

            try
            {
                using (SqlConnection connection = new SqlConnection(chuoiketnoi))
                {
                    connection.Open();

                    // Thực hiện truy vấn để lấy số tiếp theo của Mã Tài Khoản
                    string query = "SELECT ISNULL(MAX(CAST(SUBSTRING(MaTK, 5, LEN(MaTK)) AS INT)), 0) AS MaxTKNumber FROM TaiKhoanKH";
                    SqlCommand command = new SqlCommand(query, connection);
                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        nextTKNumber = Convert.ToInt32(result);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi lấy số tiếp theo của Mã Tài Khoản: " + ex.Message);
            }

            return nextTKNumber;
        }

        private int GetNextKHNumberFromDatabase()
        {
            int nextKHNumber = 0;

            try
            {
                using (SqlConnection connection = new SqlConnection(chuoiketnoi))
                {
                    connection.Open();

                    // Thực hiện truy vấn để lấy số tiếp theo của Mã Khách Hàng
                    string query = "SELECT ISNULL(MAX(CAST(SUBSTRING(MaKH, 3, LEN(MaKH)) AS INT)), 0) AS MaxKHNumber FROM KhachHang";
                    SqlCommand command = new SqlCommand(query, connection);
                    object result = command.ExecuteScalar();

                    if (result != null && result != DBNull.Value)
                    {
                        nextKHNumber = Convert.ToInt32(result);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi lấy số tiếp theo của Mã Khách Hàng: " + ex.Message);
            }

            return nextKHNumber;
        }
        public string GenerateMaTK()
        {
            int nextTKNumber = GetNextTKNumberFromDatabase();
            string maTK = "TKKH" + (nextTKNumber + 1).ToString("D2");
            return maTK;
        }

        public string GenerateMaKH()
        {
            int nextKHNumber = GetNextKHNumberFromDatabase();
            string maKH = "KH" + (nextKHNumber + 1).ToString("D4");
            return maKH;
        }

        public void DangKyTaiKhoan(string tenDN, string matKhau, string hoTen, string gioiTinh, string sdt, string email, string diaChi)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(chuoiketnoi))
                {
                    connection.Open();

                    // Tạo mã mới cho MaTK và MaKH
                    string maTK = GenerateMaTK();
                    while (KiemTraTonTaiMaTK(maTK))
                    {
                        maTK = GenerateMaTK();
                    }
                    string maKH = GenerateMaKH();
                    while (KiemTraTonTaiMaKH(maKH))
                    {
                        maKH = GenerateMaKH();
                    }

                    // Thêm dữ liệu vào bảng KhachHang
                    string insertKhachHangQuery = "INSERT INTO KhachHang (MaKH, HoTenKH, GioiTinh, SDTKH, Email, DiaChi) " +
                                                  "VALUES (@MaKH, @HoTen, @GioiTinh, @SDT, @Email, @DiaChi)";
                    SqlCommand insertKhachHangCommand = new SqlCommand(insertKhachHangQuery, connection);
                    insertKhachHangCommand.Parameters.AddWithValue("@MaKH", maKH);
                    insertKhachHangCommand.Parameters.AddWithValue("@HoTen", hoTen);
                    insertKhachHangCommand.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    insertKhachHangCommand.Parameters.AddWithValue("@SDT", sdt);
                    insertKhachHangCommand.Parameters.AddWithValue("@Email", email);
                    insertKhachHangCommand.Parameters.AddWithValue("@DiaChi", diaChi);

                    insertKhachHangCommand.ExecuteNonQuery();

                    // Thêm dữ liệu vào bảng TaiKhoanKH
                    string insertTaiKhoanQuery = "INSERT INTO TaiKhoanKH (MaTK, MaKH, TenDN, MatKhau) " +
                                                 "VALUES (@MaTK, @MaKH, @TenDN, @MatKhau)";
                    SqlCommand insertTaiKhoanCommand = new SqlCommand(insertTaiKhoanQuery, connection);
                    insertTaiKhoanCommand.Parameters.AddWithValue("@MaTK", maTK);
                    insertTaiKhoanCommand.Parameters.AddWithValue("@MaKH", maKH);
                    insertTaiKhoanCommand.Parameters.AddWithValue("@TenDN", tenDN);
                    insertTaiKhoanCommand.Parameters.AddWithValue("@MatKhau", matKhau);

                    insertTaiKhoanCommand.ExecuteNonQuery();
                }
            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    Console.WriteLine("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" +
                        "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi đăng ký tài khoản: " + ex.Message);
            }
        }


        public string Getvalue(string sql, SqlParameter[] parameters)
        {
            using (SqlConnection sqlCon = new SqlConnection(chuoiketnoi))
            {
                sqlCon.Open();
                using (SqlCommand cmd = new SqlCommand(sql, sqlCon))
                {
                    // Add parameters to the command if provided
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    string val = cmd.ExecuteScalar()?.ToString();
                    sqlCon.Close();
                    return val;
                }
            }
        }
        public bool KiemTraTonTaiMaTK(string maTK)
        {
            string query = "SELECT COUNT(*) FROM TaiKhoanKH WHERE MaTK = @MaTK";
            SqlParameter[] parameters = { new SqlParameter("@MaTK", maTK) };

            int count = int.Parse(Getvalue(query, parameters) ?? "0");

            return count > 0;
        }

        public bool KiemTraTonTaiMaKH(string maKH)
        {
            string query = "SELECT COUNT(*) FROM KhachHang WHERE MaKH = @MaKH";
            SqlParameter[] parameters = { new SqlParameter("@MaKH", maKH) };

            int count = int.Parse(Getvalue(query, parameters) ?? "0");

            return count > 0;
        }

        public void CapNhatHD(string mahd, string manv, string makh, string ngaydat, string pttt, string tonghd, string tt)
        {
            string updateQuery = "UPDATE HoaDonBan SET MaNV= @MaNV, MaKH = @MaKH," +
                "NgayDat= @NgayDat, PTTT= @PTTT, TongTienHD= @TongTienHD, TinhTrang= @TinhTrang WHERE MaHD=@MaHD";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", mahd);
                    command.Parameters.AddWithValue("@MaNV", manv);
                    command.Parameters.AddWithValue("@MaKH", makh);
                    command.Parameters.AddWithValue("@NgayDat", DateTime.Parse(ngaydat));
                    command.Parameters.AddWithValue("@PTTT", pttt);
                    command.Parameters.AddWithValue("@TongTienHD", tonghd);
                    command.Parameters.AddWithValue("@TinhTrang", tt);


                    command.ExecuteNonQuery();
                }
            }
        }

        public void XoaHD(string mahd)
        {
            string deleteQuery = "DELETE FROM HoaDonBan WHERE MaHD = @MaHD";
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", mahd);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        public void XoaCTHD(string maHD)
        {
            string query = "DELETE FROM CTHoaDonBan WHERE MaHD = @MaHD AND EXISTS (SELECT 1 FROM CTHoaDonBan WHERE MaHD = @MaHD)";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", maHD);
                    command.ExecuteNonQuery();
                }
            }
        }
        public bool KiemTraTonTaiCTHDTheoHD(string maHD)
        {
            string query = "SELECT COUNT(*) FROM CTHoaDonBan WHERE MaHD = @MaHD";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", maHD);

                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        public void XoaHDvaCTHD(string maHD)
        {
            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();

                // Bắt đầu một TRANSACTION
                SqlTransaction transaction = connection.BeginTransaction();

                try
                {
                    
                    string deleteCTPNQuery = "DELETE FROM CTHoaDonBan WHERE MaHD = @MaHD";
                    using (SqlCommand commandCTPN = new SqlCommand(deleteCTPNQuery, connection, transaction))
                    {
                        commandCTPN.Parameters.AddWithValue("@MaHD", maHD);
                        commandCTPN.ExecuteNonQuery();
                    }

                    
                    string deletePNQuery = "DELETE FROM HoaDonBan WHERE MaHD = @MaHD";
                    using (SqlCommand commandPN = new SqlCommand(deletePNQuery, connection, transaction))
                    {
                        commandPN.Parameters.AddWithValue("@MaHD", maHD);
                        commandPN.ExecuteNonQuery();
                    }

                    // COMMIT TRANSACTION nếu không có lỗi
                    transaction.Commit();

                    connection.Close();
                }
                catch (Exception ex)
                {
                    // Nếu có lỗi, ROLLBACK TRANSACTION và xử lý lỗi
                    transaction.Rollback();
                    connection.Close();
                    Console.WriteLine($"Lỗi khi hóa đơn và chi tiết hóa đơn bán: {ex.Message}");
                }
            }
        }

        public void CapNhatCTHD(string macthd, string masp, string sl, string dvt, string dongia, string thanhtien)
        {
            string updateQuery = "UPDATE CTHoaDonBan SET MaSP= @MaSP" +
                ",SLDat= @SLDat, Dvt= @Dvt, DonGia= @DonGia, ThanhTien=@ThanhTien WHERE MaHD=@MaHD";

            using (SqlConnection connection = new SqlConnection(chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(updateQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaHD", macthd);
                    command.Parameters.AddWithValue("@MaSP", masp);
                    command.Parameters.AddWithValue("@SLDat", sl);
                    command.Parameters.AddWithValue("@Dvt", dvt);
                    command.Parameters.AddWithValue("@DonGia", dongia);
                    command.Parameters.AddWithValue("@ThanhTien", thanhtien);

                    command.ExecuteNonQuery();
                }
            }
        }

        public void CapNhatTongHD(string maHD)
        {
            try
            {
                
                string sql = "SELECT SUM(ISNULL(ThanhTien, 0)) AS TongThanhTien FROM CTHoaDonBan WHERE MaHD = @MaHD";
                SqlParameter[] parameters = { new SqlParameter("@MaHD", maHD) };
                DataTable dt = GetData(sql, parameters);

                if (dt != null && dt.Rows.Count > 0)
                {
                    // Lấy giá trị tổng thành tiền
                    decimal tongThanhTien = Convert.ToDecimal(dt.Rows[0]["TongThanhTien"]);

                    // Cập nhật giá trị TongPN trong bảng PhieuNhap
                    string updateSql = "UPDATE HoaDonBan SET TongTienHD= @TongTienHD WHERE MaHD = @MaHD";
                    SqlParameter[] updateParameters = {
                        new SqlParameter("@TongTienHD", tongThanhTien),
                        new SqlParameter("@MaHD", maHD)
                    };
                    ExecuteNonQuery(updateSql, updateParameters);
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu cần thiết
                Console.WriteLine($"Lỗi khi cập nhật TongHD: {ex.Message}");
            }
        }

        public string LayMaHDTheoMaCTHD(string maHD)
        {
            string query = "SELECT MaHD FROM CTHoaDonBan WHERE MaHD = @MaHD";
            SqlParameter[] parameters = { new SqlParameter("@MaHD", maHD) };
            DataTable dt = GetData(query, parameters);

            if (dt != null && dt.Rows.Count > 0)
            {
                return dt.Rows[0]["MaHD"].ToString();
            }

            return string.Empty; // hoặc giá trị mặc định phù hợp với ứng dụng của bạn
        }

    }
}