<?php
class ModelOrtakpanelAraclar extends Model
{

    public function musteriResimleriniTemizle($siteler,$son_x_gun){
        $silme_sonuclari = array();
        foreach ($siteler as $site){
            $url            = $site['site_url'];
            $url            = $url.'/index.php?route=ortakpanel_bayi/araclar/musteriresimlerinitemizle&son_x_gun='.$son_x_gun;
            $ch             = curl_init();
            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $cevap               = curl_exec($ch);
            if(strlen($cevap)>20){
                $cevap = 'hata';
            }
            $silme_sonuclari[]   = array($site['site_url'],$cevap);

            curl_close($ch);
        }
        return $silme_sonuclari;
    }
}