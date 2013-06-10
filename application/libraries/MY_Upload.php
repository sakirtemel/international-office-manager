<?php

if (!defined('BASEPATH')) exit('No direct access allowed.');

class MY_upload extends CI_upload {

    /**$this->CI->
     * Perform the file upload
     *
     * @access	public
     * @return	bool
     */
    function do_upload($field = 'userfile', $i=0)
    {
            // Is $_FILES[$field] set? If not, no reason to continue.
            if ( ! isset($_FILES[$field]))
            {
                    $this->set_error('upload_no_file_selected');
                    return FALSE;
            }

            // Is the upload path valid?
            if ( ! $this->validate_upload_path())
            {
                    // errors will already be set by validate_upload_path() so just return FALSE
                    return FALSE;
            }

            // Was the file able to be uploaded? If not, determine the reason why.
            if ( ! is_uploaded_file($_FILES[$field]['tmp_name'][$i]))
            {
                    $error = ( ! isset($_FILES[$field]['error'][$i])) ? 4 : $_FILES[$field]['error'][$i];

                    switch($error)
                    {
                            case 1:	// UPLOAD_ERR_INI_SIZE
                                    $this->set_error('upload_file_exceeds_limit');
                                    break;
                            case 2: // UPLOAD_ERR_FORM_SIZE
                                    $this->set_error('upload_file_exceeds_form_limit');
                                    break;
                            case 3: // UPLOAD_ERR_PARTIAL
                               $this->set_error('upload_file_partial');
                                    break;
                            case 4: // UPLOAD_ERR_NO_FILE
                               $this->set_error('upload_no_file_selected');
                                    break;
                            case 6: // UPLOAD_ERR_NO_TMP_DIR
                                    $this->set_error('upload_no_temp_directory');
                                    break;
                            case 7: // UPLOAD_ERR_CANT_WRITE
                                    $this->set_error('upload_unable_to_write_file');
                                    break;
                            case 8: // UPLOAD_ERR_EXTENSION
                                    $this->set_error('upload_stopped_by_extension');
                                    break;
                            default :   $this->set_error('upload_no_file_selected');
                                    break;
                    }

                    return FALSE;
            }

            // Set the uploaded data as class variables
            $this->file_temp = $_FILES[$field]['tmp_name'][$i];
            $this->file_size = $_FILES[$field]['size'][$i];
            $this->file_type = preg_replace("/^(.+?);.*$/", "1", $_FILES[$field]['type'][$i]);
            $this->file_type = strtolower(trim(stripslashes($this->file_type), '"'));
            $this->file_name = $this->_prep_filename($_FILES[$field]['name'][$i]);
            $this->file_ext	 = $this->get_extension($this->file_name);
            $this->client_name = $this->file_name;

            // Is the file type allowed to be uploaded?
            if ( ! $this->is_allowed_filetype())
            {
                    $this->set_error('upload_invalid_filetype');
                    return FALSE;
            }

            // if we're overriding, let's now make sure the new name and type is allowed
            if ($this->_file_name_override != '')
            {
                    $this->file_name = $this->_prep_filename($this->_file_name_override);
                    $this->file_ext  = $this->get_extension($this->file_name);

                    if ( ! $this->is_allowed_filetype(TRUE))
                    {
                            $this->set_error('upload_invalid_filetype');
                            return FALSE;
                    }
            }

            // Convert the file size to kilobytes
            if ($this->file_size > 0)
            {
                    $this->file_size = round($this->file_size/1024, 2);
            }

            // Is the file size within the allowed maximum?
            if ( ! $this->is_allowed_filesize())
            {
                    $this->set_error('upload_invalid_filesize');
                    return FALSE;
            }

            // Are the image dimensions within the allowed size?
            // Note: This can fail if the server has an open_basdir restriction.
            if ( ! $this->is_allowed_dimensions())
            {
                    $this->set_error('upload_invalid_dimensions');
                    return FALSE;
            }

            // Sanitize the file name for security
            $this->file_name = $this->clean_file_name($this->file_name);

            // Truncate the file name if it's too long
            if ($this->max_filename > 0)
            {
                    $this->file_name = $this->limit_filename_length($this->file_name, $this->max_filename);
            }

            // Remove white spaces in the name
            if ($this->remove_spaces == TRUE)
            {
                    $this->file_name = preg_replace("/s+/", "_", $this->file_name);
            }

            /*
             * Validate the file name
             * This function appends an number onto the end of
             * the file if one with the same name already exists.
             * If it returns false there was a problem.
             */
            $this->orig_name = $this->file_name;

            if ($this->overwrite == FALSE)
            {
                    $this->file_name = $this->set_filename($this->upload_path, $this->file_name);

                    if ($this->file_name === FALSE)
                    {
                            return FALSE;
                    }
            }

            /*
             * Move the file to the final destination
             * To deal with different server configurations
             * we'll attempt to use copy() first.  If that fails
             * we'll use move_uploaded_file().  One of the two should
             * reliably work in most environments
             */
            if ( ! @copy($this->file_temp, $this->upload_path.$this->file_name))
            {
                    if ( ! @move_uploaded_file($this->file_temp, $this->upload_path.$this->file_name))
                    {
                             $this->set_error('upload_destination_error');
                             return FALSE;
                    }
            }

            /*
             * Run the file through the XSS hacking filter
             * This helps prevent malicious code from being
             * embedded within a file.  Scripts can easily
             * be disguised as images or other file types.
             */
            if ($this->xss_clean == TRUE)
            {
                    $this->do_xss_clean();
            }

            /*
             * Set the finalized image dimensions
             * This sets the image width/height (assuming the
             * file was an image).  We use this information
             * in the "data" function.
             */
            $this->set_image_properties($this->upload_path.$this->file_name);

            return TRUE;
    }
    
