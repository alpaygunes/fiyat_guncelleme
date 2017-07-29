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

<?php

// FİAYI YAZIYA DÖNÜŞTÜRME
//Bu kodlar java ile yazdığım kodlardan php için bir çeviridir. Java versiyonunu kaynak kodlarda bulabilirsiniz. Projelerinizde özgürce kullanabilirsiniz. (GPLv3 Lisanslıdır.)

// Sayıyı yazıya çevirme (Kuruşlu ve sınırsız basamaklı, Örneğin: binyüzseksen TL onbeş Kuruş, ayrıca istediğiniz yabancı dile entegre edebilirsiniz.)
// Örnek kullanım şekli :
// $yaziyla = sayiyiYaziyaCevir(123456.67, 2, "TL", "Kr", "#", null, null, null);
// Çıktısı şöyle olacak : #yüzyirmiüçbindörtyüzellialtı TL altmışyedi Kr#

function sayiyiYaziyaCevir($sayi, $kurusbasamak, $parabirimi, $parakurus, $diyez, $bb1, $bb2, $bb3) {
// kurusbasamak virgülden sonra gösterilecek basamak sayısı
// parabirimi = TL gibi , parakurus = Kuruş gibi
// diyez başa ve sona kapatma işareti atar # gibi

$b1 = array("", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz");
$b2 = array("", "on", "yirmi", "otuz", "kırk", "elli", "altmış", "yetmiş", "seksen", "doksan");
$b3 = array("", "yüz", "bin", "milyon", "milyar", "trilyon", "katrilyon");

if ($bb1 != null) { // farklı dil kullanımı yada farklı yazım biçimi için
$b1 = $bb1;
}
if ($bb2 != null) { // farklı dil kullanımı
$b2 = $bb2;
}
if ($bb3 != null) { // farklı dil kullanımı
$b3 = $bb3;
}

$say1="";
$say2 = ""; // say1 virgül öncesi, say2 kuruş bölümü
$sonuc = "";

$sayi = str_replace(",", ".",$sayi); //virgül noktaya çevrilir

$nokta = strpos($sayi,"."); // nokta indeksi

if ($nokta>0) { // nokta varsa (kuruş)

$say1 = substr($sayi,0, $nokta); // virgül öncesi
$say2 = substr($sayi,$nokta, strlen($sayi)); // virgül sonrası, kuruş

} else {
$say1 = $sayi; // kuruş yoksa
}

$son;
$w = 1; // işlenen basamak
$sonaekle = 0; // binler on binler yüzbinler vs. için sona bin (milyon,trilyon...) eklenecek mi?
$kac = strlen($say1); // kaç rakam var?
$sonint; // işlenen basamağın rakamsal değeri
$uclubasamak = 0; // hangi basamakta (birler onlar yüzler gibi)
$artan = 0; // binler milyonlar milyarlar gibi artışları yapar
$gecici;

if ($kac > 0) { // virgül öncesinde rakam var mı?

for ($i = 0; $i < $kac; $i++) {

$son = $say1[$kac - 1 - $i]; // son karakterden başlayarak çözümleme yapılır.
$sonint = $son; // işlenen rakam Integer.parseInt(

if ($w == 1) { // birinci basamak bulunuyor

$sonuc = $b1[$sonint] . $sonuc;

} else if ($w == 2) { // ikinci basamak

$sonuc = $b2[$sonint] . $sonuc;

} else if ($w == 3) { // 3. basamak

if ($sonint == 1) {
$sonuc = $b3[1] . $sonuc;
} else if ($sonint > 1) {
$sonuc = $b1[$sonint] . $b3[1] . $sonuc;
}
$uclubasamak++;
}

if ($w > 3) { // 3. basamaktan sonraki işlemler

if ($uclubasamak == 1) {

if ($sonint > 0) {
$sonuc = $b1[$sonint] . $b3[2 + $artan] . $sonuc;
if ($artan == 0) { // birbin yazmasını engelle
$sonuc = str_replace($b1[1] . $b3[2], $b3[2],$sonuc);
}
$sonaekle = 1; // sona bin eklendi
} else {
$sonaekle = 0;
}
$uclubasamak++;

} else if ($uclubasamak == 2) {

if ($sonint > 0) {
if ($sonaekle > 0) {
$sonuc = $b2[$sonint] . $sonuc;
$sonaekle++;
} else {
$sonuc = $b2[$sonint] . $b3[2 + $artan] . $sonuc;
$sonaekle++;
}
}
$uclubasamak++;

} else if ($uclubasamak == 3) {

if ($sonint > 0) {
if ($sonint == 1) {
$gecici = $b3[1];
} else {
$gecici = $b1[$sonint] . $b3[1];
}
if ($sonaekle == 0) {
$gecici = $gecici . $b3[2 + $artan];
}
$sonuc = $gecici . $sonuc;
}
$uclubasamak = 1;
$artan++;
}

}

$w++; // işlenen basamak

}
} // if(kac>0)

if ($sonuc=="") { // virgül öncesi sayı yoksa para birimi yazma
$parabirimi = "";
}

$say2 = str_replace(".", "",$say2);
$kurus = "";

if ($say2!="") { // kuruş hanesi varsa

if ($kurusbasamak > 3) { // 3 basamakla sınırlı
$kurusbasamak = 3;
}
$kacc = strlen($say2);
if ($kacc == 1) { // 2 en az
$say2 = $say2."0"; // kuruşta tek basamak varsa sona sıfır ekler.
$kurusbasamak = 2;
}
if (strlen($say2) > $kurusbasamak) { // belirlenen basamak kadar rakam yazılır
$say2 = substr($say2,0, $kurusbasamak);
}

$kac = strlen($say2); // kaç rakam var?
$w = 1;

for ($i = 0; $i < $kac; $i++) { // kuruş hesabı

$son = $say2[$kac - 1 - $i]; // son karakterden başlayarak çözümleme yapılır.
$sonint = $son; // işlenen rakam Integer.parseInt(

if ($w == 1) { // birinci basamak

if ($kurusbasamak > 0) {
$kurus = $b1[$sonint] . $kurus;
}

} else if ($w == 2) { // ikinci basamak
if ($kurusbasamak > 1) {
$kurus = $b2[$sonint] . $kurus;
}

} else if ($w == 3) { // 3. basamak
if ($kurusbasamak > 2) {
if ($sonint == 1) { // 'biryüz' ü engeller
$kurus = $b3[1] . $kurus;
} else if ($sonint > 1) {
$kurus = $b1[$sonint] . $b3[1] . $kurus;
}
}
}
$w++;
}
if ($kurus=="") { // virgül öncesi sayı yoksa para birimi yazma
$parakurus = "";
} else {
$kurus = $kurus . " ";
}
$kurus = $kurus . $parakurus; // kuruş hanesine 'kuruş' kelimesi ekler
}

$sonuc = $diyez . $sonuc . " " . $parabirimi . " " . $kurus . $diyez;
return $sonuc;
}

// FİAYI SAYIYA DÖNÜŞTİRME SON






//var_dump($orders[0]['total']);
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

$toplam             = tofloat($orders[0]['total'][count($orders[0]['total'])-1]['text']);
$atoplam            = $toplam/1.08;
$kdv                = round($atoplam*0.08,2);
$toplam             = round($toplam,2);
$yaziyla            = "<strong>Yalnız :</strong><br>".sayiyiYaziyaCevir($toplam,2,"TL","Kr","",null,null,null);
$payment_address    = $orders[0]['payment_address'];
$tarih              = date("d/m/Y");










?>

<div class="kapsayici">

   <! ------------------------------   1. SÜTÜN ----------------------------------------- --!>
   <div class="sutun">

       <div class="ustbolum">
           <div class="adres">
               <?php echo $payment_address; ?>
           </div>
           <div class="tarih">
               <?php echo $tarih;?>
               <br>
               <?php echo $tarih;?>
           </div>
       </div>

       <div class="altbolum">
           <table style="width: 100%">
               <?php foreach ($orders[0]['product'] as $product) { ?>
                   <tr>
                       <td style="width: 250px"> HEDİYELİK EŞYA </td>
                       <td style="width: 20px">8</td>
                       <td style="width: 30px;text-align: right">1</td>
                       <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                       <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                   </tr>
               <?php  break;
               } ?>
           </table>

           <table style="width:100%;
           text-align: right;
            position: absolute;
            bottom: 0">
               <tr>
                   <td style="text-align: left"><?php echo $yaziyla;?></td>
                   <td><?php echo "A.TOPLAM";?></td>
                   <td><?php echo number_format($atoplam, 2, ',', '.').' TL';?></td>
               </tr>
               <tr>
                   <td colspan="2">KDV</td>
                   <td><?php echo number_format($kdv, 2, ',', '.').' TL';?></td>
               </tr>
               <tr>
                   <td  colspan="2" >G.TOPLAM</td>
                   <td><?php  echo number_format($toplam, 2, ',', '.').' TL';?></td>
               </tr>
           </table>
       </div>

   </div>

    <! ------------------------------   2. SÜTÜN ----------------------------------------- --!>
    <div class="sutun" style="margin-left: 60px;margin-right: 40px;">

        <div class="ustbolum">
            <div class="adres">
                <?php echo $payment_address; ?>
            </div>
            <div class="tarih">
                <?php echo $tarih;?>
                <br>
                <?php echo $tarih;?>
            </div>
        </div>

        <div class="altbolum">
            <table style="width: 100%">
                <?php foreach ($orders[0]['product'] as $product) { ?>
                    <tr>
                        <td style="width: 250px"> HEDİYELİK EŞYA </td>
                        <td style="width: 20px">8</td>
                        <td style="width: 30px;text-align: right">1</td>
                        <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                        <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                    </tr>
                    <?php  break;
                } ?>
            </table>

            <table style="width:100%;
           text-align: right;
            position: absolute;
            bottom: 0">
                <tr>
                    <td style="text-align: left"><?php echo $yaziyla;?></td>
                    <td><?php echo "A.TOPLAM";?></td>
                    <td><?php echo number_format($atoplam, 2, ',', '.').' TL';?></td>
                </tr>
                <tr>
                    <td colspan="2">KDV</td>
                    <td><?php echo number_format($kdv, 2, ',', '.').' TL';?></td>
                </tr>
                <tr>
                    <td  colspan="2" >G.TOPLAM</td>
                    <td><?php  echo number_format($toplam, 2, ',', '.').' TL';?></td>
                </tr>
            </table>
        </div>

    </div>

    <! ------------------------------   3. SÜTÜN ----------------------------------------- --!>
    <div class="sutun">

        <div class="ustbolum">
            <div class="adres">
                <?php echo $payment_address; ?>
            </div>
            <div class="tarih">
                <?php echo $tarih;?>
                <br>
                <?php echo $tarih;?>
            </div>
        </div>

        <div class="altbolum">
            <table style="width: 100%">
                <?php foreach ($orders[0]['product'] as $product) { ?>
                    <tr>
                        <td style="width: 250px"> HEDİYELİK EŞYA </td>
                        <td style="width: 20px">8</td>
                        <td style="width: 30px;text-align: right">1</td>
                        <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                        <td style="width: 100px;text-align: right"><?php echo number_format($atoplam, 2, ',', '.').' TL'; ?></td>
                    </tr>
                    <?php  break;
                } ?>
            </table>

            <table style="width:100%;
           text-align: right;
            position: absolute;
            bottom: 0">
                <tr>
                    <td style="text-align: left"><?php echo $yaziyla;?></td>
                    <td><?php echo "A.TOPLAM";?></td>
                    <td><?php echo number_format($atoplam, 2, ',', '.').' TL';?></td>
                </tr>
                <tr>
                    <td colspan="2">KDV</td>
                    <td><?php echo number_format($kdv, 2, ',', '.').' TL';?></td>
                </tr>
                <tr>
                    <td  colspan="2" >G.TOPLAM</td>
                    <td><?php  echo number_format($toplam, 2, ',', '.').' TL';?></td>
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

    .adres{
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

    .tarih{
        display: block;
        width: 40%;
        height: 150px;
        border: 1px solid #ccc;
        text-align: left;
        vertical-align: middle;
        position: absolute;
        left: 60%;
        bottom:0;
        padding-left: 50px;
        line-height: 30px;
    }



</style>

</html>


