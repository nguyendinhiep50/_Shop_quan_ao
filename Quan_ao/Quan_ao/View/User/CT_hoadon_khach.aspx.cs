using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.User
{
    public partial class CT_hoadon_khach : System.Web.UI.Page
    {
        public static int id = 0;
        Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ID"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["ID"]);
                    var CT_hoadon = from SPM in db.SanPham_Mua
                                        join HD in db.HoaDons on SPM.MaHoaDon equals HD.MaHoaDon
                                        join TK in db.TaiKhoans on HD.MaTK equals TK.MaTK
                                        join SP in db.SANPHAMs on SPM.MaSP_ID equals SP.MaSP_ID
                                        join SZ in db.SIZEs on SPM.masize equals SZ.MaSize
                                        join CL in db.MAUSACs on SPM.mamau equals CL.MaMau
                                        where HD.MaHoaDon == id
                                        select new
                                        {
                                            SP.URL_Hinh_Anh,
                                            SP.TenSP,
                                            SZ.Size1,
                                            CL.TenMau,
                                            SPM.SoLuong,
                                        };
                    rptProducts.DataSource = CT_hoadon.ToList();
                    rptProducts.DataBind();
                }
            }
          
        }

    }
}