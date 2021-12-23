<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Movimentacao;
use App\Session\Login;

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$usuarios_nome = $usuariologado['nome'];
$usuarios_email = $usuariologado['email'];

$dataInicio;
$dataFim;
$id_caixa;

$dinheiro = 0;
$cartao = 0;
$debito = 0;
$pix = 0;
$transferencia = 0;
$geral = 0;
$total_dinheiro = 0;
$saida = 0;
$saldo = 0;

if($catdespesas_id == ""){

    $var4 = "";

}else{

    $var4 = " AND m.catdespesas_id=".$catdespesas_id."";
}


$consulta = "m.data between '".$dataInicio."' AND '".$dataFim."' AND caixa_id = '".$id_caixa."'".$var4;

$result = "";

$listar = Movimentacao ::getList(' m.id AS id,
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
c.nome AS categoria','movimentacoes AS m
INNER JOIN
catdespesas AS c ON (m.catdespesas_id = c.id)
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)',$consulta,null,null);


foreach ($listar as $item) {
 
    $dinheiro += $item->dinheiro;
    $cartao += $item->cartao;
    $debito += $item->debito;
    $pix += $item->pix;
    $transferencia += $item->transferencia;

    switch ($item->tipo) {
        case '1':
           $total_dinheiro += $item->dinheiro;
           break;
  
        default:
           $saida += $item->dinheiro;
           break;
     }
  
     if (empty($item->veiculo)) {
  
        $veiculo = '<span style="color:#5f6368"> Nenhum !!!! </span>';
     } else {
        $veiculo = $item->veiculo;
     }
 

    $result .= '   <tr>
                        
                        <td style="text-transform: uppercase; text-align:left">' . $veiculo . ' / <span style="color:#ff0000"> ' . $item->placa . ' </span></td>
                        <td style="text-transform: uppercase;text-align:left">' . $item->categoria . '</td>
                        <td style="text-transform: uppercase;text-align:left">' .$item->mecanicos. '</td>

                        <td style="text-transform: uppercase;text-align:left">
                        <span style="color:' . ($item->tipo <= 0 ? '#ff0000 ' : '#000 ') . '">
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

$geral = ($dinheiro + $cartao + $debito + $pix + $transferencia);
$saldo = ($total_dinheiro - $saida );

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
                <td style="text-align:center; font-weight:600; font-size:16px; border:1px solid #fff;">**** MOVIMENTAÇÕES FINANCEIRO ****</td>
                <td style="text-align:right; border:1px solid #fff;">Data de Emissão: <?php echo date("d/m/Y") ?><br></td>

            </tr>
        </tbody>
    </table>


    <table>
        <tbody>
            <tr style="background-color:#ff0000; color:#fff">
                <td style="text-align: center; text-transform:uppercase" colspan="9">HISTÓRICO</td>
            </tr>

            <tr style="background-color: #000; color:#fff">

                <td style="text-align:left; width:205px"> VEÍCULO / PLACA</td>                
                <td style="text-align:left;width:205px"> CATEGORIA</td>                
                <td style="text-align:left;width:120px"> MECÂNICO</td>                
                <td style="text-align:left;width:100px"> DINHEIRO</td>                
                <td style="text-align:left;width:100px"> CRÉDITO</td>                
                <td style="text-align:left;width:100px"> DÉBITO</td>                
                <td style="text-align:left;width:100px"> PIX</td>                
                <td style="text-align:left;width:100px"> TRANSFERÊNCIA</td>                
                       

            </tr>

            <?= $result ?>

            <tr style="background-color:#036a3a; color:#fff">
                <td style="text-align: right; text-transform:uppercas" colspan="3">RECEBER</td>
                <td style="text-align: left;font-size:12px" colspan="1">R$ <?= number_format($saldo,"2",",",".") ?></td>
                <td style="text-align: left; " colspan="1">R$ <?= number_format($cartao,"2",",",".") ?></td>
                <td style="text-align: left; " colspan="1">R$ <?= number_format($debito,"2",",",".") ?></td>
                <td style="text-align: left; " colspan="1">R$ <?= number_format($pix,"2",",",".") ?></td>
                <td style="text-align: left; " colspan="1">R$ <?= number_format($transferencia,"2",",",".") ?></td>
            </tr>
            <tr style="background-color:#0d3228; color:#fff">
                <td style="text-align: right;" colspan="4">A RECEBER</td>
                <td style="text-align:center;font-size:15px" colspan="4">R$ <?= number_format($geral,"2",",",".") ?></td>
               
            </tr>
            

        </tbody>
    </table>

</body>

</html>