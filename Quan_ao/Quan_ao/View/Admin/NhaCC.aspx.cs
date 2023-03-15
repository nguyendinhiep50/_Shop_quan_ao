using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class NhaCC : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GV_NhaCC.DataSource = db.NhaCCs.ToList();
                GV_NhaCC.DataBind();
                GV_NhaCC.AllowPaging = true;
                GV_NhaCC.PageSize = 10;
            }
        }

        protected void GV_NhaCC_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.NhaCCs.Find(int.Parse(e.NewValues["MaNhaCC"].ToString()));
            sp.TenNhaCC = e.NewValues["TenNhaCC"].ToString();
            db.SaveChanges();
            Response.Redirect("NhaCC.aspx");
        }

        protected void GV_NhaCC_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_NhaCC.EditIndex = e.NewEditIndex;
            GV_NhaCC.DataSource = db.NhaCCs.ToList();
            GV_NhaCC.DataBind();
        }

        protected void GV_NhaCC_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sp = db.NhaCCs.Find(int.Parse(e.Values["MaNhaCC"].ToString()));
            db.NhaCCs.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect("NhaCC.aspx");
        }

        protected void GV_NhaCC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("NhaCC.aspx");

        }
    }
}