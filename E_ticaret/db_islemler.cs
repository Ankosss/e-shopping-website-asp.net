using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace E_ticaret
{
    class baglantı
    {
        SqlConnection baglan = null;
        public baglantı()
        {
            baglan = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asus\Desktop\E_ticaret\E_ticaret\App_Data\db.mdf;Integrated Security=True");
        }
        #region"Kullanıcı işlemleri"
        public void kul_ekle(string tb_ad, string tb_soyad, string tb_kul_ad, string tb_kul_sif, string tb_kul_mail,string kul_gorev)
        {
            try
            {
                baglan.Open();
                SqlCommand sql = new SqlCommand("Insert into kul_bilgi (kul_isim,kul_sisim,kul_ad,kul_sif,kul_mail,kul_gorev) values (@ad,@sad,@kad,@sif,@mail,@gorev)", baglan);
                sql.Parameters.AddWithValue("@ad", tb_ad);
                sql.Parameters.AddWithValue("@sad", tb_soyad);
                sql.Parameters.AddWithValue("@kad", tb_kul_ad);
                sql.Parameters.AddWithValue("@sif", tb_kul_sif);
                sql.Parameters.AddWithValue("@mail", tb_kul_mail);
                sql.Parameters.AddWithValue("@gorev", kul_gorev);
                sql.ExecuteNonQuery();
                baglan.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public int kul_giris(string mail, string sif)
        {
            try
            {
                int durum = -1;
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select kul_gorev from kul_bilgi where kul_mail=@mail and kul_sif = @sif", baglan);
                sql.Parameters.AddWithValue("@mail", mail);
                sql.Parameters.AddWithValue("@sif", sif);
                IDataReader dr = sql.ExecuteReader();
                if (dr.Read())
                {
                    string g = dr["kul_gorev"].ToString();
                    if (g == "0")
                    {
                        durum = 0;
                    }
                    else if (g == "1")
                    {
                        durum = 1;
                    }
                    else durum = 2;
                }
                else
                {
                    durum = -1;
                }
                baglan.Close();
                return durum;
            }
            catch (Exception)
            {

                throw;
            }
            
        }
        public bool kayit_kontrol(string mail)
        {
            try
            {
                bool durum = false;
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select * from kul_bilgi where kul_mail=@mail", baglan);
                sql.Parameters.AddWithValue("@mail", mail);
                SqlDataReader dr = sql.ExecuteReader();
                if (dr.Read())
                {
                    durum = false;
                }
                else
                {
                    durum = true;
                }
                baglan.Close();
                return durum;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void bilgi_guncelle(string kul_id, string ad, string soyad, string kul_ad, string kul_mail, string kul_sif)
        {
            try
            {
                baglan.Open();

                SqlCommand sql = new SqlCommand("Update kul_bilgi set kul_isim=@ad, kul_sisim=@soyad, kul_ad=@kad ,kul_mail=@mail ,kul_sif=@kul_sif where kul_id=@id", baglan);
                sql.Parameters.AddWithValue("@ad", kul_ad);
                sql.Parameters.AddWithValue("@soyad", soyad);
                sql.Parameters.AddWithValue("@ad", kul_ad);
                sql.Parameters.AddWithValue("@mail", kul_mail);
                sql.Parameters.AddWithValue("@sif", kul_sif);
                sql.Parameters.AddWithValue("@id", kul_id);
                sql.ExecuteNonQuery();

                baglan.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void kul_sil(string id)
        {

            try
            {
                baglan.Open();

                SqlCommand sql = new SqlCommand("Delete from kul_bilgi where kul_id=@id", baglan);
                sql.Parameters.AddWithValue("@id", id);
                sql.ExecuteNonQuery();

                baglan.Close();
            }
            catch (Exception)
            {

                throw;
            }

        }
        public void sifre_gonder(string mail)
        {
            try
            {
                string sifre = "";
                baglan.Open();

                SqlCommand sql = new SqlCommand("Select kul_sif from kul_bilgi where kul_mail=@mail", baglan);
                sql.Parameters.AddWithValue("@mail", mail);
                SqlDataReader dr = sql.ExecuteReader();
                if (dr.Read())
                {
                    sifre = dr["kul_sif"].ToString();

                    baglan.Close();
                    MailMessage email = new MailMessage();
                    email.From = new MailAddress("umitcan.inesillioglu@gmail.com");//Firma mail adresi yazılacak
                    email.To.Add("kodadi1999@gmail.com");
                    email.Subject = "Şifre Talebi";
                    email.Body = "Merhaba şifrenizi unuttuğunuzu belirtmişisniz şifreniz '" + sifre + "'. Lütfen şifrenizi kimseyle paylaşmayın";
                    SmtpClient gonder = new SmtpClient();
                    gonder.Credentials = new System.Net.NetworkCredential("umitcan.inesillioglu@gmail.com", "şifre");//Yazılan mail adresi ve şifresi yazılıcak
                    gonder.Port = 587;
                    gonder.Host = "smtp.gmail.com";
                    gonder.EnableSsl = true;
                    gonder.Send(email);
                }
                else
                {

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
        #region"Ürün Bilgileri"
        public void urun_ekle(string kat_id, string urun_ad, string urun_stok, string urun_fiyat,string yol)
        {
            try
            {
                baglan.Open();

                SqlCommand sql = new SqlCommand("Insert into urun_bilgi (kat_id,urun_ad,urun_stok,urun_fiyat,urun_resim) values (@id,@ad,@stok,@fiyat,@yol)", baglan);
                sql.Parameters.AddWithValue("@id", kat_id);
                sql.Parameters.AddWithValue("@ad", urun_ad);
                sql.Parameters.AddWithValue("@stok", urun_stok);
                sql.Parameters.AddWithValue("@fiyat", urun_fiyat);
                sql.Parameters.AddWithValue("@yol", yol);
                sql.ExecuteNonQuery();

                baglan.Close();
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
    }

}