<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLKhoNL.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLKhoNL" %>
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
            <asp:Label ID="LabelSearch" runat="server" Text="Tên nguyên liệu:" CssClass="search-label"></asp:Label>
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-textbox"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" CssClass="search-button" />
        </div>
    </div>
    <asp:GridView ID="gridKho" runat="server" AutoGenerateColumns="False" DataKeyNames="MaNL" 
        OnRowDataBound="gridKho_RowDataBound"
        OnRowEditing="gridKho_RowEditing" 
        OnRowDeleting="gridKho_RowDeleting" OnRowUpdating="gridKho_RowUpdating" 
        OnRowCancelingEdit="gridKho_RowCancelingEdit">
        <Columns>
            <asp:TemplateField HeaderText="Mã NL">
                <ItemTemplate>
                    <asp:Label ID="LabelMaNV" runat="server" Text='<%# Eval("MaNL") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaNL" runat="server" Text='<%# Bind("MaNL") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tên nguyên liệu">
                <ItemTemplate>
                    <asp:Label ID="LabelTenNL" runat="server" Text='<%# Eval("TenNL") %>' Width="250px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTenNL" runat="server" Text='<%# Bind("TenNL") %>' Width="250px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="SL hiện có">
                <ItemTemplate>
                    <asp:Label ID="lblSLuong" runat="server" Text='<%# Eval("SLHienCo") %>'  Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxSL" runat="server" Text='<%# Bind("SLHienCo") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

           <asp:TemplateField HeaderText="Đơn vị tính">
                <ItemTemplate>
                    <asp:Label ID="lblDvt" runat="server" Text='<%# Eval("Dvt") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlDvt" runat="server" style="width: 150px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tình trạng">
                <ItemTemplate>
                    <asp:Label ID="lblTT" runat="server" Text='<%# Eval("TinhTrang") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTT" runat="server" style="width: 150px;"></asp:DropDownList>
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
