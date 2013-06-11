<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class User_Model extends CI_Model {

	var $name   = '';
	var $content = '';
	var $date    = '';

	function __construct()
	{
		// Call the Model constructor
		parent::__construct();
	}

	function login($username, $password){
		$this->db->where("username", $username);
		$query = $this->db->get("users");
		$result = $query->row();
		if(!$result) //username not found
			return 0;
		if($result->password != $password)
			return 0;
		return $result;
	}	
	function getAgreements()
	{
	$this->db->select("agreements.*");
		
	
		
		$query = $this->db->get("agreements");
		return $query->result_array();	
	}
	

}