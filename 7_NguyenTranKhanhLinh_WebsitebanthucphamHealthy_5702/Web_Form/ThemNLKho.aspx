<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNLKho.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemNLKho" %>

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
        <div>
             <div>
            <div class="container">
            <div class="form-control">
                <asp:Label ID="lblMaKH" runat="server" Text="Mã nguyên liệu" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtMaNL" runat="server" CssClass="txt" Width="100px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblTenNL" runat="server" Text="Tên nguyên liệu" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtTenNL" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblSDT" runat="server" Text="Số lượng hiện có" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtSL" runat="server" CssClass="ddl" Width="50px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label2" runat="server" Text="Đơn vị tính" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtDvt" runat="server" CssClass="txt" Width="300px"></asp:TextBox> 
            </div>

             <div class="form-control">
              <asp:Label runat="server" Text="Tình trạng" CssClass="lbl" />
              <asp:DropDownList ID="ddlTT" runat="server" CssClass="txt" AutoPostBack="True" Width="208px"/>
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" Width="100px" OnClick="btnLuu_Click" />
        </div>
        </div>
        </div>
    </form>
</body>
</html>
