<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel panel-default" style="height: 700px">
            <table class="table">
                <tr>
                    <td>
                        <label for="hedef_site"> Hedef Siteyi Seçin  </label>
                    </td>
                    <td>
                        <select id="hedef_site" class="form-control">
                            <option value="http://www.bebeketiketi.com">http://www.bebeketiketi.com</option>
                            <option value="http://www.stickertasarla.com">http://www.stickertasarla.com</option>
                             <option value="http://www.kavanozsticker.com">http://www.kavanozsticker.com</option>
                           <option value="http://www.hediyemagnet.net">http://www.hediyemagnet.net</option>
 				<option value="http://www.fotomagneti.com">http://www.fotomagneti.com</option>
				<option value="http://www.bebekmagneti.com">http://www.bebekmagneti.com</option>
				<option value="http://www.etikettasarla.com">http://www.etikettasarla.com</option>
				<option value="http://www.kavanozetiketi.com">http://www.kavanozetiketi.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="silinme_onayi"> Hedef Sitedeki Farklı Ürünler Silinsin </label>
                    </td>
                    <td>
                        <input type="text" id="silinme_onayi" placeholder="Sil yazın" class="form-control"   style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="ucret_orani"> Yeni Ücret Oranı (%)</label>
                    </td>
                    <td>
                        <input type="number" id="ucret_orani" class="form-control" value="100"   style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table class="table">
                            <tr>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="ileri_btn">Ürünleri Gönder</div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="kategorileri_esle">Kategorileri Eşitle
                                        <br> Eşitleme bitmeden iptal etilmemeli
                                    </div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="manufacturer_esle">Üretici/Marka Eşitle</div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="siparisler">Siparişleri Gör</div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="filitreleri_esle">Filitreleri Eşitle</div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="attribute_group_esle">Özellik Gruplarını Eşitle</div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="attribute_esle">Özellikleri Eşitle</div>
                                </td>
                                <td>
                                    <div class="btn dugme_esitle btn-primary" style="float: left" id="option_esle">Seçenekleri Eşitle</div>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>


        </div>

    </div>
</div>
<?php echo $footer; ?>

<style>
    .dugme_esitle{
        height: 50px!important;
        width: 220px!important;
        border-radius: 0px!important;
    }
</style>


<script language="JavaScript">
    $(document).ready(function () {
        $('#ileri_btn').click(function () {
            encoded                 = "<?php echo $href;?>"
            hedef_site              = $('#hedef_site').val()

            silinme_onayi = $('#silinme_onayi').val()
            if( silinme_onayi=='sil' || silinme_onayi=='Sil'){
                silinme_onayi       = 1
            }else{
                silinme_onayi       = 0
            }
            ucret_orani             = $('#ucret_orani').val()

            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL
                    + "&hedefsite=" + hedef_site
                    + "&silinme_onayi=" + silinme_onayi
                    + "&ucret_orani=" + ucret_orani
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#siparisler').click(function () {
            var url                 = "<?php echo $href_siparis;?>";
            url                     = url.replace(/&amp;/g, '&');
            hedef_site              = $('#hedef_site').val();
            url                     = url + "&hedef_site=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#kategorileri_esle').click(function () {
            encoded                 = "<?php echo $href_kategori_esle;?>"
            hedef_site              = $('#hedef_site').val()
            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#filitreleri_esle').click(function () {
            encoded                 = "<?php echo $href_filitre_esle;?>"
            hedef_site              = $('#hedef_site').val()
            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })



        $('#option_esle').click(function () {
            encoded                 = "<?php echo $href_option_esle;?>"
            hedef_site              = $('#hedef_site').val()

            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            //window.location.href    = url;
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#attribute_group_esle').click(function () {
            encoded                 = "<?php echo $href_attribute_group_esle;?>"
            hedef_site              = $('#hedef_site').val()
            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#attribute_esle').click(function () {
            encoded                 = "<?php echo $href_attribute_esle;?>"
            hedef_site              = $('#hedef_site').val()

            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })

        $('#manufacturer_esle').click(function () {
            encoded                 = "<?php echo $href_manufacturer_esle;?>"
            hedef_site              = $('#hedef_site').val()

            var decodedURL          = encoded.replace(/&amp;/g, '&');
            url                     = decodedURL + "&hedefsite=" + hedef_site
            var win = window.open(url, '_blank');
            win.focus();
        })
    })
</script>