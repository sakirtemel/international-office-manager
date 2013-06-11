<?php
/**
 *  File: /application/core/MY_Controller.php
 */
class MY_Controller extends CI_Controller {

    /**
     * Prefix with an underscore if you don't want it
     * publicly available through URI-routing
     */
    public function __construct()
    {
    	parent::__construct();
        // some common operation here
        $sess = array(
        		'usertype' => $this->session->userdata('usertype'),
        );
        $this->smart->assign("sess", $sess);
    }

}