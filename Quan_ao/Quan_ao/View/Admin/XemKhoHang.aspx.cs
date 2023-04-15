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
        private static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
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
                                     SC.NhaCC.TenNhaCC,
                                 };
                    GV_ChiTiet.DataSource = result.ToList();
                    GV_ChiTiet.DataBind();

                    // phần thêm
                    ddl_size.DataSource = db.SIZEs.ToList();
                    ddl_size.DataTextField = "Size1";
                    ddl_size.DataValueField = "MaSize";
                    ddl_size.DataBind();

                    ddl_mau.DataSource = db.MAUSACs.ToList();
                    ddl_mau.DataTextField = "TenMau";
                    ddl_mau.DataValueField = "MaMau";
                    ddl_mau.DataBind();

                    ddl_nhacc.DataSource = db.NhaCCs.ToList();
                    ddl_nhacc.DataTextField = "TenNhaCC";
                    ddl_nhacc.DataValueField = "MaNhaCC";
                    ddl_nhacc.DataBind();
                }
            }
            if (GV_ChiTiet.Rows.Count == 0)
            {
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
                                 SC.NhaCC.TenNhaCC,
                             };
                GV_ChiTiet.DataSource = result.ToList();
                GV_ChiTiet.DataBind();
            }
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
            var sp = db.Chi_tiet_SP.Find(int.Parse(e.NewValues["Ma_Size_Color"].ToString()));
            GridViewRow row = GV_ChiTiet.Rows[e.RowIndex];
            DropDownList ddlSize1 = (DropDownList)row.FindControl("ddlSize1");
            DropDownList ddlTenMau = (DropDownList)row.FindControl("ddlTenMau");
            sp.MaSize = int.Parse(ddlSize1.SelectedValue);
            sp.MaMau = int.Parse(ddlTenMau.SelectedValue);
            sp.SoLuong = int.Parse(e.NewValues["SoLuong"].ToString());
            DropDownList ddlTenNhaCC = (DropDownList)row.FindControl("ddlTenNhaCC");
            sp.MaNCC = int.Parse(ddlTenNhaCC.SelectedValue);
            db.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }

        protected void GV_ChiTiet_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_ChiTiet.EditIndex = e.NewEditIndex;
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
                             SC.NhaCC.TenNhaCC,
                         };
            GV_ChiTiet.DataSource = result.ToList();
            GV_ChiTiet.DataBind();

            // xử lý khi sửa
            DropDownList ddlSize1 = (DropDownList)GV_ChiTiet.Rows[e.NewEditIndex].FindControl("ddlSize1");

            ddlSize1.DataSource = db.SIZEs.ToList();
            ddlSize1.DataTextField = "Size1";
            ddlSize1.DataValueField = "MaSize";
            ddlSize1.DataBind();

            DropDownList ddlTenMau = (DropDownList)GV_ChiTiet.Rows[e.NewEditIndex].FindControl("ddlTenMau");
            ddlTenMau.DataSource = db.MAUSACs.ToList();
            ddlTenMau.DataTextField = "TenMau";
            ddlTenMau.DataValueField = "MaMau";
            ddlTenMau.DataBind();

            DropDownList ddlTenNhaCC = (DropDownList)GV_ChiTiet.Rows[e.NewEditIndex].FindControl("ddlTenNhaCC");
            ddlTenNhaCC.DataSource = db.NhaCCs.ToList();
            ddlTenNhaCC.DataTextField = "TenNhaCC";
            ddlTenNhaCC.DataValueField = "MaNhaCC";
            ddlTenNhaCC.DataBind();
        }

        protected void GV_ChiTiet_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect($"XemKhoHang.aspx?ID={id}");
        }

        protected void btn_them_sp_Click(object sender, EventArgs e)
        {
            Chi_tiet_SP db_add = new Chi_tiet_SP();
            db_add.MaMau = int.Parse(ddl_mau.SelectedValue.ToString());
            db_add.MaSize = int.Parse(ddl_size.SelectedValue.ToString());
            db_add.MaNCC = int.Parse(ddl_nhacc.SelectedValue.ToString());
            db_add.SoLuong = int.Parse(txtsoluong.Text);
            db_add.MaSP_ID = id;
            db.Chi_tiet_SP.Add(db_add);
            db.SaveChanges();
            Response.Redirect(Request.RawUrl);
        }
    }
}