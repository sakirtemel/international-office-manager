<?php
/**
 * Smarty plugin
 * @author Kemal BALABAN / kemalbalaban@gmail.com
 */


/**
 * Smarty mb_substr modifier plugin
 *
 * Type:     modifier<br>
 * Name:     mb_substr
 * Purpose:  mb_substr like in php
 * @param string
 * @return string
 */
function smarty_modifier_mb_substr($sString, $dFirst = 0, $dLast = 0, $cSet) {
    if(!function_exists("mb_substr")){
        if($dLast == 0) {
           return substr($sString, $dFirst);
        } else {
           return substr($sString, $dFirst, $dLast);
        }
    }else{
        return mb_substr($sString, $dFirst, $dLast, $cSet);
    }
}

?>