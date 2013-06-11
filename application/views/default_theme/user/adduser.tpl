<div class="grid_10">

            <div class="box round first">
                <h2>
                    Kullanıcı Ekle - (Administrator Ekranı)</h2>
					
                <div class="block ">
				
				
                    <form action="{$BASE_URL}user/userControl" method="POST">
                    <table class="form">
					
					<td>
                        <tr>
                            <td class="col1">
                                <label>
                                    Kullanıcı Adı</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="grumble" class = "small" name="username" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Şifre</label>
                            </td>
                            <td>
                                <input type="password" class="small" name="password" />
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <td>
                                <label>
                                    E-mail Adresi</label>
                            </td>
                            <td>
                                <input type="text" class="small" name="email" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>
                                    Yetki Derecesi</label>
                            </td>
                            
                               <td class="col2">
                                <select name="usertype">
								 <option value="admin">Admin</option>
                                <option value="moderator">Moderator</option>
								<option value="user">User</option>
								</select>
                            </td>
                            
                        </tr>
                        
                            
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
                        
                        </td>
                    </table>
                    </form>
                </div>
            </div>
        </div>
		
		<div class="box round">
                <h2>
                    Kullanıcı Listesi</h2>
                <div class="block" >
				<form action="{$BASE_URL}user/change" method="POST">
                    <p class="start">
                    	<ul>
						
						<select name="username" SIZE=10>
						{foreach from=$users item=item}
						<option value="{$item.username}">{$item.username} - [{$item.usertype}] </option>
						{/foreach}
                        </select>
                    		<select name="usertype">
								 <option value="admin">Admin</option>
                                <option value="moderator">Moderator</option>
								<option value="user">User</option>
								
								</select>
								<button class="btn btn-red">Yetkilendir</button>
							
                    	
                    	</ul>    
                    </p>
                   </form>
                </div>
            </div>