using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace E_ticaret
{
    public partial class admin_panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void kul_listele()
        {
            try
            {
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select * from kul_bilgi", baglan);
                SqlDataReader dr = sql.ExecuteReader();
                gridview.DataSource = dr;
                gridview.DataBind();

                dr.Close();
                baglan.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.ToString());
            }
        }
        public void urun_goster()
        {
            try
            {
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select * from urun_bilgi", baglan);
                SqlDataReader dr = sql.ExecuteReader();
                gridview.DataSource = dr;
                gridview.DataBind();

                dr.Close();
                baglan.Close();
            }
            catch (Exception e)
            {
                Response.Write(e.ToString());
            }
        }
        public void kat_getir(DropDownList ddl)
        {
            ddl.Items.Clear();
            try
            {
                SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select kat_ad from kategori", baglan);
                SqlDataReader dr = sql.ExecuteReader();
                while (dr.Read())
                {
                    ddl.Items.Add(dr["kat_ad"].ToString());
                }

                baglan.Close();
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        protected void urun_listele_Click(object sender, EventArgs e)
        {
            try
            {
                if (panel_urun.Visible == false)
                {
                    urun_goster();
                    kat_getir(cb_kat_id);
                    panel_urun.Visible = true;
                    panel_kullanici.Visible = false;
                }
                else
                {
                    panel_urun.Visible = false;
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        protected void kullanici_listele_Click(object sender, EventArgs e)
        {
            try
            {
                if (panel_kullanici.Visible == false)
                {
                    kul_listele();
                    panel_kullanici.Visible = true;
                    panel_urun.Visible = false;
                }
                else
                {
                    panel_kullanici.Visible = false;
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        protected void bt_urun_kayit_Click(object sender, EventArgs e)
        {
            int id = 0;
            try
            {
                if (FileUpload1.HasFile)
                {

                    FileUpload1.SaveAs(Server.MapPath("/resimler/") + FileUpload1.FileName);
                    String yol = "resimler/" + FileUpload1.FileName;
                    SqlConnection baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
                    baglan.Open();

                    SqlCommand sql = new SqlCommand("select kat_id from kategori where kat_ad=@ad", baglan);
                    sql.Parameters.AddWithValue("@ad", cb_kat_id.Text);
                    SqlDataReader dr = sql.ExecuteReader();
                    if (dr.Read())
                    {
                        id = int.Parse(dr["kat_id"].ToString());
                    }
                    dr.Close();
                    baglan.Close();
                    baglantı db = new baglantı();
                    db.urun_ekle(id.ToString(), tb_urun_ad.Text, tb_urun_stok.Text, tb_urun_fiyat.Text,yol);
                    Response.Write("<script>alert('Kayıt Eklendi')</script>");
                    urun_goster();

                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
        protected void bt_kul_kayit_Click(object sender, EventArgs e)
        {
            try
            {
                baglantı db = new baglantı();
                if (db.kayit_kontrol(tb_kul_mail.Text))
                {
                    string gorev = "-1";
                    if (cb_kul_gorev.Text == "Admin")
                    {
                        gorev = "2";
                    }
                    else if (cb_kul_gorev.Text == "Editör")
                    {
                        gorev = "1";
                    }
                    else if (cb_kul_gorev.Text == "Kullanıcı")
                    {
                        gorev = "0";
                    }
                    db.kul_ekle(tb_kul_isim.Text, tb_kul_sisim.Text, tb_kul_ad.Text, tb_kul_sif.Text, tb_kul_mail.Text, gorev);
                    kul_listele();
                }
                else
                {
                    Response.Write("<script>alert('Bu mail adresi zaten kullanılıyor.')</script>");
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
        }
    }
}