<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Comissao 
{

    public $id;
    public $veiculo;
    public $placa;
    public $descricao;
    public $status;
    public $catdespesas_id;
    public $tipo;
    public $mecanicos_id;
    public $caixa_id;
    public $valor;
    public $data;

    public function cadastar()
    {


        $obdataBase = new Database('comissao');

        $this->id = $obdataBase->insert([

            
            'data'                     => $this->data,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'catdespesas_id'           => $this->catdespesas_id,
            'tipo'                     => $this->tipo,
            'mecanicos_id'             => $this->mecanicos_id,
            'caixa_id'                 => $this->caixa_id,
            'valor'                    => $this->valor
            

        ]);

        return true;
    }


    public function atualizar()
    {
        return (new Database('comissao'))->update('id = ' . $this->id, [
            
                
            'data'                     => $this->data,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'catdespesas_id'           => $this->catdespesas_id,
            'tipo'                     => $this->tipo,
            'mecanicos_id'             => $this->mecanicos_id,
            'caixa_id'                 => $this->caixa_id,
            'valor'                    => $this->valor
            

        ]);
    }

    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('comissao'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }

    public static function getListOne($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('comissao'))->select($fields, $table, $where, $order, $limit)
        ->fetchObject(self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('comissao'))->select('COUNT(*) as qtd', 'comissao', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('comissao'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('comissao'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('comissao'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
