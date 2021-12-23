<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Caixa;
use App\Entidy\Pagamento;
use App\Session\Login;

define('TITLE','Abrir Caixa');
define('BRAND','Caixa');

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();


if(isset($_POST['valor'])){

        $vl1            = $_POST['valor'];
        $vl2            = str_replace(".", "", $vl1);
        $vl3            = str_replace(",", ".",$vl2);

        $item = new Caixa;
        $item->valor = $vl3;
        $item->forma_pagamento_id = $_POST['forma_pagamento_id'];
        $item->cadastar();

        $item2 = new Pagamento;
        $item2->valor = 0;
        $item2->status = 0;
        $item2->caixa_id = $item->id;
        $item2->cadastar();

        header('location: caixa-list.php?status=success');
        exit;
    }
  
   