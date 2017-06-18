﻿<!--  alpaygunes.com  ------------------------------------------------------ -->
<!--  alpaygunes.com  ------------------------------------------------------ -->

<?php
    //renkler
    $renkler = array();
    $renkler[] = "#000000";//siyah
    $renkler[] = "#cccccc";//grii
    $renkler[] = "#ffffff";//beyaz
    $renkler[] = "#ff0000";//kırmızı
    $renkler[] = "#00ff00";//yeşil
    $renkler[] = "#0000ff";//mavi
    $renkler[] = "#8A2BE2";//mor
    $renkler[] = "#FFC1C1";//a.pembe
    $renkler[] = "#EE3B3B";//turanj
    $renkler[] = "#FF7F24";//turuncu
    $renkler[] = "#20B2AA";//mavimsi
    $renkler[] = "#F08080";//b.pembe
    $renkler[] = "#FF1493";//k.pembe
    $renkler[] = "#CD1076";//k.pembe
    $renkler[] = "#D02090";//k.pembe
    $renkler[] = "#8B3626";//k.pembe
    $renkler[] = "#9932CC";//k.pembe
    $renkler[] = "#FF00FF";//k.pembe
    $renkler[] = "#EE82EE";//k.pembe
    $renkler[] = "#1C86EE";//k.pembe
?>
<style>
    .kontroller tr td{
        height: 25px!important;
        font-size: 10px!important;
    }
</style>
<div id="tasarim-alani" style="overflow: auto">
        <table class="table table-bordered">
                <tr>
                    <td>
                            <div style="overflow: auto;max-width: 850px" id="cnv_container">

                            </div>
                    </td>
                    <td width="250px" style="vertical-align: top">


                        <!--   ------------------------------------PANEL --->
                        <div class="bs-example">
                            <ul class="nav nav-tabs">
                                <li class="active" id="tab-ekle"><a data-toggle="tab" href="#sectionAA">Ekle</a></li>
                                <li id="tab-duzenle"><a data-toggle="tab" href="#sectionBB">Düzenle</a></li>
                            </ul>
                            <!--   ------------------------------------PANEL 1  --->
                            <div class="tab-content">
                                <div id="sectionAA" class="tab-pane fade in active">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td>
                                                <select id="olcekle" class="form-control">
                                                    <option value="1">Ölçek oranı</option>
                                                    <option value="2">2x</option>
                                                    <option value="3">3x</option>
                                                    <option value="4">4x</option>
                                                    <option value="5">5x</option>
                                                    <option value="6">6x</option>
                                                    <option value="7">7x</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a class="btn btn-primary" id="canvasi-indir">Kaydet</a>
                                                <div id="duzenle" class="btn btn-primary">Düzenle</div>
                                            </td>
                                        </tr>
                                    </table>

                                    <table class="table table-bordered kontroller" id="etiketler_gizle_goster">

                                    </table>
                                    <table class="table table-bordered kontroller" id="etiketler">

                                    </table>
                                </div>
                                <!--   ------------------------------------PANEL 2  --->
                                <div id="sectionBB" class="tab-pane fade">
                                    <table class="table">
                                        <tr>
                                            <td>
                                                <div class="btn btn-primary btn-xs dugme"
                                                     id="txt-sola-hizala">
                                                    <i class="fa fa-align-left icon-align-left"></i>
                                                </div>
                                                <div class="btn btn-primary  btn-xs dugme"
                                                     id="txt-ortaya-hizala">
                                                    <i class="fa fa-align-center icon-align-center"></i>
                                                </div>
                                                <div class="btn btn-primary btn-xs dugme"
                                                     id="txt-saga-hizala">
                                                    <i class="fa fa-align-right icon-align-right"></i>
                                                </div>
                                                <div class="btn btn-primary btn-xs dugme"
                                                     id="txt-font_style">
                                                    <i class="fa  fa-italic"></i>
                                                </div>
                                                <div class="btn btn-primary btn-xs dugme"
                                                     id="txt-bold">
                                                    <i class="fa  fa-bold"></i>
                                                </div>
                                                <div style="display: none" class="btn btn-primary btn-xs dugme"
                                                     id="txt-underline">
                                                    <i class="fa  fa-underline"></i>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td id="zemin_ayar_td">
                                                <input type="checkbox"
                                                       id ="zeminin_ustunde_olsun"
                                                       value="zeminin_ustunde_olsun">
                                                <label for="zeminin_ustunde_olsun">Zeminin üstünde olsun</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="txt-araci"
                                                       id ="dairesel_yazi_olsun"
                                                       value="dairesel_text"> <span class="txt-araci">Dairesel yazı olsun</span>
                                                <table class="table txt-araci" id="dairesel_yazi_parametreleri" style="display: none">
                                                    <tr>
                                                        <td>
                                                            Başlangıç açısı
                                                        </td>
                                                        <td width="100">
                                                            <input type="number" id="baslangic_acisi" class="form-control " value="0">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            Dış Yüz
                                                        </td>
                                                        <td>
                                                            <input type="checkbox" id="halkanin_icine_yaz" class="form-control" checked>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Karater Limiti</span>
                                                    <input type="number"
                                                           value="50"
                                                           id="karakter-limiti"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Font Türü</span>
                                                    <select class="form-control input-sm" id="font-listesi">

