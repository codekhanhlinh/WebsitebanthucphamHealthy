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
    public partial class QLPN_CTPN : System.Web.UI.Page
    {
        CSDL kn=new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(kn == null)
            {
                kn = new CSDL();
            }
            this.EnableViewState = true;
            if (!IsPostBack)
            {
                // Refresh GridView when the page is loaded for the first time
                loaddlPN();
                loaddlCTPN();
            }
            gridPN.RowUpdating += new GridViewUpdateEventHandler(gridPN_RowUpdating);
            gridCTPN.RowUpdating += new GridViewUpdateEventHandler(gridCTPN_RowUpdating);
        }

        void loaddlPN()
        {
            string sql = "SELECT PN.*, NV.HoTenNV, NCC.TenNCC " +
                                "FROM PhieuNhap PN " +
                                "INNER JOIN NhanVien NV ON PN.MaNV = NV.MaNV " +
                                "INNER JOIN NhaCungCap NCC ON PN.MaNCC = NCC.MaNCC";

            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridPN != null)
            {
                gridPN.DataSource = dt;
                gridPN.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
            }
        }
        
        void loaddlCTPN()
        {
            string sql1 = "SELECT CTPN.*, K.TenNL " +
                            "FROM CTPhieuNhap CTPN " +
                            "INNER JOIN KhoNL K ON CTPN.MaNL = K.MaNL";

            DataTable dt = kn.GetData(sql1);

            if (dt != null && dt.Rows.Count > 0 && gridCTPN != null)
            {
                gridCTPN.DataSource = dt;
                gridCTPN.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridCTPN is null");
            }
        }

        protected void gridPN_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Xử lý sự kiện chọn hàng ở đây
            int selectedIndex = gridPN.SelectedIndex;

            // Kiểm tra xem có hàng nào được chọn hay không
            if (selectedIndex >= 0 && selectedIndex < gridPN.Rows.Count)
            {
                // Lấy giá trị từ cột 'MaPN' của hàng được chọn
                string maPN = gridPN.DataKeys[selectedIndex]["MaPN"].ToString();

                // Gọi hàm để xử lý dữ liệu cho GridView khác (gridCTPN)
                LoadDataForGridCTPN(maPN);
            }
        }

        private void LoadDataForGridCTPN(string maPN)
        {
            DataTable dt = kn.LayDLCTPN(maPN);

            // Gán dữ liệu vào gridCTPN và gọi DataBind
            gridCTPN.DataSource = dt;
            gridCTPN.DataBind();
        }

        protected void gridPN_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlTenNV = (DropDownList)e.Row.FindControl("ddlTenNV");
                    DropDownList ddlTenNCC = (DropDownList)e.Row.FindControl("ddlTenNCC");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlTenNV != null && ddlTenNCC != null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtTenNV = kn.LayDSNV();
                        DataTable dtTenNCC = kn.LayDSNCC();

                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtTenNV != null && dtTenNV.Rows.Count > 0 && dtTenNCC!= null && dtTenNCC.Rows.Count > 0)
                        {
                            ddlTenNV.DataSource = dtTenNV;
                            ddlTenNV.DataTextField = "HoTenNV";
                            ddlTenNV.DataValueField = "MaNV";
                            ddlTenNV.DataBind();

                            ddlTenNCC.DataSource = dtTenNCC;
                            ddlTenNCC.DataTextField = "TenNCC";
                            ddlTenNCC.DataValueField = "MaNCC";
                            ddlTenNCC.DataBind();
                        }
                    }
                }
            }
        }

        protected void gridPN_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridPN.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddlPN();
        }
        protected void gridPN_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mapn = gridPN.DataKeys[e.RowIndex].Values["MaPN"].ToString();

                // Find TextBox controls in the GridView for updating data
                DropDownList ddlTenNV = gridPN.Rows[e.RowIndex].FindControl("ddlTenNV") as DropDownList;
                DropDownList ddlTenNCC = gridPN.Rows[e.RowIndex].FindControl("ddlTenNCC") as DropDownList;
                TextBox txtNgay = gridPN.Rows[e.RowIndex].FindControl("TextBoxNgayNhap") as TextBox;
                TextBox txtTong = gridPN.Rows[e.RowIndex].FindControl("TextBoxTongPN") as TextBox;


                if (ddlTenNV != null && ddlTenNCC != null && txtNgay != null
                     && txtTong != null)
                {
                    string tennv = ddlTenNV.SelectedValue;
                    string tenncc = ddlTenNCC.SelectedValue;
                    string ngaynhap = txtNgay.Text;
                    string tongpn = txtTong.Text;
                   

                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatPN(mapn, tennv, tenncc, ngaynhap, tongpn);

                    // Exit edit mode and rebind the GridView
                    gridPN.EditIndex = -1;
                    string errorMessage = "Cập nhật phiếu nhập thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                    loaddlPN();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật phiếu nhập: {ex.Message}');", true);
            }
        }


        protected void gridCTPN_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlTenNL = (DropDownList)e.Row.FindControl("ddlTenNL");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlTenNL != null )
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtTenNL = kn.LayDSNL();
                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtTenNL != null && dtTenNL.Rows.Count > 0 )
                        {
                            ddlTenNL.DataSource = dtTenNL;
                            ddlTenNL.DataTextField = "TenNL";
                            ddlTenNL.DataValueField = "MaNL";
                            ddlTenNL.DataBind();
                        }
                    }
                }
            }
        }
        protected void gridPN_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mapn = gridPN.DataKeys[e.RowIndex].Values["MaPN"].ToString();

                if (kn.KiemTraTonTaiSanPhamTheoMaLSP(mapn))
                {
                    kn.XoaPNvaCTPN(mapn);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa phiếu nhập thành công');", true);
                    loaddlPN();
                    loaddlCTPN();
                }
                else
                {
                    kn.XoaPN(mapn);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa phiếu nhập thành công');", true);
                    loaddlPN();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridPN_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            gridPN.EditIndex = -1;
            loaddlPN();
        }


        protected void gridCTPN_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridCTPN.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddlCTPN();
        }


        protected void gridCTPN_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mactpn = gridCTPN.DataKeys[e.RowIndex].Values["MaPN"].ToString();

                // Find TextBox controls in the GridView for updating data
                DropDownList ddlTenNL = gridCTPN.Rows[e.RowIndex].FindControl("ddlTenNL") as DropDownList;
                TextBox txtSLNhap = gridCTPN.Rows[e.RowIndex].FindControl("TextBoxSL") as TextBox;
                TextBox txtDvt = gridCTPN.Rows[e.RowIndex].FindControl("TextBoxDvt") as TextBox;
                TextBox txtGia = gridCTPN.Rows[e.RowIndex].FindControl("TextBoxGN") as TextBox;
                TextBox txtTT = gridCTPN.Rows[e.RowIndex].FindControl("TextBoxTT") as TextBox;


                if (ddlTenNL != null && txtSLNhap != null
                     && txtDvt != null && txtGia != null && txtTT!= null)
                {
                    string tennl = ddlTenNL.SelectedValue;
                    string sl = txtSLNhap.Text;
                    string dvt = txtDvt.Text;
                    string gia = txtGia.Text;


                    // Tính toán ThanhTien
                    decimal thanhTien = 0;
                    if (!string.IsNullOrEmpty(sl) && !string.IsNullOrEmpty(gia))
                    {
                        thanhTien = Convert.ToDecimal(sl) * Convert.ToDecimal(gia);
                    }

                    // Cập nhật TextBoxTT với giá trị tính toán
                    txtTT.Text = thanhTien.ToString();

                    // Gọi phương thức CapNhatCTPN trong lớp CSDL của bạn
                    kn.CapNhatCTPN(mactpn, tennl, sl, dvt, gia, txtTT.Text);

                    // Tính toán và cập nhật TongPN trong PhieuNhap
                    string mapn = kn.LayMaPNTheoMaCTPN(mactpn);
                    kn.CapNhatTongPN(mapn);

                    // Exit edit mode and rebind the GridView
                    gridCTPN.EditIndex = -1;
                    string errorMessage = "Cập nhật chi tiết phiếu nhập thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                    loaddlCTPN();
                    loaddlPN();
                }
                else
                {
                    string errorMessage = "Cập nhật chi tiết phiếu nhập thất bại";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật chi tiết phiếu nhập: {ex.Message}');", true);
            }
        }

        protected void gridCTPN_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mactpn = gridCTPN.DataKeys[e.RowIndex].Values["MaPN"].ToString();
                kn.XoaCTPN(mactpn);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa chi tiết phiếu nhập thành công');", true);
                loaddlCTPN();
                loaddlPN();

            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridCTPN_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            gridCTPN.EditIndex = -1;
            loaddlCTPN();
        }
    }
}