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
        //include ("sitelerArr.php");
        $this->load->model('ortakpanel/siteler');
        $siteler =  $this->model_ortakpanel_siteler->getSiteler();

        $this->load->model('ortakpanel/siparisler');
        $data           = array();
        $data           = $this->model_ortakpanel_siparisler->siparisler($siteler,$this->request->get);

        // sayfalama ile ilgili kodlar
        if (isset($this->request->get['filter_order_id'])) {
            $filter_order_id = $this->request->get['filter_order_id'];
        } else {
            $filter_order_id = null;
        }

        if (isset($this->request->get['filter_customer'])) {
            $filter_customer = $this->request->get['filter_customer'];
        } else {
            $filter_customer = null;
        }

        if (isset($this->request->get['filter_order_status'])) {
            $filter_order_status = $this->request->get['filter_order_status'];
        } else {
            $filter_order_status = null;
        }

        if (isset($this->request->get['filter_total'])) {
            $filter_total = $this->request->get['filter_total'];
        } else {
            $filter_total = null;
        }

        if (isset($this->request->get['filter_date_added'])) {
            $filter_date_added = $this->request->get['filter_date_added'];
        } else {
            $filter_date_added = null;
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $filter_date_modified = $this->request->get['filter_date_modified'];
        } else {
            $filter_date_modified = null;
        }

        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'o.order_id';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'DESC';
        }

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['filter_order_id'])) {
            $url .= '&filter_order_id=' . $this->request->get['filter_order_id'];
        }

        if (isset($this->request->get['filter_customer'])) {
            $url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
        }

        if (isset($this->request->get['filter_order_status'])) {
            $url .= '&filter_order_status=' . $this->request->get['filter_order_status'];
        }

        if (isset($this->request->get['filter_total'])) {
            $url .= '&filter_total=' . $this->request->get['filter_total'];
        }

        if (isset($this->request->get['filter_date_added'])) {
            $url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
        }

        if (isset($this->request->get['filter_date_modified'])) {
            $url .= '&filter_date_modified=' . $this->request->get['filter_date_modified'];
        }

        if (isset($this->request->get['sort'])) {
            $url .= '&sort=' . $this->request->get['sort'];
        }

        if (isset($this->request->get['order'])) {
            $url .= '&order=' . $this->request->get['order'];
        }

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['filter_son_x_gun'])) {
            $url .= '&filter_son_x_gun=' . $this->request->get['filter_son_x_gun'];
            $data['filter_son_x_gun']   =  $this->request->get['filter_son_x_gun'];
        }

        $start   = ($page - 1) * $this->config->get('config_limit_admin');
        $limit   = $this->config->get('config_limit_admin');

        //array_slice(array,start,length,preserve)
        $data['orders']     = array_slice($data['orders'],$start,$limit);
        $data['results']     = "$start" ."-". ((int)$start+(int)$limit);

        $pagination         = new Pagination();
        $pagination->total  = $data['order_total'];
        $pagination->page   = $page;
        $pagination->limit  = $this->config->get('config_limit_admin');
        $pagination->url    = $this->url->link('ortakpanel/siparisler', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
        $data['pagination'] = $pagination->render();

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

    function invoice(){
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        if (isset($this->request->get['order_id'])) {
            $order_id = $this->request->get['order_id'];
        } else {
            $order_id = 0;
        }
        $data = $this->model_ortakpanel_siparisler->invoice($this->request->get);

        if($this->request->get['sablon_adi']){
            $sablon                 = $this->request->get['sablon_adi'];
        }else{
            $sablon = "menu.tpl";
            // fatura dizinindeki dosya sayılarve isimleri
            // $this->config->get('theme_path');
            $fatura_sablon_yolu = DIR_APPLICATION."view/template/ortakpanel/faturalar";
            if($handle = opendir($fatura_sablon_yolu))
            {
                while(($file = readdir($handle)) !== false)
                {
                    if($file != "."
                        && $file != ".."
                        && $file != "Thumbs.db"/*Bazı sinir bozucu windows dosyaları.*/)
                    {
                        $data['fatura_sablonlari'][]=$file;
                    }
                }
                closedir($handle);
            }
        }


        $this->response->setOutput($this->load->view('ortakpanel/faturalar/'.$sablon, $data));
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

        $data                   = array();
        $this->load->model('ortakpanel/siparisler');
        $data['iceriklerArr']   = $this->model_ortakpanel_siparisler->getTasarimById($this->request->get);
        $data['header']         = $this->load->controller('common/ortakpanel_header');
        $data['column_left']    = $this->load->controller('common/ortakpanel_left');
        $data['footer']         = $this->load->controller('common/ortakpanel_footer');

        $this->response->setOutput($this->load->view('ortakpanel/viewtasarim.tpl', $data));
    }

    function getTasarimImage(){
        $this->load->model('ortakpanel/siparisler');
        $image = $this->model_ortakpanel_siparisler->getTasarimImage($this->request->get);

        //uzantı
        $orjinal_resim_url  = $this->request->get['orjinal_resim_url'];
        $array = explode('.', $orjinal_resim_url);
        $extension = end($array);

        $this->response->addHeader("Content-Type: image/jpeg");
        $this->response->addHeader("Content-Disposition: attachment; filename=".time().".jpg");
        $this->response->setOutput($image);

    }

    function siparisSil(){
        $data           = array();
        $this->load->model('ortakpanel/siparisler');
        if (isset($this->request->get['order_id'])) {
            $order_id   = $this->request->get['order_id'];
        } else {
            $order_id   = 0;
        }

        $data           = $this->model_ortakpanel_siparisler->siparisSil($this->request->get);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($data));
    }
}

