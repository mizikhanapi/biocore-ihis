<%-- 
    Document   : maternityUnit
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
    Modified by: Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Maternity Unit</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View history assessment:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control soap-select" id="MU_viewBy">
                <option value="" disabled selected>View by</option>
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" style=" display: none" id="MU_div_selectDate">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="MU_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="MU_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="MU_btnSearchByDate"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-6 clear-patient table-guling" id="MU_div_theraphyTable">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Date / Time Ordered</th>
                    <th>Intravenous Therapy</th>
                    <th>Date / Time Off</th>
                    <th>Action</th>
                </tr>    
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="col-md-6 clear-patient table-guling" id="MU_div_investigationTable">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Date / Time Ordered</th>
                    <th>Investigation</th>
                    <th>Date Done</th>
                    <th>Action</th>
                </tr>    
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="specialistTemplate/ONG/maternityUnit-modal.jsp" />
<script type="text/javascript">
    
   
    //--- initialise datepicker for from ----
    $('#MU_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#MU_dateFrom').on('change', function(){
        
        $("#MU_dateTo" ).datepicker( "destroy" );
        $('#MU_dateTo').val('');
        var fromDate = $( "#MU_dateFrom" ).datepicker( "getDate" );
        
        $('#MU_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
    
    $('#MU_viewBy').on('change', function(){
        var howTo = $(this).val();

        if (howTo === 'x') {
            $('#MU_div_selectDate').show();
        } else {
            $('#MU_div_selectDate').hide();
            MU_loadData();
        }
    });
    
    function MU_loadData(){
        var data = {
            day: $('#MU_viewBy').val(),
            from: $('#MU_dateFrom').val(),
            to: $('#MU_dateTo').val()
        };
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "specialistTemplate/ONG/MU_control/retrieve_table.jsp",
            success: function (data, textStatus, jqXHR) {
                var table = data.split("X-RD_split-X");
                $('#MU_div_theraphyTable').html(table[0]);
                $('#MU_div_investigationTable').html(table[1]);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $('#MU_div_theraphyTable').html(errorThrown);
                $('#MU_div_investigationTable').html(errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
    
    //----------------------- view previous order based on selected date range -----------------------------
    $('#MU_btnSearchByDate').on('click', function () {
        
        var dateFrom = $('#MU_dateFrom').val();
        var dateTo = $('#MU_dateTo').val();

        if (dateFrom === '' || dateTo === ''){
         bootbox.alert("Please pick the date range!");   
        }        
        else
            MU_loadData();
    });
    
    //==============================================================================
 
    //initialise datepicker and timepicker for therapy modal.
    $('#MU_therapyOrderDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    $('#MU_therapyOffDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+5',
        maxDate: '+5y'
    });
    
    $('#MU_therapyOrderTime').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1,
        'startTime': new Date()
    });
    
    $('#MU_therapyOffTime').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1,
        'startTime': new Date()
    });
    
    
    $('#MU_investigationOrderDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    $('#MU_investigationOffDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+5',
        maxDate: '+5y'
    });
    
    $('#MU_investigationOrderTime').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1,
        'startTime': new Date()
    });
    
    $('#MU_investigationOffTime').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1,
        'startTime': new Date()
    });
    
    //********************************************************* Therapy *************************************************************

    $('#ong-maternityUnit1').on('hidden.bs.modal', function(){
        $('#MU_therapyModalTitle').text("Add Intravenous Therapy");
        $('#MU_therapy_div_add').show();
        $('#MU_theraphy_div_update').hide();
        $('#MU_theraphyModalID').val('');
        $('#MU_theraphyForm')[0].reset();
    });
    
    function MU_theraphyFieldCheck(){
        var isComplete=true;
        var msg="";
        
        var kini = new Date();
        var tarikh = kini.getDate()+"/"+(kini.getMonth()+1)+"/"+kini.getFullYear();
        var masa = kini.getHours()+":"+kini.getMinutes();
                
        var leDate=$('#MU_therapyOrderDate').val();
        var leTime=$('#MU_therapyOrderTime').val();
        var therapy=$('#MU_txtTherapy').val();
        
        var offDate=$('#MU_therapyOffDate').val();
        var offTime=$('#MU_therapyOffTime').val();
        
        if(therapy===""){
            isComplete=false;
            msg="Please fill in the therapy.";
        }
        
        
        if(!isComplete){
            bootbox.alert(msg);
            $('#ong-maternityUnit1').css('overflow', 'auto');
        }
        
         if(leDate===""){
            $('#MU_therapyOrderDate').val(tarikh);
        }
        
        if(leTime===""){
            $('#MU_therapyOrderTime').val(masa);
        }
        
        if(offTime==="" && offDate!==""){
            $('#MU_therapyOffTime').val(masa);
        }
        
        if(offTime!=="" && offDate===""){
            $('#MU_therapyOffDate').val(tarikh);
        }
        
        
        return isComplete;
    }
    
    //---------------- Add button clicked -----------
        $('#MU_therapy_btnAdd').on('click', function(){
            if(MU_theraphyFieldCheck()){
                var leDate=$('#MU_therapyOrderDate').val();
                var leTime=$('#MU_therapyOrderTime').val();
                var therapy=$('#MU_txtTherapy').val();
                var offDate=$('#MU_therapyOffDate').val();
                var offTime=$('#MU_therapyOffTime').val();
                var status=$('#MU_therapyStatus').val();
                
                therapy = therapy.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                
                var data={
                    orderDate: leDate,
                    orderTime: leTime,
                    therapy: therapy,
                    offDate: offDate,
                    offTime: offTime,
                    status: status,
                    process: 'add',
                    type: 'T'
                };
                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    url: "specialistTemplate/ONG/MU_control/controller.jsp",
                    data: data,
                    success: function (reply, textStatus, jqXHR) {
                        if(reply.trim()==="success"){
                            MU_loadData();
                            bootbox.alert("Therapy order is added successfully.");
                            $('#ong-maternityUnit1').modal('hide');
                            
                        }
                        else if(reply.trim()==="fail"){
                            bootbox.alert("Failed to add therapy order.");
                        }
                        else{
                            bootbox.alert(reply.trim());
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+ errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });
            }
        });
    //===============================================
    
    //---------- update therapy -------------------
    $('#MU_div_theraphyTable').on('click', '#MU_therapyUpdateModal', function(){
       var hidden = $(this).closest('tr').find('#MU_theraphyHidden').val();
       var array = hidden.split("|");
       
       var id=array[0], orderDate=array[1], orderTime=array[2], therapy=array[3], offDate=array[4], offTime=array[5], status=array[6];
       
       $('#MU_theraphyModalID').val(id);
       $('#MU_therapyOrderDate').val(orderDate);
       $('#MU_therapyOrderTime').val(orderTime);
       $('#MU_txtTherapy').val(therapy);
       $('#MU_therapyStatus').val(status);
       
       if(offDate == null || offDate==="null"){
           offDate="";
       }
       
       if(offTime == null || offTime === "null"){
           offTime="";
       }
       
       $('#MU_therapyOffDate').val(offDate);
       $('#MU_therapyOffTime').val(offTime);
       
       $('#MU_therapyModalTitle').text("Update Intravenous Therapy");
       $('#MU_theraphy_div_update').show();
       $('#MU_therapy_div_add').hide();
       
       $('#ong-maternityUnit1').modal('show');
       
    });
    
    $('#MU_theraphy_btnUpdate').on('click', function(){
        if(MU_theraphyFieldCheck()){
            
            var id =$('#MU_theraphyModalID').val();
            var leDate=$('#MU_therapyOrderDate').val();
            var leTime=$('#MU_therapyOrderTime').val();
            var therapy=$('#MU_txtTherapy').val();
            var offDate=$('#MU_therapyOffDate').val();
            var offTime=$('#MU_therapyOffTime').val();
            var status=$('#MU_therapyStatus').val();

            therapy = therapy.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                id: id,
                orderDate: leDate,
                orderTime: leTime,
                therapy: therapy,
                offDate: offDate,
                offTime: offTime,
                status: status,
                process: 'update',
                type: 'T'
            };
            
            createScreenLoading()
            $.ajax({
                type: 'POST',
                timeout: 60000,
                url: "specialistTemplate/ONG/MU_control/controller.jsp",
                data: data,
                success: function (reply, textStatus, jqXHR) {
                    if(reply.trim()==="success"){
                        MU_loadData();
                        bootbox.alert("Therapy order is updated successfully.");
                        $('#ong-maternityUnit1').modal('hide');

                    }
                    else if(reply.trim()==="fail"){
                        bootbox.alert("Failed to update therapy order.");
                    }
                    else{
                        bootbox.alert(reply.trim());
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Oops! "+ errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }
    });
    
    //=============================================
    
    //----------- delete therapy-------------------
    $('#MU_div_theraphyTable').on('click', '#MU_therapyBtnDelete', function(){
        var hidden = $(this).closest('tr').find('#MU_theraphyHidden').val();
        var array = hidden.split("|");
        
        var id = array[0];
        var name = array[3];
        
        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete "+ name + "?",
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
                        id: id,
                        process:'delete',
                        type:'T'
                    };

                    var msg = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        url: "specialistTemplate/ONG/MU_control/controller.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'success') {
                                msg = "Order " + name + " is deleted.";
                                MU_loadData();
                            } else if (data.trim() === 'fail') {
                                msg = "Failed to delete order " +name;
                            }
                            else{
                                msg=data.trim();
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            msg = "Oopps! " + errorThrown;
                        },
                        complete: function (jqXHR, textStatus) {
                            destroyScreenLoading();
                            bootbox.alert(msg);

                        }

                    });

                }
            }
        });
        
    });
    //=============================================
    //********************************************************* Therapy end *************************************************************
    
    //********************************************* Investigation ********************************************************************
    //---reset modal
     $('#ong-maternityUnit2').on('hidden.bs.modal', function(){
        $('#MU_investigationModalTitle').text("Add Investigation");
        $('#MU_investigation_div_add').show();
        $('#MU_investigation_div_update').hide();
        $('#MU_investigationModalID').val('');
        $('#MU_investigationForm')[0].reset();
    });
    
    //---check field
    function MU_investigationFieldCheck(){
        var isComplete=true;
        var msg="";
        
        var kini = new Date();
        var tarikh = kini.getDate()+"/"+(kini.getMonth()+1)+"/"+kini.getFullYear();
        var masa = kini.getHours()+":"+kini.getMinutes();
        
        var leDate=$('#MU_investigationOrderDate').val();
        var leTime=$('#MU_investigationOrderTime').val();
        var investigation=$('#MU_txtInvestigation').val();
        
        var offDate=$('#MU_investigationOffDate').val();
        var offTime=$('#MU_investigationOffTime').val();
        
        if(investigation===""){
            isComplete=false;
            msg="Please fill in the investigation.";
        }
        
        if(leDate===""){
            $('#MU_investigationOrderDate').val(tarikh);
        }
        if(leTime===""){
            $('#MU_investigationOrderTime').val(masa);
        }        
        
        if(offTime==="" && offDate!==""){
            $('#MU_investigationOffTime').val(masa);
        }
        if(offTime!=="" && offDate===""){
            $('#MU_investigationOffDate').val(tarikh);
        }
        
        if(!isComplete){
            bootbox.alert(msg);
            $('#ong-maternityUnit2').css('overflow', 'auto');
        }
        
        return isComplete;
    }
    
    //---------------- Add button clicked -----------
        $('#MU_investigationBtnAdd').on('click', function(){
            if(MU_investigationFieldCheck()){
                var leDate=$('#MU_investigationOrderDate').val();
                var leTime=$('#MU_investigationOrderTime').val();
                var investigation=$('#MU_txtInvestigation').val();

                var offDate=$('#MU_investigationOffDate').val();
                var offTime=$('#MU_investigationOffTime').val();
                var status=$('#MU_investigationStatus').val();
                
                investigation = investigation.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
                
                var data={
                    orderDate: leDate,
                    orderTime: leTime,
                    investigation: investigation,
                    offDate: offDate,
                    offTime: offTime,
                    status: status,
                    process: 'add',
                    type: 'I'
                };
                createScreenLoading();
                $.ajax({
                    type: 'POST',
                    timeout: 60000,
                    url: "specialistTemplate/ONG/MU_control/controller.jsp",
                    data: data,
                    success: function (reply, textStatus, jqXHR) {
                        if(reply.trim()==="success"){
                            MU_loadData();
                            bootbox.alert("Investigation order is added successfully.");
                            $('#ong-maternityUnit2').modal('hide');
                            
                        }
                        else if(reply.trim()==="fail"){
                            bootbox.alert("Failed to add investigation order.");
                        }
                        else{
                            bootbox.alert(reply.trim());
                        }
                        
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+ errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }
                });
            }
        });
    //===============================================
    
    
    //---------- update investigation -------------------
    $('#MU_div_investigationTable').on('click', '#MU_investigationUpdateModal', function(){
       var hidden = $(this).closest('tr').find('#MU_investigationHidden').val();
       var array = hidden.split("|");
       
       var id=array[0], orderDate=array[1], orderTime=array[2], therapy=array[3], offDate=array[4], offTime=array[5], status=array[6];
       
       $('#MU_investigationModalID').val(id);
       $('#MU_investigationOrderDate').val(orderDate);
       $('#MU_investigationOrderTime').val(orderTime);
       $('#MU_txtInvestigation').val(therapy);
       $('#MU_investigationStatus').val(status);
       
       if(offDate == null || offDate==="null"){
           offDate="";
       }
       
       if(offTime == null || offTime === "null"){
           offTime="";
       }
       
       $('#MU_investigationOffDate').val(offDate);
       $('#MU_investigationOffTime').val(offTime);
       
       $('#MU_therapyModalTitle').text("Update Investigation");
       $('#MU_investigation_div_update').show();
       $('#MU_investigation_div_add').hide();
       
       $('#ong-maternityUnit2').modal('show');
       
    });
    
    $('#MU_investigationBtnUpdate').on('click', function(){
        if(MU_investigationFieldCheck()){
            
            var id =$('#MU_investigationModalID').val();
            var leDate=$('#MU_investigationOrderDate').val();
            var leTime=$('#MU_investigationOrderTime').val();
            var investigation=$('#MU_txtInvestigation').val();

            var offDate=$('#MU_investigationOffDate').val();
            var offTime=$('#MU_investigationOffTime').val();
            var status=$('#MU_investigationStatus').val();

            investigation = investigation.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            
            var data={
                id: id,
                orderDate: leDate,
                orderTime: leTime,
                investigation: investigation,
                offDate: offDate,
                offTime: offTime,
                status: status,
                process: 'update',
                type: 'I'
            };
            
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                url: "specialistTemplate/ONG/MU_control/controller.jsp",
                data: data,
                success: function (reply, textStatus, jqXHR) {
                    if(reply.trim()==="success"){
                        MU_loadData();
                        bootbox.alert("Investigation order is updated successfully.");
                        $('#ong-maternityUnit2').modal('hide');

                    }
                    else if(reply.trim()==="fail"){
                        bootbox.alert("Failed to update investigation order.");
                    }
                    else{
                        bootbox.alert(reply.trim());
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert("Oops! "+ errorThrown);
                },
                complete: function (jqXHR, textStatus) {
                    destroyScreenLoading();
                }
            });
        }
    });
    
    //=============================================
    
    
     //----------- delete investigation-------------------
    $('#MU_div_investigationTable').on('click', '#MU_investigationBtnDelete', function(){
        var hidden = $(this).closest('tr').find('#MU_investigationHidden').val();
        var array = hidden.split("|");
        
        var id = array[0];
        var name = array[3];
        
        bootbox.confirm({
            title: "Delete item?",
            message: "Are you sure you want to delete "+ name + "?",
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
                        id: id,
                        process:'delete',
                        type:'I'
                    };

                    var msg = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        url: "specialistTemplate/ONG/MU_control/controller.jsp",
                        timeout: 60000,
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === 'success') {
                                msg = "Order " + name + " is deleted.";
                                MU_loadData();
                            } else if (data.trim() === 'fail') {
                                msg = "Failed to delete order " +name;
                            }
                            else{
                                msg=data.trim();
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            msg = "Oopps! " + errorThrown;
                        },
                        complete: function (jqXHR, textStatus) {
                            destroyScreenLoading();
                            bootbox.alert(msg);

                        }

                    });

                }
            }
        });
        
    });
    //=============================================
    //******************************************** Investigation end ****************************************************************
    
</script>