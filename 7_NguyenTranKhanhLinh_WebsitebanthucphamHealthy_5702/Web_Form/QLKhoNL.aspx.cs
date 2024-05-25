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
    public partial class QLKhoNL : System.Web.UI.Page
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
            gridKho.RowUpdating += new GridViewUpdateEventHandler(gridKho_RowUpdating);
        }
        void loaddl()
        {
            string sql = "SELECT * FROM KhoNL";

            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridKho != null)
            {
                gridKho.DataSource = dt;
                gridKho.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridKho is null");
            }
        }



        protected void gridKho_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            // Kiểm tra xem loại dòng có phải là DataRow không
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra xem dòng có đang ở chế độ chỉnh sửa không
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    // Tìm kiếm điều khiển DropDownList trong EditItemTemplate
                    DropDownList ddlDvt = (DropDownList)e.Row.FindControl("ddlDvt");
                    DropDownList ddlTT = (DropDownList)e.Row.FindControl("ddlTT");

                    // Kiểm tra xem DropDownList có được tìm thấy không
                    if (ddlDvt != null && ddlTT != null)
                    {
                        // Lấy dữ liệu cho DropDownList từ cơ sở dữ liệu
                        DataTable dtDvt = kn.LayDvtNL();
                        DataTable dtTT = kn.LayTTNL();

                        // Kiểm tra xem dữ liệu có sẵn không
                        if (dtDvt != null && dtDvt.Rows.Count > 0 && dtTT != null && dtTT.Rows.Count > 0)
                        {
                            // Xóa các mục hiện tại trong DropDownList
                            ddlDvt.Items.Clear();
                            ddlTT.Items.Clear();
                            // Tạo một HashSet để theo dõi các giá trị duy nhất
                            HashSet<string> uniqueValuesDvt = new HashSet<string>();
                            HashSet<string> uniqueValuesTT = new HashSet<string>();

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

                            foreach (DataRow row in dtTT.Rows)
                            {
                                string optionValue = row["TinhTrang"].ToString();

                                // Kiểm tra tính duy nhất trước khi thêm vào DropDownList
                                if (!uniqueValuesTT.Contains(optionValue))
                                {
                                    ddlTT.Items.Add(new ListItem(optionValue));
                                    uniqueValuesTT.Add(optionValue);
                                }
                            }

                            // Lấy giá trị hiện tại của "Dvt" và "TinhTrang" từ dữ liệu của GridView
                            string DvtValue = DataBinder.Eval(e.Row.DataItem, "Dvt").ToString();
                            string TTValue = DataBinder.Eval(e.Row.DataItem, "TinhTrang").ToString();

                            // Đặt giá trị đã chọn trong DropDownList
                            ddlDvt.SelectedValue = DvtValue;
                            ddlTT.SelectedValue = TTValue;
                            }
                        }
                    }
                }
            }
        
            protected void gridKho_RowEditing(object sender, GridViewEditEventArgs e)
            {
                //Lấy ra dòng đang chọn sửa
                gridKho.EditIndex = e.NewEditIndex;

                //Bind lại GridView
                loaddl();
            }
            protected void gridKho_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {
                try
                {
                    string manl = gridKho.DataKeys[e.RowIndex].Values["MaNL"].ToString();

                    // Find TextBox controls in the GridView for updating data
                    TextBox txtTen = gridKho.Rows[e.RowIndex].FindControl("TextBoxTenNL") as TextBox;
                    TextBox txtSL = gridKho.Rows[e.RowIndex].FindControl("TextBoxSL") as TextBox;
                    DropDownList ddlDvt = gridKho.Rows[e.RowIndex].FindControl("ddlDvt") as DropDownList;
                    DropDownList ddlTT = gridKho.Rows[e.RowIndex].FindControl("ddlTT") as DropDownList;


                    if (txtTen != null && txtSL != null && ddlDvt != null && ddlTT != null)
                    {
                        string ten = txtTen.Text;
                        string sl = txtSL.Text;
                        string dvt = ddlDvt.SelectedValue;
                        string tinhtrang = ddlTT.SelectedValue;

                        // Call the UpdateEmployee method in your CSDL class
                        kn.CapNhatKhoNL(manl, ten, sl, dvt, tinhtrang);

                        // Exit edit mode and rebind the GridView
                        gridKho.EditIndex = -1;
                        string errorMessage = "Cập nhật nguyên liệu thành công";
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
                    ScriptManager.RegisterStartupScript(this, GetType(), "showError", $"alert('Lỗi khi cập nhật nguyên liệu: {ex.Message}');", true);
                }
            } 
            protected void gridKho_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                try
                {
                    string manl = gridKho.DataKeys[e.RowIndex].Values["MaNL"].ToString();

                    kn.XoaNL(manl);
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Xóa nguyên liệu thành công');", true);
                    loaddl();
                }
                catch (Exception ex)
                {
                    Response.Write("Lỗi: " + ex.Message);
                }
            }

            protected void gridKho_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                gridKho.EditIndex = -1;
                loaddl();
            }
        }
    }
