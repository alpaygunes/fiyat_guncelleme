<?php
class ControllerOrtakpanelApiorder extends Controller {
    function history(){
        $data           = array();
        $this->load->model('ortakpanel/apiorder');
        $data = $this->model_ortakpanel_apiorder->history($this->request->get,$this->request->post);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput($data);
    }
}
