<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Db_model extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
    }

    public function getLatestSales($id = null)
    {
        $this->db->select("fin_sales_orders.*, fin_debtors_master.name as deb_name, sma_fin_cust_branch.branch_code as branch");
        $this->db->join('fin_debtors_master', 'fin_debtors_master.debtor_no = fin_sales_orders.debtor_no', 'left');
        $this->db->join('sma_fin_cust_branch', 'sma_fin_cust_branch.debtor_no = fin_debtors_master.debtor_no', 'left');
        $this->db->order_by('fin_sales_orders.order_no', 'desc');

        if ($id != null)
        {
            $this->db->where('fin_sales_orders.order_no', $id);
        }

        $q = $this->db->get("fin_sales_orders");
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    function get_tax_group_rates($group_id=null, $tax_shipping=false)
    {
        // $sql = 
        // "SELECT t.id as tax_type_id,"
        //     .($SysPrefs->suppress_tax_rates() == 1 ? "t.name as tax_type_name,"
        //         : "CONCAT(t.name, ' (', t.rate, '%)') as tax_type_name,")
        //     ."t.sales_gl_code,
        //       t.purchasing_gl_code,
        //       IF(g.tax_type_id, t.rate, NULL) as rate,
        //       g.tax_shipping
        //     FROM ".TB_PREF."tax_types t 
        //       LEFT JOIN ".TB_PREF."tax_group_items g ON t.id=g.tax_type_id
        // AND g.tax_group_id=". ($group_id ? db_escape($group_id) : "(SELECT MIN(id) FROM ".TB_PREF."tax_groups)")          
        // . " WHERE !t.inactive";
        // if ($tax_shipping)
        //     $sql .= " AND g.tax_shipping=1";

        // return db_query($sql, "cannot get tax types as array");
    }

    public function getCurrStock($location, $product)
    {
        
        $this->db->select("SUM(qty) as qty");
        $this->db->where('loc_code', $location);
        $this->db->where('stock_id', $product);
        return $this->db->get('fin_stock_moves')->row_array();
        

    }

    public function write_customer_trans($trans_type, $trans_no, $debtor_no, $BranchNo,
    $date_, $reference, $Total, $discount=0, $Tax=0, $Freight=0, $FreightTax=0,
    $sales_type=0, $order_no=0, $ship_via=0, $due_date="",
    $AllocAmt=0, $rate=0, $dimension_id=0, $dimension2_id=0, $payment_terms=null, $tax_included=0, $prep_amount=0)
    {
        $new = $trans_no==0;
        $curr = get_customer_currency($debtor_no);
        if ($rate == 0)

            $rate = get_exchange_rate_from_home_currency($curr, $date_);

        $SQLDate = date2sql($date_);
        if ($due_date == "")
            $SQLDueDate = "0000-00-00";
        else
            $SQLDueDate = date2sql($due_date);
        
        if ($trans_type == ST_BANKPAYMENT)
            $Total = -$Total;

        if ($new || !exists_customer_trans($trans_type, $trans_no))
        {
            if ($new)
            $trans_no = get_next_trans_no($trans_type);

        $sql = "INSERT INTO ".TB_PREF."debtor_trans (
            trans_no, type,
            debtor_no, branch_code,
            tran_date, due_date,
            reference, tpe,
            order_, ov_amount, ov_discount,
            ov_gst, ov_freight, ov_freight_tax,
            rate, ship_via, alloc,
            dimension_id, dimension2_id, payment_terms, tax_included, prep_amount
            ) VALUES (".db_escape($trans_no).", ".db_escape($trans_type).",
            ".db_escape($debtor_no).", ".db_escape($BranchNo).",
            '$SQLDate', '$SQLDueDate', ".db_escape($reference).",
            ".db_escape($sales_type).", ".db_escape($order_no).", $Total, ".db_escape($discount).", $Tax,
            ".db_escape($Freight).",
            $FreightTax, $rate, ".db_escape($ship_via).", $AllocAmt,
            ".db_escape($dimension_id).", ".db_escape($dimension2_id).", "
            .db_escape($payment_terms, true).", "
            .db_escape($tax_included).", ".db_escape($prep_amount).")";
        } else {    // may be optional argument should stay unchanged ?
        $sql = "UPDATE ".TB_PREF."debtor_trans SET
            debtor_no=".db_escape($debtor_no)." , branch_code=".db_escape($BranchNo).",
            tran_date='$SQLDate', due_date='$SQLDueDate',
            reference=".db_escape($reference).", tpe=".db_escape($sales_type).", order_=".db_escape($order_no).",
            ov_amount=$Total, ov_discount=".db_escape($discount).", ov_gst=$Tax,
            ov_freight=".db_escape($Freight).", ov_freight_tax=$FreightTax, rate=$rate,
            ship_via=".db_escape($ship_via).", alloc=$AllocAmt,
            dimension_id=".db_escape($dimension_id).", dimension2_id=".db_escape($dimension2_id).",
            payment_terms=".db_escape($payment_terms, true).",
            tax_included=".db_escape($tax_included).",
            prep_amount =".db_escape($prep_amount)."
            WHERE trans_no=".db_escape($trans_no)." AND type=".db_escape($trans_type);
        }
        db_query($sql, "The debtor transaction record could not be inserted");

        if ($trans_type != ST_JOURNAL) // skip for journal entries
            add_audit_trail($trans_type, $trans_no, $date_, $new ? '': _("Updated."));

        return $trans_no;
    }

    function get_customer($customer_id)
    {
        $sql = "SELECT * FROM sma_fin_debtors_master WHERE debtor_no=".$customer_id;

        $result = $this->db->query($sql);

        return $result;
    }

    function getAllCities()
    {
        $q = $this->db->get("city");
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    function getWareHouseByCity($id)
    {
        $q = $this->db->get_where("warehouses", array('city_id' => $id));
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    function deliver_sale($this_delivery, $order_no, $stock_id)
    {

            // $sql = "update sma_fin_sales_order_details set qty_sent = qty_sent + ".$this_delivery." where order_no = ".$order_no." and stk_code = ".$stock_id;

            // return $this->db->query($sql);   
    }

    public function getPurchaseOrders($id = null)
    {
        // $this->db->select('porder.order_no, porder.reference,  supplier.supp_name,  location.location_name, porder.requisition_no,  porder.ord_date,  supplier.curr_code, porder.into_stock_location, Sum(line.unit_price*line.quantity_ordered) AS OrderValue, chk.isopen');
        // $this->db->join('(SELECT order_no, SUM(quantity_ordered-quantity_received + quantity_ordered-qty_invoiced) isopen FROM sma_fin_purch_order_details GROUP BY order_no) chk', 'chk.order_no=porder.order_no', 'left');
        // $this->db->join('purch_order_details as line', )
        // $this->db->get('sma_fin_purch_orders as porder');

        $sql = 'SELECT 
        porder.order_no,
        porder.comments,
        porder.delivery_address, 
        porder.reference,
        porder.supplier_id, 
        supplier.supp_name, 
        location.location_name,
        porder.requisition_no, 
        porder.ord_date, 
        supplier.curr_code, 
        line.unit_price,
        Sum(line.unit_price*line.quantity_ordered) AS OrderValue,
        Sum(line.quantity_ordered) AS OrderQty,
        porder.into_stock_location,
        chk.isopen
        FROM sma_fin_purch_orders as porder
                LEFT JOIN (
                    SELECT order_no, SUM(quantity_ordered-quantity_received + quantity_ordered-qty_invoiced) isopen
                    FROM sma_fin_purch_order_details
                    GROUP BY order_no
                ) chk ON chk.order_no=porder.order_no,
                sma_fin_purch_order_details as line, 
                sma_fin_suppliers as supplier, 
                sma_fin_locations as location
        WHERE porder.order_no = line.order_no
        AND porder.supplier_id = supplier.supplier_id
        AND location.loc_code = porder.into_stock_location';
        if($id != null)
        {
            $sql .= ' AND porder.order_no = "'.$id.'"';
        }
        $sql .= ' GROUP BY porder.order_no';

        return $this->db->query($sql)->result_array();


    }

    public function get_exchange_rate($code)
    {
        $this->db->select('rate_sell');
        $this->db->where('curr_code', $code);
        $this->db->order_by('id', 'desc');
        $this->db->limit(1);
        return $this->db->get('sma_fin_exchange_rates')->row_array();
    }

    public function getPurchaseDetails($id)
    {
        $sql = "SELECT poline.*, units
        FROM sma_fin_purch_order_details poline
            LEFT JOIN sma_fin_stock_master item  ON poline.item_code=item.stock_id
        WHERE order_no = ".$id." ORDER BY po_detail_item";

        return $this->db->query($sql)->result_array();
    }

    public function getLastestQuotes()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("quotes", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }



    public function getLatestPurchases()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("purchases", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestTransfers()
    {
        if ($this->Settings->restrict_user && !$this->Owner && !$this->Admin) {
            $this->db->where('created_by', $this->session->userdata('user_id'));
        }
        $this->db->order_by('id', 'desc');
        $q = $this->db->get("transfers", 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestCustomers()
    {
        $this->db->order_by('id', 'desc');
        $q = $this->db->get_where("companies", array('group_name' => 'customer'), 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getLatestSuppliers()
    {
        $this->db->order_by('id', 'desc');
        $q = $this->db->get_where("companies", array('group_name' => 'supplier'), 5);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
    }

    public function getChartData()
    {
        $myQuery = "SELECT S.month,
        COALESCE(S.sales, 0) as sales,
        COALESCE( P.purchases, 0 ) as purchases,
        COALESCE(S.tax1, 0) as tax1,
        COALESCE(S.tax2, 0) as tax2,
        COALESCE( P.ptax, 0 ) as ptax
        FROM (  SELECT  date_format(date, '%Y-%m') Month,
                SUM(total) Sales,
                SUM(product_tax) tax1,
                SUM(order_tax) tax2
                FROM " . $this->db->dbprefix('sales') . "
                WHERE date >= date_sub( now( ) , INTERVAL 12 MONTH )
                GROUP BY date_format(date, '%Y-%m')) S
            LEFT JOIN ( SELECT  date_format(date, '%Y-%m') Month,
                        SUM(product_tax) ptax,
                        SUM(order_tax) otax,
                        SUM(total) purchases
                        FROM " . $this->db->dbprefix('purchases') . "
                        GROUP BY date_format(date, '%Y-%m')) P
            ON S.Month = P.Month
            GROUP BY S.Month
            ORDER BY S.Month";
        $q = $this->db->query($myQuery);
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

    public function getStockValue()
    {
        $q = $this->db->query("SELECT SUM(qty*price) as stock_by_price, SUM(qty*cost) as stock_by_cost
        FROM (
            Select sum(COALESCE(" . $this->db->dbprefix('warehouses_products') . ".quantity, 0)) as qty, price, cost
            FROM " . $this->db->dbprefix('products') . "
            JOIN " . $this->db->dbprefix('warehouses_products') . " ON " . $this->db->dbprefix('warehouses_products') . ".product_id=" . $this->db->dbprefix('products') . ".id
            GROUP BY " . $this->db->dbprefix('warehouses_products') . ".id ) a");
        if ($q->num_rows() > 0) {
            return $q->row();
        }
        return FALSE;
    }

    public function getBestSeller($start_date = NULL, $end_date = NULL)
    {
        if (!$start_date) {
            $start_date = date('Y-m-d', strtotime('first day of this month')) . ' 00:00:00';
        }
        if (!$end_date) {
            $end_date = date('Y-m-d', strtotime('last day of this month')) . ' 23:59:59';
        }
        $sp = "( SELECT si.product_id, SUM( si.quantity ) soldQty, s.date as sdate from " . $this->db->dbprefix('sales') . " s JOIN " . $this->db->dbprefix('sale_items') . " si on s.id = si.sale_id where s.date >= '{$start_date}' and s.date < '{$end_date}' group by si.product_id ) PSales";
        $this->db
            ->select("CONCAT(" . $this->db->dbprefix('products') . ".name, ' (', " . $this->db->dbprefix('products') . ".code, ')') as name, COALESCE( PSales.soldQty, 0 ) as SoldQty", FALSE)
            ->from('products', FALSE)
            ->join($sp, 'products.id = PSales.product_id', 'left')
            ->order_by('PSales.soldQty desc')
            ->limit(10);
        $q = $this->db->get();
        if ($q->num_rows() > 0) {
            foreach (($q->result()) as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return FALSE;
    }

}
