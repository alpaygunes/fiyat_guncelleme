<?php
class ModelOrtakpanelCustomer extends Model
{
    function edit($gets){
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
        $url_eki        = "index.php?route=ortakpanel_bayi/customer/edit&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data           = curl_exec($ch);
        curl_close($ch);
        $bom            = pack('H*','EFBBBF');
        $data           = preg_replace("/^$bom/", '', $data);
        $data           = preg_replace("/^$bom/", '', $data);
        $data           = json_decode($data,TRUE);

        return $data;
    }

    function customfield($gets){
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

        $url_eki        = "index.php?route=ortakpanel_bayi/customer/customfield&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data           = curl_exec($ch);
        curl_close($ch);
        $bom            = pack('H*','EFBBBF');
        $data           = preg_replace("/^$bom/", '', $data);
        $data           = preg_replace("/^$bom/", '', $data);
        $data           = json_decode($data,TRUE);

        return $data;
    }
}