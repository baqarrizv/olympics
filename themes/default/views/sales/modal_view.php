<div class="modal-dialog modal-lg no-modal-header">
    <div class="modal-content">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="fa fa-2x">&times;</i>
            </button>
            <button type="button" class="btn btn-xs btn-default no-print pull-right" style="margin-right:15px;" onclick="window.print();">
                <i class="fa fa-print"></i> <?= lang('print'); ?>
            </button>
            <?php foreach($order as $odr): $id = $odr->order_no;?>
            <div class="well well-sm">
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        <?= lang("date"); ?>: <?= $this->sma->hrld($odr->ord_date); ?><br>
                        <?= lang("ref"); ?>: <?= $odr->reference; ?><br>
                    </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>

            <div class="row" style="margin-bottom:15px;">
                <div class="col-xs-6">
                   <p>Customer Name</p>
                   <h4><?=$odr->deb_name?></h4> <br>
                   <p>Delivery Date</p> 
                   <h4><?=$odr->delivery_date?></h4>
                </div>
                <div class="col-xs-6">
                    <p>Customer Ref</p> 
                   <h4><?=$odr->customer_ref?></h4> <br>
                   <p>Deliver To</p> 
                   <h4><?=$odr->deliver_to?></h4>

                </div>
            </div>
            <div class="well well-sm">
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        Delivery Address
                    </p>
                    <p><?=$odr->delivery_address?></p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="row bold">
                    <div class="col-xs-5">
                    <p class="bold">
                        Comments
                    </p>
                    <p><?=$odr->comments?></p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <?php endforeach; ?>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped print-table order-table">

                    <thead>

                    <tr>
                        <th><?= lang("item Code"); ?></th>
                        <th><?= lang("description"); ?></th>
                        <th><?= lang("Ordered"); ?></th>
                        <th><?= lang("Units"); ?></th>
                    </tr>

                    </thead>

                    <tbody>

                    <?php $r = 1;
                    $tax_summary = array();
                    foreach ($rows as $row):
                    ?>
                       <tr>
                           <td><?=$row->stk_code?></td>
                           <td><?=$row->description?></td>
                           <td><?=$row->quantity?></td>
                           <td><?=$row->units?></td>
                       </tr>
                        <?php
                        $r++;
                    endforeach;
                  
                    ?>
                    </tbody>
                </table>
            </div>

            <?php if (!$Supplier || !$Customer) { ?>
                <div class="buttons">
                    <div class="btn-group btn-group-justified">
                        <div class="btn-group">
                            <a href="<?= site_url('sales/delivery/' . $id) ?>" class="tip btn btn-primary" >
                                <i class="fa fa-dollar"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('Delivery against this order') ?></span>
                            </a>
                        </div>
                        <?php if ($inv->attachment) { ?>
                            <div class="btn-group">
                                <a href="<?= site_url('welcome/download/' . $inv->attachment) ?>" class="tip btn btn-primary" title="<?= lang('attachment') ?>">
                                    <i class="fa fa-chain"></i>
                                    <span class="hidden-sm hidden-xs"><?= lang('attachment') ?></span>
                                </a>
                            </div>
                        <?php } ?>
                        <div class="btn-group">
                            <a href="<?= site_url('sales/email/' . $inv->id) ?>" data-toggle="modal" data-target="#myModal2" class="tip btn btn-primary" title="<?= lang('email') ?>">
                                <i class="fa fa-envelope-o"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('email') ?></span>
                            </a>
                        </div>
                        <div class="btn-group">
                            <a href="<?= site_url('sales/pdf/' . $inv->id) ?>" class="tip btn btn-primary" title="<?= lang('download_pdf') ?>">
                                <i class="fa fa-download"></i>
                                <span class="hidden-sm hidden-xs"><?= lang('pdf') ?></span>
                            </a>
                        </div>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready( function() {
        $('.tip').tooltip();
    });
</script>
