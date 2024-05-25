using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemSP;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemNCC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
   
        }
        CSDL kn=new CSDL();
        private void ThemNhaCC(string maNcc, string Ten, string sdt, string email, string diaChi)
        {
            string insertQuery = "INSERT INTO NhaCungCap (MaNCC, TenNCC, SDT, Email, DiaChi)" +
                "VALUES (@MaNCC, @TenNCC, @SDT, @Email, @DiaChi)";

            using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNCC", maNcc);
                    command.Parameters.AddWithValue("@TenNCC", Ten);
                    command.Parameters.AddWithValue("@SDT", sdt);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@DiaChi", diaChi);
         

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string maNCC = txtMaNCC.Text;
            string Ten = txtTen.Text;

            string soDienThoai = txtSDT.Text;

            string email = txtEmail.Text;

            string diaChi = txtDiaChi.Text;

            try
            {
                ThemNhaCC(maNCC, Ten, soDienThoai, email, diaChi);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm nhà cung cấp thành công');", true);
                //chuyển hướng trang
                Response.Redirect("QLNhaCungCap.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm nhà cung cấp thất bại. Lỗi: {ex.Message}');", true);
            }
        }
    }
}