<?php
// alpaygunes
class ControllerSenkronizasyonStart extends Controller
{

	public function index()	{

		$data['heading_title'] = "Senkronizason Modülü [ANAMENÜ ]";
        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
		$data['href']          = $this->url->link('senkronizasyon/start/listeyiHazirla', 'token=' . $this->session->data['token']);
		$data['href_siparis']  = $this->url->link('senkronizasyon/start/siparisleriListele', 'token=' . $this->session->data['token']);
		$data['href_kategori_esle']  = $this->url->link('senkronizasyon/start/kategorileriHazirla', 'token=' . $this->session->data['token']);
		$data['href_filitre_esle']  = $this->url->link('senkronizasyon/filitre/filitreleriHazirla', 'token=' . $this->session->data['token']);
		$data['href_attribute_group_esle']  = $this->url->link('senkronizasyon/attributegroup/attribute_groupHazirla', 'token=' . $this->session->data['token']);
		$data['href_attribute_esle']  = $this->url->link('senkronizasyon/attribute/attributeHazirla', 'token=' . $this->session->data['token']);
		$data['href_option_esle']  = $this->url->link('senkronizasyon/option/optionHazirla', 'token=' . $this->session->data['token']);
		$data['href_manufacturer_esle']  = $this->url->link('senkronizasyon/manufacturer/manufacturerHazirla', 'token=' . $this->session->data['token']);


        $this->load->model('ortakpanel/siteler');
        $data['siteler'] =  $this->model_ortakpanel_siteler->getSiteler();


		$this->response->setOutput($this->load->view('senkronizasyon/start.tpl', $data));
	}

	public function kategorileriHazirla(){
		$hedef_site            = $this->request->get['hedefsite'];

		$data['heading_title'] = "Senkronizasyon Modülü [ KATEGORİ ]";
		$data['header']        = $this->load->controller('common/header');
		$data['column_left']   = $this->load->controller('common/column_left');
		$data['footer']        = $this->load->controller('common/footer');
		$data['href']          = $this->url->link('senkronizasyon/start/ajaxSiradakiKategoriyiGonder'
								 , 'hedef_site=' . $hedef_site . '&token=' . $this->session->data['token']);
		$this->load->model('senkronizasyon/yap');
		$this->session->data['gonderilecek_kategori_idleri']  = $this->model_senkronizasyon_yap->kategorileriHazirla($hedef_site);
		$this->response->setOutput($this->load->view('senkronizasyon/yakategori_esle.tpl',$data));
	}

	public function ajaxSiradakiKategoriyiGonder(){
		$this->load->model('senkronizasyon/yap');
		$sonuc = $this->model_senkronizasyon_yap->ajaxSiradakiKategoriyiGonder();
		$this->response->addHeader('Content-Type: text/plain');
		$this->response->setOutput(json_encode($sonuc));
	}


	public function listeyiHazirla(){

		$hedef_site            = $this->request->get['hedefsite'];
		$varolani_sil          = $this->request->get['silinme_onayi'];
		$ucret_orani           = $this->request->get['ucret_orani'];

		$data['heading_title'] = "Senkronizasyon Modülü [ ÜRÜN ]";
		$data['header']        = $this->load->controller('common/header');
		$data['column_left']   = $this->load->controller('common/column_left');
		$data['footer']        = $this->load->controller('common/footer');
		$data['href']          = $this->url->link('senkronizasyon/start/ajaxSiradakiniYap'
			, 'hedef_site=' . $hedef_site .
			  '&silinme_onayi=' . $varolani_sil .
			  '&ucret_orani=' . $ucret_orani .
			  '&token=' . $this->session->data['token']);

		$this->load->model('senkronizasyon/yap');
		$this->session->data['gonderilecek_urun_idleri']  = $this->model_senkronizasyon_yap->listeyiHazirla($hedef_site,$varolani_sil,$ucret_orani);
		$this->response->setOutput($this->load->view('senkronizasyon/yap.tpl',$data));
	}


	public function ajaxSiradakiniYap(){
		$this->load->model('senkronizasyon/yap');
		$sonuc = $this->model_senkronizasyon_yap->ajaxSiradakiniYap();
		$this->response->addHeader('Content-Type: text/plain');
		$this->response->setOutput(json_encode($sonuc));
	}


	public function siparisleriListele(){
		$data['header']        = $this->load->controller('common/header');
		$data['column_left']   = $this->load->controller('common/column_left');
		$data['footer']        = $this->load->controller('common/footer');
		$this->load->model('senkronizasyon/siparisler');
		$data['hedef_site']     = $this->request->get['hedef_site'];
		$data['orders']         = $this->model_senkronizasyon_siparisler->siparisleriIste($data['hedef_site']);
		$this->response->setOutput($this->load->view('senkronizasyon/siparis_listele.tpl',$data));
	}


}