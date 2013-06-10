<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Hoşgeldiniz | International Office</title>
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/nav.css" media="screen" />
    <link href="{$BASE_URL}client/css/table/demo_page.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/ie.css" media="screen" /><![endif]-->
    <link href="{$BASE_URL}client/css/fancy-button/fancy-button.css" rel="stylesheet" type="text/css" />
    <!--Jquery UI CSS-->
    <link href="{$BASE_URL}client/css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN: load jquery -->
    <script src="{$BASE_URL}client/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="{$BASE_URL}client/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/table/jquery.dataTables.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
	<!-- jQuery dialog related-->
    <script src="{$BASE_URL}client/js/jquery-ui/external/jquery.bgiframe-2.1.2.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.draggable.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.position.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.resizable.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.dialog.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.effects.blind.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.effects.explode.min.js" type="text/javascript"></script>
    <script src="{$BASE_URL}client/js/jquery-ui/jquery.ui.autocomplete.min.js" type="text/javascript"></script>
    <!-- jQuery dialog end here-->
    
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="{$BASE_URL}client/css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/jquery.jqplot.min.js"></script>
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="{$BASE_URL}client/js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <!-- END: load jqplot -->
    <script src="{$BASE_URL}client/js/setup.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            //setupDashboardChart('chart1');
            setupLeftMenu();
			setSidebarHeight();


        });
    </script>
</head>
<body>
    <div class="container_12">
        <div class="grid_12 header-repeat">
            <div id="branding">
                <div class="floatleft">
                    <img src="{$BASE_URL}client/img/logo.png" alt="Logo" /></div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="{$BASE_URL}client/img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft">
                            <li>Group 14</li>
                            <li><a href="#">Ayarlar</a></li>
                            <li><a href="#">Çıkış</a></li>
                        </ul>
                        <br />
                        <span class="small grey">Last Login: 3 hours ago</span>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="grid_12">
            <ul class="nav main">
                <li class="ic-dashboard"><a href="{$BASE_URL}"><span>Giriş Sayfası</span></a> </li>
                <li class="ic-typography"><a href="javascript:"><span>Evrak İşleri</span></a>
                    <ul>
                        <li><a href="form-controls.html">Pasaport Yazısı</a> </li>
                        <li><a href="buttons.html">Vize Yazısı</a> </li>
                        <li><a href="form-controls.html">Sözleşme Formu</a> </li>
                        <li><a href="table.html">Kabul Yazısı</a> </li>
                    </ul>
                </li>
                <li class="ic-form-style"><a href="{$BASE_URL}main/araOgrenci"><span>Öğrenciler</span></a></li>
				<li class="ic-charts"><a href="{$BASE_URL}main/istatistikler"><span>İstatistikler</span></a></li>
                <li class="ic-grid-tables"><a href="{$BASE_URL}main/excel"><span>Excel</span></a></li>
                <li class="ic-gallery dd"><a href="javascript:"><span>Üniversiteler</span></a>
               		 <ul>
                        <li><a href="image-gallery.html">Pretty Photo</a> </li>
                        <li><a href="gallery-with-filter.html">Gallery with Filter</a> </li>
                    </ul>
                </li>
                <li class="ic-notifications"><a href="{$BASE_URL}main/log"><span>Sistem Logları</span></a></li>

            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">Öğrenciler</a>
                            <ul class="submenu">
                                <li><a>Tüm Öğrenciler</a> </li>
                                <li><a>Yeni Öğrenci Ekle</a> </li>
                              
                            </ul>
                        </li>
                        <li><a class="menuitem">Hibe İşlemleri</a>
                            
                        </li>
                        <li><a class="menuitem">Üniversiteler</a>
                            <ul class="submenu">
                                <li><a href="{$BASE_URL}main/tumUniversiteler">Tüm Üniversiteler</a> </li>
                                <li><a href="{$BASE_URL}main/ekleUniversite">Yeni Üniversite Ekle</a> </li>
                                <li><a href="{$BASE_URL}main/tumAnlasmalar">Tüm Anlaşmalar</a> </li>
								<li><a href="{$BASE_URL}main/ekleAnlasma">Anlaşma Ekle</a> </li>
                            </ul>
                        </li>
                        <li><a class="menuitem">İstatistikler</a>
                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        
        {$center}
        
        
        
       
       <div class="clear">
        
        
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            Copyright <a href="#">Group 14</a>.
        </p>
    </div>
</body>
</html>
