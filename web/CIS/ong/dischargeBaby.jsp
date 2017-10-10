<%-- 
    Document   : dischargeBaby
    Created on : Oct 9, 2017, 8:57:48 AM
    Author     : user
--%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    Conn con = new Conn();
    
    String queryLogo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='"+hfc_cd+"';";
        ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);
        String logo="";
        
        if(dataLogo.size()>0){
            if(dataLogo.get(0).get(0)!=null)
                logo = dataLogo.get(0).get(0);
        }
%>
<div class="row">
    <div class="col-md-8">
        <h4>Discharge Baby</h4>
    </div>
    <div class="col-md-4" style="padding-top: 20px">
        <label class="col-sm-6 control-label text-right" for="formGroupInputLarge">View discharge history:</label>
        <div class="col-sm-6" style="padding-right: 0px;">
            <select class="form-control soap-select" id="DB_viewBy">
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
    <div class="col-md-6 col-md-offset-6 text-right margin-bottom-30px" style=" display: none" id="DB_div_selectDate">
        <div class="col-sm-12 form-inline" style="padding-right: 0px;">
            <div class="form-group">
                <label for="exampleInputName2">Start</label>
                <input type="text" class="form-control" id="DB_dateFrom" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail2">to</label>
                <input type="email" class="form-control" id="DB_dateTo" placeholder="dd/mm/yyyy" style="margin-bottom: 0px !important;">
            </div>
            <button type="submit" class="btn btn-default" id="DB_btnSearchByDate"><i class="fa fa-search fa-lg"></i></button>
        </div>
    </div>
</div>

<!--view history-->
<div class="row">
    <div class="clear-patient" id="DB_viewDiv"></div>
</div>
<!--view history end-->

<!--include modal here-->
<jsp:include page="specialistTemplate/ONG/dischargeBaby-modal.jsp" />

