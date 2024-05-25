<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/MasterPage.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.DangNhap1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
        /*.panel-1{
            background:#E9FFCA;
        }*/
        .text-box-DN{
            margin-left: 50px;
            width:300px;
            border-left:none;
            border-right:none;
            border-top:none;
            border-bottom:1px solid;
            height:30px;
            vertical-align:middle;
        }
       
        .button-DN{
            font-family:Bahnschrift;
            margin-top:20px;
            border: solid 1px;
            border-color:#069D47;
            background-color:white;
            font-size: 20px;
            border-radius: 8px;
            height:40px;
        }
        .button-DN:hover{
            background-color:#069D47
        }

        .DN{
            font-size:30px;
            color:#069D47;
        }

        .radio-button-list {
            display: flex;
            justify-content: center; /* Canh giữa theo chiều ngang */
            margin-top: 40px;
            margin-left:90px;
        }


        .rdo{
            text-align:left;
        }

        .label{
            font-size:20px;
            text-align:left;
        }

        .auto-style1 {
            text-align: left;
            margin-left: 40px;
        }

    </style>
     <asp:Panel ID="Panel2" runat="server" style="font-family: Bahnschrift; width: 100%; 
        height:600px; background-image: url('../Images/Images/hinhDN.png'); background-position: center center; background-repeat: no-repeat;">
                        <div style="padding-top:150px">
                <div style="font-family:Bahnschrift; text-align: center; margin: 0 0;">
                    <div style="text-align:center">
                        <div>
                            <asp:Panel ID="Panel1" runat="server" Height="40px" CssClass="panel-1">
                                <asp:Label ID="Label1" runat="server" Text="Đăng nhập" CssClass="DN"></asp:Label>
                            </asp:Panel>
                        </div">
                        <div style="margin-top:20px ;text-align:center">
                            <asp:Label ID="Label2" runat="server" Text="Tên đăng nhập" Width="130px" CssClass="label"></asp:Label>
                            <asp:TextBox ID="txtTenDN" runat="server" CssClass="text-box-DN"></asp:TextBox>
                        </div>
                        <div style="margin-top:20px">
                            <asp:Label ID="Label3" runat="server" Text="Mật khẩu" Width="130px" CssClass="label"></asp:Label>
                            <asp:TextBox ID="txtMK" runat="server" CssClass="text-box-DN"></asp:TextBox>
                            <br />
                        <div class="rdo">
                            <asp:RadioButtonList ID="rdlOptions" runat="server" CssClass="radio-button-list">
                                <asp:ListItem Text="Khách hàng" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Quản lý" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div>
                             <asp:Button ID="bthTHDK" runat="server" Text="Đăng ký" CssClass="button-DN" OnClick="btnDK_Click" />
                            <br />
                        </div>
                        </div>
                            <asp:Button ID="btnDN" runat="server" Text="Đăng nhập" CssClass="button-DN" OnClick="btnDN_Click" />
                            <br />
                        </div>
                    </div>
                            </div>
                <br />
           </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>
