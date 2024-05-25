using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemSP;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemKH : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<object> genders = LayGTKhachHang.GetGenderList(kn);

                //Gán dữ liệu vào dropdownlist
                ddlGioiTinh.DataTextField = "Text";
                ddlGioiTinh.DataValueField = "Value";

                foreach (string gender in genders)
                {
                    ddlGioiTinh.Items.Add(new ListItem(gender, gender));
                }
            }
        }
        CSDL kn=new CSDL();
        public class LayGTKhachHang
        {
            public static List<object> GetGenderList(CSDL kn)
            {
                List<object> listGender = new List<object>();

                string query = "SELECT GioiTinh FROM KhachHang";

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

        private void ThemKhachHang(string maKh, string hoTen, string gioiTinh, string sdt, string email, string diaChi)
        {
            string insertQuery = "INSERT INTO KhachHang (MaKH, HoTenKH, GioiTinh, SDTKH, Email, DiaChi)" +
                "VALUES (@MaKH, @HoTenKH, @GioiTinh, @SDTKH, @Email, @DiaChi)";

            using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaKH", maKh);
                    command.Parameters.AddWithValue("@HoTenKH", hoTen);
                    command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
                    command.Parameters.AddWithValue("@SDTKH", sdt);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string maKH = txtMaKH.Text;
            string hoTen = txtHoTen.Text;

            string gioiTinh = ddlGioiTinh.SelectedValue;

            string soDienThoai = txtSDT.Text;

            string email = txtEmail.Text;

            string diaChi = txtDiaChi.Text;

            try
            {
                ThemKhachHang(maKH, hoTen, gioiTinh, soDienThoai, email, diaChi);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm khách hàng thành công');", true);
                //chuyển hướng trang
                Response.Redirect("QLNhanVien.aspx");
            }
            catch(Exception ex) 
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm khách hàng thất bại. Lỗi: {ex.Message}');", true);
            }
        }
    }
}