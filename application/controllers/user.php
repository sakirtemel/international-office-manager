<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends MY_Controller {

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
		$username = $this->input->post("username");
		$password = $this->input->post("password");
		
		$this->load->model("user_model");
		
		$user_id = $this->user_model->login($username, $password);
		if($user_id === 0)
			redirect("user/loginScreen/true");

		$this->session->set_userdata('user_id', $user_id->id);
		$this->session->set_userdata('username', $user_id->username);
		$this->session->set_userdata('usertype', $user_id->usertype);

		redirect('main');
	}
	public function loginScreen($incorrect = false){
		if($incorrect)
			$this->smart->assign("incorrect", "true");
		else
			$this->smart->assign("incorrect", "false");
		$this->smart->output("login.tpl");
	}
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */