<?php 

require __DIR__.'../../../vendor/autoload.php';



use App\Entidy\Mecanico;
use App\Session\Login;

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();


if(isset($_POST['nome'])){

        $item = new Mecanico;
        $item->nome = $_POST['nome'];
        $item->cadastar();

        header('location: mecanico-list.php?status=success');
        exit;
    }
