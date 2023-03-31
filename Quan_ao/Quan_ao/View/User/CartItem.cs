using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Quan_ao.View.User
{
    public class CartItem
    {
        public int Ma_SP { get; set; }
        public string Hinh_sp { get; set; }
        public string tensp { get; set; }
        public int So_Luong { get; set; }
        public int MaMau { get; set; }
        public string tenmau { get; set; }

        public int Makichthuoc { get; set; }
        public string TenSize { get; set; }

        public int Gia_Tong_SP { get; set; }
        public int Thanh_tien { get; }


        public List<CartItem> cartItems = new List<CartItem>();

        public static int thanhtien = 0;
        //private const string CACHE_KEY = "CartItems";
        //public static List<CartItem> GetItems()
        //{
        //    List<CartItem> items = HttpContext.Current.Cache[CACHE_KEY] as List<CartItem>;
        //    if (items == null)
        //    {
        //        items = new List<CartItem>();
        //        HttpContext.Current.Cache[CACHE_KEY] = items;
        //    }
        //    return items;
        //}

        //public static void AddItem(CartItem item)
        //{
        //    List<CartItem> items = GetItems();
        //    items.Add(item);
        //    HttpContext.Current.Cache[CACHE_KEY] = items;
        //}

        //public static void RemoveItem(CartItem item)
        //{
        //    List<CartItem> items = GetItems();
        //    items.Remove(item);
        //    HttpContext.Current.Cache[CACHE_KEY] = items;
        //}

        //public static void UpdateItem(CartItem item)
        //{
        //    List<CartItem> items = GetItems();
        //    int index = items.FindIndex(i => i.Ma_SP == item.Ma_SP);
        //    if (index != -1)
        //    {
        //        items[index] = item;
        //        HttpContext.Current.Cache[CACHE_KEY] = items;
        //    }
        //}
    }
}