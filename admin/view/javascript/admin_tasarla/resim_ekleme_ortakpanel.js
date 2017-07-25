/**
 * Created by alpay on 05.07.2017.
 */
var kirpici_obj;
$(document).ready(function () {

    $('#resim-yukle').click(function () {
        $('#file').trigger('click');
    })

    $("#file").change(function () {
        $('#loader').show();
        //resmi sunucuya gönder
        resmiSunucyaGonder();

    });

    // modal pencerede ki tamam a tıklanınca
    $('#resim-secimi-tamam').click(function () {
        hedef_icerik.src = kirpici_obj.getResult();
        ciz();
    })



    $('#resmi-saga-cevir').click(function () {
        $('#loader').show();
        if(typeof kirpici_obj!='undefined'){
            kirpici_obj.secimAlaniniGizle();
        }
        var resim = document.getElementById("orjinal-resim");
        guncel_width = $(resim).width();
        guncel_height = $(resim).height();

        pic_real_height = resim.naturalHeight;
        pic_real_width = resim.naturalWidth;

        var mainCanvas = document.createElement('canvas');
        var ctx = mainCanvas.getContext('2d');
        mainCanvas.width = pic_real_height;
        mainCanvas.height = pic_real_width;

        var imgObj = new Image();
        //$(resim).hide();
        ctx.rotate(Math.PI / 2);
        ctx.drawImage(resim, 0, -pic_real_height);
        imgObj.onload= function () {
            $(resim).attr('src', mainCanvas.toDataURL());
            //$(resim).show();
            $('#loader').hide();
            kirpici_obj = $('#secim-tuval').kirpici(hedef_icerik.width, hedef_icerik.height);
        }
        imgObj.src = $(resim).attr('src');
    })






    $('#resmi-sola-cevir').click(function () {
        $('#loader').show();
        $('#secim-icin-dokun').hide();
        if(typeof kirpici_obj!='undefined'){
            kirpici_obj.secimAlaniniGizle();
        }
        var resim = document.getElementById("orjinal-resim");
        guncel_width = $(resim).width();
        guncel_height = $(resim).height();

        pic_real_height = resim.naturalHeight;
        pic_real_width = resim.naturalWidth;

        var mainCanvas = document.createElement('canvas');
        var ctx = mainCanvas.getContext('2d');
        mainCanvas.width = pic_real_height;
        mainCanvas.height = pic_real_width;

        var imgObj = new Image();
        $(resim).hide();
        ctx.rotate(-Math.PI / 2);
        ctx.drawImage(resim, -pic_real_width, 0);
        imgObj.onload= function () {
            $(resim).attr('src', mainCanvas.toDataURL());
            $(resim).show();
            $('#loader').hide();
            kirpici_obj = $('#secim-tuval').kirpici(hedef_icerik.width, hedef_icerik.height);
        }
        imgObj.src = $(resim).attr('src');
    })










    $('#secim-icin-dokun').click(function () {
        kirpici_obj = $('#secim-tuval').kirpici(hedef_icerik.width, hedef_icerik.height);
        $(this).hide('slow');
    })


})

////////////////////////document ready sonu ///////////////////////////////////////////


function resmiSunucyaGonder(){
    if(typeof kirpici_obj!='undefined' ){
        kirpici_obj.secimAlaniniSil();
    }
    var data = new FormData();
    jQuery.each(jQuery('#file')[0].files, function(i, file) {
        data.append('file-'+i, file);
        data.append('rasgele_sayi',Math.floor((Math.random() * 100) + 1))
        data.append('ilgili_kutu', hedef_icerik.id);

    });
    jQuery.ajax({
        url: '../index.php?route=tasarim/upload/saveFile',
        data: data,
        cache: false,
        contentType: false,
        processData: false,
        type: 'POST',
        success: function(data){
            if(data['hata']){
                $('#loader').hide();
                alert(data['hata']);
            }
            if(data['url_konum']){
                hedef_icerik.orjinal_resim_url=data['url_konum'];
                $('#orjinal-resim').attr('src','../'+hedef_icerik.orjinal_resim_url);
                var logo = document.getElementById('orjinal-resim');
                logo.onload = function () {
                    //$('#secim-icin-dokun').show('slow');
                    kirpici_obj = $('#secim-tuval').kirpici(hedef_icerik.width, hedef_icerik.height);
                    $('#loader').hide();
                };

            }
        },
        error: errorHandler = function() {
            $('#loader').hide();
            alert("Dosya gönderilemedi");
        }
    });
}









////////////////////////////////// resimEkle ekleme başı ///////////////////////////////
function resimEkle() {
    $('#myModal').modal('show');
    if(typeof hedef_icerik.orjinal_resim_url!='undefined'){
        $('#loader').show();
        $('#orjinal-resim').attr('src',hedef_icerik.orjinal_resim_url);
        var logo = document.getElementById('orjinal-resim');
        logo.onload = function () {
            //$('#secim-icin-dokun').show('slow');
            kirpici_obj = $('#secim-tuval').kirpici(hedef_icerik.width, hedef_icerik.height);
            $('#loader').hide();
        };
    }
}
///////////////////////////////////////////////// resimEkle son ////////////////////////////////


