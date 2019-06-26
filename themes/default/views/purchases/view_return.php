<div class="modal-dialog modal-lg no-modal-header">
    <div class="modal-content">
        <div class="modal-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                <i class="fa fa-2x">&times;</i>
            </button>
            <button type="button" class="btn btn-xs btn-default no-print pull-right" style="margin-right:15px;" onclick="window.print();">
                <i class="fa fa-print"></i> <?= lang('print'); ?>
            </button>
            <?php if ($logo) { ?>
            <div class="text-left" style="margin-bottom:20px;">
                <img src="<?= base_url() . 'assets/uploads/logos/' . $Settings->logo; ?>"
                alt="<?= $Settings->site_name; ?>">
            </div>
            <?php } ?>

            <div class="row">
                <div class="col-lg-12">

                    <div class="well well-sm">
                        <div class="row bold">
                            <div class="col-xs-5">
                                <p class="bold">
                                    <?= lang("ref"); ?>: <?= $inv->reference_no; ?><br>
                                    <?php if ($purchase) { ?><p style="font-weight:bold;"><?= lang("purchase_reference"); ?>
                                        : <?= $purchase->reference_no; ?></p><?php } ?>
                                        <p style="font-weight:bold;"><?= lang("date"); ?>: <?= $this->sma->hrld($inv->date); ?></p>
                                    </p>
                                </div>

                                <div class="col-xs-7 text-right">
                                    <?php $br = $this->sma->save_barcode($inv->reference_no, 'code128', 70, false); ?>
                                    <img src="<?= base_url() ?>assets/uploads/barcode<?= $this->session->userdata('user_id') ?>.png"
                                    alt="<?= $inv->reference_no ?>"/>
                                    <?php $this->sma->qrcode('link', urlencode(site_url('purchases/view_return/' . $inv->id)), 2); ?>
                                    <img src="<?= base_url() ?>assets/uploads/qrcode<?= $this->session->userdata('user_id') ?>.png"
                                    alt="<?= $inv->reference_no ?>"/>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <div class="col-xs-5">
                            <?= lang('from'); ?>:
                            <h2 style="margin-top:10px;"><?= $Settings->site_name; ?></h2>
                            <?= $warehouse->name ?>

                            <?php
                            echo $warehouse->address . "<br>";
                            echo ($warehouse->phone ? lang("tel") . ": " . $warehouse->phone . "<br>" : '') . ($warehouse->email ? lang("email") . ": " . $warehouse->email : '');
                            ?>

                        </div>

                        <div class="col-xs-6">

                            <?= lang('to'); ?>:
                            <h2 style="margin-top:10px;"><?= $supplier->company != '-' ? $supplier->company : $supplier->name; ?></h2>
                            <?= $supplier->company ? "" : "Attn: " . $supplier->name ?>

                            <?php
                            echo $supplier->address . "<br>" . $supplier->city . " " . $supplier->postal_code . " " . $supplier->state . "<br>" . $supplier->country;

                            echo "<p>";

                            if ($supplier->vat_no != "-" && $supplier->vat_no != "") {
                                echo "<br>" . lang("vat_no") . ": " . $supplier->vat_no;
                            }
                            if ($supplier->cf1 != "-" && $supplier->cf1 != "") {
                                echo "<br>" . lang("scf1") . ": " . $supplier->cf1;
                            }
                            if ($supplier->cf2 != "-" && $supplier->cf2 != "") {
                                echo "<br>" . lang("scf2") . ": " . $supplier->cf2;
                            }
                            if ($supplier->cf3 != "-" && $supplier->cf3 != "") {
                                echo "<br>" . lang("scf3") . ": " . $supplier->cf3;
                            }
                            if ($supplier->cf4 != "-" && $supplier->cf4 != "") {
                                echo "<br>" . lang("scf4") . ": " . $supplier->cf4;
                            }
                            if ($supplier->cf5 != "-" && $supplier->cf5 != "") {
                                echo "<br>" . lang("scf5") . ": " . $supplier->cf5;
                            }
                            if ($supplier->cf6 != "-" && $supplier->cf6 != "") {
                                echo "<br>" . lang("scf6") . ": " . $supplier->cf6;
                            }

                            echo "</p>";
                            echo lang("tel") . ": " . $supplier->phone . "<br>" . lang("email") . ": " . $supplier->email;
                            ?>
                        </div>

                        <div class="clearfix"></div>

                        <div class="table-responsive" style="margin-top:15px;">
                            <table class="table table-bordered table-hover table-striped order-table">

                                <thead>

                                    <tr>
                                        <th><?= lang("no"); ?></th>
                                        <th><?= lang("description"); ?> (<?= lang("code"); ?>)</th>
                                        <th><?= lang("quantity"); ?></th>
                                        <th style="padding-right:20px;"><?= lang("unit_cost"); ?></th>
                            <!--<?php
                            if ($Settings->tax1) {
                                echo '<th style="padding-right:20px; text-align:center; vertical-align:middle;">' . lang("tax") . '</th>';
                            }
                            ?>-->
                            <?php
                            if ($Settings->product_discount && $inv->product_discount > 0) {
                                echo '<th style="padding-right:20px; text-align:center; vertical-align:middle;">' . lang("discount") . '</th>';
                            }
                            ?>
                            <th style="padding-right:20px;"><?= lang("subtotal"); ?></th>
                        </tr>

                    </thead>

                    <tbody>

                        <?php $r = 1;
                        foreach ($rows as $row):
                            ?>
                        <tr>
                            <td style="text-align:center; width:40px; vertical-align:middle;"><?= $r; ?></td>
                            <td style="vertical-align:middle;"><?= $row->product_name . " (" . $row->product_code . ")" . ($row->variant ? ' (' . $row->variant . ')' : ''); ?>
                                <?= $row->details ? '<br>' . $row->details : ''; ?></td>
                                <td style="width: 120px; text-align:center; vertical-align:middle;"><?= $this->sma->formatQuantity($row->quantity); ?></td>
                                <td style="text-align:right; width:150px; padding-right:10px;"><?= $this->sma->formatMoney($row->net_unit_cost + ($row->item_tax / $row->quantity)); ?></td>
                                <!--<?php
                                if ($Settings->tax1) {
                                    echo '<td style="width: 150px; text-align:right; vertical-align:middle;">' . ($row->item_tax != 0 ? '<small>('.$row->tax.')</small>' : '') . ' ' . $this->sma->formatMoney($row->item_tax) . '</td>';
                                }
                                ?>-->
                                <?php
                                if ($Settings->product_discount && $inv->product_discount > 0) {
                                    echo '<td style="width: 150px; text-align:right; vertical-align:middle;">' . ($row->item_discount != 0 ? '<small>('.$row->discount.')</small>' : '') . ' ' . $this->sma->formatMoney($row->item_discount) . '</td>';
                                }
                                ?>
                                <td style="text-align:right; width:120px; padding-right:10px;"><?= $this->sma->formatMoney($row->subtotal); ?></td>
                            </tr>
                            <?php
                            $r++;
                            endforeach;
                            ?>
                        </tbody>
                        <tfoot>
                            <?php
                            $col = 4;
                            if ($Settings->product_discount && $inv->product_discount > 0) {
                                $col += 1;
                            }
                            ?>

                            <tr>
                                <td colspan="<?= $col; ?>"
                                    style="text-align:right; padding-right:10px;"><?= lang("total"); ?>
                                    (<?= $default_currency->code; ?>)
                                </td>
                                <td style="text-align:right; padding-right:10px;"><?= $this->sma->formatMoney($inv->total + $inv->product_tax); ?></td>
                            </tr>
                            <?php if ($inv->product_discount != 0) {
                                echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . lang("product_discount") . ' (' . $default_currency->code . ')</td><td style="text-align:right; padding-right:10px;">' . $this->sma->formatMoney($inv->product_discount) . '</td></tr>';
                            } ?>
                        <!--<?php if ($Settings->tax1 && $inv->product_tax != 0) {
                            echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . lang("product_tax") . ' (' . $default_currency->code . ')</td><td style="text-align:right; padding-right:10px;">' . $this->sma->formatMoney($inv->product_tax) . '</td></tr>';
                        } ?>-->
                        <?php if ($inv->order_discount != 0) {
                            echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . lang("order_discount") . ' (' . $default_currency->code . ')</td><td style="text-align:right; padding-right:10px;">' . $this->sma->formatMoney($inv->order_discount) . '</td></tr>';
                        } ?>
                        <?php if ($Settings->tax2 && $inv->order_tax != 0) {
                            echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . lang("order_tax") . ' (' . $default_currency->code . ')</td><td style="text-align:right; padding-right:10px;">' . $this->sma->formatMoney($inv->order_tax) . '</td></tr>';
                        } ?>
                        <?php if ($inv->surcharge != 0) {
                            echo '<tr><td colspan="' . $col . '" style="text-align:right; padding-right:10px;;">' . lang("surcharge") . ' (' . $default_currency->code . ')</td><td style="text-align:right; padding-right:10px;">' . $this->sma->formatMoney($inv->surcharge) . '</td></tr>';
                        } ?>
                        <tr>
                            <td colspan="<?= $col; ?>"
                                style="text-align:right; padding-right:10px; font-weight:bold;"><?= lang("total_amount"); ?>
                                (<?= $default_currency->code; ?>)
                            </td>
                            <td style="text-align:right; padding-right:10px; font-weight:bold;"><?= $this->sma->formatMoney($inv->grand_total); ?></td>
                        </tr>

                    </tfoot>
                </table>

            </div>

            <div class="row">
                <div class="col-xs-7">
                    <?php if ($inv->note || $inv->note != "") { ?>
                    <div class="well well-sm">
                        <p class="bold"><?= lang("note"); ?>:</p>

                        <div><?= $this->sma->decode_html($inv->note); ?></div>
                    </div>
                    <?php } ?>
                </div>

                <div class="col-xs-4 col-xs-offset-1">
                    <div class="well well-sm">
                        <p><?= lang("created_by"); ?>: <?= $user->first_name . ' ' . $user->last_name; ?> </p>

                        <p><?= lang("date"); ?>: <?= date($dateFormats['php_ldate'], strtotime($inv->date)); ?></p>
                        <?php if ($inv->updated_by) { ?>
                        <p><?= lang("updated_by"); ?>: <?php $inv->updated_by; ?></p>
                        <p><?= lang("update_at"); ?>
                            : <?= date($dateFormats['php_ldate'], strtotime($inv->updated_at)); ?></p>
                            <?php } ?>
                        </div>

                    </div>
                </div>


            </div>
        </div>

    </div>
</div>
</div>
