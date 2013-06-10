{literal}
<script type="text/javascript">
//ajax silme.
$(document).ready( function() {
	$(".dosyaSilLink").click(function () {
		var answer = confirm("Seçili dosya silinsin mi?")

		if(answer){
				oge = this;
				$.get(this, function(data) {//dosyasil fonksiyonundan dönen degeri data değişkenine atar.
						if(data == "tamam"){
							//$(oge).closest("tr").remove(); // remove row
							//alert("dosya Silindi");
							$(oge).closest("tr").css('backgroundColor', 'red');
							$(oge).closest("tr").fadeOut(1000);
							alert(data);
							/*		
							$.ajax({
							      url: "{$BASE_URL}welcome/dosyaSil/{$item.fileId}",
							      async: false,
							      type: "POST",
							      data: "type=gallery",
							      dataType: "html",
							      success: function(data) {
							        //$('#ajax-content-container').html(data);
							      }
							})*/
						}
					  
				});
		}
   		return false;
  });

	//listeyi yenile.
	$(".directoryLink").click(function () {
		oge = this;
		$.get(this, function(data) {
					//$(oge).closest("tr").remove(); // remove row
					//alert("dosya Silindi");
					//$(oge).closest("tr").css('backgroundColor', 'red');
					// $(oge).closest("tr").fadeOut(1000);
					$("#degisenListe").html(data);
			  
		});
		
   		return false;
  });

	  
});
</script>
{/literal}
<td width=525 align=center valign=top>
<div id="degisenListe">
{$liste_content}
		</div>
	</td>
	</tr>
	<tr>
		<td height=5 colspan=2 bgcolor=#404A5E align=right>
		<font color=FFFFFF>Powered by </font><a href="http://www.agmk.net/">
		<font color=FFFFFF>agmk.net</font></a>&nbsp;&nbsp</td></tr>
	</table>