<option value="aa00912" style="font-family: aa00912;">aa00912</option>
<option value="aa00815" style="font-family: aa00815;">aa00815</option>
<option value="aa00619" style="font-family: aa00619;">aa00619</option>
<option value="aa00526" style="font-family: aa00526;">aa00526</option>
<option value="aa00616" style="font-family: aa00616;">00616</option>
<option value="taget" style="font-family: taget;">taget</option>
<option value="shyln" style="font-family: shyln;">shyln</option>
<option value="sagina" style="font-family: sagina;">sagina</option>
<option value="rakon" style="font-family: rakon;">rakon</option>
<option value="pirane" style="font-family: pirane;">pirane</option>
<option value="phyl" style="font-family: phyl;">phyl</option>
<option value="pasion" style="font-family: pasion;">pasion</option>
<option value="nuptu" style="font-family: nuptu;">nuptu</option>
<option value="mury" style="font-family: mury;">mury</option>
<option value="lucian" style="font-family: lucian;">lucian</option>
<option value="linus" style="font-family: linus;">linus</option>
<option value="juliet" style="font-family: juliet;">juliet</option>
<option value="Jellyka" style="font-family: Jellyka;">Jellyka</option>
<option value="Gravura" style="font-family: Gravura;">Gravura</option>
<option value="flems" style="font-family: flems;">flems</option>
<option value="Filxgirl" style="font-family: Filxgirl;">Filxgirl</option>
<option value="Expo" style="font-family: Expo;">Expo</option>
<option value="Enviro" style="font-family: Enviro;">Enviro</option>
<option value="Brush455BT" style="font-family: Brush455BT;">Brush455BT</option>
<option value="BrockScript" style="font-family: BrockScript;">BrockScript</option>
<option value="blackjar" style="font-family: blackjar;">blackjar</option>
<option value="amozon" style="font-family: amozon;">amozon</option>
<option value="adine" style="font-family: adine;">adine</option>
<option value="Shojumaru-Regular" style="font-family: Shojumaru-Regular;">Shojumaru-Regular</option>
<option value="Blazed" style="font-family: Blazed;">Blazed</option>
<option value="AveFedan" style="font-family: AveFedan;">AveFedan</option>
<option value="Bloody-Stump" style="font-family: Bloody-Stump;">Bloody-Stump</option>
<option value="CapricaSansItalicPersonalUse" style="font-family: CapricaSansItalicPersonalUse;">CapricaSansItalicPersonalUse</option>
<option value="carolingia" style="font-family: carolingia;">carolingia</option>
<option value="segoepr" style="font-family: segoepr;">segoepr</option>
<option value="segoeprb" style="font-family: segoeprb;">segoeprb</option>
<option value="Snap" style="font-family: Snap;">Snap</option>
<option value="wds011402" style="font-family: wds011402;">wds011402</option>
<option value="ChokoPlain" style="font-family: ChokoPlain;">ChokoPlain</option>
<option value="KaushanScript-Regular" style="font-family: KaushanScript-Regular;">KaushanScript-Regular</option>
<option value="VictorianD" style="font-family: VictorianD;">VICTORIAND</option>
<option value="Gabrielle" style="font-family: Gabrielle;">Gabrielle</option>
<option value="AGENTORANGE" style="font-family: AGENTORANGE;">AGENTORANGE</option>
<option value="AKADORA" style="font-family: AKADORA;">AKADORA</option>
<option value="akaDylanCollage" style="font-family: akaDylanCollage;">akaDylanCollage</option>
 <option value="akaDylanOpen" style="font-family: akaDylanOpen;">akaDylanOpen</option>
