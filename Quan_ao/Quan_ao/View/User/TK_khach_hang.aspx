<%@ Page Title="" Language="C#" MasterPageFile="~/View/User/Page_User.Master" AutoEventWireup="true" CodeBehind="TK_khach_hang.aspx.cs" Inherits="Quan_ao.View.User.TK_khach_hang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
              <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="email">
                                Tên đăng nhập:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtTenDangNhap" runat="server"
                                    CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                Mật khẩu:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtMatKhau" runat="server"
                                    CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                SĐT:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_sdt" runat="server"
                                    CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                        </div>
                                          <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                EMAIL:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txtEMail" runat="server"
                                    CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                        </div>
                                          <div class="form-group">
                            <label class="control-label col-sm-3" for="pwd">
                                Tên người dùng:</label>
                            <div class="col-sm-9">
                                <asp:TextBox ID="txt_nguoidung" runat="server"
                                    CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button ID="btn_thaydoi" runat="server" Text="Thay đổi thông tin"
                                    CssClass="btn btn-success" OnClick="btn_thaydoi_Click"  />
                                <br />
                                Vui lòng đăng xuất nếu bạn vừa thay đổi thông tin để chúng tôi có thể cập nhật kịp thời
                                <br />

                                  <asp:Button ID="btn_dangxuat" runat="server" Text="Đăng xuất"
                                    CssClass="btn btn-success" OnClick="btn_dangxuat_Click"   />
                            </div>
                        </div>
                      
                    </div>
                </br>
              <asp:GridView ID="GV_HoaDon" runat="server" AutoGenerateColumns="False"  OnRowCommand="GV_HoaDon_RowCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="MaHoaDon" HeaderText="Mã hoá đon" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
            <asp:BoundField DataField="MaTK" HeaderText="Mã tài khoản" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="NgayDat" HeaderText="ngày đặt" DataFormatString="{0:dd/MM/yyyy}" />
           
             <asp:TemplateField HeaderText="Thông tin hoá đơn">
                    <ItemTemplate>
                        <asp:Button ID="btn_CTHoadon" runat="server" Text="Xem hoá đơn" CommandName="CT_hoadon_khach" CommandArgument='<%# Eval("MaHoaDon") %>' />  </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
        </Columns>
         <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
         <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
         <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
         <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
         <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
         <SortedAscendingCellStyle BackColor="#FFF1D4" />
         <SortedAscendingHeaderStyle BackColor="#B95C30" />
         <SortedDescendingCellStyle BackColor="#F1E5CE" />
         <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
</asp:Content>
