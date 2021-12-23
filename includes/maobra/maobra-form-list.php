<?php

$total_dinheiro = 0;
$total_credito = 0;
$total_debito = 0;
$total_pix = 0;
$total_transferencia = 0;
$total_geral = 0;
$saida = 0;
$caixa = 0;
$saldo = 0;

$resultados = '';
$veiculo = '';


foreach ($listar as $item) {
   $id_caixa = $item->caixa_id;
   $total_credito += $item->cartao;
   $total_debito += $item->debito;
   $total_pix+= $item->pix;
   $total_transferencia += $item->transferencia;

   switch ($item->tipo) {
      case '1':
         $total_dinheiro += $item->dinheiro;
         break;
      
      default:
         $saida += $item->dinheiro;
         break;
   }

   if(empty($item->veiculo)){

   $veiculo = '<span style="color:#5f6368"> Nenhum !!!! </span>';
   }else{
      $veiculo = $item->veiculo;
   }


   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->catdespesas_id . '</td>
                      <td style="display:none">' . $item->data . '</td>
                      <td style="display:none">' . $item->descricao . '</td>
                      <td style="display:none">' . $item->tipo . '</td>
                      <td style="display:none">' . $item->status . '</td>
                      <td style="display:none">' . $item->dinheiro . '</td>
                      <td style="display:none">' . $item->cartao . '</td>
                      <td style="display:none">' . $item->debito . '</td>
                      <td style="display:none">' . $item->pix . '</td>
                      <td style="display:none">' . $item->transferencia . '</td>
                      <td style="display:none">' . $item->categoria . '</td>
                      <td style="display:none">' . $item->veiculo . '</td>
                      <td style="display:none">' . $item->placa . '</td>
                      <td style="display:none">' . $item->caixa_id . '</td>
                      

                     <td>

                     <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#00ff00') . '"> 
                     <i class="fa fa-circle" aria-hidden="true"></i> 
                     </span>

                     </td>
                     <td style="width:150px">
                      
                      <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#00ff00') . '">
                      ' . ($item->status <= 0 ? 'EM ABERTO' : 'PAGO') . '
                      </span>
                      
                      </td>

                      <td style="width:150px">
                      
                      <span style="color:' . ($item->tipo <= 0 ? '#ff2121 ' : '#48da59 ') . '">
                      ' . ($item->tipo <= 0 ? 'SAIDA' : 'ENTRADA') . '
                      </span>
                      
                      </td>
                    
                      <td>' . date('d/m/Y à\s H:i:s ', strtotime($item->data)) . '</td>

                      <td style="text-transform: uppercase; font-weight: 600; width:500px">' . $veiculo . ' / <span style="color:#ffc266"> ' . $item->placa . ' </span></td>
                      <td style="text-transform: uppercase; font-weight: 600; width:500px">' . $item->categoria . '</td>

                      <td style="text-transform: uppercase;font-weight: 600; ">
                      <span style="color:' . ($item->tipo <= 0 ? '#ff2121 ' : '#fff ') . '">
                      R$ ' . number_format($item->dinheiro,"2",",",".") . '
                      </span>
                      
                      </td>

                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->cartao, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->debito, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->pix, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->transferencia, "2", ",", ".") . '</td>
                    
                      <td style="text-align: center;">
                        
                      
                      <button type="submit" class="btn btn-warning editbtn" > <i class="fas fa-paint-brush"></i> </button>
                      &nbsp;
                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="12" class="text-center" > Nenhuma movimentação até agora !!!!! </td>
                                                     </tr>';


                                                     $total_geral += ($total_dinheiro + $total_credito + $total_debito + $total_pix + $total_transferencia);

                                                     $caixa = ($total_geral - $saida); 
                                                     
                                                     $saldo = ($total_dinheiro - $saida);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-secondary';
   $paginacao .= '<a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class="btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  </a>';
}

?>

