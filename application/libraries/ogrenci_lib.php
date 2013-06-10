<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Ogrenci_lib
{
	var $CI;
	var $db;
	function __construct(){
		$this->CI =& get_instance();
		$this->db = $this->CI->db;
	}   
	
	function addUniversity($data){
		$query = $this->CI->db->insert("dbo.UNIVERSITY",$data);
		return $this->db->insert_id();
	}
	function addAgreement($data){
		$query = $this->CI->db->insert("dbo.AGREEMENT",$data);
		return $this->db->insert_id();
	}	
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("dbo.UNIVERSITY");
		return $query->result_array();
	}
	function getStudent($id){
		$this->db->select("student.*, ownDepartment.departmentName, ownFaculty.facultyName");
		$this->db->join("outgoingStudent", "outgoingStudent.studentId = student.studentId");
		$this->db->join("owndepartment", "ownDepartment.departmentId = outgoingStudent.departmentId","left");
		$this->db->join("ownFaculty", "ownDepartment.facultyId = ownFaculty.facultyId");
	
		$this->db->where("student.studentId", $id);
		$query = $this->db->get("student");
		return $query->row_array();		
	}
	function searchStudent($term){
		$term = "%".$term."%";
		//$this->db->select('CONCAT_WS(" ", `studentFirstName`, `studentMiddleName`, `studentLastName`) AS `studentFullName`');
		$this->db->select('studentFirstName, studentMiddleName, studentLastName');
		$this->db->select("studentId");
		$this->db->like("studentFirstName", $term);
		$this->db->or_like("studentMiddleName", $term);
		$this->db->or_like("studentLastName", $term);
		
		$query = $this->db->get("student", 25);
		return $query->result_array();
	}
	function getStudentMobilities($studentId){
		$this->db->select("mobility.*");
		$this->db->select("university.universityName, university.universityCode");
		$this->db->join("agreement","mobility.agreementCode = agreement.agreementCode","left");
		$this->db->join("university","university.universityCode = agreement.universityCode","left");
		$this->db->join("country","university.countryCode = country.countryErasmusCode","left");
		$this->db->where("mobility.studentId", $studentId);
		$query = $this->db->get("mobility", 25);
		return $query->result_array();
	}
	
}

?>
