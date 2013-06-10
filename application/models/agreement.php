<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Agreement extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	function getAgreements()
	{
	$this->db->select("agreements.*");
		
	
		
		$query = $this->db->get("agreements");
		return $query->result_array();	
	}
	

}