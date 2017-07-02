<?php
class ModelOrtakpanelSiteler extends Model
{

    function siteguncelle($site_url,$site_id){
        $sorgu      = "UPDATE " . DB_PREFIX . "ortakpanel_bayi_siteleri SET site_url ='".$site_url."' 
                        WHERE ortakpanel_bayi_siteleri_id='".$site_id."'";
        $this->db->query($sorgu);
        return $sorgu;
    }

    function siteekle($site_url){
        $sorgu      = "INSERT INTO `" . DB_PREFIX . "ortakpanel_bayi_siteleri` SET site_url='".$site_url."'";
        $this->db->query($sorgu);
        return $sorgu;
    }

    function getSiteler(){
        $sorgu      = "SELECT * FROM " . DB_PREFIX . "ortakpanel_bayi_siteleri";
        $sorgu      = $this->db->query($sorgu);
        return $sorgu->rows;
    }

    function silsite($site_id){
        $sorgu      = "DELETE  FROM " . DB_PREFIX . "ortakpanel_bayi_siteleri 
                        WHERE ortakpanel_bayi_siteleri_id='".$site_id."'";
        $sorgu      = $this->db->query($sorgu);
        return $sorgu;
    }
}