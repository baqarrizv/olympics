<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Payment_terms extends CI_Model
{

    public function __construct()
    {
        parent::__construct();

    }

    public function getAll()
    {
        $q = $this->db->get('fin_payment_terms');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }   


}
