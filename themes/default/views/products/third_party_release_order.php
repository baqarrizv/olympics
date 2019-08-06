


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
                    <table id="sales-tbl" cellpadding="0" cellspacing="0" border="0" class="table table-bordered table-hover table-striped reports-table" style="margin-bottom: 0;">
                        <thead>
                        <tr>
                            <th style="width:30px !important;">S#</th>
                            <th><?= $this->lang->line("Order Id"); ?></th>
                            <th><?= $this->lang->line("Date"); ?></th>
                            <th><?= $this->lang->line("reference_no"); ?></th>
                            <th><?= $this->lang->line("Customer"); ?></th>
                            <th><?= $this->lang->line("Required By"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if (!empty($third_party)) {
                            $r = 1;
                            foreach ($third_party as $order) {
                                echo '<tr id="' . $order->order_no . '" class="invoice_link"><td>' . $r . '</td>
                                    <td>' . $order->order_no . '</td>
                                    <td>' . $order->ord_date . '</td>
                                    <td><a href="#">' . $order->reference . '</a></td>
                                    <td>' . $order->deb_name . '</td>
                                    <td>' . $order->delivery_date . '</td>
                                    
                                    
                                </tr>';
                                $r++;
                            }
                        } else { ?>
                            <tr>
                                <td colspan="7"
                                    class="dataTables_empty"><?= lang('no_data_available') ?></td>
                            </tr>
                        <?php } ?>
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
