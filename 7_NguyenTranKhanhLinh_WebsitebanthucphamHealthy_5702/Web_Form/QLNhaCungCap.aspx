<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLNhaCungCap.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLNhaCungCap" %>
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
            <asp:Label ID="LabelSearch" runat="server" Text="Tên nhà cung cấp:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridNCC" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNCC"  
        OnRowEditing="gridNCC_RowEditing" 
        OnRowDeleting="gridNCC_RowDeleting" OnRowUpdating="gridNCC_RowUpdating" 
        OnRowCancelingEdit="gridNCC_RowCancelingEdit">
        <Columns>
              <asp:TemplateField HeaderText="Mã NCC">
                <ItemTemplate>
                    <asp:Label ID="LabelMaNCC" runat="server" Text='<%# Eval("MaNCC") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaNCC" runat="server" Text='<%# Bind("MaNCC") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tên NCC">
                <ItemTemplate>
                    <asp:Label ID="LabelMaNCC" runat="server" Text='<%# Eval("TenNCC") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenNCC" runat="server" Text='<%# Bind("TenNCC") %>' Width="200px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="SĐT">
                <ItemTemplate>
                    <asp:Label ID="LabelMaNCC" runat="server" Text='<%# Eval("SDT") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSDT" runat="server" Text='<%# Bind("SDT") %>' Width="100px"></asp:TextBox>
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
                    <asp:Label ID="LabelDC" runat="server" Text='<%# Eval("DiaChi") %>' Width="400px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDiaChi" runat="server" Text='<%# Bind("DiaChi") %>' Width="400px"></asp:TextBox>
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
     <asp:Button ID="btnInsert" runat="server" Text="Thêm" OnClick="btnInsert_Click" CssClass="btnThem"/>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSDLHemHealthyFoodConnectionString %>" SelectCommand="SELECT * FROM [NhaCungCap]"></asp:SqlDataSource>
</asp:Content>
