<?php
class ControllerOrtakpanelSiparisler extends Controller
{
    private $error      = array();
    public  $siteler    = array();

    public function index()
    {
        $this->document->setTitle("Ortak Panel");
        $this->siparisleriCek();
    }

    function siparisleriCek(){
        include ("sitelerArr.php");
        $this->siteler  = $sitelerArr;
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        $data           = $this->model_ortakpanel_siparisler->siparisler($this->siteler,$this->request->get);

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');

        $this->response->setOutput($this->load->view('ortakpanel/order_list.tpl', $data));
    }

    function info(){
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        if (isset($this->request->get['order_id'])) {
            $order_id = $this->request->get['order_id'];
        } else {
            $order_id = 0;
        }
        $data = $this->model_ortakpanel_siparisler->info($this->request->get);

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');

        $this->response->setOutput($this->load->view('ortakpanel/order_info.tpl', $data));
    }

    function edit(){
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        if (isset($this->request->get['order_id'])) {
            $order_id = $this->request->get['order_id'];
        } else {
            $order_id = 0;
        }
        $data = $this->model_ortakpanel_siparisler->edit($this->request->get);

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');

        $this->response->setOutput($this->load->view('ortakpanel/order_form.tpl', $data));
    }

    function history(){
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        $data = $this->model_ortakpanel_siparisler->history($this->request->get);
        $this->response->setOutput($data);
    }

    function getTasarimById(){

        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        $data['iceriklerArr'] = $this->model_ortakpanel_siparisler->getTasarimById($this->request->get);
        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');

        $this->response->setOutput($this->load->view('ortakpanel/viewtasarim.tpl', $data));
    }
}

