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
    public partial class ThongKe : System.Web.UI.Page
    {
        CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDT();
                loadChi();
                // Gọi hàm để đổ dữ liệu vào DropDownList theo ngày, tháng, năm
                LoadDropDownListData();
            }
        }
        void loadChi()
        {
            string sql = "SELECT MaPN, MaNV, MaNCC, NgayNhap, TongPN FROM PhieuNhap";
            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridChi != null)
            {
                gridChi.DataSource = dt;
                gridChi.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
            }
        }

        void loadDT()
        {
            string sql = "SELECT MaHD, MaNV, MaKH, NgayDat, PTTT, TongTienHD FROM HoaDonBan";
            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridThu != null)
            {
                gridThu.DataSource = dt;
                gridThu.DataBind();

            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
            }
        }

        private void LoadDropDownListData()
        {
            // Đổ dữ liệu vào DropDownList theo ngày
            LoadNgayDropDownList();

            // Đổ dữ liệu vào DropDownList theo tháng
            LoadThangDropDownList();

            // Đổ dữ liệu vào DropDownList theo năm
            LoadNamDropDownList();
        }

        private void LoadNgayDropDownList()
        {
            ddlNgay.DataTextField = "Ngay";
            ddlNgay.DataValueField = "Ngay";

            ddlNN.DataTextField = "NgayN";
            ddlNN.DataValueField = "NgayN";
            // Giả sử bạn có một DataTable chứa danh sách ngày (1-31)
            DataTable dtNgay = new DataTable();
            dtNgay.Columns.Add("Ngay");
            DataTable dtNN = new DataTable();
            dtNN.Columns.Add("NgayN");
            for (int i = 1; i <= 31; i++)
            {
                dtNgay.Rows.Add(i);
                dtNN.Rows.Add(i);
            }

            ddlNgay.DataSource = dtNgay;
            ddlNgay.DataBind();

            ddlNN.DataSource = dtNN;
            ddlNN.DataBind();
        }

        private void LoadThangDropDownList()
        {
            ddlThang.DataTextField = "Thang";
            ddlThang.DataValueField = "Thang";

            ddlTN.DataTextField = "ThangN";
            ddlTN.DataValueField = "ThangN";
            // Giả sử bạn có một DataTable chứa danh sách tháng (1-12)
            DataTable dtThang = new DataTable();
            dtThang.Columns.Add("Thang");

            DataTable dtTN = new DataTable();
            dtTN.Columns.Add("ThangN");

            for (int i = 1; i <= 12; i++)
            {
                dtThang.Rows.Add(i);
                dtTN.Rows.Add(i);
            }

            ddlThang.DataSource = dtThang;
            ddlThang.DataBind();

            ddlTN.DataSource = dtTN;
            ddlTN.DataBind();
        }

        private void LoadNamDropDownList()
        {
            ddlNam.DataTextField = "Nam";
            ddlNam.DataValueField = "Nam";

            ddlNamN.DataTextField = "NN";
            ddlNamN.DataValueField = "NN";
            // Giả sử bạn có một DataTable chứa danh sách năm
            DataTable dtNam = new DataTable();
            dtNam.Columns.Add("Nam");

            DataTable dtN = new DataTable();
            dtN.Columns.Add("NN");
            // Lấy năm hiện tại và một số năm trước và sau
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear - 5; i <= currentYear + 5; i++)
            {
                dtNam.Rows.Add(i);
                dtN.Rows.Add(i);
            }

            ddlNam.DataSource = dtNam;
            ddlNam.DataBind();

            ddlNamN.DataSource = dtN;
            ddlNamN.DataBind();
        }

        protected void btnXem_Click(object sender, EventArgs e)
        {
            string condition = BuildCondition(); // Hàm này trả về điều kiện truy vấn dựa trên CheckBox được chọn

            string sql = $"SELECT MaHD, MaNV, MaKH, NgayDat, PTTT, TongTienHD FROM HoaDonBan {condition}";
            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridThu != null)
            {
                gridThu.DataSource = dt;
                gridThu.DataBind();

                // Tính và hiển thị tổng hóa đơn lên lblThu
                decimal tongHD = CalculateTongHD(dt);
                lblThu.Text = $"{tongHD:N0}";
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
                lblThu.Text = "Tổng hóa đơn: 0";
            }
        }

        private string BuildCondition()
        {
            List<string> conditions = new List<string>();

            if (chkNgay.Checked && chkThang.Checked && chkNam.Checked)
            {
                if (!string.IsNullOrEmpty(ddlNgay.SelectedValue) && !string.IsNullOrEmpty(ddlThang.SelectedValue) && !string.IsNullOrEmpty(ddlNam.SelectedValue))
                {
                    conditions.Add($"NgayDat = '{ddlNam.SelectedValue}-{ddlThang.SelectedValue}-{ddlNgay.SelectedValue}'");
                }
            }

            if (chkNgay.Checked && !string.IsNullOrEmpty(ddlNgay.SelectedValue))
            {
                conditions.Add($"DAY(NgayDat) = {ddlNgay.SelectedValue}");
            }

            if (chkThang.Checked && !string.IsNullOrEmpty(ddlThang.SelectedValue))
            {
                conditions.Add($"MONTH(NgayDat) = {ddlThang.SelectedValue}");
            }

            if (chkNam.Checked && !string.IsNullOrEmpty(ddlNam.SelectedValue))
            {
                conditions.Add($"YEAR(NgayDat) = {ddlNam.SelectedValue}");
            }

            if (conditions.Count > 0)
            {
                return "WHERE " + string.Join(" AND ", conditions);
            }

            return string.Empty;
        }

        private string BuildChi()
        {
            List<string> conditions = new List<string>();

            if (chkNgayN.Checked && chkThangN.Checked && chkNamN.Checked)
            {
                if (!string.IsNullOrEmpty(ddlNN.SelectedValue) && !string.IsNullOrEmpty(ddlTN.SelectedValue) && !string.IsNullOrEmpty(ddlNamN.SelectedValue))
                {
                    conditions.Add($"NgayNhap = '{ddlNamN.SelectedValue}-{ddlTN.SelectedValue}-{ddlNN.SelectedValue}'");
                }
            }

            if (chkNgayN.Checked && !string.IsNullOrEmpty(ddlNN.SelectedValue))
            {
                conditions.Add($"DAY(NgayNhap) = {ddlNN.SelectedValue}");
            }

            if (chkThangN.Checked && !string.IsNullOrEmpty(ddlTN.SelectedValue))
            {
                conditions.Add($"MONTH(NgayNhap) = {ddlTN.SelectedValue}");
            }

            if (chkNamN.Checked && !string.IsNullOrEmpty(ddlNamN.SelectedValue))
            {
                conditions.Add($"YEAR(NgayNhap) = {ddlNamN.SelectedValue}");
            }

            if (conditions.Count > 0)
            {
                return "WHERE " + string.Join(" AND ", conditions);
            }

            return string.Empty;
        }

        private decimal CalculateTongHD(DataTable dt)
        {
            // Tính tổng hóa đơn từ DataTable
            decimal tongHD = 0;
            foreach (DataRow row in dt.Rows)
            {
                tongHD += Convert.ToDecimal(row["TongTienHD"]);
            }
            return tongHD;
        }
        private decimal CalculateTongPN(DataTable dt)
        {
            // Tính tổng hóa đơn từ DataTable
            decimal tongPN = 0;
            foreach (DataRow row in dt.Rows)
            {
                tongPN += Convert.ToDecimal(row["TongPN"]);
            }
            return tongPN;
        }

        protected void btnXemChi_Click(object sender, EventArgs e)
        {
            string condition = BuildChi(); // Hàm này trả về điều kiện truy vấn dựa trên CheckBox được chọn

            string sql = $"SELECT MaPN, MaNV, MaNCC, NgayNhap, TongPN FROM PhieuNhap {condition}";
            DataTable dt = kn.GetData(sql);

            if (dt != null && dt.Rows.Count > 0 && gridChi != null)
            {
                gridChi.DataSource = dt;
                gridChi.DataBind();

                // Tính và hiển thị tổng hóa đơn lên lblThu
                decimal tongPN = CalculateTongPN(dt);
                lblChi.Text = $"{tongPN:N0}";
            }
            else
            {
                Debug.WriteLine("No data to bind to GridView or gridPN is null");
                lblChi.Text = "Tổng: 0";
            }
        }

        
    }
}