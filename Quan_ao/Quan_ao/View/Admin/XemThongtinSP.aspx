<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="XemThongtinSP.aspx.cs" Inherits="Quan_ao.View.Admin.XemThongtinSP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
 /* phần danh mục sản phẩm */
    #dmsp_SP {
        margin: 20px;
        transition: box-shadow 0.3s ease-in-out;
    }
    #dmsp_SP:hover{
        transition:0.5s;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.6);
    }
    .h2 {
        color:#e17055;
        font-size: 24px;
        font-weight: bold;
    }
    #ddl_tenmuc {
        margin-bottom: 20px;
    }
    .dmsp_name h2{
        color:#e17055;
    }
    .sp_header{
        border:1px solid #95a5a6;
        padding: 10px 0px 10px 10px;
    }

    /* phần thông tin sản phẩm */
    .dmsp_name {
        border:1px solid #95a5a6;
        padding: 10px 0px 10px 10px;
    }
    h2 {
        font-size: 18px;
        font-weight: bold;
    }
    #txttensp {
        width: 100%;
    }
    .thongtin_sp {
        display: flex;
        border:1px solid #95a5a6;
        padding: 10px 0px 10px 10px;
    }
    .thongtin_sp h2 {
        color: #e17055;
    }
    .thongtin_sp input{
        height: 30px;
        margin: 0 10px 0 5px;
    }
    .thongtin_sp img{
        height:190px;
    }
    #txtgia, #txttinhtrang {
        flex: 1;
        margin-right: 10px;
    }
    #img_sp {
        width: 200px;
        height: auto;
        margin-right: 10px;
    }
    #fu_hinhanh {
        margin-top: 10px;
    }

    /* phần thông tin đánh giá */
    .thongtin_danhgia {
        display: flex;
        border:1px solid #e17055;
        padding: 15px 0px 10px 10px;
    }
    .thongtin_danhgia h2{
        color: #e17055;
        padding: 0px 10px 0px 10px;
    }
    .thongtin_danhgia a{
        margin-left:10px;
        font-weight:bold;
    }
    .thongtin_danhgia a:hover{
        font-weight:bold;
        border: 1px solid #27ae60;
        background-color:#27ae60;
        transition:0.5s;
    }
    #lbl_link_sp {
        flex: 1;
    }
    #txtnhanxet, #txtdanhgia, #txtluotmua {
        flex: 1;
        margin-right: 10px;
    }
    .asplinkbutton {
        margin-top: 10px;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="dmsp_SP">
    <div class="sp_header">
         <h2 class="h2">Danh mục Sản phẩm</h2>  
         <asp:DropDownList ID="DDL_tenmuc" runat="server"></asp:DropDownList>
    </div>
    <asp:ListView ID="LV_thongtin_sp" runat="server" OnItemCommand="LV_thongtin_sp_ItemCommand" OnItemUpdating="LV_thongtin_sp_ItemUpdating"  >
        <ItemTemplate>
            <div class="dmsp_name">
                <h2>Tên Sản phẩm </h2>
                <asp:TextBox ID="txttensp" runat="server" Text='<%# Eval("TenSP") %>'></asp:TextBox>
            </div>     
            <div class="thongtin_sp">
                <h2>Giá</h2>
                <asp:TextBox ID="txtgia" runat="server" Text='<%# Eval("Gia") %>'></asp:TextBox>
                <h2>Tình trạng</h2>
                <asp:TextBox ID="txttinhtrang" runat="server" Text='<%# Eval("TinhTrang") %>'></asp:TextBox>
                <h2>Hình ảnh</h2>
                <asp:Image ID="IMG_sp" Width:200px runat="server" 
                ImageUrl='<%# ResolveUrl("~/Content/IMG/hinh_san_pham/" + Eval("URL_Hinh_Anh")) %>' />
            <asp:FileUpload ID="FU_hinhanh" runat="server" />
            </div>
            <div class="thongtin_danhgia">
            <h2>Link hình ảnh</h2>
            <asp:Label ID="lbl_link_sp" Text='<%#Eval("URL_Hinh_Anh") %>' runat="server" />
            <h2>Nhận xét</h2>
            <asp:TextBox ID="txtnhanxet" runat="server" Text='<%# Eval("NhanXet") %>'></asp:TextBox>

            <h2>Đánh giá</h2>
            <asp:TextBox ID="txtdanhgia" runat="server" Text='<%# Eval("DanhGia") %>'></asp:TextBox>

            <h2>Lượt mua</h2>
            <asp:TextBox ID="txtluotmua" runat="server" Text='<%# Eval("LuotMua") %>'></asp:TextBox>
            <asp:LinkButton runat="server" CssClass="btn btn-danger" CommandName="Update" Text="Update" />
            </div>
    </ItemTemplate>
    
    </asp:ListView>
</div>
</asp:Content>
