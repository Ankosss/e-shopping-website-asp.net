using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_ticaret
{
    public partial class ana_sayfa : System.Web.UI.Page
    {
        string kul_bilgi;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Kul_giris"] != null)
                {
                    panel_giris_onay.Visible = true;
                    kul_ad.Text = "Hoşgeldiniz " + kul_bilgi;
                    panel_kul_giris.Visible = false;
                }
                else
                {
                    panel_kul_giris.Visible = true;
                    panel_giris_onay.Visible = false;
                }
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("select * from urun_bilgi", baglan);
                SqlDataAdapter da = new SqlDataAdapter(sql);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rpt.DataSource = dt;
                rpt.DataBind();

                sql = new SqlCommand("select * from kategori", baglan);
                da = new SqlDataAdapter(sql);
                dt = new DataTable();
                da.Fill(dt);

                rpt2.DataSource = dt;
                rpt2.DataBind();

                baglan.Close();
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        E_ticaret.baglantı db = new baglantı();
        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            try
            {
                int a = db.kul_giris(tb_kul_ad.Text, tb_kul_sif.Text);
                if (a == 0)
                {
                    Response.Write("<script>alert('Kullanıcı girişi başarılı')</script>");
                    SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                    baglan.Open();

                    SqlCommand sql = new SqlCommand("select kul_isim,kul_sisim from kul_bilgi where kul_mail=@mail", baglan);
                    sql.Parameters.AddWithValue("@mail", tb_kul_ad.Text);
                    SqlDataReader dr = sql.ExecuteReader();
                    if (dr.Read())
                    {
                        kul_bilgi = (dr["kul_isim"].ToString() + " " + dr["kul_sisim"].ToString()).ToUpper();
                    }
                    baglan.Close();
                    Session.Add("kul_giris", true);
                    Response.Redirect("ana_sayfa.aspx");
                }
                else if (a == 1)
                {
                    Response.Write("Editör girişi başarılı");
                }
                else if (a == -1)
                {
                    Response.Write("<script>alert('Girmiş olduğunuz bilgilere ait kullanıcı bulunamadı')</script>");
                }
                else
                {
                    Response.Redirect("admin_panel.aspx");
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }

        protected void kayit_ol_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("kullanici_kayit.aspx");
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }

        protected void sifre_al_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Write("<script>alert('Kodları eklendi ama kullanılmıyor kodlara bakılabilir')</script>");
                //db.sifre_gonder(tb_kul_ad.Text);
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }

        protected void kul_cikis_Click(object sender, EventArgs e)
        {
            try
            {
                Session["kul_giris"] = null;
                kul_ad = null;
                Response.Redirect("ana_sayfa.aspx");
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        public int urun_id = 0;
        protected void spt_ekle_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton b = (ImageButton)sender;
                Session.Add("id", b.CssClass);
                Response.Redirect("urun_detay.aspx");
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }

        protected void sepet_Click(object sender, ImageClickEventArgs e)
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