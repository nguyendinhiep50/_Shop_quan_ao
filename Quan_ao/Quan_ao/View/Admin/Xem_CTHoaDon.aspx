<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="Xem_CTHoaDon.aspx.cs" Inherits="Quan_ao.View.Admin.Xem_CTHoaDon" %>
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
        <asp:Label ID="LBL_thongtin_khach" runat="server" Text="Đây là thông tin khách hàng"></asp:Label>
        <br />
            <div class="form-group">
                <asp:Label ID="lbl_tenkhach" runat="server" Text="Tên khách"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="lbl_SDT" runat="server" Text="Số điện thoại"></asp:Label>
            </div>
            <asp:Label ID="lbl_ghichu" runat="server" Text="Chỉ có thể sửa số lượng,Chọn loại màu và size khác "></asp:Label>
    <br />
    <br />
            <asp:Label ID="lbl_canh_bao" runat="server" Text=""></asp:Label>

        <asp:GridView ID="GV_CTHoaDon" runat="server" OnRowCancelingEdit="GV_CTHoaDon_RowCancelingEdit" OnRowDeleting="GV_CTHoaDon_RowDeleting" OnRowEditing="GV_CTHoaDon_RowEditing" OnRowUpdating="GV_CTHoaDon_RowUpdating" AutoGenerateColumns="False">
        <Columns>
             <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:BoundField DataField="MaSP_Mua" HeaderText="Mã HoaDon" />
                <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                
                <asp:TemplateField HeaderText="Tên màu">
                    <ItemTemplate>
                        <asp:Label ID="lblTenMau" runat="server" Text='<%# Bind("TenMau") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlTenMau" runat="server"></asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên size">
                    <ItemTemplate>
                        <asp:Label ID="lblTensize" runat="server" Text='<%# Bind("Size1") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlsize" runat="server"></asp:DropDownList>
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