<option value="akaDylanPlain" style="font-family: akaDylanPlain;">akaDylanPlain</option>
<option value="Androgyne_TB" style="font-family: Androgyne_TB;">Androgyne_TB</option>
<option value="arial" style="font-family: arial;">arial</option>
<option value="BairamIt" style="font-family: BairamIt;">BairamIt</option>
<option value="banffn" style="font-family: banffn;">banffn</option>
<option value="Beckasin" style="font-family: Beckasin;">Beckasin</option>
<option value="Bira_PERSONAL_USE_ONLY" style="font-family: Bira_PERSONAL_USE_ONLY;">Bira_PERSONAL_USE_ONLY</option>
<option value="Blazed" style="font-family: Blazed;">Blazed</option>
<option value="BlueStone" style="font-family: BlueStone;">BlueStone</option>
<option value="BRUSHSCN" style="font-family: BRUSHSCN;">BRUSHSCN</option>
<option value="CACTUS" style="font-family: CACTUS;">CACTUS</option>
<option value="Chunky" style="font-family: Chunky;">Chunky</option>
<option value="comic" style="font-family: comic;">comic</option>
<option value="cour" style="font-family: cour;">cour</option>
<option value="crashtestshadow" style="font-family: crashtestshadow;">crashtestshadow</option>
<option value="Chunky" style="font-family: Chunky;">DEFECAFO</option>
<option value="DorovarCarolus" style="font-family: DorovarCarolus;">DorovarCarolus</option>
<option value="DuvallTR" style="font-family: DuvallTR;">DuvallTR</option>
<option value="FAFERS" style="font-family: FAFERS;">FAFERS</option>
<option value="floralie" style="font-family: floralie;">floralie</option>
<option value="GeorginasHandTürkceFont" style="font-family: GeorginasHandTürkceFont;">GeorginasHandTürkceFont</option>
<option value="impact" style="font-family: impact;">impact</option>
<option value="JandaManateeBubble" style="font-family: JandaManateeBubble;">JandaManateeBubble</option>
<option value="KingthingsLupine" style="font-family: KingthingsLupine;">KingthingsLupine</option>
<option value="MISTRAL" style="font-family: MISTRAL;">MISTRAL</option>
<option value="mtcorsva" style="font-family: mtcorsva;">mtcorsva</option>
<option value="OndineD" style="font-family: OndineD;">OndineD</option>
<option value="PoetsenOne-Regular" style="font-family: PoetsenOne-Regular;">PoetsenOne-Regular</option>
<option value="tt0351m_" style="font-family: tt0351m_;">tt0351m_</option>
<option value="RoteFlora" style="font-family: RoteFlora;">RoteFlora</option>
<option value="ScriptMTBold" style="font-family: ScriptMTBold;">ScriptMTBold</option>
<option value="segoepr" style="font-family: segoepr;">segoepr</option>
<option value="SketchRockwell-Bold_TR_cok_AZ" style="font-family: SketchRockwell-Bold_TR_cok_AZ;">SketchRockwell-Bold_TR_cok_AZ</option>
<option value="TACOBOX" style="font-family: TACOBOX;">TACOBOX</option>
<option value="tahoma" style="font-family: tahoma;">tahoma</option>
<option value="THfontNormal" style="font-family: THfontNormal;">THfontNormal</option>
<option value="times" style="font-family: times;">times</option>
<option value="tt0037m_" style="font-family: tt0037m_;">tt0037m_</option>
<option value="verdana" style="font-family: verdana;">verdana</option>

