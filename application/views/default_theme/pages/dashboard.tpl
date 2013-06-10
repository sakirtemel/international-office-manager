    <script type="text/javascript">

        $(document).ready(function () {
            setupDashboardChart('chart1');



        });
    </script>
<div class="grid_10">
            <div class="box round first">
                <h2>
                    Hibe Ödemeleri</h2>
                <div class="block">
                    <div id="chart1">
                    </div>
                </div>
            </div>
            <div class="box round">
                <h2>
                    Son Rakamlar</h2>
                <div class="block">
                    <div class="stat-col">
                        <span>Bu seneki giden öğrenci</span>
                        <p class="purple">
                            300</p>
                    </div>
                    <div class="stat-col">
                        <span>Geçen ay ödenen hibe</span>
                        <p class="yellow">
                            32,729</p>
                    </div>
                    <div class="stat-col">
                        <span>Bu ay ödenen hibe</span>
                        <p class="green">
                            63,829</p>
                    </div>
                    <div class="stat-col">
                        <span>Kullanılan Hibe</span>
                        <p class="blue">
                            37.7%</p>
                    </div>
                    <div class="stat-col">
                        <span>Ödenecek Hibe</span>
                        <p class="red">
                            693.00</p>
                    </div>

                    <div class="stat-col last">
                        <span>Total</span>
                        <p class="darkblue">
                            100,000</p>
                    </div>
                    <div class="clear">
                    </div>
                </div>
            </div>
        </div>
        <div class="grid_5">
            <div class="box round">
                <h2>
                    En son yapılan ödemeler</h2>
                <div class="block" >
                    <p class="start">
                    <ul>
                    		<li>Öğrenci 1(700EUR) - Mühendislik</li>
                    		<li>Öğrenci 2(1700EUR) - AEF</li>
                    		<li>Öğrenci 3(2700EUR) - Fen Edebiyat</li>
                    		<li>Öğrenci 4(800EUR) - Güzel Sanatlar</li>
                    		<li>Öğrenci 5(1200EUR) - İktisat</li>
                    		<li>Öğrenci 6(1700EUR) - Mühendislik</li>
                    		<li>Öğrenci 7(1700EUR) - Mühendislik</li>
                    		<li>Öğrenci 8(1700EUR) - Güzel Sanatlar</li>
                    		<li>Öğrenci 9(1700EUR) - Mühendislik</li>
                    	</ul>
                     </p>
                </div>
            </div>
        </div>
        <div class="grid_5">
            <div class="box round">
                <h2>
                    En son eklenen öğrenciler</h2>
                <div class="block" style="width:500px;height:200px;line-height:2em;overflow:scroll;padding:5px;">
                    <p class="start">
                    	<ul>
						{foreach from=$lastaddstd item=item}
                    		<li>{$item.stdname} adlı öğrenci {$item.Time}'da eklendi</li>
                    	{/foreach}
                    	</ul>    
                    </p>
                   
                </div>
            </div>
        </div>
