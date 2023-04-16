using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class HoaDon : System.Web.UI.Page
    {
        Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var result = db.HoaDons.ToList();
                GV_HoaDon.DataSource = result.ToList();
                GV_HoaDon.DataBind();
            }
        }

        protected void GV_HoaDon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            bool ktra_dulieu = false;
            var sp = db.HoaDons.Find(int.Parse(e.NewValues["MaHoaDon"].ToString()));
            sp.XacNhan = Boolean.Parse(e.NewValues["XacNhan"].ToString());
            sp.DiaChi = e.NewValues["DiaChi"].ToString();
            int MaTK = -1;
            ktra_dulieu = int.TryParse(e.NewValues["MaTK"].ToString(),out MaTK);
            if (MaTK ==-1 || ktra_dulieu == false)
            {

            }
            else
            {
                db.SaveChanges();
                Response.Redirect("HoaDon_admin.aspx");
            }
          
        }

        protected void GV_HoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // xoá toàn bộ hàng trong giỏ hàng
            int MaHoaDon = int.Parse(e.Values["MaHoaDon"].ToString());
            // xoá trong gio hoá đơn trước
            var sp_giohang = db.SanPham_Mua.Where(hd => hd.MaHoaDon == MaHoaDon);
            db.SanPham_Mua.RemoveRange(sp_giohang);
            db.SaveChanges();
            var sp = db.HoaDons.Find(MaHoaDon);
            db.HoaDons.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect("HoaDon_admin.aspx");
        }

        protected void GV_HoaDon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_HoaDon.EditIndex = e.NewEditIndex;
            GV_HoaDon.DataSource = db.HoaDons.ToList();
            GV_HoaDon.DataBind();
        }

        protected void GV_HoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("HoaDon_admin.aspx");
        }

        protected void btn_Check_Click(object sender, EventArgs e)
        {
            var result = db.HoaDons.Where(x => x.XacNhan == true).ToList(); ;
            GV_HoaDon.DataSource = result.ToList();
            GV_HoaDon.DataBind();
        }

        protected void btn_NoCheck_Click(object sender, EventArgs e)
        {
            var result = db.HoaDons.Where(x => x.XacNhan == false).ToList(); ;
            GV_HoaDon.DataSource = result.ToList();
            GV_HoaDon.DataBind();
        }

        protected void btn_All_Click(object sender, EventArgs e)
        {
            var result = db.HoaDons.ToList();
            GV_HoaDon.DataSource = result.ToList();
            GV_HoaDon.DataBind();
        }

        protected void GV_HoaDon_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Xem_CTHoaDon")
            {
                int ma_hoadon = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"Xem_CTHoaDon.aspx?ID={ma_hoadon}");
            }
           
        }
    }
}