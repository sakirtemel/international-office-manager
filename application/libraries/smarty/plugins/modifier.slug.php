<?php
/**
 * Smarty plugin
 * 
 * @package Smarty
 * @subpackage PluginsModifier
 */

/**
 * Smarty capitalize modifier plugin
 * 
 * Type:     modifier<br>
 * Name:     capitalize<br>
 * Purpose:  capitalize words in the string
 *
 * {@internal {$string|capitalize:true:true} is the fastest option for MBString enabled systems }}
 *
 * @param string  $string    string to capitalize
 * @param boolean $uc_digits also capitalize "x123" to "X123"
 * @param boolean $lc_rest   capitalize first letters, lowercase all following letters "aAa" to "Aaa"
 * @return string capitalized string
 * @author Monte Ohrt <monte at ohrt dot com> 
 * @author Rodney Rehm
 */
function smarty_modifier_slug($string, $baslik)
{
//function url_title($str, $separator = 'dash', $lowercase = TRUE) {
$str = $baslik ."-".$string;
$separator = 'dash';
$lowercsase = TRUE;
        $lowercase = TRUE;
        if ($separator == 'dash') {
            $search = '_';
            $replace = '-';
        } else {
            $search = '-';
            $replace = '_';
        }

        $trans = array(
            '&\#\d+?;' => '',
            '&\S+?;' => '',
            '\s+' => $replace,
            '[^a-z0-9\-\._\çğıöşüÇĞİÖŞÜ]' => '',
            $replace . '+' => $replace,
            $replace . '$' => $replace,
            '^' . $replace => $replace,
            '\.+$' => '', '\.' => '',
            'ç' => 'c', 'ğ' => 'g', 'ı' => 'i', 'ö' => 'o', 'ş' => 's', 'ü' => 'u',
            'Ç' => 'C', 'Ğ' => 'G', 'İ' => 'I', 'Ö' => 'O', 'Ş' => 'S', 'Ü' => 'U'
        );

        $str = strip_tags($str);

        foreach ($trans as $key => $val) {
            $str = preg_replace("#" . $key . "#i", $val, $str);
        }

        if ($lowercase === TRUE) {
            $str = strtolower($str);
        }
        $str = trim(stripslashes($str));
        return trim($str, "-");
} 

?>
