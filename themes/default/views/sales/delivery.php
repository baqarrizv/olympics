<style type="text/css" media="screen">
.select2-container{
    width: 100%;
}    
</style>
    <h2 class="text-center">Delivery Sale Order</h2>

    <?php
        
        //exit();
    ?>
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
                        <input type="hidden" name="branch_code" value="<?=$odr->branch_code?>">
                        <input type="hidden" name="reference" value="<?= $odr->reference; ?>">
                        <input type="hidden" name="freight_cost" id="freight_cost" value="<?= $odr->freight_cost; ?>">
                        <input type="hidden" name="tax_group_id" value="<?= $odr->tax_group_id; ?>">
                        <input type="hidden" id="from_location" name="from_location" value="<?=$odr->from_stk_loc;?>">
                    </p>
                    </div>
                   <?= $_SESSION['csrf'] ?>
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
                        <input type="hidden" name="debtor_no" id="debtor_no" value="<?=$odr->debtor_no?>">
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
                        <th><?= lang("M.Tonn"); ?></th>
                        <th></th>
                    </tr>

                    </thead>

                    <tbody id="tbl_body">
                        <tr>
                            <td style="width: 100px;">
                                <input type="text" name="item_code" class="form-control" value="00" readonly="" />
                            </td>
                            <td>


                                <select class="form-control item_select">
                                    <option selected="" readonly hidden="">Select Item</option>
                                    
                                    <?php $index = 0; foreach ($details as $row): ?>
                                    <option data-price="<?= $row->unit_price; ?>" data-orderno="<?= $row->order_no; ?>" data-outstanding="<?= $row->quantity - $row->qty_sent?>" data-sent="<?= $this->sma->formatQuantity($row->qty_sent); ?>" data-ordered="<?= $this->sma->formatQuantity($row->quantity); ?>" data-unit="<?= $row->units ?>" data-index="<?=$index?>" value="<?= $row->stk_code; ?>"><?= $row->description; ?></option>
                                    <?php $index++; endforeach; ?>
                                </select>

                            </td>
                            <td>
                                <input type="text" name="unit" class="form-control" readonly="" value="NA">
                                <input type="hidden" name="tax_type_id" value="">
                            </td>
                            <td>
                                <input type="text" name="ordered" class="form-control" readonly="" value="00">
                            </td>
                            <td>
                                <input type="text" name="delivered" class="form-control" readonly="" value="00">
                            </td>
                            <td>
                                <input type="text" name="outstanding" class="form-control" readonly="" value="00">
                            </td>
                            <td>
                                <input type="text" name="this_delivery" class="form-control" value="00">
                            </td>
                             <td>
                                <?php
                                // $wh[''] = '';
                                // foreach ($warehouses as $warehouse) {
                                //     $wh[$warehouse->loc_code] = $warehouse->location_name;
                                // }
                                // echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : $Settings->default_warehouse), 'id="powarehouse" class="whouse form-control input-tip select" data-placeholder="' . lang("select") . ' ' . lang("warehouse") . '" required="required" style="width:100%;" ');
                                ?>
                                <select class="form-control" name="warehouse" id="powarehouse">
                                    
                                </select>
                                
                            </td>
                            <td>
                                <input type="text" name="temp" class="form-control" value="00">
                            </td>
                            <td>
                                <select class="form-control density_select" name="density" id="curr_density" required="">
                                    <?php
                                    foreach ($density_chart as $density) {
                                    
                                    ?>
                                    <option value="<?=$density->id?>" data-degree="<?=$density->expansion_degree?>"><?=$density->gravity?></option>

                                    <?php } ?>
                                </select>
                               
                            </td>
                            <td>
                                <input type="text" name="f_qty" class="form-control" readonly="" value="00">
                            </td>
                            <td>
                                <input type="text" name="mton" class="form-control" readonly="" value="00">
                            </td>
                            <td><a href="#" id="addTank"><i class="fa fa-plus-circle"></i></a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-12">
                <center>
                    <button type="button" class="btn btn-primary" id="btnProcss">Process Delivery</button>
                </center>
            </div>

    <?= form_close(); ?>

