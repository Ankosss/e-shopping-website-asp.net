<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kullanici_kayit.aspx.cs" Inherits="E_ticaret.kullanici_kayit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.grid.min.css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <title>Kullanıcı girişi</title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="header box-shadow">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="logo">
                            <img src="resimler/google-logo.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="search">
                                <input type="text" class="search-text" placeholder="Sitede Ara...">
                                <button type="button" class="search-btn">
                                    <img src="resimler/search.png" alt="" /></button>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="basket">
                            <a href="">
                                <div class="picture">
                                    <img src="resimler/sepet.png" alt="">
                                </div>
                                <span>Sepetim</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="register">
            <div class="container">
                <div class="row">
                    <div class="offset-lg-3 col-lg-6">
                        <div class="register-form box-shadow">
                            <div class="title">Kayıt Formu</div>
                                <asp:TextBox type="text" class="form-item" placeholder="Adınız" runat="server" ID="tb_kul_ad"/>
                                <asp:TextBox type="text" class="form-item" placeholder="Soyadınız" runat="server" ID="tb_kul_sad"/>
                                <asp:TextBox type="text" class="form-item" placeholder="Kullanıcı Adınız" runat="server" ID="tb_kul_kad"/>
                                <asp:TextBox type="text" class="form-item" placeholder="Mail Adresiniz" runat="server" ID="tb_kul_mail" TextMode="Email"/>
                                <asp:TextBox type="text" class="form-item" placeholder="Şifre" runat="server" ID="tb_kul_sif" TextMode="Password"/>
                                <div class="btn">
                                    <asp:Button type="button" class="form-btn" Text="Kayıt Ol" runat="server" OnClick="Unnamed6_Click" />
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="logo">
                            <img src="resimler/google-logo.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="desc">
                            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Asperiores, dolores natus eos illo
                        deleniti saepe. Soluta ducimus aliquid eum saepe explicabo, delectus, nisi modi dolorum,
                        blanditiis nostrum perspiciatis natus distinctio.
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="backlink">
                            Copyright - MT - 2021
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>

    </form>
</body>
</html>
