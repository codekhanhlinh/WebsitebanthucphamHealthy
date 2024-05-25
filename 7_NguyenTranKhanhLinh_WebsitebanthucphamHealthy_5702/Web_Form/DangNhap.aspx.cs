using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class DangNhap1 : System.Web.UI.Page
    {
        private readonly CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDN_Click(object sender, EventArgs e)
        {
            string tendn = txtTenDN.Text;
            string matkhau = txtMK.Text;

            string query = "SELECT * FROM TaiKhoanKH WHERE TenDN=@TenDN AND MatKhau=@MatKhau";

            // Parameters for the query
            SqlParameter[] parameters = {
                new SqlParameter("@TenDN", SqlDbType.NVarChar) { Value = tendn },
                new SqlParameter("@MatKhau", SqlDbType.NVarChar) { Value = matkhau }
            };

            DataTable result = new DataTable();
            //bool dangNhapThanhCong = false;
            using (SqlConnection connection = kn.getConnection())
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddRange(parameters);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(result);
                    }
                }
            }

            if (result.Rows.Count > 0)
            {
                //dangNhapThanhCong = true
                if (rdlOptions.SelectedValue == "1")
                {
                    string errorMessage = "Đăng nhập thành công";
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + errorMessage + "');", true);
                    Response.Redirect("/Web_Form/TrangChuSauDN.aspx");
                }
                else if (rdlOptions.SelectedValue == "2")
                {
                    Response.Write("Login Successful for option 2");
                }
            }
            else
            {
                // Failed login
                string errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + errorMessage + "');", true);
            }

            if (rdlOptions.SelectedValue == "2" && tendn.ToLower() == "admin" && matkhau == "admin2023")
            {
                // Đăng nhập thành công với Option có giá trị 2 và tên đăng nhập "amin" và mật khẩu "admin2023"
   
                Response.Redirect("/Web_Form/QL_KhachHang.aspx");
               
            }
            else
            {
                string errorMessage = "Tên đăng nhập hoặc mật khẩu không đúng";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + errorMessage + "');", true);
            }
        }

        protected void btnDK_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Web_Form/DangKy.aspx");
        }
    }
}
