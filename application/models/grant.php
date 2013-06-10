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

	
	function newAgreement(){}
	

}