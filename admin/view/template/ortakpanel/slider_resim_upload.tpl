<?php echo $header; ?><?php echo $column_left; ?>
	<div id="content">
	<form id="myform"
		  method="POST" enctype="multipart/form-data" class="form-horizontal">
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
						<label class="control-label" for="input-hedef-site" style="font-size: 16px">Hedef mağaza</label>
							  <select id="input-hedef-site" name="hedef_site" class="form-control" style="font-size: 24px;height: 64px">
								  <?php foreach($siteler as $site){ ?>
								  <option value="http://<?php echo $site['site_url'];?>"><?php echo $site['site_url'];?></option>
								  <?php }?>
							  </select>
						<br>
						<label class="control-label" for="input-hedef-dizin" style="font-size: 16px">Hedef dizin</label>
						<input type="text" name="hedef_dizin"  style="font-size: 24px;height: 64px" class="form-control"
                               id="input-hedef-dizin"  value="image/agslide">
					</div>
				</div>
			</div>
	  </div>

	  <table class="table table-bordered table-responsive">
		  <tr>
			  <td>agslider0.jpg</td>
			  <td>
				  <input type="file" name="resim0" id="resim0">
			  </td>  
		  </tr>
		  <tr>
			  <td>agslider2.jpg</td>
			  <td>
				  <input type="file" name="resim1" id="resim1">
			  </td>
		  </tr>
		  <tr>
			  <td>agslider3.jpg</td>
			  <td>
				  <input type="file" name="resim2" id="resim2">
			  </td>
		  </tr>
		  <tr>
			  <td>agslider4.jpg</td>
			  <td>
				  <input type="file" name="resim3" id="resim3">
			  </td>
		  </tr>
		  <tr>
			  <td>agslider5.jpg</td>
			  <td>
				  <input type="file" name="resim4" id="resim4">
			  </td>
		  </tr>
		  <tr>
			  <td>agslider6.jpg</td>
			  <td>
				  <input type="file" name="resim5" id="resim5">
			  </td>
		  </tr>
		  <tr>
			  <td>agslider7.jpg</td>
			  <td>
				  <input type="file" name="resim6" id="resim6">
			  </td> 
		  </tr>
          <tr>
              <td>agslider8.jpg</td>
              <td>
                  <input type="file" name="resim6" id="resim6">
              </td>
          </tr>
          <tr>
              <td>agslider9.jpg</td>
              <td>
                  <input type="file" name="resim6" id="resim6">
              </td>
          </tr>
          <tr>
              <td>agslider10.jpg</td>
              <td>
                  <input type="file" name="resim6" id="resim6">
              </td>
          </tr>
	  </table>


  	</div>

	<div class="well">
		<div class="table-responsive">
			<div class="col-sm-12">
				 <input type="button" id="gonder" value="Gönder" class="btn btn-primary">
			</div>
		</div>
	</div>
	</form>
</div>

<style>
    .glyphicon-ok{
        font-size:18px;
    }
</style>


<script language="JavaScript1.2">
	$('#gonder').click(function () {
        $hedef_site 	= $('#input-hedef-site  option:selected').text();
        hedef_url 		= 'http://'+$hedef_site+"/index.php?route=ortakpanel_bayi/order/sliderresimupload"
        var data = new FormData(jQuery('form')[0]);
        jQuery.ajax({
            url: hedef_url,
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            crossDomain: true,
            type: 'POST',
            success: function(data){
               alert("Resimler gönderildi.");
            }
        });
    })
</script>


<?php echo $footer; ?>