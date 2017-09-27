<%-- 
    Document   : maternityUnit
    Created on : Jun 14, 2017, 4:32:59 PM
    Author     : user
--%>

<div class="row">
    <div class="col-md-8">
        <h4>Consultation Notes</h4>
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
    <div class="col-md-6" id="MU_div_theraphyTable">
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
    <div class="col-md-6" id="MU_div_investigationTable">
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
//                $('#MU_div_investigationTable').html(table[1]);
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
 
    //initialise datepicker and timepicker for continuation modal.
    $('#MU_therapyOrderDate').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    $('#MU_therapyOrderTime').timepicker({
        'timeFormat': 'HH:mm',
        'scrollbar': 'true',
        'minTime': '00:00',
        'maxTime': '23:59',
        'interval': 1     
    });

    $('#ong-maternityUnit1').on('hidden.bs.modal', function(){
        $('#MU_therapyModalTitle').text("Add Intravenous Therapy ...");
        $('#MU_therapy_div_add').show();
        $('#MU_theraphy_div_update').hide();
        $('#MU_theraphyModalID').val('');
        $('#MU_theraphyForm')[0].reset();
    });
    
    function MU_theraphyFieldCheck(){
        var isComplete=true;
        var msg="";
        
        var leDate=$('#MU_therapyOrderDate').val();
        var leTime=$('#MU_therapyOrderTime').val();
        var therapy=$('#MU_txtTherapy').val();
        
        var offDate=$('#MU_therapyOffDate').val();
        var offTime=$('#MU_therapyOffTime').val();
        
        if(leDate===""){
            isComplete=false;
            msg="Please fill in the order date.";
        }
        else if(leTime===""){
            isComplete=false;
            msg="Please fill in the order time.";
        }
        else if(therapy===""){
            isComplete=false;
            msg="Please fill in the therapy.";
        }
        else if(offTime==="" && offDate!==""){
            isComplete=false;
            msg="Please fill in the off time.";
        }
        else if(offTime!=="" && offDate===""){
            isComplete=false;
            msg="Please fill in the off date.";
        }
        
        if(!isComplete){
            bootbox.alert(msg);
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
    
</script>