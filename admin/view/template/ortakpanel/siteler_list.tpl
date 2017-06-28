<div class="table-responsive">
	<table class="table table-bordered table-hover">
		<thead>
		<tr>
			<td  style="width: 100px">
				Sıra No
			</td>
			<td>
				Site URL
			</td>
			<td>
				İşlem
			</td>
		</tr>
		</thead>
		<tbody>
		<?php
		$sayac = 1;
		foreach ($siteler as $site) { ?>
		<tr>
			<td>
				<?php echo $sayac++;?>
			</td>
			<td>
				<?php echo $site['site_url'];?>
			</td>
			<td class="text-right" style="width: 100px">
				<button type="button"
						site_url="<?php echo $site['site_url'];?>"
						site_id="<?php echo $site['ortakpanel_bayi_siteleri_id'];?>" class="btn btn-primary duzenle"><i class="fa fa-pencil"></i></button>
				<button type="button"
						site_url="<?php echo $site['site_url'];?>"
						site_id="<?php echo $site['ortakpanel_bayi_siteleri_id'];?>" class="btn btn-danger sil"><i class="fa fa-trash-o"></i></button>
			</td>
		</tr>
		<?php } ?>
		</tbody>
	</table>
</div>