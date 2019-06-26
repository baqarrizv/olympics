


<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-heart"></i><?= lang('Waste Report'); ?> 
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
                           class="table table-bordered table-hover table-striped table-condensed reports-table">
                        <thead>
                        <tr>

                            <th><?= lang("S.No"); ?></th>
                            <th><?= lang("Product"); ?></th>
                            <th><?= lang("Transaction Type"); ?></th>
                            <th><?= lang("Date"); ?></th>
                            <th><?= lang("Reference No"); ?></th>
                            <th><?= lang("Natural Volume"); ?></th>
                            <th><?= lang("Volume at 85F"); ?></th>
                            <th><?= lang("Waste Qty"); ?></th>
                            <th><?= lang("Warehouse"); ?></th>

                            <!-- <th><?= lang("Item"); ?></th>
                            <th><?= lang("Transaction"); ?></th>
                            <th><?= lang("NAT"); ?></th>
                            <th><?= lang("85 F"); ?></th>
                            <th><?= lang("Waste"); ?></th> -->
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i=0;

                        $total_natural_volume =0;
                        $total_volume_at_85 =0;
                        $total_waste_qty =0;

                        foreach($waste as $w){
                        $i++;

                        // <!-- total natual volume -->
                        $total_natural_volume = $total_natural_volume + $w->nat_qty;
                        $total_volume_at_85 = $total_volume_at_85 + $w->f_qty;
                        $total_waste_qty = $total_waste_qty + $w->nat_qty - $w->f_qty;

                        ?>
                        <tr>
                           <td><?= $i; ?></td>
                           <td><?= $w->description ?></td>
                           <td><?= $w->trans_type ?></td>
                           <td>date</td>
                           <td><?= $w->supp_name ?></td>
                           <td><?= $w->nat_qty ?></td>
                           <td><?= $w->f_qty ?></td>
                           <td><?= $w->nat_qty - $w->f_qty ?></td>
                           <td>Warehouse</td>

<!-- 
                           <td><?= $w->supp_name ?></td>
                           <td><?= $w->description ?></td>
                           <td><?= $w->trans_type ?></td>
                           <td><?= $w->nat_qty ?></td>
                           <td><?= $w->f_qty ?></td>
                           <td><?= $w->nat_qty - $w->f_qty ?></td> -->
                        </tr>
                        <?php
                        }   
                        ?>
                        </tbody>

                        <tfoot>
                            <tr class="active">
                                <th><?= lang("Total"); ?></th>
                                <th><?= lang(""); ?></th>
                                <th><?= lang(""); ?></th>
                                <th><?= lang(""); ?></th>
                                <th><?= lang(""); ?></th>
                                <th><?= lang($total_natural_volume); ?></th>
                                <th><?= lang($total_volume_at_85); ?></th>
                                <th><?= lang($total_waste_qty); ?></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<?= $assets ?>js/html2canvas.min.js"></script>
