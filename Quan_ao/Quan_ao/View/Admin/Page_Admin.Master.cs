using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class Page_Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ADMIN"] == null)
            {
                Response.Redirect("../DangNhap.aspx");
            }
          
        }

        protected void btn_dangxuat_Click(object sender, EventArgs e)
        {
            if (Session["ADMIN"] != null)
            {
                Session.Remove("ADMIN");
                Response.Redirect("../DangNhap.aspx");
            }
        }
    }
}