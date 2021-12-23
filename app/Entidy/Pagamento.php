<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Pagamento
{


    public $id;
    public $data;
    public $valor;
    public $saldo;
    public $status;
    public $comentario;
    public $caixa_id;

    public function cadastar()
    {


        $obdataBase = new Database('pagamento');

        $this->id = $obdataBase->insert([

            'data'           => $this->data,
            'valor'          => $this->valor,
            'saldo'          => $this->saldo,
            'status'         => $this->status,
            'comentario'     => $this->comentario,
            'caixa_id'       => $this->caixa_id

        ]);

        return true;
    }



    public function atualizar()
    {
        return (new Database('pagamento'))->update('id = ' . $this->id, [

            'data'           => $this->data,
            'valor'          => $this->valor,
            'saldo'          => $this->saldo,
            'status'         => $this->status,
            'comentario'     => $this->comentario,
            'caixa_id'       => $this->caixa_id
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('pagamento'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('pagamento'))->select('COUNT(*) as qtd', 'pagamento', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('pagamento'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

    public static function getCaixaId($fields, $table, $where, $order, $limit)
    {
        return (new Database('pagamento'))->select($fields, $table, 'caixa_id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


  

    public function excluir()
    {
        return (new Database('pagamento'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('pagamento'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
