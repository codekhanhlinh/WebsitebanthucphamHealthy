<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.DangKy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
        .panel-1{
            font-size:30px;
            color:#8EB963;
            margin-top:30px;
            margin-left:20px;
            text-align:center;
        }
        .button-DK{
            font-family:Bahnschrift;
            font-size:20px;
            border-color: #8EB963;
        }
        .table1 {
            width: 100%;
            border-collapse: collapse;
            background-image: url('/Images/Images/hinhDK.png'); /* Thay 'duong-dan-den-hinh-anh.jpg' bằng đường dẫn đến hình ảnh của bạn */
            background-size: cover; /* Đảm bảo hình ảnh nền được hiển thị đầy đủ */
            background-repeat: no-repeat;
            font-family:Bahnschrift;
        }
    </style>
    <table class="table1">
        <tr>
            <td>
            <div>
                <asp:Panel ID="Panel1" runat="server" Height="40px" CssClass="panel-1">
                    <strong>
                    <asp:Label ID="Label1" runat="server" CssClass="DN" Text="Đăng ký"></asp:Label>
                    </strong>
                </asp:Panel>
                
            <div style="margin-top:60px; margin-left:30px;">
                <asp:Label ID="Label2" runat="server" Text="Họ và tên" Width="130px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="250px"></asp:TextBox>

            <div style="margin-top:40px; /*margin-left:30px;*/">
                <asp:Label ID="Label5" runat="server" Text="Tên đăng nhập" Width="200px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtTenDN" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="250px"></asp:TextBox>
                <br />
            </div>

            </div>
            <div style="margin-top:40px; margin-left:30px;">
                <asp:Label ID="Label3" runat="server" Text="Số điện thoại" Width="130px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtSDT" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="200px"></asp:TextBox>
                <br />
            </div>

            <div style="margin-top:40px; margin-left:30px;">
                <asp:Label ID="Label4" runat="server" Text="Giới tính" Width="130px" CssClass="label"></asp:Label><br>
                 <asp:RadioButtonList ID="rdoGT" runat="server" CssClass="txtTT" BorderWidth="0">
                        <asp:ListItem Text="Nam" Value="Nam" style="font-family: Bahnschrift; font-size: 20px"></asp:ListItem>
                        <asp:ListItem Text="Nữ" Value="Nữ" style="font-family: Bahnschrift; font-size: 20px;"></asp:ListItem>
                </asp:RadioButtonList>
               
            </div>
           </div>
            </td>
            <td>
            <div style="margin-top:40px; margin-left:50px;">
                <asp:Label ID="Label6" runat="server" Text="Email" Width="200px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="250px"></asp:TextBox>
                <br />
            </div>

             <div style="margin-top:40px; margin-left:50px;">
                <asp:Label ID="Label7" runat="server" Text="Mật khẩu" Width="200px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtMK" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="250px"></asp:TextBox>
                <br />
            </div>

            <div style="margin-top:40px; margin-left:50px;">
                <asp:Label ID="Label8" runat="server" Text="Địa chỉ" Width="200px" CssClass="label"></asp:Label><br />
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="text-box-DN" BorderColor="#8EB963" BorderStyle="Solid" BorderWidth="2px" Height="30px" Width="400px"></asp:TextBox>
                <br />
                <br />
            </div>
            <div style="margin-left:50px">
                <asp:Button ID="btnDK" runat="server" Text="Đăng ký" CssClass="button-DK" OnClick="btnDK_Click" BackColor="#E9FFCA" BorderStyle="Solid" BorderWidth="1px" Height="40px" Width="150px" />
                <br />
            </div>
             <div>
            <asp:Label ID="lblSuccessMessage" runat="server"></asp:Label>
            </div>
        </td>
        </tr>
    </table>
    <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
