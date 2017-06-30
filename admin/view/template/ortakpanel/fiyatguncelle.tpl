<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
  <div class="container-fluid">
	  <div class="panel-body">
		  <div class="well">
			  <div class="row">
				  <div class="table-responsive">
					  <div class="col-sm-6">
						  <div class="form-group">
							  <label class="control-label" for="input-order-status">Kategoriler</label>
							  <select name="kategoriler" id="kategori-slct" class="form-control">
								  <option value="0" selected></option>
								  <?php foreach ($categoryes as $category) { ?>
								  <option value="<?php echo $category['category_id']; ?>"  ><?php echo $category['name']; ?></option>
								  <?php } ?>
							  </select>
						  </div>
					  </div>
					  <div class="col-sm-6">
						  <div class="form-group">
							  <label class="control-label" for="input-order-status">Seçenekler</label>
							  <select name="secenekler" id="option-slct" class="form-control">
								  <option value="0" selected></option>
								  <?php foreach ($options as $option) { ?>
								  <option value="<?php echo $option['option_id']; ?>"   ><?php echo $option['name']; ?></option>
								  <?php } ?>
							  </select>
						  </div>
					  </div>

					  <div class="col-sm-12">
						  <div class="form-group">
							  <div id="mantik-cumlesi"></div>
							  <div id="etkilenecek-urunsayisi-div"></div>
						  </div>
						  <div class="btn btn-primary pull-right"  id="etkilenecek-urunsayisi" style="display: none;">Etkilenecek Ürün Sayısını Getir</div>
					  </div>
				  </div>
			  </div>
		  </div>

		  <div class="well alan">
			  <div class="table-responsive">
				  <div class="col-sm-12">
					  <div class="form-group">
						  <label class="control-label" for="input-order-status">Yeni Fiyat</label>
						  <input type="number" min="0" max="99999" required id="yeni-fiyat"  class="form-control" placeholder="Yeni fiyatı yazın">
					  </div>
					  <div class="btn btn-primary pull-right"  id="fiyati-kaydet">Fiyatı Kaydet</div>
				  </div>
			  </div>
		  </div>

		  <div class="well  alan">
			  <div class="table-responsive">
				  <div class="col-sm-12">
					  <form id="form0" method="post" action="<?php echo $setaciklamaurl;?>" >
					  <div class="form-group">
						  <label class="control-label" for="input-order-status">Açıklama Ekle</label>
						  <textarea name="product_description" placeholder="Açıklama yazın" id="input-description1"></textarea>
					  </div>
					  <div class="btn btn-primary pull-right"  id="aciklama-kaydet">Açıklamayı Kaydet</div>
					  </form>
				  </div>
			  </div>
		  </div>
	  </div>
  </div>

  </div>

</div>
<?php echo $footer; ?>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script language="JavaScript1.2">
	var kategori_id='0',option_id='0';
	var kategori_adi,option_adi;
	$('#kategori-slct').change(function () {
		kategori_adi 	= $('#kategori-slct option:selected').text();
        kategori_id 	= $('#kategori-slct option:selected').val();
        console.log(kategori_adi,kategori_id)
        $('#etkilenecek-urunsayisi').trigger('click');
    })
    $('#option-slct').change(function () {
        option_id 	= $('#option-slct option:selected').val();
        option_adi 	= $('#option-slct option:selected').text();
        console.log(option_adi,option_id)
        $('#etkilenecek-urunsayisi').trigger('click');
    })


	$('#yeni-fiyat').keypress(function () {

	    numarami = 1;
	    try {
            sayi = parseFloat($(this).val());
            sayi = sayi +0;
        } catch (e) {
            numarami = 0;
		}

		if(numarami>0){
            $('#fiyati-kaydet').show();
        }else{
            $('#fiyati-kaydet').hide();
        }
    })


    //etkilenecek ürün sayısını getir
	$('#etkilenecek-urunsayisi').click(function () {
	    url	= '<?php echo $getproductcounturl;?>'+'&kategori_id='+kategori_id+'&option_id='+option_id;
	    if(option_id=="0" && kategori_id=="0"){
        	$('.alan').hide();
            $('#etkilenecek-urunsayisi-div').html('');
        	return;
        }

        var url = url.replace("&amp;", "&");
        $.ajax({
            url: url,
            dataType: 'json',
            beforeSend: function() {
                $('#etkilenecek-urunsayisi').button('loading');
            },
            complete: function() {
                $('#etkilenecek-urunsayisi').button('reset');
            },
            success: function(data) {
                $('#etkilenecek-urunsayisi-div').html(data+ ' ürün etkilenecek ' )
				if(data[0]==0){
                	$('.alan').hide();
                }else{
                    $('.alan').show();
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert("Ürün sayısı alınamadı ");
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    })



    CKEDITOR.replace('input-description1');
    CKEDITOR.on('dialogDefinition', function (event)
    {
        var editor = event.editor;
        var dialogDefinition = event.data.definition;
        var dialogName = event.data.name;

        var tabCount = dialogDefinition.contents.length;
        for (var i = 0; i < tabCount; i++) {
            var browseButton = dialogDefinition.contents[i].get('browse');

            if (browseButton !== null) {
                browseButton.hidden = false;
                browseButton.onClick = function() {
                    $('#modal-image').remove();
                    $.ajax({
                        url: 'index.php?route=common/filemanager&token=<?php echo $token; ?>&ckedialog='+this.filebrowser.target,
                        dataType: 'html',
                        success: function(html) {
                            $('body').append('<div id="modal-image" style="z-index: 10020;" class="modal">' + html + '</div>');
                            $('#modal-image').modal('show');
                        }
                    });
                }
            }
        }
    });



    //fiyatı kaydet
    $('#fiyati-kaydet').click(function () {
        yeni_fiyat	= $('#yeni-fiyat').val();
        url	= '<?php echo $setfiyaturl;?>'+'&kategori_id='+kategori_id+'&option_id='+option_id+'&yeni_fiyat='+yeni_fiyat;
        var url = url.replace("&amp;", "&");
        $.ajax({
            url: url,
            dataType: 'html',
            beforeSend: function() {
                $('#fiyati-kaydet').button('loading');
            },
            complete: function() {
                $('#fiyati-kaydet').button('reset');
            },
            success: function(data) {
                console.log('Fiyat güncellendi');
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert("Fiyatlar kaydedilmedi ");
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    })


    //aciklama kaydet
    $('#aciklama-kaydet').click(function () {
        url	= '<?php echo $setaciklamaurl;?>'+'&kategori_id='+kategori_id+'&option_id='+option_id;
        var url = url.replace("&amp;", "&");
        $('#form0').attr('action',url);
        $('#form0').submit();
    })

    $(document).ready(function () {
        $('.alan').hide();
        $('#fiyati-kaydet').hide();
        <?php
            if(isset($this->request->get['mesaj'])){
                echo "alert('".$this->request->get['mesaj']."')";
            }
        ?>
    })


</script>






<style>
	#mantik-cumlesi{
		padding: 5px;
		font-size: 14px;
	}
	#ve-baglaci{
		font-size: 18px;
		font-weight: bold;
		width: 250px;
	}

	#etkilenecek-urunsayisi-div{
		font-size: 24px;
	}
</style>



