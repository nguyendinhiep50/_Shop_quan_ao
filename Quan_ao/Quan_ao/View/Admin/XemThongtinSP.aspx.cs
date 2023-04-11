using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.Admin
{
    public partial class XemThongtinSP : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        private static int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
                    var result = db.SANPHAMs.Where(x => x.MaSP_ID == id).ToList();
                    LV_thongtin_sp.DataSource = result;
                    LV_thongtin_sp.DataBind();

                    DDL_tenmuc.DataSource = db.DanhMuc_SP.ToList();
                    DDL_tenmuc.DataTextField = "TenMuc";
                    DDL_tenmuc.DataValueField = "MaDMSP";
                    DDL_tenmuc.DataBind();
                }

            }
        }

        protected void LV_thongtin_sp_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int maDM = int.Parse(DDL_tenmuc.SelectedValue);
            bool ktrloi = true;
            string tensp = "", gia = "", tinhtrang = "", fileName = "", nhanxet = "", danhgia = "", luotmua = "";
            // update ở chỗ này
            if (e.CommandName == "Update")
            {
                try
                {
                    ListViewDataItem item = (ListViewDataItem)e.Item;
                    tensp = ((TextBox)item.FindControl("txttensp")).Text;
                    gia = ((TextBox)item.FindControl("txtgia")).Text;
                    tinhtrang = ((TextBox)item.FindControl("txttinhtrang")).Text;
                    FileUpload FU_hinhanh = (FileUpload)e.Item.FindControl("FU_hinhanh");
                    fileName = FU_hinhanh.FileName;
                    if (FU_hinhanh.HasFile)
                    {
                        // Tạo đường dẫn để lưu file trên server
                        string filePath = Server.MapPath("~/Content/IMG/hinh_san_pham/") + FU_hinhanh.FileName;

                        // Lưu file trên server
                        FU_hinhanh.SaveAs(filePath);
                    }
                    if (fileName == "")
                    {
                        fileName = ((Label)item.FindControl("lbl_link_sp")).Text;
                    }
                    nhanxet = ((TextBox)item.FindControl("txtnhanxet")).Text;
                    danhgia = ((TextBox)item.FindControl("txtdanhgia")).Text;
                    luotmua = ((TextBox)item.FindControl("txtluotmua")).Text;
                }
                catch (Exception)
                {
                    ktrloi = false;
                }

                if (ktrloi != false)
                {
                    var sp = db.SANPHAMs.Find(id);
                    sp.MaDMSP = maDM;
                    sp.TenSP = tensp.ToString();
                    sp.Gia = int.Parse(gia);
                    sp.TinhTrang = bool.Parse(tinhtrang);
                    sp.URL_Hinh_Anh = fileName;
                    sp.NhanXet = nhanxet;
                    sp.DanhGia = int.Parse(danhgia);
                    sp.LuotMua = int.Parse(luotmua);
                    db.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void LV_thongtin_sp_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }


        //protected void LV_thongtin_sp_ItemEditing(object sender, ListViewEditEventArgs e)
        //{
        //    LV_thongtin_sp.EditIndex = e.NewEditIndex;
        //    LV_thongtin_sp.DataBind();

        //    TextBox txttensp = (TextBox)LV_thongtin_sp.EditItem.FindControl("txttensp");
        //    string tenSP = txttensp.Text;
        //}
    }
}