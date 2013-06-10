<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Student_Model extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function addUniversity($data){
		$query = $this->CI->db->insert("universities",$data);
		return $this->db->insert_id();
	}
	function addAgreement($data){
		$query = $this->CI->db->insert("agreements",$data);
		return $this->db->insert_id();
	}	
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("universities");
		return $query->result_array();
	}
	function getStudent($id){
		$this->db->select("students.*, owndepartments.departmentName, ownfaculties.facultyName");
		$this->db->join("outgoingStudents", "outgoingstudents.studentId = students.studentId");
		$this->db->join("owndepartments", "owndepartments.departmentId = outgoingStudents.departmentId","left");
		$this->db->join("ownfaculties", "owndepartments.facultyId = ownfaculties.facultyId");
	
		$this->db->where("students.studentId", $id);
		$query = $this->db->get("students");
		return $query->row_array();		
	}
	
	function filterStudents($departmentFilter, $yearFilter, $countryFilter){
		
		
		$this->db->select("students.*");
		$this->db->join('mobility', 'mobility.studentId = students.studentId');
		$this->db->join('outgoingstudents', 'outgoingstudents.studentId = students.studentId');
		$this->db->join('owndepartments', 'outgoingstudents.departmentId = owndepartments.departmentId');
		$this->db->join('years', 'years.yearCode = mobility.yearCode');
		$this->db->join('agreements', 'agreements.agreementCode = mobility.agreementCode');
		$this->db->join('universities', 'universities.universityCode = agreements.universityCode');
		$this->db->join('countries', 'countries.countryErasmusCode = universities.countryCode');
		
		if($departmentFilter!=0)
		{
		$this->db->like("owndepartments.departmentId", $departmentFilter);
		}
		if($yearFilter!=0)
		{
		$this->db->like("years.yearCode", $yearFilter);
		}

		if($countryFilter !== 0)
		{
			
		$this->db->like("countries.countryErasmusCode", $countryFilter);
		}
		
		
		$query = $this->db->get("students");
		//echo $this->db->last_query();
		return $query->result_array();
	}
	
	function searchStudent($term){
		//$term = "%".$term."%";
		//$this->db->select('CONCAT_WS(" ", `studentFirstName`, `studentMiddleName`, `studentLastName`) AS `studentFullName`');
		$this->db->select('students.studentId, students.studentFirstName, students.studentMiddleName, students.studentLastName');
		$this->db->select('outgoingstudents.studentNumber');
		$this->db->select('owndepartments.departmentName');
		
		$this->db->join('outgoingstudents', 'outgoingstudents.studentId = students.studentId');
		$this->db->join('owndepartments', 'outgoingstudents.departmentId = owndepartments.departmentId');
		
		$this->db->like("studentFirstName", $term);
		$this->db->or_like("studentMiddleName", $term);
		$this->db->or_like("studentLastName", $term);
		
		$this->db->or_like("studentNumber", $term);
		
		$query = $this->db->get("students", 25);
		return $query->result_array();
	}
	function getStudentMobilities($studentId){
		$this->db->select("mobility.*");
		$this->db->select("universities.universityName, universities.universityCode");
		$this->db->join("agreements","mobility.agreementCode = agreements.agreementCode","left");
		$this->db->join("universities","universities.universityCode = agreements.universityCode","left");
		$this->db->join("countries","universities.countryCode = countries.countryErasmusCode","left");
		$this->db->where("mobility.studentId", $studentId);
		$query = $this->db->get("mobility", 25);
		return $query->result_array();
	}
	
	

}