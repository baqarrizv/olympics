<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i>
            </button>
            <h4 class="modal-title" id="myModalLabel"><?php echo lang('add_warehouse'); ?></h4>
        </div>
        <?php $attrib = array('data-toggle' => 'validator', 'role' => 'form');
        echo form_open_multipart("system_settings/add_warehouse", $attrib); ?>
        <div class="modal-body">
            <p><?= lang('enter_info'); ?></p>

            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="code"><?php echo $this->lang->line("Warehouse Location Code"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('code', '', 'class="form-control" id="code" required="required"'); ?> 
                        </div>
                    </div>

                    <div class="col-md-6">
                        <label class="control-label" for="title"><?php echo $this->lang->line("Warehouse Title"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('title', '', 'class="form-control" id="title" required="required"'); ?> 
                        </div>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="location"><?php echo $this->lang->line("Warehouse Location"); ?>
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
                        <label class="control-label" for="contact"><?php echo $this->lang->line("Warehouse Contact"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('contact', '', 'class="form-control" id="contact" required="required"'); ?> 
                        </div>
                    </div>
                </div>
            </div>




            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="email"><?php echo $this->lang->line("Warehouse Email"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('email', '', 'class="form-control" id="email" required="required"'); ?> 
                        </div>
                    </div>


                    <div class="col-md-6">
                        <label class="control-label" for="contactPerson"><?php echo $this->lang->line("Warehouse Contact Person"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('contactPerson', '', 'class="form-control" id="contactPerson" required="required"'); ?> 
                        </div>
                    </div>

                </div>
            </div>


            <div class="form-group">
                <label class="control-label" for="address"><?php echo $this->lang->line("address"); ?></label>

                <div
                    class="controls"> <?php echo form_textarea('address', '', 'class="form-control" id="address" required="required"'); ?> </div>
            </div>


            
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="name"><?php echo $this->lang->line("Name/Designation"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('name', '', 'class="form-control" id="name" required="required"'); ?> 
                        </div>
                    </div>


                    <div class="col-md-6">
                        <label class="control-label" for="phoneOrEmail"><?php echo $this->lang->line("Contact: Phone/Email"); ?>
                        </label>
                        <div class="controls"> <?php echo form_input('phoneOrEmail', '', 'class="form-control" id="phoneOrEmail" required="required"'); ?> 
                        </div>
                    </div>

                </div>
            </div>




            <div class="form-group">
                <?= lang("warehouse_map", "image") ?>
                <input id="image" type="file" data-browse-label="<?= lang('browse'); ?>" name="userfile" data-show-upload="false" data-show-preview="false"
                       class="form-control file">
            </div>
            <div class="form-group">
                <?= lang('Parent', 'Parent'); ?>
                <select name="parent_id" class="tip form-control">
                    <option value="0">Select Parent</option>
                    <?php
                        foreach ($warehouses as $ware) {
                    		echo '<option value="'.$ware['id'].'">'.$ware['name'].'</option>';
                    	}
                    ?>
                </select>
                                
                            </div>
        </div>
        <div class="modal-footer">
            <?php echo form_submit('add_warehouse', lang('add_warehouse'), 'class="btn btn-primary"'); ?>
        </div>
    </div>
    <?php echo form_close(); ?>
</div>
<script type="text/javascript" src="<?= $assets ?>js/custom.js"></script>
<?= $modal_js ?>
