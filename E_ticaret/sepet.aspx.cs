using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
    public partial class sepet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["urun_ekle"] == null)
                {
                    Response.Write("<script>alert('Ürun listeniz boş')</alert>");
                    Response.AddHeader("REFRESH", "1;URL=ana_sayfa.aspx");
                }
                string idler = Session["urun_ekle"].ToString();
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("select * from urun_bilgi where urun_id=@id", baglan);
                sql.Parameters.AddWithValue("@id", int.Parse(idler));
                SqlDataAdapter da = new SqlDataAdapter(sql);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rpt.DataSource = dt;
                rpt.DataBind();
                baglan.Close();
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
            
        }

        protected void bt_cks_Click(object sender, EventArgs e)
        {
            try
            {
                Session["urun_ekle"] = null;
                Response.Redirect("sepet.aspx");
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
            
        }
    }
}