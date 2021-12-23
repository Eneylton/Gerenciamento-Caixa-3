<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Catdespesa;
use App\Entidy\FormaPagamento;
use App\Entidy\Movimentacao;
use \App\Session\Login;

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$usuarios_nome = $usuariologado['nome'];
$usuarios_email = $usuariologado['email'];

$categorias = Catdespesa :: getList('*','catdespesas');
$pagamentos = FormaPagamento :: getList('*','forma_pagamento');

$dataInicio;
$dataFim;
$status;
$tipo;
$receber = 0;

$consulta = "m.data between '".$dataInicio."' AND '".$dataFim."'";

$result = "";

$listar = Movimentacao ::getList('m.id AS id,
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
mc.nome AS mecanico,
ct.nome AS categoria','maobra AS m
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)
INNER JOIN
catdespesas AS ct ON (m.catdespesas_id = ct.id)',$consulta,null,null);

$despesa  = 0;
$receita  = 0;
$valor1  = 0;
$total = 0;
$resultados = '';
$list = '';
$status1 = '';
$total = 0;
$total_dinheiro = 0;
$total_credito = 0;
$total_debito = 0;
$total_pix = 0;
$total_transferencia = 0;

foreach ($listar as $item) {

    $total_dinheiro += $item->dinheiro;
    $total_credito += $item->cartao;
    $total_debito += $item->debito;
    $total_pix += $item->pix;
    $total_transferencia += $item->transferencia;

    if (empty($item->veiculo)) {

        $veiculo = '<span style="color:#5f6368"> Nenhum !!!! </span>';
     } else {
        $veiculo = $item->veiculo;
     }
 

    $result .= '   <tr>
                        <td>
                         
                        <img src="../../imgs/'.($item->tipo <= 0 ? 'seta1.png' : 'seta2.png').'" style="width:20px; 10px">

                        </td>
                   
                        <td>
                                    
                        <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#0e8219') . '">
                        ' . ($item->status <= 0 ? 'EM ABERTO' : 'PAGO') . '
                        </span>

                        </td>

                        <td style="text-align:left">' . date('d/m/Y à\s H:i:s ', strtotime($item->data)) . '</td>

                        <td style="text-transform: uppercase; font-weight: 600;">' . $veiculo . ' / <span style="color:#ff0000"> ' . $item->placa . ' </span></td>
                     
                        <td style="text-align:left">' . $item->mecanico . '</td>
                        <td style="text-align:left">' . $item->categoria . '</td>
                        <td style="text-align:left">
                        <span style="color:' . ($item->tipo <= 0 ? '#ff0000 ' : '#fff ') . '">
                         R$ ' . number_format($item->dinheiro, "2", ",", ".") . '
                        </span>
                      
                        </td>

                        <td style="text-align:left"> R$ ' . number_format($item->cartao, "2", ",", ".") . '</td>
                        <td style="text-align:left"> R$ ' . number_format($item->debito, "2", ",", ".") . '</td>
                        <td style="text-align:left"> R$ ' . number_format($item->pix, "2", ",", ".") . '</td>
                        <td style="text-align:left"> R$ ' . number_format($item->transferencia, "2", ",", ".") . '</td>
                    
                   </tr>
                ';


}

$receber = ($total_dinheiro + $total_credito + $total_debito + $total_pix + $total_transferencia);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../assets/plugins/fontawesome-free/css/all.min.css">

    <style>
        @page {
            margin: 70px 0;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Open Sans", sans-serif;
        }

        .header {
            position: fixed;
            top: -70px;
            left: 0;
            right: 0;
            width: 100%;
            text-align: center;
            background-color: #555555;
            padding: 10px;
        }

        .header img {
            width: 160px;
        }

        .footer {
            bottom: -27px;
            left: 0;
            width: 100%;
            padding: 5px 10px 10px 10px;
            text-align: center;
            background: #555555;
            color: #fff;
        }

        .footer .page:after {
            content: counter(page);

        }

        table {
            width: 100%;
            border: 1px solid #555555;
            margin: 0;
            padding: 0;
        }

        th {
            text-transform: uppercase;
        }

        table,
        th,
        td {
            font-size: xx-small;
            border: 1px solid #555555;
            border-collapse: collapse;
            text-align: center;
            padding: 5px;

        }

        tr:nth-child(2n+0) {
            background: #eeeeee;
        }

        p {
            color: #888888;
            margin: 0;
            text-align: center;
        }

        h2 {
            text-align: center;

        }
    </style>

    <title>Movimentcao</title>
