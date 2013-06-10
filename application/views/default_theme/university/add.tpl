<div class="grid_10">
            <div class="box round first">
                <h2>
                    Üniversite Ekle</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/ekleUniversite" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Üniversite Kodu</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="grumble" name="universityCode" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Üniversite Adı</label>
                            </td>
                            <td>
                                <input type="text" class="medium" name="universityName" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    Ülke</label>
                            </td>
                            <td>
                                <select name="countryCode">
								   
                                {foreach from=$countries item=item}
                                	
                                	<option value="{$item.countryErasmusCode}">{$item.countryName}</option>
                                	
                                {/foreach}
                        
								</select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Şehir</label>
                            </td>
                            
                               <td class="col2">
                                <input type="text" id="grumble" name="cityCode" />
                            </td>
                            
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Web</label>
                            </td>
                            <td>
                                <input type="text" class="mini" name="universityWebsite" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    Adres</label>
                            </td>
                            <td>
                                <textarea type="text" name="universityAddress">Address</textarea>
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