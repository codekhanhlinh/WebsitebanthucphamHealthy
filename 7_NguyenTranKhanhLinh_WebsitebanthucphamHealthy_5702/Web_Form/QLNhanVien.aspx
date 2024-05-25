<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLNhanVien.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLNhanVien" %>
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

        .btnThem{
            font-family:Bahnschrift;
            vertical-align:middle;
            font-size:20px;
            border-color:#79b133;
            border-style:solid;
            background:#79b133;
            margin-left:10px;
        }
    </style>
    <br />
    <div>
        <div style="font-family:Bahnschrift">
            <asp:Label ID="LabelSearch" runat="server" Text="Tên nhân viên:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridNhanVien" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNV" 
        OnRowEditing="gridNhanVien_RowEditing" 
        OnRowDeleting="gridNhanVien_RowDeleting" OnRowUpdating="gridNhanVien_RowUpdating" 
        OnRowCancelingEdit="gridNhanVien_RowCancelingEdit">
        <Columns>
            <asp:TemplateField HeaderText="Mã NV">
                <ItemTemplate>
                    <asp:Label ID="LabelMaNV" runat="server" Text='<%# Eval("MaNV") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaNV" runat="server" Text='<%# Bind("MaNV") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Họ và tên">
                <ItemTemplate>
                    <asp:Label ID="LabelHoTenNV" runat="server" Text='<%# Eval("HoTenNV") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxHoTenNV" runat="server" Text='<%# Bind("HoTenNV") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Giới tính">
                <ItemTemplate>
                    <asp:Label ID="LabelGioiTinh" runat="server" Text='<%# Eval("GioiTinh") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxGioiTinh" runat="server" Text='<%# Bind("GioiTinh") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ngày sinh">
                <ItemTemplate>
                    <asp:Label ID="LabelNgaySinh" runat="server" Text='<%# Eval("NgaySinh", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNgaySinh" runat="server" Text='<%# Bind("NgaySinh", "{0:dd/MM/yyyy}") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="SĐT">
                <ItemTemplate>
                    <asp:Label ID="LabelSDT" runat="server" Text='<%# Eval("SDT") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSDT" runat="server" Text='<%# Bind("SDT") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="LabelEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxEmail" runat="server" Text='<%# Bind("Email") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Địa chỉ">
                <ItemTemplate>
                    <asp:Label ID="LabelDiaChi" runat="server" Text='<%# Eval("DiaChi") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDiaChi" runat="server" Text='<%# Bind("DiaChi") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Ngày vào làm">
                <ItemTemplate>
                    <asp:Label ID="LabelNgayVaoLam" runat="server" Text='<%# Eval("NgayVaoLam", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNgayVaoLam" runat="server" Text='<%# Bind("NgayVaoLam", "{0:dd/MM/yyyy}") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Chức vụ">
                <ItemTemplate>
                    <asp:Label ID="LabelChucVu" runat="server" Text='<%# Eval("ChucVu") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxChucVu" runat="server" Text='<%# Bind("ChucVu") %>' Width="100px"></asp:TextBox>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSDLHemHealthyFoodConnectionString %>" SelectCommand="SELECT * FROM [NhanVien]"></asp:SqlDataSource>
    <br />
    <div>
    <asp:Button ID="btnInsert" runat="server" Text="Thêm" OnClick="btnInsert_Click" CssClass="btnThem"/>
    </div>
</asp:Content>
