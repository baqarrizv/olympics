<style>
#chartdiv {
  width: 100%;
  height: 500px;
}

</style>
 <div class="box" style="margin-bottom: 15px;">
    <div class="box-header">
        <h2 class="blue"><i class="fa-fw fa fa-bar-chart-o"></i><?= lang('Analytics'); ?></h2>
    </div>
    <div class="box-content">
        <div class="form-group">
                <div class="row">
                    <div class="col-md-6">
                        <label class="control-label" for="location"><?php echo $this->lang->line("Location"); ?>
                        </label>
                        <?php
                        $ct[''] = '';
                        foreach ($cities as $city) {
                            $ct[$city->id] = $city->city_name;
                        }
                        echo form_dropdown('location', $ct, (isset($_POST['location']) ? $_POST['location'] : ($product ? $product->category_id : '')), 'class="form-control select" id="location" placeholder="' . lang("select") . " " . lang("location") . '" required="required" style="width:100%"')

                        
                        ?>
                        <input type="hidden" name="price" value="" id="price">
                    </div>

                    <div class="col-md-6">
                        <label class="control-label" for="warehouse"><?php echo $this->lang->line("Warehouses"); ?>
                        </label>
                        <select class="form-control" name="warehouse" id="warehouse">
                            
                        </select>
                        
                    </div>
                </div>
            </div>
        <div class="row">
            <div class="col-md-12">
            
            <!-- HTML -->
            <div id="chart-container" class="text-center"></div>
                               
                <p class="text-center"><?= lang("chart_lable_toggle"); ?></p>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
    $(document).ready(function() {
        $('#location').change(function(event) {
            let id = $(this).val();
            $.ajax({
                url: '<?=base_url()?>welcome/getWareHouseByCity',
                type: 'GET',
                dataType: 'JSON',
                data: {id: id},
            })
            .done(function(data) {
                let html = "<option selected disabled>Select Warehouse</option>";
                $.each(data, function(index, val) {
                    html += "<option value='"+val.id+"'>"+val.name+"</option>"
                });
                $('#warehouse').html('');
                $('#warehouse').append(html);
            })
            .fail(function() {

                console.log("error");
            });
            
        });

        $('#warehouse').change(function(event) {
            let id = $(this).val();
            $.ajax({
                url: '<?=base_url()?>products/getSilosByLocation',
                type: 'GET',
                dataType: 'JSON',
                data: {id: id},
            })
            .done(function(data) {
                let html = '';
                let src = '';
                let calPercent = 0;
                
                $.each(data.silos, function(index, val) {
                    let products = '';
                    let v_qty = val.qty==null ? 0 : Math.round(val.qty.replace(/,/g, ''));
                    let v_cap = val.capacity==null ? 0 : Math.round(val.capacity.replace(/,/g, ''));


                    let minusPercent = v_cap - v_qty;
                    let dividePercent = minusPercent / v_cap;
                    let multiply = dividePercent * 100;
                    calPercent = 100 - Math.round(multiply);
                 
                    // console.log(val.location_name+ "  " +v_cap);
                    // console.log(val.location_name+ "  " +v_qty);

                    console.log(calPercent);

                    html += "<div class='col-md-3'>";
                    html += "<strong class='row'>"+val.location_name+"</strong>";
                    switch(true) {

                    case calPercent == 0:
                        src = "0.png";
                        break;
                    case calPercent <= 10:
                        src = "10.png";
                        break;
                    case calPercent <= 20:
                        src = "20.png";
                        break;
                    case calPercent <= 30:
                        src = "30.png";
                        break;
                    case calPercent <= 40: 
                        src = "40.png";
                        break;
                    case calPercent <= 50:
                        src = "50.png";
                        break;
                    case calPercent <= 60:
                        src = "60.png";
                        break;
                    case calPercent <= 70:
                        src = "70.png";
                        break;
                    case calPercent <= 80:
                        src = "80.png";
                        break;
                    case calPercent <= 90:
                        src = "90.png";
                        break;
                    case calPercent <= 100:
                        src = "100.png";
                        break;
                        
                    default:
                        src = "0.png";
                    }

                    $.each(data.loc_stock, function(indx, v) {

                        if (val.loc_code == v.loc_code)
                        {
                            products += v.description+', ';
                        }

                    });
                    html += "<image src='<?=base_url()?>assets/images/tank_chart/"+src+"' width='110' data-toggle='popover' title='Product List' data-content='"+products+"'/>";
                    html += "<strong class='row text-center'>Level: "+calPercent+"%</strong>";
                    html += "</div>";
                });
                
                $('#chart-container').html(html);
                
            })
            .fail(function() {
                console.log("error");
            });
            
        });
    });
</script>


<script>

</script>
