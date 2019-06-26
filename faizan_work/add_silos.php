<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_silos'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open_multipart("system_settings/add_silos", $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="warehouse"><?php echo $this->lang->line("Select Warehouse"); ?>
                        </label>
                        <select name="parent_id" class="tip form-control">
                            <option value="0">Select Warehouse</option>
                            <?php
                                foreach ($warehouses as $ware) {
                                    echo '<option value="'.$ware['id'].'">'.$ware['name'].'</option>';
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-6">
                        <label class="control-label" for="location"><?php echo $this->lang->line("Reservoir/Silos/Tanks Location"); ?>
                        </label>
                        <select name="city" class="tip form-control">
                            <option value="0">Select Location</option>
                            <?php
                                foreach ($city as $c) {
                                    echo '<option value="'.$c['id'].'">'.$c['city_name'].'</option>';
                                }
                            ?>
                        </select>
                    </div>

                    <div class="col-md-6">
                        <label class="control-label" for="tankCode"><?php echo $this->lang->line("Reservoir/Silos/Tanks Code"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('tankCode', '', 'class="form-control" id="tankCode" required="required"'); ?> 
                        </div>
                    </div>
                </div>
            </div>




        </div>
        <div class="modal-footer">
            <?php echo form_submit('add_silos', lang('add_silos'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
