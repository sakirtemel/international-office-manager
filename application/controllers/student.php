<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Student extends MY_Controller {

	public function __construct(){
		parent::__construct();
		//$this->load->library("filemanager_lib");
		$this->load->helper(array('form', 'url'));
		$this->load->model("student_model");
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
	function detayOgrenci($id = 1){
		
		
		$this->smart->assign("studentMobilities", $this->student_model->getStudentMobilities($id));
		$this->smart->assign("student", $this->student_model->getStudent($id));
		$this->smart->assign("center", $this->smart->fetch("student/details.tpl"));
		$this->smart->output("main.tpl");		
	}
	function searchStudent(){ /* ajax Request */
		$data = $this->student_model->searchStudent($this->input->get("term"));
		$data2 = array();
		foreach($data as $row):
			$data2[] = array(
						'id' => $row["studentId"],
						'label' => $row["studentFirstName"]." ".$row["studentMiddleName"]." ".$row["studentLastName"].", ".$row["studentNumber"].", ".$row["departmentName"],
					);
		endforeach;
		echo json_encode($data2);
	}

}

/* End of file main.php */
/* Location: ./application/controllers/main.php */