using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemPN_CTPN : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load dữ liệu cho DropDownList MaNV
                ddlTenNV.DataSource = GetNhanVienData();
                ddlTenNV.DataTextField = "HoTenNV";
                ddlTenNV.DataValueField = "MaNV";
                ddlTenNV.DataBind();

                // Load dữ liệu cho DropDownList MaNCC
                ddlTenNCC.DataSource = GetNhaCungCapData();
                ddlTenNCC.DataTextField = "TenNCC";
                ddlTenNCC.DataValueField = "MaNCC";
                ddlTenNCC.DataBind();

                // Load dữ liệu cho DropDownList MaNL
                ddlMaNL.DataSource = GetKhoNLData();
                ddlMaNL.DataTextField = "TenNL";
                ddlMaNL.DataValueField = "MaNL";
                ddlMaNL.DataBind();
            }
        }
        CSDL kn=new CSDL();
        private DataTable GetNhanVienData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaNV, HoTenNV FROM NhanVien";
            return kn.GetData(query);
        }

        private DataTable GetNhaCungCapData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaNCC, TenNCC FROM NhaCungCap";
            return kn.GetData(query);
        }

        private DataTable GetKhoNLData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaNL, TenNL FROM KhoNL";
            return kn.GetData(query);
        }
        protected void btnThemPN_Click(object sender, EventArgs e)
        {
            string maPN = txtMaPN.Text;
            string maNV = ddlTenNV.SelectedValue;
            string maNCC = ddlTenNCC.SelectedValue;
            string ngayNhap = txtNgayNhap.Text;
            string tongPN = txtTongPN.Text;

            ThemPhieuNhap(maPN,maNV, maNCC, ngayNhap, tongPN);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm Phiếu Nhập thành công');", true);
        }

        protected void btnThemCTPN_Click(object sender, EventArgs e)
        {
            string maPN = txtMaPN_CTPN.Text;
            string maNL = ddlMaNL.SelectedValue;
            string soLuong = txtSL.Text;
            string dvt=txtDvt.Text;
            string giaNhap = txtGiaNhap.Text;
            string thanhTien = txtThanhTien.Text;

            ThemChiTietPhieuNhap(maPN, maNL, soLuong, giaNhap, dvt, thanhTien);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm Chi Tiết Phiếu Nhập thành công');", true);
            Response.Redirect("QLPN_CTPN.aspx");
        }

        private void ThemPhieuNhap(string maPN, string maNV, string maNCC, string ngayNhap, string tongPN)
        {
            // Thực hiện logic thêm Phiếu Nhập vào CSDL
            string query = $"INSERT INTO PhieuNhap (MaPN,MaNV, MaNCC, NgayNhap, TongPN) VALUES ('{maPN}', '{maNV}', '{maNCC}', '{ngayNhap}', '{tongPN}')";
            kn.GetData(query);
        }

        private void ThemChiTietPhieuNhap(string maPN, string maNL, string soLuong, string dvt,string giaNhap, string thanhTien)
        {
            // Thực hiện logic thêm Chi Tiết Phiếu Nhập vào CSDL
            string query = $"INSERT INTO CTPhieuNhap (MaPN, MaNL, SLNhap, Dvt, GiaNhap, ThanhTien) VALUES ('{maPN}', '{maNL}', '{soLuong}', '{giaNhap}', '{dvt}', '{thanhTien}')";
            kn.GetData(query);
        }
    }
}