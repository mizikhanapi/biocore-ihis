<%-- 
    Document   : maternityUnit
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Labour Summary</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6 soap-select" style="padding-right: 0px;">
            <select class="form-control" id="LS_viewBy">
                <option value="all" selected disabled>View by</option>
                <option value="all">All</option>
                <option value="0">Today</option>
                <option value="1">Yesterday</option>
                <option value="7">7 Days</option>
                <option value="30">30 Days</option>
                <option value="60">60 Days</option>
                <option value="x">Select date</option>
            </select>
        </div>
    </div>
    
    
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px">
        <div class="col-sm-12 form-inline" style="padding-right: 0px; display: none;" id="LS_div_selectDate">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="LS_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="text" class="form-control" id="LS_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div id="LS_viewDIv">
<!--    <div class="panel panel-default" id="LS_viewGroup">
        <div class="panel-heading clearfix"> 
            <p class="pull-right">
                <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close" title="Delete summary"><span aria-hidden="true"><i class="fa fa-times fa-lg"></i></span></button>
            </p>
             <h4>Summary Date:</h4>
        </div>
        
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-3">
                                    <dd>Labour Onset: <strong>Spontaneous</strong></dd>
                                    <dd>Delivery Date & Time: <strong>15/06/2017</strong> | <strong>10:43PM</strong></dd>
                                    <dd>Vaginal: <strong>Vaccum Delivery</strong></dd>
                                    <dd>Operative: <strong>Emergency</strong></dd>
                                </div>
                               
                                <div class="col-xs-3">
                                    <dt>3rd Stage:</dt>
                                    <dd>Blood loss: <strong>10 ml</strong></dd>
                                    <dd>Placenta: <strong>Complete</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dt>Other:</dt>
                                    <dd>Cord Round Neck:<strong>None</strong></dd>
                                    <dd>Episiotomy/tear: <strong>Tear</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dt>Repaired by:</dt>
                                    <dd>8 stich</dd>
                                </div>
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_labourUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <table class="table table-bordered">
                        <tr>
                            <th></th>
                            <th>Labour Begin</th>
                            <th>Membranes<br>Ruptured</th>
                            <th>Second stage at Labour</th>
                            <th>Child Born</th>
                            <th>Placenta Expelled</th>
                            <th>Stages of Labour (hrs. Mins.)</th>
                        </tr>
                        <tr>
                            <td rowspan="2">Date</td>
                            <td rowspan="2">begin date</td>
                            <td rowspan="2">membrane date</td>
                            <td rowspan="2">second date</td>
                            <td rowspan="2">born date</td>
                            <td rowspan="2">placenta date</td>
                            <td>1st.</td>
                        </tr>
                        <tr>
                            <td>2nd.</td>
                        </tr>
                        <tr>
                            <td rowspan="2">Time</td>
                            <td rowspan="2">begin time</td>
                            <td rowspan="2">membrane time</td>
                            <td rowspan="2">second time</td>
                            <td rowspan="2">born time</td>
                            <td rowspan="2">placenta time</td>
                            <td>3rd.</td>
                        </tr>
                        <tr>
                            <td>Total: </td>
                        </tr>
                    </table>
                    <div class="pull-right">
                        <a style="vertical-align: middle; cursor: pointer" id="LS_stageUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-4">
                                    <dt style="font-size: 18px;">Delivery Event</dt>
                                </div>
                                <div class="col-xs-4">
                                    <dd>Conducted by: <strong>Someone</strong></dd>
                                </div>
                                <div class="col-xs-4">
                                    <dd>Witnessed by: <strong>Someone</strong></dd>
                                </div>
                                
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_eventUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div> 

            <ul class="soap-content nav">
                <li><a style="cursor: pointer;" id="LS_infantAddModal"><i class="fa fa-comments  fa-li"></i>New Birth Record</a>
            </ul>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                           <div class="media">
                                <div class="col-xs-3">
                                    <dt style="font-size: 18px;">INFANT - Birth Record</dt>
                                    <dd>Alive?: <strong>Yes</strong></dd>
                                    <dd>Other: <strong>State your comments</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Infant Tag No.: <strong>00012</strong> | <strong>10:43PM</strong></dd>
                                    <dd>Date of Birth: <strong>15/06/2017</strong></dd>
                                    <dd>Time: <strong>3:59 PM</strong></dd>
                                    <dd>Sex: <strong>Male</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Birth Weight: <strong>36gms</strong></dd>
                                    <dd>Head Circumference: <strong>180cm</strong></dd>
                                    <dd>Apgar Score: 1 Min.: <strong>65</strong> | 5 Min.: <strong>75</strong> | 10 Min.: <strong>50</strong></dd>
                                    <dd>Length: <strong>500cm</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Cord Blood Collected: <strong>Yes</strong></dd>
                                    <dd>Vitamin K: <strong>Yes</strong> | Hepatitis B Vaccine: <strong>No</strong></dd>
                                    <dd>Foetal Abnormality: <strong>Normal</strong></dd>
                                </div>
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <a style="vertical-align: middle; cursor: pointer" id="LS_infantUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                    &nbsp;&nbsp;&nbsp;
                                    <a style="cursor: pointer;" id="LS_infantBtnDelete"><i class="fa fa-times fa-lg" aria-hidden="true" style="color: #d9534f;"></i></a>
                                </div>
                            </div>
                        </div> 
                    </div>  
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="media">
                                <div class="col-xs-3">
                                    <dt style="font-size: 18px;">MOTHER - Transfer Observations</dt>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Pulse: <strong>128</strong></dd>
                                    <dd>Blood Pressure: <strong>123</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Uterus: <strong>36gms</strong></dd>
                                    <dd>Perineum: <strong>180cm</strong></dd>
                                </div>
                                <div class="col-xs-3">
                                    <dd>Time: <strong>4:16 PM</strong></dd>
                                    <dd>Doctor/Nurse: <strong>Dr Mira Filzah</strong></dd>
                                </div>
                                <div style="position: absolute; bottom: 0px; right: 15px;">
                                    <a style="vertical-align: middle; cursor: pointer;" id="LS_transferUpdateModal"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style=" color: #337ab7;"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>  
                </div>
            </div> 
        </div>
    </div>-->
