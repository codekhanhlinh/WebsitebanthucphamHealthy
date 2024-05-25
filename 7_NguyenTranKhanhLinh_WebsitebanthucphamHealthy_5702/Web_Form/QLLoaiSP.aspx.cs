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
    public partial class QLLoaiSP : System.Web.UI.Page
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
            gridLSP.RowUpdating += new GridViewUpdateEventHandler(gridLSP_RowUpdating);
        }

        void loaddl()
        {
            string sql = "SELECT * FROM LoaiSP";

            DataTable dt = kn.GetData(sql);

            if (dt.Rows.Count > 0)
            {
                gridLSP.DataSource = dt;
                gridLSP.DataBind();
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView");
            }
        }

        protected void gridLSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridLSP.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddl();
        }

        protected void gridLSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string malsp = gridLSP.DataKeys[e.RowIndex].Values["MaLSP"].ToString();

                // Find TextBox controls in the GridView for updating data
                TextBox txttenlsp = gridLSP.Rows[e.RowIndex].FindControl("TextBoxTenLSP") as TextBox;

                if (txttenlsp != null)
                {
                    string tenlsp = txttenlsp.Text;
                

                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatLSP(malsp, tenlsp);

                    // Exit edit mode and rebind the GridView
                    gridLSP.EditIndex = -1;
                    loaddl();
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                string successMessage = "Cập nhật loại sản phẩm thành công";
                ScriptManager.RegisterStartupScript(this, GetType(), "showSuccess", $"alert('{successMessage}');", true);
            }
        }

        protected void gridLSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string malsp = gridLSP.DataKeys[e.RowIndex].Values["MaLSP"].ToString();

                if (kn.KiemTraTonTaiSanPhamTheoMaLSP(malsp))
                {
                    kn.XoaSanPhamVaLoaiSanPham(malsp);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa loại sản phẩm thành công');", true);
                    loaddl();
                }
                else
                {
                    // Nếu không có dữ liệu liên quan, thực hiện xóa loại sản phẩm
                    kn.XoaLSP(malsp);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa loại sản phẩm thành công');", true);
                    loaddl();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridLSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            gridLSP.EditIndex = -1;
            loaddl();
        }

    }
}