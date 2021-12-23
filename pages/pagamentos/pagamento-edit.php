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

    $result = Pagamento :: getID('*','pagamento',$_GET['id'],null,null);
    $valor_banco = $result->valor;

    $vl1            = $_GET['valor'];
    $vl2            = str_replace(".", "", $vl1);
    $vl3            = str_replace(",", ".",$vl2);

    $valor_atual = ($valor_banco - $_GET['valor']);

    switch ($valor_atual) {
        case '0':
            $status = 1;
            break;
        
        default:
            $status = 0;
            break;
    }
    
    $value->valor = $valor_atual ;
    $value->status = $status;
    $value->comentario = $_GET['comentario'];
    $value-> atualizar();

    $item = new Movimentacao;

    $item->catdespesas_id = 38;
    $item->status = 1;
    $item->tipo = 0;
    $item->dinheiro = $vl3;
    $item->caixa_id = $caixa;  
    $item->mecanicos_id = 14;
    $item->cadastar();

    header('location: pagamento-list.php?status=edit');

    exit;
}


