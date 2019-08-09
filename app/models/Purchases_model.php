<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Purchases_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getProductNames($term, $limit = 5)
    {
        $this->db->where("type = 'standard' AND (name LIKE '%" . $term . "%' OR code LIKE '%" . $term . "%' OR  concat(name, ' (', code, ')') LIKE '%" . $term . "%')");
        $this->db->limit($limit);
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function grn($data, $line_items, $delivery, $amount, $supplier_id, $after_waste, $mton, $temp, $density, $warehouse, $date, $location)
    {
        //return $date;
        
        //$this->db->trans_begin();
        //try {

        $this->db->trans_start();
        // $this->db->trans_strict(FALSE);
        $total = 0;
        $grn = $this->db->insert('fin_grn_batch', $data);
        $grn_id = $this->db->insert_id();
        for ($i = 0; $i < count($line_items); $i++) {
            
            $dlvry = str_replace(",", "", $delivery[$i]);
            $amnt = str_replace(",", "", $amount[$i]);

            $total_amount = $dlvry * $amnt;

            $this->db->select("mb_flag, inventory_account, cogs_account, adjustment_account, sales_account, wip_account, dimension_id, dimension2_id, material_cost");
            
            $stock_gl_code = $this->db->get_where('fin_stock_master', array('stock_id' => $line_items[$i]['item_code']))->row_array();
            
            $gl_trans = array(
                    'type' => 25,
                    'type_no' => $grn_id,
                    'tran_date' => date('Y-m-d'),
                    'account' => $stock_gl_code["inventory_account"],
                    'dimension_id' => $stock_gl_code['dimension_id'],
                    'dimension2_id' => $stock_gl_code['dimension2_id'],
                    'memo_' => $line_items[$i]['item_code'],
                    'amount' => $total_amount

            );
            $this->db->insert('fin_gl_trans', $gl_trans);
            $t_ = str_replace(",", "", $total_amount);
            $total += $t_;
           
            
           
            $up = array(
                    'supplier_id' => $supplier_id,
                    'stock_id' => $line_items[$i]['item_code'],
                    'price' => $line_items[$i]['unit_price'],
                    'conversion_factor' => 1,
                    'supplier_description' => $line_items[$i]['description']
            );

            $purchase_data = $this->get_purchase_data($up['supplier_id'], $up['stock_id']);
            if ($purchase_data === false)
            {
                $sql_purchase = $this->db->insert('fin_purch_data', $up);
               
            }

            
            $this->db->update('fin_purch_data', 
                array(
                    'price' => $up['price'],
                    'supplier_description' => $up['supplier_description'],

                ), 
                array('stock_id' => $up['stock_id'], 'supplier_id' => $up['supplier_id'])
            );

            $this->db->set('quantity_received', 'quantity_received+'.$delivery[$i], FALSE);
            $this->db->set('std_cost_unit', $line_items[$i]['std_cost_unit']);
            $this->db->set('quantity_ordered', $line_items[$i]['quantity_ordered']);
            $this->db->set('act_price', $line_items[$i]['act_price']);

            $this->db->where('po_detail_item', $line_items[$i]['po_detail_item']);
            $this->db->update('fin_purch_order_details');

          

            $grn_item = $this->add_grn_detail_item($grn_id, $line_items[$i]['po_detail_item'],
                $line_items[$i]['item_code'], $line_items[$i]['description'], $delivery[$i], $line_items[$i]['act_price'],$line_items[$i]['quantity_ordered']);

            $map_cal = $after_waste[$i] * $amount[$i];
            $map_nat = round($map_cal/$dlvry);
            $map_f = round($map_cal/$after_waste[$i]);

            $inv_value = $map_f * $after_waste[$i];
            $trans_value = $map_nat * $dlvry;

            $this->db->insert("fin_stock_moves", array(
                'stock_id' => $line_items[$i]['item_code'],
                'trans_no' => $grn_id,
                'type' => 25,
                'loc_code' => $warehouse,
                'tran_date' => $date,
                'qty' => $dlvry,
                'standard_cost' => $line_items[$i]['std_cost_unit'],
                'price' => $amount[$i],
                'f_qty' => $after_waste[$i],
                'm_ton' => $mton[$i],
                'density' => $density[$i],
                'temp' => $temp[$i],
                'map' => $map_nat,
                'f_map' => $map_f,
                'mton_map' => 0 

            ));

            $stock_move_id = $this->db->insert_id();

            $log = array(
                    'product_id' => $line_items[$i]['item_code'],
                    'supplier_id' => $supplier_id,
                    'stock_moves_id' => $stock_move_id,
                    'trans_type' => 'Purchase',
                    'nat_qty' => $dlvry,
                    'f_qty' => $after_waste[$i],
                    'f_value' => 85,
                    'm_ton_qty' => $mton[$i],
                    'temp' => $temp[$i],
                    'density' => $density[$i],
                    'map' => $line_items[$i]['unit_price'],
                    'inv_value' =>  $inv_value,
                    'trans_value' => $trans_value,

             );

           $l = $this->db->insert('transaction_logs', $log);

           // $st = $this->add_update_stock($line_items[$i]['item_code'], $warehouse, $after_waste[$i],  $after_waste[$i] * $line_items[$i]['unit_price']);


           }

           $dt = array(
                    'type' => 25,
                    'type_no' => $grn_id,
                    'tran_date' => date('Y-m-d'),
                    'account' => 1550,
                    'dimension_id' => 0,
                    'dimension2_id' => 0,
                    'amount' => -$total,

            );
            
            $this->db->insert('fin_gl_trans', $dt);
            //$total += $dt['amount'];

            //$i = $this->add_audit_trail(25, $grn_id, $date);
            $trans_type = 25;

            $this->db->insert("fin_audit_trail", array(
                'type' => $trans_type,
                'trans_no' => $grn_id,
                'user' => 1,
                'gl_date' => $date,
                'description' => 'NA'

            ));
           
            // all audit records beside just inserted one should have gl_seq set to NULL
            // to avoid need for subqueries (not existing in MySQL 3) all over the code
            $ins_id = $this->db->insert_id();

            // $this->db->set('audit.gl_seq','IF(audit.id='.$ins_id.', 0, NULL)');
            // $this->db->set('audit.fiscal_year', 'year.id');
            // $this->db->set('audit.gl_date',$date);

            // $this->db->where('type',$trans_type);
            // $this->db->where('trans_no',$grn_id);
            // $this->db->update("fin_audit_trail audit LEFT JOIN fin_fiscal_year year ON year.begin <= '".$date."' AND year.end >= '".$date."'");


            
            // $sql = "UPDATE sma_fin_audit_trail audit LEFT JOIN sma_fin_fiscal_year year ON year.begin<= '".$date."' AND year.end>= '".$date."'
            //     SET audit.gl_seq = IF(audit.id=".$ins_id.", 0, NULL),"
            //     ."audit.fiscal_year=year.id, audit.gl_date = '".$date."'"
            //     . " WHERE type=".$trans_type." AND trans_no="
            //     . $grn_id;
            
            //$this->db->query($sql);
            
            //$this->db->trans_commit();
            //return TRUE;
           
            
        // } catch (Exception $e) {
        //     $this->db->trans_rollback();
        //     return $e;
            
        // }
        


        $this->db->trans_complete();
        if ($this->db->trans_status() === TRUE)
        {
            return TRUE;
        }
        return $this->db->error();

    }

    public function getAllProducts()
    {
        $q = $this->db->get('products');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function add_grn_batch($data)
    {
        $grn = $this->db->insert('sma_fin_grn_batch', $data);
        $insert_id = $this->db->insert_id();

        return  $insert_id;
    }

    public function get_stock_gl_code($stock_id)
    {

        $this->db->select("mb_flag, inventory_account, cogs_account,
        adjustment_account, sales_account, wip_account, dimension_id, dimension2_id, material_cost");
        
        $get = $this->db->get_where('fin_stock_master', array('stock_id' => $stock_id))->row_array();

         
        return $get;
    }

    public function add_gl_trans_supplier($data)
    {
        $this->db->insert('sma_fin_gl_trans', $data);
        return $data['amount'];
    } 

    function add_gl_trans($data)
    {
        $this->db->insert('sma_fin_gl_trans', $data);
        return $data['amount'];
    }

    function add_audit_trail($trans_type, $trans_no, $trans_date, $descr='')
    {
        
        $sql = "INSERT INTO sma_fin_audit_trail(type, trans_no, user, gl_date, description)
                VALUES(".$trans_type.", ".$trans_no.", 1,".$trans_date.", '')";

        $this->db->query($sql);
        // all audit records beside just inserted one should have gl_seq set to NULL
        // to avoid need for subqueries (not existing in MySQL 3) all over the code
        $ins_id = $this->db->insert_id();

        $sql = "UPDATE sma_fin_audit_trail audit LEFT JOIN sma_fin_fiscal_year year ON year.begin<= '".$trans_date."' AND year.end>= '".$trans_date."'
            SET audit.gl_seq = IF(audit.id=".$ins_id.", 0, NULL),"
            ."audit.fiscal_year=year.id, audit.gl_date = '".$trans_date."'"
            . " WHERE type=".$trans_type." AND trans_no="
            . $trans_no;
        
        return $this->db->query($sql);
    }

    public function saveLogs($data)
    {
        return $this->db->insert('transaction_logs', $data);
    }

    public function add_update_stock($product_id, $warehouse_id, $qty, $avg_cost)
    {

        $exist = $this->getWareHouseProduct($product_id, $warehouse_id);
        if ($exist == false) {
        
            $sql = "insert into sma_warehouses_products(product_id, warehouse_id, quantity, avg_cost) values(".$product_id.", ".$warehouse_id.", ".$qty.", ".$avg_cost.")";

            
            return $this->db->query($sql);
        }

        $sql = "update sma_warehouses_products set quantity = quantity + ".$qty." where warehouse_id = ".$warehouse_id." and product_id = ".$product_id;

        return $sql;

    }

    public function getWareHouseProduct($product_id, $warehouse_id)
    {

        $q = $this->db->get_where('warehouses_products', array('product_id' => $product_id, 'warehouse_id' => $warehouse_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return false;
    }

    public function getProductByID($id)
    {
        $q = $this->db->get_where('products', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function get_purchase_data($supplier_id, $stock_id)
    {

        $q = $this->db->get_where('sma_fin_purch_data', array('supplier_id' => $supplier_id, 'stock_id' => $stock_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return false;
    }

    function add_or_update_purchase_data($purch_data)
    {
        $data = $this->get_purchase_data($purch_data['supplier_id'], $purch_data['stock_id']);
        if ($data === false)
        {
            $sql = $this->db->insert('sma_fin_purch_data', $purch_data);
            return $sql;
        }

        $sql = "UPDATE sma_fin_purch_data SET price= ".$purch_data['price'].", supplier_description= '".$purch_data['supplier_description']."' WHERE stock_id=".$purch_data['stock_id']." AND supplier_id= ".$purch_data['supplier_id'];
        
        $s = $this->db->query($sql);
        return $s;
    }

    public function update_purchase_order_detail($quantity_received, $standard_unit_cost, $quantity, $price, $po_detail_item)
    {

        $sql = "UPDATE sma_fin_purch_order_details
            SET quantity_received = quantity_received + ".$quantity_received.",
            std_cost_unit=".$standard_unit_cost.",
            quantity_ordered=".$quantity.",
            act_price=".$price."
            WHERE po_detail_item = ".$po_detail_item;

        return $this->db->query($sql);

    }

    public function add_grn_detail_item($grn_batch_id, $po_detail_item, $item_code, $description, $quantity_received, $price, $quantity)
    {
        $this->db->insert("fin_grn_items", array(
            'grn_batch_id' => $grn_batch_id,
            'po_detail_item' => $po_detail_item,
            'item_code' => $item_code,
            'description' => $description,
            'qty_recd' => $quantity_received

        ));
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }

    public function add_stock_move($type, $stock_id, $trans_no, $location,
    $date_, $quantity, $std_cost, $price)
    {
        
        $sql = "INSERT INTO sma_fin_stock_moves (stock_id, trans_no, type, loc_code,
            tran_date, qty, standard_cost, price) VALUES ("
            .$stock_id.", ".$trans_no.", "
            .$type.", '".$location."', ".$date_.", "
            .$quantity.", ".$std_cost."," .$price.")";

        $this->db->query($sql);
        $insert_id = $this->db->insert_id();

        return $insert_id;
    }

    public function getProductsByCode($code)
    {
        $this->db->select('*')->from('products')->like('code', $code, 'both');
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
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

    public function updateProductQuantity($product_id, $quantity, $warehouse_id, $product_cost)
    {
        if ($this->addQuantity($product_id, $warehouse_id, $quantity)) {
            $this->site->syncProductQty($product_id, $warehouse_id);
            return true;
        }
        return false;
    }

    public function calculateAndUpdateQuantity($item_id, $product_id, $quantity, $warehouse_id, $product_cost)
    {
        if ($this->updatePrice($product_id, $product_cost) && $this->calculateAndAddQuantity($item_id, $product_id, $warehouse_id, $quantity)) {
            return true;
        }
        return false;
    }

    public function calculateAndAddQuantity($item_id, $product_id, $warehouse_id, $quantity)
    {

        if ($this->getProductQuantity($product_id, $warehouse_id)) {
            $quantity_details = $this->getProductQuantity($product_id, $warehouse_id);
            $product_quantity = $quantity_details['quantity'];
            $item_details = $this->getItemByID($item_id);
            $item_quantity = $item_details->quantity;
            $after_quantity = $product_quantity - $item_quantity;
            $new_quantity = $after_quantity + $quantity;
            if ($this->updateQuantity($product_id, $warehouse_id, $new_quantity)) {
                return TRUE;
            }
        } else {

            if ($this->insertQuantity($product_id, $warehouse_id, $quantity)) {
                return TRUE;
            }
        }
        return FALSE;
    }

    public function addQuantity($product_id, $warehouse_id, $quantity)
    {

        if ($this->getProductQuantity($product_id, $warehouse_id)) {
            $warehouse_quantity = $this->getProductQuantity($product_id, $warehouse_id);
            $old_quantity = $warehouse_quantity['quantity'];
            $new_quantity = $old_quantity + $quantity;

            if ($this->updateQuantity($product_id, $warehouse_id, $new_quantity)) {
                return TRUE;
            }
        } else {

            if ($this->insertQuantity($product_id, $warehouse_id, $quantity)) {
                return TRUE;
            }
        }
        return FALSE;
    }

    public function insertQuantity($product_id, $warehouse_id, $quantity)
    {
        $productData = array(
            'product_id' => $product_id,
            'warehouse_id' => $warehouse_id,
            'quantity' => $quantity
        );
        if ($this->db->insert('warehouses_products', $productData)) {
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

    public function getProductQuantity($product_id, $warehouse)
    {
        $q = $this->db->get_where('warehouses_products', array('product_id' => $product_id, 'warehouse_id' => $warehouse), 1);

        if ($q->num_rows() > 0) {
            return $q->row_array(); //$q->row();
        }

        return FALSE;
    }

    public function updatePrice($id, $unit_cost)
    {

        if ($this->db->update('products', array('cost' => $unit_cost), array('id' => $id))) {
            return true;
        }

        return false;
    }

    public function getAllPurchases()
    {
        $q = $this->db->get('purchases');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }

            return $data;
        }
    }

    public function getAllPurchaseItems($purchase_id)
    {
        $this->db->select('purchase_items.*, tax_rates.code as tax_code, tax_rates.name as tax_name, tax_rates.rate as tax_rate, products.unit, products.details as details, product_variants.name as variant')
            ->join('products', 'products.id=purchase_items.product_id', 'left')
            ->join('product_variants', 'product_variants.id=purchase_items.option_id', 'left')
            ->join('tax_rates', 'tax_rates.id=purchase_items.tax_rate_id', 'left')
            ->group_by('purchase_items.id')
            ->order_by('id', 'asc');
        $q = $this->db->get_where('purchase_items', array('purchase_id' => $purchase_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getItemByID($id)
    {
        $q = $this->db->get_where('purchase_items', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getTaxRateByName($name)
    {
        $q = $this->db->get_where('tax_rates', array('name' => $name), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getPurchaseByID($id)
    {
        $q = $this->db->get_where('purchases', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getProductOptionByID($id)
    {
        $q = $this->db->get_where('product_variants', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getProductWarehouseOptionQty($option_id, $warehouse_id)
    {
        $q = $this->db->get_where('warehouses_products_variants', array('option_id' => $option_id, 'warehouse_id' => $warehouse_id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function addProductOptionQuantity($option_id, $warehouse_id, $quantity, $product_id)
    {
        if ($option = $this->getProductWarehouseOptionQty($option_id, $warehouse_id)) {
            $nq = $option->quantity + $quantity;
            if ($this->db->update('warehouses_products_variants', array('quantity' => $nq), array('option_id' => $option_id, 'warehouse_id' => $warehouse_id))) {
                return TRUE;
            }
        } else {
            if ($this->db->insert('warehouses_products_variants', array('option_id' => $option_id, 'product_id' => $product_id, 'warehouse_id' => $warehouse_id, 'quantity' => $quantity))) {
                return TRUE;
            }
        }
        return FALSE;
    }

    public function resetProductOptionQuantity($option_id, $warehouse_id, $quantity, $product_id)
    {
        if ($option = $this->getProductWarehouseOptionQty($option_id, $warehouse_id)) {
            $nq = $option->quantity - $quantity;
            if ($this->db->update('warehouses_products_variants', array('quantity' => $nq), array('option_id' => $option_id, 'warehouse_id' => $warehouse_id))) {
                return TRUE;
            }
        } else {
            $nq = 0 - $quantity;
            if ($this->db->insert('warehouses_products_variants', array('option_id' => $option_id, 'product_id' => $product_id, 'warehouse_id' => $warehouse_id, 'quantity' => $nq))) {
                return TRUE;
            }
        }
        return FALSE;
    }

    public function getOverSoldCosting($product_id)
    {
        $q = $this->db->get_where('costing', array('overselling' => 1));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function addPurchase($data, $items)
    {

        if ($this->db->insert('purchases', $data)) {
            $purchase_id = $this->db->insert_id();
            if ($this->site->getReference('po') == $data['reference_no']) {
                $this->site->updateReference('po');
            }
            foreach ($items as $item) {
                $item['purchase_id'] = $purchase_id;
                $this->db->insert('purchase_items', $item);
                $this->db->update('products', array('cost' => $item['real_unit_cost']), array('id' => $item['product_id']));
                if($item['option_id']) {
                    $this->db->update('product_variants', array('cost' => $item['real_unit_cost']), array('id' => $item['option_id'], 'product_id' => $item['product_id']));
                }
                if ($data['status'] == 'received' || $data['status'] == 'returned') {
                    $this->updateAVCO(array('product_id' => $item['product_id'], 'warehouse_id' => $item['warehouse_id'], 'quantity' => $item['quantity'], 'cost' => $item['real_unit_cost']));
                }
            }

            if ($data['status'] == 'returned') {
                $this->db->update('purchases', array('return_purchase_ref' => $data['return_purchase_ref'], 'surcharge' => $data['surcharge'],'return_purchase_total' => $data['grand_total'], 'return_id' => $purchase_id), array('id' => $data['purchase_id']));
            }

            if ($data['status'] == 'received' || $data['status'] == 'returned') {
                $this->site->syncQuantity(NULL, $purchase_id);
            }
            return true;
        }
        return false;
    }

    public function updatePurchase($id, $data, $items = array())
    {
        $opurchase = $this->getPurchaseByID($id);
        $oitems = $this->getAllPurchaseItems($id);
        if ($this->db->update('purchases', $data, array('id' => $id)) && $this->db->delete('purchase_items', array('purchase_id' => $id))) {
            $purchase_id = $id;
            foreach ($items as $item) {
                $item['purchase_id'] = $id;
                $this->db->insert('purchase_items', $item);
                if ($data['status'] == 'received' || $data['status'] == 'partial') {
                    $this->updateAVCO(array('product_id' => $item['product_id'], 'warehouse_id' => $item['warehouse_id'], 'quantity' => $item['quantity'], 'cost' => $item['real_unit_cost']));
                }
            }
            $this->site->syncQuantity(NULL, NULL, $oitems);
            if ($data['status'] == 'received' || $data['status'] == 'partial') {
                $this->site->syncQuantity(NULL, $id);
                foreach ($oitems as $oitem) {
                    $this->updateAVCO(array('product_id' => $oitem->product_id, 'warehouse_id' => $oitem->warehouse_id, 'quantity' => (0-$oitem->quantity), 'cost' => $oitem->real_unit_cost));
                }
            }
            $this->site->syncPurchasePayments($id);
            return true;
        }

        return false;
    }

    public function deletePurchase($id)
    {
        $purchase = $this->getPurchaseByID($id);
        $purchase_items = $this->site->getAllPurchaseItems($id);
        if ($this->db->delete('purchase_items', array('purchase_id' => $id)) && $this->db->delete('purchases', array('id' => $id))) {
            $this->db->delete('payments', array('purchase_id' => $id));
            if ($purchase->status == 'received' || $purchase->status == 'partial') {
                foreach ($purchase_items as $oitem) {
                    $this->updateAVCO(array('product_id' => $oitem->product_id, 'warehouse_id' => $oitem->warehouse_id, 'quantity' => (0-$oitem->quantity), 'cost' => $oitem->real_unit_cost));
                    $received = $oitem->quantity_received ? $oitem->quantity_received : $oitem->quantity;
                    if ($oitem->quantity_balance < $received) {
                        $clause = array('purchase_id' => NULL, 'transfer_id' => NULL, 'product_id' => $oitem->product_id, 'warehouse_id' => $oitem->warehouse_id, 'option_id' => $oitem->option_id);
                        if ($pi = $this->site->getPurchasedItem($clause)) {
                            $quantity_balance = $pi->quantity_balance + ($oitem->quantity_balance - $received);
                            $this->db->update('purchase_items', array('quantity_balance' => $quantity_balance), $clause);
                        } else {
                            $clause['quantity'] = 0;
                            $clause['item_tax'] = 0;
                            $clause['quantity_balance'] = ($oitem->quantity_balance - $received);
                            $this->db->insert('purchase_items', $clause);
                        }
                    }
                }
            }
            $this->site->syncQuantity(NULL, NULL, $purchase_items);
            return true;
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

    public function getPurchasePayments($purchase_id)
    {
        $this->db->order_by('id', 'asc');
        $q = $this->db->get_where('payments', array('purchase_id' => $purchase_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getPaymentByID($id)
    {
        $q = $this->db->get_where('payments', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }

        return FALSE;
    }

    public function getPaymentsForPurchase($purchase_id)
    {
        $this->db->select('payments.date, payments.paid_by, payments.amount, payments.reference_no, users.first_name, users.last_name, type')
            ->join('users', 'users.id=payments.created_by', 'left');
        $q = $this->db->get_where('payments', array('purchase_id' => $purchase_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function addPayment($data = array())
    {
        if ($this->db->insert('payments', $data)) {
            if ($this->site->getReference('pay') == $data['reference_no']) {
                $this->site->updateReference('pay');
            }
            $this->site->syncPurchasePayments($data['purchase_id']);
            return true;
        }
        return false;
    }

    public function updatePayment($id, $data = array())
    {
        if ($this->db->update('payments', $data, array('id' => $id))) {
            $this->site->syncPurchasePayments($data['purchase_id']);
            return true;
        }
        return false;
    }

    public function deletePayment($id)
    {
        $opay = $this->getPaymentByID($id);
        if ($this->db->delete('payments', array('id' => $id))) {
            $this->site->syncPurchasePayments($opay->purchase_id);
            return true;
        }
        return FALSE;
    }

    public function getProductOptions($product_id)
    {
        $q = $this->db->get_where('product_variants', array('product_id' => $product_id));
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

    public function getExpenseByID($id)
    {
        $q = $this->db->get_where('expenses', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function addExpense($data = array())
    {
        if ($this->db->insert('expenses', $data)) {
            if ($this->site->getReference('ex') == $data['reference']) {
                $this->site->updateReference('ex');
            }
            return true;
        }
        return false;
    }

    public function updateExpense($id, $data = array())
    {
        if ($this->db->update('expenses', $data, array('id' => $id))) {
            return true;
        }
        return false;
    }

    public function deleteExpense($id)
    {
        if ($this->db->delete('expenses', array('id' => $id))) {
            return true;
        }
        return FALSE;
    }

    public function getQuoteByID($id)
    {
        $q = $this->db->get_where('quotes', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getAllQuoteItems($quote_id)
    {
        $q = $this->db->get_where('quote_items', array('quote_id' => $quote_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getReturnByID($id)
    {
        $q = $this->db->get_where('return_purchases', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getAllReturnItems($return_id)
    {
        $this->db->select('return_purchase_items.*, products.details as details, product_variants.name as variant')
            ->join('products', 'products.id=return_purchase_items.product_id', 'left')
            ->join('product_variants', 'product_variants.id=return_purchase_items.option_id', 'left')
            ->group_by('return_purchase_items.id')
            ->order_by('id', 'asc');
        $q = $this->db->get_where('return_purchase_items', array('return_id' => $return_id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getPurcahseItemByID($id)
    {
        $q = $this->db->get_where('purchase_items', array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function returnPurchase($data = array(), $items = array())
    {

        $purchase_items = $this->site->getAllPurchaseItems($data['purchase_id']);

        if ($this->db->insert('return_purchases', $data)) {
            $return_id = $this->db->insert_id();
            if ($this->site->getReference('rep') == $data['reference_no']) {
                $this->site->updateReference('rep');
            }
            foreach ($items as $item) {
                $item['return_id'] = $return_id;
                $this->db->insert('return_purchase_items', $item);

                if ($purchase_item = $this->getPurcahseItemByID($item['purchase_item_id'])) {
                    if ($purchase_item->quantity == $item['quantity']) {
                        $this->db->delete('purchase_items', array('id' => $item['purchase_item_id']));
                    } else {
                        $nqty = $purchase_item->quantity - $item['quantity'];
                        $bqty = $purchase_item->quantity_balance - $item['quantity'];
                        $rqty = $purchase_item->quantity_received - $item['quantity'];
                        $tax = $purchase_item->unit_cost - $purchase_item->net_unit_cost;
                        $discount = $purchase_item->item_discount / $purchase_item->quantity;
                        $item_tax = $tax * $nqty;
                        $item_discount = $discount * $nqty;
                        $subtotal = $purchase_item->unit_cost * $nqty;
                        $this->db->update('purchase_items', array('quantity' => $nqty, 'quantity_balance' => $bqty, 'quantity_received' => $rqty, 'item_tax' => $item_tax, 'item_discount' => $item_discount, 'subtotal' => $subtotal), array('id' => $item['purchase_item_id']));
                    }

                }
            }
            $this->calculatePurchaseTotals($data['purchase_id'], $return_id, $data['surcharge']);
            $this->site->syncQuantity(NULL, NULL, $purchase_items);
            $this->site->syncQuantity(NULL, $data['purchase_id']);
            return true;
        }
        return false;
    }

    public function calculatePurchaseTotals($id, $return_id, $surcharge)
    {
        $purchase = $this->getPurchaseByID($id);
        $items = $this->getAllPurchaseItems($id);
        if (!empty($items)) {
            $total = 0;
            $product_tax = 0;
            $order_tax = 0;
            $product_discount = 0;
            $order_discount = 0;
            foreach ($items as $item) {
                $product_tax += $item->item_tax;
                $product_discount += $item->item_discount;
                $total += $item->net_unit_cost * $item->quantity;
            }
            if ($purchase->order_discount_id) {
                $percentage = '%';
                $order_discount_id = $purchase->order_discount_id;
                $opos = strpos($order_discount_id, $percentage);
                if ($opos !== false) {
                    $ods = explode("%", $order_discount_id);
                    $order_discount = (($total + $product_tax) * (Float)($ods[0])) / 100;
                } else {
                    $order_discount = $order_discount_id;
                }
            }
            if ($purchase->order_tax_id) {
                $order_tax_id = $purchase->order_tax_id;
                if ($order_tax_details = $this->site->getTaxRateByID($order_tax_id)) {
                    if ($order_tax_details->type == 2) {
                        $order_tax = $order_tax_details->rate;
                    }
                    if ($order_tax_details->type == 1) {
                        $order_tax = (($total + $product_tax - $order_discount) * $order_tax_details->rate) / 100;
                    }
                }
            }
            $total_discount = $order_discount + $product_discount;
            $total_tax = $product_tax + $order_tax;
            $grand_total = $total + $total_tax + $purchase->shipping - $order_discount + $surcharge;
            $data = array(
                'total' => $total,
                'product_discount' => $product_discount,
                'order_discount' => $order_discount,
                'total_discount' => $total_discount,
                'product_tax' => $product_tax,
                'order_tax' => $order_tax,
                'total_tax' => $total_tax,
                'grand_total' => $grand_total,
                'return_id' => $return_id,
                'surcharge' => $surcharge
            );

            if ($this->db->update('purchases', $data, array('id' => $id))) {
                return true;
            }
        } else {
            $this->db->delete('purchases', array('id' => $id));
        }
        return FALSE;
    }

    public function getExpenseCategories()
    {
        $q = $this->db->get('expense_categories');
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getExpenseCategoryByID($id)
    {
        $q = $this->db->get_where("expense_categories", array('id' => $id), 1);
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function updateAVCO($data)
    {
        $wp_details = $this->getWarehouseProductQuantity($data['warehouse_id'], $data['product_id']);
        $total_cost = (($wp_details->quantity * $wp_details->avg_cost) + ($data['quantity'] * $data['cost']));
        $total_quantity = $wp_details->quantity + $data['quantity'];
        if (!empty($total_quantity)) {
            $avg_cost = ($total_cost / $total_quantity);
            $this->db->update('warehouses_products', array('avg_cost' => $avg_cost), array('product_id' => $data['product_id'], 'warehouse_id' => $data['warehouse_id']));
        }
    }

}