    function clean_file_name($filename)
    {
    	$bad = array(
    			"<!--",
    			"-->",
    			"'",
    			"<",
    			">",
    			'"',
    			'&',
    			'$',
    			'=',
    			';',
    			'?',
    			'/',
    			"%20",
    			"%22",
    			"%3c",		// <
    			"%253c",	// <
    			"%3e",		// >
    			"%0e",		// >
    			"%28",		// (
    			"%29",		// )
    			"%2528",	// (
    			"%26",		// &
    			"%24",		// $
    			"%3f",		// ?
    			"%3b",		// ;
    			"%3d"		// =
    	);
    
    	$filename = str_replace($bad, '', $filename);
    
    	//	ekleme {
    	$specialLetters = array(
    			'a' => array('á','à','â','ä','ã'),
    			'A' => array('Ã','Ä','Â','À','Á'),
    			'e' => array('é','è','ê','ë'),
    			'E' => array('Ë','É','È','Ê'),
    			'i' => array('í','ì','î','ï','ı'),
    			'I' => array('Î','Í','Ì','İ','Ï'),
    			'o' => array('ó','ò','ô','ö','õ'),
    			'O' => array('Õ','Ö','Ô','Ò','Ó'),
    			'u' => array('ú','ù','û','ü'),
    			'U' => array('Ú','Û','Ù','Ü'),
    			'c' => array('ç'),
    			'C' => array('Ç'),
    			's' => array('ş'),
    			'S' => array('Ş'),
    			'n' => array('ñ'),
    			'N' => array('Ñ'),
    			'y' => array('ÿ'),
    			'Y' => array('Ÿ'),
    			'G' => array('Ğ'),
    			'g' => array('ğ')
    	);
    
    	foreach($specialLetters as $letter => $specials){
    		foreach($specials as $s){
    			$filename = str_replace($s, $letter, $filename);
    		}
    	}
    
    	$fd = explode('.', $filename);
    	$uzanti = strtolower(array_pop($fd));
    	array_push($fd, $uzanti);
    	$filename = implode('.', $fd);
    	//	}
    
    	return preg_replace("/[^a-zA-Z0-9\-\.]/", "_", stripslashes($filename));
    }

}