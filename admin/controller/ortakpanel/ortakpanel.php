<?php
class ControllerOrtakpanelOrtakpanel extends Controller
{
    private $error = array();

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $this->load->model('ortakpanel/ortakpanel');

        $this->getGiris();
    }

    function getGiris(){
        $data['baslik'] = "Ortak Panel";
        $this->load->model('ortakpanel/ortakpanel');

        $data['baslik'] = "Ortak Panel";

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/ortakpanel_giris.tpl', $data));
    }
}