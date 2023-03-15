<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="NhaCC.aspx.cs" Inherits="Quan_ao.View.Admin.NhaCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GV_NhaCC" runat="server" OnRowCancelingEdit="GV_NhaCC_RowCancelingEdit" OnRowDeleting="GV_NhaCC_RowDeleting" OnRowEditing="GV_NhaCC_RowEditing" OnRowUpdating="GV_NhaCC_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá" 
                            OnClientClick="return confirm('Bạn có đồng ý xoá nhà cung cấp này không')" 
                            CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
