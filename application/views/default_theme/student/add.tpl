<div class="grid_10">
            <div class="box round first">
                <h2>
                    Öğrenci Ekle</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/ekleOgrenci" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Öğrenci Adı</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="grumble" name="studentFirstName" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Öğrenci 2.Adı</label>
                            </td>
                            <td>
                                <input type="text" class="medium" name="studentMiddleName" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    Öğrenci Soyadı</label>
                            </td>
                            <td>
                                <input type="text" class="medium" name="studentLastName" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Telefon Numarası</label>
                            </td>
                            
                               <td class="col2">
                                <input type="text" id="grumble" name="studentPhone" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    E-Posta Adresi</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="studentEmail" id="studentEmail" style="float:left;"/>
                                <div id="isEmail" style="color: red;float:left;"></div>
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    Türü</label>
                            </td>
                            <td>
                                <select name="studentType">
								   
                                
                                	
                                	<option value="Outgoing">Outgoing</option>
                                	<option value="Incoming">Incoming</option>
                                
                        
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    &nbsp;</label>
                            </td>
                            <td>
                                <button class="btn btn-green">Kaydet</button>
                            </td>
                        </tr>
                        
                        
                    </table>
                    </form>
                </div>
            </div>
        </div>
{literal}
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#studentEmail").change(function(){
				 var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				 isEmail = regex.test(this.value);
				 if(!isEmail)
					 $("#isEmail").text("gecerli bir email degil");
				 else
					 $("#isEmail").text("");
				
			
		});	
	});

</script>
{/literal}        