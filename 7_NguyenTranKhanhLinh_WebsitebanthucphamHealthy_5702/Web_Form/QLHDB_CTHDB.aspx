<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLHDB_CTHDB.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLHDB_CTHDB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    
    
    </style>
    <div>
    <p style="font-family:Bahnschrift; font-size:25px; color:#009900">Hóa đơn bán</p>
    <asp:GridView ID="gridHD" runat="server" AutoGenerateColumns="False"
        DataKeyNames="MaHD" OnSelectedIndexChanged="gridHD_SelectedIndexChanged"
        OnRowDataBound="gridHD_RowDataBound"
        OnRowEditing="gridHD_RowEditing" 
        OnRowDeleting="gridHD_RowDeleting" 
        OnRowUpdating="gridHD_RowUpdating" 
        OnRowCancelingEdit="gridHD_RowCancelingEdit">
        <Columns>
             <asp:CommandField ShowSelectButton="True" ButtonType="Image" ControlStyle-CssClass="selectButton" SelectImageUrl="~/Images/Logo_Icon/hand-up-35.png">
        <ControlStyle CssClass="selectButton"></ControlStyle>
             </asp:CommandField>
            <asp:TemplateField HeaderText="Mã HD">
                <ItemTemplate>
                    <asp:Label ID="LabelMaHD" runat="server" Text='<%# Eval("MaHD") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaHD" runat="server" Text='<%# Bind("MaHD") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Nhân viên">
                <ItemTemplate>
                    <asp:Label ID="lblDvt" runat="server" Text='<%# Eval("HoTenNV") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenNV" runat="server" style="width: 200px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Khách hàng">
                <ItemTemplate>
                    <asp:Label ID="lblKH" runat="server" Text='<%# Eval("HoTenKH") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenKH" runat="server" style="width: 200px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Ngày đặt">
                <ItemTemplate>
                    <asp:Label ID="LabelNgayDat" runat="server" Text='<%# Eval("NgayDat", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNgayDat" runat="server" Text='<%# Bind("NgayDat", "{0:dd/MM/yyyy}") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Phương thức thanh toán">
                <ItemTemplate>
                    <asp:Label ID="lblPTTT" runat="server" Text='<%# Eval("PTTT") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlPTTT" runat="server" style="width: 250px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Tổng hóa đơn">
                <ItemTemplate>
                    <asp:Label ID="LabelTongHD" runat="server" Text='<%# Eval("TongTienHD","{0:N0}") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTongHD" runat="server" Text='<%# Bind("TongTienHD","{0:N0}") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Tình trạng">
                <ItemTemplate>
                    <asp:Label ID="LabelTT" runat="server" Text='<%# Eval("TinhTrang") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTT" runat="server" Text='<%# Bind("TinhTrang") %>' Width="150px"></asp:TextBox>
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
    </div>
     <p style="font-family:Bahnschrift; font-size:25px; color:#009900">Chi tiết Hóa đơn bán</p>
    <div>
        <asp:GridView ID="gridCTHD" runat="server" AutoGenerateColumns="False"
            DataKeyNames="MaHD" 
            OnRowDataBound="gridCTHD_RowDataBound"
            OnRowEditing="gridCTHD_RowEditing" 
            OnRowDeleting="gridCTHD_RowDeleting" 
            OnRowUpdating="gridCTHD_RowUpdating" 
            OnRowCancelingEdit="gridCTHD_RowCancelingEdit">
            <Columns>
                <asp:TemplateField HeaderText="Mã HD">
                <ItemTemplate>
                    <asp:Label ID="LabelMaHD" runat="server" Text='<%# Eval("MaHD") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaCTHD" runat="server" Text='<%# Bind("MaHD") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           

             <asp:TemplateField HeaderText="Tên sản phẩm">
                <ItemTemplate>
                    <asp:Label ID="lblTenSP" runat="server" Text='<%# Eval("TenSP") %>' Width="400px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenSP" runat="server" style="width: 400px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:Label ID="lblSL" runat="server" Text='<%# Eval("SLDat") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="TextBoxSL" runat="server" Text='<%# Bind("SLDat") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Đvt">
                <ItemTemplate>
                    <asp:Label ID="lblDvt" runat="server" Text='<%# Eval("Dvt") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxDvt" runat="server" Text='<%# Bind("Dvt") %>' Width="150px"></asp:TextBox>
                </EditItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Đơn giá">
                <ItemTemplate>
                    <asp:Label ID="lblGia" runat="server" Text='<%# Eval("DonGia","{0:N0}") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxGia" runat="server" Text='<%# Bind("DonGia","{0:N0}") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
                  </asp:TemplateField>

                 <asp:TemplateField HeaderText="Thành tiền">
                <ItemTemplate>
                    <asp:Label ID="lblTT" runat="server" Text='<%# Eval("ThanhTien","{0:N0}") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTT" runat="server" Text='<%# Bind("ThanhTien","{0:N0}") %>' Width="100px"></asp:TextBox>
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
    </div>
</asp:Content>
