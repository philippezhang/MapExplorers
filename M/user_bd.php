<?php

function connect_bd() {
	$login = isset($_POST['login'])?$_POST['login']:"tapez votre login";
	$pass = isset($_POST['pass'])?$_POST['pass']:"tapez votre pass";
	
	/*par d�faut : return true*/
	return true;
}

?>