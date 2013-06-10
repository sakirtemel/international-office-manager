<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mobility extends CI_Controller {

	public function __construct(){
		parent::__construct();
		//$this->load->library("filemanager_lib");
		$this->load->helper(array('form', 'url'));
		$this->load->model("student_model");
		$this->load->model("mobility_model");
	}
	
	public function index()
	{
		redirect("ogrenci/araOgrenci");
	}
	
	function araOgrenci(){
		if($_POST):
		$data = array(
				'agreementCode' => $this->input->post('agreementCode'),
				'universityCode' => $this->input->post('universityCode'),
		
		);
		$this->university_lib->addAgreement($data);
		endif;
		//$this->smart->assign("universities", $this->university_lib->getUniversities());
		$this->smart->assign("center", $this->smart->fetch("student/search.tpl"));
		$this->smart->output("main.tpl");	
	}
	function detayHibe($id = 1){
		$this->smart->assign("grantsDetails", $this->mobility_model->getGrantsDetail($id));
		$this->smart->assign("grants", $this->mobility_model->getGrants($id));
		$this->smart->assign("student", $this->student_model->getStudent($id));
		$this->smart->assign("center", $this->smart->fetch("grants/details.tpl"));
		$this->smart->output("main.tpl");		
	}
	function addGranty(){
		$data = array(
				'amount' => $this->input->post("amount"),
				'[desc]' => $this->input->post("desc"),
				'mobilityId' => $this->input->post("mobilityId"),
				);
		if($this->mobility_model->addGrant($data))
			echo "tamam";
	}
	function deleteGranty(){
		$data = array(
				'grantID' => $this->input->post("grantID"),
		);
		if($this->mobility_model->deleteGrant($data))
			echo "tamam";
	}

}

/* End of file main.php */
/* Location: ./application/controllers/main.php */