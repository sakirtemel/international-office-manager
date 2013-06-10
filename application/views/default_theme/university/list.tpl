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
                    Üniversiteler Listesi</h2>
                <div class="block">
                    
                    
                    
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Üniversite Adı</th>
							<th>Ülke</th>
							<th>Üniversite Kodu</th>
							<th>Engine version</th>
							<th>CSS grade</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$universities item=item}
						<tr class="odd gradeX">
							<td>{$item.universityName}</td>
							<td>Polonya</td>
							<td>123123</td>
							<td class="center"> 4</td>
							<td class="center">X</td>
						</tr>
						{/foreach}
						
					</tbody>
				</table>
                    
                    
                    
                </div>
            </div>
        </div>