<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.TrangChu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <br />
    <div id="slider" style="text-align: center">
        <img id="slider-image" src="../Images/Images/hinh-anh-1.png" width="900" height="500">
    </div>
    <script>
        var currentImage = 1;

        function changeImage() {

            if (currentImage == 1) {
                document.getElementById("slider-image").src = "../Images/Images/hinh-anh-2.png";
                currentImage = 2;
            } else {
                document.getElementById("slider-image").src = "../Images/Images/hinh-anh-1.png";
                currentImage = 1;
            }

        }
        setInterval(changeImage, 2000);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <div>
      
    </div>
</asp:Content>

