<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <meta charset="UTF-8" />
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content="<?php echo $keywords; ?>" />
  <?php } ?>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
  <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>



  <!-------------- alpaygunes -------------  bootstraptan önce olması lazımış          -->
  <script src="view/javascript/admin_tasarla/jquery-ui.js"></script>
  <!-------------- alpaygunes --------------->



  <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
  <link href="view/stylesheet/bootstrap.css" type="text/css" rel="stylesheet" />
  <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
  <link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
  <script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
  <script src="view/javascript/jquery/datetimepicker/moment.js" type="text/javascript"></script>
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="screen" />
  <?php foreach ($styles as $style) { ?>
  <link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <script src="view/javascript/common.js" type="text/javascript"></script>
  <?php foreach ($scripts as $script) { ?>
  <script type="text/javascript" src="<?php echo $script; ?>"></script>
  <?php } ?>


  <!--   ---------------      alpaygunes         ------------------ -->

  <script type="text/javascript" src="view/javascript/admin_tasarla/admin_tasarla.js"></script>
  <link type="text/css" href="view/stylesheet/admin_tasarla/admin_tasarla.css" rel="stylesheet" media="screen" />
  <link type="text/css" href="view/stylesheet/admin_tasarla/kendin_tasarla_onyuz.css" rel="stylesheet" media="screen" />

  <!--   curve text için -->
  <script type="text/javascript" src="view/javascript/admin_tasarla/curve_text.js"></script>

  <!--   content render için -->
  <script type="text/javascript" src="view/javascript/admin_tasarla/content_render_admin.js"></script>
  <script type="text/javascript" src="view/javascript/admin_tasarla/kirpici_admin.js"></script>
  <script type="text/javascript" src="view/javascript/admin_tasarla/resim_ekleme_ortakpanel.js"></script>
  <script type="text/javascript" src="view/javascript/admin_tasarla/siparis_text_duzenle.js"></script>


  <!--   Dragable -->




  <!-- resize için gerkli -->
  <link rel="stylesheet" href="view/javascript/admin_tasarla/jquery-ui.css">

  <!--   resizable -->
  <script src="view/javascript/admin_tasarla/jquery-ui-rotatable-master/jquery.ui.rotatable.js"></script>
  <link rel="stylesheet" href="view/javascript/admin_tasarla/jquery-ui-rotatable-master/jquery.ui.rotatable.css">

  <!--   dokunmatik ekranlar için -->
  <script src="view/javascript/admin_tasarla/jquery.ui.touch-punch.min.js"></script>


  <!--   color picker -->

  <script type="text/javascript" src="view/javascript/admin_tasarla/farbtastic/farbtastic.js"></script>
  <link rel="stylesheet" href="view/javascript/admin_tasarla/farbtastic/farbtastic.css" type="text/css" />

  <!--   javascript objesini json yapan fonsiyon

  <script type="text/javascript" src="view/javascript/JSON-js-master/"></script> -->

  <!----                     alpaygunes son---------- -----------  -->


</head>
<body>
<div id="container">
  <header id="header" class="navbar navbar-static-top">
    <div class="navbar-header">
      <?php if ($logged) { ?>
      <a type="button" id="button-menu" class="pull-left"><i class="fa fa-indent fa-lg"></i></a>
      <?php } ?>
      <a href="<?php echo $home; ?>" class="navbar-brand"><img src="view/image/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" /></a></div>
    <?php if ($logged) { ?>
    <ul class="nav pull-right">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger pull-left"><?php echo $alerts; ?></span> <i class="fa fa-bell fa-lg"></i></a>
        <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">
          <li class="dropdown-header"><?php echo $text_order; ?></li>
          <li><a href="<?php echo $processing_status; ?>" style="display: block; overflow: auto;"><span class="label label-warning pull-right"><?php echo $processing_status_total; ?></span><?php echo $text_processing_status; ?></a></li>
          <li><a href="<?php echo $complete_status; ?>"><span class="label label-success pull-right"><?php echo $complete_status_total; ?></span><?php echo $text_complete_status; ?></a></li>
          <li><a href="<?php echo $return; ?>"><span class="label label-danger pull-right"><?php echo $return_total; ?></span><?php echo $text_return; ?></a></li>
          <li class="divider"></li>
          <li class="dropdown-header"><?php echo $text_customer; ?></li>
          <li><a href="<?php echo $online; ?>"><span class="label label-success pull-right"><?php echo $online_total; ?></span><?php echo $text_online; ?></a></li>
          <li><a href="<?php echo $customer_approval; ?>"><span class="label label-danger pull-right"><?php echo $customer_total; ?></span><?php echo $text_approval; ?></a></li>
          <li class="divider"></li>
          <li class="dropdown-header"><?php echo $text_product; ?></li>
          <li><a href="<?php echo $product; ?>"><span class="label label-danger pull-right"><?php echo $product_total; ?></span><?php echo $text_stock; ?></a></li>
          <li><a href="<?php echo $review; ?>"><span class="label label-danger pull-right"><?php echo $review_total; ?></span><?php echo $text_review; ?></a></li>
          <li class="divider"></li>
          <li class="dropdown-header"><?php echo $text_affiliate; ?></li>
          <li><a href="<?php echo $affiliate_approval; ?>"><span class="label label-danger pull-right"><?php echo $affiliate_total; ?></span><?php echo $text_approval; ?></a></li>
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-life-ring fa-lg"></i></a>
        <ul class="dropdown-menu dropdown-menu-right">
          <li class="dropdown-header"><?php echo $text_store; ?> <i class="fa fa-shopping-cart"></i></li>
          <?php foreach ($stores as $store) { ?>
          <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
          <?php } ?>
          <li class="divider"></li>
          <li class="dropdown-header"><?php echo $text_help; ?> <i class="fa fa-life-ring"></i></li>
          <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_homepage; ?></a></li>
          <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
          <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
        </ul>
      </li>
      <li><a href="<?php echo $logout; ?>"><span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span> <i class="fa fa-sign-out fa-lg"></i></a></li>
    </ul>
    <?php } ?>
  </header>
