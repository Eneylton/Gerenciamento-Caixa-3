<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Caixa;
use App\Entidy\Maobra;
use App\Session\Login;

define('TITLE','Movimentações financeiras');
define('BRAND','Financeiro');

Login::requireLogin();

$total_producao  = 0;

if(isset($_GET['id'])){

    $idcaixa = $_GET['id'];

    $result = Caixa :: getID('*','caixa',$idcaixa,null,null);

    $troco = $result->valor;
 
}

$pagar = Maobra :: getList('SUM(m.dinheiro) AS dinheiro,
SUM(m.cartao) AS credito,
SUM(m.debito) AS debito,
SUM(m.pix) AS pix,
SUM(m.transferencia) AS transferencia',' maobra AS m','m.tipo = 0 AND m.caixa_id ='.$idcaixa,null,null);

$obra = Maobra :: getList('m.data AS data,
m.dinheiro AS dinheiro,
m.cartao AS cartao,
m.debito AS debito,
m.pix AS pix,
m.transferencia AS transferencia,
m.catdespesas_id AS catdespesas_id,
mc.nome AS mecanico','maobra AS m
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)','m.tipo = 0 AND m.caixa_id ='.$idcaixa,null,null);

$detalhes = Maobra :: getList('m.data AS data,
m.placa AS placa,
m.veiculo as veiculo,
mc.nome AS mecanico,
m.catdespesas_id AS catdespesas_id,
m.dinheiro AS dinheiro,
m.debito AS debito,
m.cartao AS cartao,
m.pix AS pix,
m.transferencia AS transferencia',' maobra AS m
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)','m.caixa_id ='.$idcaixa,null,null);

$producao = Maobra :: getList(' DATE_FORMAT(m.data, "%d/%m") AS data, sum(m.dinheiro) as total','maobra as m
GROUP BY m.data',null,null);

foreach ($producao as $item) {

    $total_producao += $item->total;

}


include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/maobra/detalhe-form-list.php';
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
        $('#usuarios_id').val(data[1]);
        $('#catdespesas_id').val(data[2]);
        $('#forma_pagamento_id').val(data[3]);
        $('#data').val(data[4]);
        $('#valor').val(data[5]);
        $('#descricao').val(data[6]);
        $('#tipo').val(data[7]);
        $('#status').val(data[8]);
        $('#usuario').val(data[9]);
        $('#categoria').val(data[10]);
        $('#pagamento').val(data[11]);
    });
});
</script>


<script type="text/javascript">

    function carregarImg() {

        var target = document.getElementById('target');
        var file = document.querySelector("input[type=file]").files[0];
        var reader = new FileReader();

        reader.onloadend = function () {
            target.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);


        } else {
            target.src = "";
        }
    }

</script>

<script>

$("#valor_compra").on("change", function(){

    var idCompra = $("#valor_compra").val();
    $.ajax({
        url:'produto-list.php',
        type:'POST',
        data:{
            id:idCompra
        },
        success: function(data){
            $('#valor_venda').val(Number((idCompra) / 0.40).toFixed(2));
        }

    })

});

</script> 

<script>

$("#compra1").on("change", function(){

    var idCompra = $("#compra1").val();
    $.ajax({
        url:'produto-list.php',
        type:'POST',
        data:{
            id:idCompra
        },
        success: function(data){
            $('#venda1').val(Number((idCompra) / 0.40).toFixed(2));
        }

    })

});

</script> 

<script type="text/javascript">
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [

            <?php
           
            foreach ($producao as $item) {
           
                echo "'".$item->data."',";
            }
             
            ?>
        ]
        ,
        datasets: [{
            label: '• PRODUÇÃO DIÁRIA EM DINHEIRO•',
            data: [
                <?php
            foreach ($producao as $item) {
                echo "'".$item->total."',";
            }
             
            ?>
            ],
            backgroundColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
             
            ],
            borderColor: [
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8',
                '#6fe633a8'
             
            ],
            borderWidth: 1
        }
        
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
