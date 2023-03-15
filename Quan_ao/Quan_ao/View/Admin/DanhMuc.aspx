<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="Quan_ao.View.Admin.DanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <h2>Thêm danh mục</h2>
    <asp:Label ID="lbl_them" runat="server" Text=""></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GV_Danh_Muc" runat="server" OnRowEditing="GV_Danh_Muc_RowEditing" OnRowUpdating="GV_Danh_Muc_RowUpdating" OnRowCancelingEdit="GV_Danh_Muc_RowCancelingEdit" OnRowDeleting="GV_Danh_Muc_RowDeleting">
        <Columns>
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá" 
                            OnClientClick="return confirm('Bạn có đồng ý xoá Danh mục này không')" 
                            CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
