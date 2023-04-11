  <%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="Gio_hang.aspx.cs" Inherits="Quan_ao.View.User.Gio_hang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section class="cart">
        <div class="container">
            <%--<div class="cart_top_center">
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
            </div>--%>
        </div>
        <br>
        <br>
        <br>
        <div class="container">
            <div class="cart_content row">
                <div class="cart_content_left col-8">
                    <table class="container">
                        <tr class="text-center">
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
                                <tr class="text-center align-content-center">
                                    <td>
                                        <img class="border img-thumbnail mt-3" src="../../Content/IMG/hinh_san_pham/product_5.png" alt="">
                                    </td>
                                    <td>
                                        <asp:Label runat="server" CssClass="fw-bold thongtinsp mt-3 text-uppercase" ><%# Eval("tensp") %></asp:Label>
                                    </td>
                                    <td class="fw-bold thongtinsp  mt-3"><%# Eval("tenmau") %></td>
                                    <td class="fw-bold thongtinsp mt-3"><%# Eval("TenSize") %></td>
                                    <td>
                                        <asp:TextBox ID="txtsoluong" CssClass=" txtsoluong text-center" runat="server" Width="50px" Text='<%# Eval("So_Luong") %>'></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" class="fw-bold mt-3 thongtinsp text-black"><%# Eval("Gia_Tong_SP") %>vnđ</asp:Label>
                                    </td>
                                    <td>
                                        <asp:Button ID="btn_xoa" CssClass="btn btn-danger" CommandArgument='<%# Eval("Ma_SP") %>' runat="server" Text="Xoá" OnClick="btn_xoa_Click" />
                                        <asp:Button ID="btn_capnhat" CssClass="btn btn-success" CommandArgument='<%# Eval("Ma_SP") %>' runat="server" OnClick="btn_capnhat_Click" Text="Edit" />
                                    </td>

                                </tr>
                                </div>
           
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="cart_content_right col-4">
                    <table>
                        <%--phần thay đổi--%>
                        <tr>
                            <th colspan="2">TỔNG TIỀN GIỎ HÀNG</th>
                        </tr>
                        <tr>
                            <td class="fw-bold py-3 ">Tổng sản phẩm</td>
                            <td> 
                                    <asp:Label ID="lbl_tongsp" CssClass="ps-3 fw-bold" runat="server" Text="0"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="fw-bold">Tổng tiền hàng</td>

                        <td>
                                <asp:Label ID="lbl_thanhtien" runat="server" CssClass="ps-3 fw-bold" Text="0"></asp:Label><sub class="fw-bold">vnđ</sub>
                        </tr>

                    </table>
                    <div class="cart_content_right_text mt-3">
                        <p style="color: red;"><i class="fa fa-exclamation me-3" aria-hidden="true"></i>Miễn đổi trả đối với sản phẩm đồng giá / sale trên 50%</p>
                        <p style="color: red;"><i class="fa fa-exclamation me-3" aria-hidden="true"></i>Miễn phí ship đơn hàng có tổng gía trị trên 2.000.000đ</p>
                        <p style="color: red;"><i class="fa fa-exclamation me-3" aria-hidden="true"></i>Mua thêm 1.301.000đ để được miễn phí SHIP</p>
                    </div>
                    <div class="cart_content_right_button text-center mb-3">
                      <asp:Button runat="server" ID="btndathang" Text="Đặt hàng" CssClass="btn btn-success" />
                       <asp:Button ID="btn_thanhToan" runat="server" Text="Thanh Toán" CssClass="btn btn-success" OnClick="btn_thanhToan_Click" />

                    </div>
                    <div class="cart_content_right_login">
                        <p class="fw-bold text-black">Tài khoản IVYMODA</p>
                        <p  class="fw-bold text-black">Hãy <a class="btn btn-outline-success" href="../DangNhap.aspx">Đăng nhập</a> tài khoản của bạn để tích điểm thành viên.</p>
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
