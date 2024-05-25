<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/SanPham.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Shantell+Sans:wght@500&display=swap');
        .item{
            margin-right: 50px; 
            margin-left: 50px;
            font-family:'Bahnschrift', sans-serif;
            font-size:20px;
            text-align:center;
        }
        .price-label{
            border:1px none;
            padding:5px;
            background-color:#E9FFCA;
  
        }   
        .Panel1{
            font-family: 'Shantell Sans', sans-serif;
        }
        .auto-style4 {
            text-align: center;
        }

        .themgiohang{
            border:none; 
            background:none;
            
        }
        .imageInButton {
            text-align:center;
        }

    </style>
    <div style="text-align:center">
        <asp:Panel ID="Panel1" runat="server" BackColor="#E9FFCA" CssClass="Panel1">
             <h2 style="font-size:25px; color:#009900">Sản phẩm của nhà Hẻm</h2>
        </asp:Panel>
    </div>
    <%--<ul class="ul danhmuclsp">
        <li class="liDanhMuc" style="left:0px; top:0px">--%>
            <table style="width: 100%">
                <tr>
                    <td style="width:5px; background-color:#E9FFCA"></td>
                    <td class="auto-style4">
                        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#E9FFCA" BorderStyle="None" 
                            BorderWidth="1px" CellPadding="4" DataKeyField="MaSP" RepeatColumns="4" Width="700px" DataKeyNames="MaSP"
                            CellSpacing="2">
                            <ItemTemplate>
                                <div class="item" <%--style="text-align:center"--%>>
                                    <asp:ImageButton ID="imgBtnChiTiet" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="320px" Width="250px"
                                        OnCommand="imgBtnChiTiet_Command" CommandArgument='<%# Eval("MaSP") %>' CommandName="ViewDetails" />
                                    <asp:Label ID="TenSanPham" runat="server" Text='<%# Eval("TenSP") %>' Height="50px" Width="250px"/>
                                    <br />
                                    <asp:Label ID="GiaLabel" CssClass="price-label" runat="server" 
                                        Text='<%# String.Format("{0:N0} đ", Eval("Gia")) %>'></asp:Label>
                                    <br />
                                    <br />
                                      <asp:ImageButton ID="btnDH" runat="server" CssClass="themgiohang" OnCommand="btnDH_Command" 
                 CommandArgument='<%# Eval("MaSP") %>' CommandName="AddToCart" ImageUrl="/Images/Logo_Icon/shoppingcart-35.png" AlternateText="Add to Cart" />
                                </div>  
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        </asp:DataList>
                    </td>
                    <td style="width:5px; background-color:#E9FFCA"></td>
                </tr>
        </table> 
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
</asp:Content>
<%--<asp:Content ID="Content2" ContentPlaceHolderID="Content2" runat="server">
</asp:Content>--%>
