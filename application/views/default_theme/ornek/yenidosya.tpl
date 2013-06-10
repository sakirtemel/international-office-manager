<td width=525 align=center valign=top>

		<table style="width:100%">
			<tr>
				<td bgcolor=#404A5E align=center>
					<font color=#FFFFFF><b>.: DOSYA YÖNETİMİ :.</b></font>
				</td>
			</tr>
			<tr>
				<td>
					<tr>
						<td bgcolor=#404A5E align=left>
							<font color=#FFFFFF><b>Mevcut Dizin: </b></font>
						</td>
					</tr>
					<tr>
						<td>
							<form name="input" method="post" action="{$BASE_URL}welcome/yeniDosya/{$currentDirectory}">
								<table>
									<tr>
										<td>Dosya Adı:</td>
										<td><input type="text" name="name"></td>
									</tr>
									<tr>
										<td>Sahip:</td>
										<td><input type="text" name="owner"></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
											<input class="but" type="submit" value="Oluştur">
										</td>
									</tr>
									<tr>
										<td colspan="2" align="left">
											<a href="{$BASE_URL}welcome/listele/{$currentDirectory}">
												<br>
												<img border=0 src="{$BASE_URL}client/css/img/folder_m.gif" align="middle"/>
												&lt;&lt; geri
											</a>
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
		
					<tr>
						<form action="{$BASE_URL}welcome/do_upload/{$currentDirectory}" method="post" accept-charset="utf-8" enctype="multipart/form-data">

							<fieldset>
								<legend>Dosya Yükleme</legend>
								
								<div>
									<label for="fileselect">Dosya(lar):</label>
									<input type="file" id="fileselect" name="userfile[]" size="20" />
									<div id="filedrag">veya buraya sürükleyin</div>
								</div>
									<!-- <input type="file" class="multi" maxlength="2" name="userfile[]" accept="gif|jpg"/> -->
									<input class="but" type="submit" value="Yükle">
							
							</fieldset>

						<div id="messages">
							<p>Seçilen Dosyalar</p>
						</div>
<script type="text/javascript" src="{$BASE_URL}client/js/filedrag.js"></script>
						</form>
						
					</tr>
				</table>
				