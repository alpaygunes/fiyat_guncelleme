<?php
class ControllerOrtakpanelFiyatguncelle extends Controller
{
    private $error = array();

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $this->load->model('catalog/category');
        $this->load->model('catalog/option');

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => 'Ortakpanel',
            'href' => $this->url->link('ortakpanel/ortakpanel', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => "Fiyat Güncelle",
            'href' => $this->url->link('ortakpanel/fiyatguncelle', 'token=' . $this->session->data['token'] , 'SSL')
        );

        $data['heading_title']  = "Fiyat Güncelleme";

        $data['category_total'] = $this->model_catalog_category->getTotalCategories();
        $data['categoryes']     = $this->model_catalog_category->getCategories();

        $data['options_total'] = $this->model_catalog_option->getTotalOptions();
        $data['options']        = $this->model_catalog_option->getOptions();

        $data['getproductcounturl'] = $this->url->link('ortakpanel/fiyatguncelle/getProductsCountByCategoryId', 'token=' . $this->session->data['token'] , 'SSL');
        $data['setfiyaturl']        = $this->url->link('ortakpanel/fiyatguncelle/setYeniFiyat', 'token=' . $this->session->data['token'] , 'SSL');
        $data['setaciklamaurl']     = $this->url->link('ortakpanel/fiyatguncelle/setAciklama', 'token=' . $this->session->data['token'] , 'SSL');
        $data['token']              = $this->session->data['token'];

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/fiyatguncelle.tpl', $data));
    }

    public function getProductsCountByCategoryId(){
        $this->load->model('ortakpanel/fiyatguncelle');
        $kategori_id = $this->request->get['kategori_id'];
        $option_id = $this->request->get['option_id'];

        echo $this->model_ortakpanel_fiyatguncelle->getProductsCountByCategoryId($kategori_id,$option_id);
    }

    public  function setYeniFiyat(){
        $this->load->model('ortakpanel/fiyatguncelle');
        $kategori_id = $this->request->get['kategori_id'];
        $option_id = $this->request->get['option_id'];
        $yeni_fiyat = $this->request->get['yeni_fiyat'];

        echo $this->model_ortakpanel_fiyatguncelle->setYeniFiyat($kategori_id,$option_id,$yeni_fiyat);
    }

    public function setAciklama(){
        $this->load->model('ortakpanel/fiyatguncelle');
        $kategori_id    = $this->request->get['kategori_id'];
        $option_id      = $this->request->get['option_id'];
        $aciklama       = $this->request->get['aciklama'];

        echo $this->model_ortakpanel_fiyatguncelle->setAciklama($kategori_id,$option_id,$aciklama);
    }
}