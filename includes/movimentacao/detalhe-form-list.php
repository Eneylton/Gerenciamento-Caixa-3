<?php

$subtotal = 0;
$total_dinheiro = 0;
$total_cartao = 0;
$total_debito = 0;
$total_pix = 0;
$total_transferencia = 0;
$total = 0;

$subtotal2 = 0;
$total_dinheiro2 = 0;
$total_cartao2 = 0;
$total_debito2 = 0;
$total_pix2 = 0;
$total_transferencia2 = 0;
$total2 = 0;
$saldo_dinheiro = 0;
$saldo_caixa = 0;
$saldo_total = 0;

$resultados = "";
$resultados2 = "";

foreach ($entrada as $item) {

   $subtotal += ($item->dinheiro + $item->cartao + $item->debito + $item->pix + $item->transferencia);

   $resultados .= '<tr>

   
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">r$ ' . number_format($item->dinheiro,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">r$ ' . number_format($item->cartao,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">r$ ' . number_format($item->debito,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">r$ ' . number_format($item->pix,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-success">r$ ' . number_format($item->transferencia,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '.number_format($subtotal,"2",",",".").'</span></h5> </td>
                      </tr>

                      ';
}

foreach ($saida as $item2) {

   $subtotal2 += ($item2->dinheiro + $item2->cartao + $item2->debito + $item2->pix + $item2->transferencia);

   $resultados2 .= '<tr>

   <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-warning">' .date('d/m/Y  Á\S  H:i:s', strtotime($item2->data))  . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-info">r$ ' . number_format($item2->dinheiro,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-info">r$ ' . number_format($item2->cartao,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-info">r$ ' . number_format($item2->debito,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-info">r$ ' . number_format($item2->pix,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-info">r$ ' . number_format($item2->transferencia,"2",",",".") . '</span></h5> </td>
                      <td style="text-transform:uppercase; text-align:center"> <h5><span class="badge badge-pill badge-dark">R$  '. number_format($subtotal2,"2",",",".").'</span></h5> </td>
                      </tr>

                      ';
}


$total_dinheiro2 += $item2->dinheiro;
$total_cartao2+= $item2->cartao;
$total_debito2 += $item2->debito;
$total_pix2 += $item2->pix;
$total_transferencia2 += $item2->transferencia;

$total2 = ($total_dinheiro2 + $total_cartao2 + $total_debito2 + $total_pix2 + $total_transferencia2);

$total_dinheiro += $item->dinheiro;
$total_cartao += $item->cartao;
$total_debito  += $item->debito;
$total_pix += $item->pix;
$total_transferencia += $item->transferencia;

$total = ($total_dinheiro + $total_cartao + $total_debito + $total_pix + $total_transferencia);

$saldo_dinheiro = ($total_dinheiro - $total_dinheiro2);

$saldo_caixa = $saldo_dinheiro + ($troco);

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="7" class="text-center" > Nenhuma movimentação </td>
                                                     </tr>';

$saldo_total = ($saldo_dinheiro + $troco);


?>

<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-lg-6">
         <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">SALDO ANTERIOR (TROCO)</h3>
                <div class="card-tools">
                  <h2 style="color:#4f99e3">R$ <?= number_format($valor_caixa,"2",",",".") ?></h2>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-success text-xl">
                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                       <?php
                        if ($saldo_dinheiro <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($saldo_dinheiro, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#28a745" > 
                           <i class="ion ion-android-arrow-up text-success" ></i> &nbsp;' . number_format($saldo_dinheiro, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        }
                        ?>
                    </span>
                    <span class="text-muted">SALDO EM DINHEIRO</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                  <p class="text-danger text-xl">
                  <i class="fa fa-minus-circle" aria-hidden="true"></i>
                  </p>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    <?php
                        if ($total_dinheiro2 <= 0) {
                           echo '<span class="font-weight-bold" style="color:#28a745">
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($total_dinheiro2, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#ff0000" > 
                           <i class="ion ion-android-arrow-down text-danger" ></i> &nbsp;' . number_format($total_dinheiro2, "2", ",", ".") . '</span> <span class="text-muted"></span>';
                        }
                        ?>
                    </span>
                    <span class="text-muted">TOTAL DE DESPESAS</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="d-flex justify-content-between align-items-center mb-0">
                  <p class="text-dark text-xl">
                  <i class="fas fa-credit-card"></i>
                  </p>
                  <p class="d-flex flex-column text-right" style="font-size: 22px;">
                    
                  <?php
                        if ($saldo_caixa <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($saldo_caixa, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CAIXA</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#28a745" > 
                           <i class="ion ion-android-arrow-up text-success" ></i> &nbsp;' . number_format($saldo_caixa, "2", ",", ".") . '</span> <span class="text-muted">SALDO EM CAIXA</span>';
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
                        if ($saldo_dinheiro <= 0) {
                           echo '<span class="font-weight-bold" style="color:#ff0000">
                           <i class="ion ion-android-arrow-down text-danger"></i> &nbsp;' . number_format($saldo_dinheiro, "2", ",", ".") . '</span> <span class="text-muted">SALDO ENTRADA</span>';
                        } else {
                           echo '<span class="font-weight-bold" style="color:#7644ed" >
                           <i class="ion ion-android-arrow-up text-success"></i> &nbsp;' . number_format($saldo_dinheiro, "2", ",", ".") . '</span> <span class="text-muted">SALDO ENTRADA</span>';
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
                        <P>PRODUÇÃO DIÁRIA</P>
                     </h3>
                     <a href="javascript:void(0);">TOTAL POR DIA </a>
                  </div>
               </div>
               <div class="card-body">
                 
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <canvas id="myChart" width="400" height="130"></canvas>

                  </div>

                  <div class="d-flex flex-row justify-content-end">
                     <span class="mr-2">
                        <i class="fas fa-square text-success"></i> Entrada: R$ <?= number_format($total_dinheiro,"2",",",".") ?>
                     </span>

                     <span>
                        <i class="fas fa-square text-danger"></i> Saida: R$ <?= number_format($total_dinheiro2,"2",",",".") ?>
                     </span>
                  </div>
               </div>
            </div>


         </div>

         <div class="col-lg-6">
            <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">CAIXA</h3>
                     <a href="gerar-pdf.php?id=" target="_blank"> IMPRIMIR RELATÓRIO</a>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-flex">
                     <p class="d-flex flex-column">
                        <span class="text-bold text-lg">FATURAMENTO DIÁRIO &nbsp;</span>

                     </p>
                     <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-success">
                           <i class="fas fa-arrow-up"></i>&nbsp; R$ <?= number_format($total_dinheiro,"2",",",".") ?>
                        </span>
                        <span class="text-muted">Saldo total em dinheiro</span>
                     </p>
                  </div>
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <table class="table table table-hover">
                        <thead>
                           <tr>
                              
                              <th>DINHEIRO</th>
                              <th>CRÉDITO</th>
                              <th>DÉBITO</th>             
                              <th>PIX</th>             
                              <th>TRASFERÊNCIA</th>
                              <th>SUBTOTAL</th>
                           </tr>
                        </thead>
                        <tbody>
                           <tr>
                              <?= $resultados ?>
                           </tr>
                           <tr>
                              
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-danger">R$ <?= number_format($total_dinheiro,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($total_cartao,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($total_debito,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($total_pix,"2",",",".") ?></span></h5>
                              </td>

                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-primary">R$ <?= number_format($total_transferencia,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-dark">R$ <?= number_format($total,"2",",",".") ?></span></h5>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>

                  
               </div>
            </div>

         </div>

         <div class="col-lg-6">
            <div class="card">
               <div class="card-header border-0">
                  <div class="d-flex justify-content-between">
                     <h3 class="card-title">CAIXA</h3>
                     <a href="gerar-pdf.php?id=<?php echo $codigo ?>" target="_blank">RELATÓRIO DETALHADO</a>
                  </div>
               </div>
               <div class="card-body">
                  <div class="d-flex">
                     <p class="d-flex flex-column">
                        <span class="text-bold text-lg">DESPESAS: &nbsp;</span>

                     </p>
                     <p class="ml-auto d-flex flex-column text-right">
                        <span class="text-danger">
                           <i class="fas fa-arrow-down"></i>&nbsp; R$<?= number_format($total_dinheiro2,"2",",",".") ?>
                        </span>
                        <span class="text-muted">Total geral de despesas</span>
                     </p>
                  </div>
                  <!-- /.d-flex -->

                  <div class="card-body">

                     <table class="table table table-hover">
                        <thead>
                           <tr>
                            
                              <th>DATA</th>
                              <th>DINHEIRO</th>
                              <th>CRÉDITO</th>
                              <th>DÉBITO</th>             
                              <th>PIX</th>             
                              <th>TRASFERÊNCIA</th>
                              <th>SUBTOTAL</th>
                           </tr>
                        </thead>
                        <tbody>
                         
                        <?= $resultados2 ?>
                         
                        </tbody>
                        <tr>
                              <td colspan="1" style="text-align: center;font-weight: 600;">
                                 TOTAL
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-danger">R$ <?= number_format($total_dinheiro2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-secondary">R$ <?= number_format($total_cartao2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-secondary">R$ <?= number_format($total_debito2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-secondary">R$ <?= number_format($total_pix2,"2",",",".") ?></span></h5>
                              </td>

                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-secondary">R$ <?= number_format($total_transferencia2,"2",",",".") ?></span></h5>
                              </td>
                              <td  colspan="1" style="text-align: center;">
                                 
                                 <h5><span class="badge badge-pill badge-dark">R$ <?= number_format($total2,"2",",",".") ?></span></h5>
                              </td>
                           </tr>
                     </table>
                  </div>

                
               </div>
            </div>

         </div>
      

      </div>

</section>