<?php
class ControllerOrtakpanelCustomer extends Controller
{
    function edit(){
        $data           = array();
        $this->load->model('ortakpanel/customer');

        $data = $this->model_ortakpanel_customer->edit($this->request->get);

        $data['header'] = $this->load->controller('common/ortakpanel_header');
        $data['column_left'] = $this->load->controller('common/ortakpanel_left');
        $data['footer'] = $this->load->controller('common/ortakpanel_footer');
        $data['token']   = $this->session->data['token'];

        $this->response->setOutput($this->load->view('ortakpanel/customer_form.tpl', $data));
    }

    function customfield(){
        $data           = array();
        $this->load->model('ortakpanel/customer');

        $data = $this->model_ortakpanel_customer->customfield($this->request->get);

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($data));
    }
}