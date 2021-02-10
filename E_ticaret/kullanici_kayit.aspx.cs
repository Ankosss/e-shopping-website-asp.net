using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;

namespace E_ticaret
{
    public partial class kullanici_kayit : System.Web.UI.Page
    {
        E_ticaret.baglantı db = new baglantı();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            try
            {
                if (tb_kul_ad.Text != "" && tb_kul_kad.Text != "" && tb_kul_mail.Text != "" && tb_kul_sad.Text != "" && tb_kul_sif.Text != "")
                {
                    if (db.kayit_kontrol(tb_kul_mail.Text))
                    {
                        db.kul_ekle(tb_kul_ad.Text, tb_kul_sad.Text, tb_kul_kad.Text, tb_kul_sif.Text, tb_kul_mail.Text, "0");
                        Response.Write("<script>alert('Kayıt başarılı Ana Sayfaya yönlendiriliyorsunuz.')</script>");
                        Response.AddHeader("REFRESH", "1;URL=ana_sayfa.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Mail adresininiz sistemimize kayıtlı')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Lütfen bilgilerinizi doldurup kayıt olmayı deneyin.')</script>");
                }
            }
            catch (Exception)
            {

                Response.Write("<script>alert('Ön görülemeyen bir hata meydana geldi')</alert>");
            }
            
        }
    }
}