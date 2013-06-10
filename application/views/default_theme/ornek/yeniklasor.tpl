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
							<form name="input" method="post" action="{$BASE_URL}welcome/yeniklasor/{$currentDirectory}">
								<table>
									<tr>
										<td>Klasör Adı:</td>
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
				</table>