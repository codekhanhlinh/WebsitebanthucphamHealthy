<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemHDB_CTHDB.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemHDB_CTHDB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
            <h1>Thêm Hóa Đơn Bán và Chi Tiết Hóa Đơn Bán</h1>
            <h2>Thông Tin Hóa Đơn Bán</h2>
            <label>Mã hóa đơn:</label>
            <asp:TextBox ID="txtMaHD" runat="server"></asp:TextBox><br />

            <label>Tên nhân viên:</label>
            <asp:DropDownList ID="ddlTenNV" runat="server"></asp:DropDownList><br />

            <label>Tên khách hàng:</label>
            <asp:DropDownList ID="ddlTenKH" runat="server"></asp:DropDownList><br />

            <label>Ngày đặt:</label>
            <asp:TextBox ID="txtNgayDat" runat="server"></asp:TextBox><br />

            <label>Phương thức thanh toán:</label>
            <asp:TextBox ID="txtPTTT" runat="server"></asp:TextBox><br />

            <label>Tổng phiếu nhập:</label>
            <asp:TextBox ID="txtTongPN" runat="server"></asp:TextBox><br />

            <label>Tình trạng:</label>
            <asp:TextBox ID="txtTT" runat="server"></asp:TextBox><br />

            <asp:Button ID="btnThemHD" runat="server" Text="Thêm Hóa Đơn" OnClick="btnThemHD_Click" /><br />
            
            <h2>Thông Tin Chi Tiết Hóa Đơn Bán</h2>
            <label>Mã hóa đơn:</label>
            <asp:TextBox ID="txtMaHD_CTHD" runat="server"></asp:TextBox><br />
            
            <label>Tên sản phẩm:</label>
            <asp:DropDownList ID="ddlMaSP" runat="server"></asp:DropDownList><br />

            <label>Số lượng:</label>
            <asp:TextBox ID="txtSL" runat="server"></asp:TextBox><br />

            <label>Đơn vị tính:</label>
            <asp:TextBox ID="txtDvt" runat="server"></asp:TextBox><br />

            <label>Đơn giá:</label>
            <asp:TextBox ID="txtGia" runat="server"></asp:TextBox><br />

            <label>Thành tiền:</label>
            <asp:TextBox ID="txtThanhTien" runat="server"></asp:TextBox><br />
            
            <asp:Button ID="btnThemCTHD" runat="server" Text="Thêm Chi Tiết Hóa Đơn" OnClick="btnThemCTHD_Click" /><br />
        </div>
        </div>
    </form>
</body>
</html>
