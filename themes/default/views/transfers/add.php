<script type="text/javascript">
    <?php if ($this->session->userdata('remove_tols')) { ?>
    if (localStorage.getItem('toitems')) {
        localStorage.removeItem('toitems');
    }
    if (localStorage.getItem('toshipping')) {
        localStorage.removeItem('toshipping');
    }
    if (localStorage.getItem('toref')) {
        localStorage.removeItem('toref');
    }
    if (localStorage.getItem('to_warehouse')) {
        localStorage.removeItem('to_warehouse');
    }
    if (localStorage.getItem('tonote')) {
        localStorage.removeItem('tonote');
    }
    if (localStorage.getItem('from_warehouse')) {
        localStorage.removeItem('from_warehouse');
    }
    if (localStorage.getItem('todate')) {
        localStorage.removeItem('todate');
    }
    if (localStorage.getItem('tostatus')) {
        localStorage.removeItem('tostatus');
    }
    <?php $this->sma->unset_data('remove_tols');
} ?>
    var count = 1, an = 1, product_variant = 0, shipping = 0,
        product_tax = 0, total = 0,
        tax_rates = <?php echo json_encode($tax_rates); ?>, toitems = {},
        audio_success = new Audio('<?= $assets ?>sounds/sound2.mp3'),
        audio_error = new Audio('<?= $assets ?>sounds/sound3.mp3');
    $(document).ready(function () {
        <?php if ($Owner || $Admin) { ?>
        if (!localStorage.getItem('todate')) {
            $("#todate").datetimepicker({
                format: site.dateFormats.js_ldate,
                fontAwesome: true,
                language: 'sma',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0
            }).datetimepicker('update', new Date());
        }
        $(document).on('change', '#todate', function (e) {
            localStorage.setItem('todate', $(this).val());
        });
        if (todate = localStorage.getItem('todate')) {
            $('#todate').val(todate);
        }
        <?php } ?>
        ItemnTotals();
        $("#add_item").autocomplete({
            //source: '<?= site_url('transfers/suggestions'); ?>',
            source: function (request, response) {
                if (!$('#from_warehouse').val()) {
                    $('#add_item').val('').removeClass('ui-autocomplete-loading');
                    bootbox.alert('<?=lang('select_above');?>');
                    $('#add_item').focus();
                    return false;
                }
                $.ajax({
                    type: 'get',
                    url: '<?= site_url('transfers/suggestions'); ?>',
                    dataType: "json",
                    data: {
                        term: request.term,
                        warehouse_id: $("#from_warehouse").val()
                    },
                    success: function (data) {
                        response(data);
                    }
                });
            },
            minLength: 1,
            autoFocus: false,
            delay: 200,
            response: function (event, ui) {
                if ($(this).val().length >= 16 && ui.content[0].id == 0) {
                    //audio_error.play();
                    if ($('#from_warehouse').val()) {
                        bootbox.alert('<?= lang('no_match_found') ?>', function () {
                            $('#add_item').focus();
                        });
                    } else {
                        bootbox.alert('<?= lang('please_select_warehouse') ?>', function () {
                            $('#add_item').focus();
                        });
                    }
                    $(this).removeClass('ui-autocomplete-loading');
                    $(this).val('');
                }
                else if (ui.content.length == 1 && ui.content[0].id != 0) {
                    ui.item = ui.content[0];
                    $(this).data('ui-autocomplete')._trigger('select', 'autocompleteselect', ui);
                    $(this).autocomplete('close');
                    $(this).removeClass('ui-autocomplete-loading');
                }
                else if (ui.content.length == 1 && ui.content[0].id == 0) {
                    //audio_error.play();
                    bootbox.alert('<?= lang('no_match_found') ?>', function () {
                        $('#add_item').focus();
                    });
                    $(this).removeClass('ui-autocomplete-loading');
                    $(this).val('');

                }
            },
            select: function (event, ui) {
                event.preventDefault();
                if (ui.item.id !== 0) {
                    var row = add_transfer_item(ui.item);
                    if (row)
                        $(this).val('');
                } else {
                    //audio_error.play();
                    bootbox.alert('<?= lang('no_match_found') ?>');
                }
            }
        });
        $('#add_item').bind('keypress', function (e) {
            if (e.keyCode == 13) {
                e.preventDefault();
                $(this).autocomplete("search");
            }
        });

        var to_warehouse;
        $('#to_warehouse').on("select2-focus", function (e) {
            to_warehouse = $(this).val();
        }).on("select2-close", function (e) {
            if ($(this).val() != '' && $(this).val() == $('#from_warehouse').val()) {
                $(this).select2('val', to_warehouse);
                bootbox.alert('<?= lang('please_select_different_warehouse') ?>');
            }
        });
        var from_warehouse;
        $('#from_warehouse').on("select2-focus", function (e) {
            from_warehouse = $(this).val();
        }).on("select2-close", function (e) {
            if ($(this).val() != '' && $(this).val() == $('#to_warehouse').val()) {
                $(this).select2('val', from_warehouse);
                bootbox.alert('<?= lang('please_select_different_warehouse') ?>');
            }
        });

    });
