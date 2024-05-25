<%@ Page Title="" Language="C#" MasterPageFile="~/Master_Page/QuanLy.Master" AutoEventWireup="true" CodeBehind="QLPN_CTPN.aspx.cs" Inherits="_7_NguyenTranKhanhLinh_WebsitebanthucphamHealthy_5702.Web_Form.QLPN_CTPN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    
    
    </style>
    <div>
    <p style="font-family:Bahnschrift; font-size:25px; color:#009900">Phiếu nhập</p>
    <asp:GridView ID="gridPN" runat="server" AutoGenerateColumns="False"
        DataKeyNames="MaPN" OnSelectedIndexChanged="gridPN_SelectedIndexChanged"
        OnRowDataBound="gridPN_RowDataBound"
        OnRowEditing="gridPN_RowEditing" 
        OnRowDeleting="gridPN_RowDeleting" 
        OnRowUpdating="gridPN_RowUpdating" 
        OnRowCancelingEdit="gridPN_RowCancelingEdit">
        <Columns>
             <asp:CommandField ShowSelectButton="True" ButtonType="Image" ControlStyle-CssClass="selectButton" SelectImageUrl="~/Images/Logo_Icon/hand-up-35.png">
<ControlStyle CssClass="selectButton"></ControlStyle>
             </asp:CommandField>
            <asp:TemplateField HeaderText="Mã PN">
                <ItemTemplate>
                    <asp:Label ID="LabelMaKH" runat="server" Text='<%# Eval("MaPN") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaPN" runat="server" Text='<%# Bind("MaPN") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Nhân viên">
                <ItemTemplate>
                    <asp:Label ID="lblDvt" runat="server" Text='<%# Eval("HoTenNV") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenNV" runat="server" style="width: 150px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Nhà cung cấp">
                <ItemTemplate>
                    <asp:Label ID="lblNCC" runat="server" Text='<%# Eval("TenNCC") %>' Width="200px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenNCC" runat="server" style="width: 200px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Ngày nhập">
                <ItemTemplate>
                    <asp:Label ID="LabelNgayNhap" runat="server" Text='<%# Eval("NgayNhap", "{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxNgayNhap" runat="server" Text='<%# Bind("NgayNhap", "{0:dd/MM/yyyy}") %>' Width="100px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Tổng phiếu nhập">
                <ItemTemplate>
                    <asp:Label ID="LabelTong" runat="server" Text='<%# Eval("TongPN","{0:N0}") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxTongPN" runat="server" Text='<%# Bind("TongPN","{0:N0}") %>' Width="150px"></asp:TextBox>
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
    <p style="font-family:Bahnschrift; font-size:25px; color:#009900">Chi tiếtPhiếu nhập</p>
    <div>
        <asp:GridView ID="gridCTPN" runat="server" AutoGenerateColumns="False"
            DataKeyNames="MaPN" 
            OnRowDataBound="gridCTPN_RowDataBound"
            OnRowEditing="gridCTPN_RowEditing" 
            OnRowDeleting="gridCTPN_RowDeleting" 
            OnRowUpdating="gridCTPN_RowUpdating" 
            OnRowCancelingEdit="gridCTPN_RowCancelingEdit">
            <Columns>
                <asp:TemplateField HeaderText="Mã PN">
                <ItemTemplate>
                    <asp:Label ID="LabelMaPN" runat="server" Text='<%# Eval("MaPN") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxMaCTPN" runat="server" Text='<%# Bind("MaPN") %>' Width="50px"></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
           

             <asp:TemplateField HeaderText="Tên NL">
                <ItemTemplate>
                    <asp:Label ID="lblTenNL" runat="server" Text='<%# Eval("TenNL") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlTenNL" runat="server" style="width: 150px;"></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>

                <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:Label ID="lblSL" runat="server" Text='<%# Eval("SLNhap") %>' Width="150px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                     <asp:TextBox ID="TextBoxSL" runat="server" Text='<%# Bind("SLNhap") %>' Width="50px"></asp:TextBox>
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

                 <asp:TemplateField HeaderText="Giá nhập">
                <ItemTemplate>
                    <asp:Label ID="lblGN" runat="server" Text='<%# Eval("GiaNhap","{0:N0}") %>' Width="100px"></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBoxGN" runat="server" Text='<%# Bind("GiaNhap","{0:N0}") %>' Width="100px"></asp:TextBox>
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
