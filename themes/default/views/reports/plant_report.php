<div class="box">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-heart"></i><?= lang('Plant Report'); ?> 
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
    <?php
        $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open("reports/plant_report", $attrib)
    ?>
            <div class="col-lg-3">
                 <label>Select Location</label>
                <?php
                $wh[''] = '';
                foreach ($citites as $city) {
                    $ct[$city->id] = $city->city_name;
                }
                echo form_dropdown('city', $ct, (isset($_POST['city']) ? $_POST['city'] : $Settings->default_city), 'id="city" class="whouse form-control input-tip select" data-placeholder="' . lang("select") . '" required="required" style="width:100%;" ');
                ?>
                    
            </div>
            <div class="col-lg-3">
                <label>Select Plant</label>
                <?php
                $wh[''] = '';
                foreach ($warehouses as $warehouse) {
                    $wh[$warehouse->loc_code] = $warehouse->location_name;
                }
                echo form_dropdown('warehouse', $wh, (isset($_POST['warehouse']) ? $_POST['warehouse'] : $Settings->default_warehouse), 'id="powarehouse" class="whouse form-control input-tip select" data-placeholder="' . lang("select") . '" required="required" style="width:100%;" ');
                ?>
            </div>
            <div class="col-lg-3">
                <label>Select Product</label>
                <?php
                $wh[''] = '';
                foreach ($products as $product) {
                    $pr[$product->stock_id] = $product->description;
                }
                echo form_dropdown('product', $pr, (isset($_POST['product']) ? $_POST['product'] : $Settings->default_product), 'id="product" class="whouse form-control input-tip select" data-placeholder="' . lang("select") . '" required="required" style="width:100%;" ');
                ?>
            </div>
            <div class="col-lg-3">
                <button type="submit" class="btn btn-primary" style="margin-top: 30px;">Fetch</button>
            </div>
    <?= form_close(); ?>
            <div class="col-lg-12">
               
                <div class="clearfix"></div>
                <div class="table-responsive" style="margin-top: 20px;">
                    <table class="table table-bordered table-hover table-striped table-condensed reports-table" style="font-size: 11px;">
                        <thead>
                        <tr>
                            <th colspan="5">In Transit</th>  
                            <th colspan="6">Product Movement</th> 
                            <th colspan="5">physical stocks</th>
                            <th colspan="3">Books Stock</th>
                            <th>Inv Val</th>
                            <th>Trans Val</th>
                            <th>MAP</th>
                        </tr>
                        <tr>
                            <th>NAT</th>
                            <th>85F</th>
                            <th>MTon</th>
                            <th>Temp</th>
                            <th>Density</th>
                            <!-- Product Movement -->
                            <th>Type</th>
                            <th>NAT</th>
                            <th>85F</th>
                            <th>MTon</th>
                            <th>Temp</th>
                            <th>Density</th>
                            <!-- Physical -->
                            <th>NAT</th>
                            <th>85F</th>
                            <th>MTon</th>
                            <th>Temp</th>
                            <th>Density</th>
                            <!-- Book -->
                            <th>NAT</th>
                            <th>85F</th>
                            <th>MTon</th>
                            <!-- Inv val -->
                            <th>PKR</th>
                            <th>PKR</th>
                            <th>PKR</th>

                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach($movement as $row): ?>
                            <tr>
                                <td>
                                    <?php if($row->trans_type == "Transfer-In" || $row->trans_type == " Transfer-Out"){ echo $row->nat_qty; } ?>
                                <td>
                                    <?php if($row->trans_type == "Transfer-In" || $row->trans_type == " Transfer-Out"){ echo $row->f_qty; } ?>
                                </td>
                                <td>
                                    <?php if($row->trans_type == "Transfer-In" || $row->trans_type == " Transfer-Out"){ echo $row->m_ton_qty; } ?>
                                </td>
                                <td>
                                    <?php if($row->trans_type == "Transfer-In" || $row->trans_type == " Transfer-Out"){ echo $row->temp; } ?>
                                </td>
                                <td>
                                    <?php if($row->trans_type == "Transfer-In" || $row->trans_type == " Transfer-Out"){ echo $row->density; } ?>
                                </td>
                                <td><?=$row->type?></td>
                                <td><?=$row->nat_qty?></td>
                                <td><?=$row->f_qty?></td>
                                <td><?=$row->m_ton_qty?></td>
                                <td><?=$row->temp?></td>
                                <td><?=$row->density?></td>
                                
                                <td><?= $row->trans_type == "Daily Dip" ? $row->nat_qty : '' ?></td>
                                <td><?= $row->trans_type == "Daily Dip" ? $row->f_qty : '' ?></td>
                                <td><?= $row->trans_type == "Daily Dip" ? $row->m_ton_qty : '' ?></td>
                                <td><?= $row->trans_type == "Daily Dip" ? $row->temp : '' ?></td>
                                <td><?= $row->trans_type == "Daily Dip" ? $row->density : '' ?></td>

                                <td><?=$row->totalSum?></td>
                                <td></td>
                                <td></td>

                                <td><?=$row->inv_value?></td>
                                <td><?=$row->trans_value?></td>
                                <td><?=$row->map?></td>
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
