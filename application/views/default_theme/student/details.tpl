<script type="text/javascript">
	$(document).ready(function(){
		setupDialogBoxx('dialog', 'opener');
	

	        $("form.ajaxForm").submit(function() {

	                var str = $(this).serialize();
	                $.ajax({
		                type: "POST",
		                url: $(this).attr("action"),
		                data: $(this).serialize(),
		                error: function(msg){
		                	alert("Hata olustur");
			                },
		                success: function(msg){
		                         if(msg=="tamam"){
		                        	 location.reload();
			                     }
		                         else{
									alert("Hata olustu, lutfen bildiriniz : " + msg);
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
                    Öğrenci Detayları</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/ekleAnlasma" method="POST">
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
                                    Telefon</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$student.studentPhone}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    Cinsiyeti</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">Erkek</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    E-Mail</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">{$student.studentEmail}</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    Adres</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">-</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    TC Kimlik</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">-</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1">
                                <label>
                                    Öğrenci No</label>
                            </td>
                            <td class="col2">
                                <span style="font-size:12px;">-</span>
                            </td>
                        </tr>
                        
                        
                        
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    &nbsp;</label>
                            </td>
                            <td>
                                <button class="btn btn-green">Düzenle</button>
                                <button class="btn btn-orange">Hareketlilik Ekle</button>
                                <button id="opener" class="btn btn-blue">Mail Gönder</button>
                            </td>
                        </tr>
                        
                        
                    </table>
                    
					
					<h2>Öğrenci Hareketliliği</h2>
					<table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Dönem</label>
                            </td>
                            <td class="col2">
                                <label>
                                    Gittiği Üniversite</label>
                            </td>
                            <td class="col2">
                                <label>
                                    Durumu</label>
                            </td>
                            <td class="col2">
                                <label>
                                    &nbsp;</label>
                            </td>
                        </tr>
                        {foreach from=$studentMobilities item=item}
						<tr>
                            <td class="col1">
                                
                                    {$item.yearCode}({$item.type})
                            </td>
                            <td class="col2">
                                
                                    {$item.universityName}
                            </td>
                            <td class="col2">
                                
                                   {$item.status}
                            </td>
                            <td class="col2">
                                
                                    <button class="btn btn-small">Hareketlilik Detayları</button>
                                    <button class="btn btn-red btn-small" onClick="window.location='{$BASE_URL}mobility/detayHibe/{$item.mobilityId}';return false;">Hibe Bilgileri</button>
                                    <button class="btn btn-blue btn-small" onClick="window.location='{$BASE_URL}university/detayUniversite/{$item.universityCode}';return false;">Üniversite Bilgileri</button>
                            </td>
                        </tr>
                        {/foreach}
                    </table>   
                    
                                     
                    </form>
                </div>
            </div>
        </div>
        

<div id="dialog" title="Mail Gonder" style="display:none;">
<form class="ajaxForm" action="{$BASE_URL}email/sendEmail" method="POST">
				<p>
					Konu : <br/><input type="text" name="subject" size="40">
				</p>
				<p>
					Icerik : <br/><textarea name="content" cols="70" rows="15"></textarea>
				</p>
				<p>
					<input type="hidden" name="studentId" value="{$student.studentId}"/>
					<input type="hidden" name="studentEmail" value="{$student.studentEmail}"/>
					<button class="btn btn-green">Gönder</button>
				</p>
</form>
                                </div>
   