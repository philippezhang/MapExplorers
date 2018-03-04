<html lang="en">
<head>
<meta charset="utf-8">
<title>Map</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-
0.7.3/leaflet.css" /> 
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script src="http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js"></script>
<script type="text/javascript" src="./V/mapJS.js"></script>

<script type="text/javascript">
<?php echo "var phpVariable = '{$tabnumquest}';"; ?>

</script>

<style>
.ui-widget-content { width: 130px; height: 100px; padding: 0.5em; float: left; margin: 10px 10px 10px 0; background-color: #ccffcc;}
#droppable { width: 100; height: 150px; padding: 0.5em; float: left; margin: 10px; }
#map { height: 300px; width:900px;}
</style>

</head>
<body>
	<p><?php
	echo($question); ?>
	</p>
	 <div id="map" style="width: 800px; height: 600px"></div>

	<div id="1" class="ui-widget-content">
		<p>France</p>
	</div>
	<div id="2" class="ui-widget-content">
		<p>Canada</p>
	</div>
	<div id="3" class="ui-widget-content">
		<p>Italie</p>
	</div>
	<div id="4" class="ui-widget-content">
		<p>Belgique</p>
	</div>
	<div id="5" class="ui-widget-content">
		<p>Japan</p>
	</div>
	<div id="info" class="ui-widget-content">
		<p>Location (Gps)</p>
	</div>
</body>
</html>