<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="CT_hoadon_khach.aspx.cs" Inherits="Quan_ao.View.User.CT_hoadon_khach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <table class="container">
                        <tr class="text-center">
                            <th>Sản phẩm</th>
                            <th>Tên sản phẩm </th>
                            <th>Màu</th>
                            <th>Size</th>
                            <th>Số Lượng</th>
                        </tr>

                        <%-- phần thay đổi --%>
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <tr class="text-center align-content-center">
                                    <td>
                                        <img class="border img-thumbnail mt-3" src="../../Content/IMG/hinh_san_pham/<%# Eval("URL_Hinh_Anh") %>" alt="">
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="fw-bold thongtinsp mt-3 text-uppercase" ><%# Eval("TenSP") %></asp:Label>
                                    </td>
                                    <td class="fw-bold thongtinsp  mt-3"><%# Eval("TenMau") %></td>
                                    <td class="fw-bold thongtinsp mt-3"><%# Eval("Size1") %></td>
                                    <td>
                                        <asp:TextBox ID="txtsoluong" CssClass=" txtsoluong text-center" runat="server" Width="50px" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                                    </td>
                                    
                                  

                                </tr>
                                </div>
           
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
</asp:Content>
