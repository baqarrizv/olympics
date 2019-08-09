<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Transfers_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }


    public function list_transfer()
    {

        $query = "SELECT sma_transfers.*, sma_transaction_logs.nat_qty, sma_transaction_logs.f_qty, sma_transaction_logs.m_ton_qty, sma_transaction_logs.temp, sma_fin_stock_master.description FROM sma_transfers LEFT JOIN sma_fin_stock_moves ON sma_fin_stock_moves.reference = sma_transfers.transfer_no LEFT JOIN sma_transaction_logs ON sma_transaction_logs.stock_moves_id = sma_fin_stock_moves.trans_id LEFT JOIN sma_fin_stock_master ON sma_fin_stock_master.stock_id = sma_fin_stock_moves.stock_id WHERE sma_transfers.status = 'pending'";
        $q = $this->db->query($query);

        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }

        return FALSE;
    }

    public function show_transfer($id)
    {
        $query = "SELECT sma_transfers.*, sma_transaction_logs.nat_qty, sma_transaction_logs.f_qty, sma_transaction_logs.m_ton_qty, sma_transaction_logs.temp, sma_transaction_logs.density, sma_fin_stock_master.description FROM sma_transfers LEFT JOIN sma_fin_stock_moves ON sma_fin_stock_moves.reference = sma_transfers.transfer_no LEFT JOIN sma_transaction_logs ON sma_transaction_logs.stock_moves_id = sma_fin_stock_moves.trans_id LEFT JOIN sma_fin_stock_master ON sma_fin_stock_master.stock_id = sma_fin_stock_moves.stock_id WHERE sma_transfers.status = 'pending' AND sma_transfers.id=".$id;
        
        $q = $this->db->query($query);

        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }

        return FALSE;
    }

    public function getProductNames($warehouse_id, $limit = 5)
    {
        $query = "SELECT DISTINCT(sma_fin_stock_master.stock_id), sma_fin_stock_master.description FROM `sma_fin_stock_master` left join sma_fin_stock_moves ON sma_fin_stock_moves.stock_id = sma_fin_stock_master.stock_id where sma_fin_stock_moves.loc_code = '".$warehouse_id."'";

        $q = $this->db->query($query);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getWHProduct($id)
    {
        $this->db->select('products.id, code, name, warehouses_products.quantity, cost, tax_rate')
            ->join('warehouses_products', 'warehouses_products.product_id=products.id', 'left')
            ->group_by('products.id');
        $q = $this->db->get_where('products', array('warehouses_products.product_id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function addTransfer($data)
    {
        return $this->db->insert('transfers', $data);
        
    }

    public function get_next_trans_no ($trans_type)
    {

        $sql1 = "SELECT MAX(trans_no) as last_no FROM sma_fin_stock_moves";
       
        $sql1 .= " WHERE type = ".$trans_type;

        // check also in voided transactions (some transactions like location transfer are removed completely)
        $sql2 = "SELECT MAX(id) as last_no FROM sma_fin_voided WHERE type = ".$trans_type;
        
        $sql = "SELECT max(last_no) last_no FROM (".$sql1." UNION ".$sql2.") a";

        $q = $this->db->query($sql);


        if ($q->num_rows() > 0) {
            
            $myrow = $q->row();
            return $myrow->last_no + 1;
            
        }
        return FALSE;
    }

    public function stock_movement($data)
    {
        $this->db->insert("fin_stock_moves", $data);
        return $this->db->insert_id();
    }

    public function add_stock_move($type, $stock_id, $trans_no, $location,
    $date, $reference, $quantity, $std_cost, $price=0)
    {
        
        $sql = "INSERT INTO sma_fin_stock_moves (stock_id, trans_no, type, loc_code,
            tran_date, reference, qty, standard_cost, price) VALUES ("
            .$stock_id.", ".$trans_no.", "
            .$type.", '".$location."', '$date', "
            .$reference.", "
            .$quantity.", ".$std_cost."," .$price.")";
       

        $this->db->query($sql);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }

    public function add_comments($type, $type_no, $date_, $memo_)
    {
        if ($memo_ != null && $memo_ != "")
        {
            $sql = "INSERT INTO sma_fin_comments (type, id, date_, memo_)
                VALUES (".$type.", ".$type_no.", ".$date_.",'".$memo_."')";


            return $this->db->query($sql);
        }
    }

    public function updateTransfer($id, $data = array(), $items = array())
    {
        $ostatus = $this->resetTransferActions($id);
        $status = $data['status'];
        if ($this->db->update('transfers', $data, array('id' => $id))) {
            $tbl = $ostatus == 'completed' ? 'purchase_items' : 'transfer_items';
            $this->db->delete($tbl, array('transfer_id' => $id));

            foreach ($items as $item) {
                $item['transfer_id'] = $id;
                if ($status == 'completed') {
                    $item['date'] = date('Y-m-d');
                    $item['warehouse_id'] = $data['to_warehouse_id'];
                    $item['status'] = 'received';
                    $this->db->insert('purchase_items', $item);
                } else {
                    $this->db->insert('transfer_items', $item);
                }

                $status = $data['status'];
                if ($status == 'sent' || $status == 'completed') {
                    $this->syncTransderdItem($item['product_id'], $data['from_warehouse_id'], $item['quantity'], $item['option_id']);
                }

            }

            return true;
        }

        return false;
    }

    public function getProductWarehouseOptionQty($option_id, $warehouse_id)
    {
        $q = $this->db->get_where('warehouses_products_variants', array('option_id' => $option_id, 'warehouse_id' => $warehouse_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getProductByCategoryID($id)
    {

        $q = $this->db->get_where('products', array('category_id' => $id), 1);
        if ($q->num_rows() > 0) {
            return true;
        }

        return FALSE;
    }

    public function getProductQuantity($product_id, $warehouse = DEFAULT_WAREHOUSE)
    {
        $q = $this->db->get_where('warehouses_products', array('product_id' => $product_id, 'warehouse_id' => $warehouse), 1);
        if ($q->num_rows() > 0) {
            return $q->row_array(); //$q->row();
        }
        return FALSE;
    }

    public function insertQuantity($product_id, $warehouse_id, $quantity)
    {
        if ($this->db->insert('warehouses_products', array('product_id' => $product_id, 'warehouse_id' => $warehouse_id, 'quantity' => $quantity))) {
            $this->site->syncProductQty($product_id, $warehouse_id);
            return true;
        }
        return false;
    }

    public function updateQuantity($product_id, $warehouse_id, $quantity)
    {
        if ($this->db->update('warehouses_products', array('quantity' => $quantity), array('product_id' => $product_id, 'warehouse_id' => $warehouse_id))) {
            $this->site->syncProductQty($product_id, $warehouse_id);
            return true;
        }
        return false;
    }

    public function getProductByCode($code)
    {

        $q = $this->db->get_where('products', array('code' => $code), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getProductByName($name)
    {

        $q = $this->db->get_where('products', array('name' => $name), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getTransferByID($id)
    {

        $q = $this->db->get_where('transfers', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getAllTransferItems($transfer_id)
    {
        $this->db->select('transfers.*, fin_stock_master.description as name, fin_stock_master.units')
                ->from('transfers')
                ->join('fin_stock_master', 'fin_stock_master.stock_id = transfers.product_id', 'left')
                ->where('id', $transfer_id);
        
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getWarehouseProduct($warehouse_id, $product_id, $variant_id)
    {
        if ($variant_id) {
            $data = $this->getProductWarehouseOptionQty($variant_id, $warehouse_id);
            return $data;
        } else {
            $data = $this->getWarehouseProductQuantity($warehouse_id, $product_id);
            return $data;
        }
        return FALSE;
    }

    public function getWarehouseProductQuantity($warehouse_id, $product_id)
    {
        $q = $this->db->get_where('warehouses_products', array('warehouse_id' => $warehouse_id, 'product_id' => $product_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function resetTransferActions($id)
    {
        $otransfer = $this->transfers_model->getTransferByID($id);
        $oitems = $this->transfers_model->getAllTransferItems($id, $otransfer->status);
        $ostatus = $otransfer->status;
        if ($ostatus == 'sent' ||$ostatus == 'completed') {
            // $this->db->update('purchase_items', array('warehouse_id' => $otransfer->from_warehouse_id, 'transfer_id' => NULL), array('transfer_id' => $otransfer->id));
            foreach ($oitems as $item) {
                $option_id = (isset($item->option_id) && ! empty($item->option_id)) ? $item->option_id : NULL;
                $clause = array('purchase_id' => NULL, 'transfer_id' => NULL, 'product_id' => $item->product_id, 'warehouse_id' => $otransfer->from_warehouse_id, 'option_id' => $option_id);
                $pi = $this->site->getPurchasedItem(array('id' => $item->id));
                if ($ppi = $this->site->getPurchasedItem($clause)) {
                    $quantity_balance = $ppi->quantity_balance + $item->quantity;
                    $this->db->update('purchase_items', array('quantity_balance' => $quantity_balance), $clause);
                } else {
                    $clause['quantity'] = $item->quantity;
                    $clause['item_tax'] = 0;
                    $clause['quantity_balance'] = $item->quantity;
                    $this->db->insert('purchase_items', $clause);
                }
            }
        }
        return $ostatus;
    }

    public function deleteTransfer($id)
    {
        $ostatus = $this->resetTransferActions($id);
        $oitems = $this->transfers_model->getAllTransferItems($id, $ostatus);
        $tbl = $ostatus == 'completed' ? 'purchase_items' : 'transfer_items';
        if ($this->db->delete('transfers', array('id' => $id)) && $this->db->delete($tbl, array('transfer_id' => $id))) {
            foreach ($oitems as $item) {
                $this->site->syncQuantity(NULL, NULL, NULL, $item->product_id);
            }
            return true;
        }
        return FALSE;
    }

    public function getProductOptions($product_id, $warehouse_id, $zero_check = TRUE)
    {
        $this->db->select('product_variants.id as id, product_variants.name as name, product_variants.cost as cost, product_variants.quantity as total_quantity, warehouses_products_variants.quantity as quantity')
            ->join('warehouses_products_variants', 'warehouses_products_variants.option_id=product_variants.id', 'left')
            ->where('product_variants.product_id', $product_id)
            ->where('warehouses_products_variants.warehouse_id', $warehouse_id)
            ->group_by('product_variants.id');
        if ($zero_check) {
            $this->db->where('warehouses_products_variants.quantity >', 0);
        }
        $q = $this->db->get('product_variants');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getProductComboItems($pid, $warehouse_id)
    {
        $this->db->select('products.id as id, combo_items.item_code as code, combo_items.quantity as qty, products.name as name, warehouses_products.quantity as quantity')
            ->join('products', 'products.code=combo_items.item_code', 'left')
            ->join('warehouses_products', 'warehouses_products.product_id=products.id', 'left')
            ->where('warehouses_products.warehouse_id', $warehouse_id)
            ->group_by('combo_items.id');
        $q = $this->db->get_where('combo_items', array('combo_items.product_id' => $pid));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
        return FALSE;
    }

    public function getProductVariantByName($name, $product_id)
    {
        $q = $this->db->get_where('product_variants', array('name' => $name, 'product_id' => $product_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }



    public function getPurchasedItems($product_id, $warehouse_id, $option_id = NULL) {
        $orderby = ($this->Settings->accounting_method == 1) ? 'asc' : 'desc';
        $this->db->select('id, quantity, quantity_balance, net_unit_cost, unit_cost, item_tax');
        $this->db->where('product_id', $product_id)->where('warehouse_id', $warehouse_id)->where('quantity_balance !=', 0);
        if ($option_id) {
            $this->db->where('option_id', $option_id);
        }
        $this->db->group_by('id');
        $this->db->order_by('date', $orderby);
        $this->db->order_by('purchase_id', $orderby);
        $q = $this->db->get('purchase_items');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function syncTransderdItem($product_id, $warehouse_id, $quantity, $option_id = NULL)
    {
        if ($pis = $this->getPurchasedItems($product_id, $warehouse_id, $option_id)) {
            $balance_qty = $quantity;
            foreach ($pis as $pi) {
                if ($balance_qty <= $quantity && $quantity > 0) {
                    if ($pi->quantity_balance >= $quantity) {
                        $balance_qty = $pi->quantity_balance - $quantity;
                        $this->db->update('purchase_items', array('quantity_balance' => $balance_qty), array('id' => $pi->id));
                        $quantity = 0;
                    } elseif ($quantity > 0) {
                        $quantity = $quantity - $pi->quantity_balance;
                        $balance_qty = $quantity;
                        $this->db->update('purchase_items', array('quantity_balance' => 0), array('id' => $pi->id));
                    }
                }
                if ($quantity == 0) { break; }
            }
        } else {
            $clause = array('purchase_id' => NULL, 'transfer_id' => NULL, 'product_id' => $product_id, 'warehouse_id' => $warehouse_id, 'option_id' => $option_id);
            if ($pi = $this->site->getPurchasedItem($clause)) {
                $quantity_balance = $pi->quantity_balance - $quantity;
                $this->db->update('purchase_items', array('quantity_balance' => $quantity_balance), $clause);
            } else {
                $clause['quantity'] = 0;
                $clause['item_tax'] = 0;
                $clause['quantity_balance'] = (0 - $quantity);
                $this->db->insert('purchase_items', $clause);
            }
        }
        $this->site->syncQuantity(NULL, NULL, NULL, $product_id);
    }

    public function getProductOptionByID($id)
    {
        $q = $this->db->get_where('product_variants', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

}
