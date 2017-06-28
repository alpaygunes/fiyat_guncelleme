<?php
class ModelOrtakpanelSiteler extends Model
{

    function siteekle($site_url){
        $sorgu      = "INSERT INTO " . DB_PREFIX . "ortakpanel_bayi_siteleri (site_url) VALUES('".$site_url."')";
        $this->db->query($sorgu);
        return $sorgu;
    }

    function getSiteler(){
        $sorgu      = "SELECT * FROM ". DB_PREFIX . "ortakpanel_bayi_siteleri";
        $sorgu      = $this->db->query($sorgu);
        return $sorgu->rows;
    }
}