<section class="content">
   <div class="container-fluid">
      <div class="row">
         <div class="col-12">
            <div class="card card-purple">
               <div class="card-header">

                  <form method="get">
                     <div class="row ">
                        <div class="col-4">

                           <label>Buscar por Nome</label>
                           <input type="text" class="form-control" name="buscar" value="<?= $buscar ?>">

                        </div>


                        <div class="col d-flex align-items-end">
                           <button type="submit" class="btn btn-warning">
                              <i class="fas fa-search"></i>

                              Pesquisar

                           </button>

                        </div>


                     </div>

                  </form>
               </div>

               <div class="table-responsive">

                  <table class="table table-bordered table-dark table-bordered table-hover table-striped">
                     <thead>
                     <tr>
                           <td colspan="12">
                              <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#modal-default"> <i class="fas fa-plus"></i> &nbsp; Adicionar</button>
                             
                              <a href="movimentacao-detalhe.php?id=<?= $id_caixa ?>" >
                                 <button style="margin-right:50px; font-weight:600; font-size:x-large" type="submit" class="<?= $total_diaria <= 0 ? 'btn btn-danger' : 'btn btn-default' ?> float-right btn-lg"> <i class="fa fa-print" aria-hidden="true"></i>
                                    MOVIMENTAÇÕES </button>
                              </a>
                     
                              <button style="margin-right:50px; font-weight:600; font-size:x-large" type="submit" class="<?= $saldo <= 0 ? 'btn btn-danger' : 'btn btn-success' ?> float-right btn-lg"><i class="fa fa-arrow-right" aria-hidden="true"></i>
                                SALDO R$ &nbsp;<?= number_format($saldo, "2", ",", ".")  ?></button>
                              


                           </td>
                        </tr>
                        <tr>
                           <th style="text-align: center; width:50px"> <i class="fa fa-align-justify" aria-hidden="true"></i> </th>

                           <th style="text-align: center;"> STATUS </th>
                           <th style="text-align: center"> TIPO </th>
                           <th style="text-align: left;width:280px"> DATA </th>
                           <th style="text-align: left;"> VEÍCULO / PLACA </th>
                           <th style="text-align: left;"> CATEGORIA </th>
                           <th style="text-align: left;width:180px"> DINHEIRO </th>
                           <th style="text-align: left;width:180px"> CRÉDITO </th>
                           <th style="text-align: left;width:180px"> DÉBITO </th>
                           <th style="text-align: left;width:180px"> PIX </th>
                           <th style="text-align: left;width:180px"> TRANSFERÊNCIA </th>
                           <th style="text-align: center;width:200px"> AÇÃO </th>
                        </tr>
                     </thead>
                     <tbody>
                        <?= $resultados ?>
                     </tbody>

                     <tr>
                        <td colspan="6" style="text-align: right;">
                           <span style="font-size: 20px; font-weight:600"> TOTAL</span>
                        </td>
                        <td colspan="1" style="text-align: left">
                           <?php
                             if($saldo <= 0){
                                echo '<span style="font-size: 20px; font-weight:600; color:#ff0000">R$ &nbsp;'. number_format($saldo,"2",",","."). '</span>';
                             }else{
                              echo '<span style="font-size: 20px; font-weight:600; color:#4cb909">R$  &nbsp;'. number_format($saldo,"2",",","."). '</span>';
                             }
                           ?>
                        </td>
                        <td colspan="1"  style="text-align: left">
                           <span style="font-size: 20px; font-weight:600;color:#79d7ad">R$ <?= number_format($total_credito,"2",",",".") ?> </span>
                        </td>
                        <td colspan="1" style="text-align: left">
                           <span style="font-size: 20px; font-weight:600; color:#79d7ad">R$ <?= number_format($total_debito,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align:left">
                           <span style="font-size: 20px; font-weight:600; color:#79d7ad">R$ <?= number_format($total_pix,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left">
                           <span style="font-size: 20px; font-weight:600; color:#79d7ad">R$ <?= number_format($total_transferencia,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: center">
                           <?php
                             if($caixa <= 0){
                                echo '<span style="font-size: 20px; font-weight:600; color:#ff0000">R$ &nbsp;'. number_format($caixa,"2",",","."). '</span>';
                             }else{
                              echo '<span style="font-size: 20px; font-weight:600; color:#94dd04">R$  &nbsp;'. number_format($caixa,"2",",","."). '</span>';
                             }
                           ?>
                        </td>
                     </tr>

                  </table>

               </div>


            </div>

         </div>

      </div>

   </div>

</section>

<?= $paginacao ?>


<div class="modal fade" id="modal-default">
   <div class="modal-dialog modal-lg">
      <div class="modal-content bg-light">
         <form action="./movimentacao-insert.php" method="post">

            <input type="hidden" name="idcaixa" value="<?=  $idcaixa ?>">

            <div class="modal-header">
               <h4 class="modal-title">Nova categoria
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div class="form-group">
               <div class="row">
                     <div class="col-6">
                        <div class="form-group">
                           <label>Veículo</label>
                           <input style="text-transform: uppercase;" type="text" class="form-control" name="veiculo">

                        </div>

                     </div>
                     <div class="col-6">

                        <label>Placa</label>
                        <input style="text-transform: uppercase;" class="form-control" name="placa">

                     </div>



                     <div class="col-12">
                        <div class="form-group">
                           <label>Categorias</label>
                           <select class="form-control select2bs4" style="width: 100%;" name="catdespesas_id" required>

                              <option value=""> Selecione uma categoria </option>
                              <?php

                              foreach ($categorias as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Dinheiro</label>
                           <input placeholder="R$ 0,00" type="text" class="form-control" name="dinheiro" id="dinheiro">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Crédito</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="credito" id="dinheiro2">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Débito</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="debito" id="dinheiro3">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Pix</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="pix" id="dinheiro4">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Transferência</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="transferencia" id="dinheiro5">
                        </div>
                     </div>

                     <div class="col-4">
                        <div class="form-group">

                           <label>Status</label>
                           <div>
                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="status" value="1" checked> Pago
                                 </label>
                              </div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="status" value="0"> Em aberto
                                 </label>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-4">
                        <div class="form-group">

                           <label>Tipo</label>
                           <div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="tipo" value="1" checked> Entrada
                                 </label>
                              </div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="tipo" value="0"> Saida
                                 </label>
                              </div>



                           </div>
                        </div>
                     </div>
                     <div class="col-4">
                        <div class="form-group">
                        <label>Observação</label>
                           <textarea class="form-control" aria-label="With textarea" name="descricao"></textarea>
                        </div>
                     </div>

                  </div>

               </div>

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Salvar</button>
         </div>

         </form>

      </div>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<!-- EDITAR -->

<div class="modal fade" id="editmodal">
   <div class="modal-dialog modal-lg">
      <form action="./movimentacao-edit.php" method="get">
         <div class="modal-content bg-light">
            <div class="modal-header">
               <h4 class="modal-title">Editar
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <input type="hidden" name="id" id="id">
               <input type="hidden" name="caixa_id" id="caixa_id">
               <div class="row">
                     <div class="col-6">
                        <div class="form-group">
                           <label>Veículo</label>
                           <input style="text-transform: uppercase;" type="text" class="form-control" name="veiculo" id="veiculo">

                        </div>

                     </div>
                     <div class="col-6">

                        <label>Placa</label>
                        <input style="text-transform: uppercase;" class="form-control" name="placa" id="placa">

                     </div>



                     <div class="col-12">
                        <div class="form-group">
                           <label>Categorias</label>
                           <select class="form-control" style="width: 100%;" name="catdespesas_id" id="catdespesas_id" required>

                              <option value=""> Selecione uma categoria </option>
                              <?php

                              foreach ($categorias as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Dinheiro</label>
                           <input placeholder="R$ 0,00" type="text" class="form-control" name="dinheiro" id="dinheiro22">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Crédito</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="cartao" id="cartao22">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Débito</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="debito" id="debito22">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Pix</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="pix" id="pix22">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Transferência</label>
                           <input  placeholder="R$ 0,00"  type="text" class="form-control" name="transferencia" id="transferencia22">
                        </div>
                     </div>

                     <div class="col-4">
                        <div class="form-group">

                           <label>Status</label>
                           <div>
                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="status" value="1" checked> Pago
                                 </label>
                              </div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="status" value="0"> Em aberto
                                 </label>
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-4">
                        <div class="form-group">

                           <label>Tipo</label>
                           <div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="tipo" value="1" checked> Entrada
                                 </label>
                              </div>

                              <div class="form-check form-check-inline">
                                 <label class="form-control">
                                    <input type="radio" name="tipo" value="0"> Saida
                                 </label>
                              </div>



                           </div>
                        </div>
                     </div>
                     <div class="col-4">
                        <div class="form-group">
                        <label>Observação</label>
                           <textarea class="form-control" aria-label="With textarea" name="descricao" id="descricao"></textarea>
                        </div>
                     </div>

                  </div>

       
            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Salvar
               </button>
       </div>
         </div>
      </form>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>