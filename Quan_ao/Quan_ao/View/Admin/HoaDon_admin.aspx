<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="HoaDon_admin.aspx.cs" Inherits="Quan_ao.View.Admin.HoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #ContentPlaceHolder1_btn_them_sp{
            background-color:#A52A2A;
            color:white;
            border: 2px solid #A52A2A;

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
         div #ContentPlaceHolder1_btn_Check,
         #ContentPlaceHolder1_btn_NoCheck,
         #ContentPlaceHolder1_btn_All{
             background-color:#A52A2A;
             color:white;
             margin-bottom:20px;
             margin-left:20px;
             margin-right:20px;
             border: 2px solid #A52A2A;
         }
         div #ContentPlaceHolder1_btn_Check:hover,
         #ContentPlaceHolder1_btn_NoCheck:hover,
         #ContentPlaceHolder1_btn_All:hover{
             background:#FFA500;
             border: 1px solid #FFA500;
             transition:0.5s;
         }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btn_Check" runat="server" Text="Hoá đơn đã xác nhận" OnClick="btn_Check_Click" />
    <asp:Button ID="btn_NoCheck" runat="server" Text="Hoá đơn chưa xác nhận" OnClick="btn_NoCheck_Click" />
    <asp:Button ID="btn_All" runat="server" Text="Tất cả" OnClick="btn_All_Click" />


     <asp:GridView ID="GV_HoaDon" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_HoaDon_RowCancelingEdit" OnRowDeleting="GV_HoaDon_RowDeleting" OnRowEditing="GV_HoaDon_RowEditing" OnRowUpdating="GV_HoaDon_RowUpdating" OnRowCommand="GV_HoaDon_RowCommand" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="MaHoaDon" HeaderText="Mã hoá đon" />
            <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" />
            <asp:BoundField DataField="MaTK" HeaderText="Mã tài khoản" />
            <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" />
            <asp:BoundField DataField="NgayDat" HeaderText="ngày đặt" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:CheckBoxField DataField="XacNhan" HeaderText="Xác nhận" />
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá" 
                            OnClientClick="return confirm('Bạn có đồng ý xoá hoá đơn này không')" 
                            CommandName="Delete" />
                    </ItemTemplate>
                    <EditItemTemplate></EditItemTemplate>
                </asp:TemplateField>
             <asp:TemplateField HeaderText="Thông tin hoá đơn">
                    <ItemTemplate>
                        <asp:Button ID="btn_CTHoadon" runat="server" Text="Chi tiết hoá đơn" CommandName="Xem_CTHoaDon" CommandArgument='<%# Eval("MaHoaDon") %>' />  </ItemTemplate>
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
