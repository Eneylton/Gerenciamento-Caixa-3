<?php

$list = '';

$resultados = '';

$total_dinheiro=0;
$geral=0;
$total_credito=0;
$total_debito=0;
$total_pix=0;
$saida=0;
$total_transferencia=0;
$veiculo="";

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


   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->data . '</td>
                      <td style="display:none">' . $item->descricao . '</td>
                      <td style="display:none">' . $item->tipo . '</td>
                      <td style="display:none">' . $item->status . '</td>
                      <td style="display:none">' . $item->dinheiro . '</td>
                      <td style="display:none">' . $item->cartao . '</td>
                      <td style="display:none">' . $item->debito . '</td>
                      <td style="display:none">' . $item->pix . '</td>
                      <td style="display:none">' . $item->transferencia . '</td>
                      <td style="display:none">' . $item->veiculo . '</td>
                      <td style="display:none">' . $item->placa . '</td>
                      <td style="display:none">' . $item->mecanico . '</td>

                    

                      <td style="width:150px">
                      
                      <i class="fa fa-clock" aria-hidden="true"></i> &nbsp; &nbsp;' .date('d/m/Y à\s H:i:s ', strtotime($item->data)). '</span></h3> 
                      
                      </td>
                    
                      
                      <td style="text-transform: uppercase; font-weight: 600; width:500px">' . $veiculo . ' / <span style="color:#ffc266"> ' . $item->placa . ' </span></td>
                     
                      <td>' . $item->mecanico . '</td>
                      <td>' . $item->categoria . '</td>

                      <td style="text-transform: uppercase;font-weight: 600; ">
                      <span style="color:' . ($item->tipo <= 0 ? '#ff2121 ' : '#fff ') . '">
                      R$ ' . number_format($item->dinheiro, "2", ",", ".") . '
                      </span>
                      
                      </td>

                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->cartao, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->debito, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->pix, "2", ",", ".") . '</td>
                      <td style="font-weight: 600; width:50px"> R$ ' . number_format($item->transferencia, "2", ",", ".") . '</td>
                    
                      <td style="text-align: center;">
                        
                      
                      <button type="submit" class="btn btn-warning editbtn" > <i class="fas fa-paint-brush"></i> </button>
                      &nbsp;
                      <a href="maobra-delete.php?id=' . $item->id . '">
                      <button type="button" class="btn btn-danger"> <i class="fas fa-trash"></i></button>
                      </a>
                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="12" class="text-center" > Nenhuma mão de obra !!!!! </td>
                                                     </tr>';


unset($_GET['status']);
unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
   $class = $pagina['atual'] ? 'btn-primary' : 'btn-secondary';
   $paginacao .= '<a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class="btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  </a>';
}

$geral = ($total_dinheiro + $total_credito + $total_debito + $total_pix + $total_transferencia);

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
                           <button type="submit" class="btn btn-warning" name="">
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
                           <td colspan="10">
                              <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modal-default"> <i class="fas fa-plus"></i> &nbsp; Nova</button>
                              <button style="margin-right:50px; font-weight:600;" type="submit" class="btn btn-default float-right" data-toggle="modal" data-target="#modal-data"> <i class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>
                           </td>
                        </tr>


                        <tr>
                           <th style="text-align: center;width:300px""> DATA </th>
                           <th style="text-align: left;"> VEÍCULO / PLACA </th>
                           <th style="text-align: left;width:280px"> MECÂNICO </th>
                           <th style="text-align: left;width:280px"> CATEGORIA </th>
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
                        <td colspan="4" style="text-align: right;"> 
                            <span>TOTAL</span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:18px;color:#ff0000"> 
                            <span>R$ <?= number_format($total_dinheiro,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:18px; color:#6df951"> 
                            <span>R$ <?= number_format($total_credito,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:18px;color:#6df951"> 
                            <span>R$ <?= number_format($total_debito,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:18px; color:#6df951"> 
                            <span>R$ <?= number_format($total_pix,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:18px;color:#6df951"> 
                            <span>R$ <?= number_format($total_transferencia,"2",",",".") ?></span>
                        </td>
                        <td colspan="1" style="text-align: left;font-size:24px;color:#aff"> 
                            <span>R$ <?= number_format($geral,"2",",",".") ?></span>
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

<!-- EDITAR -->

<div class="modal fade" id="editmodal">
   <div class="modal-dialog modal-lg">
      <form action="./maobra-edit.php" method="get">
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
                     
                        <label>Mecânicos</label>
                        <select class="form-control " style="width: 100%;" name="mecanicos_id" id="mecanicos_id">

                          
                           <?php

                           foreach ($mecanicos as $item) {
                              echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                           }
                           ?>

                        </select>

                     </div>



                     <div class="col-12">
                        <div class="form-group">
                           <label>Categorias</label>
                           <select class="form-control" style="width: 100%;" name="catdespesas_id" id="catdespesas_id" required>

                      
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
                           <input type="text" class="form-control" name="dinheiro" id="dinheiro">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Crédito</label>
                           <input type="text" class="form-control" name="cartao" id="cartao">
                        </div>
                     </div>
                     <div class="col-2">
                        <div class="form-group">
                           <label>Débito</label>
                           <input type="text" class="form-control" name="debito" id="debito">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Pix</label>
                           <input type="text" class="form-control" name="pix" id="pix">
                        </div>
                     </div>
                     <div class="col-3">
                        <div class="form-group">
                           <label>Transferência</label>
                           <input type="text" class="form-control" name="transferencia" id="transferencia">
                        </div>
                     </div>

                   
                  
                     <div class="col-12">
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

<div class="modal fade" id="modal-data">
      <div class="modal-dialog modal-lg">
         <div class="modal-content ">
            <form action="./gerar-data2-pdf.php" method="GET" enctype="multipart/form-data">
               <input type="hidden" name="id_caixa" value="<?= $id_caixa ?>">
               <div class="modal-header">
                  <h4 class="modal-title">Relatórios
                  </h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="card-body">

                  <div class="form-group">

                     <div class="row">
                    
                        <div class="col-lg-6 col-6">
                        <label>Selecione o periodo</label>
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataInicio">
                        </div>


                        <div class="col-lg-6 col-6">
                        <label>Fim</label>
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataFim">
                        </div>
                    
                  
                     </div>
                  </div>

               </div>
               <div class="modal-footer justify-content-between">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                  <button type="submit" class="btn btn-primary">Gerar relatório</button>
               </div>

            </form>

         </div>
         <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
   </div>

 