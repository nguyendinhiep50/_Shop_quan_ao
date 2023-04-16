using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Quan_ao.Models;
namespace Quan_ao.View.User
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Shop_quan_ao db = new Shop_quan_ao();
        public static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
                }
                Nap_du_lieu_Mausac();
                Nap_du_lieu_size();
                for (int i = 1; i <= 5; i++)
                {
                    ListItem item = new ListItem(i.ToString(), i.ToString());
                    DDL_Soluong.Items.Add(item);
                }
                var sanpham = db.SANPHAMs.Find(id);
                img_hinh_anh.ImageUrl = "../../Content/IMG/hinh_san_pham/" + sanpham.URL_Hinh_Anh;
                lbl_tensp.Text = sanpham.TenSP;
                lbl_giasp.Text = sanpham.Gia.ToString();
            }
        }
        private void Nap_du_lieu_Mausac()
        {
            // thiết lập dữ liệu từng loại cho sản phẩm lấy ra từ kho hàng
            var Data_mausac = (from SP in db.SANPHAMs
                               join CT in db.Chi_tiet_SP on SP.MaSP_ID equals CT.MaSP_ID
                               join SZ in db.SIZEs on CT.MaSize equals SZ.MaSize
                               join CL in db.MAUSACs on CT.MaMau equals CL.MaMau
                               where SP.MaSP_ID == id
                               select new
                               {
                                   SP.TenSP,
                                   SZ.Size1,
                                   SZ.MaSize,
                                   CL.TenMau,
                                   CL.MaMau,
                                   CT.SoLuong
                               })
                               .GroupBy(x => new { x.TenMau, x.MaMau })  // group by để nó không lấy ra dữ liệu bị trùng
                               .Select(g => g.FirstOrDefault());  // lấy ra giá trị đầu tiên
            DDL_mau_sac.DataSource = Data_mausac.ToList();
            DDL_mau_sac.DataTextField = "TenMau"; // Thiết lập để hiển thị tên màu
            DDL_mau_sac.DataValueField = "MaMau"; // Thiết lập để lưu trữ mã màu
            DDL_mau_sac.DataBind();

        }
        private void Nap_du_lieu_size()
        {
            var Data_size = (from SP in db.SANPHAMs
                             join CT in db.Chi_tiet_SP on SP.MaSP_ID equals CT.MaSP_ID
                             join SZ in db.SIZEs on CT.MaSize equals SZ.MaSize
                             join CL in db.MAUSACs on CT.MaMau equals CL.MaMau
                             where SP.MaSP_ID == id
                             select new
                             {
                                 SP.TenSP,
                                 SZ.Size1,
                                 SZ.MaSize,
                                 CL.TenMau,
                                 CL.MaMau,
                                 CT.SoLuong
                             })
                   .GroupBy(x => new { x.TenMau, x.MaMau })
                   .Select(g => g.FirstOrDefault());
            DDL_Size.DataSource = Data_size.ToList();
            DDL_Size.DataTextField = "Size1";
            DDL_Size.DataValueField = "MaSize";
            DDL_Size.DataBind();
        }
        private CartItem add_sp()
        {
            CartItem gio1 = new CartItem();
            gio1.Ma_SP = id;
            gio1.So_Luong = int.Parse(DDL_Soluong.SelectedValue);
            gio1.MaMau = int.Parse(DDL_mau_sac.SelectedValue);
            gio1.Makichthuoc = int.Parse(DDL_Size.SelectedValue);
            gio1.Gia_Tong_SP = 0;
            return gio1;
        }
        protected void btn_them_gio_Click(object sender, EventArgs e)
        {
            // kiểm tra xem có giỏ hay chưa
            List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
            if (cartItems != null)
            {
                CartItem sanPham = cartItems.Find(sp => sp.Ma_SP == id && sp.Makichthuoc == int.Parse(DDL_Size.SelectedValue) && sp.MaMau == int.Parse(DDL_mau_sac.SelectedValue));
                // tìm trong giỏ có sản phẩm không
                if (sanPham == null)
                {
                    cartItems.Add(add_sp());
                    HttpContext.Current.Session["Cart"] = cartItems;
                    Response.Write("<script> alert('da them thanh cong') </script>");
                }
                // nếu có sản phẩm rồi kiểm tra có khác màu sắc với size không
                else if (sanPham.MaMau != int.Parse(DDL_mau_sac.SelectedValue) || sanPham.Makichthuoc != int.Parse(DDL_Size.SelectedValue))
                {
                    cartItems.Add(add_sp());
                    HttpContext.Current.Session["Cart"] = cartItems;
                    Response.Write("<script> alert('da them thanh cong') </script>");
                }
                else
                    sanPham.So_Luong += int.Parse(DDL_Soluong.SelectedValue);
                // Lưu giỏ hàng vào session

            }// có giỏ thì thêm dữ liệu vào
            else
            {
                List<CartItem> cart = (List<CartItem>)HttpContext.Current.Session["Cart"];
                if (cart == null)
                {
                    cart = new List<CartItem>();
                }
                CartItem gio1 = new CartItem();
                gio1.Ma_SP = id;
                gio1.So_Luong = int.Parse(DDL_Soluong.SelectedValue);
                gio1.MaMau = int.Parse(DDL_mau_sac.SelectedValue);
                gio1.Makichthuoc = int.Parse(DDL_Size.SelectedValue);
                cart.Add(gio1);
                // Lưu giỏ hàng vào session
                HttpContext.Current.Session["Cart"] = cart;
                Response.Write("<script> alert('da them thanh cong') </script>");

            }

        }
    }
}