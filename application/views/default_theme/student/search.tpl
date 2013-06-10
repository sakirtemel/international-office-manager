{literal}
<script type="text/javascript">
	$(document).ready(function(){

		$( "#studentName" ).autocomplete({
			source: "{/literal}{$BASE_URL}{literal}student/searchStudent",
            select: function( event, ui ) {
                window.location = '{/literal}{$BASE_URL}{literal}student/detayOgrenci/' + ui.item.id;
            }
        });
        
	});
</script>
{/literal}
<div class="grid_10">
            <div class="box round first">
                <h2>
                    Öğrenci Arama</h2>
                <div class="block ">
                    <form action="#" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Öğrenci Adı</label>
                            </td>
                            <td class="col2">
                                <input type="text" id="studentName" class="medium" name="agreementCode" />
                            </td>
                        </tr>
                        
                        
                        
                        
                        <tr>
                            <td style="vertical-align: top; padding-top: 9px;">
                                <label>
                                    &nbsp;</label>
                            </td>
                            <td>
                                <button class="btn btn-green">Ara</button>
                            </td>
                        </tr>
                        
                        
                    </table>
                    </form>
                </div>
            </div>
        </div>