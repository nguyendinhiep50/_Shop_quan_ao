<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="Quan_ao.View.Admin.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GV_SanPham" DataKeyNames="MaSP_ID" runat="server" OnRowCancelingEdit="GV_SanPham_RowCancelingEdit" OnRowDeleting="GV_SanPham_RowDeleting" OnRowEditing="GV_SanPham_RowEditing" OnRowUpdating="GV_SanPham_RowUpdating" OnRowCommand="GV_SanPham_RowCommand" AutoGenerateColumns="False" AllowPaging="True" PageSize="5">
        <Columns>
             <asp:BoundField DataField="MaSP_ID" HeaderText="Mã Sản phẩm" />
              <asp:TemplateField HeaderText="TenDanhMuc">
                    <ItemTemplate>
                        <asp:Label ID="lbldanhmuc" runat="server" Text='<%# Bind("TenMuc") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTenDM" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
             <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
             <asp:BoundField DataField="Gia" HeaderText="Giá SP" />
             <asp:BoundField DataField="URL_Hinh_Anh" HeaderText="Hình ảnh" />
            
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá" 
                            OnClientClick="return confirm('Bạn có đồng ý xoá sản phẩm này không')" 
                            CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate>

                    </EditItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Thông tin SP">
                    <ItemTemplate>
                        <asp:Button ID="btn_xem_TT" runat="server" Text="Thông tin" CommandName="XemThongtinSP" CommandArgument='<%# Eval("MaSP_ID") %>' />  </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Xem kho hàng">
                    <ItemTemplate>
                        <asp:Button ID="btn_xem_KH" runat="server" Text="Kho hàng" CommandName="XemKhoHang" CommandArgument='<%# Eval("MaSP_ID") %>' />  </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
