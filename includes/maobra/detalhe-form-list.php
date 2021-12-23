<?php

$dinheiro2 = 0;
   $cartao2 =0;
   $debito2 =0;
   $pix2 =0;
   $transferencia2 =0;

$total = 0;
$apagar = 0;

foreach ($pagar as $item) {

$dinheiro = $item->dinheiro;
$credito = $item->credito;
$debito = $item->debito;
$pix = $item->pix;
$transferencia = $item->transferencia;

$apagar = ($dinheiro + $credito + $debito + $pix + $transferencia);

}

$resultados = "";

foreach ($detalhes as $item) {

   $dinheiro2 += $item->dinheiro;
   $cartao2 += $item->cartao;
   $debito2 += $item->debito;
   $pix2 += $item->pix;
   $transferencia2 += $item->transferencia;

   $resultados .= '<tr>

   
                      <td style="text-transform:uppercase; text-align:left"> <h5><span class="badge badge-pill badge-danger"> ' . $item->data . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:left"> <h5><span class="badge badge-pill badge-danger"> ' . $item->placa. '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:left"> <h5><span class="badge badge-pill badge-danger"> ' . $item->veiculo. '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:left"> <h5><span class="badge badge-pill badge-danger"> ' . $item->mecanico. '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">r$ ' .    number_format($item->dinheiro,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '.    number_format($item->cartao,"2",",",".").'</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '.    number_format($item->debito,"2",",",".").'</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '.    number_format($pix,"2",",",".").'</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '.    number_format($transferencia,"2",",",".").'</span></h5> </td>
                      </tr>

                      ';
}
  
?>

<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-lg-6">
         <div class="card">
              <div class="card-header border-0">
                <a href="../../pages/pagamentos/pagamento-list.php"><h3 class="card-title">VALOR A PAGAR</h3></a>
                <div class="card-tools">
                  <h2 style="color:#4f99e3">R$ <?= number_format($apagar,"2",",",".") ?></h2>
                </div>
              </div>
              <div class="card-body">
              <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="far fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($credito <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($credito, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CRÉDITO</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#7644ed" >
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($credito, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CRÉDITO</span>';
                        }
                        ?>


                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="far fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($debito <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($debito, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM DÉBITO</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#7644ed" >
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($debito, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM DÉBITO</span>';
                        }
                        ?>


                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="fas fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($pix <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($pix, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM PIX</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#28a745" > 
                           <i class="ion ion-android-arrow-up text-success" ></i> &nbsp;' . number_format($pix, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM PIX</span>';
                        }
                        ?>


                  </p>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="far fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($transferencia <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($transferencia, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM TRANSFERÊNCIAS</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#7644ed" >
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($transferencia, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM TRANSFERÊNCIAS</span>';
                        }
                        ?>


                  </p>
                </div>

            
                <!-- /.d-flex -->
              </div>
            </div>

         </div>
         <div class="col-lg-6">
         <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">
                        <P>PRODUÇÃO DIÁRIA EM DINHEIRO</P>
                     </h3>
                     <div class="card-tools">
                  <h2 style="color:#06be30">R$ <?= number_format($total_producao,"2",",",".") ?></h2>
                </div>
                  </div>
               </div>
               <div class="card-body">
                 
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <canvas id="myChart" width="400" height="130"></canvas>

                  </div>

                  <div class="d-flex flex-row justify-content-end">
                     <span class="mr-2">
                        <i class="fas fa-square text-success"></i> PRODUÇÃO: R$ <?= number_format($total_producao,"2",",",".") ?>
                     </span>

                    
                  </div>
               </div>
            </div>


         </div>

         <div class="col-12">
            <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">CAIXA</h3>
                     <a href="gerar-pdf.php?id=" target="_blank"> IMPRIMIR RELATÓRIO</a>
                  </div>
               </div>
               <div class="card-body">
                 
                     <table class="table table table-hover">
                        <thead>
                           <tr>
                              
                              <th>DATA</th>
                              <th>PLACA</th>
                              <th>VEICULO</th>             
                              <th>MECÂNICO</th>             
                              <th style="text-align: center;">DINHEIRO</th>
                              <th style="text-align: center;">CRÉDITO</th>
                              <th style="text-align: center;">DÉBITO</th>
                              <th style="text-align: center;">PIX</th>
                              <th style="text-align: center;">TRANSFERÊNCIAS</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <?= $resultados ?>
                           </tr>
                           <tr>
                              
                              <td  colspan="4" style="text-align: right;">
                                 
                                 <h5><span >TOTAL POR FORMA DE PAGAMENTO</span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($dinheiro2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($cartao2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($debito2,"2",",",".") ?></span></h5>
                              </td>

                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($pix2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($transferencia2,"2",",",".") ?></span></h5>
                              </td>
                           </tr>
                         
                        </tbody>
                     </table>
                  </div>

                  
               
            </div>

         </div>

      

      </div>

</section>