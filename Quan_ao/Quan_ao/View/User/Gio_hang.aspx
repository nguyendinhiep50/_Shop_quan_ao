<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Gio_hang.aspx.cs" Inherits="Quan_ao.View.User.Gio_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="lbl_gio" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GV_gio_hang" runat="server">
        <Columns>

        </Columns>
    </asp:GridView>
    <asp:Button ID="btn_thanhToan" runat="server" Text="Thanh Toán" OnClick="btn_thanhToan_Click" />
    
</asp:Content>