</select>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>

                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Font Boyutu</span>
                                                    <select class="form-control input-sm" id="font-boyutu">
                                                        <option value="Times New Roman"
                                                                style="font-family: Times New Roman;">Font Boyutu
                                                        </option>
                                                        <?php
                                                            for($i=1;$i<=500;$i++){
                                                                echo  "<option value=\"$i".""."\">".$i."px </option>";
                                                            }
                                                        ?>
                                                    </select>
                                                </div>

                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Font Rengi</span>
                                                    <input type="text"
                                                           value="#000000"
                                                           id="font_rengi"
                                                           class="form-control renk_call_back"
                                                           placeholder="#000000"
                                                           aria-describedby="sizing-addon3">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Stroke Boyutu</span>
                                                    <select class="form-control input-sm" id="stroke-boyutu">
                                                        </option>
                                                        <?php
                                                            for($s=0;$s<=10;$s=$s+.1){
                                                                echo  "<option value=\"$s".""."\">".$s."px </option>";
                                                            }
                                                        ?>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Stroke Rengi</span>
                                                    <input type="text"
                                                           class="form-control renk_call_back"
                                                           id="stroke_rengi"
                                                           value="#ffffff"
                                                           placeholder="#000000" aria-describedby="sizing-addon3">
                                                    <span id="cikti"></span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="input-group input-group-sm txt-araci">
                                                    <span class="input-group-addon" id="sizing-addon3">Gölge</span>
                                                    <input type ="text"
                                                           value="text-shadow: 0px 0px 0px rgba(255, 255, 255, 1);"
                                                           id="golge_stili"
                                                           class="form-control"
                                                           aria-describedby="sizing-addon3">
                                                </div>
                                                <a style="font-size: 9px" href="http://css3gen.com/text-shadow/" target="_blank" class="txt-araci">
                                                    Görsel ayar yapmak için tıklayın
                                                </a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="center">
                                                <div id="colorpicker"></div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </td>
                </tr>
        </table>
</div>








<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Fotoğraf seçimi...</h4>
            </div>
            <div class="modal-body">
                <div id="loader" style="display: none;
                                                        width: 200px;
                                                        height: 150px;
                                                        top:10%;
                                                        left: 20%;
                                                        z-index: 99;
                                                        position: absolute">
                    <div style="    margin-top: 0px;
                                                        margin-left: 22px;
                                                        width: 150px;
                                                        height: 150px;
                                                        text-align: center;
                                                        background-color: #fff;
                                                        border-radius: 100px;
                                                        position: absolute;
                                                        padding-top: 60px;"
                            >İşlem devam <br> ediyor</div>
                    <i class="fa fa-spinner fa-pulse fa-5x fa-fw"
                       style="
                                                                   font-size: 150px!important;
                                                                   position: absolute">
                    </i>
                </div>
                <table class="table table-bordered" style="width: 100%" align="center">
                    <tr>
                        <td>
                            <div id="secim-tuval"
                                 style="max-width: 550px;float: left;position: relative;
                                                                        display: block" >
                                <img
                                        id="orjinal-resim"
                                        style="max-width: 100%;max-height: 450px">
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="btn btn-primary" id="resmi-sola-cevir"><i class="fa fa-rotate-left"></i></div>
                            <div class="btn btn-primary" id="resmi-saga-cevir"><i class="fa fa-rotate-right"></i></div>
                            <div class="btn btn-primary" id="resim-yukle">Resim Yükle</div>
                            <div   id="resim-secimi-tamam" class="btn btn-primary " data-dismiss="modal">Tamam</div>
                            <div   id="resim-secimi-vazgec" class="btn btn-cancel " data-dismiss="modal">Vazgeç</div>
                            <input type="file" id="file" style="visibility: hidden">



                        </td>
                    </tr>
                </table>
                <img id="onizleme">

            </div>
            <div class="modal-footer">

            </div>
        </div>

    </div>
