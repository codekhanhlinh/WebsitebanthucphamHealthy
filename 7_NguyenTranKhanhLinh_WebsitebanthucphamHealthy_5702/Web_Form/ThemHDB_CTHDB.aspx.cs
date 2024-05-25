using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemHDB_CTHDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
             
                ddlTenNV.DataSource = GetNhanVienData();
                ddlTenNV.DataTextField = "HoTenNV";
                ddlTenNV.DataValueField = "MaNV";
                ddlTenNV.DataBind();

              
                ddlTenKH.DataSource = GetKHData();
                ddlTenKH.DataTextField = "HoTenKH";
                ddlTenKH.DataValueField = "MaKH";
                ddlTenKH.DataBind();

               
                ddlMaSP.DataSource = GetSanPhamData();
                ddlMaSP.DataTextField = "TenSP";
                ddlMaSP.DataValueField = "MaSP";
                ddlMaSP.DataBind();

            }
        }

        CSDL kn = new CSDL();
        private DataTable GetNhanVienData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaNV, HoTenNV FROM NhanVien";
            return kn.GetData(query);
        }

        private DataTable GetSanPhamData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaSP, TenSP FROM SanPham";
            return kn.GetData(query);
        }

        private DataTable GetKHData()
        {
            // Thực hiện truy vấn hoặc lấy dữ liệu từ nguồn khác
            string query = "SELECT MaKH, HoTenKH FROM KhachHang";
            return kn.GetData(query);
        }

        private void ThemHD(string maHD, string maNV, string maKH, string ngayDat,string PTTT, string tongHD, string TT)
        {
            // Convert ngayDat to the desired format "dd/MM/yyyy"
            

                // Thực hiện logic thêm Phiếu Nhập vào CSDL
                string query = $"INSERT INTO HoaDonBan (MaHD, MaNV, MaKH, NgayDat, PTTT, TongTienHD, TinhTrang) VALUES ('{maHD}', '{maNV}', '{maKH}', '{ngayDat}', '{PTTT}', '{tongHD}', '{TT}')";
                kn.GetData(query);
            
        }

        private void ThemChiTietHD(string maHD, string maSP, string soLuong, string dvt, string gia, string thanhTien)
        {
            // Thực hiện logic thêm Chi Tiết Phiếu Nhập vào CSDL
            string query = $"INSERT INTO CTHoaDonBan (MaHD, MaSP, SLDat, Dvt, DonGia, ThanhTien) VALUES ('{maHD}', '{maSP}', '{soLuong}', '{dvt}', '{gia}', '{thanhTien}')";
            kn.GetData(query);
        }

        protected void btnThemHD_Click(object sender, EventArgs e)
        {
            string maHD = txtMaHD.Text;
            string maNV = ddlTenNV.SelectedValue;
            string maKH = ddlTenKH.SelectedValue;
            string ngayDat = txtNgayDat.Text;
            string pttt = txtPTTT.Text;
            string tongPN = txtTongPN.Text;
            string tt=txtTT.Text;

            ThemHD(maHD, maNV, maKH, ngayDat, pttt, tongPN, tt);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm Hóa Đơn thành công');", true);
        }

        protected void btnThemCTHD_Click(object sender, EventArgs e)
        {
            try
            {
                string maHD = txtMaHD_CTHD.Text;
                string maSP = ddlMaSP.SelectedValue;
                string soLuong = txtSL.Text;
                string dvt = txtDvt.Text;
                string gia = txtGia.Text;
                string thanhTien = txtThanhTien.Text;

                ThemChiTietHD(maHD, maSP, soLuong, dvt, gia, thanhTien);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm Chi Tiết Hóa Đơn thành công');", true);
                Response.Redirect("QLHDB_CTHDB.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm chi tiết hóa đơn thất bại. Lỗi: {ex.Message}');", true);
            }
        }
    }
}