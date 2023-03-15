using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class TaiKhoan : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GV_TaiKhoan.DataSource = db.TaiKhoans.ToList();
                GV_TaiKhoan.DataBind();
                GV_TaiKhoan.AllowPaging = true;
                GV_TaiKhoan.PageSize = 10;
            }
        }

        protected void GV_TaiKhoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.TaiKhoans.Find(int.Parse(e.NewValues["MaTK"].ToString()));
            sp.MatKhauTk = e.NewValues["MatKhauTk"].ToString();
            sp.PhanCap = bool.Parse(e.NewValues["PhanCap"].ToString());
            sp.SDT =int.Parse(e.NewValues["TenDanhMuc"].ToString());
            sp.Email = e.NewValues["TenDanhMuc"].ToString();
            sp.TenNguoiDung = e.NewValues["TenDanhMuc"].ToString();

            db.SaveChanges();
            Response.Redirect("TaiKhoan.aspx");
        }

        protected void GV_TaiKhoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sp = db.TaiKhoans.Find(int.Parse(e.Values["MaTK"].ToString()));
            db.TaiKhoans.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect("TaiKhoan.aspx");
        }

        protected void GV_TaiKhoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("TaiKhoan.aspx");
        }

        protected void GV_TaiKhoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_TaiKhoan.EditIndex = e.NewEditIndex;
            GV_TaiKhoan.DataSource = db.TaiKhoans.ToList();
            GV_TaiKhoan.DataBind();
        }
    }
}