</div>



<jsp:include page="specialistTemplate/ONG/labourSummary-modal.jsp" />

<script type="text/javascript">
     //--- initialise datepicker for from ----
    $('#LS_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#LS_dateFrom').on('change', function(){
        
        $("#LS_dateTo" ).datepicker( "destroy" );
        $('#LS_dateTo').val('');
        var fromDate = $( "#LS_dateFrom" ).datepicker( "getDate" );
        
        $('#LS_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
    
    $('#LS_viewBy').on('change', function(){
        var howTo = $(this).val();

        if (howTo === 'x') {
            $('#LS_div_selectDate').show();
        } else {
            $('#LS_div_selectDate').hide();
            LS_loadData();
        }
    });
    
    //-------- init labour datetime picker
    initDatepicker("LS_labourDeliveryDate");
    initTimepicker("LS_labourDeliveryTime");
    
    initDatepicker("LS_stageBeginDate");
    initTimepicker("LS_stageBeginTime");
    
    initDatepicker("LS_stageMembraneDate");
    initTimepicker("LS_stageMembraneTime");
    
    initDatepicker("LS_stageSecondDate");
    initTimepicker("LS_stageSecondTime");
    
    initDatepicker("LS_stageBornDate");
    initTimepicker("LS_stageBornTime");
    
    initDatepicker("LS_stagePlacentaDate");
    initTimepicker("LS_stagePlacentaTime");
    
    initDatepicker("LS_infantBirthDate");
    initTimepicker("LS_infantBirthTime");
    
    initTimepicker("LS_transferTime");
    
    function LS_loadData(){
        var data = {
            day: $('#LS_viewBy').val(),
            from: $('#LS_dateFrom').val(),
            to: $('#LS_dateTo').val()
        };
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "specialistTemplate/ONG/LS_control/retrieveLabourSummary.jsp",
            success: function (data, textStatus, jqXHR) {
                $('#LS_viewDIv').html(data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#LS_viewDIv').html(errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
    
    //****************************************************************************** summary ****************************************************************
    
    function LS_labourCheckField(){
        var msg="";
        var isComplete = true;
        
        var deliveryDate = $('#LS_labourDeliveryDate').val();
        var deliveryTime = $('#LS_labourDeliveryTime').val();
        var labourOnset = $('#LS_labourOnset').val();
        var vaginal = $('#LS_labourVaginal').val();
        var operative = $('#LS_labourOperative').val();
        var bloodLoss = $('#LS_labourBloodLoss').val();
        var placenta = $('#LS_labourPlacenta').val();
        var cord = $('#LS_labourCord').val();
        var tear = $('#LS_labourTear').val();
        var repair = $('#LS_labourRepair').val();
        
        if(deliveryDate===""){
            isComplete=false;
            msg="Please choose delivery date";
        }
        else if(deliveryTime===""){
            isComplete=false;
            msg="Please choose delivery time";
        }
        else if(labourOnset==="" || labourOnset==null){
            isComplete=false;
            msg="Please choose labour onset.";
        }
        else if(vaginal==="" || vaginal==null){
            isComplete=false;
            msg="Please choose vaginal delivery.";
        }
        else if(operative==="" || operative==null){
            isComplete=false;
            msg="Please choose operative.";
        }
        else if(placenta==="" || placenta==null){
            isComplete=false;
            msg="Please choose placenta condition.";
        }
        else if(cord==="" || cord==null){
            isComplete=false;
            msg="Please choose cord condition.";
        }
        else if(tear==="" || tear ==null){
            isComplete=false;
            msg="Please choose tear condition.";
        }
        
        
        if(bloodLoss==="" || isNaN(bloodLoss)){
            $('#LS_labourBloodLoss').val("0");
        }
       
       if(!isComplete){
           bootbox.alert(msg);
       }
        
        return isComplete;        
    }
    
    //----------------- add labour----------------------------------
    $('#LS_labourModal').on('hidden.bs.modal', function (){
        
        $('#LS_labour_div_add').show();
        $('#LS_labour_div_update').hide();
        $('#LS_labourForm')[0].reset();
    });
    
    $('#LS_labourBtnAdd').on('click', function(){
        if(LS_labourCheckField()){
            var deliveryDate = $('#LS_labourDeliveryDate').val();
            var deliveryTime = $('#LS_labourDeliveryTime').val();
            var labourOnset = $('#LS_labourOnset').val();
            var vaginal = $('#LS_labourVaginal').val();
            var operative = $('#LS_labourOperative').val();
            var bloodLoss = $('#LS_labourBloodLoss').val();
            var placenta = $('#LS_labourPlacenta').val();
            var cord = $('#LS_labourCord').val();
            var tear = $('#LS_labourTear').val();
            var repair = $('#LS_labourRepair').val();
            
            repair = repair.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                deliveryDate : deliveryDate,
                deliveryTime : deliveryTime,
                labourOnset : labourOnset,
                vaginal : vaginal,
                operative : operative,
                bloodLoss : bloodLoss,
                placenta : placenta,
                cord : cord,
                tear : tear,
                repair : repair
            };
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/labourSummary_insert.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Labour Summary is inserted successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(deliveryDate);
                            $('#LS_dateTo').val(deliveryDate);
                            LS_loadData();
                            $('#LS_labourModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to insert labour summary.";
                        }
                        else{
                            message=data;
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        message="Oops! "+errorThrown;
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        bootbox.alert(message);
                    }
            });
        }
    });
    //==============================================================
    
     //-------------------update labour ------------------------
    $('#LS_viewDIv').on('click', '#LS_labourUpdateModal', function (){
        $('#LS_labourModal').modal('show');
        $('#LS_labour_div_add').hide();
        $('#LS_labour_div_update').show();
        var summaryDate =$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        var arrData = $(this).closest('div').find('#LS_labourHidden').val().split("|");
        
        $('#LS_labourDeliveryDate').val(arrData[1]);
        $('#LS_labourDeliveryTime').val(arrData[2]);
        $('#LS_labourOnset').val(arrData[3]);
        $('#LS_labourVaginal').val(arrData[4]);
        $('#LS_labourOperative').val(arrData[5]);
        $('#LS_labourBloodLoss').val(arrData[6]);
        $('#LS_labourPlacenta').val(arrData[7]);
        $('#LS_labourCord').val(arrData[8]);
        $('#LS_labourTear').val(arrData[9]);
        $('#LS_labourRepair').val(arrData[10]);
        
        $('#LS_labourModalID').val(summaryDate);
        
    });
    
    $('#LS_labourBtnUpdate').on('click', function(){
        if(LS_labourCheckField()){
            var deliveryDate = $('#LS_labourDeliveryDate').val();
            var deliveryTime = $('#LS_labourDeliveryTime').val();
            var labourOnset = $('#LS_labourOnset').val();
            var vaginal = $('#LS_labourVaginal').val();
            var operative = $('#LS_labourOperative').val();
            var bloodLoss = $('#LS_labourBloodLoss').val();
            var placenta = $('#LS_labourPlacenta').val();
            var cord = $('#LS_labourCord').val();
            var tear = $('#LS_labourTear').val();
            var repair = $('#LS_labourRepair').val();
            
            var summaryDate = $('#LS_labourModalID').val();
            
            repair = repair.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                deliveryDate : deliveryDate,
                deliveryTime : deliveryTime,
                labourOnset : labourOnset,
                vaginal : vaginal,
                operative : operative,
                bloodLoss : bloodLoss,
                placenta : placenta,
                cord : cord,
                tear : tear,
                repair : repair,
                summaryDate : summaryDate
            };
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/labourSummary_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Labour Summary is updated successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(deliveryDate);
                            $('#LS_dateTo').val(deliveryDate);
                            LS_loadData();
                            $('#LS_labourModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to update labour summary.";
                        }
                        else{
                            message=data;
                        }
                    },
                error: function (jqXHR, textStatus, errorThrown) {
                        message="Oops! "+errorThrown;
                    },
                complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                        bootbox.alert(message);
                    }
            });
        }
    });
    //========================================================
    
    //****************************************************************************** summary ****************************************************************
    
    //---------- update labour stage ------
    $('#LS_viewDIv').on('click', '#LS_stageUpdateModal', function (){
        $('#LS_stageModal').modal('show');
    });
    
    //===============================
    
   
     
    //---------- update labour event-----
    $('#LS_viewDIv').on('click', '#LS_eventUpdateModal', function (){
        $('#LS_eventModal').modal('show');
    });
    //===================================
    
    //--------------- add new infant ---------------------
    $('#LS_viewDIv').on('click', '#LS_infantAddModal', function (){
        $('#LS_infantModal').modal('show');
        $('#LS_infant_div_add').show();
        $('#LS_infant_div_update').hide();
        $('#LS_infantForm')[0].reset();
    });
    //====================================================
    
    //-------------------- update infant birth record ---------------------------
     $('#LS_viewDIv').on('click', '#LS_infantUpdateModal', function (){
        $('#LS_infantModal').modal('show');
        $('#LS_infant_div_add').hide();
        $('#LS_infant_div_update').show();
    });
    //=======================================================================
    
    
    //-------------------update mother transfer ---------------------
    $('#LS_viewDIv').on('click', '#LS_transferUpdateModal', function (){
        $('#LS_transferModal').modal('show');
    });
    //===============================================================
    
    
    
</script>