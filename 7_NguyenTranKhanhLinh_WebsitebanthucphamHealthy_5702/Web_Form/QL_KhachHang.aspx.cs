using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class QL_KhachHang : System.Web.UI.Page
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
            gridKH.RowUpdating += new GridViewUpdateEventHandler(gridKH_RowUpdating);
        }

        void loaddl()
        {
            string sql = "SELECT * FROM KhachHang";

            DataTable dt = kn.GetData(sql);

            if (dt.Rows.Count > 0)
            {
                gridKH.DataSource = dt;
                gridKH.DataBind();
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView");
            }
        }

        protected void gridKH_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlGioiTinh = (DropDownList)e.Row.FindControl("ddlGioiTinhKH");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlGioiTinh != null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtGioiTinh = kn.LayGTKhachHang();

                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtGioiTinh != null && dtGioiTinh.Rows.Count > 0)
                        {
                            // Xóa các mục hiện tại trong DropDownList
                            ddlGioiTinh.Items.Clear();

                            // Tạo một HashSet để theo dõi các giá trị duy nhất
                            HashSet<string> uniqueValues = new HashSet<string>();

                            // Lấy giá trị hiện tại của "GioiTinh" từ dữ liệu của GridView
                            string gioiTinhValue = DataBinder.Eval(e.Row.DataItem, "GioiTinh").ToString();

                            // Đặt giá trị đã chọn trong DropDownList
                            ddlGioiTinh.SelectedValue = gioiTinhValue;

                            // Duyệt qua dữ liệu và thêm giá trị duy nhất vào DropDownList
                            foreach (DataRow row in dtGioiTinh.Rows)
                            {
                                string optionValue = row["GioiTinh"].ToString();

                                // Kiểm tra tính duy nhất trước khi thêm vào DropDownList
                                if (!uniqueValues.Contains(optionValue))
                                {
                                    ddlGioiTinh.Items.Add(new ListItem(optionValue));
                                    uniqueValues.Add(optionValue);
                                }
                            }
                        }
                        else
                        {
                            // Ghi log thông điệp nếu không có dữ liệu để điền vào DropDownList
                            Debug.WriteLine("Không có dữ liệu để điền vào DropDownList.");
                        }
                    }
                }
            }
        }

        protected void gridKH_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridKH.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddl();
        }

        protected void gridKH_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string makh = gridKH.DataKeys[e.RowIndex].Values["MaKH"].ToString();

                // Find TextBox controls in the GridView for updating data
                TextBox txtHoTen = gridKH.Rows[e.RowIndex].FindControl("TextBoxHoTenKH") as TextBox;
                DropDownList ddlGT = gridKH.Rows[e.RowIndex].FindControl("ddlGioiTinhKH") as DropDownList;
                TextBox txtSDT = gridKH.Rows[e.RowIndex].FindControl("TextBoxSDTKH") as TextBox;
                TextBox txtEmail = gridKH.Rows[e.RowIndex].FindControl("TextBoxEmail") as TextBox;
                TextBox txtDiaChi = gridKH.Rows[e.RowIndex].FindControl("TextBoxDiaChi") as TextBox;

                if (txtHoTen != null && ddlGT != null && txtSDT != null && txtEmail != null
                    && txtDiaChi != null)
                {
                    string hoTen = txtHoTen.Text;
                    string gioiTinh = ddlGT.SelectedValue;
                    string sdt = txtSDT.Text;
                    string email = txtEmail.Text;
                    string diaChi = txtDiaChi.Text;


                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatKhachHang(makh, hoTen, gioiTinh, sdt, email, diaChi);

                    // Exit edit mode and rebind the GridView
                    gridKH.EditIndex = -1;
                    loaddl();
                }
                else
                {
                    string errorMessage = "Cập nhật khách hàng thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật khách hàng: {ex.Message}');", true);
            }
        }

        protected void gridKH_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string makh = gridKH.DataKeys[e.RowIndex].Values["MaKH"].ToString();

                kn.XoaKhachHang(makh);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa khách hàng thành công');", true);
                loaddl();
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridKH_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridKH.EditIndex = -1;
            loaddl();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemKH.aspx");
        }
    }
}
