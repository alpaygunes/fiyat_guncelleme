<?php
class ModelOrtakpanelSiparisler extends Model
{
    public  $siteler = array();

    function siparisler($siteler,$gets){
        $this->siteler  = $siteler;
        //gelen GET leri bayi siteye göndermek içn düzenle
        $rqst   = "";
        foreach ($gets as $key=>$value){
            if($key!='route'){
                if($key!='token'){
                    $rqst .= "&$key=$value";
                }
            }
        }
        $url_eki            = "/index.php?route=ortakpanel_bayi/order/&yeni_token=".$this->session->data['token'];
        $url_eki            .=$rqst;
        $data1['orders']    = array();
        $data               = array();
        foreach ($siteler as $site){
            $ch         = curl_init();
            curl_setopt($ch, CURLOPT_URL,'http://'.$site['site_url'].$url_eki);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $data0         = curl_exec($ch);
            curl_close($ch);
            $bom = pack('H*','EFBBBF');
            $data0 = preg_replace("/^$bom/", '', $data0);
            $data0 = preg_replace("/^$bom/", '', $data0);
            $data0 = json_decode($data0,TRUE);
            if(is_array($data0)){
                $data1['orders']        = array_merge($data0['orders'],$data1['orders']);
                $data1['order_total']   = $data0['order_total']+$data1['order_total'];
                if(!count($data)){
                    $data = $data0;
                }
            }
        }

        $data['orders']         =$data1['orders'];
        $data['order_total']    =$data1['order_total'];

        //tarihleri time yapalımki sıralaması olabilsin
        if($gets['sort']=='o.date_added' || !isset($gets['sort'])){
            foreach ($data['orders'] as $key=>$value){
                $timestamp = DateTime::createFromFormat('Y-m-d H:i:s', $value['formatsiz_date_added'])->getTimestamp();
                $data['orders'][$key]['time'] = $timestamp;
            }

            if($gets['order']=='ASC'){
                $yeni_dizi = $this->array_msort($data['orders'], array('time'=>SORT_ASC));
            }else if($gets['order']=='DESC'){
                $yeni_dizi = $this->array_msort($data['orders'], array('time'=>SORT_DESC));
            }else{
                $yeni_dizi = $this->array_msort($data['orders'], array('time'=>SORT_DESC));
            }

            $data['orders'] = $yeni_dizi;
        }


        //datalarin içindeki linklerde bulunan bayi site urlelerini değiştir.
        $şablon = '/:\/\/(.*)(route)/i';
        $domain = $this->url->link('', '', 'SSL');
        preg_match($şablon, $domain, $matches, PREG_OFFSET_CAPTURE);
        foreach ($data as $key=>$value){
            if(preg_match($şablon, $value)){
                $data[$key]=preg_replace($şablon, $matches[0][0],$value );
            }
        }

        foreach ($data['orders'] as $key0=>$value0){
            foreach ($data['orders'][$key0] as $key=>$value){
                if(preg_match($şablon, $value)){
                    $data['orders'][$key0][$key]=preg_replace($şablon, $matches[0][0],$value );
                }
            }
        }

        return $data;
    }

    function info($gets){
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
        $url_eki        = "index.php?route=ortakpanel_bayi/order/info&yeni_token=".$this->session->data['token'];
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

        //datalarin içindeki linklerde bulunan bayi site urlelerini değiştir.
        $şablon = '/:\/\/(.*)(route)/i';
        $domain = $this->url->link('', '', 'SSL');
        preg_match($şablon, $domain, $matches, PREG_OFFSET_CAPTURE);
        foreach ($data as $key=>$value){
            if(preg_match($şablon, $value)){
                $data[$key]=preg_replace($şablon, $matches[0][0],$value );
            }
        }

        // $data[product] dizisindeki url lerid eğiştirelim
        foreach ($data['products'] as $key=>$value){
            if(preg_match($şablon, $value['href'])){
                $data['products'][$key]['href']  = preg_replace($şablon, $matches[0][0],$value['href'] );
            }
            if(preg_match($şablon, $value['tasarim'])){
                $data['products'][$key]['tasarim'] = '?route=ortakpanel/siparisler/getTasarimById&siparis_sitesi='.$data['siparis_sitesi'].'&orjinal_url='.$value['tasarim'];
            }
        }

        //invoice linkin değiştrelim
        $data['invoice'] = '?route=ortakpanel/siparisler/invoice&siparis_sitesi='.$data['siparis_sitesi'].'&orjinal_url='.$data['invoice'];


        return $data;
    }