</script>

<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('add_transfer'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <p class="introtext"><?php echo lang('enter_info'); ?></p>
                <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo form_open_multipart("transfers/add", $attrib)
                ?>


                <div class="row">
                    <div class="col-lg-12">

                        <?php if ($Owner || $Admin) { ?>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <?= lang("date", "todate"); ?>
                                    <?php echo form_input('date', (isset($_POST['date']) ? $_POST['date'] : ""), 'class="form-control input-tip datetime" id="todate" required="required"'); ?>
                                </div>
                            </div>
                        <?php } ?>
                        <div class="col-md-4">
                            <div class="form-group">
                                <?= lang("reference_no", "ref"); ?>
                                <?php echo form_input('reference_no', (isset($_POST['reference_no']) ? $_POST['reference_no'] : $rnumber), 'class="form-control input-tip" id="ref"'); ?>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <?= lang("to_warehouse", "to_warehouse"); ?>
                                <?php
                                $wh[''] = '';
                                foreach ($warehouses as $warehouse) {
                                    $wh[$warehouse->loc_code] = $warehouse->location_name;
                                }
                                echo form_dropdown('to_warehouse', $wh, (isset($_POST['to_warehouse']) ? $_POST['to_warehouse'] : ''), 'id="to_warehouse" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("to_warehouse") . '" required="required" style="width:100%;" ');
                                ?>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <?= lang("status", "tostatus"); ?>
                                <?php
                                $post = array('pending' => lang('pending'));
                                echo form_dropdown('status', $post, (isset($_POST['status']) ? $_POST['status'] : ''), 'id="tostatus" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("status") . '" required="required" style="width:100%;"');
                                ?>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group" style="margin-bottom:5px;">
                                <?= lang("shipping", "toshipping"); ?>
                                <?php echo form_input('shipping', '', 'class="form-control input-tip" id="toshipping"'); ?>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <?= lang("document", "document") ?>
                                <input id="document" type="file" data-browse-label="<?= lang('browse'); ?>" name="document" data-show-upload="false"
                                       data-show-preview="false" class="form-control file">
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="panel panel-warning">
                                <div
                                    class="panel-heading"><?= lang('please_select_these_before_adding_product') ?></div>
                                <div class="panel-body" style="padding: 5px;">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("from_warehouse", "from_warehouse"); ?>
                                            <?php echo form_dropdown('from_warehouse', $wh, (isset($_POST['from_warehouse']) ? $_POST['from_warehouse'] : ''), 'id="from_warehouse" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("from_warehouse") . '" required="required" style="width:100%;" ');
                                            ?>
                                        </div>
                                    </div>
                                    <!-- <div class="col-md-4">
                                        <div class="form-group">
                                            <?= lang("from_warehouse", "from_warehouse"); ?>
                                            <?php echo form_dropdown('from_warehouse', $wh, (isset($_POST['from_warehouse']) ? $_POST['from_warehouse'] : ''), 'id="from_warehouse" class="form-control input-tip select" data-placeholder="' . $this->lang->line("select") . ' ' . $this->lang->line("from_warehouse") . '" required="required" style="width:100%;" ');
                                            ?>
                                        </div>
                                    </div> -->
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="col-md-12" id="sticker">

                        <div class="clearfix"></div>
                        <div class="col-md-12">
                            <div class="control-group table-group">
                                <label class="table-label"><?= lang("order_items"); ?></label>
                                <div class="controls table-controls">
                                    <table
                                           class="table items table-striped table-bordered table-condensed table-hover">
                                        <thead>
                                        <tr>
                                            <th class="col-md-2"><?= lang("product_name"); ?></th>
                                            <th class="col-md-2">Available</th>
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
                                                    <input type="hidden" value="" id="product_id">
                                                    <select class="form-control" name="product_name" id="productList">
                                                        
                                                    </select>
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" value="" disabled="" id="available" name="availableQty">
                                                </td>
                                                <td>
                                                    <input type="text" class="form-control" value="" id="qty" name="qty">
                                                </td>
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
                                                <td>
                                                    <input type="hidden" class="form-control" value="" id="factor" name="factor">
                                                    <p id="factor_txt"></p>
                                                </td>
                                                <td>
                                                    <p id="mton_txt"></p>
                                                    <input type="hidden" class="form-control" value="" id="mton" name="mton">
                                                    <input type="hidden" name="material_cost" id="material_cost" value="" >
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            
                                        </tfoot>
                                    </table>
                                </div>
                            </div>


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

                <div id="bottom-total" class="well well-sm" style="margin-bottom: 0;">
                    <table class="table table-bordered table-condensed totals" style="margin-bottom:0;">
                        <tr class="warning">
                            <td><?= lang('items') ?> <span class="totals_val pull-right" id="titems">0</span></td>
                            <td><?= lang('total') ?> <span class="totals_val pull-right" id="total">0.00</span></td>
                            <td><?= lang('shipping') ?> <span class="totals_val pull-right" id="tship">0.00</span></td>
                            <td><?= lang('grand_total') ?> <span class="totals_val pull-right" id="gtotal">0.00</span>
                            </td>
                        </tr>
                    </table>
                </div>

                <?php echo form_close(); ?>

            </div>

        </div>
    </div>
</div>

<div class="modal" id="prModal" tabindex="-1" role="dialog" aria-labelledby="prModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true"><i
                            class="fa fa-2x">&times;</i></span><span class="sr-only"><?=lang('close');?></span></button>
                <h4 class="modal-title" id="prModalLabel"></h4>
            </div>
            <div class="modal-body" id="pr_popover_content">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="pquantity" class="col-sm-4 control-label"><?= lang('quantity') ?></label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="pquantity">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="poption" class="col-sm-4 control-label"><?= lang('product_option') ?></label>

                        <div class="col-sm-8">
                            <div id="poptions-div"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="pprice" class="col-sm-4 control-label"><?= lang('cost') ?></label>

                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="pprice">
                        </div>
                    </div>
                    <input type="hidden" id="old_tax" value=""/>
                    <input type="hidden" id="old_qty" value=""/>
                    <input type="hidden" id="old_price" value=""/>
                    <input type="hidden" id="row_id" value=""/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="editItem"><?= lang('submit') ?></button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {

        $('#from_warehouse').change(function(event) {
            

            $.ajax({
                    type: 'get',
                    url: '<?= site_url('transfers/suggestions'); ?>',
                    dataType: "json",
                    data: {
                        warehouse_id: $("#from_warehouse").val()
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
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#productList').change(function(event) {
            let id = $(this).val();
            let loc = $('#from_warehouse').val();
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
