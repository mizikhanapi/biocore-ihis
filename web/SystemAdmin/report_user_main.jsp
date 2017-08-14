<%-- 
    Document   : report_user_main
    Created on : Aug 4, 2017, 8:23:03 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<h4>User List Report</h4>
<!-- tab content -->
<div class=" form-horizontal" align="center">


    <!-- Select Basic -->
    <div class="form-group"> 
        <label class="col-md-4 control-label" for="textinput">Show list of:</label>
        <div class="col-md-4">
            <select id="USR_searchType" class="form-control" >
                <option selected value="1">Created user within selected time frame</option>

                <option value="2">Number of user by discipline</option>
                
                <option value="3">Number of user by subdiscipline</option>
                
                <option value="4">Number of user by role</option>

            </select>
        </div>
    </div>

    <!-- Text input-->
    
    <div class="form-group searchingDiv" id="USR_div_createdUser" >

        <label class="col-md-4 control-label" for="textinput">From</label>
        <div class="col-md-2">
            <input type="text" id="USR_srcDateFrom" class="form-control input-md Datepicker" placeholder="dd/mm/yyyy" readonly>
        </div>

        <label class="col-md-1 control-label" for="textinput">To</label>
        <div class="col-md-2">
            <input type="text" id="USR_srcDateTo" class="form-control input-md Datepicker" placeholder="dd/mm/yyyy"  readonly>
        </div>

    </div>
    
    <div class="text-center">
        <button class="btn btn-primary" type="button" id="USR_btnSearch" ><i class="fa fa-search"></i>&nbsp; Search</button>

        <!--<button id="clearSearch" name="clearSearch" type="button" class="btn btn-default"><i class="fa fa-times"></i>&nbsp; Clear</button>-->
    </div>


    <div id="USR_viewSearch" class="table-guling">
    </div>

</div>


<script type="text/javascript">
    
    //set up date picker
    $('#USR_srcDateFrom').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'dd/mm/yy',
        yearRange: '1990:+0',
        maxDate: '+0d'
    });
    
    //--- initialise datepicker for to after changes on from ------------
    $('#USR_srcDateFrom').on('change', function(){
        
        $("#USR_srcDateTo" ).datepicker( "destroy" );
        $('#USR_srcDateTo').val('');
        var fromDate = $( "#USR_srcDateFrom" ).datepicker( "getDate" );
        
        $('#USR_srcDateTo').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            yearRange: '1990:+0',
            minDate: fromDate,
            maxDate: '+0d'
        });
    });
   
    
    //... hide and hide div on search for change
    $('#USR_searchType').on('change', function(){
        $('.searchingDiv').hide();
        var type = $(this).val();
        
        if(type==="1")
            $('#USR_div_createdUser').show();
        
        
    });
    
//    $('#USR_btnSearch').on('click', function(){
//        createScreenLoading();
//        $('#USRTable').load("report_control/getUserList.jsp");
//    });
    
    //... search for result on btn click
    $('#USR_btnSearch').on('click', function(){
        var strURL = "report_control/getUserList.jsp";
        
        var type = $('#USR_searchType').val();
        
        var dateFrom = $('#USR_srcDateFrom').val();
        var dateTo = $('#USR_srcDateTo').val();
        
        if(type==="1"){
            if(dateFrom==="" || dateTo===""){
                bootbox.alert("Please pick the dates!");
                return false;
            }
        }
        else if(type==="2")
            strURL="report_control/getUserListByDisc.jsp";
        else if(type==="3")
            strURL="report_control/getUserListBySubdisc.jsp";
        else if(type==="4")
            strURL="report_control/getUserListByRole.jsp";
        
       
       
        
        
        var data ={
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
                        $('#USRTable').html(data);
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
