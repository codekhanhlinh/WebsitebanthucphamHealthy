<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNCC.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemNCC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
         .form-control{
            font-family:Bahnschrift;
            margin-bottom:30px;
            display: flex;
        }
        .lbl{
            margin-right:30px;
            width: 180px; 
            display: inline-block;
            vertical-align:middle;
            text-align:left;
            margin-left:5px;
        }
        .txt{
            font-family:Bahnschrift;
        }

        .container{
           
          width: 580px;
          margin: 0 auto;
          margin-top:30px;
        }

        body {
          padding: 0;
          margin: 0;
        }

        input, select {
          width: calc(100% - 120px);
        }

        label {
          width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
            <div class="form-control">
                <asp:Label ID="lblMaNCC" runat="server" Text="Mã nhà cung cấp" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtMaNCC" runat="server" CssClass="txt" Width="100px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblTen" runat="server" Text="Tên nhà cung cấp" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtTen" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblSDT" runat="server" Text="Số điện thoại" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtSDT" runat="server" CssClass="ddl" Width="208px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label2" runat="server" Text="Email" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" Width="300px"></asp:TextBox> 
            </div>

             <div class="form-control">
                <asp:Label ID="Label1" runat="server" Text="Địa chỉ" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="txt" Width="300px"></asp:TextBox> 
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="100px" OnClick="btnLuu_Click" />
        </div>
        </div>
    </form>
</body>
</html>