<script type="text/javascript">
    $(document).ready(function() {
        let deliveryArr = [];
        $('.whouse').change(function(event) {
           
            let tank = $(this).val();
            let product = $(this).parent().parent().find('.item_select option:selected').val();
            let this_delivery = $(this).parent().parent().find('input[name=this_delivery]').val();

            $.ajax({
                url: '<?=base_url()?>products/get_tank_qty/'+tank+'/'+product,
                type: 'GET',
                dataType: 'JSON',
            })
            .done(function(data) {
                console.log(data);

                if (this_delivery < 1)
                {
                    alert("Please enter valid quantity in delivery box!!");
                }else if (this_delivery > data.qty)
                {
                    alert("No enough quantity in this this. Total quantity in this tank is "+data.qty);
                }
            })
            .fail(function() {
                console.log("error");
            });
        });

        $('#addTank').click(function(event) {
            event.preventDefault();
            
            let price = $('.item_select option:selected').attr('data-price');
            //console.log(price);
            let item_code = $(this).parent().parent().find('input[name=item_code]').val();
            let item_name = $('.item_select option:selected').text();
            let unit = $(this).parent().parent().find('input[name=unit]').val();
            let ordered = $(this).parent().parent().find('input[name=ordered]').val();
            let delivered = $(this).parent().parent().find('input[name=delivered]').val();
            let outstanding = $(this).parent().parent().find('input[name=outstanding]').val();
            let this_delivery = $(this).parent().parent().find('input[name=this_delivery]').val();
            let tank = $('.whouse option:selected').text();
            let temp = $(this).parent().parent().find('input[name=temp]').val();
            let density = $('.density_select option:selected').text();
            let f_qty = $(this).parent().parent().find('input[name=f_qty]').val();
            let mton = $(this).parent().parent().find('input[name=mton]').val();
            let curr_outstanding = outstanding - this_delivery;
            let order_no = $('.item_select option:selected').attr('data-orderno');
            let debtor_no = $('#debtor_no').val();
            let loc_code = $('#powarehouse').val();
            console.log(loc_code);
            let density_orig = $('#curr_density').val();
            let freight_cost = $('#freight_cost').val();
            let reference = $('input[name=reference]').val();
            let branch_code = $('input[name=branch_code]').val();
            let tax_group_id = $('input[name=tax_group_id]').val();

            if (outstanding == 0)
            {
                alert("No outstanding found!");
            }else if(this_delivery > outstanding){
                alert("Wrong delivery!");
                $(this).parent().parent().find('input[name=this_delivery]').val(outstanding);
            }else
            {
                let html = '<tr>';
                html += '<td style="width: 100px;">'
                        +'<input type="text" name="item_code" class="form-control" value="'+item_code+'" readonly="" />'
                        +'</td>';
                html += '<td>';
                html += '<input type="text" name="item_name" class="form-control" value="'+item_name+'" readonly="" />';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="unit" class="form-control" readonly="" value="'+unit+'">';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="ordered" class="form-control" readonly="" value="'+ordered+'">';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="delivered" class="form-control" readonly="" value="'+delivered+'">';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="outstanding" class="form-control" readonly="" value="'+outstanding+'">';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="this_delivery" class="form-control" value="'+this_delivery+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="tank" class="form-control" value="'+tank+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="temp" class="form-control" value="'+temp+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="density" class="form-control" value="'+density+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="f_qty" class="form-control" value="'+f_qty+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<input type="text" name="mton" class="form-control" value="'+mton+'" readonly>';
                html += '</td>';
                html += '<td>';
                html += '<a href="#" class="remove_delivery"><i class="fa fa-trash"></i></a>';
                html += '</td>';
                
                deliveryArr.push({order_no: order_no, debtor_no: debtor_no, reference: reference, item_code: item_code, ordered: ordered, delivered: delivered, outstanding: outstanding, this_delivery: this_delivery, loc_code: loc_code, temp: temp, density: density_orig, f_qty: f_qty, mton: mton, freight_cost: freight_cost, price: price, branch_code: branch_code, tax_group_id: tax_group_id});
                console.log(deliveryArr);

                $('#tbl_body').prepend(html).hide().fadeIn(1000);
                $('.remove_delivery').click(function(event) {
                    event.preventDefault();
                    let delivered = $(this).parent().parent().find('input[name=delivered]').val();
                    let outstanding = $(this).parent().parent().find('input[name=outstanding]').val();
                    $(this).parent().parent().find('input[name=outstanding]').val(delivered + outstanding);
                    $(this).parent().parent().remove();
                });
                $(this).parent().parent().find('input[name=outstanding]').val(outstanding - this_delivery);

            }
        });
 
        $('.item_select').change(function(event) {
            let item_code = $(this).val();
            let unit = $(this).find(':selected').data('unit');
            let ordered = $(this).find(':selected').data('ordered');
            let delivered  = $(this).find(':selected').data('sent');
            let outstanding = $(this).find(':selected').data('outstanding');
            let from_location = $('#from_location').val();
            //let this_delivery = $(this).parent().parent().find('input[name=this_delivery]').val();
            $(this).parent().parent().find('input[name=item_code]').val(item_code);
            $(this).parent().parent().find('input[name=unit]').val(unit);
            $(this).parent().parent().find('input[name=ordered]').val(ordered);
            $(this).parent().parent().find('input[name=delivered]').val(delivered);
            $(this).parent().parent().find('input[name=outstanding]').val(outstanding);

            $.ajax({
                url: '<?=base_url()?>products/searchProductSilo',
                type: 'POST',
                dataType: 'JSON',
                data: {from_loc: from_location, item: item_code, token: $('input[name=token]').val()},
            })
            .done(function(data) {
                console.log("success", data);
                let html = "";
                $.each(data, function(index, val) {
                    html += "<option value='"+val.loc_code+"'>"+ val.location_name +"</option>";
                });

                $('#powarehouse').html();
                $('#powarehouse').append(html);
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
            
        });

        $('.remove_delivery').click(function(event) {
            event.preventDefault();
            $(this).parent().parent().remove();
        });
        
        $('.density_select').change(function(e) {

            
            let temp = $(this).parent().parent().find('input[name=temp]').val();
            const vl = 85;
            let delivery = $(this).parent().parent().find('input[name=this_delivery]').val();
            
            let density = $('option:selected', this).attr('data-degree');
            
            console.log(temp+ "__" +delivery);
            //$('#density_h_'+id).val(density);

            if (temp.length == 0 || delivery.length == 0)
            {
                alert("Delivery and temperature cannot be empty!");
            }else{
                let tmp_ = vl-temp;
                let multiplyFactor = density*tmp_;
                let multiplyNat = multiplyFactor * delivery.replace(/,/g, '');
                let finVal = Math.round(parseFloat(delivery.replace(/,/g, '')) + multiplyNat);
                
                $(this).parent().parent().find('input[name=f_qty]').val(finVal);

                let txt = $(this).find('option:selected').html().substring(0, 5);
                let del_ = parseFloat(delivery.replace(/,/g, '')).toFixed(2);
                let calculateMton = parseFloat(txt) * del_ / 1000;

                $(this).parent().parent().find('input[name=mton]').val(calculateMton.toFixed(2));
             }
        });

        $('#btnProcss').click(function(event) {
            $.ajax({
                url: '<?=base_url()?>sales/deliver_sale_order',
                type: 'POST',
                dataType: 'JSON',
                data: {data: deliveryArr, token: $('input[name=token]').val()},
            })
            .done(function(data) {
                if (data)
                {
                    location.reload();
                }else{
                    alert("Something went wrong!");
                }
                
            })
            .fail(function() {
                console.log("error");
            });
            
        });


    });
    
</script>            
