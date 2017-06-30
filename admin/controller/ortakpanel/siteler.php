<?php
class ControllerOrtakpanelSiteler extends Controller
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
            'text' => "Bayi Siteleri",
            'href' => $this->url->link('ortakpanel/siteler', 'token=' . $this->session->data['token'] , 'SSL')
        );

        $data['siteekleurl']     = $this->url->link('ortakpanel/siteler/siteekle', 'token=' . $this->session->data['token'] , 'SSL');
        $data['getsiteurl']     = $this->url->link('ortakpanel/siteler/getsiteler', 'token=' . $this->session->data['token'] , 'SSL');
        $data['silsiteurl']     = $this->url->link('ortakpanel/siteler/silsite', 'token=' . $this->session->data['token'] , 'SSL');

        $data['token']           = $this->session->data['token'];

        $data['heading_title']   = "Ortak Panel";

        $data['header']      = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer']      = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/siteler.tpl', $data));
    }

    function getSiteler(){
        $this->load->model('ortakpanel/siteler');
        $data['siteler'] =  $this->model_ortakpanel_siteler->getSiteler();
        $this->response->setOutput($this->load->view('ortakpanel/siteler_list.tpl', $data));
    }

    function siteekle(){
        $this->load->model('ortakpanel/siteler');
        $site_url   =   $this->request->get['site_url'];

        if(isset($this->request->get['site_id'])){
            $this->model_ortakpanel_siteler->siteguncelle($site_url,$this->request->get['site_id']);
            $result = 'guncellendi';
        }else{
            $this->model_ortakpanel_siteler->siteekle($site_url);
            $result     = 'eklendi';
        }

        $this->response->setOutput(json_encode($result));

    }

    function silsite(){
        $this->load->model('ortakpanel/siteler');

        $site_id   =   $this->request->get['site_id'];
        $result    =   $this->model_ortakpanel_siteler->silsite($site_id);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($result));
    }
}