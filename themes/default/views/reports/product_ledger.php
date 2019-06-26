


<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-heart"></i><?= lang('Product Ledger'); ?> 
        </h2>

        
        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a href="#" id="pdf" class="tip" title="<?= lang('download_pdf') ?>">
                        <i class="icon fa fa-file-pdf-o"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" id="xls" class="tip" title="<?= lang('download_xls') ?>">
                        <i class="icon fa fa-file-excel-o"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" id="image" class="tip" title="<?= lang('save_image') ?>">
                        <i class="icon fa fa-file-picture-o"></i>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-content">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <label>Choose Product</label>
                    <select name="" class="form-control" id="selectProduct">
                        <option value="" selected="" hidden="" disabled="">Products</option>
                        <?php 
                            foreach($products as $product){
                        ?>
                        <option value="<?= $product->stock_id ?>"><?= $product->description ?></option>
                        <?php } ?>
                    </select>
                    <input type="hidden" id="base_url" value="<?= base_url() ?>">
                </div>
            </div>
            <div class="col-lg-12">

                <div class="clearfix"></div>

                <div class="table-responsive">
                    <table
                           class="table table-bordered table-hover table-striped table-condensed reports-table" id="tbl_product">
                        <thead>
                        <tr>
                            <th>S.No</th>
                            <th><?= lang("Product"); ?></th>
                            <th><?= lang("Transaction Type"); ?></th>
                            <th><?= lang("Date"); ?></th>
                            <th><?= lang("Reference No"); ?></th>
                            <th><?= lang("Natural Volume"); ?></th>
                            <th><?= lang("Temp(F)"); ?></th>
                            <th><?= lang("Density"); ?></th>
                            <th><?= lang("M.Ton"); ?></th>
                            <th><?= lang("Volume at 85F"); ?></th>
                            <th><?= lang("Warehouse"); ?></th>


                            <!-- <th><?= lang("Supplier Name"); ?></th>
                             <th><?= lang("Item"); ?></th> 
                            <th><?= lang("Transaction"); ?></th>
                            <th><?= lang("NAT"); ?></th>
                            <th><?= lang("Temp"); ?></th>
                            <th><?= lang("Denisity"); ?></th>
                            <th><?= lang("M.Ton"); ?></th>
                            <th><?= lang("85 F"); ?></th> -->
                        </tr>
                        </thead>
                        <tbody id="tBody">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<?= $assets ?>js/html2canvas.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $('#selectProduct').change(function(event) {
            let url = $('#base_url').val();
            let id = $(this).val();
            $('#tBody').html('');
            $.get(url+'reports/get_product_ledger/'+id, function(data) {
                /*optional stuff to do after success */
                let row = "";
                $.each(JSON.parse(data), function(index, val) {
                    let i = index+1;
                    row += "<tr>";

                    row += "<td>"+ i +"</td>"; 
                    row += "<td>"+ val.description +"</td>";
                    row += "<td>"+ val.trans_type +"</td>";
                    row += "<td> Date </td>";
                    row += "<td>"+ val.supp_name +"</td>";
                    row += "<td>"+ val.nat_qty +"</td>";
                    row += "<td>"+ val.temp +"</td>";
                    row += "<td>"+ val.density +"</td>";
                    row += "<td>"+ val.m_ton_qty +"</td>";
                    row += "<td>"+ val.f_qty +"</td>";
                    row += "<td> Warehouse </td>";


                    // row += "<td>"+ i +"</td>"; 
                    // row += "<td>"+ val.supp_name +"</td>";
                    // row += "<td>"+ val.description +"</td>";
                    // row += "<td>"+ val.trans_type +"</td>";
                    // row += "<td>"+ val.nat_qty +"</td>";
                    // row += "<td>"+ val.temp +"</td>";
                    // row += "<td>"+ val.density +"</td>";
                    // row += "<td>"+ val.m_ton_qty +"</td>";
                    // row += "<td>"+ val.f_qty +"</td>";
                    row += "</tr>";
                });
                $('#tBody').append(row);
                $('#tbl_product').DataTable();

            });
        });
    });
</script>
