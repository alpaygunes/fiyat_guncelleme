<?php
class ControllerCommonOrtakpanelMenu extends Controller {
	public function index() {
        $data['text_siparis_listele']   = "Siparişleri Listele";
        $data['text_fiyat_guncelle']    = "Toplu Fiyat Güncelle";


        $data['siparis_listele'] = $this->url->link('ortakpanel/siparislerilistele', 'token=' . $this->session->data['token'], 'SSL');
        $data['fiyat_guncelle'] = $this->url->link('ortakpanel/fiyatguncelle', 'token=' . $this->session->data['token'], 'SSL');


        return $this->load->view('ortakpanel/ortakpanel_menu.tpl', $data);
	}
}
