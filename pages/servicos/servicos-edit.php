<?php 

require __DIR__.'../../../vendor/autoload.php';

$alertaCadastro = '';

use App\Entidy\Servico;
use App\Session\Login;


Login::requireLogin();

if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Servico:: getID('*','servicos',$_GET['id'],null,null);


if(!$value instanceof Servico){
    header('location: index.php?status=error');

    exit;
}



if(isset($_GET['mecanicos_id'])){
    
        $din1               = $_GET['valor'];
        $din2               = str_replace(".", "", $din1);
        $preco              = str_replace(",", ".",$din2);

    $value->mecanicos_id = $_GET['mecanicos_id'];
    $value->extra_id = $_GET['extra_id'];
    $value->valor = $preco ;
    $value-> atualizar();

    header('location: servicos-list.php?status=edit');

    exit;
}


