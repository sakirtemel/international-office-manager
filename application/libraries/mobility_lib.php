<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Mobility_lib
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
	
	
	function getBudgets(){
		
	}
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("dbo.UNIVERSITY");
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
		$query = $this->db->get("grantActivity");
		return $query->result_array();
	}
	
	function getGrantsDetail($mobilityId){
		
		$this->db->select("mobility.*");
		$this->db->select("university.universityName, country.countryName, grantByYear.amount");
		
		$this->db->join("agreement","agreement.agreementCode = mobility.agreementCode","left");
		$this->db->join("university","university.universityCode = agreement.universityCode","left");
		$this->db->join("country","country.countryErasmusCode = university.countryCode","left");
		$this->db->join("grantByYear","grantByYear.countryCode = university.countryCode AND grantByYear.yearCode = mobility.yearCode","left");
		
		$this->db->where("mobilityId", $mobilityId);
		$query = $this->db->get("mobility");
		return $query->row_array();
	}
	function addGrant($data){
		$query = $this->CI->db->insert("grantActivity",$data);
		return $this->db->insert_id();
	}
	function deleteGrant($data){
		$this->db->where("id", $data["grantID"]);
		$this->db->delete("GrantActivity");
		return 1;
	}
	
}

?>
