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
	<?php
		//print_r($ayarlar);
	?>
	  <div class="well">
		  <div class="table-responsive">
			  <div class="col-sm-12">
				  <div class="form-group">
					  <label class="control-label" for="input-order-status" style="font-size: 24px">Yeni Site</label>
					  <input type="text"
							 style="font-size: 22px;height: 64px"
							 id="site-url"  class="form-control" placeholder="Site URL sini http:// olmadan yazın">
				  </div>
				  <div class="btn btn-primary pull-right"  id="site-ekle">Ekle</div>
			  </div>
		  </div>
	  </div>
	  <div id="liste-yertutucu">

	  </div>
  </div>
</div>

<script language="JavaScript1.2">
    //siteyi kaydet
    $('#site-ekle').click(function () {
        site_url	= $('#site-url').val();
        site_url_eki='';
        if(site_id!=null) {
			site_url_eki = '&site_id='+site_id
        }
        url	= '<?php echo $siteekleurl;?>'+'&site_url='+site_url+site_url_eki;
        var url = url.replace("&amp;", "&");
        $.ajax({
            url: url,
            dataType: 'html',
            beforeSend: function() {
                $('#site-ekle').button('loading');
            },
            complete: function() {
                $('#site-ekle').button('reset');
            },
            success: function(data) {
                console.log(data);
                getSiteler();
                $('#site-url').val('');
                $('#site-ekle').html('Kaydet');
                site_id=null;
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert("Site kaydedilmedi ");
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });

    })




	function getSiteler() {
        url	= '<?php echo $getsiteurl;?>';
        var url = url.replace("&amp;", "&");
        $.ajax({
            url: url,
            dataType: 'html',
            beforeSend: function() {
            },
            complete: function() {
            },
            success: function(data) {
                $('#liste-yertutucu').html();
                $('#liste-yertutucu').html(data);
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert("Siteler yüklenirken hata oldu ");
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }

    $(document).ready(function () {
        getSiteler();
    })


	var site_id=null;
	$(document).on('click','.duzenle',function () {
		site_id	= $(this).attr('site_id');
        site_url	= $(this).attr('site_url');
        $('#site-url').val(site_url);
        $('#site-ekle').html('Değişikliği Kaydet');
    })


    $(document).on('click','.sil',function () {
        site_id		= $(this).attr('site_id');
        site_url	= $(this).attr('site_url');
        url			= '<?php echo $silsiteurl;?>'+'&site_id='+site_id;
        var url = url.replace("&amp;", "&");
        $.ajax({
            url: url,
            dataType: 'json',
            beforeSend: function() {
            },
            complete: function() {
            },
            success: function(data) {
                getSiteler();
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert("Site  siliniyorken hata oldu ");
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    })

</script>


<?php echo $footer; ?>