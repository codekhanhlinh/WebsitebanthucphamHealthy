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
    public partial class QLSanPham : System.Web.UI.Page
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
                if (Session["SearchTerm"] != null)
                {
                    string searchTerm = Session["SearchTerm"].ToString();
                    LoadProductsBySearchTerm(searchTerm);
                    Session.Remove("SearchTerm");
                }
            }
            gridSP.RowUpdating += new GridViewUpdateEventHandler(gridSP_RowUpdating);
        }
        void loaddl()
        {
            try
            {
                // Query to link GridView with data from the database
                string query = "SELECT S.*, L.TenLSP " +
                                "FROM SanPham S " +
                                "INNER JOIN LoaiSP L ON S.MaLSP = L.MaLSP ";

                DataTable table = kn.GetData(query);

                if (table != null && table.Rows.Count > 0)
                {
                    gridSP.DataSource = table;
                    gridSP.DataBind();
                }
                else
                {
                    // Display a message or log an error if there is no data
                    Debug.WriteLine("No data to bind to GridView.");
                }
            }
            catch (Exception ex)
            {
                // Handle the error if any
                Debug.WriteLine("Error binding GridView: " + ex.Message);
            }
        }

        //void loaddlTim(string searchKeyword)
        //{
        //    try
        //    {
        //        // Query to link GridView with data from the database
        //        string query = "SELECT S.*, L.TenLSP " +
        //               "FROM SanPham S " +
        //               "INNER JOIN LoaiSP L ON S.MaLSP = L.MaLSP " +
        //               $"WHERE S.TenSP LIKE '%{searchKeyword}%'";

        //        DataTable table = kn.GetData(query);

        //        if (table != null && table.Rows.Count > 0)
        //        {
        //            gridSP.DataSource = table;
        //            gridSP.DataBind();
        //        }
        //        else
        //        {
        //            // Display a message or log an error if there is no data
        //            Debug.WriteLine("No data to bind to GridView.");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle the error if any
        //        Debug.WriteLine("Error binding GridView: " + ex.Message);
        //    }
        //}

        private void LoadProductsBySearchTerm(string searchKeyword)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy sản phẩm dựa trên tên sản phẩm
            DataTable productsTable = GetProductsBySearchTermFromDatabase(searchKeyword);

            // Gán dữ liệu vào DataList1
            gridSP.DataSource = productsTable;
            gridSP.DataBind();
        }

        private DataTable GetProductsBySearchTermFromDatabase(string searchKeyword)
        {
            string query = "SELECT S.*, L.TenLSP " +
                       "FROM SanPham S " +
                       "INNER JOIN LoaiSP L ON S.MaLSP = L.MaLSP " +
                       "WHERE S.TenSP LIKE @searchKeyword";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@searchKeyword", "%" + searchKeyword + "%")
            };

            DataTable dataTable = kn.GetData(query, parameters);

            return dataTable;
        }

        protected void gridSP_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridSP.PageIndex = e.NewPageIndex;
            // Refresh GridView with new data from the new page
            loaddl();
        }

        protected void gridSP_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlLSP = (DropDownList)e.Row.FindControl("ddlLSP");
                    DropDownList ddlDvt = (DropDownList)e.Row.FindControl("ddlDvt");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlDvt != null && ddlLSP != null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtLSP = kn.LayLSP();
                        DataTable dtDvt = kn.LayDvtSP();
                        

                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtDvt != null && dtDvt.Rows.Count > 0 && dtLSP != null && dtLSP.Rows.Count > 0)
                        {
                            // Xóa các mục hiện tại trong DropDownList
                            ddlDvt.Items.Clear();
                            //ddlLSP.Items.Clear();
                            // Tạo một HashSet để theo dõi các giá trị duy nhất
                            HashSet<string> uniqueValuesDvt = new HashSet<string>();
                            //HashSet<string> uniqueValuesLSP = new HashSet<string>();

                            // Duyệt qua dữ liệu và thêm giá trị duy nhất vào DropDownList
                            foreach (DataRow row in dtDvt.Rows)
                            {
                                string optionValue = row["Dvt"].ToString();

                                // Kiểm tra tính duy nhất trước khi thêm vào DropDownList
                                if (!uniqueValuesDvt.Contains(optionValue))
                                {
                                    ddlDvt.Items.Add(new ListItem(optionValue));
                                    uniqueValuesDvt.Add(optionValue);
                                }
                            }

                            ddlLSP.DataSource = dtLSP;
                            ddlLSP.DataTextField = "TenLSP";
                            ddlLSP.DataValueField = "MaLSP";
                            ddlLSP.DataBind();

                            //foreach (DataRow row in dtLSP.Rows)
                            //{
                            //    string optionValue = row["Tin"].ToString();

                            //    // Kiểm tra tính duy nhất trước khi thêm vào DropDownList
                            //    if (!uniqueValuesLSP.Contains(optionValue))
                            //    {
                            //        ddlLSP.Items.Add(new ListItem(optionValue));
                            //        uniqueValuesLSP.Add(optionValue);
                            //    }
                            //}

                            // Lấy giá trị hiện tại của "Dvt" và "TinhTrang" từ dữ liệu của GridView
                            string DvtValue = DataBinder.Eval(e.Row.DataItem, "Dvt").ToString();
                            //string TTValue = DataBinder.Eval(e.Row.DataItem, "TinhTrang").ToString();

                            // Đặt giá trị đã chọn trong DropDownList
                            ddlDvt.SelectedValue = DvtValue;
                            //ddlLSP.SelectedValue = TTValue;
                        }
                    }
                }
            }
        }

        protected void gridSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Lấy ra dòng đang chọn sửa
            gridSP.EditIndex = e.NewEditIndex;

            //Bind lại GridView
            loaddl();
        }
        protected void gridSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string masp = gridSP.DataKeys[e.RowIndex].Values["MaSP"].ToString();

                // Find TextBox controls in the GridView for updating data
                DropDownList ddlLSP = gridSP.Rows[e.RowIndex].FindControl("ddlLSP") as DropDownList;
                TextBox txtTen = gridSP.Rows[e.RowIndex].FindControl("TextBoxTenSP") as TextBox;
                DropDownList ddlDvt = gridSP.Rows[e.RowIndex].FindControl("ddlDvt") as DropDownList;
                TextBox txtGia = gridSP.Rows[e.RowIndex].FindControl("TextBoxGia") as TextBox;
                TextBox txtSL = gridSP.Rows[e.RowIndex].FindControl("TextBoxSL") as TextBox;
                TextBox txtNSX = gridSP.Rows[e.RowIndex].FindControl("TextBoxNSX") as TextBox;
                TextBox txtHSD = gridSP.Rows[e.RowIndex].FindControl("TextBoxHSD") as TextBox;
                TextBox txtTP = gridSP.Rows[e.RowIndex].FindControl("TextBoxTP") as TextBox;
                TextBox txtTL = gridSP.Rows[e.RowIndex].FindControl("TextBoxTL") as TextBox;


               if (ddlLSP!=null && txtTen != null && txtSL != null && ddlDvt != null && txtGia!=null 
                    && txtNSX!=null && txtHSD!=null && txtTP != null && txtTL != null)
                {
                    string lsp = ddlLSP.SelectedValue;
                    string tensp = txtTen.Text;
                    string dvt = ddlDvt.SelectedValue;
                    string gia = txtGia.Text;
                    string sl = txtSL.Text;
                    string nsx=txtNSX.Text;
                    string hsd=txtHSD.Text;
                    string tp=txtTP.Text;
                    string tl=txtTL.Text;
                   
                   

                    // Call the UpdateEmployee method in your CSDL class
                    kn.CapNhatSP(masp, lsp, tensp, dvt, gia, sl, nsx, hsd, tp, tl);

                    // Exit edit mode and rebind the GridView
                    gridSP.EditIndex = -1;
                    string errorMessage = "Cập nhật sản phẩm thành công";
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
                ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật sản phẩm: {ex.Message}');", true);
            }
        }

        protected void gridSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridSP.EditIndex = -1;
            loaddl();
        }

        protected void gridSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string masp = gridSP.DataKeys[e.RowIndex].Values["MaSP"].ToString();

                kn.XoaSP(masp);
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa nhà sản phẩm thành công');", true);
                loaddl();
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi: " + ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //string searchKeyword = txtSearch.Text.Trim();
            //loaddlTim(searchKeyword);
            string searchKeyword = txtSearch.Text.Trim();
            Session["SearchTerm"] = searchKeyword;
            Response.Redirect("QLSanPham.aspx");

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemSP.aspx");
        }
    } 
}