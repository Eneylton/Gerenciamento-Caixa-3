<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Maobra  
{

    public $id;
    public $cartao;
    public $dinheiro;
    public $debito;
    public $pix;
    public $transferencia;
    public $veiculo;
    public $placa;
    public $descricao;
    public $status;
    public $catdespesas_id;
    public $tipo;
    public $mecanicos_id;
    public $caixa_id;

    public function cadastar()
    {


        $obdataBase = new Database('maobra');

        $this->id = $obdataBase->insert([

            'cartao'                   => $this->cartao,
            'dinheiro'                 => $this->dinheiro,
            'debito'                   => $this->debito,
            'pix'                      => $this->pix,
            'transferencia'            => $this->transferencia,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'catdespesas_id'                  => $this->catdespesas_id,
            'tipo'                     => $this->tipo,
            'mecanicos_id'             => $this->mecanicos_id,
            'caixa_id'                 => $this->caixa_id
            

        ]);

        return true;
    }


    public function atualizar()
    {
        return (new Database('maobra'))->update('id = ' . $this->id, [
            
            'cartao'                   => $this->cartao,
            'dinheiro'                 => $this->dinheiro,
            'debito'                   => $this->debito,
            'pix'                      => $this->pix,
            'transferencia'            => $this->transferencia,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'catdespesas_id'                  => $this->catdespesas_id,
            'tipo'                     => $this->tipo,
            'mecanicos_id'             => $this->mecanicos_id,
            'caixa_id'                 => $this->caixa_id
        ]);
    }

    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('maobra'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }

    public static function getListOne($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('maobra'))->select($fields, $table, $where, $order, $limit)
        ->fetchObject(self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('maobra'))->select('COUNT(*) as qtd', 'maobra', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('maobra'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('maobra'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('maobra'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
