<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_receive'); ?></h4>
        </div>
        <?php foreach($transfer as $row): ?>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open_multipart("transfers/receive_transfer/$row->id", $attrib); ?>
        <div class="modal-body">
            <div class="form-group">
                <div class="row">
                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo form_open_multipart("transfers/add", $attrib)
                ?>
                <input type="hidden" name="reference_no" value="<?=$row->transfer_no?>">
                <input type="hidden" name="to_warehouse" value="<?=$row->to_warehouse_code?>">
                <input type="hidden" name="from_warehouse" value="<?=$row->from_warehouse_code?>">
                <input type="hidden" name="status" value="completed">
                <input type="hidden" name="product_id" value="<?=$row->product_id?>">
                <input type="hidden" name="material_cost" id="material_cost" value="0">
                <input type="hidden" name="from_warehouse_name" value="<?=$row->from_warehouse_name?>">
                <input type="hidden" name="to_warehouse_name" value="<?=$row->to_warehouse_name?>">
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>NAT</th>
                                    <th>Temp</th>
                                    <th>Density</th>
                                    <th>85F</th>
                                    <th>M.Tonn</th>
                                    <th>From</th>
                                    <th>TO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?=$row->description?></td>
                                    <td><?=$row->nat_qty?></td>
                                    <td><?=$row->temp?></td>
                                    <td><?=$row->density?></td>
                                    <td><?=$row->f_qty?></td>
                                    <td><?=$row->m_ton_qty?></td>
                                    <td><?=$row->from_warehouse_name?></td>
                                    <td><?=$row->to_warehouse_name?></td>
                                </tr>
                            </tbody>
                            <thead>
                                <tr>
                                    <th colspan="8">Receiving</th>
                                    

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td><input type="text" class="form-control" value="" id="qty" name="qty"></td>
                                    <td>
                                        <input type="text" class="form-control" value="" id="temp" name="temp">
                                    </td>
                                    <td>
                                        <?php
                                        $dc[''] = '';
                                        foreach ($density_chart as $density) {
                                            $dc[$density->expansion_degree] = $density->gravity;
                                        }
                                        echo form_dropdown('density', $dc, (isset($_POST['density']) ? $_POST['density'] : ''), 'id="density" style="width:100%;" class="density_select form-control input-tip select" data-placeholder="' . lang("select") . ' ' . lang("density") . '" required="required" ');
                                        ?>
                                    </td>
                                    <td><input type="text" class="form-control" value="" id="factor" name="factor" readonly></td>
                                    <td>
                                        <input type="text" class="form-control" value="" id="mton" name="mton" readonly="">
                                        
                                    </td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                     <div class="col-md-12">
                            <div class="from-group">
                                <?= lang("note", "tonote"); ?>
                                <?php echo form_textarea('note', (isset($_POST['note']) ? $_POST['note'] : ""), 'id="tonote" class="form-control" style="margin-top: 10px; height: 100px;"'); ?>
                            </div>


                            <div
                                class="from-group"><?php echo form_submit('add_transfer', $this->lang->line("submit"), 'id="add_transfer" class="btn btn-primary" style="padding: 6px 15px; margin:15px 0;"'); ?>
                                <button type="button" class="btn btn-danger" id="reset"><?= lang('reset') ?></button>
                            </div>
                        </div>
                </div>
            </div>
           
        </div>
    </div>
    <?php echo form_close(); ?>
    <?php endforeach;?>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
<script type="text/javascript">
    $(document).ready(function() {
        
        $('#density').change(function(e) {
            
            let nat = $('#qty').val();
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

        $('#qty').keyup(function(event) {
            let av_ = $('#available').val();
            let nat = $('#qty').val();
            //let av_ = av.replace(/,/g, '');

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


