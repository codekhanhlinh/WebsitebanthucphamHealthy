<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QL_KhachHang.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QL_KhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .search-textbox{
            width:300px;
            height:33px;
        }

        .search-button{
            font-family:Bahnschrift;
            vertical-align:middle;
            font-size:20px;
            border-color:#79b133;
            border-style:solid;
            background:#79b133;
            margin-left:10px;
        }

        .search-label{
            margin-right:10px;
        }
    </style>
    <br />
    <div>
        <div style="font-family:Bahnschrift">
            <asp:Label ID="LabelSearch" runat="server" Text="Tên khách hàng:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridKH" runat="server"  AutoGenerateColumns="False"  DataKeyNames="MaKH" 
        OnRowDataBound="gridKH_RowDataBound"
        OnRowEditing="gridKH_RowEditing" 
        OnRowDeleting="gridKH_RowDeleting" OnRowUpdating="gridKH_RowUpdating" 
        OnRowCancelingEdit="gridKH_RowCancelingEdit" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
             <asp:TemplateField HeaderText="Mã KH">
                <ItemTemplate>
                    <asp:Label ID="LabelMaKH" runat="server" Text='<%# Eval("MaKH") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaKH" runat="server" Text='<%# Bind("MaKH") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Họ và tên">
                <ItemTemplate>
                    <asp:Label ID="LabelHoTenKH" runat="server" Text='<%# Eval("HoTenKH") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxHoTenKH" runat="server" Text='<%# Bind("HoTenKH") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Giới tính">
                <ItemTemplate>
                    <asp:Label ID="LabelGioiTinh" runat="server" Text='<%# Eval("GioiTinh") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGioiTinhKH" runat="server" style="width: 60px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Số điện thoại">
                <ItemTemplate>
                    <asp:Label ID="LabelSDT" runat="server" Text='<%# Eval("SDTKH") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSDTKH" runat="server" Text='<%# Bind("SDTKH") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="LabelSDT" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Địa chỉ">
                <ItemTemplate>
                    <asp:Label ID="LabelDC" runat="server" Text='<%# Eval("DiaChi") %>' Width="350px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDiaChi" runat="server" Text='<%# Bind("DiaChi") %>' Width="300px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowCancelButton="True" 
                EditText="Sửa" UpdateText="Lưu" CancelText="Hủy" 
                DeleteText="Xóa" NewText="Thêm" InsertText="Thêm" />
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
    <div>
    <asp:Button ID="btnInsert" runat="server" Text="Thêm" OnClick="btnInsert_Click" />
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSDLHemHealthyFoodConnectionString %>" SelectCommand="SELECT * FROM [KhachHang]"></asp:SqlDataSource>
</asp:Content>
