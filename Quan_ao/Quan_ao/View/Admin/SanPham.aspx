<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="Quan_ao.View.Admin.SanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Chọn Danh mục</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddl_danhmuc" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Tên sản phẩm</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtTensp" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Giá</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtgia" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2">hình ảnh</label>
            <div class="col-md-2">
                <asp:FileUpload ID="FU_IMG" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Nhận xét</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtnhanxet" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Đánh giá</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtdanhgia" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2"></label>
            <div class="col-md-4">
                <asp:Button ID="btn_them_sp" runat="server" Text="Thêm mới" OnClick="btn_them_sp_Click" />
            </div>
        </div>
    </div>
    <div>
        <asp:GridView ID="GV_SanPham" DataKeyNames="MaSP_ID" runat="server" OnRowDeleting="GV_SanPham_RowDeleting"  OnRowCommand="GV_SanPham_RowCommand" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="GV_SanPham_PageIndexChanging">
            <Columns>
                 <asp:BoundField DataField="MaSP_ID" HeaderText="Mã Sản phẩm" />
                  <asp:TemplateField HeaderText="TenDanhMuc">
                        <ItemTemplate>
                            <asp:Label ID="lbldanhmuc" runat="server" Text='<%# Bind("TenMuc") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlTenDM" runat="server"></asp:DropDownList>
                        </EditItemTemplate>
                    </asp:TemplateField>
                 <asp:BoundField DataField="TenSP" HeaderText="Tên SP" />
                 <asp:BoundField DataField="Gia" HeaderText="Giá SP" />
                 <asp:TemplateField HeaderText="HinhAnh">
                        <ItemTemplate>
                            <asp:Image ID="IMG_sp" Width:50px runat="server" ImageUrl='<%# ResolveUrl("~/Content/IMG/hinh_san_pham/" + Eval("URL_Hinh_Anh")) %>' />
                        </ItemTemplate>
                        <EditItemTemplate>
        <asp:FileUpload ID="File_taihinh" runat="server" />
                        </EditItemTemplate>
                  </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tác vụ">
                        <ItemTemplate>
                            <asp:Button ID="btXoas" runat="server" Text="xoá" 
                                OnClientClick="return confirm('Bạn có đồng ý xoá sản phẩm này không')" 
                                CommandName="Delete" />
                        </ItemTemplate>
                        <EditItemTemplate>

                        </EditItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="Thông tin SP">
                        <ItemTemplate>
                            <asp:Button ID="btn_xem_TT" runat="server" Text="Thông tin" CommandName="XemThongtinSP" CommandArgument='<%# Eval("MaSP_ID") %>' />  </ItemTemplate>
                        <EditItemTemplate></EditItemTemplate>
                    </asp:TemplateField>
                 <asp:TemplateField HeaderText="Xem kho hàng">
                        <ItemTemplate>
                            <asp:Button ID="btn_xem_KH" runat="server" Text="Kho hàng" CommandName="XemKhoHang" CommandArgument='<%# Eval("MaSP_ID") %>' />  </ItemTemplate>
                        <EditItemTemplate></EditItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
