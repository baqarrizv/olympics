<style type="text/css" media="screen">
.select2-container{
    width: 100%;
}    
</style>
    <h2 class="text-center">Recieve Purchase Order</h2>
   <?php $total = 0; /*echo json_encode($order);*/ foreach($order as $odr){ ?>
    <?php
        $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open("purchases/add_grn", $attrib)
    ?>
            <input type="hidden" name="curr_code" value="<?=$odr['curr_code']?>">
            <input type="hidden" name="order_no" value="<?=$odr['order_no']?>">
            <input type="hidden" name="reference" value="<?=$odr['reference']?>">
            <input type="hidden" name="supplier_id" value="<?=$odr['supplier_id']?>">
            <input type="hidden" name="into_stock_location" value="<?=$odr['into_stock_location']?>">

            <div class="well well-sm">
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        <?= lang("ref"); ?>: <?= $odr['reference']; ?><br>
                        <?= lang("date"); ?>: <?= $this->sma->hrld($odr['ord_date']); ?><br>
                        
                    </p>
                    </div>
                   
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="row" style="margin-bottom:15px;">
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Supplier Name"); ?>:
                    <h2 style="margin-top:10px;"><?= $odr['supp_name']; ?></h2>

                    <?php
                    $total = $odr['OrderQty'];
                    ?>
                    <div class="form-group">
                        <?= lang("date", "rec_date"); ?>
                        <?php echo form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control input-tip datetime" id="rec_date" name="rec_date" required="required"'); ?>
                    </div>
                </div>
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Supplier's Reference"); ?>:<br/>
                    <h2 style="margin-top:10px;"><?= $odr['requisition_no'] == null ? 'NA' : $odr['requisition_no']; ?></h2>
                    <div class="form-group">
                    <?= lang("warehouse", "powarehouse"); ?>
                    <?php
                    $wh[''] = '';
                    foreach ($warehouses as $warehouse) {
                        $wh[$warehouse->loc_code] = $warehouse->location_name;
                    }
                    echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : $Settings->default_warehouse), 'id="powarehouse" class="form-control input-tip select" data-placeholder="' . lang("select") . ' ' . lang("warehouse") . '" required="required" style="width:100%;" ');
                    ?>
                </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-sm">
                        <p class="bold"><?= lang("note"); ?>:</p>
                        <div><?= $odr['comments'] ?></div>
                    </div>
                    <div class="well well-sm">
                        <p class="bold"><?= lang("Location"); ?>:</p>
                        <div><?= $loc_on[0]['name'] ?></div>
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
                        <th><?= lang("Received"); ?></th>
                        <th><?= lang("Outstanding"); ?></th>
                        <th><?= lang("This Delivery (NAT)"); ?></th>
                        <th><?= lang("Temp"); ?></th>
                        <th><?= lang("Density"); ?></th>
                        <th><?= lang("85F"); ?></th>
                        <th><?= lang("M.Ton"); ?></th>
                    </tr>

                    </thead>

                    <tbody>

                    <?php $r = 1;
                    $totalRec = 0;
                    
                    foreach ($details as $row):
                    $totalAmount += $row['std_cost_unit'];
                    ?>
                        <tr>
                            <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                            <td style="vertical-align:middle;width:80px;">
                                <?= $row['item_code']; ?>
                            </td>
                            <td style="vertical-align:middle;">
                                <?= $row['description']; ?>
                            </td>
                            <td style="width: 5 0px; text-align:center; vertical-align:middle;">
                                <?= $row['units']; ?></td>
                            <td style="text-align:right; width:100px;">
                                <?= $this->sma->formatQuantity($row['quantity_ordered']); ?>
                            </td>
                            <td style="text-align:right;"><?= $this->sma->formatQuantity($row['quantity_received']); ?></td>
                            <td style="text-align:right;width:100px;"><?= $ost = $this->sma->formatQuantity($row['quantity_ordered'] - $row['quantity_received']); ?></td>
                            <td style="width: 110px;padding: 0;">
                                <input class="form-control" type="text" id="delivery_<?=$row['item_code']?>" name="this_delivery[]" placeholder="<?= $ost ?>" <?php echo $ost == 0.00 ? 'disabled' : '' ?>/>
                            </td>
                            <td style="width: 50px;padding: 0;">
                                <input class="form-control" type="text" name="temp[]" id="temp_<?=$row['item_code']?>" placeholder="85" <?php echo $ost == 0.00 ? 'disabled' : '' ?>/>
                            </td>
                            <td style="width: 120px;padding: 0;">

                                <select class="form-control density_select" name="density" id="den_<?=$row["item_code"]?>" required="" data-id="<?=$row["item_code"]?>">
                                    <?php
                                    foreach ($density_chart as $density) {
                                    
                                    ?>
                                    <option value="<?=$density->id?>" data-degree="<?=$density->expansion_degree?>"><?=$density->gravity?></option>

                                    <?php } ?>
                                </select>

                                
                            </td>
                            <td style="width: 80px;">
                                <p id="f_txt_<?=$row['item_code']?>"></p>
                                <input type="hidden" class="form-control" name="after_waste[]" id="f_<?=$row['item_code']?>">
                                <input type="hidden"  name="density_h[]" id="density_h_<?=$row['item_code']?>" value="">
                            </td>
                            <td style="width: 80px;">
                                <p id="mton_txt_<?=$row['item_code']?>"></p>
                                <input type="hidden" class="form-control" name="mton[]" id="mton_<?=$row['item_code']?>">
                                <input type="hidden" name="total_amount" value="<?= $totalAmount ?>">
                                <input type="hidden" name="amount[]" value="<?= $row['unit_price'] ?>">
                            </td>
                        </tr>
                        <?php
                        $totalRec += $row['quantity_received'];
                        $totalOs += str_replace(",", "", $ost);

                        $r++;
                    endforeach;
                    ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="4" style="text-align:right; font-weight:bold;"><?= lang("Total"); ?></td>
                        <td
                            style="text-align:right; font-weight:bold;">
                            <?= $this->sma->formatQuantity($total); ?>
                        </td>
                         <td 
                            style="text-align:right; font-weight:bold;">
                            <?= $this->sma->formatQuantity($totalRec); ?>
                        </td>
                        <td 
                            style="text-align:right; font-weight:bold;">
                            <?= $this->sma->formatQuantity($totalOs); ?>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-12">
                <center>
                    <button type="submit" class="btn btn-primary">Process Receive Item</button>
                </center>
            </div>

    <?= form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        $('.density_select').change(function(e) {
            let id = $(this).data('id');
            let temp = $('#temp_'+id).val();
            const vl = 85;
            let delivery = $('#delivery_'+id).val();
            let density = $('option:selected', this).attr('data-degree');
            let density_h = $(this).val();
            $('#density_h_'+id).val(density_h);

            if (temp.length == 0 || delivery.length == 0)
            {
                alert("Delivery and temperature cannot be empty!");
            }else{
                let tmp_ = vl-temp;
                let multiplyFactor = density*tmp_;
                let multiplyNat = multiplyFactor * delivery.replace(/,/g, '');
                let finVal = Math.round(parseFloat(delivery.replace(/,/g, '')) + multiplyNat);
                $('#f_'+id).val(finVal);
                $('#f_txt_'+id).html(finVal);

                let txt = $(this).find('option:selected').html().substring(0, 5);
                let del_ = parseFloat(delivery.replace(/,/g, '')).toFixed(2);
                let calculateMton = parseFloat(txt) * del_ / 1000;

                $('#mton_'+id).val(calculateMton.toFixed(2));
                $('#mton_txt_'+id).html(calculateMton.toFixed(2));
                
            }
        });
    });
    function calculateWeight(item_id)
    {
        let f = 'f_'+item_id+'';
        let mt = 'mton_'+item_id+'';
        let t = 'temp_'+item_id+'';
        let d = 'den_'+item_id+'';

        let temp =  $(t).val();
        let density =  $(t).val();
        
        document.getElementById('mton_'+item_id+'').value = "20.00";
        document.getElementById('f_'+item_id+'').value = "67.00";

    }
</script>            
