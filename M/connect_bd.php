<?php


// //chez vous, par exemple avec uwamp
// $hote='localhost';   		
// $login='root';  	
// $pass=''; 		
// $bd='pweb17_cassanel'; //créer préalablement la base de données


//à l'iut
$hote="localhost";   		
$login="root";  		
$pass=""; 
$bd="pwebc"; 

// //joueur de la base
// login=Sacdeneu mdp=root
// login=alison mdp=alison
// login=root= mdp=root
// login=philippe mdp=philippe


if (!isset($link)) {
$link = mysqli_connect($hote, $login, $pass) 
		or die ("erreur de connexion :" . mysql_error()); 
mysqli_select_db($link, $bd) 
		or die (htmlentities("erreur d'accès à la base :") . $bd);
}
?>




