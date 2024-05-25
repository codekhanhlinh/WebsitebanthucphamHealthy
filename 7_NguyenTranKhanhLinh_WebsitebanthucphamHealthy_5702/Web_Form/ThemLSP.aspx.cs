using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemLSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        CSDL kn = new CSDL();
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string malsp = txtMaLSP.Text;
            string tenlsp = txtTen.Text;

            try
            {
                // Attempt to add the product category
                ThemLSanPham(malsp, tenlsp);

                // Display a client-side alert for successful addition
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm loại sản phẩm thành công');", true);

                // Redirect only if the operation was successful
                Response.Redirect("QLLoaiSP.aspx");
            }
            catch (Exception ex)
            {
                // Handle the exception, e.g., display an error message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm loại sản phẩm thất bại. Lỗi: {ex.Message}');", true);
            }
        }

        private void ThemLSanPham(string malsp, string tenlsp)
        {
            string insertQuery = "INSERT INTO LoaiSP (MaLSP, TenLSP)" +
                "VALUES (@MaLSP, @TenLSP)";

            using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaLSP", malsp);
                    command.Parameters.AddWithValue("@TenLSP", tenlsp);
                  

                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }
    }
}