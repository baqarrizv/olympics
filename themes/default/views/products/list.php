
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css" media="screen">

.w3-large {
    font-size: 12px!important;
}

.w3-teal, .w3-hover-teal:hover {
    color: #fff!important;
    background-color: #005f96!important;
}
    
</style>
 -->
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-heart"></i><?= lang('Product List'); ?> 
        </h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a href="#" class="toggle_up tip" title="<?= lang('hide_form') ?>">
                        <i class="icon fa fa-toggle-up"></i>
                    </a>
                </li>
                <li class="dropdown">
                    <a href="#" class="toggle_down tip" title="<?= lang('show_form') ?>">
                        <i class="icon fa fa-toggle-down"></i>
                    </a>
                </li>
            </ul>
        </div>
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
            <div class="col-lg-12">

                <div class="clearfix"></div>

                <div class="table-responsive">
                    <table
                           class="table table-bordered table-hover table-striped table-condensed reports-table" id="tbl_products">
                        <thead>
                        <tr>
                            <th>S.No</th>
                            <th><?= lang("Product Code"); ?></th>
                            <th><?= lang("Product Title"); ?></th>
                            <th><?= lang("UoM"); ?></th>
                            <th><?= lang("Available Qty"); ?></th>
                            <th><?= lang("Booked Qty"); ?></th>
                            <th><?= lang("Action"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $s = 1;
                        foreach($products as $p){
                        ?>
                        <tr>
                           <td><?= $s; ?></td>
                           <td><?= $p->stock_id ?></td>
                           <td><?= $p->description ?></td>
                           <td><?= $p->units ?></td>
                           <td><?= $p->total ?></td>
                           <td>0</td>
                           <td>
                            <a href="<?php echo site_url('Products/view_details'); ?>/<?=$p->stock_id?>" class="btn btn-primary" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> <?= lang('View Details') ?></a>
                           </td>
                        </tr>
                        <?php
                        $s++;
                        }   
                        ?>

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
        $('#tbl_products').DataTable();
    });
</script>




