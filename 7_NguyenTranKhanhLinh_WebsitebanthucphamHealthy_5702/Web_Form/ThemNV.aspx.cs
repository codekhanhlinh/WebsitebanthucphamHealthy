using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemNV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<object> genders = LayGTNhanVien.GetGenderList(kn);

                //Gán dữ liệu vào dropdownlist
                ddlGioiTinh.DataTextField = "Text";
                ddlGioiTinh.DataValueField = "Value";

                foreach (string gender in genders)
                {
                    ddlGioiTinh.Items.Add(new ListItem(gender, gender));
                }
            }
        }
        CSDL kn = new CSDL();
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string maNV = txtMaNV.Text;
            string hoTen = txtHoTen.Text;

            string gioiTinh = ddlGioiTinh.SelectedValue;

            string ngaySinh = txtNgaySinh.Text;

            string soDienThoai = txtSDT.Text;

            string email = txtEmail.Text;

            string diaChi = txtDiaChi.Text;

            string ngayVaoLam = txtNVL.Text;

            string chucVu = txtChucVu.Text;
            try
            {

                ThemNhanVien(maNV, hoTen, gioiTinh, ngaySinh, soDienThoai, email, diaChi, ngayVaoLam, chucVu);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm nhân viên thành công');", true);
                //chuyển hướng trang
                Response.Redirect("QLNhanVien.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm nhân viên thất bại. Lỗi: {ex.Message}');", true);
            }
        }
        public class LayGTNhanVien
        {
            public static List<object> GetGenderList(CSDL kn)
            {
                List<object> listGender = new List<object>();

                string query = "SELECT GioiTinh FROM NhanVien";

                DataTable dt = kn.GetData(query);

                foreach (DataRow row in dt.Rows)
                {
                    if (!listGender.Contains(row["GioiTinh"]))
                    {
                        listGender.Add(row["GioiTinh"]);
                    }


                }
                return listGender;
            }
        }

        private void ThemNhanVien(string maNv, string hoTen, string gioiTinh, string ngaySinh, string sdt, string email, string diaChi, string ngayVaoLam, string chucVu)
        {
            string insertQuery = "INSERT INTO NhanVien (MaNV, HoTenNV, GioiTinh, NgaySinh, SDT, Email, DiaChi, NgayVaoLam, ChucVu)" +
                "VALUES (@MaNV, @HoTenNV, @GioiTinh, @NgaySinh, @SDT, @Email, @DiaChi, @NgayVaoLam, @ChucVu)";

            using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
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
    }
}