<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Quan_ao.View.DangNhap" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 50%; margin: 0 auto; margin-top: 100px">
            <div class="panel panel-info">
                <div class="panel-heading"><b>ĐĂNG NHẬP HỆ THỐNG </b></div>
                <div class="panel-body">
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
                                    TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button ID="btDangNhap" runat="server" Text="Đăng nhập"
                                    CssClass="btn btn-success" OnClick="btDangNhap_Click" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Label ID="lbThongBao" runat="server" Text=""
                                    ForeColor="#cc3300"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
