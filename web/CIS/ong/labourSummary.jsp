<%-- 
    Document   : maternityUnit
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
    Modified by: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Labour Summary</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6 " style="padding-right: 0px;">
            <select class="form-control soap-select" id="LS_viewBy">
                <option value="" selected disabled>View by</option>
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
            <button type="submit" class="btn btn-default" id="LS_btnSearch"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div id="LS_viewDIv" class="clear-patient">

</div>

<div id="LS_modal_div">
    <jsp:include page="specialistTemplate/ONG/labourSummary-modal.jsp" />
</div>

<script type="text/javascript">
    var nextVal="";
    $(function(){
        var url="specialistTemplate/ONG/LS_control/searchUserFlex.jsp";
        
        LS_initFlexSearch("LS_labourRepair", "", url, "LS_labourRepairMatch");
    });
    
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
        $('#LS_dateFrom').val("");
        $("#LS_dateTo").val("");

        if (howTo === 'x') {
            $('#LS_div_selectDate').show();
        } else {
            $('#LS_div_selectDate').hide();
            LS_loadData();
        }
    });
    
    $('#LS_btnSearch').on('click', function(){
        var dateFrom = $('#LS_dateFrom').val();
        var dateTo = $('#LS_dateTo').val();
        
        if(dateFrom==="" || dateTo===""){
            bootbox.alert("Please choose the dates");
        }
        else{
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
    
    initDatepicker("LS_puerDate");
    
    initDatepicker("LS_perNoteDate");
    
    //------------------ retrieve data
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
    
    //------------------- initialise flex search
    function LS_initFlexSearch(input_name, value, url, div){
        $("#"+input_name).flexdatalist('destroy');
        $("#"+input_name).val(value).flexdatalist({
            minLength: 1,
            searchIn: 'name', 
            searchDelay: 2000,
            selectionRequired: true,
            url: url,
            visibleProperties: 'name',
            cache: true,
            valueProperty: 'value',
            params: {
                timeout: 3000,
                success: function (result) {
                    console.log(result);
                    if (result == null) {
                        $('#'+div).html('No Record');
                    }
                }
            }
        });

        $("#"+input_name).on('before:flexdatalist.data', function (response) {
            $('#'+div).html('<img src="img/LoaderIcon.gif" />');
        });
        $("#"+input_name).on('after:flexdatalist.data', function (response) {
            $('#'+div).html('');
        });
    }
    
    //****************************************************************************** summary ****************************************************************
    
    function LS_labourCheckField(){
        var msg="";
        var isComplete = true;
        
        var kini = new Date();
        var tarikh = kini.getDate()+"/"+(kini.getMonth()+1)+"/"+kini.getFullYear();
        var masa = kini.getHours()+":"+kini.getMinutes();
        
        var deliveryDate = $('#LS_labourDeliveryDate').val();
        var deliveryTime = $('#LS_labourDeliveryTime').val();
        var labourOnset = $('#LS_labourOnset').val();
        var vaginal = $('#LS_labourVaginal').val();
        var operative = $('#LS_labourOperative').val();
        var bloodLoss = $('#LS_labourBloodLoss').val();
        var placenta = $('#LS_labourPlacenta').val();
        var cord = $('#LS_labourCord').val();
        var tightness = $('#LS_labourTightness').val();
        var tear = $('#LS_labourTear').val();
        var repair = $('#LS_labourRepair').val();
        
        if(deliveryDate===""){
            $('#LS_labourDeliveryDate').val(tarikh);
        }
        if(deliveryTime===""){
            $('#LS_labourDeliveryTime').val(masa);
        }
        
        if(labourOnset==="" || labourOnset==null){
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
        else if(tightness==="" || cord==null){
            isComplete=false;
            msg="Please choose cord tightness condition.";
        }
        else if(tear==="" || tear ==null){
            isComplete=false;
            msg="Please choose tear condition.";
        }
        else if(repair==="" || repair==null){
            isComplete=false;
            msg="Please select exisitng doctor/nurse";
        }
        
        
        if(bloodLoss==="" || isNaN(bloodLoss)){
            $('#LS_labourBloodLoss').val("0");
        }
        
        if(cord==="" || isNaN(cord)){
            $("#LS_labourCord").val("0");
        }
       
       if(!isComplete){
           bootbox.alert(msg);
           $('#LS_labourModal').css('overflow', 'auto');
       }
       
       if(isComplete && !$('#LS_labourForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_labourForm').click().remove();
           isComplete=false;
        }
        
        return isComplete;        
    }
    
    //----------------- add labour----------------------------------
    $('#LS_labourModal').on('hidden.bs.modal', function (){
        var url="specialistTemplate/ONG/LS_control/searchUserFlex.jsp";
        $('#LS_labourForm')[0].reset();
        LS_initFlexSearch("LS_labourRepair", "", url, "LS_labourRepairMatch");
        $('#LS_labour_div_add').show();
        $('#LS_labour_div_update').hide();
        
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
            var tightness = $('#LS_labourTightness').val();
            var tear = $('#LS_labourTear').val();
            var repair = $('#LS_labourRepair').val();
            
            
            
            var data={
                deliveryDate : deliveryDate,
                deliveryTime : deliveryTime,
                labourOnset : labourOnset,
                vaginal : vaginal,
                operative : operative,
                bloodLoss : bloodLoss,
                placenta : placenta,
                cord : cord,
                tightness : tightness,
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
                            $('#LS_div_selectDate').show();
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
        $('#LS_labourTightness').val(arrData[23]);
        $('#LS_labourTear').val(arrData[9]);
        //$('#LS_labourRepair').val(arrData[10]);
        
        $('#LS_labourModalID').val(summaryDate);
        var url="specialistTemplate/ONG/LS_control/searchUserFlex.jsp";
        LS_initFlexSearch("LS_labourRepair", arrData[10], url, "LS_labourRepairMatch");
        
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
            var tightness = $('#LS_labourTightness').val();
            var tear = $('#LS_labourTear').val();
            var repair = $('#LS_labourRepair').val();
            
            var summaryDate = $('#LS_labourModalID').val();
                      
            
            var data={
                deliveryDate : deliveryDate,
                deliveryTime : deliveryTime,
                labourOnset : labourOnset,
                vaginal : vaginal,
                operative : operative,
                bloodLoss : bloodLoss,
                placenta : placenta,
                cord : cord,
                tightness : tightness,
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
                            $('#LS_div_selectDate').show();
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
        else{
            console.log("Error");
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
            $('#LS_stageModal').css('overflow', 'auto');
        }
        
        if(isComplete && !$('#LS_stageForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_stageForm').click().remove();
           isComplete=false;
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
                            $('#LS_div_selectDate').show();
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
        //$('#LS_eventConductedBy').val(eventArr[0]);
        $('#LS_eventWitness').val(eventArr[1]);
        
        var url="specialistTemplate/ONG/LS_control/searchUserFlex.jsp";
        LS_initFlexSearch("LS_eventConductedBy", eventArr[0], url, "LS_eventMatch");
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
            $('#LS_eventModal').css('overflow', 'auto');
        }
        
        if(isComplete && !$('#LS_eventForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_eventForm').click().remove();
           isComplete=false;
        }
        
        return isComplete;
    }
    
    $('#LS_eventBtnAdd').on('click', function(){
        if(LS_eventCheckField()){
            var conductedBy = $('#LS_eventConductedBy').val();
            var witness = $('#LS_eventWitness').val();
            var summaryDate = $('#LS_eventModalID').val();
            var theDate = summaryDate.split("|")[0];
            
            //conductedBy = conductedBy.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
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
                            $('#LS_div_selectDate').show();
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
        check();
        
    });
    
    function getdataForTag(){
        var arayDate = $("#LS_infantBirthDate").val().split("/");
        var icmakdie = pmiNo.substr(pmiNo.length - 4);
        var tag = icmakdie +"|"+ arayDate[2] + arayDate[1] + arayDate[0];
        return tag;
    }
    
    function check(){
        var datas = getdataForTag();
        console.log(datas);
           $.ajax({
               type:"post",
               url:"specialistTemplate/ONG/DB_control/checkTag.jsp",
               data:{datas : datas },
               success:function(databack){
                   console.log(databack);
                   $('#LS_infantTag').val(databack.trim());
               }
            }); 
    }
    
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
            $('#LS_infantModal').css('overflow', 'auto');
        }
        
        if(isComplete && !$('#LS_infantForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_infantForm').click().remove();
           isComplete=false;
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
                            $('#LS_div_selectDate').show();
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
                            $('#LS_div_selectDate').show();
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
                                    $('#LS_div_selectDate').show();
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
        //$('#LS_transferDoctor').val(dataArr[6]);
        
        $('#LS_transferModalID').val(summaryDate);
        var url="specialistTemplate/ONG/LS_control/searchUserFlex.jsp";
        
        LS_initFlexSearch("LS_transferDoctor", dataArr[6], url, "LS_transferMatch");
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
            $('#LS_transferModal').css('overflow', 'auto');
        }
        
       if(isCom && !$('#LS_transferForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_transferForm').click().remove();
           isCom=false;
        }
        
        return isCom;
    }
    
    $('#LS_transferBtnAdd').on('click', function(){
        
        if(LS_transferCheckField()){
            
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
                            $('#LS_div_selectDate').show();
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
                                    $('#LS_div_selectDate').show();
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
                                    $('#LS_div_selectDate').show();
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
    
    //***************************** puerperium notes *******************************
    $('#LS_viewDIv').on('click', '#LS_perNoteUpdateModal', function(){
        var arrData = $(this).closest('div').find('#LS_theHiddenPerNote').val().split("|");
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        
        $('#LS_perNoteModalID').val(summaryDate);
        $('#LS_perNoteModal').modal('show');
        
        $('#LS_perNoteDate').val(arrData[0]);
        $('#LS_perNoteNotes').val(arrData[1]);
        $('#LS_perNoteTreatment').val(arrData[2]);
    });
    
    $('#LS_perNoteBtnAdd').on('click', function(){
        var perDate = $('#LS_perNoteDate').val();
        var perNote = $('#LS_perNoteNotes').val();
        var treatment = $('#LS_perNoteTreatment').val();
        var summaryDate = $('#LS_perNoteModalID').val();
        var theDate = summaryDate.split("|")[0];
        
        var kini = new Date();
        var tarikh = kini.getDate()+"/"+(kini.getMonth()+1)+"/"+kini.getFullYear();
        
        var isComplete = true;
        var message="";
        
        if(perDate===""){
            $('#LS_perNoteDate').val(tarikh);
        }
        
        if(perNote===""){
            isComplete=false;
            message="Please fill in the notes";
        }
        else if(treatment===""){
            isComplete=false;
            message="Please fill in the treatment";
        }
        
        if(!isComplete){
            bootbox.alert(message);
        }
        else{
            
            perNote = perNote.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            treatment = treatment.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data ={
                summaryDate : summaryDate,
                perDate : perDate,
                note : perNote,
                treatment : treatment
            };
            
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/perNote_save.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Puerperium note is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            $('#LS_perNoteModal').modal('hide');
                            $('#LS_div_selectDate').show();
                            LS_loadData();

                        }
                        else if(reply==="fail"){
                            message="Failed to save this record.";
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
    
    //*************************** == puerperium notes == **********************************
    
    
    //*************************** puerperium observation **********************************
    //---- add new observation
    $('#LS_viewDIv').on('click', '#LS_puerAddModal', function(){
        $('#LS_puerForm')[0].reset();
        $('#LS_puerModal').modal('show');
        $('#LS_puer_div_add').show();
        $('#LS_puer_div_update').hide();
        $('.ls-add-update').prop('disabled', false);
        
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        $('#LS_puerModalID').val(summaryDate);
    });
    
    function LS_puerCheckField(){
        var isComplete = true;
        var message="";
        
        var dateOfMonth = $('#LS_puerDate').val();
        var day = $('#LS_puerDay').val();
        var time = $('#LS_puerTime').val();
        var height = $('#LS_puerHeight').val();
        var temperature = $('#LS_puerTemperature').val();
        var systolic = $('#LS_puerSystolic').val();
        var diastolic = $('#LS_puerDiastolic').val();
        var pulse = $('#LS_puerPulse').val();
        
        if(dateOfMonth===""){
            isComplete = false;
            message="Please choose the date";
        }
        else if(day===""){
            isComplete=false;
            message="Please insert the day of puerperium";
        }
        else if(time===""){
            isComplete=false;
            message="Please choose the time of observation";
        }
        
        
        if(height==="" || isNaN(height)){
            $('#LS_puerHeight').val("0");
        }
        
        if(temperature==="" || isNaN(temperature)){
            $('#LS_puerTemperature').val("0");
        }
        
        if(systolic==="" || isNaN(systolic)){
            $('#LS_puerSystolic').val("0");
        }
        
        if(diastolic==="" || isNaN(diastolic)){
            $('#LS_puerDiastolic').val("0");
        }
        
        if(pulse==="" || isNaN(pulse)){
            $('#LS_puerPulse').val("0");
        }
        
        if(!isComplete){
            bootbox.alert(message);
            $('#LS_puerModal').css('overflow', 'auto');
        }
        
        if(isComplete && !$('#LS_puerForm')[0].checkValidity() ){
           $('<input type="submit">').hide().appendTo('#LS_puerForm').click().remove();
           isComplete=false;
        }
        
        return isComplete;
    }
    
    $('#LS_puerBtnAdd').on('click', function(){
        if(LS_puerCheckField()){
            var dateOfMonth = $('#LS_puerDate').val();
            var day = $('#LS_puerDay').val();
            var time = $('#LS_puerTime').val();
            var height = $('#LS_puerHeight').val();
            var temperature = $('#LS_puerTemperature').val();
            var systolic = $('#LS_puerSystolic').val();
            var diastolic = $('#LS_puerDiastolic').val();
            var pulse = $('#LS_puerPulse').val();
            
            var summaryDate = $('#LS_puerModalID').val();
            var theDate = summaryDate.split(" ")[0];
            
            var data={
                dateOfMonth : dateOfMonth,
                day : day,
                time : time,
                height : height,
                temperature : temperature,
                systolic : systolic,
                diastolic : diastolic,
                pulse : pulse,
                summaryDate : summaryDate
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/puerNote_insert.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Puerperium observation is saved successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            $('#LS_puerModal').modal('hide');
                            $('#LS_div_selectDate').show();
                            LS_loadData();

                        }
                        else if(reply==="fail"){
                            message="Failed to save this record.";
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
    
    //----------- update puerperium obeservation
    $('#LS_viewDIv').on('click', '#LS_puerUpdateModal', function(){
        var arrData = $(this).closest('td').find('#LS_theHiddenPuer').val().split("|");
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        
        $('#LS_puerModal').modal('show');
        $('#LS_puer_div_add').hide();
        $('#LS_puer_div_update').show();
        $('.ls-add-update').prop('disabled', true);
        
        $('#LS_puerDate').val(arrData[0]);
        $('#LS_puerDay').val(arrData[2]);
        $('#LS_puerTime').val(arrData[1]);
        $('#LS_puerHeight').val(arrData[3]);
        $('#LS_puerTemperature').val(arrData[4]);
        $('#LS_puerSystolic').val(arrData[5]);
        $('#LS_puerDiastolic').val(arrData[6]);
        $('#LS_puerPulse').val(arrData[8]);
        
        $('#LS_puerModalID').val(summaryDate);
    });
    
    $('#LS_puerBtnUpdate').on('click', function(){
        if(LS_puerCheckField()){
            var dateOfMonth = $('#LS_puerDate').val();
            var day = $('#LS_puerDay').val();
            var time = $('#LS_puerTime').val();
            var height = $('#LS_puerHeight').val();
            var temperature = $('#LS_puerTemperature').val();
            var systolic = $('#LS_puerSystolic').val();
            var diastolic = $('#LS_puerDiastolic').val();
            var pulse = $('#LS_puerPulse').val();
            
            var summaryDate = $('#LS_puerModalID').val();
            var theDate = summaryDate.split(" ")[0];
            
            var data={
                dateOfMonth : dateOfMonth,
                day : day,
                time : time,
                height : height,
                temperature : temperature,
                systolic : systolic,
                diastolic : diastolic,
                pulse : pulse,
                summaryDate : summaryDate
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/LS_control/puerNote_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Puerperium observation is updated successfully.";
                            $('#LS_viewBy').val('x');
                            $('#LS_dateFrom').val(theDate);
                            $('#LS_dateTo').val(theDate);
                            $('#LS_puerModal').modal('hide');
                            $('#LS_div_selectDate').show();
                            LS_loadData();

                        }
                        else if(reply==="fail"){
                            message="Failed to update this record.";
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
    
    //---------------- delete observation 
    $('#LS_viewDIv').on('click', '#LS_puerBtnDelete', function(){
        var arrData = $(this).closest('td').find('#LS_theHiddenPuer').val().split("|");
        var summaryDate = $(this).closest('#LS_viewDIv').find('#LS_theSummaryDate').text();
        
        var theDate = summaryDate.split("|")[0];
        
        bootbox.confirm({
            title: "Delete record?",
            message: "Are you sure you want to delete this observation record? Once you have deleted this record, you can no longer see it.",
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
                        dateOfMonth : arrData[0],
                        time : arrData[1]
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/LS_control/puerNote_delete.jsp",
                        success: function (data, textStatus, jqXHR) {
                                var reply = data.trim();
                                if(reply==="success"){
                                    message="Labour summary is deleted successfully.";
                                    $('#LS_viewBy').val('x');
                                    $('#LS_dateFrom').val(theDate);
                                    $('#LS_dateTo').val(theDate);
                                    $('#LS_div_selectDate').show();
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
    
    
    //------------plot graph puerperium
        
    $('#LS_viewDIv').on('click', '#LS_puerPlot', function(){
        
        var canvas = $(this).closest('div').find('#LS_canvas');
       
        
        var label = $(this).closest('div').find('#LS_chartLabel').val().split("|");
        var height = $(this).closest('div').find('#LS_chartHeight').val().split("|");
        var temperature = $(this).closest('div').find('#LS_chartTemperature').val().split("|");
        var systol = $(this).closest('div').find('#LS_chartSystol').val().split("|");
        var diastol = $(this).closest('div').find('#LS_chartDiastol').val().split("|");
        var MBP = $(this).closest('div').find('#LS_chartMBP').val().split("|");
        var pulse = $(this).closest('div').find('#LS_chartPulse').val().split("|");
        
        
        var dataHeight = {
            label: "Fundal Height(cm)",
            data: height,
            lineTension: 0.3,
            fill: false,
            borderColor: 'green',
            backgroundColor: 'transparent',
            pointBorderColor: 'green',
            pointBackgroundColor: 'green',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-2"
          };

        var dataTemperature = {
            label: "Temperature (C)",
            data: temperature,
            lineTension: 0.3,
            fill: false,
            borderColor: 'blue',
            backgroundColor: 'transparent',
            pointBorderColor: 'blue',
            pointBackgroundColor: 'blue',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-2"
          };
          
        var dataSystol = {
            label: "Systolic pressure (mmHg)",
            data: systol,
            lineTension: 0.3,
            fill: false,
            borderColor: 'red',
            backgroundColor: 'transparent',
            pointBorderColor: 'red',
            pointBackgroundColor: 'red',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
          };

        var dataDiastol = {
            label: "Diastolic pressure (mmHg)",
            data: diastol,
            lineTension: 0.3,
            fill: false,
            borderColor: 'orange',
            backgroundColor: 'transparent',
            pointBorderColor: 'orange',
            pointBackgroundColor: 'orange',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
          };
          
        var dataMBP = {
            label: "Mean arterial pressure (mmHg)",
            data: MBP,
            lineTension: 0.3,
            fill: false,
            borderColor: 'yellow',
            backgroundColor: 'transparent',
            pointBorderColor: 'yellow',
            pointBackgroundColor: 'yellow',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
          };
          
        var dataPulse = {
            label: "Pulse (bpm)",
            data: pulse,
            lineTension: 0.3,
            fill: false,
            borderColor: 'purple',
            backgroundColor: 'transparent',
            pointBorderColor: 'purple',
            pointBackgroundColor: 'purple',
            pointRadius: 5,
            pointHoverRadius: 10,
            pointHitRadius: 30,
            pointBorderWidth: 2,
            yAxisID: "y-axis-1"
          };

          var chartOptions = {
              legend: {
                display: true,
                position: 'top',
                labels: {
                  boxWidth: 40,
                  fontColor: 'black'
                }
              },
              tooltips: {
                  mode: 'index',
                  intersect: true
              },
              responsive: true,
              scales: {
                    yAxes: [{
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "left",
                        id: "y-axis-1"
                    }, {
                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                        display: true,
                        position: "right",
                        id: "y-axis-2",

                        // grid line settings
                        gridLines: {
                            drawOnChartArea: false// only want the grid lines for one axis to show up
                        }
                    }]
                }
            };

        var speedData = {
          labels: label,
          datasets: [dataHeight, dataTemperature, dataSystol, dataDiastol, dataMBP, dataPulse]
        };


        var lineChart = new Chart(canvas, {
          type: 'line',
          data: speedData,
          options: chartOptions
        });
        
        canvas.toggle();
    });
    
    $('#LS_viewDIv').on('click', '#LS_puerPrint', function(){
        
        var canvas = $(this).closest('div').find('#LS_canvas')[0];
       
        //var image = canvas.toDataURL("image/png");
        
        var printWindow = window.open('', '', 'height=400,width=800');
        printWindow.document.write('<html><head><title>DIV Contents</title>');
        printWindow.document.write('</head><body >');
        printWindow.document.write('<img src="'+ canvas.toDataURL("image/jpg")+'">');
        console.log(canvas.toDataURL("image/jpg"));
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
        
        
    });
    
    //**************************** == puerperium observation == **************************************
    
    
</script>