<?php
/*
* Smarty plugin
* -------------------------------------------------------------
* Type: function
* Name: date_diff
* Version: 2.0
* Date: June 22, 2008
* Author: Matt DeKok
* Purpose: factor difference between two dates in days, weeks,
*          or years
* Input: date1 = "mm/dd/yyyy" or "yyyy/mm/dd" or "yyyy-mm-dd"
*        date2 = "mm/dd/yyyy" or "yyyy/mm/dd" or "yyyy-mm-dd" or $smarty.now
*        assign = name of variable to assign difference to
*        interval = "days" (default), "weeks", "years"
* Examples: {date_diff date1="5/12/2003" date2=$smarty.now interval="weeks"}
*           {date_diff date1="5/12/2003" date2="5/10/2008" assign="diff"}{$diff}
* -------------------------------------------------------------
*/
function smarty_function_date_diff($params, &$smarty) {
   $date1 = mktime(0,0,0,1,1,2000);
   $date2 = mktime(0,0,0,date("m"),date("d"),date("Y"));
   $assign = null;
   $interval = "days";
   
   extract($params);
    $diff = $date1 - $date2;

$days = ceil($diff / (60*60*24));
$smarty->assign("date_diff_days", $days);

//return $days;
}
?> 