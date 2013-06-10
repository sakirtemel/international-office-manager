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
                    Filtreleme</h2>
                <div class="block ">
                    <form action="{$BASE_URL}main/excel" method="POST">
                    <table class="form">
                        <tr>
                            <td class="col1">
                                <label>
                                    Fakülte Adı / Yıl / Ülke</label>
                            </td>
                            <td class="col2">
                                <select name="dept">
                                <option value="0">Filtre Yok </option>
                                {foreach from=$owndepartments item=item}
                                	
                                	<option value="{$item.departmentId}">{$item.departmentName} </option>
                                	
                                {/foreach}

								</select>
								  <select name="year">
								   <option value="0">Filtre Yok </option>
                                {foreach from=$years item=item}
                                	
                                	<option value="{$item.yearCode}">{$item.yearCode} </option>
                                	
                                {/foreach}
                                
                                  

								</select>
								
								<select name="countryCode">
								   <option value="0">Filtre Yok </option>
                                {foreach from=$countries item=item}
                                	
                                	<option value="{$item.countryErasmusCode}">{$item.countryName}</option>
                                	
                                {/foreach}
                        
								</select>
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
                    Öğrenci Listesi</h2>
                <div class="block">
                    
                    
                    
                    <table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>Öğrenci Adı</th>
							<th>Öğrenci Soyadı</th>
							<th>Türü</th>
							
						</tr>
					</thead>
					<tbody>
						{foreach from=$students item=item}
						<tr class="odd gradeX">
							<td>{$item.studentFirstName}</td>
							<td>{$item.studentLastName}</td>
							<td>{$item.studentType}</td>
							
						</tr>
						{/foreach}
						
					</tbody>
				</table>
                    
                    
                    
                </div>
            </div>
        </div>