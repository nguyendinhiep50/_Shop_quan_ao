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
        private static int id = 0;   // lưu trữ id 
        protected void Page_Load(object sender, EventArgs e)
        {
            // lấy id của this truyền vào Hoadon để tìm ra id khách từ đó lấy thông tin
        
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
                    var thongtinkhach = from SPM in db.SanPham_Mua
                                        join HD in db.HoaDons on SPM.MaHoaDon equals HD.MaHoaDon
                                        join TK in db.TaiKhoans on HD.MaTK equals TK.MaTK
                                        where SPM.MaHoaDon == id
                                        select new
                                        {
                                            TK.TenNguoiDung,
                                            TK.SDT,
                                        };
                    lbl_tenkhach.Text = $"Tên người dùng :{thongtinkhach.FirstOrDefault()?.TenNguoiDung}";
                    lbl_SDT.Text = $"Số điện thoại:{thongtinkhach.FirstOrDefault()?.SDT}";
                }

            }
            // lấy tên sản phẩm lấy số lượng ,mã size, mã màu
            if (GV_CTHoaDon.Rows.Count == 0)
            {
                var result = from SP in db.SANPHAMs
                             join SPM in db.SanPham_Mua on SP.MaSP_ID equals SPM.MaSP_ID
                             join CL in db.MAUSACs on SPM.mamau equals CL.MaMau
                             join SZ in db.SIZEs on SPM.masize equals SZ.MaSize
                             where SPM.MaHoaDon == id
                             select new
                             {
                                 SPM.MaSP_Mua,
                                 SP.TenSP,
                                 SPM.SoLuong,
                                 CL.TenMau,
                                 SZ.Size1
                             };
                GV_CTHoaDon.DataSource = result.ToList();
                GV_CTHoaDon.DataBind();
            }

        }

        protected void GV_CTHoaDon_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int MaSP_Mua = Convert.ToInt32( GV_CTHoaDon.DataKeys[e.RowIndex].Values["MaSP_Mua"].ToString());
            if (MaSP_Mua != null)
            {
                var sp = db.SanPham_Mua.Find(MaSP_Mua);
                try
                {
                    db.SanPham_Mua.Remove(sp);
                    db.SaveChanges();
                }
                catch (Exception)
                {
                    lbl_canh_bao.Text = "không thể xoá được do có dữ liệu liên quan";
                    return;
                }
            }
            Response.Redirect($"Xem_CTHoaDon.aspx?ID={id}");

        }

        protected void GV_CTHoaDon_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Response.Redirect($"Xem_CTHoaDon.aspx?ID={id}");
        }

        protected void GV_CTHoaDon_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GV_CTHoaDon.EditIndex = e.NewEditIndex;
            var result = from SP in db.SANPHAMs
                         join SPM in db.SanPham_Mua on SP.MaSP_ID equals SPM.MaSP_ID
                         join CL in db.MAUSACs on SPM.mamau equals CL.MaMau
                         join SZ in db.SIZEs on SPM.masize equals SZ.MaSize
                         where SPM.MaHoaDon == id
                         select new
                         {
                             SPM.MaSP_Mua,
                             SP.TenSP,
                             SPM.SoLuong,
                             CL.TenMau,
                             SZ.Size1
                         };
            GV_CTHoaDon.DataSource = result.ToList();
            GV_CTHoaDon.DataBind();
            // xử lý khi sửa
            DropDownList ddlSize1 = (DropDownList)GV_CTHoaDon.Rows[e.NewEditIndex].FindControl("ddlsize");

            ddlSize1.DataSource = db.SIZEs.ToList();
            ddlSize1.DataTextField = "Size1";
            ddlSize1.DataValueField = "MaSize";
            ddlSize1.DataBind();

            DropDownList ddlTenMau = (DropDownList)GV_CTHoaDon.Rows[e.NewEditIndex].FindControl("ddlTenMau");
            ddlTenMau.DataSource = db.MAUSACs.ToList();
            ddlTenMau.DataTextField = "TenMau";
            ddlTenMau.DataValueField = "MaMau";
            ddlTenMau.DataBind();
        }

        protected void GV_CTHoaDon_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var sp = db.Chi_tiet_SP.Find(int.Parse(e.NewValues["MaSP_Mua"].ToString()));
            GridViewRow row = GV_CTHoaDon.Rows[e.RowIndex];
            DropDownList ddlSize1 = (DropDownList)row.FindControl("ddlSize1");
            DropDownList ddlTenMau = (DropDownList)row.FindControl("ddlTenMau");
            sp.MaSize = int.Parse(ddlSize1.SelectedValue);
            sp.MaMau = int.Parse(ddlTenMau.SelectedValue);
            sp.SoLuong = int.Parse(e.NewValues["SoLuong"].ToString());
            //db.SaveChanges();
            //Response.Redirect(Request.RawUrl);
        }
    }
}