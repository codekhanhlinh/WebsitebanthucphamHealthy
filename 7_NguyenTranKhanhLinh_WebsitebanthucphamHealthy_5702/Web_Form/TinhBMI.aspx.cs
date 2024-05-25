using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form
{
    public partial class TinhBMI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTinh_Click(object sender, EventArgs e)
        {
            try
            {
                // Nhập cân nặng và chiều cao từ TextBox
                double weight = double.Parse(txtCanNang.Text);
                double height = double.Parse(txtChieuCao.Text);
                height=height/100;

                // Tính chỉ số BMI
                double bmi = weight / (height * height);

                // Hiển thị thông báo tương ứng với chỉ số BMI
                if (bmi < 18.5)
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang gặp phải tình trạng thiếu cân";
                }
                else if (bmi >= 18.5 && bmi <= 24.9)
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang sở hữu cân nặng khỏe mạnh";
                }
                else if (bmi >= 25 && bmi <= 29.9)
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang trong tình trạng thừa cân";
                }
                else if (bmi>=30 && bmi <=34.9)
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang bị béo phì độ I";
                }
                else if (bmi >= 35 && bmi <= 39.9)
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang bị béo phì độ II";
                }
                else
                {
                    txtKQ.Text = "Chỉ số BMI của bạn: " + bmi + ". Bạn đang bị béo phì độ III";
                }
            }
            catch (Exception)
            {
                
            }
        }
    }
}