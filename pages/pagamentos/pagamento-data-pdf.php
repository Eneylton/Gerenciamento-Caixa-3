<?php

require __DIR__ . '../../../vendor/autoload.php';

use Dompdf\Dompdf;
use Dompdf\Options;

if (isset($_GET['dataInicio'])) {

    $dataInicio = $_GET['dataInicio'];
    $dataFim = $_GET['dataFim'];
}


$dompdf = new Dompdf();
$options = new Options();
$options->set('isRemoteEnabled', true);
$options->set('isHtml5ParserEnabled', true);

ob_start();

require __DIR__ . "/data-pdf.php";

$dompdf->loadHtml(ob_get_clean());

// echo $pdf;

$dompdf->setPaper("A4");

$dompdf->render();

$dompdf->stream("movimentacao.pdf", ["Attachment" => false]);
