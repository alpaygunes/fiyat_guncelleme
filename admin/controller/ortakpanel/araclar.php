<?php
class ControllerOrtakpanelAraclar extends Controller
{

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $data['baslik'] = "Ortak Panel";
        //$this->load->model('ortakpanel/araclar');
        //$data['siteler'] =  $this->model_ortakpanel_siteler->getSiteler();

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => "Araçlar",
            'href' => $this->url->link('ortakpanel/araclar', 'token=' . $this->session->data['token'] , 'SSL')
        );

        //$data['siteekleurl']    = $this->url->link('ortakpanel/siteler/siteekle', 'token=' . $this->session->data['token'] , 'SSL');
        //$data['getsiteurl']     = $this->url->link('ortakpanel/siteler/getsiteler', 'token=' . $this->session->data['token'] , 'SSL');
        //$data['silsiteurl']     = $this->url->link('ortakpanel/siteler/silsite', 'token=' . $this->session->data['token'] , 'SSL');

        $data['token']           = $this->session->data['token'];

        $data['heading_title']   = "Araçlar";

        $data['header']      = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer']      = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/araclar.tpl', $data));
    }

}