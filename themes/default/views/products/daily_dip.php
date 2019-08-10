


<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-building-o"></i><?= $page_title ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="icon fa fa-tasks tip" data-placement="left" title="<?= lang("actions") ?>"></i>
                    </a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
                       <li><a href="<?php echo site_url('Products/add_dip'); ?>" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> <?= lang('add_dip') ?></a></li>

                        <li><a href="#" id="excel" data-action="export_excel"><i
                                    class="fa fa-file-excel-o"></i> <?= lang('export_to_excel') ?></a></li>
                        <li><a href="#" id="pdf" data-action="export_pdf"><i
                                    class="fa fa-file-pdf-o"></i> <?= lang('export_to_pdf') ?></a></li>
                        <li class="divider"></li>
                    </ul>
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
                            <th><?= lang("Date"); ?></th>
                            <th><?= lang("Warehouse"); ?></th>
                            <th><?= lang("Silo"); ?></th>
                            <th><?= lang("Product"); ?></th>
                            <th><?= lang("Reference No"); ?></th>
                            <th><?= lang("NAT"); ?></th>
                            <th><?= lang("85F"); ?></th>
                            <th><?= lang("M.Tonn"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                                $i = 1;
                                foreach ($dip_data as $dip) {
                            ?>
                            <tr>
                                <td><?=$i?></td>
                                <td><?=$dip->tran_date?></td>
                                <td><?=$dip->warehouse_name?></td>
                                <td><?=$dip->location_name?></td>
                                <td><?=$dip->product_name?></td>
                                <td><?=$dip->reference?></td>
                                <td><?=$dip->nat_qty?></td>
                                <td><?=$dip->f_qty?></td>
                                <td><?=$dip->m_ton_qty?></td>
                            </tr>
                            <?php
                                $i++; 
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
        $('.reports-table').DataTable();
    });
</script>
