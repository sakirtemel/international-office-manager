<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require 'smarty/Smarty.class.php';

class Smart extends Smarty
{
    function __construct()
    {        
        parent::__construct();
		$application_folder = 'application';
        $this->cache_dir    = $application_folder.'/cache/templates_cache/';
        $this->compile_dir  = $application_folder.'/cache/templates/';
        $this->template_dir = $application_folder.'/views/default_theme/';
//		$this->assign('BASE_URL',base_url());
//		$this->assign('BASE_URL','http://cseclub.marmara.edu.tr/maraton/');
		$this->assign('BASE_URL','http://localhost:81/erasmus/');
		}
    function Output($tpl)
    {
            echo $this->fetch($tpl);     
    }
}

?>
