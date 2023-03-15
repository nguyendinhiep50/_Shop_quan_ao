<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/Page_Admin.Master" AutoEventWireup="true" CodeBehind="HoaDon_admin.aspx.cs" Inherits="Quan_ao.View.Admin.HoaDon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btn_Check" runat="server" Text="Hoá đơn đã xác nhận" OnClick="btn_Check_Click" />
    <asp:Button ID="btn_NoCheck" runat="server" Text="Hoá đơn chưa xác nhận" OnClick="btn_NoCheck_Click" />
    <asp:Button ID="btn_All" runat="server" Text="Tất cả" OnClick="btn_All_Click" />


     <asp:GridView ID="GV_HoaDon" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GV_HoaDon_RowCancelingEdit" OnRowDeleting="GV_HoaDon_RowDeleting" OnRowEditing="GV_HoaDon_RowEditing" OnRowUpdating="GV_HoaDon_RowUpdating" OnRowCommand="GV_HoaDon_RowCommand">
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
    </asp:GridView>
</asp:Content>
