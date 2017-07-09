<?php
class ControllerOrtakpanelSliderresimupload extends Controller
{
    private $error = array();

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $data['baslik'] = "Ortak Panel";
        $this->load->model('ortakpanel/siteler');
        $data['siteler'] =  $this->model_ortakpanel_siteler->getSiteler();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => "Resim Yükle",
            'href' => $this->url->link('ortakpanel/sliderresimupload', 'token=' . $this->session->data['token'] , 'SSL')
        );

        $data['token']           = $this->session->data['token'];

        $data['heading_title']   = "Ortak Panel";

        $data['header']         = $this->load->controller('common/ortakpanel_header');
        $data['column_left']    = $this->load->controller('common/ortakpanel_left');
        $data['footer']         = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/slider_resim_upload.php', $data));
    }
}