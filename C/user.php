
<?php
session_start();

function page () {
	$login = "tapez votre login";
	$pass = "tapez votre pass";
	$echoLogin="";  /*pour initialiser à "" la zone d'affichage du login connecté*/
	
	require ('V/page.tpl'); /*affichage de la page du site*/
}


function deconnexion(){
	require("./M/user_BD.php");
	deconnect_user(); //passe bConnect de l'étudiant a 0 dans la base
	session_destroy();//détruit la session
	$nexturl = "index.php"; 
	header ("Location:" . $nexturl); //renvoie à l'index
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
				$nexturl = "index.php?controle=user&action=lancer_test";
				
				$_SESSION['profile'] = $profil;
				
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
	$tabquest = tab_questions($quest); //tableaux des questions générée à partir du thème choisii au hasard
	$idquest = array_rand($tabquest, 1); //id de la question choisi parmi les questions du tableau 
	$questionchoisie = $tabquest[$idquest]; 
	$intitulequestionchoisie = $questionchoisie['intitulequestion'];
	$tabnumquestcorrecte = $questionchoisie['idlieu'];
	$tab_lieux = tab_lieux($quest);
	$_SESSION['tablieux'] = $tab_lieux; // ON MET DANS DES VARIABLE SESSION LES INFORMATIONS QU'ON REUTILISERA DANS CONTINUER_TEST
	$_SESSION['idquestactuelle'] = $idquest; // ICI : TABLEAUX DES LIEUX, L'ID DE LA QUESTION CHOISIE AU LANCEMENT DU TEST, LE TABLEAUX DES QUESTIONS 
	$_SESSION['tabquest'] = $tabquest; // ET LE SCORE
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
if(isset($_POST['act']) && !empty($_POST['act'])) {
    $act = $_POST['act'];
    switch($act) {
        case 'bonne' : bonne_rep();break;
        case 'mauvaise' : mauvaise_rep();break;
    }
}

function continuer_test(){
	var_dump($_SESSION['tabquest']);
	
	$_SESSION['tabquest'][$_SESSION['idquestactuelle']] = null;
	if (check_tableauquest_vide() == true){
		require("./V/fin.tpl"); //jeu fini
	}
	else{
		$tab2 = array_rand($_SESSION['tabquest'], 1);
		while ($_SESSION['tabquest'][$tab2] == null){
			$tab2 = array_rand($_SESSION['tabquest'], 1);
		}
		$tabquestionunique = $_SESSION['tabquest'][$tab2];
		$intitulequestionchoisie = $tabquestionunique['intitulequestion'];
		$tabnumquestcorrecte = $tabquestionunique['idlieu'];
		var_dump($tabnumquestcorrecte);
		$_SESSION['idquestactuelle'] = $tab2;
		require("../V/map.tpl");
	}
}

function check_tableauquest_vide(){
	$cpt = 0;
	foreach ($_SESSION['tabquest'] as $cle) {
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