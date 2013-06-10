<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Document extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	
	
	
	function getLog(){
		$this->db->select("log.*");
		
	
		
		$query = $this->db->get("log");
		return $query->result_array();		
	}
	
function getLastaddstd(){
		$this->db->select("lastaddstd.*");
		
	
		
		$query = $this->db->get("lastaddstd");
		return $query->result_array();		
	}
}