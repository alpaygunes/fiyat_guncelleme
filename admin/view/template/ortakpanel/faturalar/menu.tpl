<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<link type="text/css" href="admin/view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>



<?php if(isset($fatura_sablonlari)){ ?>
<div id="secenekler">
    <select id="sablonlar" class="form-control">
      <option value="menu.tpl">Bir şablon seçin</option>
      <?php foreach($fatura_sablonlari as $sablon){ ?>
      <option value="<?php echo $sablon ?>"><?php echo $sablon ?></option>
      <?php }?>
    </select>
</div>
<?php }?>

<script>
    $('#sablonlar').change(function () {
        sablon = $("#sablonlar option:selected").val();
        window.open(window.location.href+"&sablon_adi="+sablon);
    })
</script>

</body>

<style>
  #secenekler{
    width: 400px;
    height: 175px;
    margin-left: auto;
    margin-right: auto;
    position: relative;
    display: block;
    margin-top: 10%;
    border: 10px solid #ccc;
    padding: 50px;
  }
</style>
</html>