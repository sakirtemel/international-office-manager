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

        
        
        
        
        
        <script type="text/javascript">

        $(document).ready(function () {
            //setupLeftMenu();

            $('.datatable').dataTable();
			//setSidebarHeight();


        });
    </script>
<div class="grid_10">
            <div class="box round first grid">
                <h2>
                    Sistem Logları</h2>
                <div class="block">
                    
                    
                    
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>LogID</th>
							<th>Tür</th>
							<th>Zaman</th>
							<th>Yapılan İşlem</th>
							
						</tr>
					</thead>
					<tbody>
						{foreach from=$log item=item}
						<tr class="odd gradeX">
							<td>{$item.ID}</td>
							<td>{$item.ProcessType}</td>
							<td>{$item.TimeStamp}</td>
							<td>{$item.ProcessDef}</td>
							
						</tr>
						{/foreach}
						
					</tbody>
				</table>
                    
                    
                    
                </div>
				
            </div>
        </div>
		<div class="box round first grid">
					<h2>
                    UE: Üniversite Eklendi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;US:Üniversite Silindi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OE:Öğrenci Eklendi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;OS:Öğrenci Silindi</h2>
					</div>