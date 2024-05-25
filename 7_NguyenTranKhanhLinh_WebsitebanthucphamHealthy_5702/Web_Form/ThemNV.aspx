<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemNV.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemNV" %>

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
            width: 140px; 
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
                <asp:Label ID="lblMaNV" runat="server" Text="Mã NV" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtMaNV" runat="server" CssClass="txt" Width="100px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblHoTen" runat="server" Text="Họ tên" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
            </div>

            <div class="form-control">
              <asp:Label runat="server" Text="Giới tính" CssClass="lbl" />
              <asp:DropDownList ID="ddlGioiTinh" runat="server" CssClass="txt" AutoPostBack="True" Width="208px"/>
            </div>

            <div class="form-control">
                <asp:Label ID="Label4" runat="server" Text="Ngày sinh" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtNgaySinh" runat="server" CssClass="ddl" Width="208px"></asp:TextBox> 
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

            <div class="form-control">
                <asp:Label ID="Label3" runat="server" Text="Ngày vào làm" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtNVL" runat="server" CssClass="txt" Width="200px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label5" runat="server" Text="Chức vụ" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtChucVu" runat="server" CssClass="txt" Width="200px"></asp:TextBox> 
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" Width="100px" />
            </div>
        </div>
    </form>
</body>
</html>
