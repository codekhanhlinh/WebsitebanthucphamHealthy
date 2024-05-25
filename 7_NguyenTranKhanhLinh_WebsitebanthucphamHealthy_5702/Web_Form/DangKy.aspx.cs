using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDK_Click(object sender, EventArgs e)
        {
            try
            {
                string hoTen = txtHoTen.Text;
                string tenDN = txtTenDN.Text;
                string gioiTinh = rdoGT.SelectedValue;
                string sdt = txtSDT.Text;
                string email = txtEmail.Text;
                string diaChi = txtDiaChi.Text;
                string matKhau = txtMK.Text;

                CSDL kn = new CSDL();
                kn.DangKyTaiKhoan(tenDN, matKhau, hoTen, gioiTinh, sdt, email, diaChi);
                string errorMessage = "Đăng ký tài khoản thành công ! Bạn hãy kiểm tra email nhé !";
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);

                Response.Redirect("DangNhap.aspx?success=true", true);
            }
            catch (Exception ex)
            {
                Log.Information("Data inserted successfully");

                // Display a user-friendly error message
                lblSuccessMessage.Text = "Đã xảy ra lỗi khi thực hiện đăng ký.";
                lblSuccessMessage.Visible = true;
            }
        }
        public static class Log
        {
            public static void Information(string message)
            {
                // Log informational messages
                Debug.WriteLine($"INFO: {message}");
                // You can also use other logging mechanisms like log files, database, etc.
            }

            public static void Error(string message)
            {
                // Log error messages
                Debug.WriteLine($"ERROR: {message}");
                // You can also use other logging mechanisms like log files, database, etc.
            }
        }
    }
}