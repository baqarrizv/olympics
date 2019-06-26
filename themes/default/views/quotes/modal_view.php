<div class="modal-dialog modal-lg no-modal-header">
    <div class="modal-content">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="fa fa-2x">&times;</i>
            </button> 
            <button type="button" class="btn btn-xs btn-default no-print pull-right" style="margin-right:15px;" onclick="window.print();">
                <i class="fa fa-print"></i> <?= lang('print'); ?>
            </button>
            <div class="text-center" style="margin-bottom:20px;">
                <h2>Purchase Order</h2>
            </div>
            <?php if ($logo) { ?>
                <div class="text-center">
                    <img src="<?= base_url() . 'assets/uploads/logos/' . $biller->logo; ?>"
                         alt="<?= $biller->company != '-' ? $biller->company : $biller->name; ?>">
                </div>
            <?php } $total = 0; foreach($order as $odr){ ?>
            <div class="well well-sm">
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        <?= lang("ref"); ?>: <?= $odr['reference']; ?><br>
                        <?= lang("date"); ?>: <?= $this->sma->hrld($odr['ord_date']); ?><br>
                        
                    </p>
                    </div>
                    <div class="col-xs-7 text-right">
                        <?php $br = $this->sma->save_barcode($odr['reference'], 'code128', 70, false); ?>
                        <img src="<?= base_url() ?>assets/uploads/barcode<?= $this->session->userdata('user_id') ?>.png"
                             alt="<?= $odr['reference'] ?>"/>
                        <?php $this->sma->qrcode('link', urlencode(site_url('quotes/view/' . $odr['order_no'])), 2); ?>
                        <img src="<?= base_url() ?>assets/uploads/qrcode<?= $this->session->userdata('user_id') ?>.png"
                             alt="<?= $odr['reference'] ?>"/>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="row" style="margin-bottom:15px;">
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Supplier Name"); ?>:
                    <h2 style="margin-top:10px;"><?= $odr['supp_name']; ?></h2>

                    <?php
                    $total = $odr['OrderQty'];
                    echo lang("Location") . ": " . $odr['location_name'] . "<br>" . lang("Sum of qty") . ": " . $odr['OrderQty'];
                    
                    ?>
                </div>
                <div class="col-xs-6">
                    <?php echo $this->lang->line("Supplier's Reference"); ?>:<br/>
                    <h2 style="margin-top:10px;"><?= $odr['requisition_no']; ?></h2>

                </div>
            </div>
        <?php } ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped print-table order-table">

                    <thead>

                    <tr>
                        <th><?= lang("#"); ?></th>
                        <th><?= lang("item_code"); ?></th>
                        <th><?= lang("description"); ?></th>
                        <th><?= lang("unit"); ?></th>
                        <th><?= lang("Quantity Ordered"); ?></th>
                    </tr>

                    </thead>

                    <tbody>

                    <?php $r = 1;
                    
                    foreach ($details as $row):
                    ?>
                        <tr>
                            <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                            <td style="vertical-align:middle;">
                                <?= $row['item_code']; ?>
                            </td>
                            <td style="vertical-align:middle;">
                                <?= $row['description']; ?>
                            </td>
                            <td style="width: 80px; text-align:center; vertical-align:middle;">
                                <?= $row['units']; ?></td>
                            <td style="text-align:right; width:180px;">
                                <?= $this->sma->formatQuantity($row['quantity_ordered']); ?>
                            </td>
                        </tr>
                        <?php
                        $r++;
                    endforeach;
                    ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5"
                            style="text-align:right; font-weight:bold;"><?= lang("Total Qty"); ?>
                            (<?= $total; ?>)
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <div class="well well-sm">
                        <p class="bold"><?= lang("note"); ?>:</p>
                        <div><?= $order[0]['comments'] ?></div>
                    </div>
                </div>
            </div>
                <div class="buttons">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <a href="<?= site_url('purchases/po_recieve/' . $order[0]['order_no']) ?>" class="tip btn btn-primary" title="<?= lang('create_sale') ?>">
                                <i class="fa fa-heart"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('Create GRN') ?></span>
                            </a>
                        </div>
                       
                        <div class="btn-group">
                            <a href="<?= site_url('quotes/email/' . $inv->id) ?>" data-toggle="modal" data-target="#myModal2" class="tip btn btn-primary" title="<?= lang('email') ?>">
                                <i class="fa fa-envelope-o"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('email') ?></span>
                            </a>
                        </div>
                        <div class="btn-group">
                            <a href="<?= site_url('quotes/pdf/' . $inv->id) ?>" class="tip btn btn-primary" title="<?= lang('download_pdf') ?>">
                                <i class="fa fa-download"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('pdf') ?></span>
                            </a>
                        </div>
                    </div>
                </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready( function() {
        $('.tip').tooltip();
    });
</script>
