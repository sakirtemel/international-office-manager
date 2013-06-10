<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class University_lib
{
	var $CI;
	var $db;
	function __construct(){
		$this->CI =& get_instance();
		$this->db = $this->CI->db;
	}   
	
	function addUniversity($data){
		$query = $this->db->insert("University",$data);
		return $this->db->insert_id();
	}
	function updateUniversity($data){
		$this->db->where("universityCode", $data["universityCode"]);
		$query = $this->db->update("University",$data);
		return $data["universityCode"];
	}
	function addAgreement($data){
		$query = $this->db->insert("Agreement",$data);
		return $this->db->insert_id();
	}	
	
	function getUniversities(){
		//$this->db->where('parentDirectory', $parentDirectory);
	//	$this->db->order_by("type", "desc");
		$query = $this->db->get("University");
		return $query->result_array();
	}
	function getUniversity($id){
		//$this->db->where('parentDirectory', $parentDirectory);
		//	$this->db->order_by("type", "desc");
		$this->db->where("universityCode", $id);
		$query = $this->db->get("University");
		return $query->row_array();
	}
	
}

?>
