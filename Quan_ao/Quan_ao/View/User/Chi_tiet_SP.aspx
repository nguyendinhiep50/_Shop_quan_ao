<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Chi_tiet_SP.aspx.cs" Inherits="Quan_ao.View.User.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    Tên sản phẩm <asp:Label ID="lbl_tensp" runat="server" Text=""></asp:Label>
    <br />
    Hình ảnh minh hoạ
    <br />
    <img style="width:300px;height:300px;" src="../../Content/IMG/echxanh.jpg" />
    <br />
    giá sản phẩm : <asp:Label ID="lbl_giasp" runat="server" Text=""></asp:Label>
    <br />
    <asp:DropDownList ID="DDL_mau_sac" runat="server"></asp:DropDownList>
    <asp:DropDownList ID="DDL_Size" runat="server"></asp:DropDownList>
    <asp:DropDownList ID="DDL_Soluong" runat="server"></asp:DropDownList>
    <br />
    <asp:Button ID="btn_them_gio" runat="server" Text="thêm vào giỏ" OnClick="btn_them_gio_Click" />
</asp:Content>
