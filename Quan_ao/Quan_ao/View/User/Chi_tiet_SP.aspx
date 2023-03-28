<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Chi_tiet_SP.aspx.cs" Inherits="Quan_ao.View.User.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">   
    <style>
         .products{
            border-right: 1px solid rgb(233, 233, 233);
            padding:20px;
            padding-top:20px;
            padding-bottom:20px;
            text-align:center;
            margin-bottom:40px;
            margin-top: 50px;
            margin: 0 auto;
        }
        .products:hover{
           box-shadow: 0px 1px 8px 0px rgba(158, 158, 158, 0.75);

        }
        .products .img{
            width:100%;
            
        }
        .products h2{
             letter-spacing: 4px;
             color: black;
            font-size: 17px
        }
       
        .products span{
            color: #fe4c50;
            font-weight: 600;
        }
       
        .products .img-product:hover{
/*            border: 2px solid #f00;
*/            transition: 0.7s;
            overflow:hidden;
        }
        .products #MainContent_btn_them_gio{
         background-color:#008B8B;
            color:white;
            padding-bottom: 5px;
            padding-top: 5px;
            border:1px solid #008B8B;
            width: 120px;
            margin-bottom: 10px;
            margin-top: 10px;
            font-weight:bold;
        }
        .products #MainContent_btn_them_gio:hover{
             background: #fe4c50;
             border:1px solid #fe4c50;
             transition:0.5s;

        }
    </style>
    <div class="products" style="display: inline-block;width: 24%;">      
    <img style="width:250px;height:250px;" src="../../Content/IMG/hinh_san_pham/product_1.png"/>
     <h2>Sản phẩm: <asp:Label ID="lbl_tensp" runat="server" Text=""></asp:Label></h2>
     <p>Giá: <asp:Label ID="lbl_giasp" runat="server" Text="" > <%# Eval("Gia", "{0:#,##0} Đồng") %></asp:Label></p>

    <asp:DropDownList ID="DDL_mau_sac" runat="server"></asp:DropDownList>
    <asp:DropDownList ID="DDL_Size" runat="server"></asp:DropDownList>
    <asp:DropDownList ID="DDL_Soluong" runat="server"></asp:DropDownList>
    <br />
    <asp:Button ID="btn_them_gio" runat="server" Text="Thêm vào giỏ" OnClick="btn_them_gio_Click" />
    </div>
</asp:Content>
