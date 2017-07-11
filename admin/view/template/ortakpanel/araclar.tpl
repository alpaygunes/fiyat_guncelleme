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
						<label class="control-label" for="input-order-status" style="font-size: 16px">Tüm mağazalardaki eski tasarımları kaldır !</label>
						<input type="text"
							   style="font-size: 16px;height: 32px"
							   id="son-x-gun"  class="form-control"
							   placeholder="Son X gün den öncekileri sil.">
					</div>
					<div class="btn btn-primary pull-right"  id="temizle">Temizle</div>
				</div>
			</div>
		</div>
		<div id="liste-yertutucu">

		</div>
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
        if(deger<20){
            $(this).val(20);
        }
    })

    $('#temizle').click(function () {
        deger = $(this).val();
        if(deger<20){
            $(this).val(20);
        }
    })
</script>