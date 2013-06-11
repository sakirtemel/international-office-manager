<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends MY_Controller {

	public function __construct(){
		parent::__construct();
		
		if ($this->session->userdata('user_id') == "") {
			redirect('user/loginScreen');
			die();
		}
		
		
		//$this->load->library("filemanager_lib");
		$this->load->helper(array('form', 'url'));
		$this->load->model("mobility_model");
		$this->load->model("university");
		$this->load->model("department");
		$this->load->model("mobility_model");
		$this->load->model("country");
		$this->load->model("student_model");
		$this->load->model("document");
		$this->load->model("agreement");
	}
	
	public function index()
	{
		$this->smart->assign("lastaddstd", $this->document->getLastaddstd());
		
		
		$this->smart->assign("budgets", $this->mobility_model->getBudgets());
		$this->smart->assign("center", $this->smart->fetch("pages/dashboard.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function tumUniversiteler(){
		$this->smart->assign("universities", $this->university->getUniversities());
		$this->smart->assign("center", $this->smart->fetch("university/list.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function tumOgrenciler(){
		$this->smart->assign("students", $this->student_model->getAllStudents());
		$this->smart->assign("center", $this->smart->fetch("student/displayall.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function tumAnlasmalar(){
		$this->smart->assign("agreements", $this->agreement->getAgreements());
		$this->smart->assign("center", $this->smart->fetch("agreement/list.tpl"));
		$this->smart->output("main.tpl");
	}
	
	
	function ekleUniversite(){
		if($_POST):
			$data = array(
						'universityCode' => $this->input->post('universityCode'),
						'universityName' => $this->input->post('universityName'),
						'countryCode'    => $this->input->post('countryCode'),
						'cityCode'    => $this->input->post('cityCode'),
						'universityWebsite'    => $this->input->post('universityWebsite'),
						'universityAddress'    => $this->input->post('universityAddress')
					);
			$this->university->addUniversity($data);
		endif;
		$this->smart->assign("countries", $this->country->getCountries());
		$this->smart->assign("center", $this->smart->fetch("university/add.tpl"));
		$this->smart->output("main.tpl");
	}
	function duzenleUniversite($universityCode){
		if($_POST):
		$data = array(
				'universityCode' => $this->input->post('universityCode'),
				'universityName' => $this->input->post('universityName'),
	
		);
		$this->university->updateUniversity($data);
		endif;
		$this->smart->assign("university", $this->university->getUniversity($universityCode));
		$this->smart->assign("center", $this->smart->fetch("university/edit.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function ekleAnlasma(){
		if($_POST):
		$data = array(
				'agreementCode' => $this->input->post('agreementCode'),
				'universityCode' => $this->input->post('universityCode'),
				'departmentId' =>  $this->input->post('departmentId')
		);
		$this->university->addAgreement($data);
		
		endif;
		
		$this->smart->assign("owndepartments", $this->university->getDepartments());
		$this->smart->assign("universities", $this->university->getUniversities());
		
		
		$this->smart->assign("center", $this->smart->fetch("agreement/add.tpl"));
		
		$this->smart->output("main.tpl");	
	}
	
	function ekleOgrenci(){
		if($_POST):
		$data = array(
				'studentFirstName' => $this->input->post('studentFirstName'),
				'studentMiddleName' => $this->input->post('studentMiddleName'),
				'studentLastName' =>  $this->input->post('studentLastName'),
				'studentPhone' =>  $this->input->post('studentPhone'),
				'studentEmail' =>  $this->input->post('studentEmail'),
				'studentType' =>  $this->input->post('studentType')
		);
		$this->student_model->addStudent($data);
		
		endif;
		
		
		
		
		$this->smart->assign("center", $this->smart->fetch("student/add.tpl"));
		
		$this->smart->output("main.tpl");	
	}
	function araOgrenci(){
		if($_POST):
		$data = array(
				'agreementCode' => $this->input->post('agreementCode'),
				'universityCode' => $this->input->post('universityCode'),
		
		);
		$this->university->addAgreement($data);
		endif;
		//$this->smart->assign("universities", $this->university->getUniversities());
		$this->smart->assign("center", $this->smart->fetch("student/search.tpl"));
		$this->smart->output("main.tpl");	
	}
	function detayOgrenci($id = 0){
		if($_POST):
		$data = array(
				'agreementCode' => $this->input->post('agreementCode'),
				'universityCode' => $this->input->post('universityCode'),
		
		);
		$this->university->addAgreement($data);
		endif;
		//$this->smart->assign("universities", $this->university->getUniversities());
		$this->smart->assign("center", $this->smart->fetch("student/details.tpl"));
		$this->smart->output("main.tpl");		
	}

	function excel(){
		$filterClause = null;
		
		if($_POST):
		
		$dep=$this->input->post('dept');
		$yea=$this->input->post('year');
		$cou=$this->input->post('countryCode');
		$filterClause = $this->student_model->filterStudents($dep, $yea, $cou);
		
		endif;
		
		$this->smart->assign("students", $filterClause);
		$this->smart->assign("countries", $this->country->getCountries());
		$this->smart->assign("years", $this->mobility_model->getYears());
		$this->smart->assign("owndepartments", $this->department->getDepartments());
		$this->smart->assign("center", $this->smart->fetch("excel/filter.tpl"));
		$this->smart->output("main.tpl");
	}
	
	
	function log(){
	
		
		
		$this->smart->assign("log", $this->document->getLog());
		$this->smart->assign("center", $this->smart->fetch("log/log.tpl"));
		$this->smart->output("main.tpl");
	}
	
	function istatistikler(){
		$this->smart->assign("center", $this->smart->fetch("statistics/main.tpl"));
		$this->smart->output("main.tpl");		
	}
	
	function ses(){
		//$this->session->set_userdata('admin_mi', 'evet');
		
	}
	
	public function listele($currentDirectory = 0)
	{
		$this->smart->assign("previousDirectories", $this->filemanager_lib->getPreviousDirectories($currentDirectory));
		$this->smart->assign("parentDirectory", $this->filemanager_lib->getParentDirectoryId($currentDirectory));
		$this->smart->assign("currentDirectory", $currentDirectory);
		$this->smart->assign("files", $this->filemanager_lib->getFiles($currentDirectory));
		$this->smart->assign("liste_content", $this->smart->fetch("liste_content.tpl"));		
		$this->smart->assign("center", $this->smart->fetch("listele.tpl"));
		$this->smart->output("main.tpl");
	}
	public function listeleAjax($currentDirectory = 0)
	{
		$this->smart->assign("previousDirectories", $this->filemanager_lib->getPreviousDirectories($currentDirectory));
		$this->smart->assign("parentDirectory", $this->filemanager_lib->getParentDirectoryId($currentDirectory));
		$this->smart->assign("currentDirectory", $currentDirectory);
		$this->smart->assign("files", $this->filemanager_lib->getFiles($currentDirectory));
		$this->smart->assign("liste_content", $this->smart->fetch("liste_content.tpl"));
		$this->smart->output("listele.tpl");
	}
	
	public function yeniDosya($currentDirectory)
	{
		if($_POST){
			$file = array(
					'name' => $this->input->post("name"),
					'size' => $this->input->post("size"),
					'owner' => $this->input->post("owner"),
					'type' => 'file',
					'filePath' => "",
					'parentDirectory' => $currentDirectory,
			);
		
			$this->filemanager_lib->addFile($file);
			redirect("/welcome/listele/" . $currentDirectory);
		}
		$this->smart->assign("currentDirectory", $currentDirectory);
		$this->smart->assign("center", $this->smart->fetch("yenidosya.tpl"));
		$this->smart->output("main.tpl");
	}
	
	public function yeniKlasor($currentDirectory)
	{
		if($_POST){
			$file = array(
					'name' => $this->input->post("name"),
					'size' => $this->input->post("size"),
					'owner' => $this->input->post("owner"),
					'type' => 'directory',
					'filePath' => "",
					'parentDirectory' => $currentDirectory,
			);
	
			$this->filemanager_lib->addFile($file);
			redirect("/welcome/listele/" . $currentDirectory);
		}
		$this->smart->assign("currentDirectory", $currentDirectory);
		$this->smart->assign("center", $this->smart->fetch("yeniklasor.tpl"));
		$this->smart->output("main.tpl");
	}
	
	public function dosyaSil($fileId)
	{
		//$this->filemanager_lib->deleteFile($fileId);
		//redirect("/welcome");
		echo "tamam";
	}
	
	function do_upload($currentDirectory = 0)
	{
		$config['upload_path'] = './uploads/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['remove_spaces'] = 'TRUE';
		//$config['max_size']	= '100';
		print_r($this->input->post("userfile"));
		$this->load->library('upload', $config);
		$this->upload->initialize($config);
		
		if ( $_FILES ) {
		
			for($i=0; $i < count($_FILES['userfile']['tmp_name']); $i++)
			{
				if (!$this->upload->do_upload('userfile', $i))
				{
					$error = $this->upload->display_errors();
					print_r($error);
				}
				else {
					$data = $this->upload->data();
					print_r($data);
				}
			}
		}
	}	
		/*
		 * foreach($_FILES as $key => $value)
		{
		 $this->upload->initialize($config);
			
		if (!$this->upload->do_upload($key))
		{
		$error=$this->upload->display_errors();
		print_r($error);
		}
		else {
		$data = $this->upload->data();
		print_r($data);
		}
		$i++;
		}*/
		
		
		/*$this->upload->initialize($config);
		
		if ( ! $this->upload->do_upload("userfile"))
		{
			$error = array('error' => $this->upload->display_errors());
			print_r($error);
		}
		else
		{
			$data = array('upload_data' => $this->upload->data());
			print_r($data);
		}*/
}

/* End of file main.php */
/* Location: ./application/controllers/main.php */