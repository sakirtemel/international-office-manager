<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


	<!-- General meta information -->
	<title>Login Screen - ERASMUS Office</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<meta name="robots" content="index, follow" />
	<meta charset="utf-8" />
	<!-- // General meta information -->
	
	
	<!-- Load Javascript -->
	<script type="text/javascript" src="{$BASE_URL}client/js/jquery.js"></script>
	<script type="text/javascript" src="{$BASE_URL}client/js/jquery.query-2.1.7.js"></script>
	<script type="text/javascript" src="{$BASE_URL}client/js/rainbows.js"></script>
	<!-- // Load Javascipt -->

	<!-- Load stylesheets -->
	<link type="text/css" rel="stylesheet" href="{$BASE_URL}client/css/stylelogin.css" media="screen" />
	<!-- // Load stylesheets -->
	{literal}
<script>


	$(document).ready(function(){
 
	$("#submit1").hover(
	function() {
	$(this).animate({"opacity": "0"}, "slow");
	},
	function() {
	$(this).animate({"opacity": "1"}, "slow");
	});
 	});


</script>
	{/literal}
</head>
<body>

	<div id="wrapper">
		<div id="wrappertop"></div>

		<div id="wrappermiddle">

			<h2>Login</h2>
{if $incorrect eq 'true'}
		<div style="color: red;"><br/>&nbsp;&nbsp;<b></b>incorrect username or password</b></div>
{/if}
			<div id="username_input">

				<div id="username_inputleft"></div>

				<div id="username_inputmiddle">
				<form method="POST" action="{$BASE_URL}user/login">
					<input type="text" name="username" id="url" placeholder="username">
					<img id="url_user" src="{$BASE_URL}client/images/mailicon.png" alt="">

				</div>

				<div id="username_inputright"></div>

			</div>

			<div id="password_input">

				<div id="password_inputleft"></div>

				<div id="password_inputmiddle">

					<input type="password" name="password" id="url" placeholder="password">
					<img id="url_password" src="{$BASE_URL}client/images/passicon.png" alt="">

				</div>

				<div id="password_inputright"></div>

			</div>

			<div id="submit">

				<input type="image" src="{$BASE_URL}client/images/submit_hover.png" id="submit1" value="Log In">
				<input type="image" src="{$BASE_URL}client/images/submit.png" id="submit2" value="Log In">
				</form>
			</div>


			<div id="links_left">

			&nbsp;

			</div>

			<div id="links_right">&nbsp;</div>

		</div>

		<div id="wrapperbottom"></div>

	</div>

</body>
</html>