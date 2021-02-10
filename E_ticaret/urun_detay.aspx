<%@ Page Language="C#" enableEventValidation="false" AutoEventWireup="true" CodeBehind="urun_detay.aspx.cs" Inherits="E_ticaret.urun_detay" %>

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
    <form id="form1" runat="server">
        <section class="header box-shadow">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="logo">
                            <a href="ana_sayfa.aspx"><img src="resimler/google-logo.png" alt="" /></a>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="search">
                            <asp:TextBox type="text" class="search-text" placeholder="Sitede Ara..." runat="server" />
                            <asp:ImageButton ImageUrl="resimler/search.png" CssClass="search-btn" runat="server"/>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="basket">
                            <a href="">
                                <div >
                                    <img src=""  alt="" />
                                </div>
                                <span>Sepetim</span>
                            </a>
                            <asp:ImageButton CssClass="picture" OnClick="Unnamed_Click" ImageUrl="resimler/sepet.png" AlternateText="Sepet" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="product-detail">
            <div class="container">
                <div class="product-detail-box  box-shadow">
                    <div class="row">
                        <div class="col-lg-6">
                            <asp:Repeater ID="rpt" runat="server">
                                <ItemTemplate>
                                    <div class="product-picture">
                                        <img src='<%#Eval ("urun_resim")%>' alt="" />
                                    </div>
                                    <div class="desc">
                                    </div>
                                    </div>
                <div class="col-lg-6">
                    <div class="product-infos">
                        <div class="title">
                            <asp:Label ID="urun_ad" Text='<%#Eval ("urun_ad")%>' runat="server" />
                        </div>
                        <div class="price">
                            <asp:Label ID="urun_fiyat" Text='<%#Eval ("urun_fiyat")%>' runat="server" />
                        </div>
                    </div>
                    <div class="buy">
                        <asp:TextBox ID="urun_miktar" type="number" min="1" step="1" value="1" class="buy_count" runat="server" />
                        <asp:Button ID="bt_sepet_ekle" type="button" CssClass='<%#Eval ("urun_id")%>' OnClick="bt_sepet_ekle_Click" Text="Sepete Ekle" runat="server" />
                    </div>
                    <div class="picture-payment">
                        <img class="img-fluid" src="resimler/siparis-ver.jpg" alt="" />
                    </div>
                </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
            </div>
        </section>


        <section class="recent">
            <div class="container">
                <div class="recent-box box-shadow">
                    <div class="row">
                        <div class="slider-owl-3 owl-carousel owl-theme">

                            <div class="col">
                                <a href="">
                                    <div class="product-box">
                                        <div class="product-picture">
                                            <img src="resimler/maske.jpg" alt="" />
                                        </div>
                                        <div class="infos">
                                            <div class="title">Lacoste Maske</div>
                                            <div class="bottom">
                                                <div class="price">
                                                    199,00 TL
                                                </div>
                                                <div class="basket">
                                                    <div class="picture">
                                                        <img src="resimler/sepet.png" alt="" />
                                                    </div>
                                                    <span>Sepete Ekle</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="">
                                    <div class="product-box">
                                        <div class="product-picture">
                                            <img src="resimler/maske.jpg" alt="" />
                                        </div>
                                        <div class="infos">
                                            <div class="title">Lacoste Maske</div>
                                            <div class="bottom">
                                                <div class="price">
                                                    199,00 TL
                                                </div>
                                                <div class="basket">
                                                    <div class="picture">
                                                        <img src="resimler/sepet.png" alt="" />
                                                    </div>
                                                    <span>Sepete Ekle</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col">
                                <a href="">
                                    <div class="product-box">
                                        <div class="product-picture">
                                            <img src="resimler/maske.jpg" alt="" />
                                        </div>
                                        <div class="infos">
                                            <div class="title">Lacoste Maske</div>
                                            <div class="bottom">
                                                <div class="price">
                                                    199,00 TL
                                                </div>
                                                <div class="basket">
                                                    <div class="picture">
                                                        <img src="resimler/sepet.png" alt="" />
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
                </div>
            </div>
        </section>

        <section class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="logo">
                            <img src="resimler/google-logo.png" alt="" />
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
