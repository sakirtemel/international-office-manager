<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Filemanager_lib
{
	var $CI;
	var $db;
	function __construct(){
		$this->CI =& get_instance();
		$this->db = $this->CI->db;
	}   
	
	function addFile($file){
		$query = $this->CI->db->insert("files",$file);
		//return $query->insert_id(); //HATA aldım.
	}
	
	function getFiles($parentDirectory){
		$this->db->where('parentDirectory', $parentDirectory);
		$this->db->order_by("type", "desc");
		$query = $this->db->get("files");
		return $query->result_array();
	}
	
	function deleteFile($fileId){
		return $query = $this->CI->db->delete("files",array('fileId' => $fileId));
	}
	/**
	 * verilen file'ın(ya da directory'nin) parentDirectory id'sini geri dondurur
	 * */
	function getParentDirectoryId($fileId){
		$this->db->select("parentDirectory");
		$this->db->where("fileId", $fileId);
		$query = $this->db->get("files");
		$query = $query->row_array();
		if(!$query)
			return 0;
		return $query["parentDirectory"];
	}
	
	function getParentDirectory($fileId){
		$this->db->where("fileId", $fileId);
		$query = $this->db->get("files");
		$query = $query->row_array();
		if(!$query)
			return 0;
		return $query;
	}
	
	function getPreviousDirectories($directoryId)
	{
		if($directoryId == 0){
			$data = array(
					array('id' => 0,
					'name' => 'Home',
					));
			return $data;	
		}
		
		$biOnceki = $this->getParentDirectory($directoryId);
		$data = array();

		$data = $this->getPreviousDirectories($biOnceki["parentDirectory"]);
		$data[] = array(
				'id' => $biOnceki["fileId"],
				'name' => $biOnceki["name"],
		);
		return $data;
	}
}

?>
