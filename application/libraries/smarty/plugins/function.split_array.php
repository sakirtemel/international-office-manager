<?php 

/* 
 * Smarty plugin 
 * ------------------------------------------------------------- 
 * Type:     function 
 * Name:     split_array 
 * Version:  1.0 
 * Date:     July 24, 2004 
 * Author:    Monte Ohrt <monte@ispi.net> 
 * Purpose:  split an array into equal proportioned arrays 
 * Input:    var = array to split  
 *           num = number of ways (columns) to split 
 *           assign = template var to assign result to 
 * 
 * Examples: {split_array var=$foobar num=4 assign="foobar"} 
 * ------------------------------------------------------------- 
 */ 
function smarty_function_split_array($params, &$smarty) 
{ 

    if(!isset($params['var'])) { 
        $smarty->trigger_error("split_array: missing 'var' parameter"); 
        return; 
    } 
    if(!isset($params['num'])) { 
        $smarty->trigger_error("split_array: missing 'num' parameter"); 
        return; 
    } 
    if(!isset($params['assign'])) { 
        $smarty->trigger_error("split_array: missing 'assign' parameter"); 
        return; 
    } 
    if(!is_array($params['var'])) { 
        $smarty->trigger_error("split_array: expecting 'var' as an array"); 
        return; 
    } 

    $_num = (int) $params['num']; 
        
    $_count = count($params['var']); 
    
    if($_count <= $_num ) { 
        for($_x = 0; $_x < $_count; $_x++) 
            $_split_array[$_x] = isset($params['var'][$_x]) ? array($params['var'][$_x]) : array(''); 
    } else { 
        $_mod = $_count % $_num; 
        $_div = floor($_count / $_num); 
        for($_x = 0; $_x < $_num; $_x++) { 
            if($_x+1 <= $_mod) 
                $_length = $_div + 1; 
            else 
                $_length = $_div; 

            $_split_array[$_x] = !empty($params['var']) ? array_splice($params['var'],0,$_length) : array(''); 
        } 
    } 

    $smarty->assign($params['assign'],$_split_array); 

} 

?> 