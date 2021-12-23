<?php

$resultados = '';


$total_valor = 0;
$total_saldo = 0;
$geral = 0;
$pago = "";
$coment = "";

foreach ($listar as $item) {

   $total_valor += $item->valor;
   $total_saldo += $item->saldo;

   if(empty($item->comentario)){

      $coment = '<span style="color:#e3eb63">Nenhum comentário</span>';
   
   }else{
      $coment = $item->comentario;
   }

   switch ($item->status) {
      case '1':
         $pago = "disabled";
         break;
      
      default:
         $pago = "";
         break;
   }

   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->valor . '</td>
                      <td style="display:none">' . $item->comentario . '</td>
                      <td style="display:none">' . $item->saldo . '</td>
                      <td style="display:none">' . $item->data . '</td>
                      <td style="display:none">' . $item->status . '</td>
                      <td style="display:none">' . $item->caixa_id . '</td>
                      <td>' . $item->id . '</td>
                      <td style="width:150px">
                      
                      <span style="color:' . ($item->status <= 0 ? '#ff2121' : '#00ff00') . '">
                      ' . ($item->status <= 0 ? 'EM ABERTO' : 'PAGO') . '
                      </span>
                      
                      </td>
                      <td style="width:150px">' . date('d/m/Y', strtotime($item->data)) . '</td>
                      <td style="text-transform:uppercase; width:800px"> ' .  $coment . '</td>
                      <td style="width:150px">R$ ' . number_format($item->saldo, "2", ",", ".") . '</td>
                      <td style="width:150px">R$ ' . number_format($item->valor, "2", ",", ".") . '</td>
                     
                    
                      <td style="text-align: center;">
                      
                      <button type="submit" class="btn btn-primary editbtn2" '.$pago.'><i class="fas fa-sync-alt" style="font-size:22px"></i></button>
                      &nbsp;&nbsp;
                      <button type="submit" class="btn btn-warning editbtn" '.$pago.' > <i class="fas fa-dollar-sign" style="font-size:22px"></i> &nbsp; &nbsp; PAGAR</button>
                     
                      </td>
                      </tr>
                    
                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="7" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
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

$geral = ($total_saldo - $total_valor);

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

                           <label>Buscar por data</label>
                           <input type="date" class="form-control" name="buscar" value="<?= $buscar ?>">


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
                           <td colspan="7">

                              <button style="margin-right:50px; font-weight:600; font-size:x-large" type="submit" class="btn btn-default float-right" data-toggle="modal" data-target="#modal-data"> <i class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>

                           </td>
                        </tr>

                        <tr>
                           <th style="text-align: left; width:80px"> CÓDIGO </th>
                           <th> STATUS</th>
                           <th >DATA</th>
                           <th>COMENTÁRIO</th>
                           <th>SALDO A PAGAR</th>
                           <th>SALDO PENDENTE</th>

                           <th style="text-align: center; width:200px"> AÇÃO </th>
                        </tr>
                     </thead>
                     <tbody>
                        <?= $resultados ?>
                     </tbody>

                     <tr>
                        <td colspan="4" style="text-align: right;">

                           <span style="font-size: 22px;">TOTAL</span>

                        </td>
                        <td colspan="1">

                           <span style="font-size: 22px;color:#91eef7">R$ <?= number_format($total_saldo, "2", ",", ".") ?></span>

                        </td>
                        <td colspan="1">

                           <span style="font-size: 22px;color:#d58c7c">R$ <?= number_format($total_valor, "2", ",", ".") ?></span>

                        </td>
                   
                        <td colspan="1" style="text-align: center;">

                           <span style="font-size: 27px;color:#c0ffb5">R$ <?= number_format($geral, "2", ",", ".") ?></span>

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
   <div class="modal-dialog">
      <form action="./pagamento-edit.php" method="get">
         <div class="modal-content bg-light">
            <div class="modal-header">
               <h4 class="modal-title">Pagamento
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <input type="hidden" name="id" id="id">
               <div class="form-group">
                  <label>Valor</label>
                  <input type="text" class="form-control" name="valor" id="valor" required>
               </div>
               <div class="form-group">
                  <label>Adicionar comentário</label>
                  <input type="text" class="form-control" name="comentario" id="comentario" >
               </div>

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Pagar
               </button>
            </div>
         </div>
      </form>
      <!-- /.modal-content -->
   </div>
   <!-- /.modal-dialog -->
</div>

<div class="modal fade" id="editmodal2">
   <div class="modal-dialog">
      <form action="./pagamento2-edit.php" method="get">
         <div class="modal-content bg-light">
            <div class="modal-header">
               <h4 class="modal-title">Ajustes
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <input type="hidden" name="id" id="id2">
               <div class="form-group">
                  <label>Valor</label>
                  <input type="text" class="form-control" name="valor" id="valor2" required>
               </div>

            </div>
            <div class="modal-footer justify-content-between">
               <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
               <button type="submit" class="btn btn-primary">Pagar
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
         <form action="./pagamento-data-pdf.php" method="GET" enctype="multipart/form-data">
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