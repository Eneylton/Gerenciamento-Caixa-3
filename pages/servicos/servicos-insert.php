<?php 

require __DIR__.'../../../vendor/autoload.php';

define('TITLE','Novo Usuário');
define('BRAND','Cadastrar Usuário');

use App\Entidy\Cargo;
use App\Entidy\Servico;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();


if(isset($_POST['mecanicos_id'])){

    
        $din1               = $_POST['valor'];
        $din2               = str_replace(".", "", $din1);
        $preco              = str_replace(",", ".",$din2);

        $value = new Servico;
        $value->mecanicos_id    = $_POST['mecanicos_id'];
        $value->extra_id        = $_POST['extra_id'];
        $value->valor           = $preco;
        $value->cadastar();

        header('location: servicos-list.php?status=success');
        exit;
    }
  
   




include __DIR__.'../../../includes/layout/header.php';
include __DIR__.'../../../includes/layout/top.php';
include __DIR__.'../../../includes/layout/menu.php';
include __DIR__.'../../../includes/layout/content.php';
include __DIR__.'../../../includes/usuario/usuario-form-insert.php';
include __DIR__.'../../../includes/layout/footer.php';