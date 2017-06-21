<?php
class ControllerCommonOrtakpanelMenu extends Controller {
	public function index() {
        $data['text_siparis_listele']   = "Siparişler";
        $data['text_fiyat_guncelle']    = "Toplu Fiyat Güncelle";
        $data['text_urunleri_dagit']    = "Ürünler Eşleme";

        $data['siparis_listele']    = $this->url->link('ortakpanel/siparisler', 'token=' . $this->session->data['token'], 'SSL');
        $data['fiyat_guncelle']     = $this->url->link('ortakpanel/fiyatguncelle', 'token=' . $this->session->data['token'], 'SSL');
        $data['urunleri_dagit']     = $this->url->link('senkronizasyon/start', 'token=' . $this->session->data['token'], 'SSL');

        return $this->load->view('ortakpanel/ortakpanel_menu.tpl', $data);
	}
}
