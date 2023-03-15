using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class XemChiTiet : System.Web.UI.Page
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
            var result = from SC in db.Chi_tiet_SP
                         join SZ in db.SIZEs on SC.MaSize equals SZ.MaSize
                         join CL in db.MAUSACs on SC.MaMau equals CL.MaMau
                         where SC.MaSP_ID == id
                         select new
                         {
                             SC.Ma_Size_Color,
                             SZ.Size1,
                             CL.TenMau,
                             SC.SoLuong,
                             SC.MaNCC
                         };
            GV_ChiTiet.DataSource = result.ToList();
            GV_ChiTiet.DataBind();
        }

        protected void GV_ChiTiet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sp = db.Chi_tiet_SP.Find(int.Parse(e.Values["Ma_Size_Color"].ToString()));
            db.Chi_tiet_SP.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect($"XemKhoHang.aspx?ID={id}");
        }

        protected void GV_ChiTiet_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void GV_ChiTiet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_ChiTiet.EditIndex = e.NewEditIndex;
            GV_ChiTiet.DataSource = db.Chi_tiet_SP.ToList();
            GV_ChiTiet.DataBind();
        }

        protected void GV_ChiTiet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect($"XemKhoHang.aspx?ID={id}");
        }
    }
}