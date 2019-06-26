<?php defined('BASEPATH') OR exit('No direct script access allowed');

class City extends MY_Controller
{
    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            redirect('login');
        }
        if ($this->Customer || $this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->load('customers', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->model('companies_model');
        $this->load->model('payment_terms');
    }

    function index1($action = NULL)
    {
        // $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('City')));
        $meta = array('page_title' => lang('City'), 'bc' => $bc);
        $this->page_construct('settings/city', $meta, $this->data);
    }

    public function add($action = NULL)
    {
        $city_Name = $this->input->post('name');
        $city_Code = $this->input->post('code');
        // print_r($city_Name);
        // print_r($city_Code);

        // $data['city'] = array(
        //     'city_code' => $city_Code,
        //     'city_name' => $city_Name
        // );


        $query="insert into sma_city values('','$city_Code','$city_Name')";
        $this->db->query($query);

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('City')));
        $meta = array('page_title' => lang('City'), 'bc' => $bc);

        $this->page_construct('settings/city', $meta, $this->data);
        
    }

}
