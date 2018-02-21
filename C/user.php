
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
		$echoLogin=$login;
		}
	else {
		$echoLogin="erreur, recommencer svp";
	}
	//require ('V/page.tpl');
	echo $echoLogin;
}

?>