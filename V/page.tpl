<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Connexion</title>
	<link rel="stylesheet" type="text/css" href="V/css/connect.css " /> 
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="V/js/jquery.js"></script> 
	<script type="text/javascript" src="V/js/connect.js"></script>
		<!-- <style>  #f1 {display:none;border:1px green solid;width:4em; height:7em;}   </style>
		-->
</head>

<body>
<header></header> <!-- fin header -->
<div id="page">
	<center><h1>Viens jouer avec</h1></center>

		<center><div class="alili">
			<img class="titre" src="V/img/aliliExploratrice.png" />
		</div></center>
	<center><div class="grid_container">
		
			<img class="a" src="V/img/aliliRetour.png"/>
		
		<div id="connect">
			<div id="formulaire">
				<form id="f1" method="post" action="index.php?control=user&action=connect">
					<div class="form-group">
						<label for="login">Login</label>
						<input class="form-control" name="login" value="<?php echo $login ?>" class="form-control">
					</div>
					<div class="form-group">
						<label for="pass">Password</label>
						<input  class="form-control" type="password" name="pass" value="<?php echo $pass ?>" class="form-control">
					</div>
					
						<input type="submit" class="btn btn-primary" value="connecter"/>
				</form>
			</div>
		<h5> 	
			<?php
				echo $echoLogin;
			?>
		</h5> 
		</div> <!-- fin connect-->	
			<img class="a" src="V/img/aliliGlobe.png" />
	</div></center>
</div>
</body>

<style>
body{
	margin: 0; 
	cursor:url('V/img/alili.png'),pointer;
}
.a{
	width:30%;
}
#formulaire{
	border-radius : 3px; 
	width:500px;
	padding:60px;
	margin:25px;
	background-color:#DCDCDC;
}
.grid_container{
	text-align:center;
	display: inline-flex;
}

</style>
</html>
