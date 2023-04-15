using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Quan_ao.Models;
namespace Quan_ao.View.Admin
{
    public partial class QL_taikhoan1 : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var result = db.TaiKhoans.ToList();
                GV_Tai_Khoan.DataSource = result.ToList();
                GV_Tai_Khoan.DataBind();
            }
        }

        protected void GV_Tai_Khoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sp = db.TaiKhoans.Find(int.Parse(e.Values["MaTK"].ToString()));
            db.TaiKhoans.Remove(sp);
            db.SaveChanges();
            Response.Redirect("QL_taikhoan.aspx");
        }

        protected void GV_Tai_Khoan_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_Tai_Khoan.EditIndex = e.NewEditIndex;
            GV_Tai_Khoan.DataSource = db.TaiKhoans.ToList();
            GV_Tai_Khoan.DataBind();
        }

        protected void GV_Tai_Khoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.TaiKhoans.Find(int.Parse(e.NewValues["MaTK"].ToString()));
            sp.TenTK = e.NewValues["TenTK"].ToString();
            sp.MatKhauTk = e.NewValues["MatKhauTk"].ToString();
            sp.PhanCap = bool.Parse(e.NewValues["PhanCap"].ToString());
            sp.SDT = int.Parse(e.NewValues["SDT"].ToString());
            sp.Email = e.NewValues["Email"].ToString();
            sp.TenNguoiDung = e.NewValues["TenNguoiDung"].ToString();
            db.SaveChanges();
            Response.Redirect("QL_taikhoan.aspx");
        }

        protected void GV_Tai_Khoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("QL_taikhoan.aspx");
        }
    }
}