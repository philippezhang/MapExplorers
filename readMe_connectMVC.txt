Service applicatif de connexion 
�crit en MVC et jquery
La soumission du formulaire est faite en Ajax. 

index.php
-C
-- user.php -- action  : page() ; connect() ; ajax_connect()
-V
-- connnect.tpl

-M (acc�s BD restant � �crire)
-- userBD.php -- function mod�le : connect_bd() basiquement renvoie true



Gestion �v�nementielle jquery-ajax
faite au chargement de la page html en m�moire 
(equivalent du onload) :

---> clic sur le bouton de connexion : 
	alternativement, le formulaire appara�t et dispara�t.
	
--> soumission du formulaire via une requ�te ajax :
	Cliquer sur le bouton de soumission 
	lance une fonction javascript, 
	r�alisant la soumission via une requete ajax.
	La v�rification du login-mdp est faite en php 
	(fonction ajax_connect)
	et provoque l'affichage  
	du login de l'utilisateur connect�,
	dans l'ent�te de la page ainsi que d'une carte Leaflet centr�e sur l'IUT Paris Descartes avec un marqueur sur le batiment Bl�riot

Note : pour tester la soumission du formulaire
en cliquant sur le bouton de soumission 
du formulaire, 
mettre en commentaire la d�claration de la gestion �v�nementielle
de soumission dans le fichier javascript.
Dans ce cas, c'est la fonction action connect() qui est invoqu�e.
Une nouvelle page HTML compl�te sera charg�e avec la pr�cision du login.

