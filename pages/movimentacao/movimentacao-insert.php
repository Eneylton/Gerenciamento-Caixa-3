<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Maobra;
use App\Session\Login;
use App\Entidy\Movimentacao;
use App\Entidy\Pagamento;

$previous = "javascript:history.go(-1)";
if (isset($_SERVER['HTTP_REFERER'])) {
  $previous = $_SERVER['HTTP_REFERER'];
}

$usuariologado = Login:: getUsuarioLogado();

$usuarios_id = $usuariologado['id'];

$saldo = 0;

Login::requireLogin();

$agora = date('Y-m-d');

if(isset($_POST['idcaixa'])){

    $din1               = $_POST['dinheiro'];
    $din2               = str_replace(".", "", $din1);
    $preco1             = str_replace(",", ".",$din2);

    $cart1              = $_POST['credito'];
    $cart2              = str_replace(".", "", $cart1);
    $preco2             = str_replace(",", ".",$cart2);

    $deb1               = $_POST['debito'];
    $deb2               = str_replace(".", "", $deb1);
    $preco3             = str_replace(",", ".",$deb2);

    $deb1               = $_POST['pix'];
    $deb2               = str_replace(".", "", $deb1);
    $preco4             = str_replace(",", ".",$deb2);

    $transf1            = $_POST['transferencia'];
    $transf2            = str_replace(".", "", $transf1);
    $preco5             = str_replace(",", ".",$transf2);


    $maobra1            = $_POST['maobra'];
    $maobra2            = str_replace(".", "", $maobra1);
    $maobra5            = str_replace(",", ".",$maobra2);

    if(empty($_POST['mecanicos_id'])){
      $mec = 14;
    }else{
      $mec = $_POST['mecanicos_id'];
    }


    if(!empty($_POST['maobra'])){

      $valor = ($maobra5 / 2);

      if( $_POST['dinheiro'] && $_POST['credito']){

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->dinheiro = $valor2;
        $obra->cartao = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();

        
      }elseif ($_POST['dinheiro'] && $_POST['debito'] ) {

        $valor2 = ($valor  / 2);
        
        $obra = new Maobra;

        $obra->dinheiro = $valor2;
        $obra->debito = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['dinheiro'] && $_POST['pix'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->dinheiro = $valor2;
        $obra->pix = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['dinheiro'] && $_POST['transferencia'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->dinheiro = $valor2;
        $obra->transferencia = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['credito'] && $_POST['debito'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->cartao = $valor2;
        $obra->debito = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['credito'] && $_POST['pix'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->cartao = $valor2;
        $obra->pix = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();

       
      }elseif ($_POST['credito'] && $_POST['transferencia'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->cartao = $valor2;
        $obra->transferencia = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['debito'] && $_POST['pix'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->debito = $valor2;
        $obra->pix = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['debito'] && $_POST['transferencia'] ) {

        $valor2 = ($valor  / 2);

        $obra = new Maobra;

        $obra->debito = $valor2;
        $obra->transferencia = $valor2;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['dinheiro']) {

        $agora = date('Y-m-d');

        $obra = new Maobra;

        $obra->dinheiro = $valor;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();

      }elseif ($_POST['credito']) {

        $obra = new Maobra;

        $obra->cartao = $valor;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['debito']) {

        $obra = new Maobra;

        $obra->debito = $valor;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['pix']) {

        $obra = new Maobra;

        $obra->pix = $valor;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }elseif ($_POST['transferencia']) {

        $obra = new Maobra;

        $obra->transferencia = $valor;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->catdespesas_id = $_POST['catdespesas_id'];
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();

        
        $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
        $valorPag = $pagamento->valor;
        $saldo = ($valorPag + $valor);

        $pagamento->data  =  $agora;
        $pagamento->valor =  $saldo;
        $pagamento->saldo =  $saldo;
        $pagamento->atualizar();


      }
      
      {

      }
    }

    $item = new Movimentacao;
    $item->catdespesas_id = $_POST['catdespesas_id'];
    $item->status = $_POST['status'];
    $item->tipo = $_POST['tipo'];
    $item->descricao = $_POST['descricao'];
    $item->dinheiro = $preco1;
    $item->cartao = $preco2;
    $item->debito = $preco3;
    $item->pix = $preco4;
    $item->transferencia = $preco5;
    $item->caixa_id = $_POST['idcaixa'];
    $item->veiculo = $_POST['veiculo'];
    $item->placa = $_POST['placa'];
    $item->mecanicos_id = $mec;
    $item->maobra =  $maobra5;
    $item->cadastar();

   

    if($_POST['catdespesas_id'] == 38){

      $pagamento = Pagamento ::getCaixaId('*','pagamento',$_POST['idcaixa'],null,null);
      $valorPag = $pagamento->valor;
      $saldo = ($valorPag - $preco1);

      switch ($saldo) {
        case '0':
          $status = 1;
          break;
          
          default:
          $status = 0;
          break;
      }


      $pagamento->data    =  $agora;
      $pagamento->status  =  $status;
      $pagamento->valor   =  $saldo;
      $pagamento->saldo   =  $saldo;
      $pagamento->atualizar();



}

    header('location: movimentacao-list.php?id='.$_POST['idcaixa']);

    exit;
}

