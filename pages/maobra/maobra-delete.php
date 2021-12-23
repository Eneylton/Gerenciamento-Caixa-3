<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Maobra;
use App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Maobra::getID('*','maobra',$_GET['id'],null,null);

if(!$value instanceof Maobra){
    header('location: index.php?status=error');

    exit;
}



if(!isset($_POST['excluir'])){
    
 
    $value->excluir();

    header('location: maobra-list2.php?status=del');

    exit;
}

