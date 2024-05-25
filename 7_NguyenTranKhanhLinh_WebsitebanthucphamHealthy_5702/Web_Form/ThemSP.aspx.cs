using _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Database;
using CrystalDecisions.Shared.Interop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class ThemSP : System.Web.UI.Page
    {
        CSDL kn = new CSDL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<object> genders = LayLSanPham.GetGenderList(kn);

                //Gán dữ liệu vào dropdownlist
                ddlLSP.DataTextField = "Text";
                ddlLSP.DataValueField = "Value";

                foreach (string gender in genders)
                {
                    ddlLSP.Items.Add(new ListItem(gender, gender));
                }
            }
        }

        public class LayLSanPham
        {
            public static List<object> GetGenderList(CSDL kn)
            {
                List<object> listGender = new List<object>();

                string query = "SELECT TenLSP FROM LoaiSP";

                DataTable dt = kn.GetData(query);

                foreach (DataRow row in dt.Rows)
                {
                    if (!listGender.Contains(row["TenLSP"]))
                    {
                        listGender.Add(row["TenLSP"]);
                    }

                    
                }
                return listGender;
            }
        }
        protected void btnLuu_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Sửa sản phẩm thành công');", true);
        }

    
    }
}
