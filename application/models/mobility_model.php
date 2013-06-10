<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Mobility_Model extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function newAgreement(){}
	

	function addUniversity($data){
		$query = $this->CI->db->insert("universities",$data);
		return $this->db->insert_id();
	}
	function addAgreement($data){
		$query = $this->CI->db->insert("agreements",$data);
		return $this->db->insert_id();
	}	
	
	
	function getBudgets(){
		
	}
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("universities");
		return $query->result_array();
	}
	function getStudent($id){
		$this->db->where("studentId", $id);
		$query = $this->db->get("students");
		return $query->result_row();		
	}
	function getGrants($id){
		$this->db->where("mobilityId", $id);
		$this->db->order_by("cdate", "DESC");
		$query = $this->db->get("grants");
		return $query->result_array();
	}
	
	function getGrantsDetail($mobilityId){
		
		$this->db->select("mobility.*");
		$this->db->select("universities.universityName, countries.countryName, grantsbyyears.amount");
		
		$this->db->join("agreements","agreements.agreementCode = mobility.agreementCode","left");
		$this->db->join("universities","universities.universityCode = agreements.universityCode","left");
		$this->db->join("countries","countries.countryErasmusCode = universities.countryCode","left");
		$this->db->join("grantsbyyears","grantsbyyears.countryCode = universities.countryCode AND grantsbyyears.yearCode = mobility.yearCode","left");
		
		$this->db->where("mobilityId", $mobilityId);
		$query = $this->db->get("mobility");
		return $query->row_array();
	}
	function addGrant($data){
		$query = $this->CI->db->insert("grants",$data);
		return $this->db->insert_id();
	}
	function deleteGrant($data){
		$this->db->where("id", $data["grantID"]);
		$this->db->delete("grants");
		return 1;
	}
	
	function getYears(){
		//$this->db->where('parentDirectory', $parentDirectory);
		$this->db->order_by("yearCode", "asc");
		$query = $this->db->get("years");
		return $query->result_array();
	}
}