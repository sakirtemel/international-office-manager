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
                    Anlaşmalar</h2>
                <div class="block">
                    
                    
                    
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Anlaşma Kodu</th>
							<th>Üniversite Kodu</th>
							<th>Departman Kodu</th>
							<th>Başlangıç Tarihi</th>
							<th>Bitiş Tarihi</th>
							<th>Lisans Öğrenci Kabulu</th>
							<th>Lisansüstü Öğrenci Kabulu</th>
							<th>Çalışan Sayısı</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$agreements item=item}
						<tr class="odd gradeX">
							<td>{$item.agreementCode}</td>
							<td>{$item.universityCode}</td>
							<td>{$item.departmentId}</td>
							<td>{$item.startDate}</td>
							<td>{$item.endDate}</td>
							<td>{$item.underGraduateCount}</td>
							<td>{$item.graduateCount}</td>
							<td>{$item.employeeCount}</td>
						</tr>
						{/foreach}
						
					</tbody>
				</table>
                    
                    
                    
                </div>
				
            </div>
        </div>
		