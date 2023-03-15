<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Quan_ao.View.User.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Chọn danh mục sản phẩm</h1>
    <asp:DropDownList ID="DDL_danhmuc" runat="server" OnSelectedIndexChanged="DDL_danhmuc_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
    <br />
    Giá từ <asp:TextBox ID="txt_min" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CV_giatu" runat="server" ErrorMessage="(*)" Type="Double" ControlToValidate="txt_min"></asp:CompareValidator>
    Đến<asp:TextBox ID="txtmax" runat="server"></asp:TextBox>
    <asp:CompareValidator ID="CV_giaden" runat="server" ErrorMessage="(*)" ControlToValidate="txtmax" Type="Double"></asp:CompareValidator>
    <asp:Button ID="btn_loc_gia" runat="server" Text="Lọc" OnClick="btn_loc_gia_Click"/>
    <asp:CompareValidator ID="CV_sosanh" runat="server" ErrorMessage="Phải nhỏ hơn giá từ" ControlToCompare="txt_min" ControlToValidate="txtmax" Operator="GreaterThanEqual" Type="Double"></asp:CompareValidator>
    <br />
    <asp:Button ID="btn_giamdan" runat="server" Text="Giá giảm dần" OnClick="btn_giamdan_Click" />
    <asp:Button ID="btn_tangdan" runat="server" Text="Giá tăng dần" OnClick="btn_tangdan_Click" />
    <br />
    <asp:Repeater ID="rptProducts" runat="server">
            <ItemTemplate>
                <div class="product" style="display: inline-block;height: 300px;width: 24%;">
                    <a href="Chi_tiet_SP.aspx?ID=<%# Eval("MaSP_ID") %>">
                      <img style="width:300px;height:300px;" src="../../Content/IMG/echxanh.jpg"  />
                    </a>
                    <h2>Tên SP : <%# Eval("TenSP") %></h2>
                    <p>Lượt mua :<%# Eval("LuotMua") %></p>
                    <span class="price">Giá: <%# Eval("Gia", "{0:#,##0} Đồng") %></span>
                </div>
            </ItemTemplate>
       
        </asp:Repeater>
</asp:Content>
