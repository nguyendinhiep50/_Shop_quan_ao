using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class SanPham : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var result = from sp in db.SANPHAMs
                             join dm in db.DanhMuc_SP on sp.MaDMSP equals dm.MaDMSP
                             select new
                             {
                                 sp.MaSP_ID,
                                 dm.TenMuc,
                                 sp.TenSP,
                                 sp.Gia,
                                 sp.URL_Hinh_Anh,
                                 sp.LuotMua,
                             };
                GV_SanPham.DataSource = result.ToList();
                GV_SanPham.DataBind(); 
            }
        }

        protected void GV_SanPham_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var sp = db.SANPHAMs.Find(int.Parse(e.Values["MaSP_ID"].ToString()));
            db.SANPHAMs.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect("SanPham.aspx");
        }

        protected void GV_SanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.SANPHAMs.Find(int.Parse(e.NewValues["MaSP_ID"].ToString()));
            sp.MaDMSP = int.Parse(e.NewValues["MaDMSP"].ToString());
            sp.TenSP = (e.NewValues["TenSP"].ToString());
            sp.Gia = int.Parse(e.NewValues["Gia"].ToString());
            sp.TinhTrang = bool.Parse(e.NewValues["TinhTrang"].ToString());
            sp.URL_Hinh_Anh = (e.NewValues["URL_Hinh_Anh"].ToString());
            sp.NhanXet = e.NewValues["NhanXet"].ToString();
            sp.DanhGia = int.Parse(e.NewValues["DanhGia"].ToString());
            sp.LuotMua = int.Parse(e.NewValues["LuotMua"].ToString());
            db.SaveChanges();
            Response.Redirect("SanPham.aspx");
        }

        protected void GV_SanPham_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_SanPham.EditIndex = e.NewEditIndex;
            var result = from sp in db.SANPHAMs
                         join dm in db.DanhMuc_SP on sp.MaDMSP equals dm.MaDMSP
                         select new
                         {
                             sp.MaSP_ID,
                             dm.TenMuc,
                             sp.TenSP,
                             sp.Gia,
                             sp.TinhTrang,
                             sp.URL_Hinh_Anh,
                             sp.LuotMua,
                         };
            var row = GV_SanPham.Rows[e.NewEditIndex];
            var data = (DropDownList)row.FindControl("TenMuc");
            GV_SanPham.DataSource = result.ToList();
            GV_SanPham.DataBind();

            GridViewRow row1 = GV_SanPham.Rows[e.NewEditIndex];
            DropDownList ddlTenDM = (DropDownList)row1.FindControl("ddlTenDM");
            ddlTenDM.DataSource = db.DanhMucs.ToList();
            ddlTenDM.DataTextField = "TenDanhMuc";
            ddlTenDM.DataValueField = "MaDanhMuc";
            ddlTenDM.DataBind();
        }

        protected void GV_SanPham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("SanPham.aspx");
        }

        protected void GV_SanPham_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "XemThongtinSP")
            {
                int maSP = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"XemThongtinSP.aspx?ID={maSP}");
            }
            if (e.CommandName == "XemKhoHang")
            {
                int maSP = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"XemKhoHang.aspx?ID={maSP}");
            }
        }
    }
}