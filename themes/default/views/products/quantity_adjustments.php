<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-filter"></i><?= lang('quantity_adjustments'); ?></h2>
        
        
    </div>
    <div class="box-content">
        <div class="row">
            <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form', 'id' => 'adjustment_form');
                echo form_open("products/quantity_adjustments", $attrib)
                ?>
            <div class="col-lg-12">
                 <div class="col-md-3">
                    <div class="form-group">
                        <?= lang("Location", "Location"); ?>
                        <?php
                        $loc[''] = '';
                        foreach ($location as $loc) {
                            $loc[$loc['id']] = $loc['city_name'];
                        }
                        echo form_dropdown('location_city', $loc, (isset($_POST['location_city']) ? $_POST['location_city'] : ''), 'id="location_city" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("location_city") . '" required="required" style="width:100%;" ');
                        ?>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <?= lang("Silos", "Silos"); ?>
                        <?php
                        $wh[''] = '';
                        foreach ($warehouses as $warehouse) {
                            $wh[$warehouse->loc_code] = $warehouse->location_name;
                        }
                        echo form_dropdown('location', $wh, (isset($_POST['location']) ? $_POST['location'] : ''), 'id="location" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("location") . '" required="required" style="width:100%;" ');
                        ?>
                    </div>
                </div>     
                <div class="col-md-3">
                    <div class="form-group">
                        <?= lang("Reference", "Reference"); ?>
                       <input type="text" name="reference" class="form-control" placeholder="reference">
                    </div>
                </div>  
                <div class="col-md-3">
                    <div class="form-group">
                        <?= lang("date", "todate"); ?>
                        <?php echo form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control input-tip datetime" id="todate" required="required"'); ?>
                    </div>
                </div>
                <div class="col-md-12">
                    <table  class="table items table-striped table-bordered table-condensed table-hover">
                        <thead>
                            <tr>
                                <th class="col-md-3"><?= lang("product_name"); ?></th>
                                <th class="col-md-2"><?= lang("quantity"); ?> (NAT)</th>
                                <th class="col-md-1">Temp</th>
                                <th class="col-md-2">Density</th>
                                <th class="col-md-2">85F</th>
                                <th class="col-md-1">M.Tonn</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <select class="form-control" name="product_name" id="productList">
                                         <option></option>               
                                    </select>
                                    <input type="hidden" name="available" value="" id="available">
                                    <input type="hidden" name="material_cost" value="" id="material_cost">
                                </td>
                                <td><input type="text" class="form-control" name="nat" id="nat"> </td>
                                <td><input type="text" class="form-control" name="temp" id="temp"> </td>
                                <td>
                                <?php
                                    $dc[''] = '';
                                    foreach ($density_chart as $density) {
                                        $dc[$density->expansion_degree] = $density->gravity;
                                    }
                                    echo form_dropdown('density', $dc, (isset($_POST['density']) ? $_POST['density'] : ''), 'id="density" style="width:100%;" class="density_select form-control input-tip select" data-placeholder="' . lang("select") . ' ' . lang("density") . '" required="required" ');
                                ?>
                                        
                                </td>
                                <td><input type="hidden" class="form-control" name="factor" id="factor"> <p id="factor_txt"></p> </td>
                                <td><input type="hidden" class="form-control" name="mton" id="mton"> <p id="mton_txt"></p> </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="form-group">
                        <label>Note</label>
                        <textarea name="memo" class="form-control"></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Process Adjustment </button>
                    </div>
                </div>           
            </div>
        <?php echo form_close(); ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $('#location').change(function(event) {
            $.ajax({
                    type: 'get',
                    url: '<?= site_url('transfers/suggestions'); ?>',
                    dataType: "json",
                    data: {
                        warehouse_id: $("#location").val()
                    },
                    success: function (data) {
                        console.log(data);
                        let html = "<option value='' disabled selected>Select Product</>";
                        $.each(data, function(index, val) {

                            html += "<option value='"+ val.id +"'>"+ val.name +"</option>";
                        });

                        $('#productList').html('');
                        $('#productList').append(html);
                    }
                });
        });

        $('#density').change(function(e) {
            
            let nat = $('#nat').val();
            let temp = $('#temp').val();
            let density = $(this).val();
            const vl = 85;

            
            let tmp_ = vl-temp;
            let multiplyFactor = density*tmp_;
            let multiplyNat = multiplyFactor * nat.replace(/,/g, '');
            let finVal = Math.round(parseFloat(nat.replace(/,/g, '')) + multiplyNat);
            $('#factor').val(finVal);
            $('#factor_txt').html(finVal);

            let txt = $(this).find('option:selected').html().substring(0, 5);
            let del_ = parseFloat(nat.replace(/,/g, '')).toFixed(2);
            let calculateMton = parseFloat(txt) * del_ / 1000;

            $('#mton').val(calculateMton.toFixed(2));
            $('#mton_txt').html(calculateMton.toFixed(2));

                
            
        });

        $('#btnSubmit').click(function(event) {
            event.preventDefault();
            let form = $('#adjustment_form').serialize();

             $.ajax({
                    type: 'get',
                    url: '<?= site_url('products/adjustQuantity'); ?>',
                    dataType: "json",
                    data: form,
                    success: function (data) {
                       console.log(data);
                    }
                });
            
        });

        $('#productList').change(function(event) {
            let id = $(this).val();
            let loc = $('#location').val();
            $.ajax({
                    type: 'get',
                    url: '<?= site_url('products/getStock'); ?>',
                    dataType: "json",
                    data: {
                        product_id: id,
                        loc: loc
                    },
                    success: function (data) {
                        
                        $('#available').val(data[0].total);
                        $('#material_cost').val(data[0].material_cost);
                    }
                });
        });
    });
</script>