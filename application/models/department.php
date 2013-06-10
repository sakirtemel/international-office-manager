<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Department extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function newAgreement(){}
	
	function getDepartments(){
		//$this->db->where('parentDirectory', $parentDirectory);
		$this->db->order_by("departmentName", "asc");
		$query = $this->db->get("owndepartments");
		return $query->result_array();
	}
}