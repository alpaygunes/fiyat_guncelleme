<?php
class ControllerCommonOrtakpanelMenu extends Controller {
	public function index() {
        $data['text_siparis_listele']   = "Siparişler";
        $data['text_fiyat_guncelle']    = "Toplu Fiyat Güncelle";
        $data['text_urunleri_dagit']    = "Ürünler Eşleme";
        $data['text_siteler']           = "Bayi Siteleri";
        $data['text_slider_resim_yukle']    = "Slider Resim Yükleme";
        $data['text_araclar']           = "Çeşitli araçlar";

        $data['siparis_listele']    = $this->url->link('ortakpanel/siparisler', 'token=' . $this->session->data['token'].'&filter_son_x_gun=2', 'SSL');
        $data['fiyat_guncelle']     = $this->url->link('ortakpanel/fiyatguncelle', 'token=' . $this->session->data['token'], 'SSL');
        $data['urunleri_dagit']     = $this->url->link('senkronizasyon/start', 'token=' . $this->session->data['token'], 'SSL');
        $data['siteler']            = $this->url->link('ortakpanel/siteler', 'token=' . $this->session->data['token'], 'SSL');
        $data['slider_resim_yukle'] = $this->url->link('ortakpanel/sliderresimupload', 'token=' . $this->session->data['token'], 'SSL');
        $data['araclar']            = $this->url->link('ortakpanel/araclar', 'token=' . $this->session->data['token'], 'SSL');

        return $this->load->view('ortakpanel/ortakpanel_menu.tpl', $data);
	}
}
