<div class="container">
	<div class="row">
		<div class="col-md-12">
			<h2 class="text-center">Add City</h2>
		</div>
		 <?php
                $attrib = array('data-toggle' => 'validator', 'role' => 'form');
                echo form_open("city/add", $attrib)
                ?>
			<div class="col-md-4" style="margin-top: 20px">
				<label class="control-label" for="code"><?php echo $this->lang->line("City Code"); ?>
	            </label>
	            <div class="controls"> <?php echo form_input('code', '', 'class="form-control" id="code" required="required"'); ?> 
	            </div>
			</div>

			<div class="col-md-4" style="margin-top: 20px">
				<label class="control-label" for="name"><?php echo $this->lang->line("City Name"); ?>
	            </label>
	            <div class="controls"> <?php echo form_input('name', '', 'class="form-control" id="name" required="required"'); ?> 
	            </div>
			</div>


			<div class="col-md-4" style="margin-top: 51px">
				<button type="submit" class="btn btn-sm btn-primary"> Add </button>
			</div>
		 <?php echo form_close(); ?>
	</div>
</div>