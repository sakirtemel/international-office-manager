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
                    Tüm Öğrenciler</h2>
                <div class="block">
                    
                    
                    
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Öğrenci Adı</th>
							<th>Telefon Numarası</th>
							<th>E-Posta Adresi</th>
							<th>Türü</th>
							
						</tr>
					</thead>
					<tbody>
						{foreach from=$students item=item}
						<tr class="odd gradeX">
							<td>{$item.studentFirstName} {$item.studentMiddleName} {$item.studentLastName}</td>
							<td>{$item.studentPhone}</td>
							<td>{$item.studentEmail}</td>
							<td>{$item.studentType}</td>
							
						</tr>
						{/foreach}
						
					</tbody>
				</table>
                    
                    
                    
                </div>
				
            </div>
        </div>
		