<?php

function connect_bd() {
	$login = isset($_POST['login'])?$_POST['login']:"tapez votre login";
	$pass = isset($_POST['pass'])?$_POST['pass']:"tapez votre pass";
	
	/*par défaut : return true*/
	return true;
}

function verif_bd_user($pseudo,$mdp,&$profil) {
	require ("connect_bd.php") ; //connexion $link à MYSQL et sélection de la base
	$select= "select * from joueur where pseudo='%s' and mdp='%s'"; 
	$req = sprintf($select,$pseudo,$mdp);
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req); 
	if (mysqli_num_rows ($res) > 0) {
		$profil = mysqli_fetch_assoc($res);
		$profil['role'] = "etudiant";
		//var_dump($profil);
		
		
		//change la table etudiant dans la base passe bActif a 1 pour l'etudiant qui se connecte
		//$select= "update etudiant set bConnect = '1' where id_etu = '%s'"; 
		//$req = sprintf($select,$profil['id_etu']);
		//$res = mysqli_query($link, $req)	
		//or die (utf8_encode("erreur de requête : ") . $req); 
		
		return true;
	}
	else {
		$profil = null;
		return false;
	}
}

function verifS_ident($pseudo, $mdp, &$err) {
	if (!preg_match("`^[[:alpha:][:digit:]\-]{1,30}$`", $pseudo)) {
		$err = 'erreur de syntaxe sur le nom';
		return false;
		}
	if (!preg_match("`^[[:alpha:][:digit:]]{2,8}$`", $mdp)) {
		$err = 'erreur de syntaxe sur l\'identifiant.';
		return false;
		}
	return true;
} 

function tab_questions($id_theme) {
	
	require ("connect_bd.php") ; //connexion $link à MYSQL et sélection de la base
	$select= "select * from question where idtheme='%s'"; 
	$req = sprintf($select,$id_theme);
	
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req); 
		
	if (mysqli_num_rows ($res) == 0)
		return false; //"pas de contacts";
	else {
		$result_questions= array();
		while ($result = mysqli_fetch_assoc($res) and isset($result)) {
			$result_questions[] = $result; 
		}
		return $result_questions;
	}
}

function tab_lieux($idcarte){
	
		require ("connect_bd.php") ; //connexion $link à MYSQL et sélection de la base
		$select= "select * from lieu where idcarte='%s'"; 
		$req = sprintf($select,$idcarte);
	
		$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req); 
			
		if (mysqli_num_rows ($res) == 0)
			return false; //"pas de contacts";
		else {
			$result_questions= array();
			while ($result = mysqli_fetch_assoc($res) and isset($result)) {
				$result_lieux[] = $result; 
			}
			return $result_lieux;
	}
}

function tab_theme() {
	
	require ("connect_bd.php") ; //connexion $link à MYSQL et sélection de la base
	$select= "select * from theme"; 
	$req = sprintf($select);
	
	$res = mysqli_query($link, $req)	
		or die (utf8_encode("erreur de requête : ") . $req); 
		
	if (mysqli_num_rows ($res) == 0)
		return false; //"pas de contacts";
	else {
		$result_questions= array();
		while ($result = mysqli_fetch_assoc($res) and isset($result)) {
			$result_questions[] = $result; 
		}
		return $result_questions;
	}
}




?>