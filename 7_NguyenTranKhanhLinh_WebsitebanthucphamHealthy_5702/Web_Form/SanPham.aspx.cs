using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using static _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.CTSanPham;
using static _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.SanPham;


namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class SanPham : System.Web.UI.Page
    {
        private readonly CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Session["SearchTerm"] != null)
                    {
                        string searchTerm = Session["SearchTerm"].ToString();
                        LoadProductsBySearchTerm(searchTerm);
                        Session.Remove("SearchTerm");
                    }
                    else if (Request.QueryString["maloai"] != null)
                    {
                        string maLoai = Request.QueryString["maloai"];
                        LoadProductsByCategory(maLoai);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error: {ex.Message}");
            }

        }
        private void LoadProductsByCategory(string maLoai)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy sản phẩm dựa trên mã loại sản phẩm
            DataTable productsTable = GetProductsByCategoryFromDatabase(maLoai);

            // Gán dữ liệu vào DataList1
            DataList1.DataSource = productsTable;
            DataList1.DataBind();
        }

        private DataTable GetProductsByCategoryFromDatabase(string maLoai)
        {
            string query = "SELECT MaSP, TenSP, Gia, Hinh FROM SanPham WHERE MaLSP = @maLoai";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@maLoai", maLoai)
            };

            DataTable dataTable = kn.GetData(query, parameters);

            return dataTable;
        }

        
        protected void imgBtnChiTiet_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                // Get the product ID (MaSP) from the CommandArgument
                string maSP = e.CommandArgument.ToString();

                // Redirect to CTSanPham.aspx with the MaSP parameter
                Response.Redirect($"CTSanPham.aspx?MaSP={maSP}");
            }
        }

       protected void btnDH_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                string maSP = e.CommandArgument.ToString();

                try
                {
                    CTSanPham cTSanPhamInstance = new CTSanPham();
                    cTSanPhamInstance.AddToCartFromButton(maSP);
                    List<Product> cart = Session["Cart"] as List<Product>;

                    // Khai báo dictionary để lưu tên sản phẩm và số lượng
                    Dictionary<string, int> cartItems = new Dictionary<string, int>();

                    if (cart != null)
                    {
                        foreach (var product in cart)
                        {
                            if (cartItems.ContainsKey(product.TenSanPham))
                            {
                                // Nếu tên sản phẩm đã có trong dictionary thì tăng số lượng lên
                                cartItems[product.TenSanPham] += 1; // Nếu muốn theo dõi số lượng, thì cập nhật lại theo SoLuong
                            }
                            else
                            {
                                // Nếu chưa có thì thêm mới và gán số lượng
                                cartItems.Add(product.TenSanPham, 1); // Nếu muốn theo dõi số lượng, thì cập nhật lại theo SoLuong
                            }
                        }
                    }

                    // Tính tổng số lượng độc lập theo tên sản phẩm
                    int count = cartItems.Sum(x => x.Value);
                    // Tìm Label trong MasterPage
                    Label lblSoLuong = Master?.FindControl("lblSoLuong") as Label;

                    if (lblSoLuong != null)
                    {
                        // Gán số lượng mới vào Label
                        lblSoLuong.Text = count.ToString();
                    }

                    Response.Redirect("GioHang.aspx");
                }
                catch (Exception ex)
                {
                   

                }
            } 
        }
        private void LoadProductsBySearchTerm(string searchTerm)
        {
            // Thực hiện truy vấn cơ sở dữ liệu để lấy sản phẩm dựa trên tên sản phẩm
            DataTable productsTable = GetProductsBySearchTermFromDatabase(searchTerm);

            // Gán dữ liệu vào DataList1
            DataList1.DataSource = productsTable;
            DataList1.DataBind();
        }

        private DataTable GetProductsBySearchTermFromDatabase(string searchTerm)
        {
            string query = "SELECT MaSP, TenSP, Gia, Hinh FROM SanPham WHERE TenSP LIKE @searchTerm";
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@searchTerm", "%" + searchTerm + "%")
            };

            DataTable dataTable = kn.GetData(query, parameters);

            return dataTable;
        }
    }
}
