
<?= form_open('system_settings/warehouse_actions', 'id="action-form"') ?>
<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-building-o"></i><?= $page_title ?></h2>

        <div class="box-icon">
            <ul class="btn-tasks">
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon fa fa-tasks tip"
                                                                                  data-placement="left"
                                                                                  title="<?= lang("actions") ?>"></i></a>
                    <ul class="dropdown-menu pull-right tasks-menus" role="menu" aria-labelledby="dLabel">
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

                <p class="introtext"><?php echo $this->lang->line("list_results"); ?></p>

                <div class="table-responsive">
                    <table id="CURData" class="table table-bordered table-hover table-striped table-condensed">
                        <thead>
                        <tr>
                            <th><?php echo $this->lang->line("Product"); ?></th>
                            <th><?php echo $this->lang->line("Unit"); ?></th>
                            <th><?php echo $this->lang->line("Location"); ?></th>
                            <th><?php echo $this->lang->line("NAT"); ?></th>
                            <th><?php echo $this->lang->line("Temp"); ?></th>
                            <th><?php echo $this->lang->line("Density"); ?></th>
                            <th><?php echo $this->lang->line("85F"); ?></th>
                            <th><?php echo $this->lang->line("M.Tonn"); ?></th>
                            <th><?php echo $this->lang->line("Qty In"); ?></th>
                            <th><?php echo $this->lang->line("Qty Out"); ?></th>
                           
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($transfers as $transfer) {
                            ?>
                            <tr>
                                <td><?= $transfer->description ?></td>
                                <td><?= $transfer->units ?></td>
                                <td><?= $transfer->location_name ?></td>
                                <td><?= $transfer->nat_qty ?></td>
                                <td><?= $transfer->temp ?></td>
                                <td><?= $transfer->density ?></td>
                                <td><?= $transfer->f_qty ?></td>
                                <td><?= $transfer->m_ton_qty ?></td>
                                <td><?= $transfer->qty < 0 ? '' : $transfer->qty; ?></td>
                                <td><?= $transfer->qty < 0 ? $transfer->qty : '' ?></td>
                            </tr>
                            <?php } ?>

                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>

<div style="display: none;">
    <input type="hidden" name="form_action" value="" id="form_action"/>
    <?= form_submit('submit', 'submit', 'id="action-form-submit"') ?>
</div>
<?= form_close() ?>
<script language="javascript">
    $(document).ready(function () {

        $('#CURData').DataTable();

        $('#delete').click(function (e) {
            e.preventDefault();
            $('#form_action').val($(this).attr('data-action'));
            $('#action-form-submit').trigger('click');
        });

        $('#excel').click(function (e) {
            e.preventDefault();
            $('#form_action').val($(this).attr('data-action'));
            $('#action-form-submit').trigger('click');
        });

        $('#pdf').click(function (e) {
            e.preventDefault();
            $('#form_action').val($(this).attr('data-action'));
            $('#action-form-submit').trigger('click');
        });

    });
</script>

