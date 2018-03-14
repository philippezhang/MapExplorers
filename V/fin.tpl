<html lang="fr">
<head>
<meta charset="utf-8">
<title>Map</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css" /> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
<script type="text/javascript" src="./V/mapJS.js"></script>

</head>
<style>
#bravo{
	background-color:#DCDCDC;
	width:500px;
}
a{
	style:none;
}
#container{
	text-align:center;
	display: inline-flex;
	margin-top : 10%;
	margin-left: 15%;
}

p{
	font-size:1.5em;
}
</style>


<body>
	<div>
		<div id="container">
			<div id="bravo" class="inside">
				<p>Felicitations !<br />
				Vous avez atteint un score de  : <?php echo $_SESSION['score'] ?> points ! <p/><br />	
				<a href="index.php?controle=user&action=deconnexion">D&eacuteconnexion</a>
			</div>
			<div class="inside">
				<img src="V/img/aliliBravo.png"/>
			</div>
		</div>
	</div>
</body>
</html>