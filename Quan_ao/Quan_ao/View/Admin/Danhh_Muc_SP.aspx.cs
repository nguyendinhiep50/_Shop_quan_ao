using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class Danhh_Muc_SP : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var result = from sp in db.DanhMuc_SP
                             join dm in db.DanhMucs on sp.MaDanhMuc equals dm.MaDanhMuc
                             select new
                             {
                                 sp.MaDMSP,
                                 dm.TenDanhMuc,
                                 sp.TenMuc,
                             };
                GV_DMSP.DataSource = result.ToList();
                GV_DMSP.DataBind();

                // phần thêm
                ddl_danhmuc.DataSource = db.DanhMucs.ToList();
                ddl_danhmuc.DataTextField = "TenDanhMuc";
                ddl_danhmuc.DataValueField = "MaDanhMuc";
                ddl_danhmuc.DataBind();
            }
        }

        protected void GV_DMSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.DanhMuc_SP.Find(int.Parse(e.NewValues["MaDMSP"].ToString()));
            GridViewRow row = GV_DMSP.Rows[e.RowIndex];
            DropDownList ddlTenDM = (DropDownList)row.FindControl("ddlTenDM");
            sp.MaDanhMuc = int.Parse(ddlTenDM.SelectedValue);
            sp.TenMuc = e.NewValues["TenMuc"].ToString();
            db.SaveChanges();
            Response.Redirect("Danhh_Muc_SP.aspx");
        }

        protected void GV_DMSP_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_DMSP.EditIndex = e.NewEditIndex;
            var result = from sp in db.DanhMuc_SP
                         join dm in db.DanhMucs on sp.MaDanhMuc equals dm.MaDanhMuc
                         select new
                         {
                             sp.MaDMSP,
                             dm.TenDanhMuc,
                             sp.TenMuc,
                         };
            var row = GV_DMSP.Rows[e.NewEditIndex];
            var data = (DropDownList)row.FindControl("TenMuc");
            GV_DMSP.DataSource = result.ToList();
            GV_DMSP.DataBind();
            //
            DropDownList ddlTenDM = (DropDownList)GV_DMSP.Rows[e.NewEditIndex].FindControl("ddlTenDM");
            ddlTenDM.DataSource = db.DanhMucs.ToList();
            ddlTenDM.DataTextField = "TenDanhMuc";
            ddlTenDM.DataValueField = "MaDanhMuc";
            ddlTenDM.DataBind();


        }

        protected void GV_DMSP_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string maXoa = "";
            foreach (var item in e.Keys.Values)
            {
                maXoa = item.ToString();
            }
            if (maXoa == "")
            {
                return;
            }
            var sp = db.DanhMuc_SP.Find(int.Parse(maXoa));
            db.DanhMuc_SP.Remove(sp);
            db.SaveChanges();
            //
            Response.Redirect("Danhh_Muc_SP.aspx");
        }

        protected void GV_DMSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect("Danhh_Muc_SP.aspx");
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            DanhMuc_SP db_add = new DanhMuc_SP();
            db_add.TenMuc = txtTenDM.Text;
            db_add.MaDanhMuc = int.Parse(ddl_danhmuc.SelectedValue);
            db.DanhMuc_SP.Add(db_add);
            db.SaveChanges();
            Response.Redirect("Danhh_Muc_SP.aspx");
        }

        protected void GV_DMSP_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    //tim dieu khien DropDownList ddlKhoa tren dòng hiện hành
                    DropDownList ddlTenDM = (DropDownList)e.Row.FindControl("ddlTenDM");
                    //khoi tao du lieu nguon cho ddlKhoa
                    ddlTenDM.DataSource = db.DanhMucs.ToList();
                    ddlTenDM.DataTextField = "TenDanhMuc";
                    ddlTenDM.DataValueField = "MaDanhMuc";
                    ddlTenDM.DataBind();
                    //gan giá trị mặc định được chọn = giá trị mã khoa của sinh viên
                    ddlTenDM.SelectedValue = (e.Row.DataItem).ToString();
                    
                }
            }
        }
    }
}