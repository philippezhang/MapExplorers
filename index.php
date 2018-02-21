<?php
$control= isset($_GET['control'])?$_GET['control']:'user';
$action= isset($_GET['action'])?$_GET['action']:'page';


require ('C/' .  $control . '.php');
$action();
?>