    function invoice($gets){
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

        $url_eki        = "index.php?route=ortakpanel_bayi/order/invoice&yeni_token=".$this->session->data['token'];
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

    function edit($gets){
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
        $url_eki        = "index.php?route=ortakpanel_bayi/order/edit&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch         = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data         = curl_exec($ch);
        curl_close($ch);
        $bom = pack('H*','EFBBBF');
        $data = preg_replace("/^$bom/", '', $data);
        $data = preg_replace("/^$bom/", '', $data);
        $data = json_decode($data,TRUE);

        //datalarin içindeki linklerde bulunan bayi site urlelerini değiştir.
        $şablon = '/:\/\/(.*)(route)/i';
        $domain = $this->url->link('', '', 'SSL');
        preg_match($şablon, $domain, $matches, PREG_OFFSET_CAPTURE);
        foreach ($data as $key=>$value){
            if(preg_match($şablon, $value)){
                $data[$key]=preg_replace($şablon, $matches[0][0],$value );
            }
        }
        return $data;
    }

    function history($gets){
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
        $url_eki        = "index.php?route=ortakpanel_bayi/order/history&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data           = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    function getTasarimById($gets){
        //gelen GET leri bayi siteye göndermek içn düzenle
        $rqst   = "";
        foreach ($gets as $key=>$value){
            if($key!='route'){
                if($key!='token'){
                    if($key!='orjinal_url') {
                        if ($key != 'siparis_sitesi') {
                            $rqst .= "&$key=$value";
                        }
                    }
                }
            }
        }

        $bayi_sitesi    = $gets["siparis_sitesi"];
        $url_eki        = "index.php?route=ortakpanel_bayi/order/getTasarimById&yeni_token=".$this->session->data['token'];
        $bayi_sitesi   .= $url_eki.$rqst;

        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data           = curl_exec($ch);
        curl_close($ch);
        $bom = pack('H*','EFBBBF');
        $data = preg_replace("/^$bom/", '', $data);
        $data = preg_replace("/^$bom/", '', $data);
        $data = json_decode($data,TRUE);
        $data = json_decode($data,TRUE);

        foreach ($data as $key=>$value){
            if($value['tur']=='resim_yer_tutucu'){
                $data[$key]['orjinal_resim_url'] = 'index.php?route=ortakpanel/siparisler/getTasarimImage&siparis_sitesi='
                                                    .$gets["siparis_sitesi"].'&token='.$this->session->data['token'].'&orjinal_resim_url='.$value['orjinal_resim_url'];
            }
        }

        $data = json_encode($data,TRUE);
        return $data;
    }

    // bayiden gelnd ata0 ın json olup omadığını kontrole der
    function isJSON($string){
        return is_string($string) && is_array(json_decode($string, true)) && (json_last_error() == JSON_ERROR_NONE) ? true : false;
    }

    function array_msort($array, $cols)
    {
        $colarr = array();
        foreach ($cols as $col => $order) {
            $colarr[$col] = array();
            foreach ($array as $k => $row) { $colarr[$col]['_'.$k] = strtolower($row[$col]); }
        }
        $eval = 'array_multisort(';
        foreach ($cols as $col => $order) {
            $eval .= '$colarr[\''.$col.'\'],'.$order.',';
        }
        $eval = substr($eval,0,-1).');';
        eval($eval);
        $ret = array();
        foreach ($colarr as $col => $arr) {
            foreach ($arr as $k => $v) {
                $k = substr($k,1);
                if (!isset($ret[$k])) $ret[$k] = $array[$k];
                $ret[$k][$col] = $array[$k][$col];
            }
        }
        return $ret;

    }

    function getTasarimImage($gets){
        $bayi_sitesi    = $gets["siparis_sitesi"].'/'.$gets["orjinal_resim_url"];
        $ch             = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data           = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    function siparisSil($gets){
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
        $url_eki        = "index.php?route=ortakpanel_bayi/apiorder/delete&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["siparis_sitesi"];
        $ch         = curl_init();
        curl_setopt($ch, CURLOPT_URL,$bayi_sitesi.$url_eki);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $data         = curl_exec($ch);
        curl_close($ch);
        $bom = pack('H*','EFBBBF');
        $data = preg_replace("/^$bom/", '', $data);
        $data = preg_replace("/^$bom/", '', $data);
        $data = json_decode($data,TRUE);

        //datalarin içindeki linklerde bulunan bayi site urlelerini değiştir.
        $şablon = '/:\/\/(.*)(route)/i';
        $domain = $this->url->link('', '', 'SSL');
        preg_match($şablon, $domain, $matches, PREG_OFFSET_CAPTURE);
        foreach ($data as $key=>$value){
            if(preg_match($şablon, $value)){
                $data[$key]=preg_replace($şablon, $matches[0][0],$value );
            }
        }
        return $data;
    }
}