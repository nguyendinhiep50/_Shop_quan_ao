﻿using System;
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
                DDL_mau_sac.DataSource = db.MAUSACs.ToList();
                DDL_mau_sac.DataTextField = "TenMau"; // Thiết lập để hiển thị tên màu
                DDL_mau_sac.DataValueField = "MaMau"; // Thiết lập để lưu trữ mã màu
                DDL_mau_sac.DataBind();
                DDL_Size.DataSource = db.SIZEs.ToList();
                DDL_Size.DataTextField = "Size1";
                DDL_Size.DataValueField = "MaSize";
                DDL_Size.DataBind();
                for (int i = 1; i <= 5; i++)
                {
                    ListItem item = new ListItem(i.ToString(), i.ToString());
                    DDL_Soluong.Items.Add(item);
                }
                var sanpham = db.SANPHAMs.Find(id);
                lbl_tensp.Text = sanpham.TenSP;
                lbl_giasp.Text = sanpham.Gia.ToString();
            }
        }

        protected void btn_them_gio_Click(object sender, EventArgs e)
        {
            // kiểm tra xem có giỏ hay chưa
            List<CartItem> cartItems = (List<CartItem>)Session["Cart"];
            if (cartItems != null)
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

                // kiểm tra xem có trong giỏ hàng chưa
                //CartItem sanPham = cartItems.Find(sp => sp.Ma_SP == id);
                //if (sanPham == null)
                //{
                //    cartItems.Add(gio1);
                //}
                //else
                //    sanPham.So_Luong+= int.Parse(DDL_Soluong.SelectedValue); ;
            }
        }
    }
}