<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->helper(array('form', 'url'));
	}
	
	public function index()
	{
//		redirect("ogrenci/araOgrenci");
	}
	
	public function logout(){
		$this->session->sess_destroy();
		redirect('');
	}
	public function login(){
		$this->session->set_userdata('user_id', 3);
	}
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */