<?php
class ControllerOrtakpanelSiparislerilistele extends Controller
{
    private $error = array();

    public function index()
    {

        $this->document->setTitle("Ortak Panel");

        $this->getListe();
    }

    function getListe(){
        $data['baslik'] = "Siparişler [ Toplu ]";
        $this->load->model('ortakpanel/siparislerilistele');


        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
        $this->response->setOutput($this->load->view('ortakpanel/siparislerilistele.tpl', $data));
    }
}