</div>


<!--  alpaygunes.com  ------------------------------------------------------ -->



<!-- TEXT KUTULARI DÜZENLEME FONT AYARLARMA KONUM DEĞİŞTİRME MODALI -->
<!-- Modal -->
<div id="txtFontRenkKonumModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Editör</h4>
                <button type="button" style="margin-top: -20px" class="close" data-dismiss="modal">&times;</button>
                <button type="button" style="margin-top: -20px;margin-right: 30px;padding: 2px!important" class="btn btn-danger editor-sifirla pull-right" >Sıfırla</button>
                <button type="button" style="margin-top: -20px;margin-right: 10px;padding: 2px!important"   data-dismiss="modal"  class="btn btn-primary pull-right editor-kaydet" data-dismiss="modal">Kaydet</button>
            </div>
            <div class="modal-body">
                <!-- TUVAL ALANI ------------------------- -->
                <div id="editor-canvas">

                </div>
                <div id="editor-araclar">
                    <!-- ÖNCEKİ SONRAKİ DÜĞMELERİ ----------------------------------->
                    <div class="btn-group" style="width: 100%!important;display: none">
                        <div class="btn btn-primary" style="width: 46%!important;" id="editor-onceki">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            Önceki Yazı Alanı
                        </div>
                        <div class="btn btn-primary" style="width: 46%!important;display: none" id="editor-sonraki">
                            Sonraki Yazı Alanı
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </div>
                    </div>

                    <!-- FONT DEĞİŞTİRME ALANI --------------------------------------->
                    <fieldset class="fsStyle">
                        <legend class="legendStyle">
                            Yazı Fontu Seçiniz
                        </legend>
                        <table class="table">
                            <tr>
                                <td>
                                    <div class="btn btn-primary" style="padding: 10px!important; float: right" id="editor-font-onceki"><span class="glyphicon glyphicon-chevron-left"></span></div>
                                </td>
                                <td>
                                    <select class="form-control" id="editor-font-listesi"
                                            style="width: 98%;font-size: 20px;">
                                        <option value="aa00912" style="font-family: aa00912;">aa00912</option>
                                        <option value="aa00815" style="font-family: aa00815;">aa00815</option>
                                        <option value="aa00619" style="font-family: aa00619;">aa00619</option>
                                        <option value="aa00526" style="font-family: aa00526;">aa00526</option>
                                        <option value="aa00616" style="font-family: aa00616;">00616</option>
                                        <option value="taget" style="font-family: taget;">taget</option>
                                        <option value="shyln" style="font-family: shyln;">shyln</option>
                                        <option value="sagina" style="font-family: sagina;">sagina</option>
                                        <option value="rakon" style="font-family: rakon;">rakon</option>
                                        <option value="pirane" style="font-family: pirane;">pirane</option>
                                        <option value="pasion" style="font-family: pasion;">pasion</option>
                                        <option value="NUPTU" style="font-family: NUPTU;">NUPTU</option>
                                        <option value="mury" style="font-family: mury;">mury</option>
                                        <option value="lucian" style="font-family: lucian;">lucian</option>
                                        <option value="linus" style="font-family: linus;">linus</option>
                                        <option value="juliet" style="font-family: juliet;">juliet</option>
                                        <option value="Jellyka" style="font-family: Jellyka;">Jellyka</option>
                                        <option value="Gravura" style="font-family: Gravura;">Gravura</option>
                                        <option value="flems" style="font-family: flems;">flems</option>
                                        <option value="Filxgirl" style="font-family: Filxgirl;">Filxgirl</option>
                                        <option value="Expo" style="font-family: Expo;">Expo</option>
                                        <option value="Enviro" style="font-family: Enviro;">Enviro</option>
                                        <option value="Brush455BT" style="font-family: Brush455BT;">Brush455BT</option>
                                        <option value="BrockScript" style="font-family: BrockScript;">BrockScript</option>
                                        <option value="blackjar" style="font-family: blackjar;">blackjar</option>
                                        <option value="amozon" style="font-family: amozon;">amozon</option>
                                        <option value="adine" style="font-family: adine;">adine</option>
                                        <option value="Shojumaru-Regular" style="font-family: Shojumaru-Regular;">
                                            Shojumaru-Regular
                                        </option>
                                        <option value="Blazed" style="font-family: Blazed;">Blazed</option>
                                        <option value="AveFedan" style="font-family: AveFedan;">AveFedan</option>
                                        <option value="Bloody-Stump" style="font-family: Bloody-Stump;">Bloody-Stump</option>
                                        <option value="CapricaSansItalicPersonalUse"
                                                style="font-family: CapricaSansItalicPersonalUse;">CapricaSansItalicPersonalUse
                                        </option>
                                        <option value="carolingia" style="font-family: carolingia;">carolingia</option>
                                        <option value="segoepr" style="font-family: segoepr;">segoepr</option>
                                        <option value="segoeprb" style="font-family: segoeprb;">segoeprb</option>
                                        <option value="Snap" style="font-family: Snap;">Snap</option>
                                        <option value="wds011402" style="font-family: wds011402;">wds011402</option>
                                        <option value="ChokoPlain" style="font-family: ChokoPlain;">ChokoPlain</option>
                                        <option value="KaushanScript-Regular" style="font-family: KaushanScript-Regular;">
                                            KaushanScript-Regular
                                        </option>
                                        <option value="VictorianD" style="font-family: VictorianD;">VICTORIAND</option>
                                        <option value="Gabrielle" style="font-family: Gabrielle;">Gabrielle</option>
                                        <option value="AGENTORANGE" style="font-family: AGENTORANGE;">AGENTORANGE</option>
                                        <option value="AKADORA" style="font-family: AKADORA;">AKADORA</option>
                                        <option value="akaDylanCollage" style="font-family: akaDylanCollage;">akaDylanCollage
                                        </option>
                                        <option value="akaDylanOpen" style="font-family: akaDylanOpen;">akaDylanOpen</option>
                                        <option value="akaDylanPlain" style="font-family: akaDylanPlain;">akaDylanPlain</option>
                                        <option value="Androgyne_TB" style="font-family: Androgyne_TB;">Androgyne_TB</option>
                                        <option value="arial" style="font-family: arial;">arial</option>
                                        <option value="BairamIt" style="font-family: BairamIt;">BairamIt</option>
                                        <option value="banffn" style="font-family: banffn;">banffn</option>
                                        <option value="Beckasin" style="font-family: Beckasin;">Beckasin</option>
                                        <option value="Bira_PERSONAL_USE_ONLY" style="font-family: Bira_PERSONAL_USE_ONLY;">
                                            Bira_PERSONAL_USE_ONLY
                                        </option>
                                        <option value="Blazed" style="font-family: Blazed;">Blazed</option>
                                        <option value="BlueStone" style="font-family: BlueStone;">BlueStone</option>
                                        <option value="BRUSHSCN" style="font-family: BRUSHSCN;">BRUSHSCN</option>
                                        <option value="CACTUS" style="font-family: CACTUS;">CACTUS</option>
                                        <option value="Chunky" style="font-family: Chunky;">Chunky</option>
                                        <option value="comic" style="font-family: comic;">comic</option>
                                        <option value="cour" style="font-family: cour;">cour</option>
                                        <option value="crashtestshadow" style="font-family: crashtestshadow;">crashtestshadow
                                        </option>
                                        <option value="Chunky" style="font-family: Chunky;">DEFECAFO</option>
                                        <option value="DorovarCarolus" style="font-family: DorovarCarolus;">DorovarCarolus
                                        </option>
                                        <option value="DuvallTR" style="font-family: DuvallTR;">DuvallTR</option>
                                        <option value="FAFERS" style="font-family: FAFERS;">FAFERS</option>
                                        <option value="floralie" style="font-family: floralie;">floralie</option>
                                        <option value="GeorginasHandTürkceFont" style="font-family: GeorginasHandTürkceFont;">
                                            GeorginasHandTürkceFont
                                        </option>
                                        <option value="impact" style="font-family: impact;">impact</option>
                                        <option value="JandaManateeBubble" style="font-family: JandaManateeBubble;">
                                            JandaManateeBubble
                                        </option>
                                        <option value="KingthingsLupine" style="font-family: KingthingsLupine;">
                                            KingthingsLupine
                                        </option>
                                        <option value="MISTRAL" style="font-family: MISTRAL;">MISTRAL</option>
                                        <option value="mtcorsva" style="font-family: mtcorsva;">mtcorsva</option>
                                        <option value="OndineD" style="font-family: OndineD;">OndineD</option>
                                        <option value="PoetsenOne-Regular" style="font-family: PoetsenOne-Regular;">
                                            PoetsenOne-Regular
                                        </option>
                                        <option value="tt0351m_" style="font-family: tt0351m_;">tt0351m_</option>
                                        <option value="RoteFlora" style="font-family: RoteFlora;">RoteFlora</option>
                                        <option value="ScriptMTBold" style="font-family: ScriptMTBold;">ScriptMTBold</option>
                                        <option value="segoepr" style="font-family: segoepr;">segoepr</option>
                                        <option value="SketchRockwell-Bold_TR_cok_AZ"
                                                style="font-family: SketchRockwell-Bold_TR_cok_AZ;">
                                            SketchRockwell-Bold_TR_cok_AZ
                                        </option>
                                        <option value="TACOBOX" style="font-family: TACOBOX;">TACOBOX</option>
                                        <option value="tahoma" style="font-family: tahoma;">tahoma</option>
                                        <option value="THfontNormal" style="font-family: THfontNormal;">THfontNormal</option>
                                        <option value="times" style="font-family: times;">times</option>
                                        <option value="tt0037m_" style="font-family: tt0037m_;">tt0037m_</option>
                                        <option value="verdana" style="font-family: verdana;">verdana</option>

                                    </select>
                                </td>
                                <td>
                                    <div class="btn btn-primary" style="padding: 10px!important;" id="editor-font-sonraki"><span class="glyphicon glyphicon-chevron-right"></span></div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <!-- RENGİNİ DEĞİŞTİRME ALANI --------------------------------------->

                    <fieldset class="fsStyle" >
                        <legend class="legendStyle">
                            Yazı Rengi Seçiniz
                        </legend>
                        <div class="row collapse in" id="renkler">
                            <?php
                               foreach ($renkler as $key=>$value ) {
                            $id='kutu'.$key;
                            echo "
                            <div class='renk_kutusu' reng_kodu='$value' id='$id' style='background-color:$value'></div>
                            \n";
                            }
                            ?>
                        </div>
                    </fieldset>

                    <!-- KONUM DEĞİŞTİRME ALANI --------------------------------------->
                    <fieldset class="fsStyle" id="konum-fieldset">
                        <legend class="legendStyle">
                            Yazı Konumunu Değiştirin
                        </legend>
                        <table id="konumlandirma-tablosu">
                            <tr>
                                <td></td>
                                <td>
                                    <div class="btn btn-primary yon-dugmeleri" yatay="0" dikey="-1" id="konum-ust">
                                        <span class="glyphicon glyphicon-arrow-up"></span>
                                    </div>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="btn btn-primary yon-dugmeleri"  yatay="-1" dikey="0"  id="konum-sol">
                                        <span class="glyphicon glyphicon-arrow-left"></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="btn btn-primary  id="konum-orta"
                                    style="
                                    border-radius: 50px!important;
                                    height: 36px!important;
                                    width: 36px!important;
                                    margin: 0px!important;
                                    padding: 0px!important;
                                    ">

                </div>
                </td>
                <td>
                    <div class="btn btn-primary yon-dugmeleri"  yatay="1" dikey="0" id="konum-sag">
                        <span class="glyphicon glyphicon-arrow-right"></span>
                    </div>
                </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="btn btn-primary yon-dugmeleri"  yatay="0" dikey="1" id="konum-down">
                            <span class="glyphicon glyphicon-arrow-down"></span>
                        </div>
                    </td>
                    <td></td>
                </tr>
                </table>

                </fieldset>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button"   class="btn btn-primary editor-kaydet" data-dismiss="modal"
                    style="background-color: #428bca!important;
                        font-size: 14px!important;
                        font-family: Arial;
                        padding: 2px!important;
                        line-height: 20px!important;"
                    >Kaydet</button>
            <div    class="btn btn-danger editor-sifirla"
                    style="background-color: #ca0100!important;
                         font-size: 14px!important;
                        font-family: Arial;
                        padding: 2px!important;
                        line-height: 20px!important;"
                    >Sıfırla</div>
        </div>
    </div>

