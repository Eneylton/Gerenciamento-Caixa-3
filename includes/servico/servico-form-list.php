<?php

$list = '';

if (isset($_GET['status'])) {

   switch ($_GET['status']) {
      case 'success':
         $icon  = 'success';
         $title = 'Parabéns';
         $text = 'Cadastro realizado com Sucesso !!!';
         break;

      case 'del':
         $icon  = 'error';
         $title = 'Parabéns';
         $text = 'Esse usuário foi excluido !!!';
         break;

      case 'edit':
         $icon  = 'warning';
         $title = 'Parabéns';
         $text = 'Cadastro atualizado com sucesso !!!';
         break;


      default:
         $icon  = 'error';
         $title = 'Opss !!!';
         $text = 'Algo deu errado entre em contato com admin !!!';
         break;
   }

   function alerta($icon, $title, $text)
   {
      echo "<script type='text/javascript'>
      Swal.fire({
        type:'type',  
        icon: '$icon',
        title: '$title',
        text: '$text'
       
      }) 
      </script>";
   }

   alerta($icon, $title, $text);
}

$subtotal = 0;

$resultados = '';

foreach ($listar as $item) {

   $subtotal += $item->valor;

   $resultados .= '<tr>
                      <td style="display:none">' . $item->id . '</td>
                      <td style="display:none">' . $item->mecanicos_id . '</td>
                      <td style="display:none">' . $item->extra_id . '</td>
                      <td style="display:none">' . $item->valor . '</td>
                      <td style="display:none">' . $item->mecanicos . '</td>
                      <td style="display:none">' . $item->extra . '</td>
                      
                      <td>' . date('d/m/Y à\s H:i:s ', strtotime($item->data1)) . '</td>
                      <td>' . $item->mecanicos . '</td>
                      <td>' . $item->extra . '</td>
                      <td>R$ ' . number_format($item->valor,"2",",",".") . '</td>
                  
                    
                      <td style="text-align: center;">
                        
                      
                      <button type="submit" class="btn btn-success editbtn" > <i class="fas fa-paint-brush"></i> </button>
                      &nbsp;

                       <a href="servicos-delete.php?id=' . $item->id . '">
                       <button type="button" class="btn btn-danger"> <i class="fas fa-trash"></i></button>
                       </a>


                      </td>
                      </tr>

                      ';
}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="5" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
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

                           <label>Buscar por Serviços</label>
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
                           <td colspan="5">
                              <button type="submit" class="btn btn-info" data-toggle="modal" data-target="#modal-default"> <i class="fas fa-plus"></i> &nbsp; Nova</button>
                              <button type="submit" class="btn btn-default float-right" data-toggle="modal" data-target="#modal-data"> <i class="fas fa-print"></i> &nbsp; IMPRIMIR RELATÓRIOS</button>
                           </td>
                        </tr>
                        <tr>
                           <th style="text-align: left; width:200px"> DATA </th>
                           <th style="text-align: left; width:200px"> MECÂNICOS </th>
                           <th style="text-align: left; width:200px"> SERVIÇOS EXTRAS </th>
                           <th style="text-align: left; width:200px"> VALOR </th>
                           <th style="text-align: center; width:200px"> AÇÃO </th>
                        </tr>
                     </thead>
                     <tbody>
                        <?= $resultados ?>
                     </tbody>
                     <tr>
                           <td colspan="3" style="text-align:right;"> TOTAL GERAL </td>
                           <td colspan="2"> <span style="font-size: 26px;"> R$ <?= number_format($subtotal,"2",",",".") ?></span> </td>
                           
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
   <div class="modal-dialog">
      <div class="modal-content bg-light">
         <form action="./servicos-insert.php" method="post">

            <div class="modal-header">
               <h4 class="modal-title">Novo
               </h4>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
             
               <div class="form-group">
                  <label>Mecanicos</label>
                  <select class="form-control select2bs4" style="width: 100%;" name="mecanicos_id" required>

                     <option value=""> Selecione um mecânico </option>
                     <?php

                     foreach ($mecanicos as $item) {
                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                     }
                     ?>

                  </select>
               </div>

               <div class="form-group">
                  <label>Serviços</label>
                  <select class="form-control select" style="width: 100%;" name="extra_id" required>

                     <option value=""> Selecione um serviços </option>
                     <?php

                     foreach ($extras as $item) {
                        echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                     }
                     ?>

                  </select>
               </div>
               <div class="form-group">
                  <label>Valor</label>
                  <input style="text-transform: uppercase;" class="form-control" name="valor" id="dinheiro88">
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
   <div class="modal-dialog">
      <form action="./servicos-edit.php" method="get">
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
             <div class="form-group">
                <label>Mecanicos</label>
                <select class="form-control select2bs4" style="width: 100%;" name="mecanicos_id" id="mecanicos_id" required>

                   <?php

                   foreach ($mecanicos as $item) {
                      echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                   }
                   ?>

                </select>
             </div>

             <div class="form-group">
                <label>Serviços</label>
                <select class="form-control select" style="width: 100%;" name="extra_id" id="extra_id" required>

                
                   <?php

                   foreach ($extras as $item) {
                      echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                   }
                   ?>

                </select>
             </div>
             <div class="form-group">
                <label>Valor</label>
                <input style="text-transform: uppercase;" class="form-control" name="valor" id="valor">
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
            <form action="./servicos-gerar.php" method="GET" enctype="multipart/form-data">

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

                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataInicio">
                        </div>


                        <div class="col-lg-4 col-4">
                           <input class="form-control" type="date" value="<?php echo date('Y-m-d') ?>" name="dataFim">
                        </div>


                        <div class="col-lg-4 col-4">

                           <select class="form-control select" name="mecanicos_id">
                              <option value="">Mecânico </option>
                              <?php

                              foreach ($mecanicos as $item) {
                                 echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                              }
                              ?>

                           </select>

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

 