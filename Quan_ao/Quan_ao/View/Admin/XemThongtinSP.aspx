<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="XemThongtinSP.aspx.cs" Inherits="Quan_ao.View.Admin.XemThongtinSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server">
        <ItemTemplate>
        <div>
            <h2>Danh mục Sản phẩm: <%# Eval("MaDMSP") %> đồng</h2>
            <h2>Tên Sản phẩm :<%# Eval("TenSP") %></h2>
            <h2>Giá: <%# Eval("Gia") %> đồng</h2>
            <h2>Tình trạng: <%# Eval("TinhTrang") %> đồng</h2>

            <h2>Hình ảnh: <%# Eval("URL_Hinh_Anh") %> đồng</h2>
            <h2>Nhận xét: <%# Eval("NhanXet") %> đồng</h2>
            <h2>Đánh giá: <%# Eval("DanhGia") %> đồng</h2>
            <h2>Lượt mua: <%# Eval("LuotMua") %> đồng</h2>

            <asp:Button ID="btnEdit" runat="server" Text="Sửa" CommandName="Edit" CommandArgument='<%# Eval("MaSP_ID") %>' />
        </div>
    </ItemTemplate>
    </asp:ListView>
</asp:Content>
