using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class Xem_CTHoaDon : System.Web.UI.Page
    {
        Shop_quan_ao db = new Shop_quan_ao();
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
            var result = db.SanPham_Mua.Where(x=>x.MaHoaDon ==id).ToList();
            GV_CTHoaDon.DataSource = result.ToList();
            GV_CTHoaDon.DataBind();
        }

        protected void GV_CTHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GV_CTHoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void GV_CTHoaDon_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}