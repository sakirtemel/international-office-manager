		<table width=525 align=center>
		<tr>
			<td bgcolor=#404A5E align=center>
				<font color=#FFFFFF><b>.: DOSYA YÖNETİMİ :.</b></font>
			</td>
		</tr>
		<tr>
			<td>
				<tr>
					<td bgcolor=#404A5E align=left>
						<font color="#FFFFFF"><b>Mevcut Dizin:</b>
						{foreach from=$previousDirectories item=item}
							<b>/<a style="color:#FFFFFF;" href="{$BASE_URL}welcome/listele/{$item.id}">{$item.name}</a></b>
						{/foreach}
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" cellpadding=2>
							<tr>
								<td colspan="6">
									<a href="{$BASE_URL}welcome/yeniklasor/{$currentDirectory}"><img border=0 src="{$BASE_URL}client/css/img/folder_m.gif">
										<b>Yeni klasör oluştur</b>
									</a>&nbsp;&nbsp;
									<a href="{$BASE_URL}welcome/yenidosya/{$currentDirectory}"><img border=0 src="{$BASE_URL}client/css/img/plik_m.gif">
										<b>Yeni dosya oluştur.</b>
									</a>
								</td>
							</tr>
							<tr>
								<td colspan="6" bgcolor="#404A5E">
								</td>
							</tr>
							<tr>
								<td colspan="6" bgcolor="#eceef2">
								</td>
							</tr>
								<tr bgcolor="#dce0e7">
									<td>Ad</td>
									<td>Sahip</td>
									<td>Boyut</td>
									<td>Oluşturulma Tarihi</td>
									<td>Düzenle</td>
									<td>Sil</td>
								</tr>
								{if $currentDirectory != 0}
								<tr class="odd">
									<td colspan="6">
										<a class="directoryLink" href="{$BASE_URL}welcome/listeleAjax/{$parentDirectory}"><img border=0 src="{$BASE_URL}client/css/img/folder_m.gif" valign="middle">&lt;&lt; (Geri)</a>
									</td>
								</tr>
								{/if}
								{foreach from=$files item=item}
								{if $currentDirectory != 0} <tr class="{cycle values="even,odd"}">
								{else} <tr class="{cycle values="odd,even"}">
								{/if}
									<td>
									{if $item.type == 'directory'}
										<a class="directoryLink" href="{$BASE_URL}welcome/listeleAjax/{$item.fileId}">
											<img border=0 src="{$BASE_URL}client/css/img/folder_m.gif" valign="middle">
											{$item.name}
										</a>
									{else} 
										<a href="{$BASE_URL}{$item.filePath}">
											<img border=0 src="{$BASE_URL}client/css/img/plik_m.gif" valign="middle">
											{$item.name}
										</a>
									{/if}
									</td>
									<td>{$item.owner}</td>
									<td>{$item.size}</td>
									<td>{$item.cDate}</td>
									<td><a href="#"><img style="margin-left: 40%;" border=0 src="{$BASE_URL}client/css/img/edit.gif"></a></td>
									<td><a class="dosyaSilLink" href="{$BASE_URL}welcome/dosyaSil/{$item.fileId}">
										<img style="margin-left: 20%;" border=0 src="{$BASE_URL}client/css/img/delete.gif">
										</a></td>
								</tr>
								{/foreach}
						</table>	
					</td> <!-- sonradan eklendi. -->
				</tr>
			</td>
		</tr> <!-- sonradan eklendi. -->
		</table>