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
 



//Affichage France

/* MARCHE SUR FIREFOX ET CHROME ET N'AFFICHE PAS D'ERREUR */
var tabPays = ["../pays/fr.geojson", "../pays/be.geojson", "../pays/ca.geojson", "../pays/it.geojson", "../pays/jp.geojson"];
//AFFICHAGE FRANCE
for(i=0; i < tabPays.length; i++)
$.ajax({
                  url: tabPays[i],
                  beforeSend: function(xhr){
                    if (xhr.overrideMimeType)
                    {
                      xhr.overrideMimeType("application/json");
                    }
                  },
                  dataType: 'json',
                  data: null,
                  success:  function(data, textStatus, request) {
                    L.geoJson(data, { }).addTo(map);
                  }
                }); 
//function lireFichierTexte(fichier){
	 //On lance la requête pour récupérer le fichier
	// var fichierBrut = new XMLHttpRequest();
	 //fichierBrut.open("GET", fichier, false);

//var fileSystem=new ActiveXObject("Scripting.FileSystemObject");
/*var fichierFrance=fileSystem.OpenTextFile(nomFicher, 2 ,true); 

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
}*/

//lireFichierTexte(fichierFrance);



		//Rendre draggable les div des pays
	$( ".pays" ).draggable({ revert: "valid" });
	
	//Rendre la map droppable
	 $( "#map" ).droppable({
		/*accept: function(data){
			if(data.attr("id")==phpVariable){
				return true;
			}
		},*/ 
		 //Evenement lors du drop
		drop: function( event, ui ) {
			if(ui.draggable.attr("id")==phpVariable){
				$.ajax({ url: 'C/user.php',
					data: {act: 'bonne'},
					type: 'POST',
					success: function(output) {
                      $("*").html(output);
					  
					},
					 error: function(xhr, error){
					 }
				});
			}
			else{
				$.ajax({ url: 'C/user.php',
					data: {act: 'mauvaise'},
					type: 'post',
					success: function(output) {
                      $("*").html(output);
					},
					 error: function(xhr, error){
						 
					 }
				});
			}
			//Recupère l'id du block div "dropped" dans la map
			var IdPays = ui.draggable.attr("id");
			
			var chaine="";
			chaine+="Pays : "+IdPays+"</br>";
			
			//Requete AJAX pour récupérer les coordonnées (lati, longi) du pays
			/*$.ajax({
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
				.setContent("<h1>Bonne réponse !</h1>")
				.openOn(map);
				
				//MAJ de la map à la position (lati, longi) du pays
				map.panTo(new L.LatLng(lati, longi));		
				
			    }
			});*/
			
			
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

