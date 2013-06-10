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
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("dbo.UNIVERSITY");
		return $query->result_array();
	}
	function getStudent($id){
		$this->db->where("studentId", $id);
		$query = $this->db->get("student");
		return $query->result_row();		
	}
	function getGrants($id){
		$this->db->where("mobilityId", $id);
		$this->db->order_by("cdate", "DESC");
		$query = $this->db->get("grant");
		return $query->result_array();
	}
	function addGrant($data){
		$query = $this->CI->db->insert("grant",$data);
		return $this->db->insert_id();
	}	
	
}

?>
