<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Gio_hang.aspx.cs" Inherits="Quan_ao.View.User.Gio_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="cart">
        <div class="container">
            <div class="cart_top_center">
                <div class="cart_top">
                    <div class="cart_top_cart cart_top_item">
                        <i class="fa fa-cart-arrow-down cart_top_item " aria-hidden="true"></i>
                    </div>
                    <div class="cart_top_cart ">
                        <i class="fa fa-map-marker cart_top_item " aria-hidden="true"></i>
                    </div>
                    <div class="cart_top_cart">
                        <i class="fa fa-credit-card cart_top_item" aria-hidden="true"></i>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="cart_content">
                <div class="cart_content_left">
                    <table class="container">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Tên sản phẩm </th>
                            <th>Màu</th>
                            <th>Size</th>
                            <th>Số Lượng</th>
                            <th>Thành tiền</th>
                            <th>Sửa</th>
                        </tr>

                        <%-- phần thay đổi --%>
                        <asp:Repeater ID="rptProducts" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <img src="../../Content/IMG/<%# Eval("Hinh_sp") %>" alt=""></td>
                                    <td>
                                        <p><%# Eval("tensp") %></p>
                                    </td>
                                    <td><%# Eval("tenmau") %></td>
                                    <td><%# Eval("TenSize") %></td>
                                    <td>
                                        <asp:TextBox ID="txtsoluong" runat="server" Text='<%# Eval("So_Luong") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <p><%# Eval("Gia_Tong_SP") %><sub>vnđ</sub></p>
                                    </td>
                                    <td>
                                        <asp:Button ID="btn_xoa" CommandArgument='<%# Eval("Ma_SP") %>' runat="server" Text="Xoá" OnClick="btn_xoa_Click" />
                                        <asp:Button ID="btn_capnhat" CommandArgument='<%# Eval("Ma_SP") %>' runat="server" OnClick="btn_capnhat_Click" Text="Edit" />
                                    </td>

                                </tr>
                                </div>
           
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="cart_content_right">
                    <table>
                        <%--phần thay đổi--%>
                        <tr>
                            <th colspan="2">TỔNG TIỀN GIỎ HÀNG</th>
                        </tr>
                        <tr>
                            <td>Tổng sản phẩm</td>
                            <td>
                                <p>
                                    <asp:Label ID="lbl_tongsp" runat="server" Text="0"></asp:Label>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td>Tổng tiền hàng</td>

                            <td>
                                <p>
                                    <asp:Label ID="lbl_thanhtien" runat="server" Text="0"></asp:Label>
                                    <sub>vnđ</sub></p>
                            </td>
                        </tr>

                    </table>
                    <div class="cart_content_right_text">
                        <p style="color: red;"><i class="fa fa-exclamation " aria-hidden="true"></i>Miễn đổi trả đối với sản phẩm đồng giá / sale trên 50%</p>
                        <p style="color: red;"><i class="fa fa-exclamation" aria-hidden="true"></i>Miễn phí ship đơn hàng có tổng gía trị trên 2.000.000đ</p>
                        <p style="color: red;"><i class="fa fa-exclamation" aria-hidden="true"></i>Mua thêm 1.301.000đ để được miễn phí SHIP</p>
                    </div>
                    <div class="cart_content_right_button">
                        <button type="button" class="dathang">Đặt Hàng</button>
                        <asp:Button ID="btn_thanhToan" runat="server" Text="Thanh Toán" OnClick="btn_thanhToan_Click" />

                    </div>
                    <div class="cart_content_right_login">
                        <p>Tài khoản IVYMODA</p>
                        <p>Hãy <a href="../DangNhap.aspx">Đăng nhập</a> tài khoản của bạn để tích điểm thành viên.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:GridView ID="GV_gio_hang" runat="server">
        <Columns>
        </Columns>
    </asp:GridView>

</asp:Content>
