


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
                       <li><a href="<?php echo site_url('Products/add_third_paty'); ?>" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> <?= lang('Add Third Party Stock') ?></a></li>

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
                            <th><?= lang("Date"); ?></th>
                            <th><?= lang("Reference"); ?></th>
                            <th><?= lang("Customer"); ?></th>
                            <th><?= lang("Location"); ?></th>
                            <th><?= lang("Silo"); ?></th>
                            <th><?= lang("Product"); ?></th>
                            <th><?= lang("NAT"); ?></th>
                            <th><?= lang("85F"); ?></th>
                            <th><?= lang("Temp"); ?></th>
                            <th><?= lang("Density"); ?></th>
                            <th><?= lang("M.Tonn"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php foreach($stock as $row): ?>
                            <tr>
                                <td><?= $row->storage_date?></td>
                                <td><?= $row->reference_no?></td>
                                <td><?= $row->customer?></td>
                                <td><?= $row->location?></td>
                                <td><?= $row->silo?></td>
                                <td><?= $row->product?></td>
                                <td><?= $row->nat?></td>
                                <td><?= $row->f_qty?></td>
                                <td><?= $row->temp?></td>
                                <td><?= $row->density?></td>
                                <td><?= $row->mton?></td>
                            </tr>
                            <?php endforeach; ?>
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
