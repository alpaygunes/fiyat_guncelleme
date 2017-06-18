<?php
class ModelOrtakpanelOpenbay extends Model
{
    function addorderinfo($gets,$posts){
        //gelen GET leri bayi siteye göndermek içn düzenle
        $rqst   = "";
        foreach ($gets as $key=>$value){
            if($key!='route'){
                if($key!='token'){
                    if($key!='siparis_sitesi'){
                        $rqst .= "&$key=$value";
                    }
                }
            }
        }
        $url_eki        = "index.php?route=ortakpanel_bayi/openbay/addorderinfo&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $posts);
        $data           = curl_exec($ch);
        curl_close($ch);
        return $data;
    }
}