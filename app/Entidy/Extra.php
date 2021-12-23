<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Extra
{


    public $id;
    public $nome;

    public function cadastar()
    {


        $obdataBase = new Database('extra');

        $this->id = $obdataBase->insert([

            'nome'              => $this->nome

        ]);

        return true;
    }



    public function atualizar()
    {
        return (new Database('extra'))->update('id = ' . $this->id, [

            'nome'              => $this->nome
        ]);
    }


    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('extra'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('extra'))->select('COUNT(*) as qtd', 'extra', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('extra'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }

  

    public function excluir()
    {
        return (new Database('extra'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('extra'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
