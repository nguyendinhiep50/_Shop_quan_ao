<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="NhaCC.aspx.cs" Inherits="Quan_ao.View.Admin.NhaCC" %>
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
    <asp:GridView ID="GV_NhaCC" runat="server" OnRowCancelingEdit="GV_NhaCC_RowCancelingEdit" OnRowDeleting="GV_NhaCC_RowDeleting" OnRowEditing="GV_NhaCC_RowEditing" OnRowUpdating="GV_NhaCC_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="true"  ButtonType="button" EditText="Sửa" UpdateText="Cập nhật" />
                <asp:TemplateField HeaderText="Tác vụ">
                    <ItemTemplate>
                        <asp:Button ID="btXoas" runat="server" Text="xoá" 
                            OnClientClick="return confirm('Bạn có đồng ý xoá nhà cung cấp này không')" 
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
