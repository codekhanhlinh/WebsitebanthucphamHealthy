<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLLoaiSP.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLLoaiSP" %>
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
            <asp:Label ID="LabelSearch" runat="server" Text="Tên loại sản phẩm:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridLSP" runat="server" AutoGenerateColumns="False"
        DataKeyNames="MaLSP" 
        OnRowEditing="gridLSP_RowEditing" 
        OnRowDeleting="gridLSP_RowDeleting" OnRowUpdating="gridLSP_RowUpdating" 
        OnRowCancelingEdit="gridLSP_RowCancelingEdit">
    <Columns>
        <asp:TemplateField HeaderText="Mã loại">
                <ItemTemplate>
                    <asp:Label ID="LabelMaLSP" runat="server" Text='<%# Eval("MaLSP") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaLSP" runat="server" Text='<%# Bind("MaLSP") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tên loại sản phẩm">
                <ItemTemplate>
                    <asp:Label ID="LabelHoTenKH" runat="server" Text='<%# Eval("TenLSP") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenLSP" runat="server" Text='<%# Bind("TenLSP") %>' Width="200px"></asp:TextBox>
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
   
</asp:Content>
