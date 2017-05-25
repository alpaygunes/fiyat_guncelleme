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
        $url_eki        = "/index.php?route=ortakpanel_bayi/order/&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        foreach ($siteler as $site){
            $ch         = curl_init();
            curl_setopt($ch, CURLOPT_URL,"http://".$site.$url_eki);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            $data         = curl_exec($ch);
            curl_close($ch);
            $bom = pack('H*','EFBBBF');
            $data = preg_replace("/^$bom/", '', $data);
            $data = preg_replace("/^$bom/", '', $data);
            $data = json_decode($data,TRUE);
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

    BURADA KALDIN
ORDER İN İÇİNE SİPARİŞİN SİTESİNİN NADRESİNİ KOYDUN
ŞİMDİ ONU SAYFAYAKİ İLGİİ YERLERDE KULLAN.
MESALA ÜRÜN İNFOSU YADA ÖN İZLEMESİ SIRASINDA HANGİ STEDEN GELDİĞİ BİLİNMELİKİ İNFO O SİTEDEN İSTENSİN.
ŞUAN İNFOYA TIKLANINCA DATALAR GELMİYOR . SENİN GÖREVİN ORDERDEKİ SİTEYİDE KULLANARAK İNFO İSTENDİĞİNDE HEDEFTEN ÇEKMEK

    function info($gets){
        //gelen GET leri bayi siteye göndermek içn düzenle
        $rqst   = "";
        foreach ($gets as $key=>$value){
            if($key!='route'){
                if($key!='token'){
                    $rqst .= "&$key=$value";
                }
            }
        }
        $url_eki        = "/index.php?route=ortakpanel_bayi/order/&yeni_token=".$this->session->data['token'];
        $url_eki        .=$rqst;
        $bayi_sitesi    = $gets["bayi_sitesi"];
        $ch         = curl_init();

//      BURADA KALDIN
//      İNFO İÇN TIKLALAN DÜĞME BAYİ SİTESİNİDE GÖNDERMELİ.

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

        foreach ($data['orders'][0] as $key=>$value){
            if(preg_match($şablon, $value)){
                $data['orders'][0][$key]=preg_replace($şablon, $matches[0][0],$value );
            }
        }


        return $data;
    }

}