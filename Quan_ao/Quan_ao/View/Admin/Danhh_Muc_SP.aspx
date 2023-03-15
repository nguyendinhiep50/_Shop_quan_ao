<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="Danhh_Muc_SP.aspx.cs" Inherits="Quan_ao.View.Admin.Danhh_Muc_SP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Tên Danh mục sản phẩm</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtTenDM" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Chọn Danh mục</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddl_danhmuc" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2"></label>
            <div class="col-md-4">
                <asp:Button ID="btThem" runat="server" Text="Thêm Mới" CssClass="btn btn-success" OnClick="btThem_Click" />
            </div>
        </div>
    </div>
    <div>
        <asp:GridView ID="GV_DMSP" DataKeyNames="MaDMSP" runat="server" OnRowCancelingEdit="GV_DMSP_RowCancelingEdit" OnRowDeleting="GV_DMSP_RowDeleting" OnRowEditing="GV_DMSP_RowEditing" OnRowUpdating="GV_DMSP_RowUpdating" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="MaDMSP" HeaderText="Mã DM" />
                <asp:TemplateField HeaderText="TenDanhMuc">
                    <ItemTemplate>
                        <asp:Label ID="lbldanhmuc" runat="server" Text='<%# Bind("TenDanhMuc") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTenDM" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="TenMuc" HeaderText="Tên Mục" />
                <asp:CommandField ShowEditButton="true" ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá"
                            OnClientClick="return confirm('Bạn có đồng ý xoá Danh mục sản phẩm này không')"
                            CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
</asp:Content>
