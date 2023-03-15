using Quan_ao.Models;
using Quan_ao.View.Admin;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace Quan_ao.View.User
{
    public partial class Gio_hang : System.Web.UI.Page
    {
        Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.HttpMethod == "POST")
                {
                    int productId = Convert.ToInt32(Request.Form["productId"]);
                    int mamau_web = Convert.ToInt32(Request.Form["maMau"]);
                    int masize_web = Convert.ToInt32(Request.Form["maSize"]);
                    int soluong_web = Convert.ToInt32(Request.Form["soLuong"]);

                    List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
                    if (cartItems != null)
                    {
                        CartItem gio1 = new CartItem();
                        gio1.Ma_SP = productId;
                        gio1.MaMau = mamau_web;
                        gio1.Makichthuoc = masize_web;
                        gio1.So_Luong = soluong_web;
                        // kiểm tra xem có trong giỏ hàng chưa
                        CartItem sanPham = cartItems.Find(sp => sp.Ma_SP == productId);
                        if (sanPham == null)
                        {
                            cartItems.Add(gio1);
                        }
                        else
                            sanPham.So_Luong++;
                    }
                    else
                        Tao_gio(productId, mamau_web, masize_web, soluong_web);
                    Response.Write("Success");
                }
                else
                {
                    List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
                    if (cartItems != null)
                    {
                        GV_gio_hang.DataSource = cartItems.ToList();
                        GV_gio_hang.DataBind();
                    }

                }
            }
        }
        public static void Tao_gio(int gio, int mamau_web, int masize_web, int soluong_web)
        {
            // Lấy danh sách sản phẩm trong giỏ hàng từ session, nếu chưa có thì khởi tạo danh sách mới
            List<CartItem> cart = (List<CartItem>)HttpContext.Current.Session["Cart"];
            if (cart == null)
            { 
                cart = new List<CartItem>();
            }
            CartItem gio1 = new CartItem();
            gio1.Ma_SP = gio;
            gio1.So_Luong = soluong_web;
            gio1.MaMau = mamau_web;
            gio1.Makichthuoc = masize_web;
            cart.Add(gio1);
            // Lưu giỏ hàng vào session
            HttpContext.Current.Session["Cart"] = cart;
        }

        protected void btn_thanhToan_Click(object sender, EventArgs e)
        {
            var ktraTK = Session["USER"];
            int gia_hoadon = 0;
            if (ktraTK !=null)
            {
                Quan_ao.Models.TaiKhoan tk = (Quan_ao.Models.TaiKhoan)ktraTK;
                //xử lý hoá đơn
                db.HoaDons.Add(new Models.HoaDon {
                     
                    TongTien = 0,
                    MaTK = tk.MaTK,
                    DiaChi = "khong thay",
                    NgayDat = DateTime.Today,
                    XacNhan = false
                });
                db.SaveChanges();

                // Lấy ra mã hóa đơn vừa tạo
                var hoadon_lay_ma = db.HoaDons.OrderByDescending(x => x.MaHoaDon).FirstOrDefault();

                // xử lý sản phẩm mua
                List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
                foreach (CartItem item in cartItems)
                {
                    db.SanPham_Mua.Add(new SanPham_Mua
                    {
                        MaSP_ID = item.Ma_SP,
                        MaHoaDon = hoadon_lay_ma.MaHoaDon,
                        SoLuong = item.So_Luong,
                        mamau = item.MaMau,
                        masize = item.Makichthuoc
                    });
                    db.SaveChanges();
                    // tính giá tiền
                    var data = db.SANPHAMs.Find(item.Ma_SP);
                    gia_hoadon += int.Parse(data.Gia.ToString()) * item.So_Luong;
                }
                // xử lý để cập nhật lại Hoá đơn
                var updateHD = db.HoaDons.Find(hoadon_lay_ma.MaHoaDon);
                updateHD.TongTien = gia_hoadon;
                db.SaveChanges();
               
            }
            


        }

      
    }
}