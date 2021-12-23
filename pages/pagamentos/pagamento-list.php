<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\pagamento;
use App\Session\Login;

define('TITLE','Pagamentos pendentes');
define('BRAND','Pagamentos');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'id LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       data LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = pagamento:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 50);

$listar = pagamento::getList('*','pagamento','month(data) = MONTH(CURRENT_DATE())', 'data ASC',$pagination->getLimit());

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/pagamento/pagamento-form-list.php';
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
        $('#valor').val(data[1]);
        $('#comentario').val(data[2]);
       
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

        $('#id2').val(data[0]);
        $('#valor2').val(data[1]);
       
    });
});
</script>
