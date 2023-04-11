<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="XemKhoHang.aspx.cs" Inherits="Quan_ao.View.Admin.XemChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
    <%-- Phần thêm sản phẩm --%>
            <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-2">Chọn kích thước</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddl_size" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Chọn Màu</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddl_mau" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Số lượng</label>
            <div class="col-md-2">
                <asp:TextBox ID="txtsoluong" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-md-2">Chọn Nhà cung cấp</label>
            <div class="col-md-4">
                <asp:DropDownList ID="ddl_nhacc" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label class="control-label col-md-2"></label>
            <div class="col-md-4">
                <asp:Button ID="btn_them_sp" runat="server" Text="Thêm mới" OnClick="btn_them_sp_Click"  />
            </div>
        </div>
    </div>
    <%-- show  --%>
    <asp:GridView  ID="GV_ChiTiet" runat="server" OnRowCancelingEdit="GV_ChiTiet_RowCancelingEdit" OnRowDeleting="GV_ChiTiet_RowDeleting" OnRowEditing="GV_ChiTiet_RowEditing" OnRowUpdating="GV_ChiTiet_RowUpdating" AutoGenerateColumns="False">
        <Columns>
             <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:BoundField DataField="Ma_Size_Color" HeaderText="Mã" />
                <asp:TemplateField HeaderText="Kích thước">
                    <ItemTemplate>
                        <asp:Label ID="lblSize1" runat="server" Text='<%# Bind("Size1") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlSize1" runat="server"></asp:DropDownList>
                    </EditItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên màu">
                    <ItemTemplate>
                        <asp:Label ID="lblTenMau" runat="server" Text='<%# Bind("TenMau") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTenMau" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />

                <asp:TemplateField HeaderText="Tên Nhà cung cấp">
                    <ItemTemplate>
                        <asp:Label ID="lblTenNhaCC" runat="server" Text='<%# Bind("TenNhaCC") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTenNhaCC" runat="server"></asp:DropDownList>
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
