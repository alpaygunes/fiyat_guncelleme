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
		<div class="well">
			<div class="table-responsive">
				<div class="col-sm-12">
					<div class="form-group">
						<label class="control-label" for="input-order-status" style="font-size: 16px">
							Tüm mağazalardaki eski müşteri resimlerini kaldır !
						</label>
						<input type="text"
							   style="font-size: 16px;height: 32px"
							   id="son-x-gun"  class="form-control"
							   placeholder="Son X gün den öncekileri sil.">
					</div>
					<div class="label label-danger">Son siparişlerin resimlerini almadan denemeyin !</div>
					<div class="btn btn-primary pull-right"  id="temizle">Temizle</div>
				</div>
			</div>
		</div>
	</div>
	<div id="liste-yertutucu" class="row table-responsive">

	</div>

</div>


<?php echo $footer; ?>

<script>
	$('#son-x-gun').keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    })

    $('#son-x-gun').change(function () {
        deger = $(this).val();
        if(deger<10){
            $(this).val(10);
        }
    })

    $('#temizle').click(function () {
        deger = $(this).val();
        if(deger<10){
            $(this).val(10);
        }else{
            //silmek için ajax
            son_x_gun		= $('#son-x-gun').val();
            $.ajax({
                url: 'index.php?route=ortakpanel/araclar/musteriResimleriniTemizle&token=<?php echo $token; ?>&son_x_gun='+son_x_gun,
                beforeSend: function(){
                    $('#temizle').empty().html('<i class="fa fa-cog fa-lg fa-spin"></i>').attr('disabled','disabled');
                },
                type: 'get',
                dataType: 'json',
				complete: function () {
                    $('#temizle').empty().html('Temizle').removeAttr('disabled');
                },
                success: function(json) {
                    $('#liste-yertutucu').empty();
                    $.each(json, function( index, value ) {
                        console.log( index + ": " + value);
                        $('#liste-yertutucu').append('<div class="sonuc-li">'
							+value[0]+'<span class="pull-right"> Silinen dosya sayısı : '+value[1]+'</span></div>');

                    });
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    if (xhr.status != 0) { alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText); }
                    $('#temizle').empty().html('<span><?php echo $button_submit; ?></span>').removeAttr('disabled');
                }
            });
        }
    })


</script>


<style>
	.sonuc-li{
		border:1px;
		margin: 2px;
		border: 1px solid #ccc;
		margin-left: 50px;
		padding: 3px;
		width: 400px;
	}

	.sonuc-li span{
		font-size: 14px;

	}

	.liste-yertutucu{

	}
</style>