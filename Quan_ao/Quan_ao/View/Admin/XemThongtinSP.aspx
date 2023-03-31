<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="XemThongtinSP.aspx.cs" Inherits="Quan_ao.View.Admin.XemThongtinSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Danh mục Sản phẩm</h2>  
    <asp:DropDownList ID="DDL_tenmuc" runat="server"></asp:DropDownList>
    <asp:ListView ID="LV_thongtin_sp" runat="server" OnItemCommand="LV_thongtin_sp_ItemCommand" OnItemUpdating="LV_thongtin_sp_ItemUpdating"  >
        <ItemTemplate>
        <div>
            <h2>Tên Sản phẩm </h2>
            <asp:TextBox ID="txttensp" runat="server" Text='<%# Eval("TenSP") %>'></asp:TextBox>

            <h2>Giá</h2>
            <asp:TextBox ID="txtgia" runat="server" Text='<%# Eval("Gia") %>'></asp:TextBox>

            <h2>Tình trạng</h2>
            <asp:TextBox ID="txttinhtrang" runat="server" Text='<%# Eval("TinhTrang") %>'></asp:TextBox>

            <h2>Hình ảnh</h2>
            <asp:Image ID="IMG_sp" Width:200px runat="server" 
                ImageUrl='<%# ResolveUrl("~/Content/IMG/hinh_san_pham/" + Eval("URL_Hinh_Anh")) %>' />
            <h2>Nhận xét</h2>
            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Eval("NhanXet") %>'></asp:TextBox>

            <h2>Đánh giá</h2>
            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Eval("DanhGia") %>'></asp:TextBox>

            <h2>Lượt mua</h2>
            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Eval("LuotMua") %>'></asp:TextBox>
            <asp:LinkButton runat="server" CommandName="Update" Text="Update" />
        </div>
    </ItemTemplate>
    
    </asp:ListView>
</asp:Content>
