<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Mecanico
{


    public $id;
    public $nome;

    public function cadastar()
    {


        $obdataBase = new Database('mecanicos');

        $this->id = $obdataBase->insert([

            'nome'              => $this->nome

        ]);

        return true;
    }



    public function atualizar()
    {
        return (new Database('mecanicos'))->update('id = ' . $this->id, [

            'nome'              => $this->nome
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('mecanicos'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('mecanicos'))->select('COUNT(*) as qtd', 'mecanicos', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('mecanicos'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

  

    public function excluir()
    {
        return (new Database('mecanicos'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('mecanicos'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
