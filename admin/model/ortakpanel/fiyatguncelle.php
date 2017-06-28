<?php
class ModelOrtakpanelFiyatguncelle extends Model
{
    public function getProductsCountByCategoryId($category_id,$option_id,$getid=0){
        //$query = $this->db->query("SELECT *
        //                           FROM " . DB_PREFIX . "product p
        //                           LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
        //                           LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)
        //                           WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
        //                           AND p2c.category_id = '" . (int)$category_id . "'
        //                           ORDER BY pd.name ASC");

        $query_option = null;
        $query_category = null;
        if($option_id){
            $query_option       = " AND po.option_id = '" . (int)$option_id . "'";
        }

        if($category_id){
            $query_category     = " AND ptc.category_id = '" . (int)$category_id . "'";
        }


        $query = $this->db->query("SELECT 
                                      * 
                                   FROM " . DB_PREFIX . "product_to_category ptc 
                                   LEFT JOIN " . DB_PREFIX . "product_option po ON (ptc.product_id = po.product_id)
                                   WHERE  1 " . $query_category . $query_option);
        if($getid>0){
            return $query->rows;
        }else{
            return $query->num_rows;
        }
    }

    public function setYeniFiyat($category_id,$option_id,$yeni_fiyat){
        $rows       = $this->getProductsCountByCategoryId($category_id,$option_id,$getid=1);
        $urun_idleri = array();
        foreach ($rows as $row){
            $urun_idleri[] = $row['product_id'];
        }

        $urun_idleri_str = implode(',',$urun_idleri);
        $soru = "UPDATE " . DB_PREFIX . "product SET price = '".$yeni_fiyat."' WHERE product_id IN (".$urun_idleri_str.")";
        $this->db->query($soru);
        return $soru;
    }

    public function setAciklama($category_id,$option_id,$aciklama){
        $rows       = $this->getProductsCountByCategoryId($category_id,$option_id,$getid=1);
        $urun_idleri = array();
        foreach ($rows as $row){
            $urun_idleri[] = $row['product_id'];
        }

        $urun_idleri_str = implode(',',$urun_idleri);
        $sorgu = "UPDATE " . DB_PREFIX . "product_description SET description = '".$aciklama."' WHERE product_id IN (".$urun_idleri_str.")";
        $this->db->query($sorgu);
        return $sorgu;
    }
}