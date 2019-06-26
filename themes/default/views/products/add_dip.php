<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_dip'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open_multipart("products/add_dip", $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-12">
                        <label class="control-label" for="reference"><?php echo $this->lang->line("Reference"); ?><span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="reference" value="" required="required">
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="location"><?php echo $this->lang->line("Location"); ?><span class="text-danger">*</span>
                        </label>
                        <?php
                        $wh[''] = '';
                        foreach ($warehouses as $warehouse) {
                            $wh[$warehouse->id] = $warehouse->city_name.' - '.$warehouse->name;
                        }
                        echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : ($product ? $product->category_id : '')), 'class="form-control select" id="warehouse" placeholder="' . lang("select") . " " . lang("warehouse") . '" required="required" style="width:100%"')

                        
                        ?>
                        <input type="hidden" name="price" value="" id="price">
                    </div>

                    <div class="col-md-6">
                        <label class="control-label" for="silo"><?php echo $this->lang->line("Silo"); ?> <span class="text-danger">*</span>
                        </label>
                        <select class="form-control" name="silo" id="silo">
                            
                        </select>
                        
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="product"><?php echo $this->lang->line("Product"); ?> <span class="text-danger">*</span>
                        </label>
                        <select class="form-control" name="product" id="product">
                            
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label class="control-label" for="nat"><?php echo $this->lang->line("NAT"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('nat', '', 'class="form-control" id="nat" required="required"'); ?> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="temp"><?php echo $this->lang->line("Temperature"); ?>
                        </label>
                    <div class="controls"> <?php echo form_input('temp', '', 'class="form-control" id="temp" required="required"'); ?> 
                        </div>
                      
                    </div>
                    <div class="col-md-6">
                        <label class="control-label" for="density"><?php echo $this->lang->line("Density"); ?>
                        </label>
                        <?php
                        $dn[''] = '';
                        foreach ($density_chart as $den) {
                            $dn[$den->expansion_degree] = $den->gravity;
                        }
                        echo form_dropdown('density', $dn, (isset($_POST['density']) ? $_POST['density'] : ($den ? $den->expansion_degree : '')), 'class="form-control select" id="density" placeholder="' . lang("select") . " " . lang("density") . '" required="required" style="width:100%"')

                        
                        ?>
                    </div>
                   
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="factor"><?php echo $this->lang->line("85 F"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('factor', '', 'class="form-control" id="factor" required="required" disabled'); ?> 
                        <input type="hidden" name="f_qty" id="f_qty" value="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label class="control-label" for="mton_txt"><?php echo $this->lang->line("M Tonn"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('mton_txt', '', 'class="form-control" id="mton_txt" required="required" disabled'); ?> 
                        <input type="hidden" name="mton" id="mton" value="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <?php echo form_submit('add', lang('add'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
<script type="text/javascript">
    $(document).ready(function() {
        $('#warehouse').change(function(event) {
            let id = $(this).val();
            $.ajax({
                url: '<?=base_url()?>products/getSilosByLocation',
                type: 'GET',
                dataType: 'JSON',
                data: {id: id},
            })
            .done(function(data) {

                let html = '<option selected disabled>Select Silo</option>';
               
                $.each(data.silos, function(index, val) {
                    
                    html += '<option value="'+val.loc_code+'">'+val.location_name+'</option>';
                    
                });
                $('#silo').html('');
                $('#silo').append(html);

            })
            .fail(function() {
                console.log("error");
            });
            
        });

        $('#silo').change(function(event) {
            let loc_code = $(this).val();
            $.ajax({
                url: '<?= base_url() ?>transfers/suggestions',
                type: 'GET',
                dataType: 'JSON',
                data: {warehouse_id: loc_code},
            })
            .done(function(data) {
                let html = '<option selected disabled>Select Product</option>';
                $.each(data, function(index, val) {
                     html += '<option value="'+val.id+'">'+val.label+'</option>';
                });
                $('#product').html('');
                $('#product').append(html);
            })
            .fail(function() {
                console.log("error");
            });
            
        });

        $('#density').change(function(event) {
            let nat = $('#nat').val();
            let temp = $('#temp').val();
            let density = $(this).val();
            const vl = 85;

            
            let tmp_ = vl-temp;
            let multiplyFactor = density*tmp_;
            let multiplyNat = multiplyFactor * nat.replace(/,/g, '');
            let finVal = Math.round(parseFloat(nat.replace(/,/g, '')) + multiplyNat);
            $('#factor').val(finVal);
            $('#f_qty').val(finVal);

            let txt = $(this).find('option:selected').html().substring(0, 5);
            let del_ = parseFloat(nat.replace(/,/g, '')).toFixed(2);
            let calculateMton = parseFloat(txt) * del_ / 1000;

            $('#mton').val(calculateMton.toFixed(2));
            $('#mton_txt').val(calculateMton.toFixed(2));

        });

        $('#product').change(function(event) {
            let id = $(this).val();
            $.ajax({
                url: '<?=base_url()?>products/getPrice',
                type: 'GET',
                dataType: 'JSON',
                data: {id: id},
            })
            .done(function(data) {
                $.each(data, function(index, val) {
                
                    $('#price').val(val.material_cost);
                    
                });
            })
            .fail(function() {
                console.log("error");
            });
            
        });
    });
</script>
