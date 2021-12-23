<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Extra;
use App\Entidy\Mecanico;
use App\Entidy\Servico;
use App\Session\Login;

define('TITLE','Lista de Serviços');
define('BRAND','Serviços');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 's.id LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       m.nome LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       e.nome LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Servico:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 100);

$listar = Servico::getList('    s.id,
                                s.data1,
                                s.mecanicos_id,
                                s.extra_id,
                                s.valor,
                                m.nome as mecanicos,
                                e.nome as extra',' servicos AS s
                                INNER JOIN
                                mecanicos AS m ON (s.mecanicos_id = m.id)
                                INNER JOIN
                                extra AS e ON (s.extra_id = e.id)','s.data1 >= current_date() ', 'm.nome ASC',$pagination->getLimit());

$mecanicos = Mecanico :: getList('*','mecanicos');
$extras = Extra :: getList('*','extra',null, 'nome ASC');


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/servico/servico-form-list.php';
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
        $('#mecanicos_id').val(data[1]);
        $('#extra_id').val(data[2]);
        $('#valor').val(data[3]);
        $('#mecanico').val(data[4]);
        $('#extra').val(data[5]);
       
    });
});
</script>
