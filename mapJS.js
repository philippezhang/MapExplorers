window.onload = function () {

//L.tileLayer('http://tile.stamen.com/terrain/{z}/{x}/{y}.jpg').addTo(map);

var Stamen_TonerBackground = L.tileLayer('https://stamen-tiles-{s}.a.ssl.fastly.net/toner-background/{z}/{x}/{y}.{ext}', {
	attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a> &mdash; Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>',
	subdomains: 'abcd',
	minZoom: 0,
	maxZoom: 20,
	ext: 'png'
});

var map = L.map('map',{layers : Stamen_TonerBackground}).setView([20.858376, 5.294442],2);


//L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png').addTo(map); 
 
var ligne = L.polyline([[-4.9160525,48.7531089],[-4.8901177,48.764789],[-4.8683167,48.7723695]], {color: 'red',weight:8}).addTo(map);  



//Affichage France




function lireFichierTexte(fichier){
	 //On lance la requête pour récupérer le fichier
	// var fichierBrut = new XMLHttpRequest();
	 //fichierBrut.open("GET", fichier, false);

var fileSystem=new ActiveXObject("Scripting.FileSystemObject");
var fichierFrance=fileSystem.OpenTextFile(nomFicher, 2 ,true); 

	 //On utilise une fonction sur l'événement "onreadystate"
	 fichierBrut.onreadystatechange = function () {
	 					if(fichierBrut.readyState === 4)
	 					{
	 						//On contrôle bien quand le statut est égal à 0
		 					if(fichierBrut.status === 200 || fichierBrut.status == 0)
		 					{
		 						//On peut récupérer puis traiter le texte du fichier
		 						var texteComplet = fichierBrut.responseText;
								 alert(texteComplet);
		 					}		
	 					}
	 }
	 fichierBrut.send("./pays/France.txt");
}

lireFichierTexte(fichierFrance);

		//Rendre draggable les div des pays
	$( "#France" ).draggable({ revert: "valid" });
	$( "#Canada" ).draggable({ revert: "valid" });
	$( "#Italie" ).draggable({ revert: "valid" });
	$( "#Belgique" ).draggable({ revert: "valid" });
	$( "#Japan" ).draggable({ revert: "valid" });
	
	//Rendre la map droppable
	 $( "#map" ).droppable({
		 
		 //Evenement lors du drop
		drop: function( event, ui ) {
			
			//Recupère l'id du block div "dropped" dans la map
			var IdPays = ui.draggable.attr("id");
			
			var chaine="";
			chaine+="Pays : "+IdPays+"</br>";
			
			//Requete AJAX pour récupérer les coordonnées (lati, longi) du pays
			$.ajax({
			    type: 'GET',
			    url: "http://nominatim.openstreetmap.org/search",
			    dataType: 'jsonp',
			    jsonpCallback: 'data',
			    data: { format: "json", limit: 1,country: IdPays,json_callback: 'data' },
			    error: function(xhr, status, error) {
						alert("ERROR "+error);
			    },
			    success: function(data){
				//récupérer les coordonnées (lati, longi) du pays dans les données json provenant du serveur
					var lati = '';
					var longi = '';
					$.each(data, function() {
						lati = this['lat'] ;
						longi = this['lon'] ;
				});
				
				//affichage des infos
				chaine+="Latitude : "+lati+"</br>";
				chaine+="Longitute : "+longi+"</br>";
				$( "#info" ).html(chaine);
				
				//affichage pop up du pays dropped
				var monPopup = L.popup();
				monPopup.setLatLng([lati,longi])
				.setContent("<h1>Hello !</h1>")
				.openOn(map);
				
				//MAJ de la map à la position (lati, longi) du pays
				map.panTo(new L.LatLng(lati, longi));		
				
			    }
			});
			
			
		}
	});
	
	//Sur le click de la map, ajout d'un marqueur sur la carte avec le nom du pays
	map.on('click', onClick);
	
	function onClick(e) {
		//recherche le pays sur lequel on a clické
		//Requete AJAX pour récupérer les infos du pays sur le point où on a cliqué (lati, longi) 
		$.ajax({
		    type: 'GET',
		    url: "http://nominatim.openstreetmap.org/reverse",
		    dataType: 'jsonp',
		    jsonpCallback: 'data',
		    data: { format: "json", limit: 1,lat: e.latlng.lat,lon: e.latlng.lng,json_callback: 'data' },
		    error: function(xhr, status, error) {
					alert("ERROR "+error);
		    },	  
			success: 	function (data){
			
			//récupérer les coordonnées (lati, longi) du pays dans les données json provenant du serveur
				var paysVisite ='';
				paysVisite = data["address"]['country'] ;
			
			//affichage des infos
			L.marker(e.latlng).addTo(map).bindPopup("Lat, Lon : " + e.latlng.lat + ", " + e.latlng.lng+" Pays : "+paysVisite).openPopup();
			L.circle(e.latlng, 1).addTo(map);	
			}
		});
	}
	
}

