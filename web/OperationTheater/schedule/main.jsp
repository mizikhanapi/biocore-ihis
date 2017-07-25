<%-- 
    Document   : main
    Created on : Jul 22, 2017, 9:52:34 AM
    Author     : user
--%>

<h4>Operation Theater Booking List & Schedule</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Search for?</label>
        <div class="col-md-4">
            <select id="SCH_searchType" class="form-control" >
                <option selected value="1">Room schedule</option>

                <option value="2">Available room on selected time</option>
                
                <option value="3">Consultant schedule</option>

                <option value="4">Available consultant on selected time</option>

                <option value="5">Patient schedule</option>
<!--
                <option value="004">Order No.</option>

                <option value="005">Date</option>-->

            </select>
        </div>
    </div>

    <!-- Text input-->
    <div class="form-group searchingDiv" id="SCH_div_roomSchedule">

        <label class="col-md-4 control-label" for="textinput">Room</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="SCH_srcRoomNo" placeholder="Insert the room number or name to be searched." >
        </div>


    </div>
    <div class="form-group searchingDiv" id="SCH_div_availableRoom" style="display: none;">

        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="SCH_srcDateFrom" class="form-control input-md Datepicker" placeholder="dd/mm/yyyy hh:mm " >
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="SCH_srcDateTo" class="form-control input-md Datepicker" placeholder="dd/mm/yyyy hh:mm " >
        </div>

    </div>

    <div class="form-group searchingDiv" id="SCH_div_srcPatient" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">Patient</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="SCH_srcPmiNo" placeholder="Insert the patient PMI number or name to be searched." >
        </div>

    </div>
    
     <div class="form-group searchingDiv" id="SCH_div_srcConsul" style="display: none;">
        <label class="col-md-4 control-label" for="textinput">Consultant</label>
        <div class="col-md-3">
            <input type="text" class="form-control input-md" id="SCH_srcConsul" placeholder="Insert the consultant ID number or name to be searched." >
        </div>

    </div>

    <div class="text-center">
        <button class="btn btn-primary" type="button" id="SCH_btnSearch" ><i class="fa fa-search"></i>&nbsp; Search</button>

        <!--<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>-->
    </div>


    <div id="SCH_viewSearch" class="table-guling">
    </div>

</div>

<script type="text/javascript">
    
    //set up date picker
    $('#SCH_srcDateFrom').datetimepicker({
        format: 'd/m/Y H:i',
        step: 5
    });
    
    $('#SCH_srcDateTo').datetimepicker({
        format: 'd/m/Y H:i',
        step: 5
    });
    
    //... hide and hide div on search for change
    $('#SCH_searchType').on('change', function(){
        $('.searchingDiv').hide();
        var type = $(this).val();
        
        if(type === '1'){
            $('#SCH_div_roomSchedule').show();
        }
        else if(type === '2' || type === '4'){
            $('#SCH_div_availableRoom').show();
        }
        else if(type==='3'){
            $('#SCH_div_srcConsul').show();
        }
        else if(type === '5'){
            $('#SCH_div_srcPatient').show();
        }
    });
    
    //... search for result on btn click
    $('#SCH_btnSearch').on('click', function(){
        var strURL = "schedule/searchPatient_RoomSchedule.jsp";
        
        var type = $('#SCH_searchType').val();
        
        if(type ==="2" || type === "4"){
            
            
            
//            var strFrom = $('#SCH_srcDateFrom').val(), strTo = $('#SCH_srcDateTo').val();
//            console.log(strFrom +" - "+ strTo);
            
            var from = $('#SCH_srcDateFrom').datetimepicker('getValue');
            var to = $('#SCH_srcDateTo').datetimepicker('getValue');
            
            if(from >= to){
                bootbox.alert("Date to must be later than Date from!");
                $('#SCH_srcDateTo').val('');
                return false;
            }
            
            console.log(from +" - "+to);
            
            if(type ==="2")
                strURL ="schedule/searchAvailableRoom.jsp";
            else if(type==="4")
                strURL ="schedule/searchAvailableConsultant.jsp";
        }
        
        var roomNo = $('#SCH_srcRoomNo').val();
        var pmiNo = $('#SCH_srcPmiNo').val();
        var consul = $('#SCH_srcConsul').val();
        var dateFrom = $('#SCH_srcDateFrom').val();
        var dateTo = $('#SCH_srcDateTo').val();
        
        var data ={
            type : type,
            roomNo : roomNo,
            pmiNo : pmiNo,
            consul: consul,
            dateFrom : dateFrom,
            dateTo : dateTo
        };
        
        createScreenLoading();
        
        $.ajax({
            type: 'POST',
            url: strURL,
            data: data,
            timeout: 60000,
            success: function (data, textStatus, jqXHR) {
                        $('#SCH_viewSearch').html(data);
                    },
            error: function (jqXHR, textStatus, errorThrown) {
                        bootbox.alert("Oopps! "+errorThrown);
                    },
            complete: function (jqXHR, textStatus ) {
                        destroyScreenLoading();
                }        
                    
        });
        
    });
    
</script>