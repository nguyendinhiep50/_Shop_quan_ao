<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Quan_ao.View.User.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /*DANH SÁCH SẢN PHẨM*/
        @media(max-width:767.98px) {
            
        }

        .new_product h1 {
            color: #282828;
            font-size: 30px;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 50px;
        }

            .new_product h1::after {
                content: '';
                width: 90px;
                height: 4px;
                background-color: #ff3333;
                display: block;
                margin: 20px auto;
            }

        .SapXep_Gia {
            box-shadow: 0px 1px 8px 0px rgba(158, 158, 158, 0.75);
            width: 100%;
            padding: 20px;
            display: flex;
            justify-content: space-around;
            margin: 0 auto;
        }

            .SapXep_Gia .danhmuc_header {
                border-right: 2px solid rgb(233, 233, 233);
                padding-right: 80px;
            }

                .SapXep_Gia .danhmuc_header p {
                    font-weight: bold;
                    margin-bottom:10px;
               }

                .SapXep_Gia .danhmuc_header .danhmuc_item select {
                    width: 180px;
                    margin-bottom:10px;
                }

            .SapXep_Gia:hover {
                box-shadow: 0px 1px 8px 0px rgba(158, 158, 158, 0.75);
            }

            

            .SapXep_Gia .sanpham_price {
                border-right: 2px solid rgb(233, 233, 233);
                padding-right: 80px;
            }

            .SapXep_Gia .sanpham_price p {
                    margin-bottom:10px;
                    font-weight: bold;
                   

            }
            .SapXep_Gia .sanpham_price .p_maxPrice{
                     display: inline-block;
                     float: left;

             }

            .SapXep_Gia .gia_TG p {
                font-weight: bold;
                margin-bottom: 5px;
                margin-left:4px;
            }

            .SapXep_Gia .sanpham_price #MainContent_txt_min {
                width: 135px;
                height: 25px;
                margin-bottom:10px;
                margin-left:10px;

                      

            }

            .SapXep_Gia .sanpham_price #MainContent_txtmax {
                width: 135px;
                height: 25px;
                margin-left:4px;
                margin-top: 1px;
                float:left;
              
            }
            .SapXep_Gia .sanpham_price #MainContent_btn_loc_gia {
                width: 70px;
                height: 35px;
                background-color: #008B8B;
                color: white;
                font-weight: bold;
                padding-bottom: 10px;
                padding-bottom: 5px;
                padding-top: 5px;              
                border: 1px solid #008B8B;
                float: left;
                border-bottom:1px solid #008B8B;
                margin-bottom:10px;
            }

            .SapXep_Gia .sanpham_price #MainContent_btn_loc_gia:hover {
                background: #fe4c50;
                border: 1px solid #fe4c50;
                transition: 0.5s;
            }

            .SapXep_Gia .gia_TG #MainContent_btn_giamdan {
                background-color: #008B8B;
                color: white;
                padding-bottom: 5px;
                padding-top: 5px;
                border: 1px solid #008B8B;
                width: 110px;
                font-weight: bold;
                margin-right: 27px;
                margin-bottom:8px;
            }

                .SapXep_Gia .gia_TG #MainContent_btn_giamdan:hover {
                    background: #fe4c50;
                    border: 1px solid #fe4c50;
                    transition: 0.5s;
                }

            .SapXep_Gia .gia_TG #MainContent_btn_tangdan {
                background-color: #008B8B;
                color: white;
                padding-bottom: 5px;
                padding-top: 5px;
                border: 1px solid #008B8B;
                width: 110px;
                font-weight: bold;
               
            }

                .SapXep_Gia .gia_TG #MainContent_btn_tangdan:hover {
                    background: #fe4c50;
                    border: 1px solid #fe4c50;
                    transition: 0.5s;
                }




        /*Phần sản phẩm*/
        .products {
            border-right: 1px solid rgb(233, 233, 233);
            padding: 20px;
            padding-top: 20px;
            padding-bottom: 20px;
            text-align: center;
            margin-bottom: 40px;
            margin-top: 50px;
        }

            .products:hover {
                box-shadow: 0px 1px 8px 0px rgba(158, 158, 158, 0.75);
            }

            .products .img {
                width: 100%;
            }

            .products h2 {
                letter-spacing: 4px;
                color: black;
                font-size: 17px
            }

            .products span {
                color: #fe4c50;
                font-weight: 600;
            }

            .products .img-product:hover {
                /*            border: 2px solid #f00;
*/ transition: 0.7s;
                overflow: hidden;
            }
    </style>
    <div class="new_product">
        <h1>SẢN PHẨM NỔI BẬC</h1>
    </div>
    <div class="container">
    <div class="SapXep_Gia  row">
        <div class="danhmuc_header col-12 col-md-4 ">
            <p>DANH MỤC SẢN PHẨM</p>

            <div class="danhmuc_item ">
                <asp:DropDownList ID="DDL_danhmuc" runat="server" OnSelectedIndexChanged="DDL_danhmuc_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
        </div>


        <div class=" sanpham_price col-12 col-md-4">
            <p>GIÁ SẢN PHẨM</p>
            <b style="color:red">Từ</b>
            <asp:TextBox ID="txt_min" runat="server"></asp:TextBox> <br />
            <asp:CompareValidator ID="CV_giatu" runat="server" ErrorMessage="(*)" Type="Double" ControlToValidate="txt_min"></asp:CompareValidator>
            <p class="p_maxPrice" style="color:red">Đến</p><asp:TextBox ID="txtmax" runat="server"></asp:TextBox>
            <br />
            <asp:CompareValidator ID="CV_giaden" runat="server" ErrorMessage="(*)" ControlToValidate="txtmax" Type="Double"></asp:CompareValidator>
             <p><asp:Button ID="btn_loc_gia" runat="server" Text="SubMit" OnClick="btn_loc_gia_Click" /></p>         
            <asp:CompareValidator ID="CV_sosanh" runat="server" ErrorMessage="Phải nhỏ hơn giá từ" ControlToCompare="txt_min" ControlToValidate="txtmax" Operator="GreaterThanEqual" Type="Double"></asp:CompareValidator>    
        </div>
        <div class="gia_TG col-12 col-md-4">
            <p>GIÁ</p>
            <asp:Button ID="btn_giamdan" runat="server" Text="Giảm dần" OnClick="btn_giamdan_Click" />
            <asp:Button ID="btn_tangdan" runat="server" Text="Tăng dần" OnClick="btn_tangdan_Click" />
        </div>
        <br />
    </div>
    </div>
    <asp:Repeater ID="rptProducts"  runat="server">
        <ItemTemplate >
            <div class="products col-6 col-md-4 col-lg-3 row" style="display: inline-block;">
                <a href="Chi_tiet_SP.aspx?ID=<%# Eval("MaSP_ID") %>">
                    <img style="width:90%" class="img-product" src="../../Content/IMG/hinh_san_pham/<%# Eval("URL_Hinh_Anh") %>" />

                </a>
                <h2>Sản phẩm: <%# Eval("TenSP") %></h2>
                <p>Lượt mua :<%# Eval("LuotMua") %></p>
                <span class="price">Giá: <%# Eval("Gia", "{0:#,##0} Đồng") %></span>
            </div>
        </ItemTemplate>

    </asp:Repeater>

</asp:Content>
