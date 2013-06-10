<script type="text/javascript">
	$(document).ready(function(){
		setupDialogBox('dialog', 'opener');
	
		$(".grantStatus").change(function(){
				if($(this).val() == "paid")
					alert("Öğrenciye ödeme yapıldığına dair mail göndermek ister misiniz?");
			});

	        $("form.ajaxForm").submit(function() {

	                var str = $(this).serialize();
	                $.ajax({
		                type: "POST",
		                url: $(this).attr("action"),
		                data: $(this).serialize(),
		                error: function(msg){
		                	alert("Hata oluştu");
			                },
		                success: function(msg){
		                         if(msg=="tamam"){
		                        	 location.reload();
			                     }
		                         else{
									alert("Hata oluştu, lütfen bildiriniz : " + msg);
				                     }
		                        }
		       		});
	    			return false; 
	    	});


		});

</script>
<div class="grid_10">
            <div class="box round first">
                <h2>
                    Öğrenci Hibe Detayları</h2>
                <div class="block ">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Öğrenci Adı</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$student.studentFirstName} {$student.studentMiddleName} {$student.studentLastName}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    Fakültesi</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$student.facultyName}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    Bölümü</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$student.departmentName}</span>
                            </td>
                        </tr>

                        
                        <tr>
                            <td class="col1">
                                <label>
                                    Gittiği Ülke</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.countryName}</span>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="col1">
                                <label>
                                    Gittiği Üniversite</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.universityName}</span>
                            </td>
                        </tr>      
                        
                        <tr>
                            <td class="col1">
                                <label>
                                    Gidilen Dönem</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.yearCode}</span>
                            </td>
                        </tr>   
                        
                        <tr>
                            <td class="col1">
                                <label>
                                    Gidilen Ülke için aylık hibe</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.amount} EUR</span>
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="col1">
                                <label>
                                    Gidiş Tarihi</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.startDate}</span>
                            </td>
                        </tr> 
                        <tr>
                            <td class="col1">
                                <label>
                                    Dönüş Tarihi</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$grantsDetails.endDate}</span>
                            </td>
                        </tr>     
                        <tr>
                            <td class="col1">
                                <label>
                                    Hesaplanan Toplam Hibe</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;"><b>{$grantsDetails.totalMoney}</b> EUR</span>
                            </td>
                        </tr>      
                        <tr>
                            <td class="col1">
                                <label>
                                    Ödenen hibe</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;"><b>{$grantsDetails.totalMoney-$grantsDetails.remainingMoney}</b> EUR</span>
                            </td>
                        </tr>     
                        <tr>
                            <td class="col1">
                                <label>
                                    Kalan Hibe</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;"><b>{$grantsDetails.remainingMoney}</b> EUR</span>
                            </td>
                        </tr>                                              
                        
                        
                        
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    &nbsp;</label>
                            </td>
                            <td>
                            	<button id="opener80" class="btn btn-green">%80 Öde</button>
                            	<button id="opener20" class="btn btn-green">%20 Öde</button>
                                <button id="opener" class="btn btn-green">Elle girerek Öde</button>
                                <button class="btn btn-orange">Mail Gönder</button>
                            </td>
                        </tr>
                        
                        
                    </table>
                    
					
					<h2>Ödeme Hareketleri</h2>
					<table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Tarih</label>
                            </td>
                            <td class="col2">
                                <label>
                                    Miktar</label>
                            </td>
                            <td class="col2">
                                <label>
                                    Durumu</label>
                            </td>
                            <td class="col2">
                                <label>
                                    Açıklama</label>
                            </td>

                        </tr>
                        {$totalGrant=0}
                        {foreach from=$grants item=item}
						<tr>
                            <td class="col1">
                                
                                    {$item.cdate}
                            </td>
                            <td class="col2">
                                
                                    <b>{$item.amount} EUR</b>
                                    {$totalGrant={$totalGrant}+{$item.amount}}
                            </td>
                            <td class="col2">
                                
                                   <select class="grantStatus">
                                   	<option value="waiting" {if $item.status eq "waiting"}selected{/if}>beklemede</option>
                                   	<option value="paid" {if $item.status eq "paid"}selected{/if}>ödendi</option>
                                   	
                                   </select>
                            </td>
                            <td class="col2">
                                
                                    {$item.desc}
<form class="ajaxForm" action="{$BASE_URL}mobility/deleteGranty" method="POST">
				
					<input type="hidden" name="grantID" value="{$item.id}"/>
					<button class="btn btn-red">İptal Et</button>
</form>                                  
                            </td>

                        </tr>
                        {/foreach}
                        <tr>
                            <td class="col1">
                                
                                    &nbsp;
                            </td>
                            <td class="col2">
                                
                                    &nbsp;
                                    
                            </td>
                            <td class="col2">
                                
                                   &nbsp;
                            </td>
                            <td class="col2">
                                
                                    &nbsp;
                            </td>

                        </tr>      
						<tr>
                            <td class="col1">
                                
                                    Toplam
                            </td>
                            <td class="col2">
                                
                                    <b>{$totalGrant} EUR</b>
                                    
                            </td>
                            <td class="col2">
                                
                                   &nbsp;
                            </td>
                            <td class="col2">
                                
                                    &nbsp;
                            </td>

                        </tr>                        
                    </table>   
                    
                                     
                </div>
            </div>
        </div>

<div id="dialog" title="Hibe Ödemesi Yap" style="display:none;">
<form class="ajaxForm" action="{$BASE_URL}mobility/addGranty" method="POST">
				<p>
					Ödeme Yapılacak Miktar : <br/><input type="text" name="amount">
				</p>
				<p>
					Açıklama : <br/><textarea name="desc"></textarea>
				</p>
				<p>
					<input type="hidden" name="mobilityId" value="1"/>
					<button class="btn btn-green">Tamam</button>
				</p>
</form>
                                </div>
             