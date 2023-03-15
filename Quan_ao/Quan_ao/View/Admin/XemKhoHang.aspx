<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="XemKhoHang.aspx.cs" Inherits="Quan_ao.View.Admin.XemChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView  ID="GV_ChiTiet" runat="server" OnRowCancelingEdit="GV_ChiTiet_RowCancelingEdit" OnRowDeleting="GV_ChiTiet_RowDeleting" OnRowEditing="GV_ChiTiet_RowEditing" OnRowUpdating="GV_ChiTiet_RowUpdating">
        <Columns>
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
             
        </Columns>
    </asp:GridView>
</asp:Content>
