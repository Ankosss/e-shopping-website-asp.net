<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_panel.aspx.cs" Inherits="E_ticaret.admin_panel" %>

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
        <section class="panel">
            <div class="left">
                <div class="logo">
                    <a href="ana_sayfa.aspx"><img src="resimler/google-logo.png" alt="" /></a>
                </div>
                <ul>
                    <li>
                        <asp:Button ID="urun_listele" Text="Ürün" runat="server" OnClick="urun_listele_Click" />
                    </li>
                    <li>
                        <asp:Button ID="kullanici_listele" Text="Kullanıcı" runat="server" OnClick="kullanici_listele_Click" />
                    </li>
                </ul>
            </div>
            <div class="content">
                <div class="body">
                        <asp:DataGrid ID="gridview" runat="server" CssClass="data-grid" />
                </div>
                <div class="right">
                    <asp:Panel ID="panel_urun" runat="server" Visible="False">
                        <asp:TextBox ID="tb_urun_id" placeholder="Ürün ID" runat="server" />
                        <asp:DropDownList ID="cb_kat_id" runat="server">
                            <asp:ListItem Text="Kategori Seçiniz" />
                        </asp:DropDownList>
                        <asp:TextBox ID="tb_urun_ad" placeholder="Ürün Adı" runat="server" />
                        <asp:TextBox ID="tb_urun_stok" placeholder="Ürün Stok" runat="server" />
                        <asp:TextBox ID="tb_urun_fiyat" placeholder="Ürün Fiyat" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="bt_urun_kayit" Text="Kaydet" runat="server" OnClick="bt_urun_kayit_Click" />
                    </asp:Panel>
                    <asp:Panel ID="panel_kullanici" runat="server" Visible="False">
                        <asp:TextBox ID="tb_kul_id" placeholder="Kullanıcı ID" runat="server" />
                        <asp:TextBox ID="tb_kul_isim" placeholder="Kullanıcı İsmi" runat="server" />
                        <asp:TextBox ID="tb_kul_sisim" placeholder="Kullanıcı Soyismi" runat="server" />
                        <asp:TextBox ID="tb_kul_ad" placeholder="Kullanıcı Adi" runat="server" />
                        <asp:TextBox ID="tb_kul_sif" placeholder="Kullanıcı Şifre" runat="server" />
                        <asp:TextBox ID="tb_kul_mail" placeholder="Kullanıcı E-mail" runat="server" />
                        <asp:DropDownList ID="cb_kul_gorev" runat="server">
                            <asp:ListItem Text="Görevini Seçin" />
                            <asp:ListItem Text="Kullanıcı" />
                            <asp:ListItem Text="Admin" />
                        </asp:DropDownList>
                        <asp:Button ID="bt_kul_kayit" Text="Kaydet" runat="server" OnClick="bt_kul_kayit_Click" />
                    </asp:Panel>
                </div>
            </div>
        </section>

        <script src="js/jquery-3.4.0.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/main.js"></script>
    </form>
</body>
</html>
