<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="QL_taikhoan.aspx.cs" Inherits="Quan_ao.View.Admin.QL_taikhoan1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GV_Tai_Khoan" runat="server" OnRowCancelingEdit="GV_Tai_Khoan_RowCancelingEdit" OnRowDeleting="GV_Tai_Khoan_RowDeleting" OnRowEditing="GV_Tai_Khoan_RowEditing" OnRowUpdating="GV_Tai_Khoan_RowUpdating">
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
