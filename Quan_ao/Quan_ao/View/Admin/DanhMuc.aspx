<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="DanhMuc.aspx.cs" Inherits="Quan_ao.View.Admin.DanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Label ID="lbl_canhbao" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GV_Danh_Muc" runat="server" OnRowEditing="GV_Danh_Muc_RowEditing" OnRowUpdating="GV_Danh_Muc_RowUpdating" OnRowCancelingEdit="GV_Danh_Muc_RowCancelingEdit"  BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
        <Columns>
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
               
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
