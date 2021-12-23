<?php 

require __DIR__.'../../../vendor/autoload.php';

$alertaCadastro = '';

use App\Entidy\Movimentacao;
use App\Entidy\Pagamento;
use App\Session\Login;

Login::requireLogin();

$valor_atual = 0;
$status = 0;

if(!isset($_GET['id']) or !is_numeric($_GET['id'])){
 
    header('location: index.php?status=error');

    exit;
}

$value = Pagamento:: getID('*','pagamento',$_GET['id'],null,null);

$caixa = $value->caixa_id;

if(!$value instanceof Pagamento){
    header('location: index.php?status=error');

    exit;
}

if(isset($_GET['valor'])){
    
    $value->valor = $_GET['valor'] ;
    $value->saldo = $_GET['valor'] ;
    $value->status = 0;
    $value-> atualizar();

    header('location: pagamento-list.php?status=edit');

    exit;
}


