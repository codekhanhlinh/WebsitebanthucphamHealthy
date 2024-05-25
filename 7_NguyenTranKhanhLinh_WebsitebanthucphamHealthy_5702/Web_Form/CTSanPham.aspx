<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/SanPham.Master" AutoEventWireup="true" CodeBehind="CTSanPham.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.CTSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
         #form1 {
        align-items: center;
        justify-content: center;
       /* height: 100vh;*/ /* Điều chỉnh giá trị này dựa trên thiết kế của bạn */
        margin: 0; /* Loại bỏ lề mặc định để ngăn cuộn ngang */
        }

       .imgSP {
        width: 400px;
        height: 530px;
        animation: appearAnimation 1s ease-out; /* Thêm animation */
       }

            @keyframes appearAnimation {
                from {
                    opacity: 0; /* Bắt đầu với opacity = 0 */
                    transform: translateX(-20px); /* Bắt đầu từ trái qua */
                }
                to {
                    opacity: 1; /* Kết thúc với opacity = 1 */
                    transform: translateY(0); /* Kết thúc ở vị trí ban đầu */
                }
            }

            @keyframes appearAnimation2{
                from {
                    opacity: 0; /* Bắt đầu với opacity = 0 */
                     transform: translateX(20px); /* Bắt đầu từ phải qua */
                }
                to {
                    opacity: 1; /* Kết thúc với opacity = 1 */
                    transform: translateY(0); /* Kết thúc ở vị trí ban đầu */
                }
            }
        .Tensp{
            font-size:30px;
            text-align:left;
            animation: appearAnimation2 2s ease-out;
        }
        .Gia{

            font-size:20px;
            color:#6F8A4F;
            animation: appearAnimation2 2s ease-out;
        }

        .btnGH{
            font-family:Bahnschrift;
            font-size:23px;
            border:initial;
            background:#E9FFCA;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            border-bottom-left-radius: 5px;
            text-align:center;
            margin-left:50px;
            margin-right:20px;
            height:50px;
            width:200px;
            animation: appearAnimation2 2s ease-out;
        }

        .btn btn-outline-secondary{
            margin-right:100px;
        }

        .input-text {
            width: 30px;
            height:27px;
            font-family:Bahnschrift;
            font-size:20px;
            text-align:center;
        }
        .auto-style2 {
            width: 700px;
        }

        .btn-outline-secondary{
            font-family:Bahnschrift;
        }
    </style>
    <div>
        <br />
        <table style="margin-left:200px; " class="auto-style2">
            <tr>
                <td style="width:400px">
                    <asp:Image ID="imgSanPham" runat="server" CssClass="imgSP"/>
                </td>
                <td class="auto-style1">
                    <div style="margin-left:50px; font-family:Bahnschrift">
                        <asp:Label ID="lblTenSP" runat="server" CssClass="Tensp" Width="300px"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblGia" runat="server" Text="" CssClass="Gia"></asp:Label>

                        <br />
                    </div>  
                    <div style="margin-top:20px; margin-left:50px">       
                        <div class="input-group">                               
                               <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">-</button>
                                <asp:TextBox ID="quantity" runat="server" CssClass="input-text"  Text="1" ></asp:TextBox>   
                                <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">+ </button>                               
                        </div>
                    </div>
                    <div>
                        <div style="margin-top:20px">
                            <asp:Button ID="btnGioHang" runat="server" Text="Thêm vào giỏ hàng" CssClass="btnGH" OnClick="btnGioHang_Click"/>
                        </div>
                    </div>
                   
                </td>
            </tr>
        </table>
        <br />
        <div style="margin-left:30px">
            <div>
                <p style="border-bottom:2px solid #6F8A4F; color: #6F8A4F; font-size:30px; font-family:Bahnschrift">Mô tả sản phẩm của nhà Hẻm</p>
            </div>
                <div style="font-family:Bahnschrift">
                    <asp:Label ID="lblTenSP2" runat="server"></asp:Label>
                    <p>Thương hiệu: Hẻm Healthy Food</p>
                    Ngày sản xuất: <asp:Label ID="lblNSX" runat="server"></asp:Label>
                    <br />
                    <br />
                    Hạn sử dụng: <asp:Label ID="lblHSD" runat="server"></asp:Label>
                    <br />
                    <br />
                    Thành phần: <asp:Label ID="lblTP" runat="server"></asp:Label>
                    <p>Nơi sản xuất: Việt Nam</p>
                </div>
            </div>
        </div>
    <asp:HiddenField ID="SoLuong" runat="server" ClientIDMode="Static" />
<script>

    function increaseQuantity() {
        var quantityTextBox = document.getElementById('<%= quantity.ClientID %>');
        var currentQuantity = parseInt(quantityTextBox.value, 10);
        quantityTextBox.value = currentQuantity + 1;
    }

    function decreaseQuantity() {
        var quantityTextBox = document.getElementById('<%= quantity.ClientID %>');
        var currentQuantity = parseInt(quantityTextBox.value, 10);

        // Đảm bảo giảm xuống không dưới 1
        if (currentQuantity > 1) {
            quantityTextBox.value = currentQuantity - 1;
        }
    }
</script>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
    <br />
</asp:Content>--%>

