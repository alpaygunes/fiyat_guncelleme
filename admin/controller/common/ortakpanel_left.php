<?php
class ControllerCommonOrtakpanelLeft extends Controller {
	public function index() {
		if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
			$data['profile'] = $this->load->controller('common/profile');
			$data['menu'] = $this->load->controller('common/ortakpanel_menu');
			$data['stats'] = $this->load->controller('common/stats');

			return $this->load->view('ortakpanel/ortakpanel_left.tpl', $data);
		}
	}
}