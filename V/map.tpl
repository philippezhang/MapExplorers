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

<script type="text/javascript">
<?php 
echo "var phpVariable = '{$tabnumquestcorrecte}';";
 ?>
</script>
<style>
html{
	background-color:#DCDCDC;
}

#question{
	background-color: #fff;
}
.ui-widget-content { width: 130px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; background-color: #ccffcc;}
#droppable {padding: 0.5em; float: left; margin: 10px; }
#map { height: 300px; width:900px;}
.ui-widget-content{
	background-color:white;
	height:28px;
}
</style>

</head>
<body>
	<center>
	<div id= "question">
	<p  style="font-size:1.5em">
		<?php echo utf8_encode(($intitulequestionchoisie)); ?>
		Score : <?php echo $_SESSION['score'] ?>	
	</p>
	</div></center>
	 <div id="map" style="width:1300px; height:450px"></div>
	<?php				
			foreach( $_SESSION['tablieux'] as $key => $value){
			//var_dump($value);
				echo("<div id =".$value['idlieu']." class='ui-widget-content pays'><p>".$value['intitulelieu']."</p></div>");
			} 
	?>
	<a href="index.php?controle=user&action=deconnexion">Déconnexion </a>

</body>
</html>