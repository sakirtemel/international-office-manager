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
function smarty_function_write_dates($params, &$smarty) {
   $date1 = mktime(0,0,0,1,1,2000);
   $date2 = mktime(0,0,0,date("m"),date("d"),date("Y"));
   $assign = null;
   $interval = "days";
   
   extract($params);
   $t1 = $date1;
   $t2 = $date2;
   $lang = "tr";
	$month_array["tr"]=array(1=>"Oca","Şub","Mar","Nis","May","Haz","Tem","Ağu","Eyl","Eki","Kas","Ara");
	$month_array["en"]=array(1=>"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
			if($t2 == -2)
			{
			return $month_array[$lang][date('n',$t1)] . " " . date("Y", $t1);
			}
		else
			{
			if(date("Y", $t1) == date("Y", $t2))
				{
				if(date("n", $t1) == date("n", $t2))
					{
					if(date("d", $t1) == date("d", $t2))
						{
						return date("d", $t1) . " " . $month_array[$lang][date("n", $t1)] . " " . date("Y", $t1);
						}
					else
						{
						return date("d", $t1) . " - " . date("d", $t2) . " " . $month_array[$lang][date("n", $t1)] . " " . date("Y", $t1);
						}
					}
				else
					{
					return date("d", $t1) . " " . $month_array[$lang][date("n", $t1)] . " - " . date("d", $t2) . " " . $month_array[$lang][date("n", $t2)] . " " . date("Y", $t1);
					}
				}
			else
				{
				return date("d", $t1) . " " . $month_array[$lang][date("n", $t1)] . " " . date("Y", $t1) . " - " . date("d", $t2) . " " . $month_array[$lang][date("n", $t2)] . " " . date("Y", $t2);
				}
			}
}
?> 