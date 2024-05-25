<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="ThongKe.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.ThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .panelDT{
            height:70px;
            width:300px;
        }

        .lblThu{
           font-family:Bahnschrift;
           color:#ff0000;
           font-size:20px;
        }

         .lblChi{
           font-family:Bahnschrift;
           color:#ff6a00;
           font-size:20px;
        }

        .xem{
            font-family:Bahnschrift;
            border:solid 2px;
            border-color: #5ea249;
            height:40px;
            width:100px;
        }

        .chk{
            font-family:Bahnschrift;
            font-size:20px;
        }
    </style>
    <table>
    <tr>
    <td>
    <div style="margin-top:30px;">
        <asp:Panel ID="Panel1" runat="server" CssClass="panelDT">
            <label style="font-family:Bahnschrift; font-size:30px; color:#ff0000">Doanh thu</label><br />
            <asp:Label ID="lblThu" runat="server" Text="" CssClass="lblThu" ></asp:Label>
         
        </asp:Panel>
    </div>
    <table style="font-family:Bahnschrift; font-size:20px; margin-left: 40px;">
        <tr>
            <td>
                <div>
                    <asp:CheckBox ID="chkNgay" runat="server"/>Ngày<br /><br />
                    <asp:DropDownList ID="ddlNgay" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
            <td>
                <div>
                     <asp:CheckBox ID="chkThang" runat="server" /> Tháng<br /><br />
                    <asp:DropDownList ID="ddlThang" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
            <td>
                <div>
                     <asp:CheckBox ID="chkNam" runat="server" /> Năm<br /><br />
                    <asp:DropDownList ID="ddlNam" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Button ID="btnXem" runat="server" Text="Xem" OnClick="btnXem_Click"  CssClass="xem" />
            </td>
        </tr>
        </table>
    <br />
    <div>

    <asp:GridView ID="gridThu" runat="server" AutoGenerateColumns="False">
        <Columns>

        <asp:BoundField DataField="MaHD" HeaderText="Mã HD" SortExpression="MaHD" />
        <asp:BoundField DataField="MaNV" HeaderText="Mã NV" SortExpression="MaNV" />
        <asp:BoundField DataField="MaKH" HeaderText="Mã KH" SortExpression="MaKH" />
        <asp:BoundField DataField="NgayDat" HeaderText="Ngày Đặt" SortExpression="NgayDat" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="PTTT" HeaderText="Phương Thức Thanh Toán" SortExpression="PTTT"/>
        <asp:BoundField DataField="TongTienHD" HeaderText="Tổng Tiền Hóa Đơn" SortExpression="TongTienHD" DataFormatString="{0:N0}" />
    </Columns>
     <FooterStyle BackColor="#99CCCC" ForeColor="#009900" />
            <HeaderStyle BackColor="#E9FFCA" Font-Bold="True" ForeColor="#009900" Font-Names="Bahnschrift" Font-Size="20px" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#009900" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#000000" Font-Names="Bahnschrift" Font-Size="20px" />
            <SelectedRowStyle BackColor="#009900" Font-Bold="True" ForeColor="#009900" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    </div>
    </td>
    <td style="border-left:solid 2px; border-color:#5ea249">
    <div style="margin-left:30px;">
        <div style="margin-top:30px;">
        <asp:Panel ID="Panel2" runat="server" CssClass="panelDT">
            <label style="font-family:Bahnschrift; font-size:30px; color:#ff6a00">Chi</label><br />
            <asp:Label ID="lblChi" runat="server" Text="" CssClass="lblChi"></asp:Label>
         
        </asp:Panel>
    </div>
    <table style="font-family:Bahnschrift; font-size:20px; margin-left: 40px;">
        <tr>
            <td>
                <div>
                    <asp:CheckBox ID="chkNgayN" runat="server" /> Ngày<br /><br />
                    <asp:DropDownList ID="ddlNN" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
            <td>
                <div>
                     <asp:CheckBox ID="chkThangN" runat="server" /> Tháng<br /><br />
                    <asp:DropDownList ID="ddlTN" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
            <td>
                <div>
                     <asp:CheckBox ID="chkNamN" runat="server" /> Năm<br /><br />
                    <asp:DropDownList ID="ddlNamN" runat="server" CssClass="chk"></asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr>
            <td>
            <asp:Button ID="brnXemChi" runat="server" Text="Xem" OnClick="btnXemChi_Click" CssClass="xem"/>
            </td>
        </tr>
        </table>
    <br />
    <div>
    <asp:GridView ID="gridChi" runat="server" AutoGenerateColumns="False">
        <Columns>
        <asp:BoundField DataField="MaPN" HeaderText="Mã PN" SortExpression="MaPN" />
        <asp:BoundField DataField="MaNV" HeaderText="Mã NV" SortExpression="MaNV" />
        <asp:BoundField DataField="MaNCC" HeaderText="Mã NCC" SortExpression="MaNCC" />
        <asp:BoundField DataField="NgayNhap" HeaderText="Ngày nhập" SortExpression="NgayNhap" DataFormatString="{0:dd/MM/yyyy}" />
        <asp:BoundField DataField="TongPN" HeaderText="Tổng phiếu nhập" SortExpression="TongPN" DataFormatString="{0:N0}" />
    </Columns>
     <FooterStyle BackColor="#99CCCC" ForeColor="#009900" />
            <HeaderStyle BackColor="#E9FFCA" Font-Bold="True" ForeColor="#009900" Font-Names="Bahnschrift" Font-Size="20px" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#009900" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#000000" Font-Names="Bahnschrift" Font-Size="20px" />
            <SelectedRowStyle BackColor="#009900" Font-Bold="True" ForeColor="#009900" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
    </div>
    </div>
    </td>
    </tr>
    </table>
    </asp:Content>
