using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Quan_ao.Models;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.User
{
    public partial class TK_khach_hang : System.Web.UI.Page
    {
        private static int id_tk = 0;
        private Shop_quan_ao db = new Shop_quan_ao();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["USER"] != null)
                {
                    id_tk = (Session["USER"] as TaiKhoan).MaTK;
                    var result = db.TaiKhoans.Find(id_tk);
                    txtTenDangNhap.Text = result.TenTK;
                    txtMatKhau.Text = result.MatKhauTk.ToString();
                    txtEMail.Text = result.Email;
                    txt_nguoidung.Text = result.TenNguoiDung;
                    txt_sdt.Text = result.SDT.ToString();

                    var hoadon_old = db.HoaDons.Where(x => x.MaTK == id_tk).ToList();
                    GV_HoaDon.DataSource = hoadon_old.ToList();
                    GV_HoaDon.DataBind();
                }
                else
                {
                    Response.Redirect("../DangNhap.aspx");

                }
            }
        }

        protected void btn_thaydoi_Click(object sender, EventArgs e)
        {
            try
            {
                var tk = db.TaiKhoans.Find(id_tk);
                tk.TenNguoiDung = txt_nguoidung.Text;
                tk.Email = txtEMail.Text;
                tk.MatKhauTk = txtMatKhau.Text;
                tk.SDT = int.Parse(txt_sdt.Text);
                db.SaveChanges();
            }
            catch (Exception)
            {
                return;
                throw;
            }

         
        }

        protected void GV_HoaDon_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "CT_hoadon_khach")
            {
                int ma_hoadon = Convert.ToInt32(e.CommandArgument);
                Response.Redirect($"CT_hoadon_khach.aspx?ID={ma_hoadon}");
            }

        }

        protected void btn_dangxuat_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Response.Redirect("../DangNhap.aspx");

        }
    }
}