<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonDatHang.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.DonDatHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
            .thongtinkh{
                margin-left:10px;
                margin-top:30px;
                font-family:Bahnschrift;
                text-align:center;
            }

            .txtTT{
              color:black;
              border:solid 2px;
              color:#87B44B;
              height:30px;
            }
            .hinh{
                margin-left:20px;
                margin-top: 10px;
            }

            .dathangTT{
                font-family:Bahnschrift;
                background-color:#87B44B;
                border-style:initial;
                width:150px;
                height:50px;
                text-align:center;
                font-size:20px;
                color:azure;
            }

            .panel{
                background:#009900;
                height:15px;
            }
            .grid{
                margin: 0 auto;
            }
        .auto-style1 {
            color: black;
            border-style: solid;
            border-color: inherit;
            border-width: 2px;
            color: #87B44B;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" CssClass="panel"></asp:Panel>
        </div>
        <div class="thongtinkh">
            <div>
                <p style="font-size:30px; margin-top:20px; color:#578148">Thông tin giao hàng</p>
            <div style="text-align:left; color:#87B44B">
                <div>
                Tên của bạn: <br />
                <asp:TextBox ID="txtTen" runat="server" CssClass="txtTT" Width="250px"></asp:TextBox>
                </div>
                <br />
                <div>
                Địa chỉ nhận hàng:<br />
                <asp:TextBox ID="txtDiaChi" runat="server" CssClass="txtTT" Width="500px"></asp:TextBox><br />
                </div>
                <br />
                <div>
                Số điện thoại: <br />
                <asp:TextBox ID="txtSDT" runat="server" CssClass="txtTT"></asp:TextBox>
                </div>
                <br />
                 Email:<br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="txtTT" Width="500px"></asp:TextBox><br />
                <br />
                <div>
                    Phương thức thanh toán: <br />
                    <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="auto-style1" BorderWidth="0" Width="368px" onchange="showDiv(this.value)">
                        <asp:ListItem Value="MOMO" onclick="showDiv('divMomo')">
                            <span style="font-family: Bahnschrift; font-size: 20px; color: #c80a59; margin-left: 5px;">Ví MoMo</span>
                            <img src="../Images/Logo_Icon/momo.png" alt="momo" style="width: 25px; height: 25px; vertical-align: middle;" />
                       
                        </asp:ListItem>
                        <asp:ListItem Text="ZaloPay" Value="ZALO" onclick="showDiv('divZalo')">
                            <span style="font-family: Bahnschrift; font-size: 20px; color: #0066cc; margin-left: 5px;">Ví ZaloPay</span>
                            <img src="../Images/Logo_Icon/zl.png" alt="zalo" style="width: 35px; height: 35px; vertical-align: middle;" />
                        </asp:ListItem>
                        <asp:ListItem Text="Chuyển khoản ngân hàng" Value="BANK" onclick="showDiv('divBank')">
                            <span style="font-family: Bahnschrift; font-size: 20px; color: #000000; margin-left: 5px;">Chuyển ngân hàng</span>
                            <img src="../Images/Logo_Icon/card-30.png" alt="card" style="width: 35px; height: 35px; vertical-align: middle;" />
                        </asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <br />
                 Ghi chú (Bạn muốn nhắn gì tụi mình): <br />
                <asp:TextBox ID="txtGhiChu" runat="server" CssClass="txtTT" Width="500px"></asp:TextBox>
                </div>
                </div>
            </div>
             <div style="font-family:Bahnschrift; text-align:center;">
                   <h2 style="font-family:Bahnschrift; color:#87B44B">Thông tin sản phẩm</h2>
                   <asp:GridView ID="GridViewDonDatHang" runat="server" AutoGenerateColumns="False" CssClass="grid">
                        <Columns>
                            <asp:TemplateField ItemStyle-BorderStyle="None">
                                <ItemTemplate>
                                    <asp:Image ID="imgHinh" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="150" Width="100" CssClass="hinh" />
                                </ItemTemplate>
                                <HeaderStyle BackColor="#87B44B" ForeColor="White" BorderStyle="None" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TenSanPham" HeaderText="Sản Phẩm" SortExpression="TenSanPham" ItemStyle-BorderStyle="None" ItemStyle-Width="500px">
                                <HeaderStyle BackColor="#87B44B" ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng" ItemStyle-BorderStyle="None" ItemStyle-Width="200px">
                                <HeaderStyle BackColor="#87B44B" ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Gia" HeaderText="Đơn Giá" DataFormatString="{0:N0}" ItemStyle-BorderStyle="None" ItemStyle-Width="200px">
                                <HeaderStyle BackColor="#87B44B" ForeColor="White" BorderStyle="None" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Thành tiền" ItemStyle-Width="200px" ItemStyle-BorderStyle="None">
                                <ItemTemplate>
                                    <%# (Convert.ToDecimal(Eval("Gia")) * Convert.ToInt32(Eval("SoLuong"))).ToString("N0") %>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#87B44B" ForeColor="White" BorderStyle="None" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                <br />
                <div style="text-align:left; font-family:Bahnschrift; color:#87B44B">
                    Tổng tiền thanh toán:<asp:Label ID="lblTotalAmount" runat="server" ForeColor="Black"></asp:Label>
                </div>
                 <div style="text-align:center; margin-top:20px;">
                     <asp:Button ID="btnDatHangTT" runat="server" Text="Đặt hàng" CssClass="dathangTT" OnClick="btnDatHangTT_Click" />
                 </div>
            </div>
            <br />
            <div>
            <asp:Panel ID="Panel2" runat="server" CssClass="panel"></asp:Panel>
            </div>
    </form>
    
</body>
</html>
