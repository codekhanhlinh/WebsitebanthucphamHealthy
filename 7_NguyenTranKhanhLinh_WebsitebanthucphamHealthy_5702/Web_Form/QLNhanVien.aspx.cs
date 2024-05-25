using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class QLNhanVien : System.Web.UI.Page
    {
        CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (kn == null)
            {
                kn = new CSDL();
            }
            this.EnableViewState = true;
            if (!IsPostBack)
            {
                // Refresh GridView when the page is loaded for the first time
                loaddl();
            }
            gridNhanVien.RowUpdating += new GridViewUpdateEventHandler(gridNhanVien_RowUpdating);
        }

        void loaddl()
        {
            string sql = "SELECT * FROM NhanVien";

            DataTable dt = kn.GetData(sql);

            if (dt.Rows.Count > 0)
            {
                gridNhanVien.DataSource = dt;
                gridNhanVien.DataBind();
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView");
            }
        }

        protected void gridNhanVien_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridNhanVien.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddl();
        }

        protected void gridNhanVien_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string maNv = gridNhanVien.DataKeys[e.RowIndex].Values["MaNV"].ToString();

                // Find TextBox controls in the GridView for updating data
                TextBox txtHoTen = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxHoTenNV") as TextBox;
                TextBox txtGioiTinh = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxGioiTinh") as TextBox;
                TextBox txtNgaySinh = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxNgaySinh") as TextBox;
                TextBox txtSDT = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxSDT") as TextBox;
                TextBox txtEmail = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxEmail") as TextBox;
                TextBox txtDiaChi = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxDiaChi") as TextBox;
                TextBox txtNgayVaoLam = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxNgayVaoLam") as TextBox;
                TextBox txtChucVu = gridNhanVien.Rows[e.RowIndex].FindControl("TextBoxChucVu") as TextBox;

                if (txtHoTen != null && txtGioiTinh != null && txtNgaySinh != null && txtSDT != null && txtEmail != null
                    && txtDiaChi != null && txtNgayVaoLam != null && txtChucVu != null)
                {
                    string hoTen = txtHoTen.Text;
                    string gioiTinh = txtGioiTinh.Text;
                    string ngaySinh = txtNgaySinh.Text;
                    string sdt = txtSDT.Text;
                    string email = txtEmail.Text;
                    string diaChi = txtDiaChi.Text;
                    string ngayVaoLam = txtNgayVaoLam.Text;
                    string chucVu = txtChucVu.Text;

                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatNhanVien(maNv, hoTen, gioiTinh, ngaySinh, sdt, email, diaChi, ngayVaoLam, chucVu);

                    // Exit edit mode and rebind the GridView
                    gridNhanVien.EditIndex = -1;
                    loaddl();
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                string successMessage = "Cập nhật nhân viên thành công";
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess", $"alert('{successMessage}');", true);
            }
        }

        protected void gridNhanVien_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string maNv = gridNhanVien.DataKeys[e.RowIndex].Values["MaNV"].ToString();

                kn.XoaNhanVien(maNv);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa nhân viên thành công');", true);
                loaddl();
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridNhanVien_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            gridNhanVien.EditIndex = -1;
            loaddl();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    string maNV = ((TextBox)gridNhanVien.FooterRow.FindControl("txtMaNV"))?.Text;
            //    string hoTen = ((TextBox)gridNhanVien.FooterRow.FindControl("txtHoTen"))?.Text;
            //    string gioiTinh = ((TextBox)gridNhanVien.FooterRow.FindControl("txtGioiTinh"))?.Text;
            //    string ngaySinh = ((TextBox)gridNhanVien.FooterRow.FindControl("txtNgaySinh"))?.Text;
            //    string sdt = ((TextBox)gridNhanVien.FooterRow.FindControl("txtSDT"))?.Text;
            //    string email = ((TextBox)gridNhanVien.FooterRow.FindControl("txtEmail")).Text;
            //    string diaChi = ((TextBox)gridNhanVien.FooterRow.FindControl("txtDiaChi"))?.Text;
            //    string ngayVaoLam = ((TextBox)gridNhanVien.FooterRow.FindControl("txtNgayVaoLam")).Text;
            //    string chucVu = ((TextBox)gridNhanVien.FooterRow.FindControl("txtChucVu"))?.Text;

            //    // Use parameters in the SQL query to prevent SQL injection
            //    string sql = "INSERT INTO NhanVien (HoTenNV, GioiTinh, NgaySinh, SDT, Email, DiaChi, NgayVaoLam, ChucVu) " +
            //                 "VALUES (@HoTen, @GioiTinh, @NgaySinh, @SDT, @Email, @DiaChi, @NgayVaoLam, @ChucVu)";

            //    using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            //    {
            //        connection.Open();

            //        using (SqlCommand command = new SqlCommand(sql, connection))
            //        {
            //            // Add parameters
            //            command.Parameters.AddWithValue("@HoTen", hoTen);
            //            command.Parameters.AddWithValue("@GioiTinh", gioiTinh);
            //            command.Parameters.AddWithValue("@NgaySinh", ngaySinh);
            //            command.Parameters.AddWithValue("@SDT", sdt);
            //            command.Parameters.AddWithValue("@Email", email);
            //            command.Parameters.AddWithValue("@DiaChi", diaChi);
            //            command.Parameters.AddWithValue("@NgayVaoLam", ngayVaoLam);
            //            command.Parameters.AddWithValue("@ChucVu", chucVu);

            //            // Execute the query
            //            command.ExecuteNonQuery();
            //        }
            //    }

            //    // Set the GridView back to normal mode
            //    gridNhanVien.EditIndex = -1;
            //    gridNhanVien.ShowFooter = false;
            //    loaddl();
            //}
            //catch (Exception ex)
            //{
            //    Response.Write("Lỗi: " + ex.Message);
            //}
            Response.Redirect("ThemNV.aspx");
        }
    }
}