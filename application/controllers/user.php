<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->helper(array('form', 'url'));
		$this->load->model("user_model");
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
	
	function userControl(){
	
		
		if($_POST):
		$data = array(
				'username' => $this->input->post('username'),
				'password' => $this->input->post('password'),
				'email' =>  $this->input->post('email'),
				'usertype' =>  $this->input->post('usertype')				
				
		);
		$this->user_model->addUser($data);
		
		endif;
		$this->smart->assign("users", $this->user_model->getUsers());
		$this->smart->assign("center", $this->smart->fetch("user/adduser.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function change(){
	
		
		if($_POST):
		
		$un=$this->input->post('username');
		$ut=$this->input->post('usertype');
		
	    				
				
		
		$this->user_model->updateUser($un,$ut);
		
		endif;
		$this->smart->assign("users", $this->user_model->getUsers());
		$this->smart->assign("center", $this->smart->fetch("user/adduser.tpl"));
		$this->smart->output("main.tpl");
	}
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */