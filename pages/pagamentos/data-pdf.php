<?php

require __DIR__ . '../../../vendor/autoload.php';

use App\Entidy\Pagamento;
use App\Session\Login;

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$usuarios_nome = $usuariologado['nome'];
$usuarios_email = $usuariologado['email'];

$dataInicio;
$dataFim;
$total = 0;
$total_valor = 0;
$total_saldo = 0;
$geral = 0;

$coment="";

$consulta = "data between '" . $dataInicio . "' AND '" . $dataFim."'";

$result = "";

$listar = Pagamento::getList('*', 'pagamento', $consulta, 'data ASC', null);


foreach ($listar as $item) {
    
    $total += $item->valor;

    $total_valor += $item->valor;
    $total_saldo += $item->saldo;

    if(empty($item->comentario)){

        $coment = '<span style="color:#ff0000">Nenhum comentário</span>';
     
     }else{
        $coment = $item->comentario;
     }
  

    $result .= '   <tr>
                        
    <td>' . $item->id . '</td>
    <td style="text-align:left">
    
    <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#0f954a') . '">
    ' . ($item->status <= 0 ? 'EM ABERTO' : 'PAGO') . '
    </span>
    
    </td>
    <td style="text-align:left">' . date('d/m/Y', strtotime($item->data)) . '</td>
    <td style="text-align:left">' . $coment. '</td>
    <td style="text-align:left">R$ ' . number_format($item->saldo, "2", ",", ".") . '</td>
    <td style="text-align:left">R$ ' . number_format($item->valor, "2", ",", ".") . '</td>

                   </tr>
                ';
}

$geral = ($total_saldo - $total_valor);

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
                <td style="text-align:center; font-weight:600; font-size:12px; border:1px solid #fff;">**** PAGAMENTOS ****</td>
                <td style="text-align:center; border:1px solid #fff;">Período: <?=  date('d/m/Y', strtotime($dataInicio)) ?> 
                                                                           até <?=  date('d/m/Y', strtotime($dataFim)) ?> <br></td>

            </tr>
        </tbody>
    </table>


    <table>
        <tbody>
            <tr style="background-color:#ff0000; color:#fff">
                <td style="text-align: center; text-transform:uppercase" colspan="9">HISTÓRICO</td>
            </tr>

            <tr style="background-color: #000; color:#fff">

                <td style="text-align:left;">CÓDIGO</td>
                <td style="text-align:left;width:80px"> STATUS</td>
                <td style="text-align:left;width:80px"> DATA</td>
                <td style="text-align:left;width:300px"> COMENTÁRIO</td>
                <td style="text-align:left;width:120px"> A PAGAR</td>
                <td style="text-align:left;width:120px"> SALDO DEVEDOR</td>
                


            </tr>

            <?= $result ?>

            <tr style="background-color:#264c54; color:#fff">
                        <td colspan="4" style="text-align: right;">

                        <span>TOTAL</span>

                        </td>
                        <td colspan="1" style="text-align: left;">

                        <span style="font-size: 15px;">R$ <?= number_format($total_saldo,"2",",",".") ?></span>

                        </td>
                        <td colspan="2" style="text-align: left;">

                        <span style="font-size: 15px;color:#f3a4a4">R$ <?= number_format($total_valor,"2",",",".") ?></span>

                        </td>
                      
                     </tr>

                     <tr style="background-color:#2f7578; color:#fff">
                        <td colspan="4" style="text-align: right;">

                        <span>RECEBIDO (PAGO)</span>

                        </td>
                        <td colspan="3" style="text-align: center;">

                        <span style="font-size: 15px;">R$ <?= number_format($geral,"2",",",".") ?></span>

                        </td>
                      
                      
                     </tr>


        </tbody>
    </table>

</body>

</html>