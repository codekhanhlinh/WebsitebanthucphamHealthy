<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemLSP.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemLSP" %>

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
            width: 200px; 
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
            <div class="container">
            <div class="form-control">
                <asp:Label ID="lblMaNV" runat="server" Text="Mã loại sản phẩm" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtMaLSP" runat="server" CssClass="txt" Width="100px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblTen" runat="server" Text="Tên loại sản phẩm" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtTen" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
            </div>
                <div>
                    <asp:Button ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" Width="100px" />
                </div>
            </div>
         
    </form>
</body>
</html>
