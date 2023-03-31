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
        private int id = 0;
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
            if (e.CommandName == "Update")
            {
                ListViewDataItem item = (ListViewDataItem)e.Item;
               
                string txtProductName = ((TextBox)item.FindControl("txttensp")).Text;
                string txtDescription = ((TextBox)item.FindControl("txtgia")).Text;
                string txtPrice = ((TextBox)item.FindControl("txttinhtrang")).Text;

                // Thực hiện thao tác cập nhật dữ liệu ở đây, sử dụng các giá trị dữ liệu hiện tại của ListViewItem
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