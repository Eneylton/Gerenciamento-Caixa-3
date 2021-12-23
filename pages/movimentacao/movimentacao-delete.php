<?php 

require __DIR__.'../../../vendor/autoload.php';

use \App\Entidy\Movimentacao;
use   \App\Session\Login;


Login::requireLogin();



if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$idcaixa = $_GET['caixa'];

$value = Movimentacao::getID('*','movimentacoes',$_GET['id'],null,null);

if(!$value instanceof Movimentacao){
    header('location: index.php?status=error');

    exit;
}



if(!isset($_POST['excluir'])){
    
 
    $value->excluir();

    header('location: movimentacao-list.php?id='.$idcaixa);

    exit;
}

