<?php
class ModelOrtakpanelAraclar extends Model
{

    public function tasarimlariTemizle($siteler,$son_x_gun){
        $silme_sonuclari = array();
        foreach ($siteler as $site){
            $url            = $site['site_url'];
            $url            = $url.'/index.php?route=ortakpanel_bayi/araclar/tasarimlaritemizle&son_x_gun='.$son_x_gun;
            $ch             = curl_init();
            curl_setopt($ch, CURLOPT_URL,$url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $silme_sonuclari[]   = array($site['site_url'],curl_exec($ch));
            curl_close($ch);
        }
        return $silme_sonuclari;
    }
}