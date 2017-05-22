<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <div  id="hedef_site_kutusu"></div>
        <div id="sayac"></div>
    </div>
</div>

<style>
    .hedef_site_kutusu{
        font-size: 16px !important;
        width: 100% !important;
    }
</style>

 

<script language="JavaScript">
    var url     = "<?php echo $href ?>"
    var url     = url.replace(/&amp;/g, '&');
    var sayac   = 1;
    //alert(url)
    $(document).ready(function () {
        siradakiniGonder();
    })
    function siradakiniGonder(){
        $.ajax({
            url : url,
            type: "GET",
            dataType: "html",
            success: function (data) {
                //console.log(data);
                data = jQuery.parseJSON(data)
                if(parseInt(data['category_id']) > 0){
                    hedef_site_kutusu = '<div class="btn btn-primary hedef_site_adi">'
                            +"Hedef site : "+data['hedef_site']
                            +'</div>' +
                            '<hr>'
                    $('#hedef_site_kutusu').html(hedef_site_kutusu);

                    urun_kutulari = '<div class="btn btn-default">'
                            +sayac
                            +' - Ekle'
                            +' - ID ='
                            +data['category_id']
                            +'</div>';
                    $('#sayac').append(urun_kutulari);
                    sayac++;
                    siradakiniGonder();
                }
                if(data['hedefin_cevabi'] == 'urunler_bitti'){
                    hedef_site_kutusu = '<div class="btn btn-primary hedef_site_adi">'
                            +"Hedef site : "+data['hedef_site']
                            +'</div>' +
                            '<hr>'
                    $('#hedef_site_kutusu').html(hedef_site_kutusu);
                    alert("Senkronizasyon başarıyla tamamlandı.")
                }
            },
            error: function (err) {
                //alert("Local error callback.");
            },
            complete: function (data) {
                //alert("Local completion callback."+data);
            }
        });
    }
</script>


<?php echo $footer; ?>