<style type="text/css" media="screen">
.select2-container{
    width: 100%;
}    
</style>
    <h2 class="text-center">Delivery Sale Order</h2>
   <?php $total = 0; foreach($order as $odr){ ?>
    <?php
        $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open("sales/deliver_sale_order", $attrib)
    ?>
            

            <div class="well well-sm">
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        <?= lang("ref"); ?>: <?= $odr->reference; ?><br>
                        <?= lang("date"); ?>: <?= $this->sma->hrld($odr->ord_date); ?><br>
                        <input type="hidden" name="branch_code" value="<?=$odr->branch?>">
                        <input type="hidden" name="reference" value="<?= $odr->reference; ?>">
                    </p>
                    </div>
                   
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="row" style="margin-bottom:15px;">
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Customer Name"); ?>:
                    <h2 style="margin-top:10px;"><?= $odr->deb_name; ?></h2>

                    
                    <div class="form-group">
                        <?= lang("date", "delivery_date"); ?>
                        <?php echo form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control input-tip datetime" id="delivery_date" name="delivery_date" required="required"'); ?>
                        <input type="hidden" name="debtor_no" value="<?=$odr->debtor_no?>">
                    </div>
                </div>
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Customer's Reference"); ?>:<br/>
                    <h2 style="margin-top:10px;"><?= $odr->customer_ref; ?></h2>
                    
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-sm">
                        <p class="bold"><?= lang("note"); ?>:</p>
                        <div><?= $odr->comments ?></div>
                    </div>
                </div>
            </div>
        <?php } ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped print-table order-table">

                    <thead>
                    <tr>
                        <th><?= lang("#"); ?></th>
                        <th><?= lang("item_code"); ?></th>
                        <th><?= lang("description"); ?></th>
                        <th><?= lang("unit"); ?></th>
                        <th><?= lang("Ordered (NAT)"); ?></th>
                        <th><?= lang("Delivered"); ?></th>
                        <th><?= lang("Out Standing"); ?></th>
                        <th><?= lang("This Delivery (NAT)"); ?></th>
                        <th><?= lang("Tanks"); ?></th>
                        <th><?= lang("Temp"); ?></th>
                        <th><?= lang("Density"); ?></th>
                        <th><?= lang("85F"); ?></th>
                    </tr>

                    </thead>

                    <tbody id="tbl_body">

                    <?php $r = 1;
                    $totalRec = 0;
                   
                    foreach ($details as $row):
                    ?>
                        <tr>
                            <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                            <td style="vertical-align:middle;width:80px;">
                                <?= $row->stk_code; ?>
                                <input type="hidden" name="order_no" value="<?= $row->order_no; ?>">
                            </td>
                            <td style="vertical-align:middle;">
                                <?= $row->description; ?>
                            </td>
                            <td style="width: 5 0px; text-align:center; vertical-align:middle;">
                                <?= $row->units ?></td>
                            <td style="text-align:right; width:100px;">
                                <?= $this->sma->formatQuantity($row->quantity); ?>
                            </td>
                            <td style="text-align:right;"><?= $this->sma->formatQuantity($row->qty_sent); ?></td>
                            <td style="text-align:right;"><?= $row->quantity - $row->qty_sent?></td>
                            
                            <td style="width: 110px;padding: 0;">
                                <input class="form-control" type="text" id="delivery_<?=$row->item_code;?>" name="this_delivery[]" value="" />
                                <input type="hidden" name="stock_id[]" value="<?=$row->stk_code?>">
                                
                            </td>
                            <td>
                                <?php
                                $wh[''] = '';
                                foreach ($warehouses as $warehouse) {
                                    $wh[$warehouse->loc_code] = $warehouse->location_name;
                                }
                                echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : $Settings->default_warehouse), 'id="powarehouse" class="whouse form-control input-tip select" data-placeholder="' . lang("select") . ' ' . lang("warehouse") . '" required="required" style="width:100%;" ');
                                ?>
                                
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <?php
                        $totalRec += $row->quantity_received;
                        $r++;
                    endforeach;
                    ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="9" style="padding: 0px;">
                                
                                <button type="button" class="btn btn-danger pull-right" id="addTank">Add New Tank</button>
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-12">
                <center>
                    <button type="submit" class="btn btn-primary">Process Delivery</button>
                </center>
            </div>

    <?= form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {

        $('.whouse').change(function(event) {
            alert($(this).val());
        });
        $('#addTank').click(function(event) {
            event.preventDefault();

            let row = "<tr>";
            row += "<td colspan='6'><i class='fa fa-bin'></i></td>";
            row += "<td><p class='pull-right'>200</p></td>";
            row += "<td style='padding:0px'> <input type='text' class='form-control'> </td>";
            row += "<td><select class='form-control'> <option></option> </select></td>";
            row += "<td></td>"
            row += "<td></td>"
            row += "<td></td>"
            row += "</tr>";

            $('#tbl_body').append(row).hide().fadeIn(1000);

        });

    });
    
</script>            
