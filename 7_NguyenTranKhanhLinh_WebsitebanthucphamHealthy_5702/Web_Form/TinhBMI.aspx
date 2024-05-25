<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MasterPage.Master" AutoEventWireup="true" CodeBehind="TinhBMI.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.TinhBMI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
    .Text-BMI{
        font-family: Bahnschrift;
        text-align: center;
        font-size:30px;
        color:#009900;
    }


    .button-style{
        border-style:inherit;
        height:50px;
        width:120px;
        background:#4B8D48;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
        border-bottom-left-radius: 10px;
        font-family:Bahnschrift;
        font-size:25px;
    }
    .text-box{
        font-family:Bahnschrift;
        font-size: 20px;
        border-style:revert-layer;
        background:#E9FFCA;
        text-align:center
    }

        .button-Tinh {
            text-align: center;
        }


        .auto-style12 {
            margin-bottom: 50px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* Canh giữa nội dung theo chiều ngang */
            text-align: center; /* Canh giữa nội dung theo chiều dọc */
        }
   
    </style>
        <asp:Panel ID="Panel1" runat="server" BackColor="#E9FFCA" Height="40px">
            <p class="Text-BMI"><strong>Công cụ tính BMI</strong></p> 
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" style="font-family: Bahnschrift; width: 100%; 
        height:700px; background-image: url('../Images/Images/bg-content1-tinhbmi (1).png'); background-position: center center; background-repeat: no-repeat;">
            <div style="padding-top:150px">
                <div style="display: flex; align-items: center; " class="auto-style12">
                    <asp:Label ID="lblChieuCao" runat="server" Text="Chiều cao" style="margin-right: 10px; font-size:20px; color:#009900"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtChieuCao" runat="server" Width="200px" CssClass="text-box"></asp:TextBox>
                </div>
                <div style="display: flex; align-items: center; " class="auto-style12">
                    <asp:Label ID="lblCanNang" runat="server" Text="Cân nặng" style="margin-right: 10px; font-size:20px; color:#009900"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtCanNang" runat="server" Width="200px" CssClass="text-box"></asp:TextBox>
                </div>
                <div style="display: flex; flex-direction: column" class="auto-style12">
                    <asp:Label ID="lblKQ" runat="server" Text="Kết quả của bạn" style="margin-right: 10px; font-size:20px; color:#009900"></asp:Label>
                    <br />
                    <br />
                    <asp:TextBox ID="txtKQ" runat="server" Width="866px" CssClass="text-box"></asp:TextBox>
                    <br />
                    <br />
                </div>
                <div class="button-Tinh">
                    <asp:Button ID="btnTinh" runat="server" Text="Tính BMI" CssClass="button-style" OnClick="btnTinh_Click"/>
                </div>
            </div>
        </asp:Panel>
        <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <div style="font-family:Bahnschrift; font-size: 25px">
    <div style="text-align: center;">
        <img src="../Images/Images/BMI.jpg" style="width:1200px" />
    </div>
    <div>
        <p><strong style="color:#009900; font-size:30px">BMI </strong>(Body Mass Index) là một chỉ số được sử dụng phổ biến để đánh giá lượng mỡ cơ thể dựa trên cân nặng và chiều cao của một người. 
            Đây là công cụ đơn giản nhưng hữu ích để đánh giá liệu một người có cân nặng phù hợp với chiều cao hay không.</p>
        <p><strong style="color:#009900; font-size:30px">Công thức BMI: </strong> </p>
        <p>BMI = Cân nặng (kg) / Chiều cao (m)<sup>2</sup></p>
        <p>Theo tổ chức Y tế Thế giới (WHO), các khoảng giá trị BMI thường được đánh giá như sau:</p>
            <ul>
                <li>Dưới 18.5: Dưới cân</li>
                <li>18.5 đến 24.9: Cân nặng bình thường</li>
                <li>25.0 đến 29.9: Thừa cân</li>
                <li>30.0 đến 34.9: Béo phì cấp độ 1 (Béo phì nhẹ)</li>
                <li>35.0 đến 39.9: Béo phì cấp độ 2 (Béo phì trung bình)</li>
                <li>40.0 trở lên: Béo phì cấp độ 3 (Béo phì nặng)</li>
            </ul>
    </div>
    </div>
</asp:Content>
