<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Catdespesa;
use App\Entidy\Mecanico;
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
    strlen($buscar) ? 'm.veiculo LIKE "%'.str_replace(' ','%',$buscar).'%" or
                       m.placa LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       mc.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       c.nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null,
                       strlen($filtroStatus) ? 'm.status = "'.$filtroStatus.'"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);


$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Movimentacao:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 1000);

$listar = Movimentacao::getList(' m.id AS id,
m.caixa_id AS caixa_id,
m.maobra AS maobra,
m.catdespesas_id AS catdespesas_id,
m.mecanicos_id AS mecanicos_id,
m.data AS data,
m.descricao AS descricao,
m.tipo AS tipo,
m.status AS status,
m.dinheiro AS dinheiro,
m.cartao AS cartao,
m.debito AS debito,
m.pix AS pix,
m.veiculo AS veiculo,
m.placa AS placa,
m.transferencia AS transferencia,
mc.nome AS mecanicos,
c.nome AS categoria',
                                                            
' movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)',
                                     'm.caixa_id='.$idcaixa, 'm.id DESC',$pagination->getLimit());

$categorias = Catdespesa :: getList('*', 'catdespesas',null,'nome ASC');

$mecanicos  = Mecanico :: getList('*','mecanicos',null,'nome ASC');

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
        $('#mecanicos_id').val(data[15]);
        $('#mecanicos').val(data[16]);
        $('#maobra22').val(data[17]);
       
    });
});
</script>
