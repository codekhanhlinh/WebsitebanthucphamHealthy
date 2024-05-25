<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemPN_CTPN.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemPN_CTPN" %>

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

          .container{
           
          width: 1000px;
          margin: 0 auto;
          margin-top:30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Thêm Phiếu Nhập và Chi Tiết Phiếu Nhập</h1>
            <h2>Thông Tin Phiếu Nhập</h2>
            <label>Mã phiếu nhập:</label>
            <asp:TextBox ID="txtMaPN" runat="server"></asp:TextBox><br />

            <label>Tên nhân viên:</label>
            <asp:DropDownList ID="ddlTenNV" runat="server"></asp:DropDownList><br />

            <label>Tên nhà cung cấp:</label>
            <asp:DropDownList ID="ddlTenNCC" runat="server"></asp:DropDownList><br />

            <label>Ngày nhập:</label>
            <asp:TextBox ID="txtNgayNhap" runat="server"></asp:TextBox><br />

            <label>Tổng phiếu nhập:</label>
            <asp:TextBox ID="txtTongPN" runat="server"></asp:TextBox><br />

            <asp:Button ID="btnThemPN" runat="server" Text="Thêm Phiếu Nhập" OnClick="btnThemPN_Click" /><br />
            
            <h2>Thông Tin Chi Tiết Phiếu Nhập</h2>
            <label>Mã Phiếu Nhập:</label>
            <asp:TextBox ID="txtMaPN_CTPN" runat="server"></asp:TextBox><br />
            
            <label>Tên nguyên liệu:</label>
            <asp:DropDownList ID="ddlMaNL" runat="server"></asp:DropDownList><br />

           <label>Số lượng:</label>
            <asp:TextBox ID="txtSL" runat="server"></asp:TextBox><br />

            <label>Đơn vị tính:</label>
            <asp:TextBox ID="txtDvt" runat="server"></asp:TextBox><br />

            <label>Giá nhập:</label>
            <asp:TextBox ID="txtGiaNhap" runat="server"></asp:TextBox><br />

              <label>Thành tiền:</label>
            <asp:TextBox ID="txtThanhTien" runat="server"></asp:TextBox><br />
            
            <asp:Button ID="btnThemCTPN" runat="server" Text="Thêm Chi Tiết Phiếu Nhập" OnClick="btnThemCTPN_Click" /><br />
        </div>
    </form>
</body>
</html>
