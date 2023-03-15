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
            TaiKhoan tk = (TaiKhoan)Session["USER"];
            if (tk!=null)
                if (tk.PhanCap == false)
                    lbltenkhach.Text = "Tên đăng nhập:" + tk.TenNguoiDung;          
        }
    }
}