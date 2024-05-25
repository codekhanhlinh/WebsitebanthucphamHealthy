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
    public partial class QLHDB_CTHDB : System.Web.UI.Page
    {
        CSDL kn= new CSDL();
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
                loaddlHD();
                loaddlCTHD();
            }
            gridHD.RowUpdating += new GridViewUpdateEventHandler(gridHD_RowUpdating);
            gridCTHD.RowUpdating += new GridViewUpdateEventHandler(gridCTHD_RowUpdating);
        }

        void loaddlHD()
        {
            string sql = "SELECT HD.*, NV.HoTenNV, KH.HoTenKH " +
                                "FROM HoaDonBan HD " +
                                "INNER JOIN NhanVien NV ON HD.MaNV = NV.MaNV " +
                                "INNER JOIN KhachHang KH ON HD.MaKH = KH.MaKH";

            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridHD != null)
            {
                gridHD.DataSource = dt;
                gridHD.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
            }
        }

        void loaddlCTHD()
        {
            string sql1 = "SELECT CTHD.*, P.TenSP " +
                            "FROM CTHoaDonBan CTHD " +
                            "INNER JOIN SanPham P ON CTHD.MaSP = P.MaSP";

            DataTable dt = kn.GetData(sql1);

            if (dt != null && dt.Rows.Count > 0 && gridCTHD != null)
            {
                gridCTHD.DataSource = dt;
                gridCTHD.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridCTPN is null");
            }
        }

        protected void gridHD_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Xử lý sự kiện chọn hàng ở đây
            int selectedIndex = gridHD.SelectedIndex;

            // Kiểm tra xem có hàng nào được chọn hay không
            if (selectedIndex >= 0 && selectedIndex < gridHD.Rows.Count)
            {
                // Lấy giá trị từ cột 'MaPN' của hàng được chọn
                string maHD = gridHD.DataKeys[selectedIndex]["MaHD"].ToString();

                // Gọi hàm để xử lý dữ liệu cho GridView khác (gridCTPN)
                LoadDataForGridCTHD(maHD);
            }
        }

        private void LoadDataForGridCTHD(string maHD)
        {
            DataTable dt = kn.LayDLCTHD(maHD);

            // Gán dữ liệu vào gridCTPN và gọi DataBind
            gridCTHD.DataSource = dt;
            gridCTHD.DataBind();
        }

        protected void gridHD_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlTenNV = (DropDownList)e.Row.FindControl("ddlTenNV");
                    DropDownList ddlTenKH = (DropDownList)e.Row.FindControl("ddlTenKH");
                    DropDownList ddlPTTT = (DropDownList)e.Row.FindControl("ddlPTTT");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlTenNV != null && ddlTenKH != null && ddlPTTT!=null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtTenNV = kn.LayDSNV();
                        DataTable dtTenKH = kn.LayDSKH();
                        DataTable dtPTTT = kn.LayPTTT();

                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtTenNV != null && dtTenNV.Rows.Count > 0 && dtTenKH != null && dtTenKH.Rows.Count > 0
                            && dtPTTT != null && dtPTTT.Rows.Count > 0)
                        {
                            ddlTenNV.DataSource = dtTenNV;
                            ddlTenNV.DataTextField = "HoTenNV";
                            ddlTenNV.DataValueField = "MaNV";
                            ddlTenNV.DataBind();

                            ddlTenKH.DataSource = dtTenKH;
                            ddlTenKH.DataTextField = "HoTenKH";
                            ddlTenKH.DataValueField = "MaKH";
                            ddlTenKH.DataBind();

                            ddlPTTT.Items.Clear();
                            // Tạo một HashSet để theo dõi các giá trị duy nhất
                            HashSet<string> uniqueValuesDvt = new HashSet<string>();

                            foreach (DataRow row in dtPTTT.Rows)
                            {
                                string optionValue = row["PTTT"].ToString();

                                // Kiểm tra tính duy nhất trước khi thêm vào DropDownList
                                if (!uniqueValuesDvt.Contains(optionValue))
                                {
                                    ddlPTTT.Items.Add(new ListItem(optionValue));
                                    uniqueValuesDvt.Add(optionValue);
                                }
                            }
                            string PTTTValue = DataBinder.Eval(e.Row.DataItem, "PTTT").ToString();
                            ddlPTTT.SelectedValue = PTTTValue;
                        }
                    }
                }
            }
        }
        protected void gridCTHD_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlTenSP = (DropDownList)e.Row.FindControl("ddlTenSP");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlTenSP != null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtTenSP = kn.LayDSSP();
                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtTenSP != null && dtTenSP.Rows.Count > 0)
                        {
                            ddlTenSP.DataSource = dtTenSP;
                            ddlTenSP.DataTextField = "TenSP";
                            ddlTenSP.DataValueField = "MaSP";
                            ddlTenSP.DataBind();
                        }
                    }
                }
            }
        }

        protected void gridHD_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridHD.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddlHD();
        }
        protected void gridHD_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string mahd = gridHD.DataKeys[e.RowIndex].Values["MaHD"].ToString();

                // Find TextBox controls in the GridView for updating data
                DropDownList ddlTenNV = gridHD.Rows[e.RowIndex].FindControl("ddlTenNV") as DropDownList;
                DropDownList ddlTenKH = gridHD.Rows[e.RowIndex].FindControl("ddlTenKH") as DropDownList;
                TextBox txtNgay = gridHD.Rows[e.RowIndex].FindControl("TextBoxNgayDat") as TextBox;
                DropDownList ddlPTTT = gridHD.Rows[e.RowIndex].FindControl("ddlPTTT") as DropDownList;
                TextBox txtTongHD = gridHD.Rows[e.RowIndex].FindControl("TextBoxTongHD") as TextBox;
                TextBox txtTT = gridHD.Rows[e.RowIndex].FindControl("TextBoxTT") as TextBox;


                if (ddlTenNV != null && ddlTenKH != null && txtNgay != null && ddlPTTT != null && txtTT != null
                     && txtTongHD != null)
                {
                    string tennv = ddlTenNV.SelectedValue;
                    string tenkh = ddlTenKH.SelectedValue;
                    string ngaydat = txtNgay.Text;
                    string pttt = ddlPTTT.SelectedValue;
                    string tonghd = txtTongHD.Text;
                    string tt=txtTT.Text;


                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatHD(mahd, tennv, tenkh, ngaydat, pttt, tonghd, tt);

                    // Exit edit mode and rebind the GridView
                    gridHD.EditIndex = -1;
                    string errorMessage = "Cập nhật hóa đơn thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                    loaddlHD();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật hóa đơn: {ex.Message}');", true);
            }
        }

        protected void gridHD_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string mahd = gridHD.DataKeys[e.RowIndex].Values["MaHD"].ToString();

                if (kn.KiemTraTonTaiCTHDTheoHD(mahd))
                {
                    kn.XoaHDvaCTHD(mahd);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa hóa đơn thành công');", true);
                    loaddlHD();
                    loaddlCTHD();
                }
                else
                {
                    kn.XoaHD(mahd);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa hóa đơn thành công');", true);
                    loaddlHD();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void gridHD_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            // Exit edit mode without updating
            gridHD.EditIndex = -1;
            loaddlHD();
        }


        protected void gridCTHD_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridCTHD.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddlCTHD();
        }
        protected void gridCTHD_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string macthd = gridCTHD.DataKeys[e.RowIndex].Values["MaHD"].ToString();

                // Find TextBox controls in the GridView for updating data
                DropDownList ddlTenSP = gridCTHD.Rows[e.RowIndex].FindControl("ddlTenSP") as DropDownList;
                TextBox txtSL = gridCTHD.Rows[e.RowIndex].FindControl("TextBoxSL") as TextBox;
                TextBox txtDvt = gridCTHD.Rows[e.RowIndex].FindControl("TextBoxDvt") as TextBox;
                TextBox txtGia = gridCTHD.Rows[e.RowIndex].FindControl("TextBoxGia") as TextBox;
                TextBox txtTT = gridCTHD.Rows[e.RowIndex].FindControl("TextBoxTT") as TextBox;


                if (ddlTenSP != null && txtSL != null
                     && txtDvt != null && txtGia != null && txtTT != null)
                {
                    string tensp = ddlTenSP.SelectedValue;
                    string sl = txtSL.Text;
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
                    kn.CapNhatCTHD(macthd, tensp, sl, dvt, gia, txtTT.Text);

                    // Tính toán và cập nhật TongPN trong PhieuNhap
                    string mahd = kn.LayMaHDTheoMaCTHD(macthd);
                    kn.CapNhatTongHD(mahd);

                    // Exit edit mode and rebind the GridView
                    gridCTHD.EditIndex = -1;
                    string errorMessage = "Cập nhật chi tiết hóa đơn bán thành công";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                    loaddlCTHD();
                    loaddlHD();
                }
                else
                {
                    string errorMessage = "Cập nhật chi tiết hóa đơn bán thất bại";
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('{errorMessage}');", true);
                }
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có bất kỳ lỗi nào xảy ra trong quá trình cập nhật
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật chi tiết hóa đơn bán {ex.Message}');", true);
            }
        }

            protected void gridCTHD_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                try
                {
                    string macthd = gridCTHD.DataKeys[e.RowIndex].Values["MaHD"].ToString();
                    kn.XoaCTHD(macthd);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa chi tiết hóa đơn bán thành công');", true);
                    loaddlCTHD();
                    loaddlHD();

                }
                catch (Exception ex)
                {
                    Response.Write("Lỗi: " + ex.Message);
                }
            }

            protected void gridCTHD_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                // Exit edit mode without updating
                gridCTHD.EditIndex = -1;
                loaddlCTHD();
            }
    }
 }
