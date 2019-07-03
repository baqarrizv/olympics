
<div class="modal-dialog modal-xl" style="width: 1050px;">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('View Details'); ?></h4>
        </div>
        <div class="modal-body">
            
           <div class="table-responsive" style="margin: 20px">
            <table
                   class="table table-bordered table-hover table-striped table-condensed reports-table" id="tbl_products">
                <thead>
                <tr>
                    <th>S.No</th>
                    <th><?= lang("Product Code"); ?></th>
                    <th><?= lang("Product Title"); ?></th>
                    <th><?= lang("UoM"); ?></th>
                    <th><?= lang("Available Qty"); ?></th>
                    <!-- <th><?= lang("Booked Qty"); ?></th> -->
                    <th><?= lang("Location"); ?></th>
                    <th><?= lang("Warehouse"); ?></th>
                    <th><?= lang("Tank"); ?></th>
                </tr>
                </thead>
                <tbody>
                <?php
                $s = 1;
                foreach($details as $p){
                ?>
                <tr>
                   <td><?= $s; ?></td>
                   <td><?= $p->stock_id ?></td>
                   <td><?= $p->description ?></td>
                   <td><?= $p->units ?></td>
                   <td><?= $p->qty ?></td>
                   <!-- <td>0</td> -->
                   <td><?= $p->city_name ?></td>
                   <td><?= $p->warehouse ?></td>
                   <td><?= $p->location_name ?></td>
                </tr>
                <?php
                $s++;
                }   
                ?>

                </tbody>
            </table>
          </div>
        </div>
        <div class="modal-footer">
        </div>
    </div>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
