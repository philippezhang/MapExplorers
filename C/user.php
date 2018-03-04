
<?php
function page () {
	$login = "tapez votre login";
	$pass = "tapez votre pass";
	$echoLogin="";  /*pour initialiser à "" la zone d'affichage du login connecté*/
	
	require ('V/page.tpl'); /*affichage de la page du site*/
}

function connect () {
	/* affichage propre du tableau $_POST :
	echo ("<pre> POST= <br/>");
	print_r ($_POST);
	echo ("</pre><br/>"); die();
	*/
	
	$login = isset($_POST['login'])?$_POST['login']:"tapez votre login";
	$pass = isset($_POST['pass'])?$_POST['pass']:"tapez votre pass";
	
	require ('M/user_bd.php');
	if (connect_bd()) { 
		if (count($_POST)==0) { //si champs vide
			require("./V/page.tpl");
		}
		else{
			if (verifS_ident($login, $pass, $err) && verif_bd_user($login, $pass, $profil)) {
				$_SESSION['profil'] = $profil;
				$_SESSION['profil']['bConnect'] = 1;
				$nexturl = "index.php?controle=etudiant&action=lancer_test";
				header ("Location:" . $nexturl);
			}
			else{
				
				$echoLogin="Compte inexistant";
				require("./V/page.tpl");
				
			}
		}
	}
	else {
		$echoLogin="erreur de connexion à la BDD, recommencer svp";
	}
	
}

function lancer_test(){
	$quest=1;
	
	require ('M/user_bd.php');
	$tabquest = tab_questions($quest);
	$tabquestionunique = $tabquest[array_rand($tabquest, 1)];
	$question = $tabquestionunique['intitulequestion'];
	$tabnumquest = $tabquestionunique['idlieu'];
	
	require("./V/map.tpl");
	
}



?>