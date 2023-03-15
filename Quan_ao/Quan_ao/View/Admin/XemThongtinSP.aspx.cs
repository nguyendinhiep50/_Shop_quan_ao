using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class XemThongtinSP : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        private int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
                }

            }
            var result = db.SANPHAMs.Where(x => x.MaSP_ID == id).ToList();
            ListView1.DataSource = result;
            ListView1.DataBind();
        }
    }
}