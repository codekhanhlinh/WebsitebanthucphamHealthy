using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemSP;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemNLKho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<object> genders = LayTTKho.GetGenderList(kn);

                //Gán dữ liệu vào dropdownlist
                ddlTT.DataTextField = "Text";
                ddlTT.DataValueField = "Value";

                foreach (string gender in genders)
                {
                    ddlTT.Items.Add(new ListItem(gender, gender));
                }
            }
        }
        CSDL kn=new CSDL();
        public class LayTTKho
        {
            public static List<object> GetGenderList(CSDL kn)
            {
                List<object> listGender = new List<object>();

                string query = "SELECT TinhTrang FROM KhoNL";

                DataTable dt = kn.GetData(query);

                foreach (DataRow row in dt.Rows)
                {
                    if (!listGender.Contains(row["TinhTrang"]))
                    {
                        listGender.Add(row["TinhTrang"]);
                    }
                }
                return listGender;
            }
        }

        private void ThemNL(string maNl, string Ten, string sl, string dvt, string tt)
        {
            string insertQuery = "INSERT INTO KhoNL (MaNL, TenNL, SLHienCo, Dvt, TinhTrang)" +
                "VALUES (@MaNL, @TenNL, @SLHienCo, @Dvt, @TinhTrang)";

            using (SqlConnection connection = new SqlConnection(kn.chuoiketnoi))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@MaNL", maNl);
                    command.Parameters.AddWithValue("@TenNL", Ten);
                    command.Parameters.AddWithValue("@SLHienCo", sl);
                    command.Parameters.AddWithValue("@Dvt", dvt);
                    command.Parameters.AddWithValue("@TinhTrang", tt);
            
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
        }

        protected void btnLuu_Click(object sender, EventArgs e)
        {
            string maNL = txtMaNL.Text;
            string Ten = txtTenNL.Text;

            string sl = txtSL.Text;

            string dvt = txtDvt.Text;

            string tt = ddlTT.SelectedValue;

            try
            {
                ThemNL(maNL, Ten, sl, dvt, tt);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Thêm nguyên liệu thành công');", true);
                //chuyển hướng trang
                Response.Redirect("QLKhoNL.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Thêm nguyên liệu thất bại. Lỗi: {ex.Message}');", true);
            }
        }
    }
}