using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.User
{
    public partial class Page_User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                link_dangnhap_xuat.Text ="Tài Khoản : "+ (Session["USER"] as TaiKhoan).TenNguoiDung ;
            }
            else
            {
                link_dangnhap_xuat.Text = "Đăng nhập";
            }
        }

        protected void link_dangnhap_xuat_Click(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
                Response.Redirect("TK_khach_hang.aspx");
            else
                Response.Redirect("../DangNhap.aspx");

         }
    }
}