</head>

<body>

    <table style="margin-top:-40px;">
        <tbody>
            <tr style="background-color: #fff; color:#000">

                <td style="text-align: left; width:260px; border:1px solid #fff; ">
                    <span style="margin-left:126px; margin-top: -50px; font-size:small">Lojão do carro </span><br>
                    <span style="margin-left:126px; margin-top: -30px; font-size:xx-small ">Email:&nbsp; <?= $usuarios_email  ?> </span><br>
                    <span style="margin-left:126px; margin-top: -30px; font-size:xx-small">Atendente:&nbsp; <?= $usuarios_nome  ?> </span><br>
                    <img style="width:120px; height:50px; float:left;margin-top:-50px; padding:10px; margin-left:-12px;" src="../../01.png">
                    <br />
                    <br />

                </td>
                <td style="text-align:center; font-weight:600; font-size:16px; border:1px solid #fff;">**** MOVIMENTAÇÕES FINANCEIRAS ****</td>
                <td style="text-align:right; border:1px solid #fff;">Data de Emissão: <?php echo date("d/m/Y") ?><br></td>

            </tr>
        </tbody>
    </table>


    <table>
        <tbody>
            <tr style="background-color:#ff0000; color:#fff">
                <td style="text-align: center; text-transform:uppercase" colspan="11">HISTÓRICO</td>
            </tr>

            <tr style="background-color: #000; color:#fff">

                <td style="text-align:center; font-size:x-small; width:20px"> #</td>
                <td style="text-align:center;  width:100px"> STATUS </td>
                <td style="text-align:center;  width:100px"> DATA </td>
                <td style="text-align:left;  width:100px"> VEÍCULO </td>
                <td style="text-align:left;  width:100px"> MECÂNICO </td>
                <td style="text-align:left;  width:100px"> CATEGORIA </td>
                <td style="text-align:left;  width:100px"> DINHEIRO</td>
                <td style="text-align:left;  width:100px"> DÉBITO</td>
                <td style="text-align:left;  width:100px"> CRÉDITO</td>
                <td style="text-align:left;  width:100px"> PIX</td>
                <td style="text-align:left;  width:100px"> TRANSFERÊNCIA</td>
                

                

            </tr>

            <?= $result ?>

                <tr style="background-color: #0c4f39; color:#fff">
                <td colspan="6" style="text-align: right;">
                <span style="font-size: 14px;"> RECEBER &nbsp; &nbsp;</span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 14px;text-align:left; color:#89ffb7">R$ <?= number_format($total_dinheiro, "2", ",", "."); ?></span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 12px;text-align:left;">R$ <?= number_format($total_credito, "2", ",", "."); ?></span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 12px;text-align:left;">R$ <?= number_format($total_debito, "2", ",", "."); ?></span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 12px;text-align:left;">R$ <?= number_format($total_pix, "2", ",", "."); ?></span>
                </td>
                <td style="text-align: left;">
                <span style="font-size: 12px;text-align:left;">R$ <?= number_format($total_transferencia, "2", ",", "."); ?></span>
                </td>
                </tr>
                <tr style="background-color: #0b2223; color:#fff">
                <td colspan="7" style="text-align: right;">
                <span style="font-size: 14px;">A RECEBER &nbsp; &nbsp;</span>
                </td>
                <td colspan="4" style="text-align:center;">
                <span style="font-size: 16px; color: #a4cbff;">R$ <?= number_format($receber, "2", ",", "."); ?></span>
                </td>
                </tr>
            

        </tbody>
    </table>

</body>

</html>