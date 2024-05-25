<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemSP.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThemSP" %>

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
            width: 160px; 
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
          border:solid 2px;
          border-color:#069D47;
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
        .txt {
            width: 200px; /* Adjust as needed */
            height: 40px;; /* Maintain aspect ratio */
            border:solid 2px;
            border-color:#549c27;
            vertical-align:middle;
        }
        .txt1{

        }

        .anh{
            height:200px;
            width:200px;
        }
    </style>
</head>
<body>
<form runat="server">
        <div class="container">
            <p style="font-family:Bahnschrift; font-size:30px; text-align:center">Thêm sản phẩm</p>
            <div class="form-control">
                <asp:Label ID="lblMaNV" runat="server" Text="Mã sản phẩm" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtMaSP" runat="server" CssClass="txt" Width="100px"></asp:TextBox>
            </div>

            <div class="form-control">
                <asp:Label ID="lblTen" runat="server" Text="Tên sản phẩm" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtHoTen" runat="server" CssClass="txt" Width="300px"></asp:TextBox>
            </div>

            <div class="form-control">
              <asp:Label runat="server" Text="Loại sản phẩm" CssClass="lbl" />
              <asp:DropDownList ID="ddlLSP" runat="server" CssClass="txt" AutoPostBack="True" Width="208px" Height="40px"/>
            </div>

            <div class="form-control">
                <asp:Label ID="Label4" runat="server" Text="Đơn vị tính" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtDvt" runat="server" CssClass="txt"  Width="208px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="lblSDT" runat="server" Text="Giá" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtGia" runat="server" CssClass="txt"  Width="208px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label2" runat="server" Text="Số lượng hiện có" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtSL" runat="server" CssClass="txt" Width="350px"></asp:TextBox> 
            </div>

             <div class="form-control">
                <asp:Label ID="Label1" runat="server" Text="Ngày sản xuất" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtNSX" runat="server" CssClass="txt" Width="300px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label3" runat="server" Text="Hạn sử dụng" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtHSD" runat="server" CssClass="txt" Width="200px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label5" runat="server" Text="Thành phần" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="txtChucVu" runat="server" CssClass="txt" Width="200px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label6" runat="server" Text="Trọng lượng" CssClass="lbl"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txt" Width="200px"></asp:TextBox> 
            </div>

            <div class="form-control">
                <asp:Label ID="Label7" runat="server" Text="Hình" CssClass="lbl"></asp:Label>
                <asp:FileUpload ID="fileUploadHinh" runat="server" CssClass="txt" AutoPostBack="True"  />
            </div>

            <div class="form-control">
                <asp:Label ID="Label8" runat="server" Text="Ảnh xem trước" CssClass="lbl"></asp:Label><br />
                 <img src="../Images/Images/anhSP.jpg" class="anh"/>
            </div>
            <asp:Button ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" Width="100px" />
            </div>
</form>
</body>
</html>
