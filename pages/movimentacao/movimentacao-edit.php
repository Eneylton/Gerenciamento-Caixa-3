<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Movimentacao;
use App\Session\Login;


Login::requireLogin();

if (!isset($_GET['id']) or !is_numeric($_GET['id'])) {

    header('location: index.php?status=error');

    exit;
}

$value = Movimentacao:: getID('*','movimentacoes',$_GET['id'],null,null);


if (!$value instanceof Movimentacao) {
    header('location: index.php?status=error');

    exit;
}


if (isset($_GET['id'])) {
    date_default_timezone_set('America/Sao_Paulo');

    $idcaixa = $_GET['caixa_id'];

 

    $value->maobra            = $_GET['maobra']; ;
    $value->catdespesas_id    = $_GET['catdespesas_id'];
    $value->status            = $_GET['status'];
    $value->tipo              = $_GET['tipo'];
    $value->descricao         = $_GET['descricao'];
    $value->dinheiro          = $_GET['dinheiro'];
    $value->cartao            = $_GET['cartao'];;
    $value->debito            = $_GET['debito'];;
    $value->pix               = $_GET['pix'];;
    $value->transferencia     = $_GET['transferencia'];;
    $value->veiculo           = $_GET['veiculo'];
    $value->placa             = $_GET['placa'];
    $value->atualizar();

    header('location: movimentacao-list.php?id='.$idcaixa);

    exit;
}
