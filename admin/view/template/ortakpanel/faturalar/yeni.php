<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <meta charset="UTF-8" />
  <title><?php echo $title; ?></title>
  <link href="view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="all" />
  <script type="text/javascript" src="view/javascript/jquery/jquery-2.1.1.min.js"></script>
  <script type="text/javascript" src="view/javascript/bootstrap/js/bootstrap.min.js"></script>
  <link href="view/javascript/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
  <link type="text/css" href="view/stylesheet/stylesheet.css" rel="stylesheet" media="all" />
</head>
<body>



<div class="kapsayici">
   <div class="sutun">
       <div class="ustbolum">
           <div id="adres">
               FAZLI GEZMİŞ <br>
               gezmiş yapı dekorasyon<br />
               atalar mah. üsküdar cad. no:104/c<br />
               kartal 34862<br />
               İstanbul 5312247274
           </div>
       </div>

       <div class="altbolum">
           <table style="width: 100%">
               <?php foreach ($orders[0]['product'] as $product) { ?>
                   <tr>
                       <td style="width: 250px"> HEDİYELİK EŞYA </td>
                       <td style="width: 20px">8</td>
                       <td style="width: 30px;text-align: right">1</td>
                       <td style="width: 100px;text-align: right"><?php echo $product['price']; ?></td>
                       <td style="width: 100px;text-align: right"><?php echo $product['total']; ?></td>
                   </tr>
               <?php } ?>
           </table>

           <?php
               function tofloat($num) {
                   $dotPos = strrpos($num, '.');
                   $commaPos = strrpos($num, ',');
                   $sep = (($dotPos > $commaPos) && $dotPos) ? $dotPos :
                       ((($commaPos > $dotPos) && $commaPos) ? $commaPos : false);

                   if (!$sep) {
                       return floatval(preg_replace("/[^0-9]/", "", $num));
                   }

                   return floatval(
                       preg_replace("/[^0-9]/", "", substr($num, 0, $sep)) . '.' .
                       preg_replace("/[^0-9]/", "", substr($num, $sep+1, strlen($num)))
                   );
               }

                $toplam  = tofloat($orders[0]['total'][4]['text']);
                $atoplam = round($toplam/1.08,2);
                $kdv     = round($atoplam*0.08,2);
           ?>


           <table style="width:100%;
           text-align: right;
            position: absolute;
            bottom: 0">
               <tr>
                   <td><?php echo "A.TOPLAM";?></td>
                   <td><?php echo $atoplam;?></td>
               </tr>
               <tr>
                   <td>KDV</td>
                   <td><?php echo $kdv;?></td>
               </tr>
               <tr>
                   <td>G.TOPLAM</td>
                   <td><?php  echo $toplam;?></td>
               </tr>
           </table>
       </div>
   </div>
</div>
</body>

<style>
    body{
        font-size: 12px;
    }
    .kapsayici{
        width: 100%;
        height: 100%;
        position: relative;
        float: left;
        border: 1px solid #ccc;
    }
    .sutun{
        width: 30%;
        height: 100%;
        position: relative;
        float: left;
        border: 1px solid #ccc;
    }
    .ustbolum{
        width: 100%;
        height: 40%;
        position: relative;
        float: left;
        border: 1px solid #ccc;
    }
    .altbolum{
        width: 100%;
        height: 50%;
        position: relative;
        float: left;
        border: 1px solid #ccc;
        margin-top: 10px;
    }

    #adres{
        display: block;
        width: 60%;
        height: 150px;
        border: 1px solid #ccc;
        text-align: center;
        vertical-align: middle;
        position: absolute;
        left: 0;
        bottom:0;
     }



</style>

</html>


