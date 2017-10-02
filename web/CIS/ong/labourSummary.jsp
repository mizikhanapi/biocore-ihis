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
    $(document).on('focus', ':input', function() {
        $(this).attr('autocomplete', 'off');
    });
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
    
    //****************************************************************************** ==summary== ****************************************************************
    
    //******************************************************** stage *****************************************************
    
    //---------- update labour stage ------
    $('#LS_viewDIv').on('click', '#LS_stageUpdateModal', function (){
        $('#LS_stageModal').modal('show');
        var arrTime = $(this).closest('div').find('#LS_theHiddenLabourTime').val().split("|");
        var arrDur = $(this).closest('div').find('#LS_theHiddenLabourDuration').val().split("|");
        var summaryDate =$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        
        $('#LS_stageModalID').val(summaryDate);
        $('#LS_stageBeginDate').val(arrTime[0]);
        $('#LS_stageBeginTime').val(arrTime[1]);
        $('#LS_stageMembraneDate').val(arrTime[2]);
        $('#LS_stageMembraneTime').val(arrTime[3]);
        $('#LS_stageSecondDate').val(arrTime[4]);
        $('#LS_stageSecondTime').val(arrTime[5]);
        $('#LS_stageBornDate').val(arrTime[6]);
        $('#LS_stageBornTime').val(arrTime[7]);
        $('#LS_stagePlacentaDate').val(arrTime[8]);
        $('#LS_stagePlacentaTime').val(arrTime[9]);
        
        $('#LS_stage1hour').val(arrDur[0]);
        $('#LS_stage1minute').val(arrDur[1]);
        $('#LS_stage2hour').val(arrDur[2]);
        $('#LS_stage2minute').val(arrDur[3]);
        $('#LS_stage3hour').val(arrDur[4]);
        $('#LS_stage3minute').val(arrDur[5]);
        
    });
    
    function LS_stageCheckField(){
        var isComplete=true;
        var msg="";
        
        var beginDate = $('#LS_stageBeginDate').val();
        var beginTime = $('#LS_stageBeginTime').val();
        var membraneDate = $('#LS_stageMembraneDate').val();
        var membraneTime=$('#LS_stageMembraneTime').val();
        var secondDate=$('#LS_stageSecondDate').val();
        var secondTime=$('#LS_stageSecondTime').val();
        var bornDate=$('#LS_stageBornDate').val();
        var bornTime=$('#LS_stageBornTime').val();
        var placentaDate=$('#LS_stagePlacentaDate').val();
        var placentaTime=$('#LS_stagePlacentaTime').val();
        
        var hour1=$('#LS_stage1hour').val();
        var minute1=$('#LS_stage1minute').val();
        var hour2=$('#LS_stage2hour').val();
        var minute2=$('#LS_stage2minute').val();
        var hour3 = $('#LS_stage3hour').val();
        var minute3=$('#LS_stage3minute').val();
        
        if(beginDate===""){
            isComplete=false;
            msg="Please choose labour begin date";
        }
        else if(beginTime===""){
            isComplete=false;
            msg="Please choose labour begin tme";
        }
        else if(membraneDate===""){
            isComplete=false;
            msg="Please choose membrane ruptured date";
        }
        else if(membraneTime===""){
            isComplete=false;
            msg="Please choose membrane ruptured time";
        }
        else if(secondDate===""){
            isComplete=false;
            msg="Please choose second stage date";
        }
        else if(secondTime===""){
            isComplete=false;
            msg="Pleae choose second stage time";
        }
        else if(bornDate===""){
            isComplete=false;
            msg="Pleae choose child born date";
        }
        else if(bornTime===""){
            isComplete=false;
            msg="Please choose child born time";
        }
        else if(placentaDate===""){
            isComplete=false;
            msg="Please choose placenta expelled date";
        }
        else if(placentaTime===""){
            isComplete=false;
            msg="Please choose placenta expelled time";
        }
        
        if(hour1==="" || isNaN(hour1)){
            $('#LS_stage1hour').val("0");
        }
        
        if(minute1==="" || isNaN(minute1)){
            $('#LS_stage1minute').val("0");
        }
        
        if(hour2==="" || isNaN(hour2)){
            $('#LS_stage2hour').val("0");
        }
        
        if(minute2==="" || isNaN(minute2)){
            $('#LS_stage2minute').val("0");
        }
        
        if(hour3==="" || isNaN(hour3)){
            $('#LS_stage3hour').val("0");
        }
        
        if(minute3==="" || isNaN(minute3)){
            $('#LS_stage3minute').val("0");
        }
        
        if(!isComplete){
            bootbox.alert(msg);
        }
        
        return isComplete;
    }
    
    $('#LS_stageBtnAdd').on('click', function(){
        
        if(LS_stageCheckField()){
            var summaryDate = $('#LS_stageModalID').val();
            var beginDate = $('#LS_stageBeginDate').val();
            var beginTime = $('#LS_stageBeginTime').val();
            var membraneDate = $('#LS_stageMembraneDate').val();
            var membraneTime=$('#LS_stageMembraneTime').val();
            var secondDate=$('#LS_stageSecondDate').val();
            var secondTime=$('#LS_stageSecondTime').val();
            var bornDate=$('#LS_stageBornDate').val();
            var bornTime=$('#LS_stageBornTime').val();
            var placentaDate=$('#LS_stagePlacentaDate').val();
            var placentaTime=$('#LS_stagePlacentaTime').val();

            var hour1=$('#LS_stage1hour').val();
            var minute1=$('#LS_stage1minute').val();
            var hour2=$('#LS_stage2hour').val();
            var minute2=$('#LS_stage2minute').val();
            var hour3 = $('#LS_stage3hour').val();
            var minute3=$('#LS_stage3minute').val();
            
            var theDate = summaryDate.split(" ")[0];
            
            var data={
                summaryDate : summaryDate,
                beginDate : beginDate,
                beginTime : beginTime,
                membraneDate : membraneDate,
                membraneTime : membraneTime,
                secondDate : secondDate,
                secondTime : secondTime,
                bornDate : bornDate,
                bornTime : bornTime,
                placentaDate : placentaDate,
                placentaTime : placentaTime,
                hour1 : hour1,
                minute1 : minute1,
                hour2 : hour2,
                minute2 : minute2,
                hour3 : hour3,
                minute3 : minute3
            };
            
            createScreenLoading();
            var message="";
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/labourStage_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Labour stage is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            LS_loadData();
                            $('#LS_stageModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save labour stage.";
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
    
    //===============================
    
   //**************************************************** == stage == **************************************************
   
   
   //**************************************** labour event **********************************************
     
    //---------- update labour event-----
    $('#LS_viewDIv').on('click', '#LS_eventUpdateModal', function (){
        $('#LS_eventModal').modal('show');
        var eventArr = $(this).closest('div').find('#LS_theEventHidden').val().split("|");
        var summaryDate =$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        
        $('#LS_eventModalID').val(summaryDate);
        $('#LS_eventConductedBy').val(eventArr[0]);
        $('#LS_eventWitness').val(eventArr[1]);
    });
    
    function LS_eventCheckField(){
        var isComplete = true;
        var msg="";
        
        var conductedBy = $('#LS_eventConductedBy').val();
        var witness = $('#LS_eventWitness').val();
        
        if(conductedBy===""){
            isComplete=false;
            msg="Please fill in the conductor name";
        }
        else if(witness===""){
            isComplete=false;
            msg="Please fill in the witness name";
        }
        
        if(!isComplete){
            bootbox.alert(msg);
        }
        
        return isComplete;
    }
    
    $('#LS_eventBtnAdd').on('click', function(){
        if(LS_eventCheckField()){
            var conductedBy = $('#LS_eventConductedBy').val();
            var witness = $('#LS_eventWitness').val();
            var summaryDate = $('#LS_eventModalID').val();
            var theDate = summaryDate.split("|")[0];
            
            conductedBy = conductedBy.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            witness = witness.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                summaryDate : summaryDate,
                conductedBy : conductedBy,
                witness : witness
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/event_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Event record is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            LS_loadData();
                            $('#LS_eventModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save event record.";
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
    //===================================
    
    //********************************* == labour event == ********************************************
    
    //********************************* infant ************************************************
    //--------------- add new infant ---------------------
    $('#LS_viewDIv').on('click', '#LS_infantAddModal', function (){
        $('#LS_infantModal').modal('show');
        $('#LS_infant_div_add').show();
        $('#LS_infant_div_update').hide();
        $('#LS_infantForm')[0].reset();
        $('#LS_infantTag').prop('disabled', false);
        
        var summaryDate =$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        var summaryDateArr = summaryDate.split(" ");
        var birthDate = summaryDateArr[0];
        var birthTime = summaryDateArr[1];
        
       
        $('#LS_infantBirthDate').val(birthDate);
        $('#LS_infantBirthTime').val(birthTime);
        $('#LS_infantModalID').val(summaryDate);
        
    });
    
    function LS_infantCheckField(){
        var isComplete=true;
        var msg="";
        
        var alive = $('#LS_infantAlive').val();
        var other = $('#LS_infantOther').val();
        var tag = $('#LS_infantTag').val();
        var birthDate = $('#LS_infantBirthDate').val();
        var birthTime = $('#LS_infantBirthTime').val();
        var sex = $('#LS_infantSex').val();
        var weight = $('#LS_infantWeight').val();
        var head = $('#LS_infantHead').val();
        var apgar1 = $('#LS_infantApgar1').val();
        var apgar2 = $('#LS_infantApgar2').val();
        var apgar3 = $('#LS_infantApgar3').val();
        var length = $('#LS_infantLength').val();
        var cord = $('#LS_infantCord').val();
        var vitamin = $('#LS_infantVitaminK').val();
        var vaccine = $('#LS_infantVaccine').val();
        var abnormal = $('#LS_infantAbnormal').val();
        
        if(alive==="" || alive==null){
            isComplete=false;
            msg="Please choose baby's condition";
        }
        else if(tag ===""){
            isComplete=false;
            msg="Please insert baby's tag number";
        }
        else if(birthDate ===""){
            isComplete=false;
            msg="Please choose baby's birth date";
        }
        else if(birthTime ===""){
            isComplete=false;
            msg="Please choose baby's birth time";
        }
        else if(sex ==="" || sex==null){
            isComplete=false;
            msg="Please choose baby's sex";
        }
        else if(cord ==="" || cord==null){
            isComplete=false;
            msg="Please choose the cord blood collection status";
        }
        else if(vitamin ==="" || vitamin==null){
            isComplete=false;
            msg="Please choose the vitamin status";
        }
        else if(vaccine ==="" || vaccine==null){
            isComplete=false;
            msg="Please choose the vaccination status";
        }
        
        if(weight==="" || isNaN(weight)){
            $('#LS_infantWeight').val("0");
        }
        
        if(head==="" || isNaN(head)){
            $('#LS_infantHead').val("0");
        }
        
        if(apgar1==="" || isNaN(apgar1)){
            $('#LS_infantApgar1').val("0");
        }
        
        if(apgar2==="" || isNaN(apgar2)){
            $('#LS_infantApgar2').val("0");
        }
        
        if(apgar3==="" || isNaN(apgar3)){
            $('#LS_infantApgar3').val("0");
        }
        
        if(length==="" || isNaN(length)){
            $('#LS_infantLength').val("0");
        }
        
        if(!isComplete){
            bootbox.alert(msg);
        }
        
        return isComplete;
    }
    //====================================================
    
    //----- add infant record by click --------------
    $('#LS_infantBtnAdd').on('click', function(){
        if(LS_infantCheckField()){
            
            var summaryDate = $('#LS_infantModalID').val();
            var theDate = summaryDate.split(" ")[0];
            
            var alive = $('#LS_infantAlive').val();
            var other = $('#LS_infantOther').val();
            var tag = $('#LS_infantTag').val();
            var birthDate = $('#LS_infantBirthDate').val();
            var birthTime = $('#LS_infantBirthTime').val();
            var sex = $('#LS_infantSex').val();
            var weight = $('#LS_infantWeight').val();
            var head = $('#LS_infantHead').val();
            var apgar1 = $('#LS_infantApgar1').val();
            var apgar2 = $('#LS_infantApgar2').val();
            var apgar3 = $('#LS_infantApgar3').val();
            var length = $('#LS_infantLength').val();
            var cord = $('#LS_infantCord').val();
            var vitamin = $('#LS_infantVitaminK').val();
            var vaccine = $('#LS_infantVaccine').val();
            var abnormal = $('#LS_infantAbnormal').val();
            
            other = other.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            abnormal = abnormal.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                summaryDate : summaryDate,
                alive : alive,
                other : other,
                tag : tag,
                birthDate : birthDate,
                birthTime : birthTime,
                sex : sex,
                weight : weight,
                head : head,
                apgar1 : apgar1,
                apgar2 : apgar2,
                apgar3 : apgar3,
                length : length,
                cord : cord,
                vitamin : vitamin,
                vaccine : vaccine,
                abnormal : abnormal
                
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/infant_insert.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Infant record is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            LS_loadData();
                            $('#LS_infantModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save infant record.";
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
    //=============================================
    
       
    //-------------------- update infant birth record ---------------------------
     $('#LS_viewDIv').on('click', '#LS_infantUpdateModal', function (){
        $('#LS_infantModal').modal('show');
        $('#LS_infant_div_add').hide();
        $('#LS_infant_div_update').show();
        $('#LS_infantTag').prop('disabled', true);
        
        var summaryDate =$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        var hiddenArr = $(this).closest('div').find('#LS_theInfantHidden').val().split("|");
        
        $('#LS_infantModalID').val(summaryDate);
        $('#LS_infantAlive').val(hiddenArr[0]);
        $('#LS_infantOther').val(hiddenArr[1]);
        $('#LS_infantTag').val(hiddenArr[2]);
        $('#LS_infantBirthDate').val(hiddenArr[3]);
        $('#LS_infantBirthTime').val(hiddenArr[4]);
        $('#LS_infantSex').val(hiddenArr[5]);
        $('#LS_infantWeight').val(hiddenArr[6]);
        $('#LS_infantHead').val(hiddenArr[7]);
        $('#LS_infantApgar1').val(hiddenArr[8]);
        $('#LS_infantApgar2').val(hiddenArr[9]);
        $('#LS_infantApgar3').val(hiddenArr[10]);
        $('#LS_infantLength').val(hiddenArr[11]);
        $('#LS_infantCord').val(hiddenArr[12]);
        $('#LS_infantVitaminK').val(hiddenArr[13]);
        $('#LS_infantVaccine').val(hiddenArr[14]);
        $('#LS_infantAbnormal').val(hiddenArr[15]);
        
    });
    
    $('#LS_infantBtnUpdate').on('click', function(){
        if(LS_infantCheckField()){
            
            var summaryDate = $('#LS_infantModalID').val();
            var theDate = summaryDate.split(" ")[0];
            
            var alive = $('#LS_infantAlive').val();
            var other = $('#LS_infantOther').val();
            var tag = $('#LS_infantTag').val();
            var birthDate = $('#LS_infantBirthDate').val();
            var birthTime = $('#LS_infantBirthTime').val();
            var sex = $('#LS_infantSex').val();
            var weight = $('#LS_infantWeight').val();
            var head = $('#LS_infantHead').val();
            var apgar1 = $('#LS_infantApgar1').val();
            var apgar2 = $('#LS_infantApgar2').val();
            var apgar3 = $('#LS_infantApgar3').val();
            var length = $('#LS_infantLength').val();
            var cord = $('#LS_infantCord').val();
            var vitamin = $('#LS_infantVitaminK').val();
            var vaccine = $('#LS_infantVaccine').val();
            var abnormal = $('#LS_infantAbnormal').val();
            
            other = other.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            abnormal = abnormal.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                summaryDate : summaryDate,
                alive : alive,
                other : other,
                tag : tag,
                birthDate : birthDate,
                birthTime : birthTime,
                sex : sex,
                weight : weight,
                head : head,
                apgar1 : apgar1,
                apgar2 : apgar2,
                apgar3 : apgar3,
                length : length,
                cord : cord,
                vitamin : vitamin,
                vaccine : vaccine,
                abnormal : abnormal
                
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/infant_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Infant record is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            LS_loadData();
                            $('#LS_infantModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save infant record.";
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
    //=======================================================================
    
    //---------- delete infant record ---------------------------
    $('#LS_viewDIv').on('click', '#LS_infantBtnDelete', function(){
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        var theDate = summaryDate.split("|")[0];
        
        var dataArr = $(this).closest('div').find('#LS_theInfantHidden').val().split("|");
        var tag = dataArr[2];
        
        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete birth record for infant with tag " + tag+"?",
            buttons: {
                confirm: {
                    label: "Yes",
                    className: "btn-success"
                },
                cancel: {
                    label: "No",
                    className: "btn-danger"
                }
            },
            callback: function (result) {

                if (result) {
                    var data = {
                        summaryDate : summaryDate,
                        tag : tag
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/LS_control/infant_delete.jsp",
                        success: function (data, textStatus, jqXHR) {
                                var reply = data.trim();
                                if(reply==="success"){
                                    message="Infant record is deleted successfully.";
                                    $('#LS_viewBy').val('x');
                                    $('#LS_dateFrom').val(theDate);
                                    $('#LS_dateTo').val(theDate);
                                    LS_loadData();
                                    $('#LS_infantModal').modal('hide');
                                }
                                else if(reply==="fail"){
                                    message="Failed to delete infant record.";
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
            }
        });
    });
    //==========================================================
    
    //********************************** == infant == *******************************************************
    
    //********************************** transfer *********************************************
    
    //-------------------update mother transfer ---------------------
    $('#LS_viewDIv').on('click', '#LS_transferUpdateModal', function (){
        $('#LS_transferModal').modal('show');
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        
        var dataArr = $(this).closest('div').find('#LS_theHiddenTransfer').val().split("|");
        
        $('#LS_transferSystolic').val(dataArr[1]);
        $('#LS_transferDiastolic').val(dataArr[2]);
        $('#LS_transferPulse').val(dataArr[0]);
        $('#LS_transferUterus').val(dataArr[3]);
        $('#LS_transferTime').val(dataArr[4]);
        $('#LS_transferPerineum').val(dataArr[5]);
        $('#LS_transferDoctor').val(dataArr[6]);
        
        $('#LS_transferModalID').val(summaryDate);
    });
    
    function LS_transferCheckField(){
        var isCom = true;
        var msg="";
        
        var pulse= $('#LS_transferPulse').val();
        var systol = $('#LS_transferSystolic').val();
        var diastol = $('#LS_transferDiastolic').val();
        var uterus = $('#LS_transferUterus').val();
        var time = $('#LS_transferTime').val();
        var perineum = $('#LS_transferPerineum').val();
        var doctor = $('#LS_transferDoctor').val();
        
        if(time===""){
            isCom=false;
            msg="Please choose transfer time";
        }
        else if(doctor===""){
            isCom=false;
            msg="Please insert doctor or nurse";
        }
        
        if(pulse==="" || isNaN(pulse)){
            $('#LS_transferPulse').val("0");
        }
        
        if(systol==="" || isNaN(systol)){
            $('#LS_transferSystolic').val("0");
        }
        
        if(diastol==="" || isNaN(diastol)){
            $('#LS_transferDiastolic').val("0");
        }
        
        if(!isCom){
            bootbox.alert(msg);
        }
        
        return isCom;
    }
    
    $('#LS_transferBtnAdd').on('click', function(){
        
        if( !$('#LS_transferForm')[0].checkValidity()){
            $('<input type="submit">').hide().appendTo('#LS_transferForm').click().remove();
        }
        else if(LS_transferCheckField()){
            
            var summaryDate = $('#LS_transferModalID').val();
            var theDate = summaryDate.split(" ")[0];
            
            var pulse= $('#LS_transferPulse').val();
            var systol = $('#LS_transferSystolic').val();
            var diastol = $('#LS_transferDiastolic').val();
            var uterus = $('#LS_transferUterus').val();
            var time = $('#LS_transferTime').val();
            var perineum = $('#LS_transferPerineum').val();
            var doctor = $('#LS_transferDoctor').val();
            
            uterus = uterus.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            perineum = perineum.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            doctor = doctor.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                summaryDate : summaryDate,
                pulse : pulse,
                systol : systol,
                diastol : diastol,
                uterus : uterus,
                time : time,
                perineum : perineum,
                doctor : doctor
                
            };
            
            var message="-";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/transfer_save.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Transfer record is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            LS_loadData();
                            $('#LS_transferModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save transfer record.";
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
    //===============================================================
    
    //******************************* == transfer == ****************************************
    
    
    //********************* approve *******************************
    $('#LS_viewDIv').on('click', '#LS_btnApprove', function(){
        var summaryDate=$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        var theDate = summaryDate.split(" ")[0];
        
        bootbox.confirm({
            title: "Approve record?",
            message: "Are you sure you want to approve this labour summary? Once you have approved this record, you can no longer edit it.",
            buttons: {
                confirm: {
                    label: "Yes",
                    className: "btn-success"
                },
                cancel: {
                    label: "No",
                    className: "btn-danger"
                }
            },
            callback: function (result) {

                if (result) {
                    var data = {
                        summaryDate : summaryDate
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/LS_control/labourSummary_approve.jsp",
                        success: function (data, textStatus, jqXHR) {
                                var reply = data.trim();
                                if(reply==="success"){
                                    message="Labour summary is approved successfully.";
                                    $('#LS_viewBy').val('x');
                                    $('#LS_dateFrom').val(theDate);
                                    $('#LS_dateTo').val(theDate);
                                    LS_loadData();
                                    
                                }
                                else if(reply==="fail"){
                                    message="Failed to approve this record.";
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
            }
        });
        
    });
    //******************** == approve == ************************
    
    //****************** delete summary **********************
    $('#LS_viewDIv').on('click', '#LS_btnDeleteAll', function(){
        var summaryDate=$(this).closest('#LS_viewGroup').find('#LS_theSummaryDate').text();
        var theDate = summaryDate.split(" ")[0];
        
        bootbox.confirm({
            title: "Delete record?",
            message: "Are you sure you want to delete this labour summary? Once you have deleted this record, you can no longer see it.",
            buttons: {
                confirm: {
                    label: "Yes",
                    className: "btn-success"
                },
                cancel: {
                    label: "No",
                    className: "btn-danger"
                }
            },
            callback: function (result) {

                if (result) {
                    var data = {
                        summaryDate : summaryDate
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/LS_control/labourSummary_delete.jsp",
                        success: function (data, textStatus, jqXHR) {
                                var reply = data.trim();
                                if(reply==="success"){
                                    message="Labour summary is deleted successfully.";
                                    $('#LS_viewBy').val('x');
                                    $('#LS_dateFrom').val(theDate);
                                    $('#LS_dateTo').val(theDate);
                                    LS_loadData();
                                    
                                }
                                else if(reply==="fail"){
                                    message="Failed to delete this record.";
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
            }
        });
    });
    //***************** == delete summary == *****************
    
</script>