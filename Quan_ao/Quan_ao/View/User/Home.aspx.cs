using Quan_ao.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Quan_ao.View.User
{
    public partial class Home : System.Web.UI.Page
    {
        private Shop_quan_ao db = new Shop_quan_ao();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DDL_danhmuc.DataSource = db.DanhMuc_SP.ToList();
                DDL_danhmuc.DataTextField = "TenMuc";
                DDL_danhmuc.DataValueField = "MaDMSP"; 
                DDL_danhmuc.DataBind();
                var result = db.SANPHAMs.ToList();
                rptProducts.DataSource = result.ToList();
                rptProducts.DataBind();
            }
        }

        protected void btn_tangdan_Click(object sender, EventArgs e)
        {
            var result = db.SANPHAMs.OrderBy(x => x.Gia).ToList();
            rptProducts.DataSource = result.ToList();
            rptProducts.DataBind();
            txtmax.Text = "";
            txt_min.Text = "";

        }

        protected void btn_giamdan_Click(object sender, EventArgs e)
        {
            var result = db.SANPHAMs.OrderByDescending(x => x.Gia).ToList();
            rptProducts.DataSource = result.ToList();
            rptProducts.DataBind();
            txtmax.Text = "";
            txt_min.Text = "";
        }

        protected void btn_loc_gia_Click(object sender, EventArgs e)
        {
            if (txt_min.Text !="" && txtmax.Text !="")
            {
                int giamin = int.Parse(txt_min.Text);
                int giamax = int.Parse(txtmax.Text);
                var result = db.SANPHAMs.Where(x => x.Gia > giamin && x.Gia < giamax).ToList();
                rptProducts.DataSource = result.ToList();
                rptProducts.DataBind();
            }
         
        }

        protected void DDL_danhmuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            var result = db.SANPHAMs.ToList();
            var bien = DDL_danhmuc.SelectedValue;
            rptProducts.DataSource = result.Where(x => x.MaDMSP == int.Parse(bien)).ToList() ;
            rptProducts.DataBind();
        }
    }
}