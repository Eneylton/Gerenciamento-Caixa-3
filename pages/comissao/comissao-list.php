<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Comissao;
use App\Session\Login;

define('TITLE', 'Comissões');
define('BRAND', 'Financeiro');

Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$filtroStatus = filter_input(INPUT_GET, 'filtroStatus', FILTER_SANITIZE_STRING);
$filtroStatus = in_array($filtroStatus, ['0', '1']) ? $filtroStatus : '';

$condicoes = [
    strlen($buscar) ? 'c.status LIKE "%' . str_replace(' ', '%', $buscar) . '%" or 
                       m.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" or 
                       cd.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null,
    strlen($filtroStatus) ? 'm.status = "' . $filtroStatus . '"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);


$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Comissao::getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 100);

$listar = Comissao::getList(' c.id AS id,
c.data AS data,
c.tipo AS tipo,
c.status as status,
m.id AS mecanico_id,
c.placa AS placa,
c.veiculo AS veiculo,
m.nome AS mecanico,
cd.nome AS categoria,
c.descricao AS descricao,
c.valor as valor', 'comissao AS c
INNER JOIN
mecanicos AS m ON (c.mecanicos_id = m.id)
INNER JOIN
catdespesas AS cd ON (c.catdespesas_id = cd.id)', $where, 'c.id desc', $pagination->getLimit());

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/comissao/comissao-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
    $(document).ready(function() {
        $('.editbtn').on('click', function() {
            $('#editmodal').modal('show');

            $tr = $(this).closest('tr');

            var data = $tr.children("td").map(function() {
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

<script>
$(document).ready(function(){
    $('.editbtn2').on('click', function(){
        $('#editmodal2').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#valor').val(data[1]);
       
    });
});
</script>
