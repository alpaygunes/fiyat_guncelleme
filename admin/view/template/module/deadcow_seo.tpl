<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" onclick="$('#form').submit();" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
	  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
	
	
	  <div class="container-fluid">
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-exclamation-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
<div class="box">
    <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>

        <div class="buttons"><a onclick="location = '<?php echo $cancel; ?>';"
                                class="button"><span><?php echo $back; ?></span></a></div>
    </div>
    <div class="content">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
            <table class="form">
                <tr>
                    <td><?php echo $source_language;?></td>
                    <td>
					<br />
                        <select name="source_language_code" id="source_language_code" >
                            <?php foreach ($languages as $language) {
                                echo '<option value="' . $language['code'] . '"' . ($language['code']==$source_language_code?' selected="selected"':'') . '>' . $language['name'] . '</option>';
                            }?>
                        </select>
						<br /><br />
                    </td>
                </tr>
                <tr>
				
                    <td><?php echo $categories;?></td>
                    <td>
                        <label for="categories_template"><?php echo $template;?> </label><input type="text" id="categories_template" name="categories_template" value="<?php echo $categories_template;?>" size="80">
                        <div class="template-info"><?php echo $available_category_tags;?></div>
                       
                      <button type="submit" name="categories" value="categories" data-toggle="tooltip" title="<?php echo $generate;?>" class="btn btn-primary"><i class="fa fa-pencil"></i></button><br />
					  <?php echo $warning_clear;?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $products;?></td>
                    <td>
                        <label for="products_template"><?php echo $template;?> </label><input type="text" id="products_template" name="products_template" value="<?php echo $products_template;?>" size="80"><br/>
                        <div class="template-info"><?php echo $available_product_tags;?></div>
                        <button type="submit" name="products" value="products" data-toggle="tooltip" title="<?php echo $generate;?>" class="btn btn-primary"><i class="fa fa-pencil"></i></button><br />  



					   <?php echo $warning_clear;?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $manufacturers;?></td>
                    <td>
                        <label for="manufacturers_template"><?php echo $template;?> </label><input type="text" id="manufacturers_template" name="manufacturers_template" value="<?php echo $manufacturers_template;?>" size="80"><br/>
                        <div class="template-info"><?php echo $available_manufacturer_tags;?></div>                       
                        <button type="submit" name="manufacturers" value="manufacturers" data-toggle="tooltip" title="<?php echo $generate;?>" class="btn btn-primary"><i class="fa fa-pencil"></i></button><br />

					   <?php echo $warning_clear;?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $meta_keywords;?></td>
                    <td>
                        <label for="meta_template"><?php echo $template;?> </label><input type="text" id="meta_template" name="meta_template" value="<?php echo $meta_template;?>" size="80"><br/>
                        <div class="template-info"><?php echo $available_meta_tags;?></div><br/>
                        <?php if (in_array('curl', get_loaded_extensions())) {?>
                        <input type="checkbox" name="yahoo_checkbox"<?php if ($yahoo_checkbox==1) echo 'checked="checked"';?>><?php echo $add_from_yahoo;?><br/>
                        <label for="yahoo_id"><?php echo $your_yahoo_id;?> </label><input type="text" id="yahoo_id" name="yahoo_id" value="<?php echo $yahoo_id;?>" size="80"><br/>
                        <div class="template-info"><?php echo $get_yahoo_id;?></div><br/>
                        <?php } else {?>
                        <div><?php echo $curl_not_enabled;?></div>
                        <input type="hidden" id="yahoo_id" name="yahoo_id" value="">
                        <?php } ?>
                   
						<button type="submit" name="meta_keywords" value="meta_keywords" data-toggle="tooltip" title="<?php echo $generate;?>" class="btn btn-primary"><i class="fa fa-pencil"></i></button><br />
                        <?php echo $warning_clear;?>
                    </td>
                </tr>
                <tr>
                    <td><?php echo $tags;?></td>
                    <td>
                        <label for="tags_template"><?php echo $template;?> </label><input type="text" id="tags_template" name="tags_template" value="<?php echo $tags_template;?>" size="80"><br/>
                        <div class="template-info"><?php echo $available_tags_tags;?></div>
                      
							<button type="submit" name="tags" value="tags" data-toggle="tooltip" title="<?php echo $generate;?>" class="btn btn-primary"><i class="fa fa-pencil"></i></button><br />
                        <?php echo $warning_clear_tags;?>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</div>

<?php echo $footer; ?>