<script type="text/javascript">
     //--- initialise datepicker for from ----
    $('#DB_dateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#DB_dateFrom').on('change', function(){
        
        $("#DB_dateTo" ).datepicker( "destroy" );
        $('#DB_dateTo').val('');
        var fromDate = $( "#DB_dateFrom" ).datepicker( "getDate" );
        
        $('#DB_dateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
        
    });
    
    $('#DB_viewBy').on('change', function(){
        var howTo = $(this).val();

        if (howTo === 'x') {
            $('#DB_div_selectDate').show();
        } else {
            $('#DB_div_selectDate').hide();
            DB_loadData();
        }
    });
    
    function DB_loadData(){
        var data = {
            day: $('#DB_viewBy').val(),
            from: $('#DB_dateFrom').val(),
            to: $('#DB_dateTo').val()
        };
        
        createScreenLoading();
        $.ajax({
            type: 'POST',
            data: data,
            timeout: 60000,
            url: "specialistTemplate/ONG/DB_control/retrieveDischargeLetter.jsp",
            success: function (data, textStatus, jqXHR) {
               $('#DB_viewDiv').html(data);                 
            },
            error: function (jqXHR, textStatus, errorThrown) {
                bootbox.alert("Oops! "+errorThrown);
            },
            complete: function (jqXHR, textStatus) {
                destroyScreenLoading();
            }
        });
    }
    
    //init timepicker and datepicker on modal
    initDatepicker("DB_dischargeDate");
    initTimepicker("DB_dischargeTime");
    
    //---------------------- add new discharge baby letter --------------------------------
    
    //---- on click DB_addModal
    $('#pName').on('DOMSubtreeModified', function () {
    
    //console.log('Name has change!');
    var name = $(this).text().trim();

        if (name.localeCompare('-') !== 0) {
            $('#DB_dischargeAddModal').on('click', function () {
                $('#DB_dischargeForm')[0].reset();
                var today = $.datepicker.formatDate('dd/mm/yy', new Date());
                $('#DB_dischargeDate').val(today);
                
                var dt = new Date();
                var time = dt.getHours() + ":" + dt.getMinutes();
                $('#DB_dischargeTime').val(time);

                $('#DB_discharge_div_add').show();
                $('#DB_discharge_div_update').hide();

                $('.db-override').prop('disabled', true);
                $('#DB_tagNo').prop("disabled",false);
                DB_loadGuardian();
                DB_getInfantTag();
                DB_getStaff();
                $('#DB_dischargeModal').modal('show');
            });

            //console.log('Function is binded!');
        }
    });
    
    function DB_getStaff(){
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/getStaff.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        var arrData=data.split("|");
                        $('#DB_staff').val(arrData[1]);
                        $('#DB_staffID').val(arrData[0]);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    function DB_loadGuardian(){
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/retrieveGuardian.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        var arrData = data.split("x-RD-split");
                        $('#DB_guardianName').val(arrData[0]);
                        $('#DB_guardianID').val(arrData[1]);
                        $('#DB_address').val(arrData[2]);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
    function DB_getInfantTag(){
        createScreenLoading();
        $.ajax({
            type: 'POST',
            url: "specialistTemplate/ONG/DB_control/getInfantTag.jsp",
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#DB_tagNo').val(data.trim());
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oops! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }
        });
    }
    
//    function DB_load(){
//        var data = {
//            day: $('#DB_viewBy').val(),
//            from: $('#DB_dateFrom').val(),
//            to: $('#DB_dateTo').val()
//        };
//        
//        createScreenLoading();
//        $.ajax({
//            type: 'POST',
//            data: data,
//            timeout: 60000,
//            url: "specialistTemplate/ONG/DB_control/retrieveDischargeLetter.jsp",
//            success: function (data, textStatus, jqXHR) {
//                $('#DB_viewDiv').html(data);
//            },
//            error: function (jqXHR, textStatus, errorThrown) {
//                $('#DB_viewDiv').html(errorThrown);
//            },
//            complete: function (jqXHR, textStatus) {
//                destroyScreenLoading();
//            }
//        });
//    }
    
    function DB_checkField(){
        var isCom = true;
        var msg="";
        
        var name= $('#DB_guardianName').val();
        var ic_no = $('#DB_guardianID').val();
        var address = $('#DB_address').val();
        var relation = $('#DB_relationship').val();
        var tagNo = $('#DB_tagNo').val();
        var disDate = $('#DB_dischargeDate').val();
        var disTime = $('#DB_dischargeTime').val();
        var staff_id = $('#DB_staffID').val();
        
        if(name===""){
           isCom=false;
           msg="Please insert guardian's name.";
        }
        else if(ic_no===""){
            isCom=false;
            msg="Please insert guardian's IC / passport number";
        }
        else if(address===""){
            isCom=false;
            msg="Please insert the guardian's address";
        }
        else if(relation==="" || relation==null){
            isCom=false;
            msg="Please choose the guardian's relation with infant";
        }
        else if(tagNo===""){
            isCom=false;
            msg="Please insert infant's tag number";
        }
        else if(disDate===""){
            isCom=false;
            msg="Please pick discharge date";
        }
        else if(disTime===""){
            isCom=false;
            msg="Please pick discharge time";
        }
        else if(staff_id===""){
            isCom=false;
            msg="Opps! Something went wrong. Staff name and ID cannot be empty";
        }
                
        if(!isCom){
            bootbox.alert(msg);
        }
        return isCom;
    }
    
    $('#DB_dischargeBtnAdd').on('click', function(){
        if(DB_checkField()){
            var name= $('#DB_guardianName').val();
            var ic_no = $('#DB_guardianID').val();
            var address = $('#DB_address').val();
            var relation = $('#DB_relationship').val();
            var tagNo = $('#DB_tagNo').val();
            var disDate = $('#DB_dischargeDate').val();
            var disTime = $('#DB_dischargeTime').val();
            var staff_id = $('#DB_staffID').val();
            
            address = address.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                name : name,
                ic_no : ic_no,
                address : address,
                relation : relation,
                tagNo : tagNo,
                disDate : disDate,
                disTime : disTime,
                staff_id : staff_id
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/DB_control/discharge_insert.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Discharge letter is saved successfully.";
                            $('#DB_viewBy').val('x');
                            $('#DB_dateFrom').val(disDate);
                            $('#DB_dateTo').val(disDate);
                            DB_loadData();
                            $('#DB_dischargeModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to save discharge letter.";
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
    
    //--------------------------------------- == add new discharge baby letter == --------------------------------
    
    //------------------- update discharge letter ------------------------------------
    $('#DB_viewDiv').on('click', '#DB_updateModal', function(){
        var arrData = $(this).val().split("|");
        
        $('#DB_discharge_div_add').hide();
        $('#DB_discharge_div_update').show();
        
        $('#DB_guardianName').val(arrData[3]);
        $('#DB_guardianID').val(arrData[4]);
        $('#DB_dischargeDate').val(arrData[0]);
        $('#DB_dischargeTime').val(arrData[1]);
        $('#DB_tagNo').val(arrData[2]);
        $('#DB_relationship').val(arrData[6]);
        $('#DB_address').val(arrData[5]);
        $('#DB_staff').val(arrData[8]);
        $('#DB_staffID').val(arrData[7]);
        
        $('#DB_dischargeModal').modal('show');
        $('#DB_tagNo').prop("disabled", true);
        $('.db-override').prop("disabled", true);
        
        
    });
    
    $('#DB_dischargeBtnUpdate').on('click', function(){
        if(DB_checkField()){
            var name= $('#DB_guardianName').val();
            var ic_no = $('#DB_guardianID').val();
            var address = $('#DB_address').val();
            var relation = $('#DB_relationship').val();
            var tagNo = $('#DB_tagNo').val();
            var disDate = $('#DB_dischargeDate').val();
            var disTime = $('#DB_dischargeTime').val();
            var staff_id = $('#DB_staffID').val();
            
            address = address.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            name = name.replace(/'/g, "\\\'").replace(/"/g, "\\\"");
            
            var data={
                name : name,
                ic_no : ic_no,
                address : address,
                relation : relation,
                tagNo : tagNo,
                disDate : disDate,
                disTime : disTime,
                staff_id : staff_id
            };
            
            var message="";
            createScreenLoading();
            $.ajax({
                type: 'POST',
                timeout: 60000,
                data: data,
                url: "specialistTemplate/ONG/DB_control/discharge_update.jsp",
                success: function (data, textStatus, jqXHR) {
                        var reply = data.trim();
                        if(reply==="success"){
                            message="Discharge letter is updated successfully.";
                            $('#DB_viewBy').val('x');
                            $('#DB_dateFrom').val(disDate);
                            $('#DB_dateTo').val(disDate);
                            DB_loadData();
                            $('#DB_dischargeModal').modal('hide');
                        }
                        else if(reply==="fail"){
                            message="Failed to update discharge letter.";
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
    //------------------- == update discharge letter == ----------------------------
    
    //-------------- delete discharge letter --------------------------------
    $('#DB_viewDiv').on('click', '#DB_btnDelete', function(){
        var arrData = $(this).val().split("|");
        var tagNo=arrData[2];
        var disDate = arrData[0];
        bootbox.confirm({
            title: "Delete letter?",
            message: "Are you sure you want to delete this letter? Once you have delete this record, you can no longer see it.",
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
                        tagNo : tagNo
                    };

                    var message = "";

                    createScreenLoading();
                    $.ajax({
                        type: 'POST',
                        timeout: 60000,
                        data: data,
                        url: "specialistTemplate/ONG/DB_control/discharge_delete.jsp",
                        success: function (data, textStatus, jqXHR) {
                                var reply = data.trim();
                                if(reply==="success"){
                                    message="Letter is deleted successfully.";
                                    $('#DB_viewBy').val('x');
                                    $('#DB_dateFrom').val(disDate);
                                    $('#DB_dateTo').val(disDate);
                                    DB_loadData();
                                    
                                }
                                else if(reply==="fail"){
                                    message="Failed to delete this letter.";
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
    //---------------- == delete discharge letter == --------------------------
    
    //----------- print discharge letter -----------------------------------
    $('#DB_viewDiv').on('click', '#DB_btnPrint', function(){
        console.log("Printing");
        var printDiv = $(this).closest('#DB_viewGroup').find('#DB_printDiv').html();
        
        var printWindow = window.open('', '', 'height=400,width=800');
        printWindow.document.write('<html><head><title>Discharge Letter</title>');
        printWindow.document.write('</head><body >');
        //printWindow.document.write('<div class="logo-hfc asset-print-img" style="text-align: center;"><img src="<%=logo%>" alt="Health Facility Logo"></div><br><div> &nbsp;</div>');
        printWindow.document.write(printDiv);
        printWindow.document.write('</body></html>');
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    });
    //---------------------- == print == ------------------------------------
</script>