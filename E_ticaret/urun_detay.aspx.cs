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
    public partial class urun_detay : System.Web.UI.Page
    {
        ana_sayfa anas=new ana_sayfa();
        public int id=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["id"] == null)
                {
                    Response.Redirect("ana_sayfa.aspx");
                }
                id = int.Parse(Session["id"].ToString());
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("select * from urun_bilgi where urun_id=@id", baglan);
                sql.Parameters.AddWithValue("@id", id);
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

        protected void bt_sepet_ekle_Click(object sender, EventArgs e)
        {
            try
            {
                Button b = (Button)sender;
                Session["urun_ekle"] = Session["urun_ekle"] + b.CssClass.ToString() + " ";
                Response.Write("<script>alert('Ürün eklendi')</script>");

            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
            
        }

        protected void Unnamed_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                Response.Redirect("sepet.aspx");
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
            
        }
    }
}