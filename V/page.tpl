<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>connexion en jquery</title>
	
	<link rel="stylesheet" type="text/css" href="V/css/connect.css " /> 
	
	<script type="text/javascript" src="V/js/jquery.js"></script> 
	<script type="text/javascript" src="V/js/connect.js"></script>
	
		<!-- <style>  #f1 {display:none;border:1px green solid;width:4em; height:7em;}   </style>
		-->
</head>
<body>
<header>
	<div id="connect">
	<a id="cnx" href="" title="connexion">connexion</a> 
	<form id="f1" method="post" action="index.php?control=user&action=connect">
		<label for="login">login :</label>
		<input name="login" value="<?php echo $login ?>" /> <br/>
		<label for="pass">pass :</label>
		<input type="password" name="pass" value="<?php echo $pass ?>" /> <br/>
		<input type="submit" value="connecter" /> 
	</form>
	<h5> 	<?php
				echo $echoLogin;
			?>
	</h5> 
	</div> <!-- fin connect-->
</header> <!-- fin header -->

<div id='presentation'>
	Partie présentation
</div>

</body>

<script>
body{
cursor:url(V/img/alili.png),pointer;

}
</script>
</html>
