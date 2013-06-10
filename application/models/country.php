<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Country extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function newAgreement(){}
	function getCountries(){
		//$this->db->where('parentDirectory', $parentDirectory);
		$this->db->order_by("countryErasmusCode", "asc");
		$query = $this->db->get("countries");
		return $query->result_array();
	}

}