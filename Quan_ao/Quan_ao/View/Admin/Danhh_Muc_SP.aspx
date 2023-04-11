<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="Danhh_Muc_SP.aspx.cs" Inherits="Quan_ao.View.Admin.Danhh_Muc_SP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .bg-dark{
            margin-bottom:10px;
        }
        .form-group label{
            font-weight:bold;
            color:#A55129;
        }

        div table tbody tr td  input  {
          background:#FFA500;
          border: 2px solid #FFA500;
          color:white;
          text-align:center;
          margin: 0 auto;
          
        }
        div table tbody tr td  input:hover {
             background-color:#A52A2A;
             transition:0.5s;
        }
        .form-group{
             display:flex;
        }
        div #ContentPlaceHolder1_btn_them_sp{
            background: #FFA500;
            border: 2px solid #FFA500;
            color: white;
            text-align: center;
            font-weight:bold;
        }
        div #ContentPlaceHolder1_btn_them_sp:hover{
            background-color:#A52A2A;
            transition:0.5s;
        }
    </style>
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
        <asp:GridView ID="GV_DMSP" DataKeyNames="MaDMSP" runat="server" OnRowCancelingEdit="GV_DMSP_RowCancelingEdit" OnRowDeleting="GV_DMSP_RowDeleting" OnRowEditing="GV_DMSP_RowEditing" OnRowUpdating="GV_DMSP_RowUpdating" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
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
