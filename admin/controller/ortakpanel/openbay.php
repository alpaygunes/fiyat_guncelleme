<?php
class ControllerOrtakpanelOpenbay extends Controller
{

    function addorderinfo(){
        $data           = array();
        $this->load->model('ortakpanel/openbay');
        $data = $this->model_ortakpanel_openbay->addorderinfo($this->request->get,$this->request->post);
        $this->response->setOutput($data);
    }
}