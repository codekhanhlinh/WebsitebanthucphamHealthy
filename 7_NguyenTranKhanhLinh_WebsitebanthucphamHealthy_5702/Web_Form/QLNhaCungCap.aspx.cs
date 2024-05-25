using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class QLNhaCungCap : System.Web.UI.Page
    {
        CSDL kn=new CSDL();
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
            gridNCC.RowUpdating += new GridViewUpdateEventHandler(gridNCC_RowUpdating);
        }

        void loaddl()
        {
            string sql = "SELECT * FROM NhaCungCap";

            DataTable dt = kn.GetData(sql);

            if (dt.Rows.Count > 0)
            {
                gridNCC.DataSource = dt;
                gridNCC.DataBind();
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView");
            }
        }

        protected void gridNCC_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridNCC.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddl();
        }

        protected void gridNCC_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mancc = gridNCC.DataKeys[e.RowIndex].Values["MaNCC"].ToString();

                // Find TextBox controls in the GridView for updating data
                TextBox txtTen = gridNCC.Rows[e.RowIndex].FindControl("TextBoxTenNCC") as TextBox;
                TextBox txtSDT = gridNCC.Rows[e.RowIndex].FindControl("TextBoxSDT") as TextBox;
                TextBox txtEmail = gridNCC.Rows[e.RowIndex].FindControl("TextBoxEmail") as TextBox;
                TextBox txtDiaChi = gridNCC.Rows[e.RowIndex].FindControl("TextBoxDiaChi") as TextBox;

                if (txtTen != null && txtSDT != null && txtEmail != null
                    && txtDiaChi != null)
                {
                    string ten = txtTen.Text;
                    string sdt = txtSDT.Text;
                    string email = txtEmail.Text;
                    string diaChi = txtDiaChi.Text;


                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatNCC(mancc,ten, sdt, email, diaChi);

                    // Exit edit mode and rebind the GridView
                    gridNCC.EditIndex = -1;
                    string errorMessage = "Cập nhật nhà cung cấp thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                    loaddl();
                }
                else
                {
                   
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật nhà cung cấp: {ex.Message}');", true);
            }
        }

        protected void gridNCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mancc = gridNCC.DataKeys[e.RowIndex].Values["MaNCC"].ToString();

                kn.XoaNCC(mancc);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa nhà cung cấp thành công');", true);
                loaddl();
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridNCC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridNCC.EditIndex = -1;
            loaddl();
        }
    }
}