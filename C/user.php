
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
	
	require ('M/user_bd.php');
	
	$tabThemes = tab_theme();
	$quest=$tabThemes[array_rand($tabThemes, 1)]['idtheme']; // theme choisi au hasard
	$tabquest = tab_questions($quest);
	$tab2 = array_rand($tabquest, 1);
	$tabquestionunique = $tabquest[$tab2];
	$question = $tabquestionunique['intitulequestion'];
	$tabnumquest = $tabquestionunique['idlieu'];
	$tab_lieux = tab_lieux($quest);
	$_SESSION['idquestactuelle'] = $tab2;
	$_SESSION['tabquest'] = $tabquest;
	$_SESSION['score'] = 0; //initialisation du score
	require("./V/map.tpl");
	
}

function bonne_rep(){
	$_SESSION['score'] +=1;
	continuer_test();
}


function mauvaise_rep(){
	$_SESSION['score'] -=1;
	continuer_test();
}

function continuer_test(){
	$_SESSION['tabquest'][$_SESSION['idquestactuelle']] = null;
	if (check_tableauquest_vide() == true){
		require("./V/fin.tpl"); //jeu fini
	}
	else{
		while ($_SESSION['tabquest'][$tab2] == null){
			$tab2 = array_rand($_SESSION['tabquest'], 1);
		}
		$tabquestionunique = $_SESSION['tabquest'][$tab2];
		$question = $tabquestionunique['intitulequestion'];
		$tabnumquest = $tabquestionunique['idlieu'];
		$_SESSION['idquestactuelle'] = $tab2;
		require("./V/map.tpl");
	}
}

function check_tableauquest_vide(){
	$cpt = 0;
	foreach ($arr as $cle) {
		if ($cle == null){
			$cpt+=1;
		}
	}
	if ($cpt == count($_SESSION['tabquest']))
		return true;
	else
		return false;
}









?>