<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Catdespesa;
use App\Entidy\Movimentacao;
use App\Session\Login;

define('TITLE','Movimentações financeiras');
define('BRAND','Financeiro');

Login::requireLogin();

if(isset($_GET['id'])){

    $idcaixa = $_GET['id'];
 
}

$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$filtroStatus = filter_input(INPUT_GET, 'filtroStatus', FILTER_SANITIZE_STRING);
$filtroStatus = in_array($filtroStatus,['0','1']) ? $filtroStatus : '';

$condicoes = [
    strlen($buscar) ? 'm.tipo LIKE "%'.str_replace(' ','%',$buscar).'%" or
                       m.status LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       f.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       c.nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null,
                       strlen($filtroStatus) ? 'm.status = "'.$filtroStatus.'"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);


$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Movimentacao:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 100);

$listar = Movimentacao::getList(' m.id AS id,m.caixa_id as caixa_id,
m.catdespesas_id AS catdespesas_id,
m.data AS data,
m.descricao AS descricao,
m.tipo AS tipo,
m.status AS status,
m.dinheiro as dinheiro,
m.cartao as cartao,
m.debito as debito,
m.pix as pix,
m.veiculo as veiculo,
m.placa as placa,
m.transferencia as transferencia,
c.nome AS categoria',
                                                            
' movimentacoes AS m
INNER JOIN

catdespesas AS c ON (m.catdespesas_id = c.id)',
                                     'm.caixa_id='.$idcaixa, 'm.id DESC',$pagination->getLimit());

$categorias = Catdespesa :: getList('*', 'catdespesas',null,'nome ASC');

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/movimentacao/movimentacao-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$(document).ready(function(){
    $('.editbtn').on('click', function(){
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#catdespesas_id').val(data[1]);
        $('#data').val(data[2]);
        $('#descricao').val(data[3]);
        $('#tipo').val(data[4]);
        $('#status').val(data[5]);
        $('#dinheiro22').val(data[6]);
        $('#cartao22').val(data[7]);
        $('#debito22').val(data[8]);
        $('#pix22').val(data[9]);
        $('#transferencia22').val(data[10]);
        $('#categoria').val(data[11]);
        $('#veiculo').val(data[12]);
        $('#placa').val(data[13]);
        $('#caixa_id').val(data[14]);
       
    });
});
</script>
