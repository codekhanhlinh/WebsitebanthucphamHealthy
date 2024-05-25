<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLSanPham.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLSanPham" %>
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
            <asp:Label ID="LabelSearch" runat="server" Text="Tên sản phẩm:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" OnClick="btnSearch_Click" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridSP" runat="server" AutoGenerateColumns="False" DataKeyNames="MaSP"
        AllowPaging="True" EnableViewState="true" PageSize="3" OnPageIndexChanging="gridSP_PageIndexChanging"
        OnRowDataBound="gridSP_RowDataBound"
        OnRowEditing="gridSP_RowEditing" 
        OnRowDeleting="gridSP_RowDeleting" OnRowUpdating="gridSP_RowUpdating" 
        OnRowCancelingEdit="gridSP_RowCancelingEdit">
        <Columns>
        <asp:TemplateField HeaderText="Hình ảnh">
        <ItemTemplate>
        <asp:Image ID="imgHinhAnh" runat="server" ImageUrl='<%# Eval("Hinh") %>' Height="164px" Width="154px" />
        </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Mã SP">
                <ItemTemplate>
                    <asp:Label ID="lblmasp" runat="server" Text='<%# Eval("MaSP") %>' Width="90px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                   <asp:TextBox ID="TextBoxMaSP" runat="server" Text='<%# Bind("MaSP") %>' Width="90px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Loại SP">
                <ItemTemplate>
                    <asp:Label ID="lbllsp" runat="server" Text='<%# Eval("TenLSP") %>' Width="130px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlLSP" runat="server" style="width: 130px;"></asp:DropDownList>
                </EditItemTemplate>
        </asp:TemplateField>
 
         <asp:TemplateField HeaderText="Tên sản phẩm">
                <ItemTemplate>
                    <asp:Label ID="Label" runat="server" Text='<%# Eval("TenSP") %>' Width="180px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenSP" runat="server" Text='<%# Bind("TenSP") %>' Width="180px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Đơn vị tính">
                <ItemTemplate>
                    <asp:Label ID="lbllsp" runat="server" Text='<%# Eval("Dvt") %>' Width="80px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlDvt" runat="server" style="width: 80px;"></asp:DropDownList>
                </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Giá">
                <ItemTemplate>
                    <asp:Label ID="LabelGia" runat="server" Text='<%# Eval("Gia") %>' Width="50px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxGia" runat="server" Text='<%# Bind("Gia") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="SL Hiện có">
                <ItemTemplate>
                    <asp:Label ID="LabelSL" runat="server" Text='<%# Eval("SLHienCo") %>' Width="80px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSL" runat="server" Text='<%# Bind("SLHienCo") %>' Width="80px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>
 
         <asp:TemplateField HeaderText="NSX">
                <ItemTemplate>
                    <asp:Label ID="LabelNSX" runat="server" Text='<%# Eval("NSX") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNSX" runat="server" Text='<%# Bind("NSX") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="HSD">
                <ItemTemplate>
                    <asp:Label ID="LabelHSD" runat="server" Text='<%# Eval("HSD") %>' Width="80px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxHSD" runat="server" Text='<%# Bind("HSD") %>' Width="80px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Thành phần">
                <ItemTemplate>
                    <asp:Label ID="LabelTP" runat="server" Text='<%# Eval("ThanhPhan") %>' Width="80px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTP" runat="server" Text='<%# Bind("ThanhPhan") %>' Width="80px"></asp:TextBox>
                </EditItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Trọng lượng">
                <ItemTemplate>
                    <asp:Label ID="LabelTL" runat="server" Text='<%# Eval("TrongLuong") %>' Width="80px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTL" runat="server" Text='<%# Bind("TrongLuong") %>' Width="80px"></asp:TextBox>
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
    <br />
     <asp:Button ID="btnInsert" runat="server" Text="Thêm" OnClick="btnInsert_Click" CssClass="btnThem"/>
</asp:Content>
