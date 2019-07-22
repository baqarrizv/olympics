<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-plus"></i><?= lang('Receive Transfer'); ?></h2>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-12">

                <table class="table table-bordered table-hover table-striped table-condensed reports-table" id="tbl_transfer">
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>From</th>
                            <th>To</th>
                            <th>NAT</th>
                            <th>Temp</th>
                            <th>85F</th>
                            <th>M.tonn</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        foreach ($transfer as $row):
                        ?>
                        <tr>
                            <td><?=$row->description?></td>
                            <td><?=$row->from_warehouse_name?></td>
                            <td><?=$row->to_warehouse_name?></td>
                            <td><?=$row->nat_qty?></td>
                            <td><?=$row->temp?></td>
                            <td><?=$row->f_qty?></td>
                            <td><?=$row->m_ton_qty?></td>
                            <td><a href="<?php echo site_url('transfers/receive_transfer').'/'.$row->id;?>" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> <?= lang('Receive') ?></a></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
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

        $('#tbl_transfer').DataTable();

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
