<?php
class ControllerCommonOrtakpanelMenu extends Controller {
	public function index() {
		return $this->load->view('ortakpanel/ortakpanel_menu.tpl', '');
	}
}
