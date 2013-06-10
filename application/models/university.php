<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
class University extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function newUniversity(){}
	function saveUniversity(){}
	function makeAgreement(){}
	function addUniversity($data){
		$query = $this->db->insert("universities",$data);
		return $this->db->insert_id();
	}
	function updateUniversity($data){
		$this->db->where("universityCode", $data["universityCode"]);
		$query = $this->db->update("universities",$data);
		return $data["universityCode"];
	}
	function addAgreement($data){
	    
			
		$query = $this->db->insert("agreements",$data);
		return $this->db->insert_id();
	}
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
		//	$this->db->order_by("type", "desc");
		$query = $this->db->get("universities");
		return $query->result_array();
	}
	
	function getDepartments(){
		//$this->db->where('parentDirectory', $parentDirectory);
		//	$this->db->order_by("type", "desc");
		$query = $this->db->get("owndepartments");
		return $query->result_array();
	}
	function getUniversity($id){
		//$this->db->where('parentDirectory', $parentDirectory);
		//	$this->db->order_by("type", "desc");
		$this->db->where("universityCode", $id);
		$query = $this->db->get("universities");
		return $query->row_array();
	}

}