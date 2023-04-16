using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class DanhMuc : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GV_Danh_Muc.DataSource = db.DanhMucs.ToList();
                GV_Danh_Muc.DataBind();
                GV_Danh_Muc.AllowPaging = true;
                GV_Danh_Muc.PageSize = 10;
            }
        }
        protected void GV_Danh_Muc_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_Danh_Muc.EditIndex = e.NewEditIndex;
            GV_Danh_Muc.DataSource = db.DanhMucs.ToList();
            GV_Danh_Muc.DataBind();
        }
        protected void GV_Danh_Muc_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.DanhMucs.Find(int.Parse(e.NewValues["MaDanhMuc"].ToString()));
            sp.TenDanhMuc = e.NewValues["TenDanhMuc"].ToString();
            db.SaveChanges();
            Response.Redirect("DanhMuc.aspx");
        }

        protected void GV_Danh_Muc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("DanhMuc.aspx");
        }


    }
}