<?php
class ControllerOrtakpanelFiyatguncelle extends Controller
{
    private $error = array();

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $this->load->model('catalog/category');

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
        $data['results']        = $this->model_catalog_category->getCategories();

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/fiyatguncelle.tpl', $data));
    }
}