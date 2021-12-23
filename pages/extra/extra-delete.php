<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Extra;
use App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Extra::getID('*','extra',$_GET['id'],null,null);

if(!$value instanceof Extra){
    header('location: index.php?status=error');

    exit;
}



if(!isset($_POST['excluir'])){
    
 
    $value->excluir();

    header('location: lista-list.php?status=del');

    exit;
}

