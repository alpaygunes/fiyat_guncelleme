<?php
class ControllerOrtakpanelSliderresimupload extends Controller
{

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

        $this->response->addHeader("Access-Control-Allow-Origin '*' ");
        $this->response->addHeader("origin, x-requested-with, content-type");
        $this->response->addHeader("Access-Control-Allow-Methods 'PUT, GET, POST, DELETE, OPTIONS'");

        $this->response->setOutput($this->load->view('ortakpanel/slider_resim_upload.tpl', $data));
    }

    /*function uploadtobayi(){
        $gets   = $this->request->get;
        $posts  = $this->request->post;
        $files  = $this->request->files;

        $this->load->model('ortakpanel/sliderresimupload');
        $sonuc = $this->model_ortakpanel_sliderresimupload->uploadtobayi($gets,$posts,$files);
        //$this->response->setOutput($this->load->view('ortakpanel/siteler_list.tpl', $data));
    }*/
}