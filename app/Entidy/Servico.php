<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Servico
{


    public $id;
    public $extra_id;
    public $mecanicos_id;
    public $valor;

    public function cadastar()
    {


        $obdataBase = new Database('servicos');

        $this->id = $obdataBase->insert([

            'id'                    => $this->id,
            'extra_id'              => $this->extra_id,
            'mecanicos_id'          => $this->mecanicos_id,
            'valor'                 => $this->valor

        ]);

        return true;
    }



    public function atualizar()
    {
        return (new Database('servicos'))->update('id = ' . $this->id, [

            'id'                    => $this->id,
            'extra_id'              => $this->extra_id,
            'mecanicos_id'          => $this->mecanicos_id,
            'valor'                 => $this->valor
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('servicos'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('servicos'))->select('COUNT(*) as qtd', 'servicos', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('servicos'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

  

    public function excluir()
    {
        return (new Database('servicos'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('servicos'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
