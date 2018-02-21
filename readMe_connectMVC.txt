Service applicatif de connexion 
écrit en MVC et jquery
La soumission du formulaire est faite en Ajax. 

index.php
-C
-- user.php -- action  : page() ; connect() ; ajax_connect()
-V
-- connnect.tpl

-M (accès BD restant à écrire)
-- userBD.php -- function modèle : connect_bd() basiquement renvoie true



Gestion événementielle jquery-ajax
faite au chargement de la page html en mémoire 
(equivalent du onload) :

---> clic sur le bouton de connexion : 
	alternativement, le formulaire apparaît et disparaît.
	
--> soumission du formulaire via une requête ajax :
	Cliquer sur le bouton de soumission 
	lance une fonction javascript, 
	réalisant la soumission via une requete ajax.
	La vérification du login-mdp est faite en php 
	(fonction ajax_connect)
	et provoque l'affichage  
	du login de l'utilisateur connecté,
	dans l'entête de la page ainsi que d'une carte Leaflet centrée sur l'IUT Paris Descartes avec un marqueur sur le batiment Blériot

Note : pour tester la soumission du formulaire
en cliquant sur le bouton de soumission 
du formulaire, 
mettre en commentaire la déclaration de la gestion événementielle
de soumission dans le fichier javascript.
Dans ce cas, c'est la fonction action connect() qui est invoquée.
Une nouvelle page HTML complète sera chargée avec la précision du login.

