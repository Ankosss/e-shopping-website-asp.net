<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ana_sayfa.aspx.cs" Inherits="E_ticaret.ana_sayfa" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/bootstrap.grid.min.css" />
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <title></title>
</head>
<body>
    <form runat="server">
        <section class="header box-shadow">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="logo">
                            <a href="ana_sayfa.aspx">
                                <img src="resimler/google-logo.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="search">
                            <asp:TextBox type="text" class="search-text" placeholder="Sitede Ara..." runat="server" />
                            <asp:ImageButton ImageUrl="resimler/search.png" CssClass="search-btn" runat="server" />
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="basket">
                            <a href="">
                                <div class="picture">
                                    <asp:ImageButton ID="sepet" ImageUrl="resimler/sepet.png" runat="server" OnClick="sepet_Click" />
                                </div>
                                <span>Sepetim</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="hero">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="sidebar-menu box-shadow">
                            <div class="title">Kategoriler</div>
                            <ul>

                                <asp:Repeater ID="rpt2" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <a href="#">
                                                <img src="resimler/right.png" alt="" />
                                                <asp:Label Text='<%#Eval ("kat_ad")%>' runat="server" />
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <div class="trend-product box-shadow">
                            <div class="title">En Çok Satanlar</div>
                            <div class="slider-owl-1 owl-carousel owl-theme">

                                <a href="">
                                    <div class="product-box">
                                        <div class="product-picture">
                                            <img src="resimler/maske-2.jpg" alt="">
                                        </div>
                                        <div class="infos">
                                            <div class="title">Lacoste Maske</div>
                                            <div class="bottom">
                                                <div class="price">
                                                    199,00 TL
                                                </div>
                                                <div class="basket">
                                                    <div class="picture">
                                                        <img src="resimler/sepet.png" alt="">
                                                    </div>
                                                    <span>Sepete Ekle</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                                <a href="">
                                    <div class="product-box">
                                        <div class="product-picture">
                                            <img src="resimler/maske.jpg" alt="">
                                        </div>
                                        <div class="infos">
                                            <div class="title">Lacoste Maske</div>
                                            <div class="bottom">
                                                <div class="price">
                                                    199,00 TL
                                                </div>
                                                <div class="basket">
                                                    <div class="picture">
                                                        <img src="resimler/sepet.png" alt="">
                                                    </div>
                                                    <span>Sepete Ekle</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>

                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="content">
                            <div class="row">
                                <asp:Repeater ID="rpt" runat="server">
                                    <ItemTemplate>
                                        <div class="col-lg-6">
                                            <a id="urun" onclick="spt_ekle_Click">
                                                <div class="product-box box-shadow">
                                                    <div class="product-picture">
                                                        <img src='<%#Eval ("urun_resim")%>' alt="">
                                                    </div>
                                                    <div class="infos">
                                                        <div class="title"><%#Eval ("urun_ad").ToString()%></div>
                                                        <div class="bottom">
                                                            <div class="price">
                                                                <%#Eval ("urun_fiyat").ToString()%> TL
                                                            </div>
                                                            <div class="basket">
                                                                <div class="picture">
                                                                    <asp:ImageButton ImageUrl="resimler/sepet.png" ID="spt_ekle" CssClass='<%#Eval ("urun_id")%>' Text="Sepete Ekle" runat="server" OnClick="spt_ekle_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3">

                        <asp:Panel ID="panel_kul_giris" runat="server" CssClass="user-infos box-shadow">
                            <div class="title">Giriş Ekranı</div>
                            <asp:TextBox type="email" class="form-item" placeholder="E-Mail" runat="server" ID="tb_kul_ad" />
                            <asp:TextBox type="password" class="form-item" placeholder="Şifre" runat="server" ID="tb_kul_sif" />
                            <asp:Button type="button" class="form-btn" Text="Giriş" runat="server" OnClick="Unnamed3_Click" />
                            <div class="link">
                                <asp:LinkButton ID="sifre_al" Text="Şifrenizi Mi Unuttunuz?" runat="server" OnClick="sifre_al_Click" />
                                <asp:LinkButton ID="kayit_ol" Text="Henüz Kayıt Olmadın Mı?" runat="server" CssClass="bold" OnClick="kayit_ol_Click" />
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="panel_giris_onay" CssClass="panel_giris_onay box-shadow" runat="server">
                            <asp:Label ID="kul_ad" runat="server" />
                            <asp:LinkButton ID="kul_cikis" Text="Çıkış" runat="server" OnClick="kul_cikis_Click" />
                        </asp:Panel>
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
    </form>
    <script src="js/jquery-3.4.0.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>

</body>
</html>
