<div class="grid_10">
            <div class="box round first">
                <h2>
                    Anlaşma Ekle</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/ekleAnlasma" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Anlaşma Kodu</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="grumble" name="agreementCode" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Üniversite Adı/Departmanı</label>
                            </td>
                            <td>
                            	<select name="universityCode">
                                {foreach from=$universities item=item}
                                	<optgroup label="Polonya">
                                	<option value="{$item.universityCode}">{$item.universityName} - {$item.universityCode}</option>
                                	</optgroup>
                                {/foreach}
                                </select>
								
								<select name="departmentId">
                                {foreach from=$owndepartments item=item}
                                	
                                	<option value="{$item.departmentId}">{$item.departmentId}-{$item.departmentName}</option>
                                	
                                {/foreach}
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
	