</div>
</div>


<style>
    @media (min-width: 768px) {
        #txtFontRenkKonumModal > .modal-dialog {
            width: 768px !important;
        }
    }

    @media (max-width: 768px) {
        #editor-canvas {
            width: 100% !important;
            min-height:200px!important;
        }

        #editor-araclar {
            width: 100% !important;
            margin-left: 0px !important;
            margin-top: 20px !important;
            min-height: 200px !important;
        }

        #txtFontRenkKonumModal .modal-body {
            height: 525px !important;
        }

        #konum-fieldset{
            display: none;
        }
    }

    .renk_kutusu {
        float: left;
        width: 26px;
        height: 26px;
        margin: 2px;
        border: 1px solid rgba(0, 0, 0, 0.31);
    }

    .renk_kutusu:hover {
        border: 1px solid rgb(198, 198, 198);
    }

    #konumlandirma-tablosu {
        width: auto;
        min-width: 0;
        display: table;
        margin-right: auto;
        margin-left: auto;
    }

    #konumlandirma-tablosu tr div {
        position: relative;
        margin-right: auto;
        margin-left: auto;
        padding: 10px;
    }

    #txtFontRenkKonumModal .modal-body {
        min-height: 400px;
    }

    #editor-canvas {
        width: 48%;
        float: left;
        border: 1px solid #ccc;
        min-height: 400px;
        position: relative;
        background-color: transparent;
        display: block;
    }

    #editor-araclar {
        width: 48%;
        float: left;
        border: 1px solid #ccc;
        margin-left: 20px;
        min-height: 400px;
    }

    #editor-araclar > .btn-group > .btn {
        padding: 5px !important;
        text-align: center;
        font-weight: bold;

    }

    #editor-sonraki {
        float: right;
    }

    #editor-onceki {
    }

    .yazilariDuzenle{
        width: 26px;
    }
    .yazilariDuzenle i{
        font-size: 32px!important;
        color: #2199C6;
        margin-top: 4px;
    }
    .yazilariDuzenle i:hover{
        color: #ff0000;
    }

    #editor-canvas #CursorLayer{
        width: 100%;
    }

    /* LEGENT --------------------------------------BAŞ-------------------------------------------------*/
    legend.legendStyle {
        padding-left: 5px;
        padding-right: 5px;
    }

    fieldset.fsStyle {
        font-family: Verdana, Arial, sans-serif;
        font-size: small;
        font-weight: normal;
        border: 1px solid #999999;
        padding: 4px;
        margin: 5px;
    }

    legend.legendStyle {
        font-size: 100%;
        color: #000;
        background-color: transparent;
        font-weight: bold;
    }

    legend {
        width: auto;
        border-bottom: 0px;
    }

    /* LEGENT ----------------- SON  SON  SON  SON  SON  SON ---------------------------------------*/


</style>

