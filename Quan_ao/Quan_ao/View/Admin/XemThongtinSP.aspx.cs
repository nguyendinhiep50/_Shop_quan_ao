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
                    DDL_tenmuc.SelectedValue = (result.FirstOrDefault()?.MaDMSP).ToString();
                }
            }
        }

        protected void LV_thongtin_sp_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int maDM = int.Parse(DDL_tenmuc.SelectedValue);
            bool ktrloi = true;
            int gia =0, danhgia =0,luotmua = 0 ;
            string tensp = "",tinhtrang = "", fileName = "", nhanxet = "";
            // update ở chỗ này
            if (e.CommandName == "Update")
            {
                try
                {
                    ListViewDataItem item = (ListViewDataItem)e.Item;
                    tensp = ((TextBox)item.FindControl("txttensp")).Text;
                    string giasp= ((TextBox)item.FindControl("txtgia")).Text;
                    ktrloi = int.TryParse(giasp, out gia);

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
                    string txtdanhgia = ((TextBox)item.FindControl("txtdanhgia")).Text;
                    ktrloi = int.TryParse(giasp, out danhgia);
                    string txtluotmua = ((TextBox)item.FindControl("txtluotmua")).Text;
                    ktrloi = int.TryParse(giasp, out luotmua);
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
                    sp.Gia = gia;
                    sp.TinhTrang = bool.Parse(tinhtrang);
                    sp.URL_Hinh_Anh = fileName;
                    sp.NhanXet = nhanxet;
                    sp.DanhGia = danhgia;
                    sp.LuotMua = luotmua;
                    db.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void LV_thongtin_sp_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }
    }
}