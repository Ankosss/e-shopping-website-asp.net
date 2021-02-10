<%@ Page Language="C#" enableEventValidation="false" AutoEventWireup="true" CodeBehind="sepet.aspx.cs" Inherits="E_ticaret.sepet" %>

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
                            <a href="ana_sayfa.aspx">
                                <img src="resimler/google-logo.png" alt=""></a>
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

        <section class="basket-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="basket-area box-shadow">
                            <asp:Repeater ID="rpt" runat="server">
                                <ItemTemplate>
                                    <div class="basket-box">
                                        <img src='<%#Eval ("urun_resim")%>' alt="">
                                        <div class="infos">
                                            <asp:Label CssClass="title" Text='<%#Eval ("urun_ad")%>' runat="server" />
                                            <asp:Label ID="ucret" CssClass="price" Text='<%#Eval ("urun_fiyat")%>' runat="server" />
                                            <asp:Label CssClass="count" Text="Adet : 2" runat="server" />
                                            <asp:Button ID="bt_cks" Text="X" CssClass="close" runat="server" OnClick="bt_cks_Click" />
                                            <div class="picture-payment">
                                                <img class="img-fluid" src="resimler/siparis-ver.jpg" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="right-basket box-shadow">
                            <div class="picture">
                                <img src="resimler/google-logo.png" alt="">
                            </div>
                            <div class="title">Sepet Tutarı</div>
                            <div class="price-total">
                                <ul>
                                    <li>Ürün Adedi : <span>2</span>
                                    </li>
                                    <li>Sepet Tutarı : <span>398,00 TL</span>
                                    </li>
                                    <li>KDV Tutarı : <span>60,00 TL</span>
                                    </li>
                                    <li>Toplam Tutar : <span>458,00 TL</span>
                                    </li>
                                </ul>
                                <asp:Button Text="Satın Al" class="basket-btn" runat="server" />
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
