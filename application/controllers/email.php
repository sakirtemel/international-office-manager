<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email extends MY_Controller {

	public function __construct(){
		parent::__construct();
	}
	
	public function index()
	{
	}
	
	function inbox(){}
	function sentMail(){}
	function composeMail(){}
	function showLogs(){}
	
	function sendEmail(){
		$subject = $this->input->post("subject");
		$content = $this->input->post("content");
		$studentEmail = $this->input->post("studentEmail");
		
		
		$email_config = Array(
				'protocol'  => 'smtp',
				'smtp_host' => 'ssl://smtp.googlemail.com',
				'smtp_port' => '465',
				'smtp_user' => 'cse344project2013group14@gmail.com',
				'smtp_pass' => 'cse344project2013group14!',
				'mailtype'  => 'html',
				'starttls'  => true,
				'newline'   => "\r\n"
		);
		
		$this->load->library('email', $email_config);
		
		$this->email->from('cse344project2013group14@gmail.com', 'Group14');
		$this->email->to($studentEmail);
		$this->email->subject($subject);
		$this->email->message($content);
		
		$this->email->send();
		
		echo "tamam";
		
	}


}

/* End of file main.php */
/* Location: ./application/controllers/main.php */